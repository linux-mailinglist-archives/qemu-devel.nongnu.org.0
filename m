Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6908B682A09
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:13:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndB-0002ck-6Y; Tue, 31 Jan 2023 05:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncv-0002MH-OR
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncr-0002W3-Kp
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/auq4cmKyEFOdYRggbmmDp/HswsdSdzS6ygKdJhIPl0=;
 b=QoKQpA4+rwOwcioHneCorR+HAVw1DvRhk98L8p/DI3Y/+u49607S1ClTaOK27iXFwJwdSd
 vJWvxB0+c4o425PuTejspDFsYWRyVJOJdsiP53SZtPruoB4FWNO8IojQw7pZ4Ao8fjWVDc
 gLyZcxShm069yXliT0nMguyrp0cvUjI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-vgffzHFfM6qqOoCKcI6qIQ-1; Tue, 31 Jan 2023 05:12:21 -0500
X-MC-Unique: vgffzHFfM6qqOoCKcI6qIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689AA805F4C;
 Tue, 31 Jan 2023 10:12:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76A2DC15BAD;
 Tue, 31 Jan 2023 10:12:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/27] qemu/bswap: Remove <byteswap.h> dependency
Date: Tue, 31 Jan 2023 11:11:49 +0100
Message-Id: <20230131101205.1499867-12-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit efc6c070aca ("configure: Add a test for the minimum
compiler version") the minimum compiler version required for GCC
is 4.8, which supports __builtin_bswap().
Drop the <byteswap.h> dependency.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230111163147.71761-4-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build          |  2 --
 include/qemu/bswap.h | 21 ---------------------
 2 files changed, 23 deletions(-)

diff --git a/meson.build b/meson.build
index 6d3b665629..7e15a010bf 100644
--- a/meson.build
+++ b/meson.build
@@ -2013,8 +2013,6 @@ if rdma.found()
 endif
 
 # has_header_symbol
-config_host_data.set('CONFIG_BYTESWAP_H',
-                     cc.has_header_symbol('byteswap.h', 'bswap_32'))
 config_host_data.set('CONFIG_EPOLL_CREATE1',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
 config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index d2dafdc54c..fd5a98125a 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -8,9 +8,6 @@
 # include <sys/endian.h>
 #elif defined(__HAIKU__)
 # include <endian.h>
-#elif defined(CONFIG_BYTESWAP_H)
-# include <byteswap.h>
-#define BSWAP_FROM_BYTESWAP
 # else
 #define BSWAP_FROM_FALLBACKS
 #endif /* ! CONFIG_MACHINE_BSWAP_H */
@@ -19,23 +16,6 @@
 extern "C" {
 #endif
 
-#ifdef BSWAP_FROM_BYTESWAP
-static inline uint16_t bswap16(uint16_t x)
-{
-    return bswap_16(x);
-}
-
-static inline uint32_t bswap32(uint32_t x)
-{
-    return bswap_32(x);
-}
-
-static inline uint64_t bswap64(uint64_t x)
-{
-    return bswap_64(x);
-}
-#endif
-
 #ifdef BSWAP_FROM_FALLBACKS
 #undef  bswap16
 #define bswap16(_x) __builtin_bswap16(_x)
@@ -45,7 +25,6 @@ static inline uint64_t bswap64(uint64_t x)
 #define bswap64(_x) __builtin_bswap64(_x)
 #endif
 
-#undef BSWAP_FROM_BYTESWAP
 #undef BSWAP_FROM_FALLBACKS
 
 static inline void bswap16s(uint16_t *s)
-- 
2.31.1


