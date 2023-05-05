Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39556F7A53
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrg-0008D1-W1; Thu, 04 May 2023 21:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujre-0008C3-9g
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:02 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrc-0006vu-9G
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:01 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1a516fb6523so10658375ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248637; x=1685840637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7kq4l6FRbNL5l8a5fEkXlr9K/vWT8JmBZha0iGGH9o=;
 b=C9XVBtm1WHir4UqSD2FkwOuBKaMcZuYQXl3XUwrnTvmHjJF335KpOtihfJjkQeuODB
 aJSMQaPTomlv38abXgDObDJgzK/H2tNF+hue5gMII7vgtdy98CRND1MRt9m9vIuqjA41
 eEy0eqWcAW1L8Go1HgBbBLEwIZlS1PAFCtcbV1qxiqXfZduZY4CSv5cPeXKxHHd71+ne
 AZtOdN+GKAM5t7TvcpTRYR3OpWOcW555tcnqDkQIFmLf8+tyXJ9Z/ePSSDlJcqQSrWI8
 BucL81NPUd5a9NmHgX9CzPSZRcpZtpYfxemlfI9Tmd10Sszw2ZDus46EIUNWa9ZzYxmf
 l1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248637; x=1685840637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7kq4l6FRbNL5l8a5fEkXlr9K/vWT8JmBZha0iGGH9o=;
 b=EZVDvrbVd8EBPCPEZ0qFMVndFbEUvcsESP1gfjEnt/5k5yQNhv+CMfdizJhUsApq47
 P2nffRJfP6Jd93INCFjqL/QX2MfH3Vcs+HYwKOcbbo14jik/nkmHtTxMDBD5X+pvBa9C
 azGCdM4ywZgyZeuBwXCKeG8r+HYqrzAVK9Cqf+HLekPRq+sKRGlNFus6Zn5XHHpnnj4o
 +d8ON5t+SnszF1EgvGrQajscZUiMhjXXhFyhFUYgLSBKekchh14B99jMav8FxNhqPxVM
 7dkqo78KzMrJRqVtfRKCZcYfSbwNrxCSy2ZBx79Zh2wMh0fx2aJehS6LnVJvoYShqH1P
 gqCQ==
X-Gm-Message-State: AC+VfDy2zmF9kbybazWxUIsQjM987weFqizlqZ+gcWxxYNAxTYph+zXI
 UYpRoJRKoXqzK10FORLwOW6scY++Km+LqQ==
X-Google-Smtp-Source: ACHHUZ5GwJvEP/ORSZhYPqQtIHBdFRoTIfoipticGnyNiEQpkvc58/tpqOEaZA0LdQaMrrHQ5tDULg==
X-Received: by 2002:a17:902:d50b:b0:1a0:57dd:b340 with SMTP id
 b11-20020a170902d50b00b001a057ddb340mr5969137plg.64.1683248637636; 
 Thu, 04 May 2023 18:03:57 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:57 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/89] target/riscv: add support for Zcd extension
Date: Fri,  5 May 2023 11:01:24 +1000
Message-Id: <20230505010241.21812-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

Separate c_fld/c_fsd from fld/fsd to add additional check for
c.fld{sp}/c.fsd{sp} which is useful for zcmp/zcmt to reuse
their encodings.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-5-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode              |  8 ++++----
 target/riscv/insn_trans/trans_rvd.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index f3ea650325..b62664b6af 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -97,12 +97,12 @@
 }
 {
   lq              001  ... ... .. ... 00 @cl_q
-  fld             001  ... ... .. ... 00 @cl_d
+  c_fld           001  ... ... .. ... 00 @cl_d
 }
 lw                010  ... ... .. ... 00 @cl_w
 {
   sq              101  ... ... .. ... 00 @cs_q
-  fsd             101  ... ... .. ... 00 @cs_d
+  c_fsd           101  ... ... .. ... 00 @cs_d
 }
 sw                110  ... ... .. ... 00 @cs_w
 
@@ -148,7 +148,7 @@ addw              100 1 11 ... 01 ... 01 @cs_2
 slli              000 .  .....  ..... 10 @c_shift2
 {
   lq              001  ... ... .. ... 10 @c_lqsp
-  fld             001 .  .....  ..... 10 @c_ldsp
+  c_fld           001 .  .....  ..... 10 @c_ldsp
 }
 {
   illegal         010 -  00000  ----- 10 # c.lwsp, RES rd=0
@@ -166,7 +166,7 @@ slli              000 .  .....  ..... 10 @c_shift2
 }
 {
   sq              101  ... ... .. ... 10 @c_sqsp
-  fsd             101   ......  ..... 10 @c_sdsp
+  c_fsd           101   ......  ..... 10 @c_sdsp
 }
 sw                110 .  .....  ..... 10 @c_swsp
 
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 1597bf31d8..2c51e01c40 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -31,6 +31,12 @@
     } \
 } while (0)
 
+#define REQUIRE_ZCD(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zcd) {  \
+        return false;     \
+    } \
+} while (0)
+
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
     TCGv addr;
@@ -59,6 +65,18 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     return true;
 }
 
+static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
+{
+    REQUIRE_ZCD(ctx);
+    return trans_fld(ctx, a);
+}
+
+static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
+{
+    REQUIRE_ZCD(ctx);
+    return trans_fsd(ctx, a);
+}
+
 static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
 {
     REQUIRE_FPU;
-- 
2.40.0


