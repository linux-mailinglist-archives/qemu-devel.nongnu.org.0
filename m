Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6ED41D2EF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:56:56 +0200 (CEST)
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVp3u-0001TK-Qg
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosK-0001Jg-Ru; Thu, 30 Sep 2021 01:44:56 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos5-0003Rh-9e; Thu, 30 Sep 2021 01:44:56 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR0sKLz4xbb; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=Up5/zhMdJSQSEeg7Bizjn3vQDdQND/Tl5zEQxIQhf34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6H4w2kC8uiVTj/HXbgqTGl6oWaV2GwRfVoX5HItO/kZAc9cOJhAHPrAxbx9GANEZ
 6y0KYMNHY8chmd/71c6A0aWcQ7YrssZ5jmT9eLC+DX6OUx3MW4Q7dpUg5kM79Cycl3
 kTLn8k/FKuQrCS64zxlXQvuc5QRPoJhEPrAEyzlw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 09/44] ppc/xive: Export xive_tctx_word2() helper
Date: Thu, 30 Sep 2021 15:43:51 +1000
Message-Id: <20210930054426.357344-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 hpoussin@reactos.org, clg@kaod.org, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210901094153.227671-8-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c        | 5 -----
 include/hw/ppc/xive.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b0c4f76b1d..6c82326ec7 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -141,11 +141,6 @@ void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb)
     xive_tctx_notify(tctx, ring);
 }
 
-static inline uint32_t xive_tctx_word2(uint8_t *ring)
-{
-    return *((uint32_t *) &ring[TM_WORD2]);
-}
-
 /*
  * XIVE Thread Interrupt Management Area (TIMA)
  */
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 29b130eaea..252c58a1d6 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -335,6 +335,11 @@ struct XiveTCTX {
     XivePresenter *xptr;
 };
 
+static inline uint32_t xive_tctx_word2(uint8_t *ring)
+{
+    return *((uint32_t *) &ring[TM_WORD2]);
+}
+
 /*
  * XIVE Router
  */
-- 
2.31.1


