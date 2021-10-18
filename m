Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC35432383
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:10:00 +0200 (CEST)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVD5-00084g-Fo
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8r-0007h6-KA
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:40 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:44607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8e-0007wh-9K
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:34 -0400
Received: by mail-io1-xd2b.google.com with SMTP id r134so16869800iod.11
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTIN4b3FESvsd1eFe8zoLs4gxknToUOMeY0gNeMUPFs=;
 b=PAugW3vWzIgeTbPyHglxYhbhRMX8CbAtT1rFTS3Kvb7YHXYCgENuf6TDLpxE7BiTAb
 cAgHW8xSjiyeaDivBvMoSsU7SnIl2W7M301LGDbWTpH5TQJ/hsiGGkpi8LBllxrfR2uT
 JSN0Jrc2roVnfFV4oJfxGOHsIQRWNS+x42BYAit3MVe5Lza6aigGSF+Fc3iQ/QRp+Dd4
 40THmAJm930+1qy6Qe+HSNw9c3LtWUe0T+XzWU11WPRUSKWYLy8ossJX5tg5PkVrPSUh
 LMGAarYaO0juSA7mwJKgWqC4IqU8lTbX3qNoX9fPORNZz+EjNqBnoxGzi3Lgh04RgX0K
 XCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mTIN4b3FESvsd1eFe8zoLs4gxknToUOMeY0gNeMUPFs=;
 b=JjKLqzgQnb8xDad3rdza621045relH2K1tORTUqpSsW3O9xfVdX4V+RjJYhi5UivsP
 h6DHrwLq0u5jWp5vxp+1p4SDaZfQFTQOkDMBzVj8prK7x0/QiggRxb8PU48GkcbMMpe5
 L1I1oiR3lHHcqRP2sK6Y9knkEitOTpXlffQ+0eHAMWPSjZDVf+ViIvDfPJ58f2Gotu3d
 w3bAuvcnTFpS6p4Xtgqdj/vIlbUEAaBLgy1UOwiBHybUzGHyT8/M3hlbACfkw3lSnc2Z
 FUjmDuR016gT9tO8GdMmHiGUw9rjibg7aoUfheR+mO/goh4WJD3LTfnSGbx26ieGo24z
 VqMQ==
X-Gm-Message-State: AOAM5310jUOIWgmsRZVcM+0S4JnqaJrspbbHYQvHWGUu3RwImwdhQ94E
 sKCZfrGEkd63lsAi1tYpwabrhmChWYOovA==
X-Google-Smtp-Source: ABdhPJxy8+igDKIUhDBm5kXtd7Ko7ePOoYGg4YdYQ5Py7DpUMPQ9Bm3woCCmq4OgaixUJ4BkywcLpA==
X-Received: by 2002:a05:6602:15d3:: with SMTP id
 f19mr15162905iow.161.1634573122954; 
 Mon, 18 Oct 2021 09:05:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/23] bsd-user/mmap.c: Implement MAP_EXCL,
 required by jemalloc in head
Date: Mon, 18 Oct 2021 10:04:43 -0600
Message-Id: <20211018160458.1976-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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


