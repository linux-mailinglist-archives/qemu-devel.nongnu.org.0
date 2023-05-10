Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157666FDAC8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:31:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgAU-000305-ET; Wed, 10 May 2023 05:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pwgAR-0002zg-ED
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:31:27 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pwgAL-0004S3-1y
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:31:26 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 373B047F69;
 Wed, 10 May 2023 11:31:17 +0200 (CEST)
Message-ID: <13090490-af78-042d-dd3e-ca9a45d20bdf@proxmox.com>
Date: Wed, 10 May 2023 11:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
Subject: Question about issue #1576: Migration from v8.0.0-rc2 to v7.2.0 with
 pcie-root-port device fails
Cc: "quintela@redhat.com" <quintela@redhat.com>, Peter Xu
 <peterx@redhat.com>, leobras@redhat.com, Jonathan.Cameron@huawei.com,
 dave.jiang@intel.com, fan.ni@samsung.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
I'm trying to fix issue #1576 [0], but having a bit of a hard time.

The issue was introduced by commit 010746ae1d ("hw/pci/aer: Implement
PCI_ERR_UNCOR_MASK register") and the migration error is:
> qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0

Since there is no dedicated subsection for the new register, but it's
just part of the existing buffer sent along with the device, the
approach described in docs/devel/migration.rst, "Connecting subsections
to properties" doesn't seem to work here.

AFAIU, it would be necessary to unset the new register in the buffer
before sending for older machine types (before the patch, its value was
0). Then older QEMU versions should accept the migration stream again.
Migration between >8.0 and >= 8.0 when using an older machine type would
be softly broken, because the register value is reset to 0, but not be a
hard error, because it's the same situation as forward migration from
7.2 (the error condition in get_pci_config_device() doesn't trigger,
because versions with commit 010746ae1d set the wmask for the new
register during device initialization).

Is there a good way to unset the register conditionally based on machine
type during save? Is there any fix for a similar issue in the past I can
look at?

Or will this be a WONTFIX, because it's just backwards migration and
QEMU 8.0 has already been released?

[0]: https://gitlab.com/qemu-project/qemu/-/issues/1576

Best Regards,
Fiona


