Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868624253D8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:13:43 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTDS-0005bQ-IX
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8a-0005RE-Or
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:40 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Y-0007mw-Pb
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:40 -0400
Received: by mail-ed1-x533.google.com with SMTP id b8so22997077edk.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZyHtkZsEYa+0ootTEE7Q8sxq/7+jkDMFxfhrxs70ppw=;
 b=HNyjfE7QCN/bKUWauugpj98nZW9wk2WfzFfNMohG8qHV/Xp8+Walg9XlAS3cyKPE3I
 olq6e0hgHn9zpFVFUhK90sGeohJuazv2mSooKMVReXHKmbKvU59dIeUQW9zW1sCbgKqX
 bpriCsaLsWHbxYNXApYnQWu6fIDX1HdH6IBPauNYDo+GzA1fRU1R6m4HZY2Aj16sKPFB
 Vb0qeuU9+a27408uRcxegLzXKj4DG9/1t1+qC31Kfh8Rlk9l1ct6yt61xQQGzoaK25q1
 gy6W8/NEPAqqZrpi5O0ABP97o3aq03o1jJNg+R1MzNQJ1ltmwlgBtCzNkhXcbvJQiqtd
 BSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZyHtkZsEYa+0ootTEE7Q8sxq/7+jkDMFxfhrxs70ppw=;
 b=fPQhZ8k0Vg4JLRvAl9/tlh4ru5BxX2fpjgiVH6j1fvZvom+RQ2s3aExFkymGpW9FFn
 N+cVQ8H8ttcUS9BfQGHwOqQgj5Kgp2ErA2Cg/SL2xUCRHAD8WEITKckKkMiJVuFZkXhu
 77GIBXmULbU8GIEBzS6xXMcMGrSkCwYFhgPSEte4h8rVOit1/BE5FsVOZZmXZyATNvjw
 zDbSmCO8tqibLxPEshr1pIJpQcl+coMKXiWi8Tjt7cBz95yH+h5kwxvk03PESNJjzZwt
 Lzr6nNj52f123rQFY5jDb4nHMSQHjUnihRpOK2PCG6hk5acAZNnKyw/Gc34VWkFt28/d
 QQvA==
X-Gm-Message-State: AOAM531V/OJ/Ym14jBTBrdppODhwCfI8iyxHcMv4LU/xHMdEB2a4P/lX
 baupaZK4V57t3OI1dgTP62/PSU9le+4=
X-Google-Smtp-Source: ABdhPJyTGm4IrT8AobKaRzwcNd4Ji21gj3aGS/NCQ1ywdxcg7mBnXFW4B0Z8CIF7vjuwoybj9EOhrw==
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr5474521ejc.494.1633612117048; 
 Thu, 07 Oct 2021 06:08:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/24] configure, meson: move libaio check to meson.build
Date: Thu,  7 Oct 2021 15:08:20 +0200
Message-Id: <20211007130829.632254-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
index 54b2afdb96..0be11e5e08 100644
--- a/meson.build
+++ b/meson.build
@@ -402,9 +402,14 @@ if have_system or have_tools
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
@@ -1429,6 +1434,7 @@ config_host_data.set('CONFIG_EBPF', libbpf.found())
 config_host_data.set('CONFIG_LIBDAXCTL', libdaxctl.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
+config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_RBD', rbd.found())
@@ -3291,7 +3297,7 @@ summary_info += {'JACK support':      jack}
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
index beee31ec73..c8568cf588 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -20,7 +20,9 @@ endif
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
-stub_ss.add(when: 'CONFIG_LINUX_AIO', if_true: files('linux-aio.c'))
+if libaio.found()
+  stub_ss.add(if_true: files('linux-aio.c'))
+endif
 stub_ss.add(files('migr-blocker.c'))
 stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
-- 
2.31.1



