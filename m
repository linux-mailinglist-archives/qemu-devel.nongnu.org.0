Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1B842DF43
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:36:46 +0200 (CEST)
Received: from localhost ([::1]:33214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3in-0003kq-9L
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c5-0003OI-Ic
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:49 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c2-0000XR-CE
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:49 -0400
Received: by mail-ed1-x52e.google.com with SMTP id y30so9621491edi.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xaasexh4mPKMeYz8dpt8X2vCl2N3rYg+2fxPcY/JubU=;
 b=DhmiiShsyHmIUARfI26yxs+bnOgvQESs0NK3pxErRp6FoYjNDOrIG4hdKyTTVJbYKc
 egtqjEviKWbRce3GOktis80MBbF8NAZB7U5A2Mn8xYmA8HrhZ2sRl3B9YefXRtIMaE6n
 qQzod487J+vyDp8WtL7REkNbn4TSR3at/0LA1K+lGA8DngQ54FbabUUnKUonTDgdXu3f
 PK/llsF9mULw+Ly1UG+9a+VLOz5MExBTGPt3UrArtzsReYV7mVIDW816HqtMANFXChlE
 9gbgu/Aq1sVBtcWBVASceKa9nzHJ438bL14hPjLxGfADaeFAsxAfsxraXQAC14Yp75Z7
 kbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xaasexh4mPKMeYz8dpt8X2vCl2N3rYg+2fxPcY/JubU=;
 b=sSp4A87VuHh6Hf91V3QQdZc/5RHRtDWwLizhmWghX4J+kQt6rV+AYcRRBWeiA6VZ/m
 wf2v2wv3r/qQK6dnTusRgtQq4uZLXE7d5Ct3ULYQU7mtp6o6Gs5eDIK+DGZiSsRnAj/T
 VN7v4hDOaS+n877MIrNMyf3nSLAEbqhs799LgEs9KRmHWciMrOkTKn4GIRzxAvm98iiq
 pxzUSspquuhUTebmUhqgRZ5pWob1B2t48FdmSzOpdlQlRDJEhkcyXpGYyPtpYiu97KsR
 li9ji0s32HU0uRQQk9B6da5Adf3Be0b7iAk0/Ry4sWbn60U9UJMOgja9V01oQ1wRbF5B
 EeUA==
X-Gm-Message-State: AOAM533l3UVG1p7wu8IwSc0JHCbF2iD4JFwz1B5dfykxz9R8dYvkPVa0
 cjxWNMVkvEJOs6GWPXe9WTgfhQH2Vcg=
X-Google-Smtp-Source: ABdhPJwJ2yfxsS7N60V5Mwzrx+6NwUf6W6w86H1WJLjrNK/xpIGw8dl/PzfRc/D1I3kruI+Met2tUw==
X-Received: by 2002:a17:907:3e03:: with SMTP id
 hp3mr5020280ejc.183.1634228983730; 
 Thu, 14 Oct 2021 09:29:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/26] configure, meson: move audio driver detection to Meson
Date: Thu, 14 Oct 2021 18:29:15 +0200
Message-Id: <20211014162938.430211-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This brings a change that makes audio drivers more similar to all
other modules.  All drivers are built by default, while
--audio-drv-list only governs the default choice of the audio driver.

Meson options are added to disable the drivers, and the next patches
will fix the help messages and command line options, and especially
make the non-default drivers available via -audiodev.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130630.632028-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/meson.build |  23 +++---
 configure         | 186 +---------------------------------------------
 meson.build       | 137 +++++++++++++++++++++++++++++-----
 meson_options.txt |  18 ++++-
 4 files changed, 148 insertions(+), 216 deletions(-)

diff --git a/audio/meson.build b/audio/meson.build
index 9a95c58f18..462533bb8c 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -7,23 +7,22 @@ softmmu_ss.add(files(
   'wavcapture.c',
 ))
 
-softmmu_ss.add(when: [coreaudio, 'CONFIG_AUDIO_COREAUDIO'], if_true: files('coreaudio.c'))
-softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'],
-               if_true: files('dsoundaudio.c', 'audio_win_int.c'))
+softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.c'))
+softmmu_ss.add(when: dsound, if_true: files('dsoundaudio.c', 'audio_win_int.c'))
 
 audio_modules = {}
 foreach m : [
-  ['CONFIG_AUDIO_ALSA', 'alsa', alsa, 'alsaaudio.c'],
-  ['CONFIG_AUDIO_OSS', 'oss', oss, 'ossaudio.c'],
-  ['CONFIG_AUDIO_PA', 'pa', pulse, 'paaudio.c'],
-  ['CONFIG_AUDIO_SDL', 'sdl', sdl, 'sdlaudio.c'],
-  ['CONFIG_AUDIO_JACK', 'jack', jack, 'jackaudio.c'],
-  ['CONFIG_SPICE', 'spice', spice, 'spiceaudio.c']
+  ['alsa', alsa, files('alsaaudio.c')],
+  ['oss', oss, files('ossaudio.c')],
+  ['pa', pulse, files('paaudio.c')],
+  ['sdl', sdl, files('sdlaudio.c')],
+  ['jack', jack, files('jackaudio.c')],
+  ['spice', spice, files('spiceaudio.c')]
 ]
-  if config_host.has_key(m[0])
+  if m[1].found()
     module_ss = ss.source_set()
-    module_ss.add(when: m[2], if_true: files(m[3]))
-    audio_modules += {m[1] : module_ss}
+    module_ss.add(m[1], m[2])
+    audio_modules += {m[0] : module_ss}
   endif
 endforeach
 
diff --git a/configure b/configure
index 174fa84b60..b9a457a02f 100755
--- a/configure
+++ b/configure
@@ -240,7 +240,7 @@ interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
 cross_compile="no"
 cross_prefix=""
-audio_drv_list=""
+audio_drv_list="default"
 block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
 block_drv_whitelist_tools="no"
@@ -299,7 +299,6 @@ fdt="auto"
 netmap="no"
 sdl="auto"
 sdl_image="auto"
-coreaudio="auto"
 virtiofsd="auto"
 virtfs="auto"
 libudev="auto"
@@ -356,7 +355,6 @@ module_upgrades="no"
 prefix="/usr/local"
 qemu_suffix="qemu"
 slirp="auto"
-oss_lib=""
 bsd="no"
 linux="no"
 solaris="no"
@@ -703,54 +701,35 @@ fi
 case $targetos in
 MINGW32*)
   mingw32="yes"
-  audio_possible_drivers="dsound sdl"
-  if check_include dsound.h; then
-    audio_drv_list="dsound"
-  else
-    audio_drv_list=""
-  fi
   supported_os="yes"
   plugins="no"
   pie="no"
 ;;
 GNU/kFreeBSD)
   bsd="yes"
-  audio_drv_list="oss try-sdl"
-  audio_possible_drivers="oss sdl pa"
 ;;
 FreeBSD)
   bsd="yes"
   bsd_user="yes"
   make="${MAKE-gmake}"
-  audio_drv_list="oss try-sdl"
-  audio_possible_drivers="oss sdl pa"
   # needed for kinfo_getvmmap(3) in libutil.h
   netmap=""  # enable netmap autodetect
 ;;
 DragonFly)
   bsd="yes"
   make="${MAKE-gmake}"
-  audio_drv_list="oss try-sdl"
-  audio_possible_drivers="oss sdl pa"
 ;;
 NetBSD)
   bsd="yes"
   make="${MAKE-gmake}"
-  audio_drv_list="oss try-sdl"
-  audio_possible_drivers="oss sdl"
-  oss_lib="-lossaudio"
 ;;
 OpenBSD)
   bsd="yes"
   make="${MAKE-gmake}"
-  audio_drv_list="try-sdl"
-  audio_possible_drivers="sdl"
 ;;
 Darwin)
   bsd="yes"
   darwin="yes"
-  audio_drv_list="try-coreaudio try-sdl"
-  audio_possible_drivers="coreaudio sdl"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
@@ -759,10 +738,6 @@ SunOS)
   solaris="yes"
   make="${MAKE-gmake}"
   smbd="${SMBD-/usr/sfw/sbin/smbd}"
-  if test -f /usr/include/sys/soundcard.h ; then
-    audio_drv_list="oss try-sdl"
-  fi
-  audio_possible_drivers="oss sdl"
 # needed for CMSG_ macros in sys/socket.h
   QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
 # needed for TIOCWIN* defines in termios.h
@@ -774,8 +749,6 @@ Haiku)
   QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
 ;;
 Linux)
-  audio_drv_list="try-pa oss"
-  audio_possible_drivers="oss alsa sdl pa"
   linux="yes"
   linux_user="yes"
   vhost_user=${default_feature:-yes}
@@ -1796,8 +1769,7 @@ Advanced options (experts only):
   --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
-  --audio-drv-list=LIST    set audio drivers list:
-                           Available drivers: $audio_possible_drivers
+  --audio-drv-list=LIST    set audio drivers list
   --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
   --block-drv-rw-whitelist=L
                            set block driver read-write whitelist
@@ -2400,12 +2372,6 @@ if test -z "$want_tools"; then
     fi
 fi
 
-##########################################
-# Disable features only meaningful for system-mode emulation
-if test "$softmmu" = "no"; then
-    audio_drv_list=""
-fi
-
 ##########################################
 # L2TPV3 probe
 
@@ -2984,130 +2950,6 @@ EOF
   fi
 fi
 
-##########################################
-# detect CoreAudio
-if test "$coreaudio" != "no" ; then
-  coreaudio_libs="-framework CoreAudio"
-  cat > $TMPC << EOF
-#include <CoreAudio/CoreAudio.h>
-int main(void)
-{
-  return (int)AudioGetCurrentHostTime();
-}
-EOF
-  if compile_prog "" "$coreaudio_libs" ; then
-    coreaudio=yes
-  else
-    coreaudio=no
-  fi
-fi
-
-##########################################
-# Sound support libraries probe
-
-audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/,/ /g')
-for drv in $audio_drv_list; do
-    case $drv in
-    alsa | try-alsa)
-    if $pkg_config alsa --exists; then
-        alsa_libs=$($pkg_config alsa --libs)
-        alsa_cflags=$($pkg_config alsa --cflags)
-        alsa=yes
-        if test "$drv" = "try-alsa"; then
-            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-alsa/alsa/')
-        fi
-    else
-        if test "$drv" = "try-alsa"; then
-            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-alsa//')
-        else
-            error_exit "$drv check failed" \
-                "Make sure to have the $drv libs and headers installed."
-        fi
-    fi
-    ;;
-
-    pa | try-pa)
-    if $pkg_config libpulse --exists; then
-        libpulse=yes
-        pulse_libs=$($pkg_config libpulse --libs)
-        pulse_cflags=$($pkg_config libpulse --cflags)
-        if test "$drv" = "try-pa"; then
-            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-pa/pa/')
-        fi
-    else
-        if test "$drv" = "try-pa"; then
-            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-pa//')
-        else
-            error_exit "$drv check failed" \
-                "Make sure to have the $drv libs and headers installed."
-        fi
-    fi
-    ;;
-
-    sdl)
-    if test "$sdl" = "no"; then
-        error_exit "sdl not found or disabled, can not use sdl audio driver"
-    fi
-    ;;
-
-    try-sdl)
-    if test "$sdl" = "no"; then
-        audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-sdl//')
-    else
-        audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-sdl/sdl/')
-    fi
-    ;;
-
-    coreaudio | try-coreaudio)
-    if test "$coreaudio" = "no"; then
-      if test "$drv" = "try-coreaudio"; then
-        audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-coreaudio//')
-      else
-        error_exit "$drv check failed" \
-                "Make sure to have the $drv is available."
-      fi
-    else
-      coreaudio_libs="-framework CoreAudio"
-      if test "$drv" = "try-coreaudio"; then
-        audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-coreaudio/coreaudio/')
-      fi
-    fi
-    ;;
-
-    dsound)
-      dsound_libs="-lole32 -ldxguid"
-    ;;
-
-    oss)
-      oss_libs="$oss_lib"
-    ;;
-
-    jack | try-jack)
-    if $pkg_config jack --exists; then
-        libjack=yes
-        jack_libs=$($pkg_config jack --libs)
-        if test "$drv" = "try-jack"; then
-            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-jack/jack/')
-        fi
-    else
-        if test "$drv" = "try-jack"; then
-            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-jack//')
-        else
-            error_exit "$drv check failed" \
-                "Make sure to have the $drv libs and headers installed."
-        fi
-    fi
-    ;;
-
-    *)
-    echo "$audio_possible_drivers" | grep -q "\<$drv\>" || {
-        error_exit "Unknown driver '$drv' selected" \
-            "Possible drivers are: $audio_possible_drivers"
-    }
-    ;;
-    esac
-done
-
 ##########################################
 # plugin linker support probe
 
@@ -4538,28 +4380,6 @@ fi
 if test "$gprof" = "yes" ; then
   echo "CONFIG_GPROF=y" >> $config_host_mak
 fi
-echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
-for drv in $audio_drv_list; do
-    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
-    echo "$def=y" >> $config_host_mak
-done
-if test "$alsa" = "yes" ; then
-    echo "CONFIG_ALSA=y" >> $config_host_mak
-fi
-echo "ALSA_LIBS=$alsa_libs" >> $config_host_mak
-echo "ALSA_CFLAGS=$alsa_cflags" >> $config_host_mak
-if test "$libpulse" = "yes" ; then
-    echo "CONFIG_LIBPULSE=y" >> $config_host_mak
-fi
-echo "PULSE_LIBS=$pulse_libs" >> $config_host_mak
-echo "PULSE_CFLAGS=$pulse_cflags" >> $config_host_mak
-echo "COREAUDIO_LIBS=$coreaudio_libs" >> $config_host_mak
-echo "DSOUND_LIBS=$dsound_libs" >> $config_host_mak
-echo "OSS_LIBS=$oss_libs" >> $config_host_mak
-if test "$libjack" = "yes" ; then
-    echo "CONFIG_LIBJACK=y" >> $config_host_mak
-fi
-echo "JACK_LIBS=$jack_libs" >> $config_host_mak
 echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
 echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 if test "$block_drv_whitelist_tools" = "yes" ; then
@@ -5197,7 +5017,7 @@ if test "$skip_meson" = no; then
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
-	-Dtcg_interpreter=$tcg_interpreter \
+        -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index c1314baace..90d1b7ab61 100644
--- a/meson.build
+++ b/meson.build
@@ -428,20 +428,23 @@ vde = not_found
 if config_host.has_key('CONFIG_VDE')
   vde = declare_dependency(link_args: config_host['VDE_LIBS'].split())
 endif
+
 pulse = not_found
-if 'CONFIG_LIBPULSE' in config_host
-  pulse = declare_dependency(compile_args: config_host['PULSE_CFLAGS'].split(),
-                             link_args: config_host['PULSE_LIBS'].split())
+if not get_option('pa').auto() or (targetos == 'linux' and have_system)
+  pulse = dependency('libpulse', required: get_option('pa'),
+                     method: 'pkg-config', kwargs: static_kwargs)
 endif
 alsa = not_found
-if 'CONFIG_ALSA' in config_host
-  alsa = declare_dependency(compile_args: config_host['ALSA_CFLAGS'].split(),
-                            link_args: config_host['ALSA_LIBS'].split())
+if not get_option('alsa').auto() or (targetos == 'linux' and have_system)
+  alsa = dependency('alsa', required: get_option('alsa'),
+                    method: 'pkg-config', kwargs: static_kwargs)
 endif
 jack = not_found
-if 'CONFIG_LIBJACK' in config_host
-  jack = declare_dependency(link_args: config_host['JACK_LIBS'].split())
+if not get_option('jack').auto() or have_system
+  jack = dependency('jack', required: get_option('jack'),
+                    method: 'pkg-config', kwargs: static_kwargs)
 endif
+
 spice = not_found
 spice_headers = not_found
 spice_protocol = not_found
@@ -801,16 +804,59 @@ if liblzfse.found() and not cc.links('''
 endif
 
 oss = not_found
-if 'CONFIG_AUDIO_OSS' in config_host
-  oss = declare_dependency(link_args: config_host['OSS_LIBS'].split())
+if not get_option('oss').auto() or have_system
+  if not cc.has_header('sys/soundcard.h')
+    # not found
+  elif targetos == 'netbsd'
+    oss = cc.find_library('ossaudio', required: get_option('oss'),
+                          kwargs: static_kwargs)
+  else
+    oss = declare_dependency()
+  endif
+
+  if not oss.found()
+    if get_option('oss').enabled()
+      error('OSS not found')
+    else
+      warning('OSS not found, disabling')
+    endif
+  endif
 endif
 dsound = not_found
-if 'CONFIG_AUDIO_DSOUND' in config_host
-  dsound = declare_dependency(link_args: config_host['DSOUND_LIBS'].split())
+if not get_option('dsound').auto() or (targetos == 'windows' and have_system)
+  if cc.has_header('dsound.h')
+    dsound = declare_dependency(link_args: ['-lole32', '-ldxguid'])
+  endif
+
+  if not dsound.found()
+    if get_option('dsound').enabled()
+      error('DirectSound not found')
+    else
+      warning('DirectSound not found, disabling')
+    endif
+  endif
 endif
+
 coreaudio = not_found
-if 'CONFIG_AUDIO_COREAUDIO' in config_host
-  coreaudio = declare_dependency(link_args: config_host['COREAUDIO_LIBS'].split())
+if not get_option('coreaudio').auto() or (targetos == 'darwin' and have_system)
+  coreaudio = dependency('appleframeworks', modules: 'CoreAudio',
+                         required: get_option('coreaudio'))
+  if coreaudio.found() and not cc.links('''
+    #include <CoreAudio/CoreAudio.h>
+    int main(void)
+    {
+      return (int)AudioGetCurrentHostTime();
+    }''')
+    coreaudio = not_found
+  endif
+
+  if not coreaudio.found()
+    if get_option('coreaudio').enabled()
+      error('CoreAudio not found')
+    else
+      warning('CoreAudio not found, disabling')
+    endif
+  endif
 endif
 
 opengl = not_found
@@ -1156,6 +1202,49 @@ if libbpf.found() and not cc.links('''
   endif
 endif
 
+#################
+# config-host.h #
+#################
+
+audio_drivers_selected = []
+if have_system
+  audio_drivers_available = {
+    'alsa': alsa.found(),
+    'coreaudio': coreaudio.found(),
+    'dsound': dsound.found(),
+    'jack': jack.found(),
+    'oss': oss.found(),
+    'pa': pulse.found(),
+    'sdl': sdl.found(),
+  }
+
+  # Default to native drivers first, OSS second, SDL third
+  audio_drivers_priority = \
+    [ 'pa', 'coreaudio', 'dsound', 'oss' ] + \
+    (targetos == 'linux' ? [] : [ 'sdl' ])
+  audio_drivers_default = []
+  foreach k: audio_drivers_priority
+    if audio_drivers_available[k]
+      audio_drivers_default += k
+    endif
+  endforeach
+
+  foreach k: get_option('audio_drv_list')
+    if k == 'default'
+      audio_drivers_selected += audio_drivers_default
+    elif not audio_drivers_available[k]
+      error('Audio driver "@0@" not available.'.format(k))
+    else
+      audio_drivers_selected += k
+    endif
+  endforeach
+endif
+foreach k: audio_drivers_selected
+  config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), true)
+endforeach
+config_host_data.set('CONFIG_AUDIO_DRIVERS',
+                     '"' + '", "'.join(audio_drivers_selected) + '", ')
+
 if get_option('cfi')
   cfi_flags=[]
   # Check for dependency on LTO
@@ -1199,10 +1288,6 @@ endif
 have_host_block_device = (targetos != 'darwin' or
     cc.has_header('IOKit/storage/IOMedia.h'))
 
-#################
-# config-host.h #
-#################
-
 have_virtfs = (targetos == 'linux' and
     have_system and
     libattr.found() and
@@ -1446,7 +1531,7 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
 
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
-arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
+arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 strings = ['HOST_DSOSUF', 'CONFIG_IASL']
 foreach k, v: config_host
   if ignored.contains(k)
@@ -2880,7 +2965,7 @@ if config_host.has_key('CONFIG_MODULES')
 endif
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
 if have_system
-  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
+  summary_info += {'Audio drivers':     ' '.join(audio_drivers_selected)}
 endif
 summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
 if config_host['TRACE_BACKENDS'].split().contains('simple')
@@ -3068,6 +3153,18 @@ if vnc.found()
   summary_info += {'VNC JPEG support':  jpeg}
   summary_info += {'VNC PNG support':   png}
 endif
+if targetos not in ['darwin', 'haiku', 'windows']
+  summary_info += {'OSS support':     oss}
+elif targetos == 'darwin'
+  summary_info += {'CoreAudio support': coreaudio}
+elif targetos == 'windows'
+  summary_info += {'DirectSound support': dsound}
+endif
+if targetos == 'linux'
+  summary_info += {'ALSA support':    alsa}
+  summary_info += {'PulseAudio support': pulse}
+endif
+summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
diff --git a/meson_options.txt b/meson_options.txt
index 2c89e79e8b..052c4f088e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -6,9 +6,12 @@ option('qemu_firmwarepath', type : 'string', value : '',
        description: 'search PATH for firmware files')
 option('sphinx_build', type : 'string', value : '',
        description: 'Use specified sphinx-build [$sphinx_build] for building document (default to be empty)')
-
 option('default_devices', type : 'boolean', value : true,
        description: 'Include a default selection of devices in emulators')
+option('audio_drv_list', type: 'array', value: ['default'],
+       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl'],
+       description: 'Set audio driver list')
+
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
 option('gettext', type : 'feature', value : 'auto',
@@ -139,6 +142,19 @@ option('fuse', type: 'feature', value: 'auto',
 option('fuse_lseek', type : 'feature', value : 'auto',
        description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
 
+option('alsa', type: 'feature', value: 'auto',
+       description: 'ALSA sound support')
+option('coreaudio', type: 'feature', value: 'auto',
+       description: 'CoreAudio sound support')
+option('dsound', type: 'feature', value: 'auto',
+       description: 'DirectSound sound support')
+option('jack', type: 'feature', value: 'auto',
+       description: 'JACK sound support')
+option('oss', type: 'feature', value: 'auto',
+       description: 'OSS sound support')
+option('pa', type: 'feature', value: 'auto',
+       description: 'PulseAudio sound support')
+
 option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
 option('virtfs', type: 'feature', value: 'auto',
-- 
2.31.1



