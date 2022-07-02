Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41244563EBD
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:06:08 +0200 (CEST)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WGd-0005Dg-Ct
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDI-0002pZ-Th
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:41 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDH-0004rF-Ax
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:40 -0400
Received: by mail-pf1-x42d.google.com with SMTP id k9so4302407pfg.5
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 23:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RpjQ/jx+Qxs41kvoM5hWq5FpDDhEEkw+sqWhzkGXZNw=;
 b=RZvsolZ2xaT39Kt80mhV24Coq/u2JTLoMN06SYRgOqikj25NdCspzn/9lp/k4Uwp/A
 1Uk5xHLCU+0HiWseTz+owOQLV3XAnssgK9cryWl2xQLn+Ch08TpcRF8gJiTvHVRaSk6R
 B28STYvfa8ggWj4u/UmdKnlfcvS8scA9Mip1HWBKUeba97cEJPRAl//WVqQCzVIG3K90
 t8bR2+V1zgOfPgJ2cqB1g+B7bz3h3pUCFWlU0A11nXwq1bxYCg/xXJs/PI75oYyZR9V1
 FdBWrs4z6fvIUsqnq52JvArvbSmRz7lGjNu2hyR26OYqDKUiuWwhOqHRF2CBENiTAHUT
 o3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RpjQ/jx+Qxs41kvoM5hWq5FpDDhEEkw+sqWhzkGXZNw=;
 b=IlpKDrJrgcbOxwo7ohuVdFb/PHkhcukzFT5pr3gZPrGOPb3YJycZPvPF1A0PYojC1u
 UufP2i/Ucep9IGd5/rAwIxt5Qidz3qThLywVbPcskUFsPHW0eT0fIHP3L7jmBm0b9E/X
 JKA4bQAxTjIwdmYo8PuIE2ZUwwIPk0pjLH79TQZwd61kanEROQS43Nl+3O8gohLiK8Yz
 m0I2PPJsqEe60osCm31QBBh/lg3ORdeI/4WR+jWN+6so0Kl16iiBr6stt/BBNYsQNlWL
 0JdgptWZg3CN8uGrojUuBnEGF1I1hXgDBeU93FenqFnKla1qPWEzAYN8ZjyFHjJKmU6b
 bFCg==
X-Gm-Message-State: AJIora8pXDAi/T0I63AcWm/1OWNBxS5Nm4/KwW/dTDg28ShofZn65E1/
 yXwrbP4o6kkWu62baAGcaU3fBcijctcdiYnO
X-Google-Smtp-Source: AGRyM1vKgEkZWv7Oo5jCVwZK8bHXLVVwilLQXzxtmgCn+YZLQWHTiMCoU/YGxx35cGb26YZvBLYUkg==
X-Received: by 2002:a63:1952:0:b0:411:90a3:5853 with SMTP id
 18-20020a631952000000b0041190a35853mr13764333pgz.474.1656741757363; 
 Fri, 01 Jul 2022 23:02:37 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a66c200b001ece55b938asm5232178pjl.32.2022.07.01.23.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 23:02:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: svens@linux.ibm.com,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 1/4] target/s390x: Remove DISAS_GOTO_TB
Date: Sat,  2 Jul 2022 11:32:25 +0530
Message-Id: <20220702060228.420454-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702060228.420454-1-richard.henderson@linaro.org>
References: <20220702060228.420454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

There is nothing to distinguish this from DISAS_NORETURN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index fd2433d625..e38ae9ce09 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1123,9 +1123,6 @@ typedef struct {
    exiting the TB.  */
 #define DISAS_PC_UPDATED        DISAS_TARGET_0
 
-/* We have emitted one or more goto_tb.  No fixup required.  */
-#define DISAS_GOTO_TB           DISAS_TARGET_1
-
 /* We have updated the PC and CC values.  */
 #define DISAS_PC_CC_UPDATED     DISAS_TARGET_2
 
@@ -1189,7 +1186,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
         tcg_gen_goto_tb(0);
         tcg_gen_movi_i64(psw_addr, dest);
         tcg_gen_exit_tb(s->base.tb, 0);
-        return DISAS_GOTO_TB;
+        return DISAS_NORETURN;
     } else {
         tcg_gen_movi_i64(psw_addr, dest);
         per_branch(s, false);
@@ -1258,7 +1255,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             tcg_gen_movi_i64(psw_addr, dest);
             tcg_gen_exit_tb(s->base.tb, 1);
 
-            ret = DISAS_GOTO_TB;
+            ret = DISAS_NORETURN;
         } else {
             /* Fallthru can use goto_tb, but taken branch cannot.  */
             /* Store taken branch destination before the brcond.  This
@@ -6634,7 +6631,6 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     switch (dc->base.is_jmp) {
-    case DISAS_GOTO_TB:
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-- 
2.34.1


