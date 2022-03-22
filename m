Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3324E3F09
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:01:40 +0100 (CET)
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWe8p-0007qw-TT
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:01:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdbl-0005sv-Qo
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdbk-0002lB-7e
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647952047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKzghtMuOjU4gsOsvpIT6usangEfsCbOLhBaQPtucRU=;
 b=BXAyxG0vBkEnLPfoQGn/Een833vgJfKFzbjfm/EFBJNuQDFu8Irw1z6ZTtsDj2JLZnFyuJ
 inUMZoE2svvVRUZwzB417PzgBMoA81ahWPnHDdMP5gfwMAt5R60ts07TQROuMyvgeQF0N+
 QCH/k+aclHuiCzGMlc1LYHRMvVcZ3/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-TCbB8zkdOw2uH-BuQ0uacQ-1; Tue, 22 Mar 2022 08:27:23 -0400
X-MC-Unique: TCbB8zkdOw2uH-BuQ0uacQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D8E3185A7BA;
 Tue, 22 Mar 2022 12:27:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5567E7AC8;
 Tue, 22 Mar 2022 12:27:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] meson: move int128 checks from configure
Date: Tue, 22 Mar 2022 16:25:54 +0400
Message-Id: <20220322122601.927238-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

(note: the test isn't working as intended, the next patches fixes it)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure   | 47 -----------------------------------------------
 meson.build | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 47 deletions(-)

diff --git a/configure b/configure
index cd4946b43ee8..9e9b85147a5f 100755
--- a/configure
+++ b/configure
@@ -2481,41 +2481,6 @@ if compile_prog "" "" ; then
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
@@ -2959,18 +2924,6 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
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
index 282e7c46505f..85f3f84ec6f8 100644
--- a/meson.build
+++ b/meson.build
@@ -1869,6 +1869,45 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
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


