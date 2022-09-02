Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AF85AA882
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 09:07:49 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0mK-0005b3-J0
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 03:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0OH-00086X-Nx
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0OF-0004yW-MW
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X5hlA04hUr7878cddYSPka4sAxAinhQT/7udNwXAJrI=;
 b=dg3U0lY5G69/CJmNLY6NBa+PXOrVKGfP/0hpAJWjHGDlrmpBY8hy+AwiUMPWOSR/WQ++U3
 MG8fGofKgOZbOG/SD96o5nPqXm11dZkb1Oze/OS8Qn+DrBuU7N2DxdfvZgifVPlqaVzgwy
 MVOAWt1BJFFghLdofsbb/P8tPXaFT1I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-jGMvYKeeMG2-R3aTx5hMiA-1; Fri, 02 Sep 2022 02:42:48 -0400
X-MC-Unique: jGMvYKeeMG2-R3aTx5hMiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47B9B80A0BC;
 Fri,  2 Sep 2022 06:42:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D02461415137;
 Fri,  2 Sep 2022 06:42:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Zheyu Ma <zheyuma97@gmail.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 21/21] net: tulip: Restrict DMA engine to memories
Date: Fri,  2 Sep 2022 14:41:38 +0800
Message-Id: <20220902064138.56468-22-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zheyu Ma <zheyuma97@gmail.com>

The DMA engine is started by I/O access and then itself accesses the
I/O registers, triggering a reentrancy bug.

The following log can reveal it:
==5637==ERROR: AddressSanitizer: stack-overflow
    #0 0x5595435f6078 in tulip_xmit_list_update qemu/hw/net/tulip.c:673
    #1 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
    #2 0x559544637f86 in memory_region_write_accessor qemu/softmmu/memory.c:492:5
    #3 0x5595446379fa in access_with_adjusted_size qemu/softmmu/memory.c:554:18
    #4 0x5595446372fa in memory_region_dispatch_write qemu/softmmu/memory.c
    #5 0x55954468b74c in flatview_write_continue qemu/softmmu/physmem.c:2825:23
    #6 0x559544683662 in flatview_write qemu/softmmu/physmem.c:2867:12
    #7 0x5595446833f3 in address_space_write qemu/softmmu/physmem.c:2963:18
    #8 0x5595435fb082 in dma_memory_rw_relaxed qemu/include/sysemu/dma.h:87:12
    #9 0x5595435fb082 in dma_memory_rw qemu/include/sysemu/dma.h:130:12
    #10 0x5595435fb082 in dma_memory_write qemu/include/sysemu/dma.h:171:12
    #11 0x5595435fb082 in stl_le_dma qemu/include/sysemu/dma.h:272:1
    #12 0x5595435fb082 in stl_le_pci_dma qemu/include/hw/pci/pci.h:910:1
    #13 0x5595435fb082 in tulip_desc_write qemu/hw/net/tulip.c:101:9
    #14 0x5595435f7e3d in tulip_xmit_list_update qemu/hw/net/tulip.c:706:9
    #15 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13

Fix this bug by restricting the DMA engine to memories regions.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/tulip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 097e905..b9e42c3 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip = {
 static void tulip_desc_read(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    const MemTxAttrs attrs = { .memory = true };
 
     if (s->csr[0] & CSR0_DBO) {
         ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
@@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
 static void tulip_desc_write(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    const MemTxAttrs attrs = { .memory = true };
 
     if (s->csr[0] & CSR0_DBO) {
         stl_be_pci_dma(&s->dev, p, desc->status, attrs);
-- 
2.7.4


