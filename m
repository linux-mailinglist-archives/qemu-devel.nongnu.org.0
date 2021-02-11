Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4893189D6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:54:33 +0100 (CET)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAYK-0006Tr-D5
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1lAAXF-0005bS-8W
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:53:25 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:59029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.brenken@efs-auto.org>)
 id 1lAAXD-0005rD-3q
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:53:25 -0500
Received: from localhost.localdomain ([178.239.76.114]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MSss2-1lKiON3kBa-00UKWm; Thu, 11 Feb 2021 12:53:13 +0100
From: David Brenken <david.brenken@efs-auto.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] tricore: fixed faulty conditions for extr and imask
Date: Thu, 11 Feb 2021 12:53:29 +0100
Message-Id: <20210211115329.8984-2-david.brenken@efs-auto.org>
X-Mailer: git-send-email 2.16.1.windows.4
In-Reply-To: <20210211115329.8984-1-david.brenken@efs-auto.org>
References: <20210211115329.8984-1-david.brenken@efs-auto.org>
X-Provags-ID: V03:K1:64vFOhJ5JpCrdweHW4M0bP3IMi+AI+yajQCmWifOVGEz5mq8Kbi
 x4B+rXpQ+m5GVcH7Y6X3A6FRRdlz8bO5Km2Kdg0/p2WWPWQ07QGa26X3wZq0HxVBgvKHr1X
 /SpGZ4SwrdY4hTsHXmcOXc310X4+NXIi9o1IQLtEJ1OGTUMZb4vOsoSAyJGgOzOkS82T5jZ
 vwUZ6Od3PR1ZXMUdg/FDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RYcoZPpxRHQ=:cDorPKch7yoCnna1Pk0hIO
 Atgk3lssjnsMcNmh+ODXfXlZDXNSE6k07lHr4+cDrgstpKrhQ5zqz0wzW7jBtRs37jDjNRhEH
 rj4kASmB9t80tv+ZiwIFUImb2Evh70XI+H8sVTxa7u/8qrjHzajBnorVjV31fSgqeJAH5SBLX
 b4YtYwS6vYqBaaGhr7TDFDR8o0Ah9Batt/LdjiYzc3M1rhZXgfAfekdn2IPee6KIWzKNZjJ8p
 cwlVWS/o5iMclxU0dU5SiISQNWsyOVROht8B795rTbkIHz9jAR9KK3CN+2W1O4bck7dp2ulUN
 LWph2oiQdhd5jBtPWyNelRPpxroNdbtd6LLPjEz1Gbk9Kvur8RWINWtZ0Pdgf1SQJNNIiIRAt
 R3PzU7i0/XkFrHwlZF9Ln/lZzXO1FXyI33b4d/bcmJwaCM8J+6AgTPBbn/RzTc5sOwVBNlXkN
 zuBawOSDNg==
Received-SPF: none client-ip=212.227.126.134;
 envelope-from=david.brenken@efs-auto.org; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
Signed-off-by: David Brenken <david.brenken@efs-auto.de>
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
2.30.0


