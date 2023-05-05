Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FF6F7A48
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujre-0008C0-F5; Thu, 04 May 2023 21:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrc-0008BW-Io
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrY-0006vJ-Vw
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:59 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1aae46e62e9so8418235ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248634; x=1685840634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJhWbDbpcQGhaaiXOe2fwIjhXa0Xx1aUHvNDUSvtTzY=;
 b=BuV+55DPQM5coPPC3fCgqiwtQa3pkf3pd1yu/kGULSVSdajTERmEVL1q4Q91cpH+BC
 y7pfmT+YGs1aILAcd0GAuJHo2eFOU4MNF8eFWp5uaCRh5yJsa7pBUwYJCPMlXM9W6amy
 Fep6uyHqjSVzXPPam1h6Blrf3CBNAL1hJv3rM0DZdb6ily2YXDIiZHMzX4FrkevWd/0h
 bKANEteJEDmCJTNY9fcCQbowkmXe/MmJHrGfHWY6Cp0Bu459ZuLZF1RgmvfabQaET3jA
 qKIH9LHGgzqGZWhU6pQniGavbbRryA7OPGj/n2Ugd8sPXfVgVlrdl0DMp1F+oLvw+jXJ
 CB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248634; x=1685840634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJhWbDbpcQGhaaiXOe2fwIjhXa0Xx1aUHvNDUSvtTzY=;
 b=jfpT7lkHncPFOk8JqODA7V/bw6i8wY93483GG5DSukm7gXzU5YeJjFSdwZeIkfNuEb
 N4IZJBZrMJExcsrTDMu+IjStD+IkXYWev4xB08moqVBFjebNJnZh8bkdZbkUQKKWQONU
 f8Lp91sXV3OZeaG7SkvxTOld83Z5i4oTu49UGtxDN1k0r3WLiXH8k7RiUWZF8oW03/Cl
 L6j3BzxcOhiJ5WDHhFRKodj6EBlq4szEK7dFbW+8SZroWIZAwFj10jjihnwJpFQKNOTI
 noTC0FtEjmK48UnHhIIiFcFyXplhl+FxoSLq23OH9buxu//cmpzoFMaURUBfExjfXLkH
 Sdew==
X-Gm-Message-State: AC+VfDzrQLpTcGz2Ls179J9zXIGCJfgNwN0hkUgSZN0TFiP1HH9lynCJ
 pL/0vTL7zrIMwgagZOWCwtLnJZqVaXoc5w==
X-Google-Smtp-Source: ACHHUZ6sc2/s8xV6tlljITyNdRiHVJS8yLfkuBjU4pDj7s7H/1DrLdvxGM/WvjPIfoPPLpIkZ1hgLA==
X-Received: by 2002:a17:902:8ec5:b0:1a9:b91f:63fc with SMTP id
 x5-20020a1709028ec500b001a9b91f63fcmr5095888plo.12.1683248634335; 
 Thu, 04 May 2023 18:03:54 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:53 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/89] target/riscv: add support for Zcf extension
Date: Fri,  5 May 2023 11:01:23 +1000
Message-Id: <20230505010241.21812-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x631.google.com
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

Separate c_flw/c_fsw from flw/fsw to add check for Zcf extension.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-4-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn16.decode              |  8 ++++----
 target/riscv/insn_trans/trans_rvf.c.inc | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index ccfe59f294..f3ea650325 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -109,11 +109,11 @@ sw                110  ... ... .. ... 00 @cs_w
 # *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
 {
   ld              011  ... ... .. ... 00 @cl_d
-  flw             011  ... ... .. ... 00 @cl_w
+  c_flw           011  ... ... .. ... 00 @cl_w
 }
 {
   sd              111  ... ... .. ... 00 @cs_d
-  fsw             111  ... ... .. ... 00 @cs_w
+  c_fsw           111  ... ... .. ... 00 @cs_w
 }
 
 # *** RV32/64C Standard Extension (Quadrant 1) ***
@@ -174,9 +174,9 @@ sw                110 .  .....  ..... 10 @c_swsp
 {
   c64_illegal     011 -  00000  ----- 10 # c.ldsp, RES rd=0
   ld              011 .  .....  ..... 10 @c_ldsp
-  flw             011 .  .....  ..... 10 @c_lwsp
+  c_flw           011 .  .....  ..... 10 @c_lwsp
 }
 {
   sd              111 .  .....  ..... 10 @c_sdsp
-  fsw             111 .  .....  ..... 10 @c_swsp
+  c_fsw           111 .  .....  ..... 10 @c_swsp
 }
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 052408f45c..9e9fa2087a 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -30,6 +30,12 @@
     } \
 } while (0)
 
+#define REQUIRE_ZCF(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zcf) {              \
+        return false;                          \
+    }                                          \
+} while (0)
+
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
     TCGv_i64 dest;
@@ -61,6 +67,18 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     return true;
 }
 
+static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
+{
+    REQUIRE_ZCF(ctx);
+    return trans_flw(ctx, a);
+}
+
+static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
+{
+    REQUIRE_ZCF(ctx);
+    return trans_fsw(ctx, a);
+}
+
 static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
 {
     REQUIRE_FPU;
-- 
2.40.0


