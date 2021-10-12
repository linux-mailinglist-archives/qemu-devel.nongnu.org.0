Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A31242A397
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:47:19 +0200 (CEST)
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGFa-0007Ix-Hd
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFii-0000jC-Jo
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:20 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFig-0007YJ-LF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:20 -0400
Received: by mail-ed1-x532.google.com with SMTP id z20so79576233edc.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JGULwIH3Wvj2zfTBa8J3XaHIsDoJNKVZwpnyWH+amok=;
 b=ks3HrbqTg72ngtj4Bt2qrKtZzYfqvd5FeEloPF+CSWUMm3tHT1gO5vgZPXue+YFbuP
 TkLATb8IchvgJc6zDJffUtmj9gqkKtuiGNpybQfQGX+Xn3twjbGLbmSlX85wrH6oxwHS
 WGUDIcrx3Qxv6Ucpwqt7Nsg0t1MTl2uXVgcQlf43V0sLRv7LQP1Ow2qonA3pj3DhyVTY
 8gISUBnYVY7SZN0qM5FcoglSu/mBJRjxl2d5iNtiaTV8mnI9HodXdOfWK1qKk5kvAmQB
 67w14OwuyiWd+udrIFg1m9OfnEjuv+Q7OvHUI6Wzgq/V8jVNlqbksUUfX081LgxXgy0t
 UwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JGULwIH3Wvj2zfTBa8J3XaHIsDoJNKVZwpnyWH+amok=;
 b=UhHYTVjLRzw4Cpzuh+HLC4p7a2z92wUF6B/yEFFkVbxeTbfPhnmP8cuuI6peI8uujB
 qM8SV75rW2zBWXwIHbRopbaMKMwCLvMr8TDOtYIBvjvFS5Z6rII3AD6rIz4tLDNg8Hrj
 rVtn8cRBcYRX+9Klvm2Zrz64VnbwLcg9CKlSkW95ImwzCWATyFA9tem5Z26knosWFQYk
 t5yZFaSGgOLLajHsy47M/fxygUhEW0XKp8WW0Qetk8Z5CXT7qyGfLm/KWVpvUCqgloky
 Ei/awb2Br4J+pwnL5i7n1MjtBIKuNp6HCrxC38DNuFBGVRTVl3x4hWwljGBPCoNGPF9B
 wiwg==
X-Gm-Message-State: AOAM531PChzMVMPVQy/PlbTx1PbGAk/T+9a9FTBDMTmCXeL67Q8VH5ja
 3s9GvZreo3F8kXwMGyDlMNva32Jfbr0=
X-Google-Smtp-Source: ABdhPJzL89VErq+GGCVFNbqBFWcQxlIwLZGB39s6ylTGbWc8+aXfGxnDtmKAQim2FbPsP+a+MbLIKg==
X-Received: by 2002:aa7:d9c1:: with SMTP id v1mr23634009eds.175.1634037197107; 
 Tue, 12 Oct 2021 04:13:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/24] configure, meson: move vde detection to meson
Date: Tue, 12 Oct 2021 13:12:54 +0200
Message-Id: <20211012111302.246627-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 86bc4b52d7..a2b1d54be8 100755
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
@@ -2901,30 +2901,6 @@ EOF
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
@@ -4197,10 +4173,6 @@ if test "$slirp_smbd" = "yes" ; then
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
@@ -4750,6 +4722,7 @@ if test "$skip_meson" = no; then
         -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
         -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
         -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
+        -Dvde=$vde \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index 5f16b17c97..e98efd3480 100644
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
@@ -3292,7 +3312,7 @@ if targetos == 'linux'
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



