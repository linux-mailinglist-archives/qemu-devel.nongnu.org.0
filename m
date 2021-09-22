Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C994141410B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:05:44 +0200 (CEST)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuRz-0002p1-Sl
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJR-0006eM-QK
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:53 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:38528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJP-0007la-8o
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:53 -0400
Received: by mail-il1-x12d.google.com with SMTP id q14so1396755ils.5
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8zddKgxB/r1xtG4kOIay5xz4CGP8S2d6NnpCOHxg/As=;
 b=lBoHbiBBOUu4SI1aGIpSm9zqNRjGHddwCJ7nr3ty5mPA/fwRmXnjEgujKZ8+d6oEd3
 DHvLT3DZcizHWqrYdMrx7gayLUx0oTep2PZUBGRNxD4eW0hoiANuCRZZ/poalvFWvhWM
 sEkZ6AVq3wUdhvLw6Gqy1iMM26AL1UOn3CDoPUF9UkWn1+wjiH70asQx0IOgBMGO24yt
 1TqTCJdAwPhIzKgVOwJWpMxTSTyAxLkZNA9NmT008dNWVs1BD/O35r9h44MsvbA0+85G
 r8nwi7Ok2662ym8RKiRORgaWQGrJBjHOfGB3E5Bk3FLaujYFoWo9AbIzbzOqYo55RYiZ
 ysBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8zddKgxB/r1xtG4kOIay5xz4CGP8S2d6NnpCOHxg/As=;
 b=La8OWpDqvJAC/03uZWxMw0i1AZOWdzu2+5GPMNt5CTTwowNU/A2aU08V69aaQuIHnW
 druH2sSloiECeK2ZGBEel/b80o51jhNyjY2iTboBK2bTPLLdbkr6rG8iGJDwybWsMFNX
 0h0wU5iMMUHK43L/jc1BYCln9yQDnf646f9Q0wRNpkXL+iqGeaGEQG9gbv3gM9HJKa2j
 p6ldoAeGalC+XH6pCb2sD0DI7bSi5dEVSkv2HRzERrpEC0JrN0xDNy5CH37wpNAIltwG
 BhWtinrCG3WRG8EAfYPE24F+20DACCsMPg04fPFgmtupjPQBIiAaMgQdPj+KpKDYWXhQ
 S11g==
X-Gm-Message-State: AOAM530wkC/Mbhx2XgeQ/mHsyIq79VN2yw6ODIP66mwn93beQvtsJGB9
 PWN9v/+y3lTKSmNGDoMmtMK9zKVmZSACxc+Ahoc=
X-Google-Smtp-Source: ABdhPJwKKskQv7jWSNijDaDQTDMUKv+/65ONpAnm/ZUthbLBO7PuBfIlVK3sZKEpIrDs2m8lGyFTVw==
X-Received: by 2002:a05:6e02:1b0c:: with SMTP id
 i12mr21181150ilv.27.1632286609929; 
 Tue, 21 Sep 2021 21:56:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
Date: Tue, 21 Sep 2021 22:56:34 -0600
Message-Id: <20210922045636.25206-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: kevans@freebsd.org, Guy Yur <guyyur@gmail.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guy Yur <guyyur@gmail.com>

Switch checks for !(flags & MAP_ANONYMOUS) with checks for fd != -1.
MAP_STACK and MAP_GUARD both require fd == -1 and don't require mapping
the fd either.

Signed-off-by: Guy Yur <guyyur@gmail.com>
[ partially merged before, finishing the job and documenting origin]
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 8b763fffc3..347d314aa9 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -154,7 +154,7 @@ static int mmap_frag(abi_ulong real_start,
     if (prot1 == 0) {
         /* no page was there, so we allocate one */
         void *p = mmap(host_start, qemu_host_page_size, prot,
-                       flags | MAP_ANON, -1, 0);
+                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
         if (p == MAP_FAILED)
             return -1;
         prot1 = prot;
@@ -162,7 +162,7 @@ static int mmap_frag(abi_ulong real_start,
     prot1 &= PAGE_BITS;
 
     prot_new = prot | prot1;
-    if (!(flags & MAP_ANON)) {
+    if (fd != -1) {
         /* msync() won't work here, so we return an error if write is
            possible while it is a shared mapping */
         if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
@@ -571,7 +571,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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


