Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A36236CF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 23:54:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ostws-0000oC-75; Wed, 09 Nov 2022 17:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tstellar@redhat.com>)
 id 1ostBK-0008MH-Pq
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:04:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tstellar@redhat.com>)
 id 1ostBG-0001y1-HU
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668031461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7RM5k9bBCdCShmyzVORGHgspw4nuUOaq4rWkJ77yW1s=;
 b=Z/svlyjA7+zT3lOJtmiLwe9/Ifbc9CcLXT32YT1uTPZcBakFWaFgctA5WPVQ3hbd1Hw13l
 A8aOKJo20d+PJ9OcPop0TZNO1AjHkB4TmcNjuh+sX4EXgbewcY+dU4BQurSgEl3QbmpWas
 8d9DTd26tRVIgvVeric+N+qH2D5O0vk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-_jYnl-IaMcWlyNIIdWr7Uw-1; Wed, 09 Nov 2022 17:03:15 -0500
X-MC-Unique: _jYnl-IaMcWlyNIIdWr7Uw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E11853803903
 for <qemu-devel@nongnu.org>; Wed,  9 Nov 2022 22:03:14 +0000 (UTC)
Received: from pkg.. (unknown [10.22.34.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4976B40C2086;
 Wed,  9 Nov 2022 22:03:14 +0000 (UTC)
From: Tom Stellard <tstellar@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Tom Stellard <tstellar@redhat.com>
Subject: [PATCH] Use a more portable way to enable target specific functions
Date: Wed,  9 Nov 2022 22:03:07 +0000
Message-Id: <20221109220307.226283-1-tstellar@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=tstellar@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 09 Nov 2022 17:53:31 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This adds function attributes for avx2, sse2, etc. specialized
functions.  These attributes are supported by both clang and gcc and
are necessary in order to build the code with clang.  The existing gcc
specific pragmas were left in place due to a comment in
utils/bufferiszero.c which mentions the pragmas are needed before headers
to work around a bug in gcc <= 4.8.

Signed-off-by: Tom Stellard <tstellar@redhat.com>
---
 meson.build         | 2 +-
 util/bufferiszero.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index cf3e517e56..45573c0e44 100644
--- a/meson.build
+++ b/meson.build
@@ -2323,7 +2323,7 @@ config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
     #pragma GCC target("avx2")
     #include <cpuid.h>
     #include <immintrin.h>
-    static int bar(void *a) {
+    __attribute__((target("avx2"))) static int bar(void *a) {
       __m256i x = *(__m256i *)a;
       return _mm256_testz_si256(x, x);
     }
diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index ec3cd4ca15..e4f5628643 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -75,7 +75,7 @@ buffer_zero_int(const void *buf, size_t len)
 
 /* Note that each of these vectorized functions require len >= 64.  */
 
-static bool
+__attribute__((target("sse2"))) static bool
 buffer_zero_sse2(const void *buf, size_t len)
 {
     __m128i t = _mm_loadu_si128(buf);
@@ -117,7 +117,7 @@ buffer_zero_sse2(const void *buf, size_t len)
 #pragma GCC target("sse4")
 #include <smmintrin.h>
 
-static bool
+__attribute__((target("sse4"))) static bool
 buffer_zero_sse4(const void *buf, size_t len)
 {
     __m128i t = _mm_loadu_si128(buf);
@@ -150,7 +150,7 @@ buffer_zero_sse4(const void *buf, size_t len)
 #pragma GCC target("avx2")
 #include <immintrin.h>
 
-static bool
+__attribute__((target("avx2"))) static bool
 buffer_zero_avx2(const void *buf, size_t len)
 {
     /* Begin with an unaligned head of 32 bytes.  */
@@ -184,7 +184,7 @@ buffer_zero_avx2(const void *buf, size_t len)
 #pragma GCC target("avx512f")
 #include <immintrin.h>
 
-static bool
+__attribute__((target("avx512f"))) static bool
 buffer_zero_avx512(const void *buf, size_t len)
 {
     /* Begin with an unaligned head of 64 bytes.  */
-- 
2.35.3


