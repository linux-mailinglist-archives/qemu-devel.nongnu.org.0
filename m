Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FE632752E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:26:09 +0100 (CET)
Received: from localhost ([::1]:57778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVRw-0007CH-Ft
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPP-0005Lp-Lp
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:33 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:32805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPM-0007fX-Qv
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:31 -0500
Received: by mail-pl1-x632.google.com with SMTP id b8so5946898plh.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NEaEZZZxi9u9Mpvj5euEgFjoVxLuL6VRMYmG/p0WBKQ=;
 b=wMvU1SFYqvML0Yvvpnz4MDtxEmy5RbGliZXWkKWWfACJC3iygiW4mJNHX8xvTdDgTn
 vM+gh+lRGFcGpBsQF0qWHjVDgotfip7cBc5+4dH/Uxe1jnnRhRPnrrJ8ql/yhunu/CZS
 5+SH4fptblL3JBttyLlVtz8mLovQ1EgpCYnt5a+NFUPvXJ43nC2wgnfUjxRU0OCZYXRA
 7LHM5LRuOmI2FfrZgweWL3YcUKW4RxrPo2B1745wULObCIaT0Ezqw3cO0YYaK+WdPyfh
 dXUAzZIV+LjHvCsf1prCMpHB+n5y77lqpWLN/AKV8hx1EpEuruxMHUXVSlK19G9cCbJ1
 KCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NEaEZZZxi9u9Mpvj5euEgFjoVxLuL6VRMYmG/p0WBKQ=;
 b=hXWMYCSf4cWCShIut4tjxSWGynA+NxBQeiI7APYrPSxgQ2f0s5TzEs1/jc8V09A6aa
 pEkJEN+i/qADieJRNfuEhGhs4pDRwUg+vAWMqRrxwMKuTPAjFC4nxRmEWYJr744SCfms
 qFhwu0N2ID6PWOkKU9FNaCnl61XCuN3XzTE2TnGwrCaOBZIcMEsiPPKVrgDvEoGWR/Ca
 C7PdjJJ7Lf94OGBsgk/BeX6Wz8CB9JjU3zfU1AxBHAUoed5sNZ8ybCzLal54PfuHJ+YX
 6gaGtfGYi59hyq+nj7otiSZf2SuX4oM68p0wEfgS+gRNnnmB+RNMjYFiUwwnwSa0AM2G
 terQ==
X-Gm-Message-State: AOAM533QvX9ZbUXU1CfrpIKuHYTdkOHAThGX1Fd08FfHEqtb4Wr6YbxI
 uN/EsTK/RGxHoLk+vWmPTr4SbW26K6b6lQ==
X-Google-Smtp-Source: ABdhPJzAXX7DB9LF0SnORN4+vIEvi5dRQ0jjpX+7n7i8qLT0SofhaHaFWO9JhHw8zbpkGUOHene2Ug==
X-Received: by 2002:a17:902:e8c4:b029:e2:b7d3:4fd7 with SMTP id
 v4-20020a170902e8c4b02900e2b7d34fd7mr12405476plg.73.1614554607551; 
 Sun, 28 Feb 2021 15:23:27 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/50] target/i386: Split out check_iopl
Date: Sun, 28 Feb 2021 15:22:36 -0800
Message-Id: <20210228232321.322053-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 75ee87fe84..176c95c02b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1302,6 +1302,16 @@ static bool check_vm86_iopl(DisasContext *s)
     return false;
 }
 
+/* Check for iopl allowing access; if not, raise #GP and return false. */
+static bool check_iopl(DisasContext *s)
+{
+    if (s->vm86 ? s->iopl == 3 : s->cpl <= s->iopl) {
+        return true;
+    }
+    gen_exception_gpf(s);
+    return false;
+}
+
 /* if d == OR_TMP0, it means memory operand (address in A0) */
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
 {
@@ -7089,28 +7099,16 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
 #endif
     case 0xfa: /* cli */
-        if (!s->vm86) {
-            if (s->cpl <= s->iopl) {
-                gen_helper_cli(cpu_env);
-            } else {
-                gen_exception_gpf(s);
-            }
-        } else {
-            if (s->iopl == 3) {
-                gen_helper_cli(cpu_env);
-            } else {
-                gen_exception_gpf(s);
-            }
+        if (check_iopl(s)) {
+            gen_helper_cli(cpu_env);
         }
         break;
     case 0xfb: /* sti */
-        if (s->vm86 ? s->iopl == 3 : s->cpl <= s->iopl) {
+        if (check_iopl(s)) {
             gen_helper_sti(cpu_env);
             /* interruptions are enabled only the first insn after sti */
             gen_jmp_im(s, s->pc - s->cs_base);
             gen_eob_inhibit_irq(s, true);
-        } else {
-            gen_exception_gpf(s);
         }
         break;
     case 0x62: /* bound */
-- 
2.25.1


