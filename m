Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B2442540F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:27:10 +0200 (CEST)
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTQP-0001zy-B7
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8d-0005UY-HG
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:44 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Z-0007nK-3I
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:43 -0400
Received: by mail-ed1-x52b.google.com with SMTP id dj4so22953070edb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MWSGbwJ0q8s4flUFRXXK07L6Y49/dx9Mo1oHwdH0klU=;
 b=SDCu1G+YNkrV9qfDvh2SvQeYZORKoaScPVS72ndLfz8X2eOj3BKMDLULkIUsytTPwD
 ssXFzyvwweNthLVSj/5QRyBtNdFiZ1wtz6NU2si0zXv8Jjqa4TNc1ARZxhqPS1ScBhhH
 XASste0fq8oHxvIWFDW+8M1cfF7LMsPP5cR1FnbS2HAwCtYizpSxwIeNHTKp1q/nr50E
 ZbFukt5ULhJ/g0EJP2IjvLpD5kHoYJZOAM6ZO5ENrYaYSX8+ps7Krr8qPry8FedwlFUA
 /aENWWhUZjqAkx2S4Tl6eXZAgfZTJOjkb4/3BbGdpdgPKWHpKd0JcihR/cyxxorMDqb9
 J3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MWSGbwJ0q8s4flUFRXXK07L6Y49/dx9Mo1oHwdH0klU=;
 b=aYgO5TqExKUpKn7GaUww/ieBAooJSZWCF9t9aT/oRSa6NcLY/ZDrMed0gE0YDnL1TM
 enqbpmmf1Q1Gx8EcyeDiEsbNBzyKkTdsN1qdSUUloOlTUCnz5yFI7BdBWW2MTxD6QX8C
 r3NzxzYA7Je0C1hszM68FQKns4sCI7GlnN49sP6w+EPpyE2N50V82pt641SzU/4KPEEC
 doAKMVYvcwKyU2YJDadqQAWTr0ewdkM6XK7YrguqEnjbiegKVM36FsZ78HWtytmJ6JOr
 5D7LI/hMku0I4SGVPjAhqGUyK/Mkf8RTn4zOf8DCppFCX1u3KVqwEMNfwaq525SsJjRa
 7LCA==
X-Gm-Message-State: AOAM531fkb1F2kDA60HZR7yH2ddhPmyE+AK/mLVUPmnFzgGjImN2UGdl
 dZS2ufqmTlUzBDiWzVy+Y6fwaMorMvg=
X-Google-Smtp-Source: ABdhPJx8NyyCnkVjoEdlVBna05npsYM+uGdqwhh7Yv9gY/Koa0FHS/LnFFWZN6ffpEYVtt0OpCUtGQ==
X-Received: by 2002:a17:907:110b:: with SMTP id
 qu11mr5474444ejb.380.1633612117701; 
 Thu, 07 Oct 2021 06:08:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/24] configure, meson: move vde detection to meson
Date: Thu,  7 Oct 2021 15:08:21 +0200
Message-Id: <20211007130829.632254-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index 0be11e5e08..46d8798a19 100644
--- a/meson.build
+++ b/meson.build
@@ -502,9 +502,28 @@ else
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
@@ -1443,6 +1462,7 @@ config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
+config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3295,7 +3315,7 @@ if targetos == 'linux'
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



