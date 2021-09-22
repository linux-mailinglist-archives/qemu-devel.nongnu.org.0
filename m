Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012641410C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:05:45 +0200 (CEST)
Received: from localhost ([::1]:35576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuS0-0002qq-0O
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJR-0006dV-GR
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:53 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJQ-0007mz-3K
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:53 -0400
Received: by mail-il1-x12f.google.com with SMTP id x2so1342636ila.11
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s72+aTPZAn9ZTqiCPxAk83JsUBHPYoFS2ZpQR76dmdA=;
 b=ZGcG6cgueoxFPRwolgMleYimVoUH7coFXayDGqCoMrmmH4Ph1Ou2BdOLK9IJ0j8pCY
 bkKD9S5iQCkPqKDxs6KfIiVyNaO4OKrMAfGmnxh33chZa0oK4neh/PcyFu77eWo+VND6
 IicyIUY3nFn+ArqazBBLeotKNivRysDjgYxTwPFHapZUNeibux5GdreydBUIwrNN5OJS
 OXSqCvl0cbiOlWtqPd9e6SEPiuAUWzKEpIF8snrBXks1qvo/qDXxMnzMW2Y0LJDlJ/2P
 LRqVMXCONRNJe6L4Lp/gsWs8h03b/Z7VXZAzA6CexH1k8rsAu0ERxqLvOzyWVP04RLJn
 DvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s72+aTPZAn9ZTqiCPxAk83JsUBHPYoFS2ZpQR76dmdA=;
 b=dDzECK6sY7c3xH3dSlWHc/Uhcnitm6jHz3bDjJYs0K8J8fObv86Ut+7kU2p5j2vpyi
 DM0MRICTjUNLWFRWwSoDYk5bCd35IkzgiYPpERAX0SomWUzhOLadW1rLeFRsysesUblW
 wMtN4My4RwlMhkICV0RbufIZRZL9KJiXOkgSSZvoXQNLLN4GYOeibNQNp5QVNB6kfRZH
 Oo30poN71eFEO8S8D7mrIm+M1nUmX46Y5afKpXZVbts9XZbMuiwn1kAq2l/MWvF95zWN
 bLQpF3M5tTx/XMvd8lod8N4KILJ1lTy+pmHwPo03j39sEvEFZnJIbza7jzYfNc7INLq5
 RNjA==
X-Gm-Message-State: AOAM532ciQ0TyRMEqKBURxe3aO1Gh4maT+TuDbVevDDiynj3q0okIPSu
 3PF6cFoiLQCeZSnOFdhYT98QBhFRjZxJbyghqJg=
X-Google-Smtp-Source: ABdhPJxM5MvX2Y8NazTti1X96mQ/dSjgf7MYv6IT/juf12WFJz0DYoj59n+J14BHxVvSZ0PjeooSMA==
X-Received: by 2002:a92:b301:: with SMTP id p1mr23088388ilh.10.1632286610783; 
 Tue, 21 Sep 2021 21:56:50 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:50 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] bsd-user/mmap.c: Implement MAP_EXCL,
 required by jemalloc in head
Date: Tue, 21 Sep 2021 22:56:35 -0600
Message-Id: <20210922045636.25206-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kyle Evans <kevans@FreeBSD.org>

jemalloc requires a working MAP_EXCL. Ensure that no page is double
mapped when specified.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 347d314aa9..792ff00548 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -387,7 +387,7 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                      int flags, int fd, off_t offset)
 {
-    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
+    abi_ulong addr, ret, end, real_start, real_end, retaddr, host_offset, host_len;
 
     mmap_lock();
 #ifdef DEBUG_MMAP
@@ -599,6 +599,14 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             goto the_end;
         }
 
+        /* Reject the mapping if any page within the range is mapped */
+        if (flags & MAP_EXCL) {
+            for (addr = start; addr < end; addr++) {
+                if (page_get_flags(addr) != 0)
+                    goto fail;
+            }
+        }
+
         /* handle the start of the mapping */
         if (start > real_start) {
             if (real_end == real_start + qemu_host_page_size) {
-- 
2.32.0


