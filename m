Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599B432756
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:12:10 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY3N-0006hH-MG
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtL-0007z4-1k
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:48 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtI-0001Zy-BJ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:46 -0400
Received: by mail-il1-x132.google.com with SMTP id g2so15997576ild.1
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64uP86lLO6D5epKoICdnCmOVA/U9XxsL32Tuch8fnPI=;
 b=0YOE2pezWZKQrglheK2JyPphX7Repp2NkjkzkF116maZ6Bwn3v231LVFGRZWK/YNrD
 BwfXKTAS5/nCBCR8anjvS9LE3zIZbIGiCkcLUnQ3WTJTzuUU/4MMM+VtLMEpYP3wC2ot
 1bk/jtXc4ZCscU8omA9Wp4JO8UxprsvoSTCCqjnpFEDCYc51FRbFDVQ3+ES/g4r5JIHg
 u1lsghkS8xZK5Qelb1BKuQV5Wdfjs2WXxNkspg84PF3TUsiUBYsovLZdNvN98SCKC6GG
 lNb7jRVmKaHi03Z9Zr1Y3w8OIp87sC6PrPno8dU1/3BSia7nn268iAuveeiCjlyjQhkZ
 jrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64uP86lLO6D5epKoICdnCmOVA/U9XxsL32Tuch8fnPI=;
 b=bAncqqDjwGe7IhYXyWzs5D8g/YgtFLEf8K08Jli3H/g23Nx/vcrC2T+QGej9hC9A8d
 tMo8zt8buUYVSlMuI46EFIWwDiZglhoLIJ14q/xSBxFDQKrgu0zkLeE8gMKIlic/DOoP
 4thKx3PYr81ecl1NtJfMWDBLgIxQB4BaC/Q3WDHspOS1F+pT9XVhCYpKgeOKIJUp9zqS
 wBBlV3nEZ3YYmbNUc67dq1+9P53sl7LEyweqmFW2Uzh2A46Mg1QVqZQJid7nODC8AVDH
 WqhYe1zH7s98tz9fr+b8WPP6IGaiVvJ3A4WM/kgbCJ/Cf876xzlPn4tXxENCYqtQuCQn
 cHkA==
X-Gm-Message-State: AOAM5324Rq+PiFH0gpfzrD+m26wC2JuBTHV3JP8bgG0yDkjIJ7rp7ANr
 e9cGqB7nbfg1hozJz23EUb38BunZEkWnEw==
X-Google-Smtp-Source: ABdhPJwjKJaplhZBsplQBVnfwaEDJbcgyLCJa7HaGuLCXRIhc8wFlkEzBXwGuyd8htb/6X4+H2yjzw==
X-Received: by 2002:a05:6e02:120f:: with SMTP id
 a15mr7893991ilq.109.1634583702247; 
 Mon, 18 Oct 2021 12:01:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/23] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
Date: Mon, 18 Oct 2021 13:00:59 -0600
Message-Id: <20211018190115.5365-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
 bsd-user/mmap.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

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
-- 
2.32.0


