Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283074DAE23
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:17:35 +0100 (CET)
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQij-0001Bx-Ur
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:17:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQMR-00021s-0J
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQMP-0007rA-AI
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AcvHOpQfLrxjZxtg9L5uip3Eh4ZwEQ9hzhPuL9/uwGo=;
 b=M32oW0d3bvp8wYLkG9SITVIgUltcW3rE4AbiaULIhcJC4/Gh44vFq5MoGN8LH8iau7hstg
 ogfHByHrL968M9Vr8KCDLz8bjk7ESPbgmbNm4mvH/ISaavNev+Lnhqi310LeMhfdOpc2Sz
 j9YUzyEQGv578lC+yT9RiKQmA8DbAa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-UG-PMIhzMCe_ut7CCbuIUg-1; Wed, 16 Mar 2022 05:54:27 -0400
X-MC-Unique: UG-PMIhzMCe_ut7CCbuIUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4987C85A5BC
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:54:27 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E120404C33F;
 Wed, 16 Mar 2022 09:54:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 19/27] meson: fix CONFIG_ATOMIC128 check
Date: Wed, 16 Mar 2022 13:54:23 +0400
Message-Id: <20220316095423.2613793-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The current testing code isn't correct and matching QEMU usage:

testfile.c: In function 'main':
testfile.c:5:11: error: incorrect number of arguments to function '__atomic_load'
    5 |       y = __atomic_load(&x, 0);
      |           ^~~~~~~~~~~~~
testfile.c:6:7: error: argument 2 of '__atomic_store' must be a pointer type
    6 |       __atomic_store(&x, y, 0);
      |       ^~~~~~~~~~~~~~
testfile.c:7:7: error: argument 3 of '__atomic_compare_exchange' must be a pointer type
    7 |       __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~

Replace the test with common atomics test for u64 and u128 that matches
better QEMU needs.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index 3b9ff6c05401..1a7335c5fccb 100644
--- a/meson.build
+++ b/meson.build
@@ -1832,21 +1832,23 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
-# See if 64-bit atomic operations are supported.
-# Note that without __atomic builtins, we can only
-# assume atomic loads/stores max at pointer size.
-config_host_data.set('CONFIG_ATOMIC64', cc.links('''
+atomic_test = '''
   #include <stdint.h>
   int main(void)
   {
-    uint64_t x = 0, y = 0;
+    @0@ x = 0, y = 0;
     y = __atomic_load_n(&x, __ATOMIC_RELAXED);
     __atomic_store_n(&x, y, __ATOMIC_RELAXED);
     __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
     __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
     __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
     return 0;
-  }'''))
+  }'''
+
+# See if 64-bit atomic operations are supported.
+# Note that without __atomic builtins, we can only
+# assume atomic loads/stores max at pointer size.
+config_host_data.set('CONFIG_ATOMIC64', cc.links(atomic_test.format('uint64_t')))
 
 has_int128 = cc.links('''
   __int128_t a;
@@ -1861,15 +1863,10 @@ has_int128 = cc.links('''
 config_host_data.set('CONFIG_INT128', has_int128)
 
 if has_int128
-  has_atomic128 = cc.links('''
-    int main(void)
-    {
-      unsigned __int128 x = 0, y = 0;
-      y = __atomic_load(&x, 0);
-      __atomic_store(&x, y, 0);
-      __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
-      return 0;
-    }''')
+  # "do we have 128-bit atomics which are handled inline and specifically not
+  # via libatomic". The reason we can't use libatomic is documented in the
+  # comment starting "GCC is a house divided" in include/qemu/atomic128.h.
+  has_atomic128 = cc.links(atomic_test.format('unsigned __int128'))
 
   config_host_data.set('CONFIG_ATOMIC128', has_atomic128)
 
-- 
2.35.1.273.ge6ebfd0e8cbb


