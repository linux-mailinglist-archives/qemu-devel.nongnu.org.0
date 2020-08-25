Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C425175D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 13:21:36 +0200 (CEST)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAX1D-00067d-3H
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 07:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kAWwY-00075p-Vv; Tue, 25 Aug 2020 07:16:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kAWwV-00054j-Mf; Tue, 25 Aug 2020 07:16:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BbRJj5xvFz9sTn; Tue, 25 Aug 2020 21:16:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1598354197;
 bh=YhTpF2S5cA8sgSuuYTIKOFn5DFo7TadLfI5D6Np14L4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NcCvC9DRG7A3dX88AvKNR1AzZes3kVCr887RNLWf1svrSUnMJsScd0n2EyzQarlEi
 tqShV2H3tF3Vf1+o00WtgRYIOVyiCIgw1Ja0MsodiaGQQ9Y5GOM9d9PtpVFuEr2/e9
 KYYp5FyerkFxm/Cqfr3f2Wr3xBullsJDmRrBjGEM=
From: David Gibson <david@gibson.dropbear.id.au>
To: ehabkost@redhat.com
Subject: [PATCH 2/3] ppc/pnv: Fix TypeInfo of PnvLpcController abstract class
Date: Tue, 25 Aug 2020 21:16:26 +1000
Message-Id: <20200825111627.2007820-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825111627.2007820-1-david@gibson.dropbear.id.au>
References: <20200825111627.2007820-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

It was missing the instance_size field.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200822083920.2668930-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_lpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index b5ffa48dac..23f1e09492 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -646,7 +646,6 @@ static void pnv_lpc_power8_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_lpc_power8_info = {
     .name          = TYPE_PNV8_LPC,
     .parent        = TYPE_PNV_LPC,
-    .instance_size = sizeof(PnvLpcController),
     .class_init    = pnv_lpc_power8_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_PNV_XSCOM_INTERFACE },
@@ -687,7 +686,6 @@ static void pnv_lpc_power9_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_lpc_power9_info = {
     .name          = TYPE_PNV9_LPC,
     .parent        = TYPE_PNV_LPC,
-    .instance_size = sizeof(PnvLpcController),
     .class_init    = pnv_lpc_power9_class_init,
 };
 
@@ -768,6 +766,7 @@ static void pnv_lpc_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_lpc_info = {
     .name          = TYPE_PNV_LPC,
     .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(PnvLpcController),
     .class_init    = pnv_lpc_class_init,
     .class_size    = sizeof(PnvLpcClass),
     .abstract      = true,
-- 
2.26.2


