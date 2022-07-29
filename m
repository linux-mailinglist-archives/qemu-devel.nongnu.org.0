Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437FE584E6D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:57:13 +0200 (CEST)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMk4-00033w-Cu
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMFE-0005Wx-Lp
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:25:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMFC-0006hk-V3
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:25:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z17so559871wrq.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mbn6XiDKnJmRGG2YuNoOAPV2cZfoBYZK1OHleilmO84=;
 b=c9aoVxBvcweaE2Jfnzkf3ITZcceZf6BpIwZ4izg+CMiwn3MTAFb5KqpAMOedz3mooR
 bfaNS9am+X6GlHYsTr897A1SC52VTyxaAPCBBX2kL91nGcWY2Ilcm7pNetlCQOfFwIGr
 1qW3lZ3hnkDMPP/S0wteABOGKPATRI5g4D3UdTzCrihj5qEd5qenuh0sxrJJuw1ptLu+
 M11OxPUufSZMmH5lJ2cZNZh2uGJ9YEh5tBclEeHX6sYT1fHHGHzLbHswOTO93ScJfjGO
 XGMexpVuiJOtLbsx1CezNDUBdJ8m6/9rgx0EJqhdVPjqO0HOHtoVpnQr8VKC9o1m05EA
 pevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mbn6XiDKnJmRGG2YuNoOAPV2cZfoBYZK1OHleilmO84=;
 b=ICNE6kc2sV82Fky3pPdtGHlnfMily11X8hYLpi27FKTRtMhU1q9ABPzYbbXWFOedKr
 zZDtGfHIvAGW+sKgYimZN9bCzyyk6AkbUO7sbScSFXDAglw9DsQw/JkEVyCD+/BvqkJJ
 XU90imkQZJe+5bllS8tK78321LwLili8iZPe3F7gPekB5LyvGqeTht73bSZMHqzoFA73
 V0+aYvGa/QZIeOZHlPd1TjQCV1GOw6LFdqQhARt5k6pIBsmqA/YCSpc4bQNfCjVQl6bd
 Vq4kHgtVGGEsxwGOVap2oC5H+Ior1VZSe2DhTSPGVeo+gXl8LP3Dy4aj8nKW1xHiaWBA
 Q3Jg==
X-Gm-Message-State: ACgBeo3uFF5DHxN5OHbziSu33vjP9i0buoHbXnBf2El9cdOU9iBWF2wi
 A2FE55ZrNditjuFtaVnYYIgheA==
X-Google-Smtp-Source: AA6agR5HXZHYYSgyhYJi1hfsqLW2jbAIKfiOW1C9Aos+gPmd/EXMoemrLH5kvLRGNCFt8Eo+C5rABQ==
X-Received: by 2002:a05:6000:807:b0:21e:daca:7df2 with SMTP id
 bt7-20020a056000080700b0021edaca7df2mr1846828wrb.214.1659086717603; 
 Fri, 29 Jul 2022 02:25:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a1ce905000000b003a320e6f011sm3835992wmc.1.2022.07.29.02.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:25:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 965041FFC1;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/13] semihosting: Fix handling of buffer in TARGET_SYS_TMPNAM
Date: Fri, 29 Jul 2022 10:19:39 +0100
Message-Id: <20220729091943.2152410-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

The TARGET_SYS_TMPNAM implementation has two bugs spotted by
Coverity:
 * confusion about whether 'len' has the length of the string
   including or excluding the terminating NUL means we
   lock_user() len bytes of memory but memcpy() len + 1 bytes
 * In the error-exit cases we forget to free() the buffer
   that asprintf() returned to us

Resolves: Coverity CID 1490285, 1490289
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220719121110.225657-5-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220725140520.515340-10-alex.bennee@linaro.org>

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d12288fc80..e741674238 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -504,16 +504,25 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(1);
         GET_ARG(2);
         len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        if (len < 0) {
+            common_semi_set_ret(cs, -1);
+            break;
+        }
+
+        /* Allow for trailing NUL */
+        len++;
         /* Make sure there's enough space in the buffer */
-        if (len < 0 || len >= arg2) {
+        if (len > arg2) {
+            free(s);
             common_semi_set_ret(cs, -1);
             break;
         }
         p = lock_user(VERIFY_WRITE, arg0, len, 0);
         if (!p) {
+            free(s);
             goto do_fault;
         }
-        memcpy(p, s, len + 1);
+        memcpy(p, s, len);
         unlock_user(p, arg0, len);
         free(s);
         common_semi_set_ret(cs, 0);
-- 
2.30.2


