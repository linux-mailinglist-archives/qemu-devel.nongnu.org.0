Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE763734DC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 08:11:34 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leAkv-00061o-18
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 02:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leAik-0004ZF-Ay
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leAih-0001by-2d
 for qemu-devel@nongnu.org; Wed, 05 May 2021 02:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620194954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icrORmR0oX8budY20qvyou5R7MERVXcTPkmmw+eiCSI=;
 b=YrqMAAS+kSX3MwF6yPE/g69u1uznKvnWFtStpE1y7cuxLq1ue525jSQzCGHXoKCvdU7ei/
 8ChoA5ybXYkNZZ431x2CDOLoJMtNmaKi/OP05+vPutOpKUDnLoCegMdAakWAP8r1KsyT3U
 8B+U47jl1SR9ZHSX5OSauqYIBkQ872E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-7h4hwu0wNXmLsfaYwJ1_Ug-1; Wed, 05 May 2021 02:09:10 -0400
X-MC-Unique: 7h4hwu0wNXmLsfaYwJ1_Ug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D0A66414C
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 06:09:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10ED660C17;
 Wed,  5 May 2021 06:09:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 73D8418003A4; Wed,  5 May 2021 08:09:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/9] build: add separate spice-protocol config option
Date: Wed,  5 May 2021 08:08:53 +0200
Message-Id: <20210505060901.828658-2-kraxel@redhat.com>
In-Reply-To: <20210505060901.828658-1-kraxel@redhat.com>
References: <20210505060901.828658-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When implementing spice vdagent protocol in qemu we only need the
spice-protocol package for that, spice-server is not needed.  So
go split those two build dependencies.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure   | 36 ++++++++++++++++++++++++++++++++----
 meson.build |  4 ++++
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 4f374b48890e..e6f959da2347 100755
--- a/configure
+++ b/configure
@@ -388,6 +388,7 @@ qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
 spice="$default_feature"
+spice_protocol="auto"
 rbd="auto"
 smartcard="$default_feature"
 u2f="auto"
@@ -1129,7 +1130,15 @@ for opt do
   ;;
   --disable-spice) spice="no"
   ;;
-  --enable-spice) spice="yes"
+  --enable-spice)
+      spice_protocol="yes"
+      spice="yes"
+  ;;
+  --disable-spice-protocol)
+      spice_protocol="no"
+      spice="no"
+  ;;
+  --enable-spice-protocol) spice_protocol="yes"
   ;;
   --disable-libiscsi) libiscsi="disabled"
   ;;
@@ -1866,6 +1875,7 @@ disabled with --disable-FEATURE, default is enabled if available
   vhost-user-blk-server    vhost-user-blk server support
   vhost-vdpa      vhost-vdpa kernel backend support
   spice           spice
+  spice-protocol  spice-protocol
   rbd             rados block device (rbd)
   libiscsi        iscsi support
   libnfs          nfs support
@@ -4149,6 +4159,19 @@ fi
 
 ##########################################
 # spice probe
+if test "$spice_protocol" != "no" ; then
+  spice_protocol_cflags=$($pkg_config --cflags spice-protocol 2>/dev/null)
+  if $pkg_config --atleast-version=0.12.3 spice-protocol; then
+    spice_protocol="yes"
+  else
+    if test "$spice_protocol" = "yes" ; then
+      feature_not_found "spice_protocol" \
+          "Install spice-protocol(>=0.12.3) devel"
+    fi
+    spice_protocol="no"
+  fi
+fi
+
 if test "$spice" != "no" ; then
   cat > $TMPC << EOF
 #include <spice.h>
@@ -4157,13 +4180,13 @@ EOF
   spice_cflags=$($pkg_config --cflags spice-protocol spice-server 2>/dev/null)
   spice_libs=$($pkg_config --libs spice-protocol spice-server 2>/dev/null)
   if $pkg_config --atleast-version=0.12.5 spice-server && \
-     $pkg_config --atleast-version=0.12.3 spice-protocol && \
+     test "$spice_protocol" = "yes" && \
      compile_prog "$spice_cflags" "$spice_libs" ; then
     spice="yes"
   else
     if test "$spice" = "yes" ; then
       feature_not_found "spice" \
-          "Install spice-server(>=0.12.5) and spice-protocol(>=0.12.3) devel"
+          "Install spice-server(>=0.12.5) devel"
     fi
     spice="no"
   fi
@@ -5807,9 +5830,14 @@ fi
 if test "$posix_memalign" = "yes" ; then
   echo "CONFIG_POSIX_MEMALIGN=y" >> $config_host_mak
 fi
+
+if test "$spice_protocol" = "yes" ; then
+  echo "CONFIG_SPICE_PROTOCOL=y" >> $config_host_mak
+  echo "SPICE_PROTOCOL_CFLAGS=$spice_protocol_cflags" >> $config_host_mak
+fi
 if test "$spice" = "yes" ; then
   echo "CONFIG_SPICE=y" >> $config_host_mak
-  echo "SPICE_CFLAGS=$spice_cflags" >> $config_host_mak
+  echo "SPICE_CFLAGS=$spice_cflags $spice_protocol_cflags" >> $config_host_mak
   echo "SPICE_LIBS=$spice_libs" >> $config_host_mak
 fi
 
diff --git a/meson.build b/meson.build
index d8bb1ec5aa97..51898a96ba4d 100644
--- a/meson.build
+++ b/meson.build
@@ -445,11 +445,15 @@ if 'CONFIG_LIBJACK' in config_host
 endif
 spice = not_found
 spice_headers = not_found
+spice_protocol = not_found
 if 'CONFIG_SPICE' in config_host
   spice = declare_dependency(compile_args: config_host['SPICE_CFLAGS'].split(),
                              link_args: config_host['SPICE_LIBS'].split())
   spice_headers = declare_dependency(compile_args: config_host['SPICE_CFLAGS'].split())
 endif
+if 'CONFIG_SPICE_PROTOCOL' in config_host
+  spice_protocol = declare_dependency(compile_args: config_host['SPICE_PROTOCOL_CFLAGS'].split())
+endif
 rt = cc.find_library('rt', required: false)
 libdl = not_found
 if 'CONFIG_PLUGIN' in config_host
-- 
2.31.1


