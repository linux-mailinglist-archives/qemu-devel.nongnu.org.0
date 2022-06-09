Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385425456BE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:52:11 +0200 (CEST)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzQ4Y-0004UU-9M
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzd-0001to-2a
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:47:05 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzZ-0003ov-Ei
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:47:04 -0400
Received: by mail-pf1-x42b.google.com with SMTP id u2so22206377pfc.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LBl5lC6+BEWBx9CDz/ugV2RwSxtDzpdW2uqAoTk2bvo=;
 b=wFfk04we4VvoPTKrJt5HbLxAAM28fGHfwb6GIhejSnkXgbHpj8KjPtDixTcJpwMjWj
 J/8gtAcLfTne5Jk7+43rX0Ys2KXx2GIq75m07Bk123G2ZiC08zou50ogJVefdNbFmeht
 OWYm5mFsTFwf6pxjG06X8LhlF0XtaU1Zhkgyd23o02YmszbkQIqn69NaN+KTzrvaJU6E
 waIbI6ZC2XItwQvgZPSIsYZ51rrcVEnSZ6vismD6GfNzbAkP5RWSILiW1JaYU+eijuMc
 rLpAGB9n78CgyiNtofsg92hjYiN/oC+ZMIm9wf8RP3V8/S9WtFDTaccu5yDmCgnjf1+J
 6Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBl5lC6+BEWBx9CDz/ugV2RwSxtDzpdW2uqAoTk2bvo=;
 b=FNfKfz1FtncYkohj6Ll9ysQNvEgkGdbK0Dk5Hgi8r16NtI0WLDIu3my+Ol2rNOl3Tt
 ejjwOK3qMGIQrmv3i1rojJXrTscipPT95Hp9TkhLJffPvtQTvgxlYnIZqrz83q86H9tl
 F77JQiDrS7F3b5R47m6BqFbexbjhe05q9Uj0xPh9w+5hxGq1VQwp6+/kgGvZPn5tIUWg
 kQ4sR4v2qYVY7WrAsGvY1dwwlFG2nUW1eDF579kk5OhYqFI5WHmuTvGA7CyIhOWJwuUk
 jZ0bV83iCnbQJLHytAi+GkXSei4aNCzz5pbUelLw55tZlYgc2OS48dhlH3KZ1HDXqfM/
 iPMg==
X-Gm-Message-State: AOAM532q94uWtEHtuYFGGBtz2N2ZxUzOZOfz84gUZO9lWkLGF87wao0A
 MMj4CAjBf3I4wbk1R5wWmqVdUQZfTi6T7A==
X-Google-Smtp-Source: ABdhPJwRQDoq7Hc8nUydGZJccXxVe+nnn4YkKKMlnU1vgW5esV4UYZhQakmPuO6gV7O8y12RmHy1wg==
X-Received: by 2002:a65:6044:0:b0:3fc:674:8f5a with SMTP id
 a4-20020a656044000000b003fc06748f5amr36606074pgp.436.1654811219951; 
 Thu, 09 Jun 2022 14:46:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 gw9-20020a17090b0a4900b001e2f6c7b6f6sm179167pjb.10.2022.06.09.14.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:46:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 2/2] target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]
Date: Thu,  9 Jun 2022 14:46:57 -0700
Message-Id: <20220609214657.1217913-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609214657.1217913-1-richard.henderson@linaro.org>
References: <20220609214657.1217913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Since DDI0487F.a, the RW bit is RAO/WI.  When specifically
targeting such a cpu, e.g. cortex-a76, it is legitimate to
ignore the bit within the secure monitor.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1062
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 5 +++++
 target/arm/helper.c | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 78dbcb5592..c489519923 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3978,6 +3978,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
+}
+
 static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d6818f281a..0d1670f89b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1747,6 +1747,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         value |= SCR_FW | SCR_AW;      /* RES1 */
         valid_mask &= ~SCR_NET;        /* RES0 */
 
+        if (!cpu_isar_feature(aa64_aa32_el1, cpu) &&
+            !cpu_isar_feature(aa64_aa32_el2, cpu)) {
+            value |= SCR_RW;           /* RAO/WI*/
+        }
         if (cpu_isar_feature(aa64_ras, cpu)) {
             valid_mask |= SCR_TERR;
         }
-- 
2.34.1


