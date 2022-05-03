Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D7518FB2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:04:06 +0200 (CEST)
Received: from localhost ([::1]:51950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzgj-0007t4-JM
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZo-0000fh-1B
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZm-0006N4-CI
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:51 -0400
Received: by mail-pg1-x529.google.com with SMTP id j70so3893402pge.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8TFArIwYtOuJWeu7AXv9g90fK/0fq597uhKnECoQyCg=;
 b=GbXm4OHgEzCA0aL5AzcAAvITrm+AKr27N1WCAdTZQ0w5qwy5M29jgYGyseh8BIaOlu
 lX/VLcA2xLsSzEVe4vlZ0/UNB2nbfngPPe5IDXoyybUk6Z2D5Q/ZoklFshXeAzmuykH7
 bN0Stfg2ConXMcfNPVrSdbC7+97nnbbSJNw7Yge67RDfC29mRJyxxh73YoXUwqvQaITf
 Ds8A/3Sucu2V7Vbar0oMQEdIsy4ZL39fhBto2GMJ+y+WXwRZQNr4bJ32P/d7znVbIzU5
 E7Iw5XKBvf1J2AK6OOT5i67OmQwIIvVlgTRtqzyqkwrzFBxlgqkH7T0/qnhwqsz/yVnw
 1MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8TFArIwYtOuJWeu7AXv9g90fK/0fq597uhKnECoQyCg=;
 b=li3+cU7/wSA6/zbGV9He7mJoqE8k4zibDk2hdYV5Dy7CRUVao5gGlk7XPMOY6AoRRs
 OqyzByKtqKZrCIr8Zzvvpgvf5Nd1xBv4xp+4enW5qdIx9l4go/X1Y7zeBoOrzEdWBL/H
 5sG6kyjuX8MQ6X232dhXeihqDorhTU7AK0927dCn4DTWkQvcdQgfEYgwxqCWhVnFJF8X
 HAatwc8+ru9pL0JWNPOevtU57LJACr6l3OUIDo56y4WmvOI+iHHkm7SM212PoYVCpAg/
 OUTrEVSDwAn6ljSFhT4wH/yjtpDR8AqmD4ei4wDzLz0YM0MzgY1JGLFWb3hamaH8OeF0
 iJOQ==
X-Gm-Message-State: AOAM531VcgnTDnUS/YydtXkxtf3AqswtvNtEseEkwqVDQmvCZ/EJVH7p
 Hq5i5DPmTweLfUJuwEGiThwOSh4Ga5yaDQ==
X-Google-Smtp-Source: ABdhPJwm9cdSfHOGEucYB1E1OYApU6qJ5ACP/gQFqYDJKMrX0lN1QyeeUIgOgUwxSjfHdxJdY//PUw==
X-Received: by 2002:a63:444f:0:b0:39d:3aa5:c9f0 with SMTP id
 t15-20020a63444f000000b0039d3aa5c9f0mr15185449pgk.363.1651607568938; 
 Tue, 03 May 2022 12:52:48 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 63/74] target/mips: Simplify UHI_argnlen and UHI_argn
Date: Tue,  3 May 2022 12:48:32 -0700
Message-Id: <20220503194843.1379101-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

With semihosting_get_arg, we already have a check vs argc, so
there's no point replicating it -- just check the result vs NULL.
Merge copy_argn_to_target into its caller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 44 ++++++++++++++----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index df1747aafe..0f5b509ce2 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -198,21 +198,6 @@ static void uhi_fstat_cb(CPUState *cs, uint64_t ret, int err)
     uhi_cb(cs, ret, err);
 }
 
-static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
-                               target_ulong vaddr)
-{
-    int strsize = strlen(semihosting_get_arg(arg_num)) + 1;
-    char *dst = lock_user(VERIFY_WRITE, vaddr, strsize, 0);
-    if (!dst) {
-        report_fault(env);
-    }
-
-    strcpy(dst, semihosting_get_arg(arg_num));
-
-    unlock_user(dst, vaddr, strsize);
-    return 0;
-}
-
 #define GET_TARGET_STRING(p, addr)              \
     do {                                        \
         p = lock_user_string(addr);             \
@@ -285,18 +270,31 @@ void mips_semihosting(CPUMIPSState *env)
         gpr[2] = semihosting_get_argc();
         break;
     case UHI_argnlen:
-        if (gpr[4] >= semihosting_get_argc()) {
-            gpr[2] = -1;
-            return;
+        {
+            const char *s = semihosting_get_arg(gpr[4]);
+            gpr[2] = s ? strlen(s) : -1;
         }
-        gpr[2] = strlen(semihosting_get_arg(gpr[4]));
         break;
     case UHI_argn:
-        if (gpr[4] >= semihosting_get_argc()) {
-            gpr[2] = -1;
-            return;
+        {
+            const char *s = semihosting_get_arg(gpr[4]);
+            target_ulong addr;
+            size_t len;
+
+            if (!s) {
+                gpr[2] = -1;
+                break;
+            }
+            len = strlen(s) + 1;
+            addr = gpr[5];
+            p = lock_user(VERIFY_WRITE, addr, len, 0);
+            if (!p) {
+                report_fault(env);
+            }
+            memcpy(p, s, len);
+            unlock_user(p, addr, len);
+            gpr[2] = 0;
         }
-        gpr[2] = copy_argn_to_target(env, gpr[4], gpr[5]);
         break;
 
     case UHI_plog:
-- 
2.34.1


