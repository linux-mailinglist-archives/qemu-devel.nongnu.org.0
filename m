Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A22BA393
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 08:40:41 +0100 (CET)
Received: from localhost ([::1]:47906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg11x-0000f9-F0
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 02:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg107-00008E-K6
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 02:38:35 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kg106-0007em-0B
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 02:38:35 -0500
Received: by mail-ej1-x62b.google.com with SMTP id f23so11561144ejk.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 23:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MR+VjmhSGvF16p1S4lZ4925k+WWyeToz2wI4OHvebOo=;
 b=RmwHFZ1sUpuLlxRy7Al6SwKoJqW8Evct3I4a9V/yO5XID2FuLQtq1YYw5EVVXk4o0O
 UNTbH8l6D/qxolciMinXyFah8wOwH9Ja+bX8IPwX0nItEyVeGqfFB5WWXkpPkUYWqj6X
 1Xy8Ih7bn4BSnaPM1+3Y3xlUf7YRgm5GWrH/77MV1d0209aruDR0WAzHMn926y2L/dL8
 ZpGL2lqFTbPk/XNzsiRIQemiF1IAOYEdpqMjSFWGHQlgZlHMgT6dt9+Kxy0PFskYS9us
 XnNw5W5stRXZ5htY8vo06CdV8sbzXc3Knao1YT17akqqVdTxxKcwcb24lz59OsY1aIty
 RcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MR+VjmhSGvF16p1S4lZ4925k+WWyeToz2wI4OHvebOo=;
 b=CjtwV6HPjCfcz75LuVYoDAXkR2Www7XbsUydzuoXsKHCM5ViaL/NoyNx21nv0YNyED
 VwpdJMMyI+mC4tXSwrJHRiKnddDURjzF/2TuclFExqEL+UoMUOZUOwZMpOzBrVvGPZCC
 h1p3IS5YwZhJ4HPeOPeRKip8Ckdb6SXdVnLaR4eAPiEDzdaE+1WZAfYKAs0eN5xsHM2G
 Kv35xn/rJBrDVlQMWNw40+9Z3POW6ixh/ak/Gj6kEBnkTBt+vl/U5ihzW62MRljPni8w
 rqRTSptHXb4SgOrCZX0pZhhIUJd1p5SzXIByeaRou4v+UUE/odQVXFn8e8M71x1yXKCM
 IpIw==
X-Gm-Message-State: AOAM532LQsGDtjeBVlDBQm8hSdwE3l4l9QXuXRu7Mz8IuApAb1TnXG+A
 oh2M4q9g/w1kL/0uPkbZ8CIb193XYPY=
X-Google-Smtp-Source: ABdhPJyw+yeka4E32fuxtkpskB3+zHteVYWasL41Zq2vR5HE3DKbkcOP3U6cOBZfJs+4SYFtKY/i0A==
X-Received: by 2002:a17:906:660b:: with SMTP id
 b11mr33882409ejp.190.1605857912073; 
 Thu, 19 Nov 2020 23:38:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y18sm782469ejq.69.2020.11.19.23.38.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 23:38:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson.build: convert --with-default-devices to meson
Date: Fri, 20 Nov 2020 08:38:30 +0100
Message-Id: <20201120073830.99939-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Pass the boolean option directly instead of writing
CONFIG_MINIKCONF_MODE to config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 12 ++++--------
 meson.build       |  5 +++--
 meson_options.txt |  2 ++
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index a3d13538c0..5e51279986 100755
--- a/configure
+++ b/configure
@@ -432,7 +432,7 @@ sheepdog="no"
 libxml2=""
 debug_mutex="no"
 libpmem=""
-default_devices="yes"
+default_devices="true"
 plugins="no"
 fuzzing="no"
 rng_none="no"
@@ -929,9 +929,9 @@ for opt do
   ;;
   --with-trace-file=*) trace_file="$optarg"
   ;;
-  --with-default-devices) default_devices="yes"
+  --with-default-devices) default_devices="true"
   ;;
-  --without-default-devices) default_devices="no"
+  --without-default-devices) default_devices="false"
   ;;
   --enable-gprof) gprof="yes"
   ;;
@@ -5544,11 +5544,6 @@ echo "GIT_UPDATE=$git_update" >> $config_host_mak
 
 echo "ARCH=$ARCH" >> $config_host_mak
 
-if test "$default_devices" = "yes" ; then
-  echo "CONFIG_MINIKCONF_MODE=--defconfig" >> $config_host_mak
-else
-  echo "CONFIG_MINIKCONF_MODE=--allnoconfig" >> $config_host_mak
-fi
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
@@ -6527,6 +6522,7 @@ NINJA=$ninja $meson setup \
         -Dattr=$attr \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
+        -Ddefault_devices=$default_devices \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index e968bb5ada..f273eb28ba 100644
--- a/meson.build
+++ b/meson.build
@@ -1206,7 +1206,8 @@ foreach target : target_dirs
       output: config_devices_mak,
       depfile: config_devices_mak + '.d',
       capture: true,
-      command: [minikconf, config_host['CONFIG_MINIKCONF_MODE'],
+      command: [minikconf,
+                get_option('default_devices') ? '--defconfig' : '--allnoconfig',
                 config_devices_mak, '@DEPFILE@', '@INPUT@',
                 host_kconfig, accel_kconfig])
 
@@ -2390,7 +2391,7 @@ summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capst
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
-summary_info += {'default devices':   config_host['CONFIG_MINIKCONF_MODE'] == '--defconfig'}
+summary_info += {'default devices':   get_option('default_devices')}
 summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
 if config_host.has_key('HAVE_GDB_BIN')
diff --git a/meson_options.txt b/meson_options.txt
index 2f0ca97329..7d57b744ac 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -7,6 +7,8 @@ option('qemu_firmwarepath', type : 'string', value : '',
 option('sphinx_build', type : 'string', value : '',
        description: 'Use specified sphinx-build [$sphinx_build] for building document (default to be empty)')
 
+option('default_devices', type : 'boolean', value : true,
+       description: 'Include a default selection of devices in emulators')
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
 option('gettext', type : 'boolean', value : true,
-- 
2.28.0


