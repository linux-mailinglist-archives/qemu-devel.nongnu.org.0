Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554DB27918B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 21:50:14 +0200 (CEST)
Received: from localhost ([::1]:44764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLtjR-0007gG-Df
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 15:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLth4-0006UH-3N
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 15:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLth2-0007gJ-Cc
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 15:47:45 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601063263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfggB/Z3uEX64bZmbzknMLiBg7Kq+p4oB2dg0SqVxKc=;
 b=KhPg8mD/NBrqaDkt++ZowwK+LrXlz4GRfwB6hqLtyPOZvpNmkp5VzyR9UL18zVbt0Whc0o
 HF2rBGJH00xi8Yx7hC5uKN37n/7OwNrqLpZsg6CIeY9rbLCzrYkedF3Y5MYOFOWvCirvUV
 I88s+HIxVH2a6u5Xz3JISSlGcbB7MR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-Soo2xB0pNu6bP6wIKolIPg-1; Fri, 25 Sep 2020 15:47:39 -0400
X-MC-Unique: Soo2xB0pNu6bP6wIKolIPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 086E0107465C
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 19:47:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA22F60C15
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 19:47:38 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/87] meson: move libudev test
Date: Fri, 25 Sep 2020 15:47:36 -0400
Message-Id: <20200925194737.2148096-3-pbonzini@redhat.com>
In-Reply-To: <20200925194737.2148096-1-pbonzini@redhat.com>
References: <20200925194737.2148096-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 14 --------------
 meson.build |  7 ++++---
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 01fce2e94b..c05d1a04e9 100755
--- a/configure
+++ b/configure
@@ -908,7 +908,6 @@ Linux)
   linux_user="yes"
   kvm="yes"
   QEMU_INCLUDES="-isystem ${source_path}/linux-headers -Ilinux-headers $QEMU_INCLUDES"
-  libudev="yes"
 ;;
 esac
 
@@ -6286,15 +6285,6 @@ if test "$libnfs" != "no" ; then
 fi
 
 ##########################################
-# Do we have libudev
-if test "$libudev" != "no" ; then
-  if $pkg_config libudev && test "$static" != "yes"; then
-    libudev="yes"
-    libudev_libs=$($pkg_config --libs libudev)
-  else
-    libudev="no"
-  fi
-fi
 
 # Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
 if test "$solaris" = "no" && test "$tsan" = "no"; then
@@ -7463,10 +7453,6 @@ if test "$gcov" = "yes" ; then
   echo "CONFIG_GCOV=y" >> $config_host_mak
 fi
 
-if test "$libudev" != "no"; then
-    echo "CONFIG_LIBUDEV=y" >> $config_host_mak
-    echo "LIBUDEV_LIBS=$libudev_libs" >> $config_host_mak
-fi
 if test "$fuzzing" != "no"; then
     echo "CONFIG_FUZZ=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index c48ca0d12a..81cd09d224 100644
--- a/meson.build
+++ b/meson.build
@@ -257,8 +257,8 @@ if 'CONFIG_CURL' in config_host
                             link_args: config_host['CURL_LIBS'].split())
 endif
 libudev = not_found
-if 'CONFIG_LIBUDEV' in config_host
-  libudev = declare_dependency(link_args: config_host['LIBUDEV_LIBS'].split())
+if target_os == 'linux' and (have_softmmu or have_tools)
+  libudev = dependency('libudev', static: enable_static)
 endif
 brlapi = not_found
 if 'CONFIG_BRLAPI' in config_host
@@ -440,6 +440,7 @@ has_gettid = cc.has_function('gettid')
 
 # Create config-host.h
 
+config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
@@ -1520,7 +1521,7 @@ summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
 summary_info += {'capstone':          config_host.has_key('CONFIG_CAPSTONE')}
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
-summary_info += {'libudev':           config_host.has_key('CONFIG_LIBUDEV')}
+summary_info += {'libudev':           libudev.found()}
 summary_info += {'default devices':   config_host['CONFIG_MINIKCONF_MODE'] == '--defconfig'}
 summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
-- 
2.26.2



