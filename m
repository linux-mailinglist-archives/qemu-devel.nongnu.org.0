Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC543271C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:08:18 +0200 (CEST)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXzd-0008C9-8Y
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtK-0007y5-Cm
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:46 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtI-0001bm-Uk
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:46 -0400
Received: by mail-il1-x12c.google.com with SMTP id x1so15976791ilv.4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTIN4b3FESvsd1eFe8zoLs4gxknToUOMeY0gNeMUPFs=;
 b=rlxpALaJKUyzevqVo2CiRro7kgJg/tl5px7a60DzbgeiCshY//h983INAmq0q+SEJ0
 b42cAska3N9CRSQhRtdKf2kpD1HlTh5RNce0cvdH40sZnG63xh4o9iEX7Ybu0TCxUAUx
 yuqt6OAidl/WzHP5olA6jS8MZ4Dn4zMhFXaAmdeT+6aHDyyx8BXjGdK9kAPJFfc5QZh9
 dnyM3MYF+CmN422Q6PfqT1T/cPiNEH9Jp21OADHVImWakjG9kWEW9gT87HnBsRBYteOH
 O6BIUavKjttsSdhyGPtkxaYjcitnJUF6VyZafOE3j2yUKpa4rFar4LB8F/LNu1N8kc3K
 4k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mTIN4b3FESvsd1eFe8zoLs4gxknToUOMeY0gNeMUPFs=;
 b=JL002VT+ls1WmauiMWDMUqM8GFiMdqgP5HnnBURt/jqfOcwa9jbCPmmhV/Be/Qknyp
 6jusma0gIBtUQHvhNGcvkRk4huE9RKDt54Y93vT5Fn4Gge40p6IijwPIT7bb6oCATdTl
 p8e70mhoLJquFQyVyE+InkOOQKnKtNh+cMd0S+yLwusk3m0fswl7pt+UGCCEN4ls7bKM
 2jn1n2r5acjEKgt3HRkNEt4Cwei4b8fv3LHwezFFUvtSgpLvQuWQKj7Id3n3wEnUVZ4T
 EhfkhqX3tTWOFm4FO3leuEznnpk8zoAYAZBIhAVb++B5UCAVwXSoLIbZXdN0EHjUotW8
 2x7A==
X-Gm-Message-State: AOAM5319QED99CAx9ZMLdwQOeXgzoRnNjOPN4hW434qCnlUjKoN0RC3s
 YcGu0MpekKXGD4yYUotsTK9qdJHvR+mJpw==
X-Google-Smtp-Source: ABdhPJzq/DprL8sI6kkN8uvKTL64zmkxhnLJF0uFyt8JzsLgqamkMRl31tFGB0gO9Sy3cwaRnYaHqA==
X-Received: by 2002:a92:c241:: with SMTP id k1mr15714676ilo.258.1634583703672; 
 Mon, 18 Oct 2021 12:01:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:43 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/23] bsd-user/mmap.c: Implement MAP_EXCL,
 required by jemalloc in head
Date: Mon, 18 Oct 2021 13:01:00 -0600
Message-Id: <20211018190115.5365-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kyle Evans <kevans@FreeBSD.org>

jemalloc requires a working MAP_EXCL. Ensure that no page is double
mapped when specified. In addition, use guest_range_valid_untagged to
test for valid ranges of pages rather than an incomplete inlined version
of the test that might be wrong.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/mmap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 4ecd949a10..5b6ed5eed1 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -574,12 +574,10 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          * It can fail only on 64-bit host with 32-bit target.
          * On any other target/host host mmap() handles this error correctly.
          */
-#if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
-        if ((unsigned long)start + len - 1 > (abi_ulong) -1) {
+        if (!guest_range_valid_untagged(start, len)) {
             errno = EINVAL;
             goto fail;
         }
-#endif
 
         /*
          * worst case: we cannot map the file because the offset is not
@@ -614,6 +612,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             goto the_end;
         }
 
+        /* Reject the mapping if any page within the range is mapped */
+        if ((flags & MAP_EXCL) && page_check_range(start, len, 0) < 0) {
+            errno = EINVAL;
+            goto fail;
+        }
+
         /* handle the start of the mapping */
         if (start > real_start) {
             if (real_end == real_start + qemu_host_page_size) {
-- 
2.32.0


