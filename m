Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D846304B95
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 22:34:53 +0100 (CET)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4VzA-0006C0-Bx
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 16:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l4VyK-0005gI-Bw
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:34:00 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:33804
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l4VyI-00030D-Sq
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:34:00 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id A4AD0123390; Tue, 26 Jan 2021 13:33:56 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 7DB91122C5B;
 Tue, 26 Jan 2021 13:33:53 -0800 (PST)
Date: Tue, 26 Jan 2021 13:33:52 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: qemu-devel@nongnu.org
Subject: Handling multiple inheritance [for CXL]
Message-ID: <20210126213013.6v24im4sler3q3am@mail.bwidawsk.net>
X-TUID: +RAw4jFqY05n
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm working on CXL 2.0 type 3 memory devices [1]. In short, these are PCIe devices
that have persistent memory on them. As such, it would be nice to inherit from
both a PCI_DEVICE class as well as an NVDIMM device class.

Truth be told, using TYPE_MEMORY_DEVICE as the interface does provide most of
what I need. I'm wondering what the best way to handle this is. Currently, the
only thing NVDIMM class provides is write/read_label_data, this is driven by
_DSM. For CXL, the mechanism to read/write the equivalent area is not done via
_DSM, but done directly via a mailbox interface. However, the intent is the
same, and so utilizing similar code seems ideal.

If there's a desire to unify these code paths, I'd need something like multiple
inheritance. I'm looking for some feedback here on how to do it.

Thanks.
Ben

[1]: https://lore.kernel.org/qemu-devel/20210105165323.783725-1-ben.widawsky@intel.com/

