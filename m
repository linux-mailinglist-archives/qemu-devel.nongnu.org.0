Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916364C6BDD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:10:35 +0100 (CET)
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOerJ-0007FO-JW
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:10:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nOeoZ-00057v-Bs
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:07:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nOeoW-0004zZ-3h
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646050059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u+kh2I2FTkOs9CMR8gLr7rxqDgXaYKBv1bVipFJ1fr4=;
 b=CJCjPImr4rfZOl5JlteLAgZa/s2laLXem5DhqgpRSgJqH8+ZfqTdWgYKG+HKrytzDUaN4c
 7HZRHuUYgziUliVAmDB06W/yOTAZCVnEiHLgjzmjqpJwVYyhwBPrsJzNC3zX2hBSEVIiVH
 3MKiR4ayrZGSpGDJAboxpmls0GjQYDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-qQwfURejMJae0QrYpAgqRw-1; Mon, 28 Feb 2022 07:07:35 -0500
X-MC-Unique: qQwfURejMJae0QrYpAgqRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C36F180A08B
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 12:07:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 029952B6FD;
 Mon, 28 Feb 2022 12:07:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: move int128 checks from configure
Date: Mon, 28 Feb 2022 16:07:19 +0400
Message-Id: <20220228120720.722632-1-marcandre.lureau@redhat.com>
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

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


