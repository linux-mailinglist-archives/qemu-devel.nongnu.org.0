Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CAD3F955F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:49:49 +0200 (CEST)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWcW-000774-Ab
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0S-0001Rh-1Q; Fri, 27 Aug 2021 03:10:28 -0400
Received: from ozlabs.org ([203.11.71.1]:40019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0Q-0007Vw-Au; Fri, 27 Aug 2021 03:10:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ60Csz9sXk; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=VNhnQvDV9fzB32EkfI9Q2C9+aXXWxo58SYEs8WdWAjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgHhmspvVIUILH4s3NNaeAVUKLbZBC8XYAGnytMzp1YaZiR0sGNydeBQO7c87Bqbx
 dSqGEwW16Fi3yT6La4kpzuYQp94MONfladHgY52GXm2B4PZb7g2BDINqtDYDftXZpb
 hHQBggDbyG+MIcRGJsbvHXGBZhbh7t9JBeg2gBpU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 14/18] ppc/xive: Export xive_presenter_notify()
Date: Fri, 27 Aug 2021 17:09:42 +1000
Message-Id: <20210827070946.219970-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

It's generic enough to be used from the XIVE2 router and avoid more
duplication.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809134547.689560-9-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c        | 8 ++++----
 include/hw/ppc/xive.h | 4 ++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 5ec61ec14e..b817ee8e37 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1514,10 +1514,10 @@ int xive_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
  *
  * The parameters represent what is sent on the PowerBus
  */
-static bool xive_presenter_notify(XiveFabric *xfb, uint8_t format,
-                                  uint8_t nvt_blk, uint32_t nvt_idx,
-                                  bool cam_ignore, uint8_t priority,
-                                  uint32_t logic_serv)
+bool xive_presenter_notify(XiveFabric *xfb, uint8_t format,
+                           uint8_t nvt_blk, uint32_t nvt_idx,
+                           bool cam_ignore, uint8_t priority,
+                           uint32_t logic_serv)
 {
     XiveFabricClass *xfc = XIVE_FABRIC_GET_CLASS(xfb);
     XiveTCTXMatch match = { .tctx = NULL, .ring = 0 };
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 7e25c25bfd..db76411654 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -408,6 +408,10 @@ int xive_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
                               uint8_t format,
                               uint8_t nvt_blk, uint32_t nvt_idx,
                               bool cam_ignore, uint32_t logic_serv);
+bool xive_presenter_notify(XiveFabric *xfb, uint8_t format,
+                           uint8_t nvt_blk, uint32_t nvt_idx,
+                           bool cam_ignore, uint8_t priority,
+                           uint32_t logic_serv);
 
 /*
  * XIVE Fabric (Interface between Interrupt Controller and Machine)
-- 
2.31.1


