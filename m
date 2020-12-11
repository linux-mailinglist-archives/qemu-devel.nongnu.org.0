Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33D2D7CAD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:20:09 +0100 (CET)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knm5Q-0006kO-1R
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluJ-0003Zw-8O
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluA-00025H-HN
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQrHeWDNrFrtuZfxFSDLYFBPwtjd1f76AM7/tNRZpeY=;
 b=LE/5zKXHL9SG/H+/mI9dWIGwmE2/BTEOy5q7wHRD660yc2EaoWnLmHRJ4i7cogSESCUZSV
 OvYF9kES1NTjrQOYLh+ddvdaQplIQQvpFlBeaxVH8W2U8AvNH3t84es7GkJD5guywQX8B1
 jhwBf9432s+7iDmq+5EykeP9dXGeu/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-KwcjSYvUMnWCtythbLtJvQ-1; Fri, 11 Dec 2020 12:08:26 -0500
X-MC-Unique: KwcjSYvUMnWCtythbLtJvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AF75100C661;
 Fri, 11 Dec 2020 17:08:25 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2705D734;
 Fri, 11 Dec 2020 17:08:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/34] meson: Detect libfuse
Date: Fri, 11 Dec 2020 18:07:43 +0100
Message-Id: <20201211170812.228643-6-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201027190600.192171-2-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 meson_options.txt | 2 ++
 configure         | 7 +++++++
 meson.build       | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/meson_options.txt b/meson_options.txt
index f6f64785fe..8f9f2e3df6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -66,6 +66,8 @@ option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
 option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
+option('fuse', type: 'feature', value: 'auto',
+       description: 'FUSE block device export')
 
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
diff --git a/configure b/configure
index 18c26e0389..b2f96c0da2 100755
--- a/configure
+++ b/configure
@@ -449,6 +449,7 @@ meson=""
 ninja=""
 skip_meson=no
 gettext=""
+fuse="auto"
 
 bogus_os="no"
 malloc_trim="auto"
@@ -1525,6 +1526,10 @@ for opt do
   ;;
   --disable-libdaxctl) libdaxctl=no
   ;;
+  --enable-fuse) fuse="enabled"
+  ;;
+  --disable-fuse) fuse="disabled"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1850,6 +1855,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   xkbcommon       xkbcommon support
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   libdaxctl       libdaxctl support
+  fuse            FUSE block device export
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -7014,6 +7020,7 @@ NINJA=$ninja $meson setup \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
+        -Dfuse=$fuse \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index 9ea05ab49f..6e8ef151d8 100644
--- a/meson.build
+++ b/meson.build
@@ -773,6 +773,10 @@ elif get_option('vhost_user_blk_server').disabled() or not have_system
     have_vhost_user_blk_server = false
 endif
 
+fuse = dependency('fuse3', required: get_option('fuse'),
+                  version: '>=3.1', method: 'pkg-config',
+                  static: enable_static)
+
 #################
 # config-host.h #
 #################
@@ -807,6 +811,7 @@ config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
+config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -2208,6 +2213,7 @@ endif
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
+summary_info += {'FUSE exports':      fuse.found()}
 summary(summary_info, bool_yn: true)
 
 if not supported_cpus.contains(cpu)
-- 
2.29.2


