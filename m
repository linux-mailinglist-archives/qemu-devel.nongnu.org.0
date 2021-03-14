Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D61A33A86D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 23:04:30 +0100 (CET)
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYqb-0004ax-GQ
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 18:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHK-0006Qi-ON
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:02 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHE-0008IK-PD
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:02 -0400
Received: by mail-qk1-x72e.google.com with SMTP id m186so13276889qke.12
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4eSiYZLqamkXwsALfLyClM+caXgQ2VvDhj6YMhAvyBg=;
 b=DiVwRfe2SuZ8YJjM8a5GDNpBlolBIM5CsmH/gblZWiUdd9HlkpYZZP8obkufpJLUIt
 gCM3OJNOJp3Oy4b4UdhuZIURNcoAaKJPgF7DeitKjuL+tirjER7rVXkENPM3KE3T3GD1
 IRbIdVleijvG8mcKc7Wk1N1Uwtn9mQLJqVCVIc5Fno37BdSc3gPy8crgXvkbqwrfVCrT
 XXIOjXjRxtQiGQTFIpA6K36IJJFqsvYjZ8/q1xWA95JtXZYpi+jy1X/ghIMI1YPgrt82
 snuQOYCdaAKOtl34eosIIf+DaGGK4YK/wJCy495vYKqfHK2iIa9hvSBaLrj/ZxUnGtS3
 N08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4eSiYZLqamkXwsALfLyClM+caXgQ2VvDhj6YMhAvyBg=;
 b=g5Q1Qs7FeMVokMmp5wottd70bEB6ZurKYIm2cjAlM6aynTl6Em76euOqzMBEKF9+vR
 eYhtAgNC/Unp1sOgXwjoPmOHeNuzurKsMLgqDOYMb3/1CJvByG5Q/2wLLYh3ysrPqKFu
 1Dt0LiMKOLJyI0edYM8BUyOCA0WH3H4gTOZ1XgpB+/PHGMyOpwMN1d2Q0aXX15Lge1Cj
 Elrert41uetbxpo2NSjBdWo1NxRVrnV9k9hShRUoYh4PKiAY2eTEHK78Nvr+tYppHp0D
 R8icZRnmUUWhj2mxnukXQEJ/h4IL6HoJixi1iWLGxjsNQOW2BS9FPv0YBV6khL8x3ESI
 H7Mg==
X-Gm-Message-State: AOAM531DC4XxPlGfeidJv7C9c2v9OGj3K9hKWIy/zBJOffVdHRNIJAzS
 88KrcyCYcXub1uKx4Jg/qwfDUTLDV76B5ZWn
X-Google-Smtp-Source: ABdhPJzDa2yoWzwgQa5rbwXZM7egcYEmbsKYZSd1f8Wcw4hVgA2w8XEW7F51aEMcNFCRqschVfExMQ==
X-Received: by 2002:a05:620a:1001:: with SMTP id
 z1mr21770585qkj.364.1615757274702; 
 Sun, 14 Mar 2021 14:27:54 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/29] util/osdep: Add qemu_mprotect_rw
Date: Sun, 14 Mar 2021 15:27:20 -0600
Message-Id: <20210314212724.1917075-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For --enable-tcg-interpreter on Windows, we will need this.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h | 1 +
 util/osdep.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c56..5cc2e57bdf 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -494,6 +494,7 @@ void sigaction_invoke(struct sigaction *action,
 #endif
 
 int qemu_madvise(void *addr, size_t len, int advice);
+int qemu_mprotect_rw(void *addr, size_t size);
 int qemu_mprotect_rwx(void *addr, size_t size);
 int qemu_mprotect_none(void *addr, size_t size);
 
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..42a0a4986a 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -97,6 +97,15 @@ static int qemu_mprotect__osdep(void *addr, size_t size, int prot)
 #endif
 }
 
+int qemu_mprotect_rw(void *addr, size_t size)
+{
+#ifdef _WIN32
+    return qemu_mprotect__osdep(addr, size, PAGE_READWRITE);
+#else
+    return qemu_mprotect__osdep(addr, size, PROT_READ | PROT_WRITE);
+#endif
+}
+
 int qemu_mprotect_rwx(void *addr, size_t size)
 {
 #ifdef _WIN32
-- 
2.25.1


