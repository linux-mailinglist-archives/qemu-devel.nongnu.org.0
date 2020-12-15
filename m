Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82F2DB36F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:16:15 +0100 (CET)
Received: from localhost ([::1]:54352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEru-0006Ty-Oh
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXS-0003FL-SW
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXJ-0001V1-SX
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNFikfxQoIJic238iMyL9wd8BQoibWfmcT27dXe60Z4=;
 b=E2jo9W9vTUxozhjS9mbUvoHrPJqRyuQh3DwNVid+cli/RoCbCW3gKUs9N8E3upzSnBEmyz
 BKj7IPW1ausC2ZY1+QoXBQyyPy0SE/muvz2ksJHSsuLC5v00x8ovDCWDagw4WC6T8mBzGD
 qZFp1xCEn82kb6VpOptlf5obavp5+Bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-YFBnLCGJPmurvPObUca0ag-1; Tue, 15 Dec 2020 12:54:54 -0500
X-MC-Unique: YFBnLCGJPmurvPObUca0ag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACF99107ACE6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 722D5100238C
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/45] msix: assert that accesses are within bounds
Date: Tue, 15 Dec 2020 12:54:18 -0500
Message-Id: <20201215175445.1272776-19-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes the testcase from the next patch fail.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci/msix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 67e34f34d6..36491ee52b 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -179,6 +179,7 @@ static uint64_t msix_table_mmio_read(void *opaque, hwaddr addr,
 {
     PCIDevice *dev = opaque;
 
+    assert(addr + size <= dev->msix_entries_nr * PCI_MSIX_ENTRY_SIZE);
     return pci_get_long(dev->msix_table + addr);
 }
 
@@ -189,6 +190,8 @@ static void msix_table_mmio_write(void *opaque, hwaddr addr,
     int vector = addr / PCI_MSIX_ENTRY_SIZE;
     bool was_masked;
 
+    assert(addr + size <= dev->msix_entries_nr * PCI_MSIX_ENTRY_SIZE);
+
     was_masked = msix_is_masked(dev, vector);
     pci_set_long(dev->msix_table + addr, val);
     msix_handle_mask_update(dev, vector, was_masked);
-- 
2.26.2



