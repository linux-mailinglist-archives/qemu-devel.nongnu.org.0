Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891D58B0A8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 22:00:29 +0200 (CEST)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3Ui-00089s-EL
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 16:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Po-0006Ue-IS
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pm-0004Vy-R8
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:24 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso9184950pjf.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDbgFIeEevSSdSTdjElX+eMs94p5XOKIDT8YgfUxWj8=;
 b=FuER+dFB+hNh+OwvWV/DAyxCJ40PNyEhfYQs1+zFLHBtDvW/j3QWy/sRhvT4bSf24T
 0j/EBgMPPSHP2R6GtaVytn9jHvJBrbbaM/F+irAGNVyl1AmD5KRR8lFGtM0UVDxe7POF
 MG0DJjtkRI2yKZ9y6WqXOXhFmTDNZZhNppCmOP9boJz3JSiHBhcs1IVZmF8dg2O9agCU
 aNWkKVBrlAE9ztcKpQ7HZdHcoicGgCMP4VZqPyIqjoyOC96NibchdGCDq6GykYA2JNcF
 Ab+vtvvDlbcCVWo7e7t0LdIWGHf9raHc+PUhR5MRyjyc2LRqsDvDbyxQvEoyAHeliEY5
 fvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IDbgFIeEevSSdSTdjElX+eMs94p5XOKIDT8YgfUxWj8=;
 b=6nGcSn2vTakr36iz1CRyUZZg5D/jumBknYNJi6GAdNqhyuCGwn5RLHOAqMEoH1WVFC
 fCKrCbDkMka+ivJjm7X49GAFHABX/HQfSHePCBC2wxpABeKL8hvpPn4wMrLt9COwaGk6
 EkejAXyAtH3O7J8XHfFFMa3eCe4JjrSgMea6Z2xp4rsafLsDdLFai0WLh/J46y5V2ya1
 AkH3ZKdEaWXA2jyhDTJWufGKDpQtgwNMbhc+sVYqcgmuJaw9tIVjhAI/lRUt3R08paW3
 /RWQg0feUdEvuKbYgsfATAGpu1gjk4aMnUblTOnsMb+lLgTOa/5rTa6HVZAs86eF7NXA
 A2Rw==
X-Gm-Message-State: ACgBeo2EffwLQsqaE9jVIqTQtAnC9w6uTFygR9xukzOGx5N2Lse8vEIx
 bQrWGqltNLPCyrDMbwrwB9bJdLGXNDWkJg==
X-Google-Smtp-Source: AA6agR5y3HdUBTpC22kuKCpkVWeZqqUAlrQmYgo0Ykqr3472aUAo7D4KloU6SVDJLAGwe17WYA0WSw==
X-Received: by 2002:a17:902:e548:b0:16f:8df8:90d3 with SMTP id
 n8-20020a170902e54800b0016f8df890d3mr6138794plf.90.1659729321572; 
 Fri, 05 Aug 2022 12:55:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f70d00b0016f0c2ea158sm3393048plo.157.2022.08.05.12.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 12:55:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 3/7] target/loongarch: Fix GDB get the wrong pc
Date: Fri,  5 Aug 2022 12:55:11 -0700
Message-Id: <20220805195515.349768-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805195515.349768-1-richard.henderson@linaro.org>
References: <20220805195515.349768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Song Gao <gaosong@loongson.cn>

GDB LoongArch add a register orig_a0, see the base64.xml [1].
We should add the orig_a0 to match the upstream GDB.

[1]: https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/base64.xml

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220805033523.1416837-2-gaosong@loongson.cn>
---
 target/loongarch/cpu.c       | 2 +-
 target/loongarch/gdbstub.c   | 7 +++++--
 gdb-xml/loongarch-base64.xml | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 1c69a76f2b..d84ec38cf7 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -683,7 +683,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = loongarch_cpu_gdb_read_register;
     cc->gdb_write_register = loongarch_cpu_gdb_write_register;
     cc->disas_set_info = loongarch_cpu_disas_set_info;
-    cc->gdb_num_core_regs = 34;
+    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_stop_before_watchpoint = true;
 
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 24e126fb2d..5feb43445f 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -19,8 +19,11 @@ int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     if (0 <= n && n < 32) {
         return gdb_get_regl(mem_buf, env->gpr[n]);
     } else if (n == 32) {
-        return gdb_get_regl(mem_buf, env->pc);
+        /* orig_a0 */
+        return gdb_get_regl(mem_buf, 0);
     } else if (n == 33) {
+        return gdb_get_regl(mem_buf, env->pc);
+    } else if (n == 34) {
         return gdb_get_regl(mem_buf, env->CSR_BADV);
     }
     return 0;
@@ -36,7 +39,7 @@ int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     if (0 <= n && n < 32) {
         env->gpr[n] = tmp;
         length = sizeof(target_ulong);
-    } else if (n == 32) {
+    } else if (n == 33) {
         env->pc = tmp;
         length = sizeof(target_ulong);
     }
diff --git a/gdb-xml/loongarch-base64.xml b/gdb-xml/loongarch-base64.xml
index 4962bdbd28..a1dd4f2208 100644
--- a/gdb-xml/loongarch-base64.xml
+++ b/gdb-xml/loongarch-base64.xml
@@ -39,6 +39,7 @@
   <reg name="r29" bitsize="64" type="uint64" group="general"/>
   <reg name="r30" bitsize="64" type="uint64" group="general"/>
   <reg name="r31" bitsize="64" type="uint64" group="general"/>
+  <reg name="orig_a0" bitsize="64" type="uint64" group="general"/>
   <reg name="pc" bitsize="64" type="code_ptr" group="general"/>
   <reg name="badvaddr" bitsize="64" type="code_ptr" group="general"/>
 </feature>
-- 
2.34.1


