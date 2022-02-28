Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9BB4C7964
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 21:03:40 +0100 (CET)
Received: from localhost ([::1]:33960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOmF9-0006t1-JK
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 15:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nOmCX-0005Fy-QK
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:00:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nOmCU-0005Zd-12
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 15:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646078453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZuJI3Q1wyuijrkUsEX7atInEVosIwcqKiDwHpeJ4KGM=;
 b=EMHYQLSQYgBlFuqa+W3ea8JhDsK8zp0fND8EvafGBxA0bCuEQg9i+lleznLPyoysTYKihE
 BVou4XOrJYSLfQVQ8l8/7gbUlbfCdp7qaP74aIEbil/JHSL9Qd025Fwi2FY6KWNU4ghBBf
 TSu80ELAXRc16Ihs3FBjo5VByZ/dNWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-waahqM4zNZmRtPT0JmVBug-1; Mon, 28 Feb 2022 15:00:49 -0500
X-MC-Unique: waahqM4zNZmRtPT0JmVBug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 995BB180A08F;
 Mon, 28 Feb 2022 20:00:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EF0330590;
 Mon, 28 Feb 2022 20:00:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] meson: move int128 checks from configure
Date: Tue,  1 Mar 2022 00:00:31 +0400
Message-Id: <20220228200032.777433-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

(note: the test isn't working as intended, the next patches fixes it)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure   | 47 -----------------------------------------------
 meson.build | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 47 deletions(-)

diff --git a/configure b/configure
index c56ed53ee365..66315835a663 100755
--- a/configure
+++ b/configure
@@ -2452,41 +2452,6 @@ if compile_prog "" "" ; then
     int128=yes
 fi
 
-#########################################
-# See if 128-bit atomic operations are supported.
-
-atomic128=no
-if test "$int128" = "yes"; then
-  cat > $TMPC << EOF
-int main(void)
-{
-  unsigned __int128 x = 0, y = 0;
-  y = __atomic_load(&x, 0);
-  __atomic_store(&x, y, 0);
-  __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
-  return 0;
-}
-EOF
-  if compile_prog "" "" ; then
-    atomic128=yes
-  fi
-fi
-
-cmpxchg128=no
-if test "$int128" = yes && test "$atomic128" = no; then
-  cat > $TMPC << EOF
-int main(void)
-{
-  unsigned __int128 x = 0, y = 0;
-  __sync_val_compare_and_swap_16(&x, y, x);
-  return 0;
-}
-EOF
-  if compile_prog "" "" ; then
-    cmpxchg128=yes
-  fi
-fi
-
 ########################################
 # check if ccache is interfering with
 # semantic analysis of macros
@@ -2930,18 +2895,6 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
     echo "CONFIG_TSAN=y" >> $config_host_mak
 fi
 
-if test "$int128" = "yes" ; then
-  echo "CONFIG_INT128=y" >> $config_host_mak
-fi
-
-if test "$atomic128" = "yes" ; then
-  echo "CONFIG_ATOMIC128=y" >> $config_host_mak
-fi
-
-if test "$cmpxchg128" = "yes" ; then
-  echo "CONFIG_CMPXCHG128=y" >> $config_host_mak
-fi
-
 if test "$rdma" = "yes" ; then
   echo "CONFIG_RDMA=y" >> $config_host_mak
   echo "RDMA_LIBS=$rdma_libs" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 2ed1d97c97ab..a9ec3974bc67 100644
--- a/meson.build
+++ b/meson.build
@@ -1824,6 +1824,45 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
     return 0;
   }'''))
 
+has_int128 = cc.links('''
+  __int128_t a;
+  __uint128_t b;
+  int main (void) {
+    a = a + b;
+    b = a * b;
+    a = a * a;
+    return 0;
+  }''')
+
+config_host_data.set('CONFIG_INT128', has_int128)
+
+if has_int128
+  has_atomic128 = cc.links('''
+    int main(void)
+    {
+      unsigned __int128 x = 0, y = 0;
+      y = __atomic_load(&x, 0);
+      __atomic_store(&x, y, 0);
+      __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
+      return 0;
+    }''')
+
+  config_host_data.set('CONFIG_ATOMIC128', has_atomic128)
+
+  if not has_atomic128
+    has_cmpxchg128 = cc.links('''
+      int main(void)
+      {
+        unsigned __int128 x = 0, y = 0;
+        __sync_val_compare_and_swap_16(&x, y, x);
+        return 0;
+      }
+    ''')
+
+    config_host_data.set('CONFIG_CMPXCHG128', has_cmpxchg128)
+  endif
+endif
+
 config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + '''
   #include <sys/auxv.h>
   int main(void) {
-- 
2.35.1.273.ge6ebfd0e8cbb


