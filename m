Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDAD4C7965
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 21:03:45 +0100 (CET)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOmFE-0006wy-8s
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 15:03:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nOmCi-0005Jg-5V
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:01:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nOmCc-0005a8-Jc
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646078461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5tmd38qLRKdvoDxr+NdKSupTk7rboHdgEQVtWNOLMY=;
 b=CDD4I0Kl/IQSSdsWtaAKO8N8/SqnMRp/2raiIKct+cV1dbE3YbO7mzub+5GraKO2d2rtnG
 Rmb+l0/aRnXPpaQkoc5xTs0jtzh6DKFs6Y3M61ihjY47w0pe9BKiEL/tyTh7BKnqWF6NBM
 4EEsqJvcR2FpMdkrJ0+CDGHwuqa6NyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-bMmXRW1kPm2gsvKNDsijXw-1; Mon, 28 Feb 2022 15:00:57 -0500
X-MC-Unique: bMmXRW1kPm2gsvKNDsijXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F7351DC;
 Mon, 28 Feb 2022 20:00:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2E465F70B;
 Mon, 28 Feb 2022 20:00:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] meson: fix CONFIG_ATOMIC128 check
Date: Tue,  1 Mar 2022 00:00:32 +0400
Message-Id: <20220228200032.777433-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220228200032.777433-1-marcandre.lureau@redhat.com>
References: <20220228200032.777433-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org,
 philippe.mathieu.daude@gmail.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.maydell@linaro.org
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
---
 meson.build | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index a9ec3974bc67..893eaa8ff971 100644
--- a/meson.build
+++ b/meson.build
@@ -1808,21 +1808,23 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
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
@@ -1837,15 +1839,10 @@ has_int128 = cc.links('''
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


