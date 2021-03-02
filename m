Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28F32A929
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:19:33 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9cK-000135-Dp
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HW-0002xU-MY
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:02 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HU-0007b9-UR
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:02 -0500
Received: by mail-pg1-x532.google.com with SMTP id l2so14375665pgb.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RiZhAqk94IR59YM6JHo6AIRSs7mF45dtttOIiGxjJYA=;
 b=qxEhmFbrt0nEyAU7yz9m4v7TbFuLtFbIww1jwBtR8M2QFhKcbRoKT9IDKnQOHKNoqI
 /xSReAZDdqomKe7JlNAjPc4/kSlfrYVke/R/w0pi+nU7VVlXDH1qrzaQ3wRrGCUB+GA9
 r8yzJ8AGqWyufUnWDoa7tS/iMFYhg86Xruqm9vp+bmJQVyKik40yIkMeQ8LtjK5wRarP
 4nPuUZalj8BeCsNwgtKYep96zUMvNgGDZ32OznA5PschdTPpzbqkTM6NDW2c9ve17LLg
 /3D1L3K4n4scTTs36u6oOzJDPk6PDWyD+eDZt76lERtxVBD+g2zCw1rCCkb7OGw+/yzz
 QvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiZhAqk94IR59YM6JHo6AIRSs7mF45dtttOIiGxjJYA=;
 b=tEwKB98EFzEhRo2QIpMPuLiIMoywUBxbYIA5949sJaEnYK5M09pKK//0CQSQGXNp/d
 31HoA3asLII+YsMek/+iAnT/D+gBf0K7nD7COkSfLM7YQDa5AHX9v0AuoJ5daGs7JJir
 JTc92KDmOHw5axEFmxd5YKaetjxzIZaiKDDXKWABA+zrjqt9rrfRbGMKOxPO7a3B7It2
 hqvaAS3t+8WTrLjhKE8VX7CVFY/cHMqCpJ1HCsWGOyrfshe8FwTG0TA93PciTjVo64uP
 yhWPlXVY1fZoQHFh4Ng8cA9vG49X13nu7JHUSvWsyCLtrbB3eeTepA3pwlE6/plS3iyZ
 eBqg==
X-Gm-Message-State: AOAM530yi00HfvXN8sgBZmcnSj671Vni+uo957P5UoJ0exenx/wj/vEA
 8uVKrWct+nr9T5v2Td9RvK835i7WhYrJLA==
X-Google-Smtp-Source: ABdhPJx8jPYChfPX22unVyWqOJGYNCvMhqWXRBirArn7PjYVv7BFh8++CAnjOLxMRVhK0emUsqVC7Q==
X-Received: by 2002:a05:6a00:2345:b029:1ee:481d:4179 with SMTP id
 j5-20020a056a002345b02901ee481d4179mr4272186pfj.42.1614707879589; 
 Tue, 02 Mar 2021 09:57:59 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/27] tcg/tci: Remove tci_read_r16s
Date: Tue,  2 Mar 2021 09:57:29 -0800
Message-Id: <20210302175741.1079851-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext16s opcodes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2440da1746..8b91e6efc3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
-static int16_t tci_read_reg16s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int16_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_REG_BITS == 64
 static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -152,17 +145,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
-/* Read indexed register (16 bit signed) from bytecode. */
-static int16_t tci_read_r16s(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    int16_t value = tci_read_reg16s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-#endif
-
 /* Read indexed register (32 bit) from bytecode. */
 static uint32_t tci_read_r32(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -671,8 +653,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16s_i32
         case INDEX_op_ext16s_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32
@@ -886,8 +868,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16s_i64
         case INDEX_op_ext16s_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i64
-- 
2.25.1


