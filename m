Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA586380D91
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:47:28 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lha2B-0008VN-Px
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZWD-0006Gj-F3
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:25 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:45764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW8-00078w-G2
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:25 -0400
Received: by mail-qk1-x732.google.com with SMTP id 197so28988280qkl.12
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9yt297DaPABA6jZ93aLPYCxWDxJPKwYcLqKfZF3eAY=;
 b=qq02mlpNqb8yaucNQETiqkctLNHt9gh0d9+WTy/owz6a3fr6xRmTo5XLVEbK1EK9rj
 Z7i7NT0s+7QQ7gQ7wyPdWsvzMuK7JhagfeB9UmSsOL82JsIeBCEniosCLK+u1Rl876Y4
 13lU9HTIoy502VyVAu1sypeuZj6VWI8UHhzgWIkr0pN9U6AswSzGsadrwd0WdkCQHz9a
 qqjLYBCOkPidD+Fun45XkUX1gHw68eGYpbtwAW1aDO+lhh654x2b6JDh0iiAvYm4794K
 wVq7XqUmS7G9pgkNmfkWK4LOZtG8OYHnrtOSbu4gGrSX2KvcGuTju96ugF4Ett1Xq4pi
 Gaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9yt297DaPABA6jZ93aLPYCxWDxJPKwYcLqKfZF3eAY=;
 b=LC+EnD7nGda1Dgu4IQM0Li+boB4HLJ4Iyk+2HuDbTeyT1opfK/ecmVCnMj1t3cBONI
 GhFHwCLREsh2j9ncZ8+2T0MsdR0qjhttSD6cMSB2aZ8eg/EL7QyL6/1jBwzujf59YtDT
 Vi9KOgXTop9nHO7/Wa2v3w/NB+uuNdCpdzz6Ah6Qx3EkW5VuniAt4znRnXQOFX/jqbTt
 l2pyNcMPYO4eFcD4TMLahD/24aef7YHG9k/LjB7aieK3GTANZ9jH+ZLmBDEwdqTTp0UW
 UK9O7pXlAeH5/14h1QvjsrwLbC+ddzusmxaSuhEQbAYOYsVSZ3XAGmM3RRszL1YvO8gY
 hbHw==
X-Gm-Message-State: AOAM532FeYWvzJohdsP6zNej2AmxK+oGM/mmDNc/J635nTK8YItfU+jd
 ExUsPEyN+AnPzUkbQAR41/R6DpCVtbTmmkEO8NM=
X-Google-Smtp-Source: ABdhPJwLjgZHJVZq4tF71emJf0jFHsfvsZEWEoDGHOX1UIKVraIzuI1JrUZW5Dbveh8uuuc2MUkKoQ==
X-Received: by 2002:a37:a683:: with SMTP id
 p125mr44360920qke.332.1621005258999; 
 Fri, 14 May 2021 08:14:18 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 38/50] target/i386: Remove user stub for cpu_vmexit
Date: Fri, 14 May 2021 10:13:30 -0500
Message-Id: <20210514151342.384376-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is only called from tcg/sysemu/.
There is no need for a stub in tcg/user/.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h     | 4 +++-
 target/i386/tcg/user/svm_stubs.c | 6 ------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 97fb7a226a..85a8b0ebd6 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -77,10 +77,12 @@ extern const uint8_t parity_table[256];
 /* misc_helper.c */
 void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
 
-/* svm_helper.c */
+/* sysemu/svm_helper.c */
+#ifndef CONFIG_USER_ONLY
 void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
                               uint64_t exit_info_1, uintptr_t retaddr);
 void do_vmexit(CPUX86State *env);
+#endif
 
 /* seg_helper.c */
 void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw);
diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
index 48a43bdcea..db818f89a8 100644
--- a/target/i386/tcg/user/svm_stubs.c
+++ b/target/i386/tcg/user/svm_stubs.c
@@ -22,12 +22,6 @@
 #include "exec/helper-proto.h"
 #include "tcg/helper-tcg.h"
 
-void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code, uint64_t exit_info_1,
-                uintptr_t retaddr)
-{
-    assert(0);
-}
-
 void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
                                    uint64_t param, uintptr_t retaddr)
 {
-- 
2.25.1


