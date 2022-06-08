Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47532542144
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:32:56 +0200 (CEST)
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoJL-0004Uh-DW
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6n-0006vM-6j
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:57 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6l-000239-Fl
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so9155722pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rmf1h8nOdErU6TZ6hYcqWua8rMBnQ07/JNvdx/MscPs=;
 b=YgNcAVgxteMAGOD9q04cE3zwRZoC+3IO4J2yIi2lh2iR7ey0Uj8ofdKU1uaZoQo4/L
 1Ey9mc8qOslv2xyM5+F4X0Qrns+rmP6+9pftHrtUqvG133qDmbvh28iq3DaA8ATly5HC
 cKlEWkHpPI8qQZaZhBP9C5E46X6QRvuvFkbahYmKY1ob3mAuVnPDunlg2mZ5smXmWo/i
 fcfFuBQW619oS9YAYN/bn1bdGEzRdJPbeUznpI2JObDrzr2vNIaH7GH3ouOkeSUa95It
 OUOd6kV+tw5ywwZQ0Rxr+BaN6ifgbdlmJHoZKKr4UlU/+FB5YhLeJOHzdQvj89riV+9O
 mJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rmf1h8nOdErU6TZ6hYcqWua8rMBnQ07/JNvdx/MscPs=;
 b=ava5xKm02WR2ZoivT8dj/2M+A8Ul0zqPgrQbaPqa5SMgG18dQnmReKP+fUXaN4vrFL
 QWFhlT95fKmClELdxpS06wKwSrX5rF8PGCfxdHBX6SCq20ahyjCJN71v/Nn+iFgkVD9A
 ND5ncUmiJJGnpfnvD1ONDJohksgaXvKF59Uj5gmNzV/Ebj3OzRIsGh+WUmiQpX5QnU7j
 kDj6Q6zJ022N4ovFgBLRvD8K4TPd0/1wovKLTMjdE0clIceS55e9cAfY7pO2dCyYf12I
 UQP3WHhaoN4Al7vUg+bvP1JNvrAkQ1DSv1MtFAGF6WHDX25twwa3JvYZT+bT+XfDYb9f
 GXOQ==
X-Gm-Message-State: AOAM531qufn2F80sVYLZPI832ppYVd2r1Zj0Ay6H7hXt++g9NW/d1pZ+
 wIN/m4d0PDhaNiBQ3dq3TuP/vfObUNeboA==
X-Google-Smtp-Source: ABdhPJyJTZ0G9dsdM8QHKf8NDiO6r4tEgC7Pbf1U00o7g5odxxZy0h5t4yaT3L6YguCCWZFc6vZGKg==
X-Received: by 2002:a17:90b:3907:b0:1e8:57f9:dadb with SMTP id
 ob7-20020a17090b390700b001e857f9dadbmr22214461pjb.137.1654665592967; 
 Tue, 07 Jun 2022 22:19:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 07/11] target/mips: Avoid qemu_semihosting_log_out for
 UHI_plog
Date: Tue,  7 Jun 2022 22:19:41 -0700
Message-Id: <20220608051945.802339-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Use semihost_sys_write and/or qemu_semihosting_console_write
for implementing plog.  When using gdbstub, copy the temp
string below the stack so that gdb has a guest address from
which to perform the log.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 52 +++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 5b78cf21a7..ad11a46820 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -310,20 +310,50 @@ void mips_semihosting(CPUMIPSState *env)
         }
         gpr[2] = copy_argn_to_target(env, gpr[4], gpr[5]);
         break;
+
     case UHI_plog:
-        GET_TARGET_STRING(p, gpr[4]);
-        p2 = strstr(p, "%d");
-        if (p2) {
-            int char_num = p2 - p;
-            GString *s = g_string_new_len(p, char_num);
-            g_string_append_printf(s, "%d%s", (int)gpr[5], p2 + 2);
-            gpr[2] = qemu_semihosting_log_out(s->str, s->len);
-            g_string_free(s, true);
-        } else {
-            gpr[2] = qemu_semihosting_log_out(p, strlen(p));
+        {
+            target_ulong addr = gpr[4];
+            ssize_t len = target_strlen(addr);
+            GString *str;
+            char *pct_d;
+
+            if (len < 0) {
+                report_fault(env);
+            }
+            p = lock_user(VERIFY_READ, addr, len, 1);
+            if (!p) {
+                report_fault(env);
+            }
+
+            pct_d = strstr(p, "%d");
+            if (!pct_d) {
+                FREE_TARGET_STRING(p, addr);
+                semihost_sys_write(cs, uhi_cb, 2, addr, len);
+                break;
+            }
+
+            str = g_string_new_len(p, pct_d - p);
+            g_string_append_printf(str, "%d%s", (int)gpr[5], pct_d + 2);
+            FREE_TARGET_STRING(p, addr);
+
+            /*
+             * When we're using gdb, we need a guest address, so
+             * drop the string onto the stack below the stack pointer.
+             */
+            if (use_gdb_syscalls()) {
+                addr = gpr[29] - str->len;
+                p = lock_user(VERIFY_WRITE, addr, str->len, 0);
+                memcpy(p, str->str, str->len);
+                unlock_user(p, addr, str->len);
+                semihost_sys_write(cs, uhi_cb, 2, addr, str->len);
+            } else {
+                gpr[2] = qemu_semihosting_console_write(str->str, str->len);
+            }
+            g_string_free(str, true);
         }
-        FREE_TARGET_STRING(p, gpr[4]);
         break;
+
     case UHI_assert:
         GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
         printf("assertion '");
-- 
2.34.1


