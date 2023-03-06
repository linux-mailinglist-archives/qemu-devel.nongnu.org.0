Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100BC6AB3FC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYz14-0002Cb-9O; Sun, 05 Mar 2023 19:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0q-0001NC-Ic
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:38 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0m-000842-H2
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:34 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so7373434pja.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H79LDg1p08zCDHJg2jv2c/T2eZemNiM3jPV5AVHZNeU=;
 b=TZAMZcvgCIB6pnFbgzEEbAQ+6B8hKzm2vqeyh9v/lVkslXO95IbrMAUYPofAu4xAz+
 uzG+DLDfw3lbMcrVxEGeA7hEMDQJygfq9RQD/btt5b784jVl6S8aM1pmjdCq9DXAWeDD
 UJSwO26yEbxIRnetU2XY7JgWtXOZA0OmGAMCUIXc6kgIXhBXENXzA0F0SDc1D+o5f6p4
 J2vRmki0n4IBGIlBK0WtpGs6/vB2Jg0F/xU9M/vLJpFsLgMpAMKisy4eh6JhNHu72Jhu
 wH6drwcij/SESAIkgE4h/WofMZyAUyicysXNJ6WLIlYUf4SAPOagCvkSEbxZ40/KWx5z
 619w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H79LDg1p08zCDHJg2jv2c/T2eZemNiM3jPV5AVHZNeU=;
 b=ehyuOYgFHb7Rdqdj5a0A5+iA3rJjj3cu71zxKY2ops81CET+GQUpMdGtB8ysimFc2E
 88cifLgLWQB04eo2zLb4Dt38YonVaeK02HU/R0C8x5ZXmeNs14jWyOaNLPRz/YD7XPs3
 C0sdCBelviX/tdenbX1R+RvumnRjzFfQoWTc+q8UUV3Sq0Sy7kgnigFOv91MMgs0A7SC
 urR/JRkkYGiDSrIYQejsA/fhS1u3Ly5gJRkQuNZJVflSmzoQs/VvrRvVxQDE84F8AqzY
 l/Y92yI9dnh0D6PlpFjQ4ZPlOF3fUJ6efjYt50UBJTVIAGud8Yhh37YhmA8n7t2CU7Ny
 rouA==
X-Gm-Message-State: AO0yUKX29GEghzM1csLbW25m8JpdtB4p6/4wtmiETfGQ7fMx6PkCLvbd
 8RwgI+dbZNEs6oHvbpAMx7u6rc9DmqIhsl1Z9VNt4w==
X-Google-Smtp-Source: AK7set9T8CGG3Vgr8D5rVSpvISmzWA37m7WI1xMROmXALyE985MZ5T9A2IVo90fYrzU836rseclSZA==
X-Received: by 2002:a17:90a:1a1c:b0:236:6c7f:3223 with SMTP id
 28-20020a17090a1a1c00b002366c7f3223mr10000678pjk.10.1678063650965; 
 Sun, 05 Mar 2023 16:47:30 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 mv15-20020a17090b198f00b0023087e8adf8sm4971492pjb.21.2023.03.05.16.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:47:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 84/84] target/xtensa: Avoid tcg_const_i32
Date: Sun,  5 Mar 2023 16:39:54 -0800
Message-Id: <20230306003954.1866998-85-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All remaining uses are strictly read-only.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index f906ba7ed5..0cf3075649 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1361,7 +1361,7 @@ static void translate_all(DisasContext *dc, const OpcodeArg arg[],
                           const uint32_t par[])
 {
     uint32_t shift = par[1];
-    TCGv_i32 mask = tcg_const_i32(((1 << shift) - 1) << arg[1].imm);
+    TCGv_i32 mask = tcg_constant_i32(((1 << shift) - 1) << arg[1].imm);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_and_i32(tmp, arg[1].in, mask);
@@ -1489,7 +1489,7 @@ static void translate_call0(DisasContext *dc, const OpcodeArg arg[],
 static void translate_callw(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_const_i32(arg[0].imm);
+    TCGv_i32 tmp = tcg_constant_i32(arg[0].imm);
     gen_callw_slot(dc, par[0], tmp, adjust_jump_slot(dc, arg[0].imm, 0));
 }
 
@@ -1537,7 +1537,7 @@ static void translate_clrex(DisasContext *dc, const OpcodeArg arg[],
 static void translate_const16(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 c = tcg_const_i32(arg[1].imm);
+    TCGv_i32 c = tcg_constant_i32(arg[1].imm);
 
     tcg_gen_deposit_i32(arg[0].out, c, arg[0].in, 16, 16);
 }
-- 
2.34.1


