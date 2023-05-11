Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BA6FEDD7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:28:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1ea-0001rI-Li; Thu, 11 May 2023 04:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1px1eW-0001pw-UX
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:27:56 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1px1eQ-0005iP-BF
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:27:55 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id AF0AF417C6;
 Thu, 11 May 2023 10:27:39 +0200 (CEST)
Message-ID: <7f308149-5495-d415-5e51-1fa15fc20f84@proxmox.com>
Date: Thu, 11 May 2023 10:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
To: Leonardo Bras <leobras@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230503002701.854329-1-leobras@redhat.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20230503002701.854329-1-leobras@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.251,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 03.05.23 um 02:27 schrieb Leonardo Bras:
> Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
> set for machine types < 8.0 will cause migration to fail if the target
> QEMU version is < 8.0.0 :
> 
> qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> qemu-system-x86_64: Failed to load PCIDevice:config
> qemu-system-x86_64: Failed to load e1000e:parent_obj
> qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'
> qemu-system-x86_64: load of migration failed: Invalid argument
> 
> The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2.0,
> with this cmdline:
> 
> ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> 
> In order to fix this, property x-pcie-err-unc-mask was introduced to
> control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
> default, but is disabled if machine type <= 7.2.
> 
> Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Thank you for the patch!

Closes: https://gitlab.com/qemu-project/qemu/-/issues/1576

AFAICT, this breaks (forward) migration from 8.0 to 8.0 + this patch
when using machine type <= 7.2. That is because after this patch, when
using machine type <= 7.2, the wmask for the register is not set and
when 8.0 sends a nonzero value for the register, the error condition in
get_pci_config_device() will trigger again.

Is it necessary to also handle that? Maybe by special casing the error
condition in get_pci_config_device() to be prepared to accept such a
stream from 8.0?

If that is considered not worth it, consider this:

Tested-by: Fiona Ebner <f.ebner@proxmox.com>

Best Regards,
Fiona


