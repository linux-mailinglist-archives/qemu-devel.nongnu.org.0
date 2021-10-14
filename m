Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F142DF56
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:43:06 +0200 (CEST)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3ov-00076H-4j
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cH-0003rZ-Qc
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cF-0000iv-K6
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:01 -0400
Received: by mail-ed1-x529.google.com with SMTP id d9so26306400edh.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4D1LP+sxameie6INBr225kvbwxVf9TySz5pgxyOzGo=;
 b=pbk5XRu13SoOn8Meb/BdGSs6BvEIUB733sMuzUjAqvGYdAtv70pEPsHtXs/YZqGd7/
 NvsLd4vzmMy5cdPSflFrXixTlD5sMOm4LtgnZmfgFYYnzzN3XyZV3zX4WharwLY6J5zO
 K+BVsmEoFV/OcgsKlFRnFSST/Kyk9q3jfFrXIeEGFRk6NOt9d3YCMlHmfnnrJlbDEFhz
 fU2YcC3m5dpMHIU5UZzTCBTVoKDYEd1l8UxyRvFF9V9tYev8qe1EuSeIAQf0eGrmef7q
 nBCKkd+CE3nt7pfM7Qev8i2uXyrM4R15KUzujkKS+SWze7Rg3aD/d7LS2Q35ZDVn51ZQ
 Ry5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M4D1LP+sxameie6INBr225kvbwxVf9TySz5pgxyOzGo=;
 b=PCtw1cGtnP5nZF49m3qUvVxx0AL+g0Nx/Ufj/ys71HY7FpKKk8oH0uaKTe2hpprjQy
 KxcQvCGLv5TQWYts2LdnITxQTm3Y/NTCo9Q0h0PSc/KMK/0T0Q7CLx9rHv2UycIIEwkm
 3RSwWNOu9+/ZupJyOQmJtzlB/lUXgqIZw6DVWG2HPwJZHelDDQrVK7P5LD5iAa8jkvXj
 +fp299nxOLLw9oYjQP/TDH/xnmO54Hs/xqgbX3qOaCDiKLh3WOoPnycvH/Aoh0a6g5G1
 S92Asdv/RAcOXiy5CEzTCqm80vD1GzOpbkn2SsLDW0+a2YzauTw5PA8VYq6n2GmVmule
 D0BA==
X-Gm-Message-State: AOAM533LRA8dBWr4c4z9/ijRLefxx9UYV3yrnpRAg9UGxgtAN/vgIpjc
 dW2J59QsAU91OilRbWsv5Ehq/2O5Wg0=
X-Google-Smtp-Source: ABdhPJx/r2G9MiQ0MTXjuhp2ABD/PwIpYs/9OFKSVqFMbLYY80UACC5Q8rYSXN5/tkb/su6PePZEqA==
X-Received: by 2002:a05:6402:5113:: with SMTP id
 m19mr10018671edd.231.1634228996506; 
 Thu, 14 Oct 2021 09:29:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] configure, meson: move vde detection to meson
Date: Thu, 14 Oct 2021 18:29:29 +0200
Message-Id: <20211014162938.430211-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-11-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 35 ++++-------------------------------
 meson.build       | 26 +++++++++++++++++++++++---
 meson_options.txt |  2 ++
 net/meson.build   |  2 +-
 4 files changed, 30 insertions(+), 35 deletions(-)

diff --git a/configure b/configure
index 670d82847f..0c077f3f5e 100755
--- a/configure
+++ b/configure
@@ -301,7 +301,7 @@ libudev="auto"
 mpath="auto"
 vnc="auto"
 sparse="auto"
-vde="$default_feature"
+vde="auto"
 vnc_sasl="auto"
 vnc_jpeg="auto"
 vnc_png="auto"
@@ -1022,9 +1022,9 @@ for opt do
   ;;
   --enable-slirp=system) slirp="system"
   ;;
-  --disable-vde) vde="no"
+  --disable-vde) vde="disabled"
   ;;
-  --enable-vde) vde="yes"
+  --enable-vde) vde="enabled"
   ;;
   --disable-netmap) netmap="no"
   ;;
@@ -2903,30 +2903,6 @@ EOF
   fi
 fi
 
-##########################################
-# vde libraries probe
-if test "$vde" != "no" ; then
-  vde_libs="-lvdeplug"
-  cat > $TMPC << EOF
-#include <libvdeplug.h>
-int main(void)
-{
-    struct vde_open_args a = {0, 0, 0};
-    char s[] = "";
-    vde_open(s, s, &a);
-    return 0;
-}
-EOF
-  if compile_prog "" "$vde_libs" ; then
-    vde=yes
-  else
-    if test "$vde" = "yes" ; then
-      feature_not_found "vde" "Install vde (Virtual Distributed Ethernet) devel"
-    fi
-    vde=no
-  fi
-fi
-
 ##########################################
 # netmap support probe
 # Apart from looking for netmap headers, we make sure that the host API version
@@ -4199,10 +4175,6 @@ if test "$slirp_smbd" = "yes" ; then
   echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
 fi
-if test "$vde" = "yes" ; then
-  echo "CONFIG_VDE=y" >> $config_host_mak
-  echo "VDE_LIBS=$vde_libs" >> $config_host_mak
-fi
 if test "$netmap" = "yes" ; then
   echo "CONFIG_NETMAP=y" >> $config_host_mak
 fi
@@ -4752,6 +4724,7 @@ if test "$skip_meson" = no; then
         -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
         -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
         -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
+        -Dvde=$vde \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index 0ecb220af1..0e948a8024 100644
--- a/meson.build
+++ b/meson.build
@@ -500,9 +500,28 @@ else
   xkbcommon = dependency('xkbcommon', required: get_option('xkbcommon'),
                          method: 'pkg-config', kwargs: static_kwargs)
 endif
+
 vde = not_found
-if config_host.has_key('CONFIG_VDE')
-  vde = declare_dependency(link_args: config_host['VDE_LIBS'].split())
+if not get_option('vde').auto() or have_system or have_tools
+  vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
+                           required: get_option('vde'),
+                           kwargs: static_kwargs)
+endif
+if vde.found() and not cc.links('''
+   #include <libvdeplug.h>
+   int main(void)
+   {
+     struct vde_open_args a = {0, 0, 0};
+     char s[] = "";
+     vde_open(s, s, &a);
+     return 0;
+   }''', dependencies: vde)
+  vde = not_found
+  if get_option('cap_ng').enabled()
+    error('could not link libvdeplug')
+  else
+    warning('could not link libvdeplug, disabling')
+  endif
 endif
 
 pulse = not_found
@@ -1441,6 +1460,7 @@ config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
+config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3290,7 +3310,7 @@ if targetos == 'linux'
 endif
 summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
-summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
+summary_info += {'vde support':       vde}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': libaio}
 summary_info += {'Linux io_uring support': linux_io_uring}
diff --git a/meson_options.txt b/meson_options.txt
index 904e15d54c..7d0fa1c7f4 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -129,6 +129,8 @@ option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
 option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
+option('vde', type : 'feature', value : 'auto',
+       description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
 option('vnc', type : 'feature', value : 'auto',
diff --git a/net/meson.build b/net/meson.build
index 1076b0a7ab..491144a697 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -20,7 +20,7 @@ softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
 
 softmmu_ss.add(when: 'CONFIG_L2TPV3', if_true: files('l2tpv3.c'))
 softmmu_ss.add(when: slirp, if_true: files('slirp.c'))
-softmmu_ss.add(when: ['CONFIG_VDE', vde], if_true: files('vde.c'))
+softmmu_ss.add(when: vde, if_true: files('vde.c'))
 softmmu_ss.add(when: 'CONFIG_NETMAP', if_true: files('netmap.c'))
 vhost_user_ss = ss.source_set()
 vhost_user_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
-- 
2.31.1



