Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E51DE8CF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 16:25:53 +0200 (CEST)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc8cS-0005IS-EN
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 10:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jc8bY-0004R8-El
 for qemu-devel@nongnu.org; Fri, 22 May 2020 10:24:56 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:41984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jc8bX-0000BH-Jg
 for qemu-devel@nongnu.org; Fri, 22 May 2020 10:24:56 -0400
Received: by mail-ed1-x544.google.com with SMTP id k19so9393761edv.9
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q9g2hw1e4m0meDSSDGhsHzYZBM3E+e3OyOVzFlX36Xg=;
 b=YmNCOsFnlyZ96ruU4ia2lZvzznbLXilZL0nz0yQPGRqlT3IaNUPwTpKnt/plQlymdX
 GabGsPX+amXe6sec5Fafz/CT840eWCXTW8U01F10gyKJnhIsD8PhZ7NT1p5MJMhhVaHx
 7R6pLns8d0j1wiO7AIvS37F8T4LY2OkZ37JrrEcG0yJw8B+bXJrrXZYuYSYKVHoNSqO5
 snbkcdDqz+FJ0tclrCgcVpwK6coFIoX6ThhYBlzGQEFKJK/eqReStNGFHKkxrNd52BTT
 O+NMWMzCrq2wKTOTfK/8PgBkSo15vpeF7i0laSynnabii90YrVtrcxuvow8qBmWTFzGO
 jmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q9g2hw1e4m0meDSSDGhsHzYZBM3E+e3OyOVzFlX36Xg=;
 b=DWolpLww0GCyF7WUEC5ma3fOvbwAI1cxgXgbAOD8LkQG+USJXV568uJAln6cvmUSVv
 c1Kl6Yucy5MAbZGux9r2K7cz3ry0t08cz/dHU1LyxNRhu47F8tDxz3rLr6enCHjyjQur
 IHUygej7z1L7Q9r1BeEPRZatSp8tKNgKl3b4wpGDAN8b9HsvlhEoA/SijuKydx/HHANj
 +L6VJR3uWbdRo92zhTP55kfLOLSWgdBFyoAL7V/tMsuJ7vDucIP8Uy5tAk6idh9v+EB+
 8/12JBdhM2XH8HFAO6AlsQmgAg/i0sbGmfzlt5nBCBDnGgZ38V7WT1hm+TSby9xjPuQY
 /fig==
X-Gm-Message-State: AOAM531+QV6kkNtsUDeER5qwgGPBBdyaC8AoGogBVsPBZTmUMvb7dIC4
 dyo56uBpCKgUiH6rF239u+NO5Q==
X-Google-Smtp-Source: ABdhPJxKXtxJ4ZUZ6fNusImQyNZiQ5K4NKDJ71sGzOh+d0ls/B3uR9t3mPc7aa7Ij9URjxG3npc41w==
X-Received: by 2002:a05:6402:155:: with SMTP id
 s21mr3092059edu.144.1590157493672; 
 Fri, 22 May 2020 07:24:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y16sm8122483ejq.82.2020.05.22.07.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:24:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 784871FF7E;
 Fri, 22 May 2020 15:24:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: provide fallback pgd_find_hole for bare chroots
Date: Fri, 22 May 2020 15:24:46 +0100
Message-Id: <20200522142446.25581-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running QEMU out of a chroot environment we may not have access
to /proc/self/maps. As there is no other "official" way to introspect
our memory map we need to fall back to the original technique of
repeatedly trying to mmap an address range until we find one that
works.

Fortunately it's not quite as ugly as the original code given we
already re-factored the complications of dealing with the
ARM_COMMPAGE. We do make an attempt to skip over brk() which is about
the only concrete piece of information we have about the address map
at this moment.

Fixes: ee9474303
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/elfload.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 01a9323a637..d6027867a1a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2099,6 +2099,50 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     }
 }
 
+/**
+ * pgd_find_hole_fallback: potential mmap address
+ * @guest_size: size of available space
+ * @brk: location of break
+ * @align: memory alignment
+ *
+ * This is a fallback method for finding a hole in the host address
+ * space if we don't have the benefit of being able to access
+ * /proc/self/map. It can potentially take a very long time as we can
+ * only dumbly iterate up the host address space seeing if the
+ * allocation would work.
+ */
+static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk, long align)
+{
+    uintptr_t base;
+
+    /* Start at the bottom and work our way up */
+    base = mmap_min_addr;
+
+    while (true) {
+        uintptr_t align_start, end;
+        align_start = ROUND_UP(base, align);
+        end = align_start + guest_size;
+
+        /* if brk is anywhere in the range give ourselves some room to grow. */
+        if (align_start <= brk && brk < end) {
+            base += 16 * MiB;
+            continue;
+        } else if (align_start + guest_size < align_start) {
+            /* we have run out of space */
+            return -1;
+        } else {
+            int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE | MAP_FIXED;
+            void * mmap_start = mmap((void *) align_start, guest_size,
+                                     PROT_NONE, flags, -1, 0);
+            if (mmap_start != MAP_FAILED) {
+                munmap((void *) align_start, guest_size);
+                return (uintptr_t) mmap_start;
+            }
+            base += qemu_host_page_size;
+        }
+    }
+}
+
 /* Return value for guest_base, or -1 if no hole found. */
 static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
                                long align)
@@ -2114,6 +2158,10 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     /* Read brk after we've read the maps, which will malloc. */
     brk = (uintptr_t)sbrk(0);
 
+    if (!maps) {
+        return pgd_find_hole_fallback(guest_size, brk, align);
+    }
+
     /* The first hole is before the first map entry. */
     this_start = mmap_min_addr;
 
-- 
2.20.1


