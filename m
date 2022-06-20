Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77473552479
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:19:36 +0200 (CEST)
Received: from localhost ([::1]:52342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Mvv-0007MK-9B
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdO-0002u4-JB
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:23 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdL-00023l-30
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:21 -0400
Received: by mail-pg1-x534.google.com with SMTP id d129so10880885pgc.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=peylD0MqTkY6Ni4gfiTgUpLQJeWJHjooqBzEUJMAaO0=;
 b=hbnTfeyPQbAnU+k6BHK38HhvJAVmjDVWyiuFrN/kn56WAWUM2BjX1ZnF/cFHGzvBLV
 UA/o8fsW3gYq0sA+NKtQsbNyYAnWTt0NKVxn+XEMPP4ZKNCTLWbDyk0+2/0Wyb8Gj3Ar
 DyzTnVsltd74BvIoEE+aAnOTlOujC+qcwNRs8LXbve6xGzKr+bgz5BlUlIw5YcnpaBhq
 Bj9yW7gRJ6nmddgWE8+b7Hm5tjZeaIdIcIGtq32kxo5ArEzh2r9SvJu2bczeTxpVLuFo
 ur6cTMimJvtvsFpGvYF8fyW8svsrxa15qqp6jJahApBTOLVQyi2HLuUFFnGMuqnoBk1A
 Izpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=peylD0MqTkY6Ni4gfiTgUpLQJeWJHjooqBzEUJMAaO0=;
 b=z3HfSF/xlKSbHRcFOoJ8w2LG3HSeixwLBo5yGvkj3+JNDJVsV2e4/IOsZa18nnOURC
 ySANl+MkC57WnqGa9MTyrxhTGsoK6SR30sZcnLcty9HvYbOrmBLHDnBG2at+wNojd4+Y
 MTOBRDOHKN1GH6TQLix5HTNs+eyRIODh/o/jtdJzP0DSdiEAlZ/I82WlbkJLhucHTtYS
 BHE0gmvpLqwlIpvky6thLi2aZIjIcdk+tUIz75rEtokizl0kGTi/ALYvxL68a9zLwZak
 Uou9H66rQ8V59gcMAp5c2/ArUPpbHcgM0xADMS8f9kNgKzb3C2AGP5XdSmy9fKestTqe
 l2Jw==
X-Gm-Message-State: AJIora9cp5w7S8/MPl8kG67SKQvjnx8ROeHmmZvkmoLSQAIOB40sk47z
 33fXD6qTE5UkYbFgZxMZUHpF6hgycBmXkQ==
X-Google-Smtp-Source: AGRyM1vdLVx2cgOGMx2hRYy5vIc493AhRBGDmIBGMaKtNfPn6C7OiBsUgFeFgwgMeRQDn8qOWcMKsQ==
X-Received: by 2002:aa7:9f9b:0:b0:525:1e0a:a6b4 with SMTP id
 z27-20020aa79f9b000000b005251e0aa6b4mr8471032pfr.5.1655747777763; 
 Mon, 20 Jun 2022 10:56:17 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 47/51] linux-user: Rename sve prctls
Date: Mon, 20 Jun 2022 10:52:31 -0700
Message-Id: <20220620175235.60881-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add "sve" to the sve prctl functions, to distinguish
them from the coming "sme" prctls with similar names.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h |  8 ++++----
 linux-user/syscall.c              | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 1d440ffbea..40481e6663 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -6,7 +6,7 @@
 #ifndef AARCH64_TARGET_PRCTL_H
 #define AARCH64_TARGET_PRCTL_H
 
-static abi_long do_prctl_get_vl(CPUArchState *env)
+static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
@@ -14,9 +14,9 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_get_vl do_prctl_get_vl
+#define do_prctl_sve_get_vl do_prctl_sve_get_vl
 
-static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
+static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 {
     /*
      * We cannot support either PR_SVE_SET_VL_ONEXEC or PR_SVE_VL_INHERIT.
@@ -47,7 +47,7 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_set_vl do_prctl_set_vl
+#define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
 static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
 {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..a7f41ef0ac 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6365,11 +6365,11 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_set_fp_mode
 #define do_prctl_set_fp_mode do_prctl_inval1
 #endif
-#ifndef do_prctl_get_vl
-#define do_prctl_get_vl do_prctl_inval0
+#ifndef do_prctl_sve_get_vl
+#define do_prctl_sve_get_vl do_prctl_inval0
 #endif
-#ifndef do_prctl_set_vl
-#define do_prctl_set_vl do_prctl_inval1
+#ifndef do_prctl_sve_set_vl
+#define do_prctl_sve_set_vl do_prctl_inval1
 #endif
 #ifndef do_prctl_reset_keys
 #define do_prctl_reset_keys do_prctl_inval1
@@ -6434,9 +6434,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_FP_MODE:
         return do_prctl_set_fp_mode(env, arg2);
     case PR_SVE_GET_VL:
-        return do_prctl_get_vl(env);
+        return do_prctl_sve_get_vl(env);
     case PR_SVE_SET_VL:
-        return do_prctl_set_vl(env, arg2);
+        return do_prctl_sve_set_vl(env, arg2);
     case PR_PAC_RESET_KEYS:
         if (arg3 || arg4 || arg5) {
             return -TARGET_EINVAL;
-- 
2.34.1


