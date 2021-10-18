Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0743239F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:17:07 +0200 (CEST)
Received: from localhost ([::1]:33114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVJy-0002k3-G6
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8r-0007h2-JA
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:40 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:38893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8d-0007v4-9b
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:34 -0400
Received: by mail-io1-xd2f.google.com with SMTP id d125so16902570iof.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HtwVDX1R8x/iIkXmhDg1eKqW+vr6lINlT34yLQI9FPs=;
 b=dXaOrdvzjnUwMtC3iP30dzPASMqwZC7jXA71r83ajvmtAu6NlAnVI3idmbCqbRTouT
 HTRlp5dQnS8N0CVIImTSIewwA4uE4Yji1yleA7ozXqlc9m+nEFaN8ql0K0dIdQ9M9f7Z
 vUhaE7vcNAN/fBY66CWle3GOjWwLxs7v/ae8MnwFiNLqQvy4kKAGYP4Xbq98qbLKN1SQ
 K3bVqwIweggo9lAjD+9Ae5061O7yjPKLJSsX6A+b0d0jYwAeKXpXQ4FYT8WmoFa+aAT6
 BHQQK5DatalsImm6dlfXUFolnK0bn/x4vOuW4mG1AuHjiW+gYOxfXdGD+LmwpwyPUm0e
 IDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtwVDX1R8x/iIkXmhDg1eKqW+vr6lINlT34yLQI9FPs=;
 b=TXkE/W3hCPUsEQWNt1qi7TBG0ZNeQ+SvZaq8iYB3ENuEWbNgBosirRb665sYw3q+uM
 8j5SLfmmN50JUJIaIa0icr+1p1vZ1+8bQ/bAUmR1KbqfQZTokUlUAR+nTDl19gu4Lurb
 PsSPRJ7KlB25pOHuTHsfOkXFqghgJ2kEf8kcoSBh57qsxCaEMnQObSOGZncy0UTQD+kQ
 gOexOLArvlTTPkbqWtcAPEx155tXZm8K+ucwWN77lw2+52bU9dKh0oYrEw0EDY2cT2ai
 rs/Hg0F7RlgTuVWlk2xBc8X+U+uu5rzpzdNPUvgGDFRUlItF0d7lzJneKJx8o4heou/F
 UKeQ==
X-Gm-Message-State: AOAM533DkoX/n50uw349A9LEi3JWCQMR02jV4iBxTJ4qkiufAI6Wj8nO
 fZYnjAYybbEZuvXzt9WSz5NOt44g/FNYvw==
X-Google-Smtp-Source: ABdhPJx18RoolZCa1rM8qZjbZroq1p6JJoNHpm+CmvJZcZkY9H5+VQOgaZ78v4S6d0e208nhtroqvA==
X-Received: by 2002:a05:6602:2e95:: with SMTP id
 m21mr15244226iow.21.1634573121960; 
 Mon, 18 Oct 2021 09:05:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] bsd-user/mmap.c: Don't mmap fd == -1 independently from
 MAP_ANON flag
Date: Mon, 18 Oct 2021 10:04:42 -0600
Message-Id: <20211018160458.1976-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, Guy Yur <guyyur@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guy Yur <guyyur@gmail.com>

Switch checks for !(flags & MAP_ANONYMOUS) with checks for fd != -1.
MAP_STACK and MAP_GUARD both require fd == -1 and don't require mapping
the fd either. Add analysis from Guy Yur detailing the different cases
for MAP_GUARD and MAP_STACK.

Signed-off-by: Guy Yur <guyyur@gmail.com>
[ partially merged before, finishing the job and documenting origin]
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c   | 30 +++++++++++++++++++++++++-----
 roms/seabios-hppa |  2 +-
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index face98573f..4ecd949a10 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -127,7 +127,27 @@ error:
     return ret;
 }
 
-/* map an incomplete host page */
+/*
+ * map an incomplete host page
+ *
+ * mmap_frag can be called with a valid fd, if flags doesn't contain one of
+ * MAP_ANON, MAP_STACK, MAP_GUARD. If we need to map a page in those cases, we
+ * pass fd == -1. However, if flags contains MAP_GUARD then MAP_ANON cannot be
+ * added.
+ *
+ * * If fd is valid (not -1) we want to map the pages with MAP_ANON.
+ * * If flags contains MAP_GUARD we don't want to add MAP_ANON because it
+ *   will be rejected.  See kern_mmap's enforcing of constraints for MAP_GUARD
+ *   in sys/vm/vm_mmap.c.
+ * * If flags contains MAP_ANON it doesn't matter if we add it or not.
+ * * If flags contains MAP_STACK, mmap adds MAP_ANON when called so doesn't
+ *   matter if we add it or not either. See enforcing of constraints for
+ *   MAP_STACK in kern_mmap.
+ *
+ * Don't add MAP_ANON for the flags that use fd == -1 without specifying the
+ * flags directly, with the assumption that future flags that require fd == -1
+ * will also not require MAP_ANON.
+ */
 static int mmap_frag(abi_ulong real_start,
                      abi_ulong start, abi_ulong end,
                      int prot, int flags, int fd, abi_ulong offset)
@@ -147,9 +167,9 @@ static int mmap_frag(abi_ulong real_start,
     }
 
     if (prot1 == 0) {
-        /* no page was there, so we allocate one */
+        /* no page was there, so we allocate one. See also above. */
         void *p = mmap(host_start, qemu_host_page_size, prot,
-                       flags | MAP_ANON, -1, 0);
+                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
         if (p == MAP_FAILED)
             return -1;
         prot1 = prot;
@@ -157,7 +177,7 @@ static int mmap_frag(abi_ulong real_start,
     prot1 &= PAGE_BITS;
 
     prot_new = prot | prot1;
-    if (!(flags & MAP_ANON)) {
+    if (fd != -1) {
         /* msync() won't work here, so we return an error if write is
            possible while it is a shared mapping */
         if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
@@ -565,7 +585,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          * worst case: we cannot map the file because the offset is not
          * aligned, so we read it
          */
-        if (!(flags & MAP_ANON) &&
+        if (fd != -1 &&
             (offset & ~qemu_host_page_mask) != (start & ~qemu_host_page_mask)) {
             /*
              * msync() won't work here, so we return an error if write is
diff --git a/roms/seabios-hppa b/roms/seabios-hppa
index b12acac4be..73b740f771 160000
--- a/roms/seabios-hppa
+++ b/roms/seabios-hppa
@@ -1 +1 @@
-Subproject commit b12acac4be27b6d5d9fbe48c4be1286dcc245fbb
+Subproject commit 73b740f77190643b2ada5ee97a9a108c6ef2a37b
-- 
2.32.0


