Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D2518F71
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:53:29 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzWS-00089Z-Ba
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZk-0000NZ-8K
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:48 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZi-0006MY-Hk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:47 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x18so4707153plg.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wshqblo3GajKvQ1u/4/sDSAzNuqAbf17z7w/qZv2wdo=;
 b=FeZKgubc1srbehQEOrBWHTwxekJuen5Oxtvob3HnAB4508UBCxM7LKPAKOJJlTaXu8
 eny8JdilcN9r70kBPxA/Al3B1w0kWX+IeKk0D20em90Da/ZkSXjkF4g4CJu8of7A04FE
 Iht1TBTDz13tQZleOxqivqM+fiQu5vvZ/V4rynXtfn/+ise9/cH++4bG99NIdoWHkNpc
 crKGv9eY+pbFzsQUwM26trkpidXasvfi381WKL3Oy3aXgCnWVzcOupmUHx8rkZ5J8T71
 dc268uUAxPD0UMDoyu0fz2C+rsuL20yP1YdbmJ58LdUnx59uAP2cIFd43U7jlzPo5t8L
 9tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wshqblo3GajKvQ1u/4/sDSAzNuqAbf17z7w/qZv2wdo=;
 b=aaUO3rKBxCR4n1LHVWqJxJTW6f9LiS4hDEO0Yq6Fw544G68r9kD8/bjIzTNmsokDW0
 aStqt2CyNae1HjhrK1pkVjy5qmy2sDZDZOmfHwXJIqfGYMYPNuIGX+sqazvhbZo+SZBa
 epsyz7BHzpx6UCWecL1BBsJUlcUiq2gmzdn5YGn6U1dtpno8kbwirWFTNHa5VCS7dNX8
 1L6QMLtGMp3w1C0ZaSlQKn99K7hNBPPfFiHBtn8NrjbTAzSRx0Fj+rsO6vjkjN1hSI7E
 aAnDSX4INAeBdQl97h2NxJDwB7QoAjz2oWSkha8ncx6LquR3DgytHF6ThTeY1hEKZsHI
 dXZg==
X-Gm-Message-State: AOAM530L8xu01zK/Z5ufROhOqNBcs/FkxPbZ6koKfj1A8BOX9Q+ezD/C
 MljtzrJOw8OV8v89yjg5+hq4kJ+Lx0OCbQ==
X-Google-Smtp-Source: ABdhPJx8yCuyIiiENk+LEp1igIqVo1ir4ccI2gJpNHY5vBcTTaDlWepQvJGK8RfqdWUvQMntH2fNjg==
X-Received: by 2002:a17:90a:e7ca:b0:1dc:4aeb:be5d with SMTP id
 kb10-20020a17090ae7ca00b001dc4aebbe5dmr6393921pjb.185.1651607565294; 
 Tue, 03 May 2022 12:52:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 60/74] target/mips: Avoid qemu_semihosting_log_out for
 UHI_plog
Date: Tue,  3 May 2022 12:48:29 -0700
Message-Id: <20220503194843.1379101-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
index 2704177a95..d8c9be5e9f 100644
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


