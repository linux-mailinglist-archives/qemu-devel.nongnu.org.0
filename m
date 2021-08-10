Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69A3E8672
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 01:26:39 +0200 (CEST)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDb8n-00034Z-Kg
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 19:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDb7s-0002MZ-Vy
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 19:25:41 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDb7r-0003FT-2j
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 19:25:40 -0400
Received: by mail-pj1-x1034.google.com with SMTP id oa17so539403pjb.1
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 16:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=15BEYQtN4UapNvyhLKq3oMt2WjEqo8HuDY5tg+xCuXM=;
 b=YkAk3d00crX1KFv1IkXtUXY3wMRX1bPage9IEk9zTrIkWZvICOjC3xP/Za/AxvlGxf
 80IOsHgdmgzTWZasSitMmd5GfU3+jMH4wV/81FB8/Qej24AOilUvDQStk7mTHNC1SfX0
 42KIWd7w3q36uHoyhGOfIyszzLmZ/OXTAN4EPlN9+ulLT8EGG1cdJrAL4gnplyDuvN7T
 Z+MHKDS6k2RTxBzjdHC4VIV7CMJtc2zPcLgxRAet5fkS2ScUXC+2IyQ/zgihQbq+Mwqo
 0xoHV7CBNI60RBf+DyeJS9C7N82IvsdGwyIdBHGbfmKqI/VLc4ZopMLvbsIfeFBlRT15
 4mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=15BEYQtN4UapNvyhLKq3oMt2WjEqo8HuDY5tg+xCuXM=;
 b=FbT8Wq9FdhhC0xbGwpTzE+Pt+YoWS3gbQ+0iRJIwc0Asv6sVSN16QZ69bkynDxzCVK
 mzioRSoKsnlZ9PaQSeHWszisd4NxE7DShwNWQIYcU78YWcF2wUh/b+7FQkikkck9h8qo
 fyWbxx/4t8ldNCN2mjpoAe0YVyWev6a8Ruf3Jtd51vUltEtUGEnPhWjmY0MMjjFUTWfL
 /UF9i4i2kRY4nMxwGWzD5y5QXwcoHqJJhoe4NzSDiIJPZLK1dMQededxmVaZYdO1jmB6
 nwDs52yUP6IOlG/mTVGMunMf47uFqaGnmg/p8Fu9z72z8zjADTA4y6IUqAHPkflvkAGq
 O11g==
X-Gm-Message-State: AOAM530yCZi5Nm3vNj/EOG7Pzn3MlLKbeeVbJiunVefUctfAysJcRkWU
 D5jGG+c37n7XjmpavDAghIoljH8IAsKA2w==
X-Google-Smtp-Source: ABdhPJzpWgA3xv3PfrHAoQntrvJUFu24jJ0tAvWRqwBSYckD30fb9mfOiiAFwB9Cf2neqLceiRGLlw==
X-Received: by 2002:a17:90b:38ca:: with SMTP id
 nn10mr34017269pjb.3.1628637937305; 
 Tue, 10 Aug 2021 16:25:37 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id d134sm25558205pfd.60.2021.08.10.16.25.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 16:25:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1] tcg/i386: Split P_VEXW from P_REXW
Date: Tue, 10 Aug 2021 13:25:30 -1000
Message-Id: <20210810232530.1033519-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to be able to represent VEX.W on a 32-bit host, where REX.W
will always be zero.  Fixes the encoding for VPSLLVQ and VPSRLVQ.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/385
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 98d924b91a..997510109d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -241,8 +241,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define P_EXT		0x100		/* 0x0f opcode prefix */
 #define P_EXT38         0x200           /* 0x0f 0x38 opcode prefix */
 #define P_DATA16        0x400           /* 0x66 opcode prefix */
+#define P_VEXW          0x1000          /* Set VEX.W = 1 */
 #if TCG_TARGET_REG_BITS == 64
-# define P_REXW         0x1000          /* Set REX.W = 1 */
+# define P_REXW         P_VEXW          /* Set REX.W = 1; match VEXW */
 # define P_REXB_R       0x2000          /* REG field as byte register */
 # define P_REXB_RM      0x4000          /* R/M field as byte register */
 # define P_GS           0x8000          /* gs segment override */
@@ -410,13 +411,13 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPBROADCASTW (0x79 | P_EXT38 | P_DATA16)
 #define OPC_VPBROADCASTD (0x58 | P_EXT38 | P_DATA16)
 #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
-#define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_REXW)
+#define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
 #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
 #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
-#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_REXW)
+#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
 #define OPC_VPSRAVD     (0x46 | P_EXT38 | P_DATA16)
 #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
-#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_REXW)
+#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
 
@@ -576,7 +577,7 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
 
     /* Use the two byte form if possible, which cannot encode
        VEX.W, VEX.B, VEX.X, or an m-mmmm field other than P_EXT.  */
-    if ((opc & (P_EXT | P_EXT38 | P_EXT3A | P_REXW)) == P_EXT
+    if ((opc & (P_EXT | P_EXT38 | P_EXT3A | P_VEXW)) == P_EXT
         && ((rm | index) & 8) == 0) {
         /* Two byte VEX prefix.  */
         tcg_out8(s, 0xc5);
@@ -601,7 +602,7 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
         tmp |= (rm & 8 ? 0 : 0x20);            /* VEX.B */
         tcg_out8(s, tmp);
 
-        tmp = (opc & P_REXW ? 0x80 : 0);       /* VEX.W */
+        tmp = (opc & P_VEXW ? 0x80 : 0);       /* VEX.W */
     }
 
     tmp |= (opc & P_VEXL ? 0x04 : 0);      /* VEX.L */
-- 
2.25.1


