Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76653D347
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 23:39:31 +0200 (CEST)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxF0z-0001GN-Jb
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 17:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxEzq-0000Of-8Z
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 17:38:19 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxEzm-00031X-L0
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 17:38:17 -0400
Received: by mail-pl1-x631.google.com with SMTP id d22so7662945plr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 14:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7J8p3wwa03XaanC4oCwrLuqiuI+yQhLiT9J1VYtX2Tw=;
 b=rGZr8vBZjg5gJsbsLKqKtuEASSk4nAGyQhKie/h4vkoBO+LsghLxqP/9rYUoT9AN1p
 ggNNqfBZM8labDSO+HB4CcJ5NeTiFWePpMMBrNOlx2KLSIvNg2iBq4zsoO5WHwRIXxSd
 Cah30ukV0c8XxoYgyVUSd7ctR0xeakwUUuuN+jm8mDBNNqOh35/vY+gayqucnM89rDD/
 S9ELdsotpteLSvGVeg51z5miopNPpjJj7RYtzxHTKZif/vkFxZ7cApLxBDmALG9RLfy/
 SlOpx/YnQfhb+hdgB9ZGlW6NucMRqtt7ZB7VTSmked+hoeOawfTjwa3o3z1on1l8nUjp
 tKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7J8p3wwa03XaanC4oCwrLuqiuI+yQhLiT9J1VYtX2Tw=;
 b=MkWDjdD37lkRtHm+oJqjcQBQlkeK577Cu4T+fQvd2s5YfaQPLpL5dxoTSN7pIf0Diz
 /MbhkJgUs0XLdWX/iq73AMyxGp2rR/WRc4giQhX7L02Uo26VIQlzEwxYp/jFBgz4B62C
 r4Si70zukibIZCNAzk/fEzXIzSPmmSD4Xk3K4Udj4MdXENJ2dnyfwAZ8QE7YIsJSFkss
 w+dSoglG79puaV5T1BFDkDcW6/CRDZFxSsIxVB1ogiUJiAG8aIydulGske5thp7RupZX
 FAE8/SNo9p2Fkz0onWQTnfKzu9VFiOfEPOXG/QqUC9K6LQLT7M7RMlUm3ZlDwT5CsATN
 wsyQ==
X-Gm-Message-State: AOAM532xyCdpC+YYbgnjR/+PzxUepgBBNIjhK/BIjdq4MYsYGzDu7kNH
 D4aftjRatSU1E+QdSOhFy/7020f+qVIXGw==
X-Google-Smtp-Source: ABdhPJy0Txv0KI+rWvy7GDjzUowe83xqkztQ26o+OR2Bel+bmHiXzlEF7omzlCLblSsYos/Ylw6XgA==
X-Received: by 2002:a17:902:f34c:b0:163:fa4f:2ff5 with SMTP id
 q12-20020a170902f34c00b00163fa4f2ff5mr11819411ple.174.1654292283725; 
 Fri, 03 Jun 2022 14:38:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a170902d4cd00b0015e8d4eb2aesm5903523plg.248.2022.06.03.14.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 14:38:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH] linux-user/x86_64: Fix ELF_PLATFORM
Date: Fri,  3 Jun 2022 14:38:01 -0700
Message-Id: <20220603213801.64738-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

We had been using the i686 platform string for x86_64.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1041
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f7eae357f4..163fc8a1ee 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -130,19 +130,6 @@ typedef abi_int         target_pid_t;
 
 #ifdef TARGET_I386
 
-#define ELF_PLATFORM get_elf_platform()
-
-static const char *get_elf_platform(void)
-{
-    static char elf_platform[] = "i386";
-    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6)
-        family = 6;
-    if (family >= 3)
-        elf_platform[1] = '0' + family;
-    return elf_platform;
-}
-
 #define ELF_HWCAP get_elf_hwcap()
 
 static uint32_t get_elf_hwcap(void)
@@ -158,6 +145,8 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_CLASS      ELFCLASS64
 #define ELF_ARCH       EM_X86_64
 
+#define ELF_PLATFORM   "x86_64"
+
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
     regs->rax = 0;
@@ -221,6 +210,21 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
 #define ELF_CLASS       ELFCLASS32
 #define ELF_ARCH        EM_386
 
+#define ELF_PLATFORM get_elf_platform()
+
+static const char *get_elf_platform(void)
+{
+    static char elf_platform[] = "i386";
+    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
+    if (family > 6) {
+        family = 6;
+    }
+    if (family >= 3) {
+        elf_platform[1] = '0' + family;
+    }
+    return elf_platform;
+}
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-- 
2.34.1


