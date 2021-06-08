Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4539F4E2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:25:22 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZrE-0000wl-UJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpD-0006Wj-8u
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:15 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpB-000800-AG
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id e11so10954515wrg.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KPzZ7D1UtY+QeqXtKh3Tp3/QcBfmpOIZBp3Ec0jWE6s=;
 b=rBXdkHHwiB/bEJJ6HHt5QuWWQeYfTFEKerZKdi1KHLMqCf2aV1kZdB7IYpIFP2AMhv
 sQUc/+u8+wkePc+OLGzf5RRx5mdroEXV5SW420Rw/FJll7IXj7mRUjdBHUAm/GNNrHWD
 M+ZGfdn1e+tTymh18yfvkpjTa1SZ3flgHPNwEnwh2WM6OcTRjmt9qVvyRMaDK5pG8GgA
 6gIA6z0MgfVIRR5dl02WCh8DOg3OP6Rm+51irRFh95j92FveoZ4YAx7ZRoR734jAwFJT
 Czg5tvJWzacegGvhQo++idptT23baQ2+a7qxTBEbsn3480FF+E7munqzLbOLGSK/KAcs
 og3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KPzZ7D1UtY+QeqXtKh3Tp3/QcBfmpOIZBp3Ec0jWE6s=;
 b=C7fFWHo/fMQHqYuVdHQGTpmLB+q+F/1QC3Edv7amEXpk5ZT9RHA2eUd+C9JROfFPnF
 waXoCzi2nMTpIOQacjN6gJV+S76wzudOcNsWJM0H/CoQe9JIPzOI69VXCM1Addt6A7ra
 JK6z4C9PoFeT2Lyb1VQoHJA6i5x0NmKL37NgyYkWIvbPOkBRPGDjkZPF9bQHFppgi2RT
 BHHqKDPzi41/syQS/sojXAXg4HRSEFBIlhMEc9GmvTRJ7m1lwgOSmheKWGgDySICq5Er
 BjeduaFklbPyVeGUh5z2HaIaGEagV++8ie3qxNUFSTLoJmNeFrOfrpsFL+lBK5GnMYBE
 5r9Q==
X-Gm-Message-State: AOAM533j78LQ/K2CuJYMMi6tvQw6ex4MEarJFwF8WuyZBGbBi1u/McY3
 IvYcJzQsf7ehuFwddunlPTSo6+VN+DWv/g==
X-Google-Smtp-Source: ABdhPJx44VprtCKaLIoK6QdMoAIkuOqbnd5uiGHaaAKQ0A4Jflb4OPdlKrazRmrusPsjzO6d0QQu1g==
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr22227895wrm.162.1623151391975; 
 Tue, 08 Jun 2021 04:23:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/26] configure, meson: convert virgl detection to meson
Date: Tue,  8 Jun 2021 13:22:45 +0200
Message-Id: <20210608112301.402434-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 configure              | 35 ++++-------------------------------
 hw/display/meson.build |  6 +++---
 meson.build            | 10 ++++++----
 meson_options.txt      |  2 ++
 4 files changed, 15 insertions(+), 38 deletions(-)

diff --git a/configure b/configure
index d3351557e9..c2c8c9f2d6 100755
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
 
@@ -5464,11 +5442,6 @@ fi
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
@@ -6136,7 +6109,7 @@ if test "$skip_meson" = no; then
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
index f3af9ee3cf..842831e1fb 100644
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
@@ -2782,7 +2784,7 @@ summary_info += {'PAM':               pam.found()}
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



