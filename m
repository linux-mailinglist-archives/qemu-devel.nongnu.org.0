Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41133A524
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 15:02:51 +0100 (CET)
Received: from localhost ([::1]:60306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLRKU-0000vg-Li
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 10:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF5-0003Er-So
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:15 -0400
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19]:45854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF3-00036E-Ue
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+r3W8n+jEsKThlthwd3p6JTyqA9iau1iDI8UQsyjNKI=; b=MyuUMPXFxyWlk/QdZK9oxnOg1Z
 Rv42WG/0TDAXYf3H5jVYGAj+jE2oJtw3i3oLd7ytmqqal6u+OJfxSkefqEH5ya+snULRC8LT1p6eJ
 ZGYB7jnuQscDwiQ8TdOOYqx4lTX+N9BszqGHi9PNbmxPcUtXAfa93XW9OcilGhN5yjsI=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] tricore: fixed faulty conditions for extr and imask
Date: Sun, 14 Mar 2021 14:55:11 +0100
Message-Id: <20210314135513.1369871-6-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
References: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.14.134815, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=31367615, da=103339296,
 mc=571, sc=4, hc=567, sp=0, fso=31367615, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kbastian@mail.uni-paderborn.de, David Brenken <david.brenken@efs-auto.de>,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Konopik <andreas.konopik@efs-auto.de>

According to the TC 1.3.1. Architecture Manual [1; page 174], results are
undefined, if pos + width > 32 and not 31 or if width = 0.

We found this error because of a different behavior between qemu-tricore
and the real tricore processor. For pos + width = 32, qemu-tricore did not
generate any intermediate code and ran into a different state compared to
the real hardware.

[1] https://www.infineon.com/dgdl/tc_v131_instructionset_v138.pdf?fileId=db3a304412b407950112b409b6dd0352

[BK: Add the why to the commit message]
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
Signed-off-by: David Brenken <david.brenken@efs-auto.de>
Message-Id: <20210211115329.8984-2-david.brenken@efs-auto.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 7752630ac1..ebeddf8f4a 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -5777,8 +5777,8 @@ static void decode_rcpw_insert(DisasContext *ctx)
     switch (op2) {
     case OPC2_32_RCPW_IMASK:
         CHECK_REG_PAIR(r2);
-        /* if pos + width > 31 undefined result */
-        if (pos + width <= 31) {
+        /* if pos + width > 32 undefined result */
+        if (pos + width <= 32) {
             tcg_gen_movi_tl(cpu_gpr_d[r2+1], ((1u << width) - 1) << pos);
             tcg_gen_movi_tl(cpu_gpr_d[r2], (const4 << pos));
         }
@@ -6999,7 +6999,7 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
 
     switch (op2) {
     case OPC2_32_RRPW_EXTR:
-        if (pos + width <= 31) {
+        if (pos + width <= 32) {
             /* optimize special cases */
             if ((pos == 0) && (width == 8)) {
                 tcg_gen_ext8s_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
@@ -7021,7 +7021,7 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
         break;
     case OPC2_32_RRPW_IMASK:
         CHECK_REG_PAIR(r3);
-        if (pos + width <= 31) {
+        if (pos + width <= 32) {
             tcg_gen_movi_tl(cpu_gpr_d[r3+1], ((1u << width) - 1) << pos);
             tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], pos);
         }
-- 
2.30.1


