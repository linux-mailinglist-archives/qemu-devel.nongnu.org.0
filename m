Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A04142A378
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:41:14 +0200 (CEST)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maG9h-0002n9-09
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFih-0000di-Jd
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:19 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFif-0007Y3-JW
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:19 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t16so57844194eds.9
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NottOK6IKSHb6MMzIarvvWPjwhgHe9PUz9NKaJzIngo=;
 b=o5ByMfOburnJE6GrDNMgjyVeYqfr6pZLVi6ZEN2S1HpzE8znSZOl622ly1yFiETAyz
 ROAtsAQ5kEKGNuASNUYgK8I0RLOd3u0yc3Z55xXyUSxz0sgTB13yf0g7ca2fekp4Vtfe
 ahdgOhhtRktF1K6U9e9zWY89HNAQUoeb/6E39ZsIV6zhh7rPCvG73erelpnoDETjIjYM
 aMqbmMyHP3amgEBsGbv5L8HhztVR6olhZYBLB7YwEANiAH9UgOxwUtSj0soZc69mUf6H
 Fn65kWBQdJs3yWellX6g/UPC0FPOUKhJT7CItPbSaF1Gt+USHa+sY0Oh5dpOywh60zip
 IP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NottOK6IKSHb6MMzIarvvWPjwhgHe9PUz9NKaJzIngo=;
 b=PrKygm/Hr9m5EBDFbprfbbIYNEcVi7OAcXWAfE8aA+gempuqWtRXh8eR2B6XO/JcfQ
 I1l6I7eY6UEhBNJQOw4DKVsE/qYtiwMFcta8Gil0SWGKqqIlYJjTtHkr/nQe8ORwSPHz
 W4GNoDxWXC+iPPEFs6MYiF3p7pPBVSVcVqV7kDoWb5MSARRVsFreSSQHRpwLPVRAxcxe
 +zMOQAgerLb7U6jWm3kx1V1gh8EilJq6kW63p4G77ve+P1r9OPo4/aerp1PGBdM7o1Z+
 tKyXswEKuOYsKCZuXlWjxL3V4od1cS+Hgh1u6Nno8JIx0DJwkQQVXeHMSALLggbvPD8D
 zaMw==
X-Gm-Message-State: AOAM530s+HKH8XGPGSpVEXrvJWyDIalo9bQKlGsw4nDMMFdhdfYQCDZk
 DblNdyS6B8Vpwa7jdMePli0gnVm2vQw=
X-Google-Smtp-Source: ABdhPJwIMdmkf0cibOANkDyQyWoQP3Xd5iauHdg6ttmwCye52gusteNqm2CdZYbUXlXtKXfzVfdmGA==
X-Received: by 2002:a50:cd97:: with SMTP id p23mr50310364edi.206.1634037196385; 
 Tue, 12 Oct 2021 04:13:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/24] configure, meson: move libaio check to meson.build
Date: Tue, 12 Oct 2021 13:12:53 +0200
Message-Id: <20211012111302.246627-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Message-Id: <20211007130829.632254-10-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build |  2 +-
 configure         | 31 ++++---------------------------
 meson.build       | 10 ++++++++--
 meson_options.txt |  2 ++
 stubs/meson.build |  4 +++-
 5 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 66ee11e62c..deb73ca389 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -65,7 +65,7 @@ block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit
 block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
 block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
 block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
-block_ss.add(when: ['CONFIG_LINUX_AIO', libaio], if_true: files('linux-aio.c'))
+block_ss.add(when: libaio, if_true: files('linux-aio.c'))
 block_ss.add(when: linux_io_uring, if_true: files('io_uring.c'))
 
 block_modules = {}
diff --git a/configure b/configure
index a1e142d5f8..86bc4b52d7 100755
--- a/configure
+++ b/configure
@@ -315,7 +315,7 @@ pa="auto"
 xen=${default_feature:+disabled}
 xen_ctrl_version="$default_feature"
 xen_pci_passthrough="auto"
-linux_aio="$default_feature"
+linux_aio="auto"
 linux_io_uring="auto"
 cap_ng="auto"
 attr="auto"
@@ -1196,9 +1196,9 @@ for opt do
   ;;
   --enable-fdt=system) fdt="system"
   ;;
-  --disable-linux-aio) linux_aio="no"
+  --disable-linux-aio) linux_aio="disabled"
   ;;
-  --enable-linux-aio) linux_aio="yes"
+  --enable-linux-aio) linux_aio="enabled"
   ;;
   --disable-linux-io-uring) linux_io_uring="disabled"
   ;;
@@ -3161,26 +3161,6 @@ if test "$libssh" != "no" ; then
   fi
 fi
 
-##########################################
-# linux-aio probe
-
-if test "$linux_aio" != "no" ; then
-  cat > $TMPC <<EOF
-#include <libaio.h>
-#include <sys/eventfd.h>
-#include <stddef.h>
-int main(void) { io_setup(0, NULL); io_set_eventfd(NULL, 0); eventfd(0, 0); return 0; }
-EOF
-  if compile_prog "" "-laio" ; then
-    linux_aio=yes
-  else
-    if test "$linux_aio" = "yes" ; then
-      feature_not_found "linux AIO" "Install libaio devel"
-    fi
-    linux_aio=no
-  fi
-fi
-
 ##########################################
 # TPM emulation is only on POSIX
 
@@ -4270,9 +4250,6 @@ if test "$xen" = "enabled" ; then
   echo "XEN_CFLAGS=$xen_cflags" >> $config_host_mak
   echo "XEN_LIBS=$xen_libs" >> $config_host_mak
 fi
-if test "$linux_aio" = "yes" ; then
-  echo "CONFIG_LINUX_AIO=y" >> $config_host_mak
-fi
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
 fi
@@ -4772,7 +4749,7 @@ if test "$skip_meson" = no; then
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
         -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
-        -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file \
+        -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index 97dda9aee7..5f16b17c97 100644
--- a/meson.build
+++ b/meson.build
@@ -400,9 +400,14 @@ if have_system or have_tools
   pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
                       method: 'pkg-config', kwargs: static_kwargs)
 endif
-libaio = cc.find_library('aio', required: false)
 zlib = dependency('zlib', required: true, kwargs: static_kwargs)
 
+libaio = not_found
+if not get_option('linux_aio').auto() or have_block
+  libaio = cc.find_library('aio', has_headers: ['libaio.h'],
+                           required: get_option('linux_aio'),
+                           kwargs: static_kwargs)
+endif
 linux_io_uring = not_found
 if not get_option('linux_io_uring').auto() or have_block
   linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
@@ -1427,6 +1432,7 @@ config_host_data.set('CONFIG_EBPF', libbpf.found())
 config_host_data.set('CONFIG_LIBDAXCTL', libdaxctl.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
+config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_RBD', rbd.found())
@@ -3288,7 +3294,7 @@ summary_info += {'JACK support':      jack}
 summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
-summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
+summary_info += {'Linux AIO support': libaio}
 summary_info += {'Linux io_uring support': linux_io_uring}
 summary_info += {'ATTR/XATTR support': libattr}
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
diff --git a/meson_options.txt b/meson_options.txt
index 8f9c3b5b17..904e15d54c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -103,6 +103,8 @@ option('libusb', type : 'feature', value : 'auto',
        description: 'libusb support for USB passthrough')
 option('libxml2', type : 'feature', value : 'auto',
        description: 'libxml2 support for Parallels image format')
+option('linux_aio', type : 'feature', value : 'auto',
+       description: 'Linux AIO support')
 option('linux_io_uring', type : 'feature', value : 'auto',
        description: 'Linux io_uring support')
 option('lzfse', type : 'feature', value : 'auto',
diff --git a/stubs/meson.build b/stubs/meson.build
index beee31ec73..f6aa3aa94f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -20,7 +20,9 @@ endif
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
-stub_ss.add(when: 'CONFIG_LINUX_AIO', if_true: files('linux-aio.c'))
+if libaio.found()
+  stub_ss.add(files('linux-aio.c'))
+endif
 stub_ss.add(files('migr-blocker.c'))
 stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
-- 
2.31.1



