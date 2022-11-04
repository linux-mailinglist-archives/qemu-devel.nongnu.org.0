Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE5619EE5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:37:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0cX-00007F-LK; Fri, 04 Nov 2022 13:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cV-000051-Ok
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cT-0003vM-RN
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id k8so8078362wrh.1
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b05feXPZ3apphQxTxrxWgfNP3iO/wjyZxV5mXVldZE8=;
 b=Mng5nxYeAB5icTGXTnB6EFfjuzxizsJzvhS4JsPKhhkEkBbDcPpnqo+oN1dpLZGkM2
 wpQdRl3L/4aDRf6Tk+HYg/qWjVrYCbPVnRMPUKdVBUTZAQeBLW+qdqzbUw5rq2qLsBS5
 D9FOrkz5P2KRG4Fh5IHGYvMr8UNQJ6f9UFmonTXD6ghEev6ImXQ4KvtOgPvOlXROAtKW
 I1GseEMPJKYhEjrTFhJdKEtnKufGbrqEKxj88vlm1m3Nli4DdTgWll9AIEkZeH05m0O7
 uHHgzco94dHoXDZcrbEW4C9SBf1yk9sYXPcBWLRTLyBpe1rIjgjAZKVrOD3Q9e2qu2c6
 d5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b05feXPZ3apphQxTxrxWgfNP3iO/wjyZxV5mXVldZE8=;
 b=KMnWyI0g+ugr3IinfcZJFKElhXJwtQqnlaktfOcub9L6Co3mK5evh7TZ+/b0nAdjBo
 zip0aqAy8ivUwXlv8jFVhuoCoshgDnidLp6m5RE/9Wt6oxHGodKC9DSCosobZsmU+QtK
 dEzEHEOvqw2lyZwpXCSfOVhPnI54eBKkj/wRUSNo3iH9ruj/1sv7K5zHR+DjyK/YJQeJ
 Xdvyyz1bjb2Dlfa/uh1bGe92f5lBj+zSZLUGVZ0LROBL8v0+G7QbyDBgq3+FM1b/qXEm
 3DfCHoxljxVrlP6q4jFopNWQKByLjKHYmTm/d6NxgdJjCdxtt/PVkiXLSUU+r7Rqvahu
 86CA==
X-Gm-Message-State: ACrzQf2Wot9DL7lNujsqftV3UZwOCRt8MjaTWDEAcggDgHJphRb4rgdN
 A4RLe/JvTwengcW8qZmdVQF/k5Z6AwYG1A==
X-Google-Smtp-Source: AMsMyM4IKRUMsF00czO5nFm1imSn13tPVRF6Er0efSaeHQdtZVwZytGSSw7WkHagx3HFeiMV+Gg4iQ==
X-Received: by 2002:a05:6000:684:b0:236:839f:9276 with SMTP id
 bo4-20020a056000068400b00236839f9276mr22597588wrb.586.1667583400044; 
 Fri, 04 Nov 2022 10:36:40 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6e90000000b002366d1cc198sm3785701wrz.41.2022.11.04.10.36.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 10:36:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 1/5] linux-user/strace: Constify struct flags
Date: Fri,  4 Nov 2022 18:36:28 +0100
Message-Id: <20221104173632.1052-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104173632.1052-1-philmd@linaro.org>
References: <20221104173632.1052-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

print_flags() takes a const pointer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/strace.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9ae5a812cd..25c47f0316 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -945,7 +945,7 @@ print_syscall_ret_ioctl(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
-UNUSED static struct flags access_flags[] = {
+UNUSED static const struct flags access_flags[] = {
     FLAG_GENERIC(F_OK),
     FLAG_GENERIC(R_OK),
     FLAG_GENERIC(W_OK),
@@ -953,7 +953,7 @@ UNUSED static struct flags access_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags at_file_flags[] = {
+UNUSED static const struct flags at_file_flags[] = {
 #ifdef AT_EACCESS
     FLAG_GENERIC(AT_EACCESS),
 #endif
@@ -963,14 +963,14 @@ UNUSED static struct flags at_file_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags unlinkat_flags[] = {
+UNUSED static const struct flags unlinkat_flags[] = {
 #ifdef AT_REMOVEDIR
     FLAG_GENERIC(AT_REMOVEDIR),
 #endif
     FLAG_END,
 };
 
-UNUSED static struct flags mode_flags[] = {
+UNUSED static const struct flags mode_flags[] = {
     FLAG_GENERIC(S_IFSOCK),
     FLAG_GENERIC(S_IFLNK),
     FLAG_GENERIC(S_IFREG),
@@ -981,14 +981,14 @@ UNUSED static struct flags mode_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags open_access_flags[] = {
+UNUSED static const struct flags open_access_flags[] = {
     FLAG_TARGET(O_RDONLY),
     FLAG_TARGET(O_WRONLY),
     FLAG_TARGET(O_RDWR),
     FLAG_END,
 };
 
-UNUSED static struct flags open_flags[] = {
+UNUSED static const struct flags open_flags[] = {
     FLAG_TARGET(O_APPEND),
     FLAG_TARGET(O_CREAT),
     FLAG_TARGET(O_DIRECTORY),
@@ -1019,7 +1019,7 @@ UNUSED static struct flags open_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mount_flags[] = {
+UNUSED static const struct flags mount_flags[] = {
 #ifdef MS_BIND
     FLAG_GENERIC(MS_BIND),
 #endif
@@ -1044,7 +1044,7 @@ UNUSED static struct flags mount_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags umount2_flags[] = {
+UNUSED static const struct flags umount2_flags[] = {
 #ifdef MNT_FORCE
     FLAG_GENERIC(MNT_FORCE),
 #endif
@@ -1057,7 +1057,7 @@ UNUSED static struct flags umount2_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mmap_prot_flags[] = {
+UNUSED static const struct flags mmap_prot_flags[] = {
     FLAG_GENERIC(PROT_NONE),
     FLAG_GENERIC(PROT_EXEC),
     FLAG_GENERIC(PROT_READ),
@@ -1068,7 +1068,7 @@ UNUSED static struct flags mmap_prot_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mmap_flags[] = {
+UNUSED static const struct flags mmap_flags[] = {
     FLAG_TARGET(MAP_SHARED),
     FLAG_TARGET(MAP_PRIVATE),
     FLAG_TARGET(MAP_ANONYMOUS),
@@ -1092,7 +1092,7 @@ UNUSED static struct flags mmap_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags clone_flags[] = {
+UNUSED static const struct flags clone_flags[] = {
     FLAG_GENERIC(CLONE_VM),
     FLAG_GENERIC(CLONE_FS),
     FLAG_GENERIC(CLONE_FILES),
@@ -1136,7 +1136,7 @@ UNUSED static struct flags clone_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags msg_flags[] = {
+UNUSED static const struct flags msg_flags[] = {
     /* send */
     FLAG_GENERIC(MSG_CONFIRM),
     FLAG_GENERIC(MSG_DONTROUTE),
@@ -1156,7 +1156,7 @@ UNUSED static struct flags msg_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags statx_flags[] = {
+UNUSED static const struct flags statx_flags[] = {
 #ifdef AT_EMPTY_PATH
     FLAG_GENERIC(AT_EMPTY_PATH),
 #endif
@@ -1178,7 +1178,7 @@ UNUSED static struct flags statx_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags statx_mask[] = {
+UNUSED static const struct flags statx_mask[] = {
 /* This must come first, because it includes everything.  */
 #ifdef STATX_ALL
     FLAG_GENERIC(STATX_ALL),
@@ -1226,7 +1226,7 @@ UNUSED static struct flags statx_mask[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags falloc_flags[] = {
+UNUSED static const struct flags falloc_flags[] = {
     FLAG_GENERIC(FALLOC_FL_KEEP_SIZE),
     FLAG_GENERIC(FALLOC_FL_PUNCH_HOLE),
 #ifdef FALLOC_FL_NO_HIDE_STALE
@@ -1246,7 +1246,7 @@ UNUSED static struct flags falloc_flags[] = {
 #endif
 };
 
-UNUSED static struct flags termios_iflags[] = {
+UNUSED static const struct flags termios_iflags[] = {
     FLAG_TARGET(IGNBRK),
     FLAG_TARGET(BRKINT),
     FLAG_TARGET(IGNPAR),
@@ -1265,7 +1265,7 @@ UNUSED static struct flags termios_iflags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags termios_oflags[] = {
+UNUSED static const struct flags termios_oflags[] = {
     FLAG_TARGET(OPOST),
     FLAG_TARGET(OLCUC),
     FLAG_TARGET(ONLCR),
@@ -1349,7 +1349,7 @@ UNUSED static struct enums termios_cflags_CSIZE[] = {
     ENUM_END,
 };
 
-UNUSED static struct flags termios_cflags[] = {
+UNUSED static const struct flags termios_cflags[] = {
     FLAG_TARGET(CSTOPB),
     FLAG_TARGET(CREAD),
     FLAG_TARGET(PARENB),
@@ -1360,7 +1360,7 @@ UNUSED static struct flags termios_cflags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags termios_lflags[] = {
+UNUSED static const struct flags termios_lflags[] = {
     FLAG_TARGET(ISIG),
     FLAG_TARGET(ICANON),
     FLAG_TARGET(XCASE),
@@ -1380,7 +1380,7 @@ UNUSED static struct flags termios_lflags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mlockall_flags[] = {
+UNUSED static const struct flags mlockall_flags[] = {
     FLAG_TARGET(MCL_CURRENT),
     FLAG_TARGET(MCL_FUTURE),
 #ifdef MCL_ONFAULT
-- 
2.38.1


