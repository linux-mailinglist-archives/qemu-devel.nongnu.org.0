Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B70230EA3C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:34:36 +0100 (CET)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UTb-0001wx-H4
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjR-0005be-10
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:53 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjP-00043J-Ei
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:52 -0500
Received: by mail-pg1-x533.google.com with SMTP id o7so1053830pgl.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLwOsyO0LIePZbanFLMg77EMdmZd3QPy/SBwJ8JDkus=;
 b=l9WN+zATzNqEXOczx5DUp3oVFvdvWDLnJi276EF1NJO2nJmCpj5wsybeSFLv3r31hD
 9MJBobsz9Hk1c71/tZHqXwHpM6hESMQkk33MWtOfMj6M15T0fl+TzQfnGMY9P9JbK5D+
 1v3GYzIM6YB19lfotDykflEnNyPToqK1x/F8y3G7Pp/fXvzPWGrTwPIGjI7aPmWrphPY
 VO0uMlNuUte91xhNiXFtCZsz1Y3Xy+pEMevjEca2e91lyfVNtoS/TOdtHLwr7ayhBjgc
 TytFi+ul2p4kZlo5NTnL50733l+tsjX5uJLqH8oXC1uRyQbHjJDNemAOJqSLiGAVBT2z
 xNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLwOsyO0LIePZbanFLMg77EMdmZd3QPy/SBwJ8JDkus=;
 b=VCkXe38gO/O5DiO6CJGnqVH2zdsrxPklkZm7iC4MQKQHTbxUF77pz9Q9N7CfknZAq0
 ZXzDuw3NH6rQaaoLcYShaedmJ6IqUn3qPSF351Cb7yD23tuxaXZtLS2eZm/7C2i6tZnZ
 M6StohsIzd7XfVuNZjGoagGliMgfBhl2cPYdvfLyNXlJVNlAgO/TkpZTKur70FL4oAQm
 w8uwvu2WJS1A2tiSxoMvf+TWwQ66twPbkVBOFly3BbtbKNBC2kJX91X22gQ8Onjp+c9k
 WenvP0R6THbKzuOcutvmd8IPL+wb9hLbv+/gkvMGkif0izNAgrzizE9FkYwNjbCgo0lb
 fBMQ==
X-Gm-Message-State: AOAM5331/Ttjf+CF3dAhNH9S+WbfQvkdmbj7+TUWYGhqHWyRKiibYWlw
 TwOK9SkcHA4ezv2UsHi93lzzpdpYK+ECfOXl
X-Google-Smtp-Source: ABdhPJybhrveviLWxXs57AgkWyeBu52FgTwY7r+UBBE7eS7zrPQQy+w0wGfTvCJt9ZWhM7YW2A+0dQ==
X-Received: by 2002:a62:484:0:b029:1b7:878b:c170 with SMTP id
 126-20020a6204840000b02901b7878bc170mr5701593pfe.28.1612403210161; 
 Wed, 03 Feb 2021 17:46:50 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 55/93] tcg/tci: Split out tci_args_rrrr
Date: Wed,  3 Feb 2021 15:44:31 -1000
Message-Id: <20210204014509.882821-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 84d77855ee..cb24295cd9 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -237,6 +237,15 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrr(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+}
+
 static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
 {
@@ -676,11 +685,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             }
             break;
         case INDEX_op_mulu2_i32:
-            t0 = *tb_ptr++;
-            t1 = *tb_ptr++;
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tmp64 = (uint32_t)tci_read_rval(regs, &tb_ptr);
-            tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
+            tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
+            tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


