Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6E599371
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:28:44 +0200 (CEST)
Received: from localhost ([::1]:34308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsgd-0006v5-6f
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseN-0001TE-NG
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseM-0002jH-2p
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so3670316pjf.2
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eHBGwaSHAS5zB0YpY3m3bpZJdiEeOQnCezVMbc66JAA=;
 b=RfN1c/T4F0ENX1O56rFHV5bXJxJYAvZ4QBb/qkUIYs+wOTXliGmBkn8ZzgIjjn/cAT
 oqNtF8moKmneoAWeslzjouQX87GDGgAm674XOv9uLPBTGwKxO7Efd1hWvuLjK51+M9jC
 CLU+Ruq+1EcGb8H3JnnENZ6eO13WEGyOFd9UDYsKO/B7HAn30NhksJ8u3DLW6kmdXGzY
 DWejtdt6gS2XKRoFQLhFWQaZpcCe0GbVjsKy6eopDbY/aiazYfOh+lvym13s6jLERhAk
 5vZy+zfZWRnuyjC097htjzYtQuFu4Mx4pqG+74z3Fi92yxtXUIbQ//612X1B4ldGMV2G
 wFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eHBGwaSHAS5zB0YpY3m3bpZJdiEeOQnCezVMbc66JAA=;
 b=Q3sS68oAEVjg13Hg9qMjYTIuFleckGy6KuyGOPDGFYldXs1qW9jMf/g9k1QwFLh0TG
 XM0wFNVO7/Bz940CV4gsSXmJeVKue6lDH1fBgXwNbrpvBM+ubqsvf7sj+sGSH8Xj5Rem
 9iNHMzrabH3S+RKDhzc4exoG2HEzALi/DI+YLxFIjTftIIniC5QfWnzb9N2tJ6EOpeAN
 gMYS7MUwHgNXoz1UTbqTwEAfjr7UsrbNQY/yGrGBi9YWRa9ubeSXSQaxdCWk2sr+t1JT
 uilYIhTKePh3KPxTt7HWgcJE12I+PKGMuqgVb6Rd3MMOjxdoQRS9N4BMAR8TygpSXznS
 fJbA==
X-Gm-Message-State: ACgBeo1kxjqhDwNgpPJI7bjDQTaGq+HPgzCa6tpdf5VkWIxrAGANkglS
 yEMAiGZvaht50e7Dj04fhbT2YO+iu/h9kQ==
X-Google-Smtp-Source: AA6agR4gVMIqXGQNDgQ5C+yoP1hIKNSleZwVLSdN2TvuqizGpWGFSuunUTWmFqVrTz+M3yBwEmCHXg==
X-Received: by 2002:a17:902:e88d:b0:172:b898:5656 with SMTP id
 w13-20020a170902e88d00b00172b8985656mr4094417plg.63.1660879580760; 
 Thu, 18 Aug 2022 20:26:20 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 03/21] linux-user/x86_64: Allocate vsyscall page as a
 commpage
Date: Thu, 18 Aug 2022 20:25:57 -0700
Message-Id: <20220819032615.884847-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

We're about to start validating PAGE_EXEC, which means that we've
got to the vsyscall page executable.  We had been special casing
this entirely within translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 29d910c4cc..b20d513929 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -195,6 +195,27 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
     (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
 }
 
+#if ULONG_MAX >= TARGET_VSYSCALL_PAGE
+#define INIT_GUEST_COMMPAGE
+static bool init_guest_commpage(void)
+{
+    /*
+     * The vsyscall page is at a high negative address aka kernel space,
+     * which means that we cannot actually allocate it with target_mmap.
+     * We still should be able to use page_set_flags, unless the user
+     * has specified -R reserved_va, which would trigger an assert().
+     */
+    if (reserved_va != 0 &&
+        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
+        error_report("Cannot allocate vsyscall page");
+        exit(EXIT_FAILURE);
+    }
+    page_set_flags(TARGET_VSYSCALL_PAGE,
+                   TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+#endif
 #else
 
 #define ELF_START_MMAP 0x80000000
@@ -2360,8 +2381,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 #else
 #define HI_COMMPAGE 0
 #define LO_COMMPAGE -1
+#ifndef INIT_GUEST_COMMPAGE
 #define init_guest_commpage() true
 #endif
+#endif
 
 static void pgb_fail_in_use(const char *image_name)
 {
-- 
2.34.1


