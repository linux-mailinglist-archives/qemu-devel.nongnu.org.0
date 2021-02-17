Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313C931E0BD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:48:22 +0100 (CET)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTkD-0007dM-4E
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLD-0007j5-1f
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:31 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLB-0007FD-Da
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:30 -0500
Received: by mail-pl1-x634.google.com with SMTP id z7so8039951plk.7
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tPaxTbuiDkAE4NCvOvCez8qzkP8DbZsP3e+2STkMSPw=;
 b=q88ZXsd43CxDO378vAwGMQurT1lI4lCK7/E6wUKbqkoIeNPu26u/DTNmejlS4fukeh
 ZMbZiKuUqQluBto/eBin6v6oJbe1681lUkZAIOaYJmjYTsxmMHaglBn6hKpu7+W9YJ5s
 mPQE5Xk4mrISOvMcPP0VSuZEudpVcqUEIK8Myn+cc2Sza4Io15clzJ927/sRbwVx1NtN
 /g3OdsPhi5HuY0qmdRsCmQ8ZjgAAr4S0IEPt2UI0labJ+EWrLdBe9vnR2S/df/cXUCfp
 zjtj2m8ZMzARXlFHZ0sL6J2JWkwN/9S4UNJIIbV3Vhbia4Nwelr3YNDVBOtXzKXR8Ydn
 5QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tPaxTbuiDkAE4NCvOvCez8qzkP8DbZsP3e+2STkMSPw=;
 b=nQJaO4KSqKXxlTGBASi18O16N7I2C1Nb/nJ9KSROQDhJ4o2ETRhU/QaThM3hUqe4H7
 3vcIUEh+bbjo4BAQrl+9NWg1sMSL+yyXTP9IkGiNTWNSSWzvFZmd7ym7SPDLJIkUDJg7
 swR/3CkwC0+qQkFv+cqlyvRtl1Z1WiH7+ZQ669uI6zPHBtzfjHI6CjFaQDD4rIQg+Vgs
 oIY1XIjo6s4eeHaIBzDpkMGWv2GlCTVKbapp65+UeZU7F2WWOQbh7nbIOAu63b1vFBuc
 IBwY0/IdYkYTSg7IYG/G33xGIImT2YuK7KDlvp/Z9FhApHLHOWOSvLVSCbBlc60SLdpM
 75DA==
X-Gm-Message-State: AOAM532nICWkc7jWDv0EmIpSvrI1LOKOFq+PjLXjqgFzGaHzgRgG878m
 PH/QaHP81FVI03t5ClljnXrFrKENpFLvZQ==
X-Google-Smtp-Source: ABdhPJxb4PFk3HCiryJnyZCt0iPoo+K47Il1vq19OAzg+uTnan9gbgt03+PcbfylJmcuufNEqE+jRA==
X-Received: by 2002:a17:90a:19d0:: with SMTP id
 16mr521299pjj.121.1613593348167; 
 Wed, 17 Feb 2021 12:22:28 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/71] tcg/tci: Merge extension operations
Date: Wed, 17 Feb 2021 12:19:38 -0800
Message-Id: <20210217202036.1724901-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes ext8s, ext8u, ext16s, ext16u.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 44 ++++++++------------------------------------
 1 file changed, 8 insertions(+), 36 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index d0bf810781..73f639d23a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -607,29 +607,29 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, (uint32_t)t2 * tmp64);
             break;
 #endif /* TCG_TARGET_REG_BITS == 32 */
-#if TCG_TARGET_HAS_ext8s_i32
-        case INDEX_op_ext8s_i32:
+#if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
+        CASE_32_64(ext8s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16s_i32
-        case INDEX_op_ext16s_i32:
+#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
+        CASE_32_64(ext16s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext8u_i32
-        case INDEX_op_ext8u_i32:
+#if TCG_TARGET_HAS_ext8u_i32 || TCG_TARGET_HAS_ext8u_i64
+        CASE_32_64(ext8u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_ext16u_i32
-        case INDEX_op_ext16u_i32:
+#if TCG_TARGET_HAS_ext16u_i32 || TCG_TARGET_HAS_ext16u_i64
+        CASE_32_64(ext16u)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint16_t)t1);
@@ -779,34 +779,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 continue;
             }
             break;
-#if TCG_TARGET_HAS_ext8u_i64
-        case INDEX_op_ext8u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext8s_i64
-        case INDEX_op_ext8s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int8_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16s_i64
-        case INDEX_op_ext16s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (int16_t)t1);
-            break;
-#endif
-#if TCG_TARGET_HAS_ext16u_i64
-        case INDEX_op_ext16u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, (uint16_t)t1);
-            break;
-#endif
 #if TCG_TARGET_HAS_ext32s_i64
         case INDEX_op_ext32s_i64:
 #endif
-- 
2.25.1


