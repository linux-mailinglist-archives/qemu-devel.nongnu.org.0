Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164415A3570
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 09:09:12 +0200 (CEST)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRpwM-0006Py-MP
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 03:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRprK-0004W3-89
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRprH-0006Pi-Bn
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 03:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661583834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5C2hgIV/W0d8XO0rc2nBSZ1MafFmxRMro9CEJu6qIY4=;
 b=QSjAD4lIeCuRnQ2oS6MPapo3yw2QAdFSBI73vM7sYpw4W/a83WAisV497VxOzdAIyQwEcP
 rlmUKB5An0Yx2SA7LVxT76cnHLMXPC7cxqRgwJPzhKCtBPIW1OfyrV8RYAIkyNFEulMlOO
 lS/Wc7meiQN84FtwrW8Xzd8H4LPrQmU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-V0nyg_T7PtypmF0Dk62uNw-1; Sat, 27 Aug 2022 03:03:48 -0400
X-MC-Unique: V0nyg_T7PtypmF0Dk62uNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA5E51C05AAF;
 Sat, 27 Aug 2022 07:03:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A05AC15BB3;
 Sat, 27 Aug 2022 07:03:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Sven Schnelle <svens@stackframe.org>
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH] hw/net/tulip: Fix DMA reentrancy issue with stack overflow
 (CVE-2022-2962)
Date: Sat, 27 Aug 2022 09:03:43 +0200
Message-Id: <20220827070343.85978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The Tulip NIC can be used to trigger an endless recursion when its
descriptors are set up to its own MMIO address space. Fix it by
limiting the DMA accesses to normal memory.

Fixes: CVE-2022-2962
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1171
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/tulip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 097e905bec..b9e42c322a 100644
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
2.31.1


