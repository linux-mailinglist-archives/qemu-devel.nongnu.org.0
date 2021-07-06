Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5893BC9ED
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:29:06 +0200 (CEST)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iK9-00033V-HT
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htv-0000yK-Do
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htr-0002JS-RG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id d2so1736089wrn.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SK7FknGsSrVgBMFyN/dZ8ttg0HVj9/0z08oXPSrO+gU=;
 b=JKfEG/QuxUgLwfzy8LhBHv86YC609PmIGb7R+AmhQs9VhKiIxLCCalJeZQy9l8Pomp
 5/BIRSplirMGMEZk3f6DtEKBjUs2aJeNQQRqqL/mEGnzrpe0c+Uaj80KkLbfkJOh4iJO
 8SqLGpnWodi+FpkE7LG7h/fSJhdhXD40J8EbwW7KHV5X4oMM0rAcedxKeHmcycOQ/DVj
 F1a5YdnS90xzdhUVsVb4oeiV4AftrgLDRsqDeEPGsNkt5l2CLIr3FBwOt67XwreLKUjn
 62XfF28MNugnNetRHfTx6H5GW9rta/trydIlbiHtfsqaEMeJhIaiX3GugOQPqNULTm+a
 hVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SK7FknGsSrVgBMFyN/dZ8ttg0HVj9/0z08oXPSrO+gU=;
 b=LBJLuaFn7VCGJPqE9yJHrl9thjtEwVcLMXQVGukwXtoRWGtMFMR4sTzGYdnNXlq0J6
 i16WYN8biF9hiNZP9KeglM+6UuUDR/yjTRI04Mytt9TW8x5aGRKsJ0uNcRjX5WcS5PGi
 yEK7bWWiWJes+QpfLiP5yj35FSutkWudwM6yEjgouWNHUV02WiqMBj8fmWeh1vbwS/H7
 R/obIrBjQ3AVFhtq1Sp9Sj5DuX8J9g47HSaUoITqQo3Fx+D1iqg+mPc/oOTghxW3m4He
 wImhiB/ArGx4lxDTV5RET4BXLn8pzABP0jilJCsM4XCIlIekKw5n+PmoCYkRxF/xplIy
 zcrA==
X-Gm-Message-State: AOAM532D1ox1feUJYzpynKb6xQ4u/h73KuHG8bf7FK9MJAfeK5qjOrCe
 vYiI2qFiGpIvEDlDfzFd1u3vrNNyV9Y=
X-Google-Smtp-Source: ABdhPJzER+xS3tvZoTCIdCoHJlsEIFD8lFG5RzBOXqnmavLsIlR9jJ2IO9rQG/0Ja7pwjY3Jjn9AJA==
X-Received: by 2002:a5d:5751:: with SMTP id q17mr21057275wrw.245.1625565714446; 
 Tue, 06 Jul 2021 03:01:54 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/40] configure, meson: convert virgl detection to meson
Date: Tue,  6 Jul 2021 12:01:19 +0200
Message-Id: <20210706100141.303960-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 35 ++++-------------------------------
 hw/display/meson.build |  6 +++---
 meson.build            | 10 ++++++----
 meson_options.txt      |  2 ++
 4 files changed, 15 insertions(+), 38 deletions(-)

diff --git a/configure b/configure
index fe86da4fdd..895192e0de 100755
--- a/configure
+++ b/configure
@@ -409,7 +409,7 @@ nettle="auto"
 gcrypt="auto"
 auth_pam="auto"
 vte="auto"
-virglrenderer="$default_feature"
+virglrenderer="auto"
 tpm="$default_feature"
 libssh="$default_feature"
 live_block_migration=${default_feature:-yes}
@@ -1399,9 +1399,9 @@ for opt do
   ;;
   --enable-vte) vte="enabled"
   ;;
-  --disable-virglrenderer) virglrenderer="no"
+  --disable-virglrenderer) virglrenderer="disabled"
   ;;
-  --enable-virglrenderer) virglrenderer="yes"
+  --enable-virglrenderer) virglrenderer="enabled"
   ;;
   --disable-tpm) tpm="no"
   ;;
@@ -4036,28 +4036,6 @@ EOF
   fi
 fi
 
-##########################################
-# virgl renderer probe
-
-if test "$virglrenderer" != "no" ; then
-  cat > $TMPC << EOF
-#include <virglrenderer.h>
-int main(void) { virgl_renderer_poll(); return 0; }
-EOF
-  virgl_cflags=$($pkg_config --cflags virglrenderer 2>/dev/null)
-  virgl_libs=$($pkg_config --libs virglrenderer 2>/dev/null)
-  virgl_version=$($pkg_config --modversion virglrenderer 2>/dev/null)
-  if $pkg_config virglrenderer >/dev/null 2>&1 && \
-     compile_prog "$virgl_cflags" "$virgl_libs" ; then
-    virglrenderer="yes"
-  else
-    if test "$virglrenderer" = "yes" ; then
-      feature_not_found "virglrenderer"
-    fi
-    virglrenderer="no"
-  fi
-fi
-
 ##########################################
 # capstone
 
@@ -5466,11 +5444,6 @@ fi
 if test "$have_copy_file_range" = "yes" ; then
     echo "HAVE_COPY_FILE_RANGE=y" >> $config_host_mak
 fi
-if test "$virglrenderer" = "yes" ; then
-  echo "CONFIG_VIRGL=y" >> $config_host_mak
-  echo "VIRGL_CFLAGS=$virgl_cflags" >> $config_host_mak
-  echo "VIRGL_LIBS=$virgl_libs" >> $config_host_mak
-fi
 if test "$xen" = "enabled" ; then
   echo "CONFIG_XEN_BACKEND=y" >> $config_host_mak
   echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=$xen_ctrl_version" >> $config_host_mak
@@ -6137,7 +6110,7 @@ if test "$skip_meson" = no; then
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
-        -Dattr=$attr -Ddefault_devices=$default_devices \
+        -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
diff --git a/hw/display/meson.build b/hw/display/meson.build
index e1f473c1df..1e6b707d3c 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -61,7 +61,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
   virtio_gpu_gl_ss = ss.source_set()
-  virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRGL', opengl],
+  virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
                        if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
   hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
 endif
@@ -75,7 +75,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
   hw_display_modules += {'virtio-gpu-pci': virtio_gpu_pci_ss}
 
   virtio_gpu_pci_gl_ss = ss.source_set()
-  virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', 'CONFIG_VIRGL', opengl],
+  virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
                            if_true: [files('virtio-gpu-pci-gl.c'), pixman])
   hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
 endif
@@ -89,7 +89,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   hw_display_modules += {'virtio-vga': virtio_vga_ss}
 
   virtio_vga_gl_ss = ss.source_set()
-  virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', 'CONFIG_VIRGL', opengl],
+  virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
                        if_true: [files('virtio-vga-gl.c'), pixman])
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
diff --git a/meson.build b/meson.build
index b15c1ee4fd..84ffdb4599 100644
--- a/meson.build
+++ b/meson.build
@@ -471,9 +471,11 @@ if 'CONFIG_GBM' in config_host
                            link_args: config_host['GBM_LIBS'].split())
 endif
 virgl = not_found
-if 'CONFIG_VIRGL' in config_host
-  virgl = declare_dependency(compile_args: config_host['VIRGL_CFLAGS'].split(),
-                             link_args: config_host['VIRGL_LIBS'].split())
+if not get_option('virglrenderer').auto() or have_system
+  virgl = dependency('virglrenderer',
+                     method: 'pkg-config',
+                     required: get_option('virglrenderer'),
+                     kwargs: static_kwargs)
 endif
 curl = not_found
 if not get_option('curl').auto() or have_block
@@ -2768,7 +2770,7 @@ summary_info += {'PAM':               pam.found()}
 summary_info += {'iconv support':     iconv.found()}
 summary_info += {'curses support':    curses.found()}
 # TODO: add back version
-summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
+summary_info += {'virgl support':     virgl.found()}
 summary_info += {'curl support':      curl.found()}
 summary_info += {'Multipath support': mpathpersist.found()}
 summary_info += {'VNC support':       vnc.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 8af42987f4..a70aedb0eb 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -110,6 +110,8 @@ option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
 option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
+option('virglrenderer', type : 'feature', value : 'auto',
+       description: 'virgl rendering support')
 option('vnc', type : 'feature', value : 'enabled',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
-- 
2.31.1



