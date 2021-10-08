Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3581427313
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:29:58 +0200 (CEST)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxRF-0004f3-NV
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLe-0003Lh-4r
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:10 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:36789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLc-0007gu-Ha
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:09 -0400
Received: by mail-io1-xd2d.google.com with SMTP id e144so12198936iof.3
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FSmgGGa3oZMyK2O7LtPwzHk7PXI/hjwdJDle7ItjGLQ=;
 b=uCmXVjqScyWtFiwE3HbnOuqZW+IojCyxpkVBl/Y45hn9DByl/u4gpxlZ9QjWvxjr+t
 OxkZWiW7+99tgm2DkMPfR1NlC4tkfLx5f/oxa/3jRiQOCVcAquf2SsgggykI6SiSPQji
 xqtcGYfvow4b71Lmd/d2xiXUYahDonKAjCXRiGgFm/ClehZZXl5x2WkfMbBGM0wrllTG
 SQMHobU3aTttH1IeAADt3ce1x3uSSqhcsDf01LlN+0UifsfGwcKIaHcUPuaJ/123eRd9
 Gxx40vIr3zHYIbMsHgT2Bq5P7Qi9sqMIt2YfJ25yWYMtlOhLE2iYAcbkUUqOqsc38Bnq
 m5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FSmgGGa3oZMyK2O7LtPwzHk7PXI/hjwdJDle7ItjGLQ=;
 b=JVfd1ObxLTQxye/Kf8xDC+1GdDkSfgkFcrzP/oFTYpaRngMRLj4QCSwvW1ZsH2Yidj
 XEZZgBvHJ+MsCsOAgkCID4n8fOrNIP+VUt0/7Qw1PZfcLsFet9rNQCKsuHNCdZ5Otwuq
 rvhlshS/VANg0a++u66R0Q6k0EmokWRaU7o7ggBiIecUhP4YVEtvXbEMdiZ5lv/frGBf
 +QmelSW2VxdK1CafCp5L6FrKWY3/TqKTj1R66eThD9Fm7/yYIywSupusmBSQOdPJzXFK
 2yn1cqfBoLpsOg1Ls97+ksIk+S5kSE48IhwO51ZvOmJcZD5LCrm1nMPNEwB/AgZZjmUL
 +nQw==
X-Gm-Message-State: AOAM533keQtCMB4oS8eK5E85ROOX08JW++3zUqxw+jPbEfAt6znKCZbJ
 2GEpwyy5kWAsRTAtQrA8nPux3G3henHyaA==
X-Google-Smtp-Source: ABdhPJybBCT+NjjFHOWxCAw+oS9wIVsDtPBmr/MsnwUmh2buix+5p9eHwVjE0pMkxpOjtIfKbWFh/g==
X-Received: by 2002:a5e:d80a:: with SMTP id l10mr9431148iok.182.1633728247197; 
 Fri, 08 Oct 2021 14:24:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] bsd-user/mmap.c: Implement MAP_EXCL,
 required by jemalloc in head
Date: Fri,  8 Oct 2021 15:23:43 -0600
Message-Id: <20211008212344.95537-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
mapped when specified. In addition, use guest_range_valid_untagged to
test for valid ranges of pages rather than an incomplete inlined version
of the test that might be wrong.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 4ecd949a10..066d9c10ff 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -403,7 +403,7 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                      int flags, int fd, off_t offset)
 {
-    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
+    abi_ulong addr, ret, end, real_start, real_end, retaddr, host_offset, host_len;
 
     mmap_lock();
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
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


