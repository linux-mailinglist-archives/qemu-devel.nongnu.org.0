Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B0A2FD6DC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:27:21 +0100 (CET)
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HGK-0002WO-Mw
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2HCY-0008DM-SQ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:23:26 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2HCX-0000fb-6L
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:23:26 -0500
Received: by mail-ej1-x62e.google.com with SMTP id b5so18185599ejv.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VxLYgcAadEwzl3bgQSTgf+BoqBrBu3swiI8Wm6I0gok=;
 b=dw3r8bKwo5vjB7w5izTVissneHfB+u2Ma8fBWGpziMEKdkq8tzrU+PyMBHUV2e6GSa
 7MuTwCEw1YMOLLfbYRy1CR6LNRbrw4g+5JgydnC585oIh3xjEVC6/TZ0Vl9CCc5c532S
 cQiqnZL270+JdZl91JW+KrxdtF46DSWljEHh+DQJbo2u4UEQKkUz9RkHgaomFEcy7GwU
 i5eys6dWeX0V0tu4fVyBotnSzL0P/LKh9MnJMQWfchHf3bahUdJRy08EWOLpEAEi5ap5
 bDolrXuPcuDWid3hKYVPGdtrRIqa0TRg5VCxyrfeVK1/E0k70fggODk3hm2bCgA2iSZ3
 Fezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VxLYgcAadEwzl3bgQSTgf+BoqBrBu3swiI8Wm6I0gok=;
 b=lbXhWRv+0arSdgHNvNwYuPw0DoFYUetrWpEFD6BKQCpejeyP+ZFUiH1OS3Q1gaj7Ny
 4d4A94u60EuAxOuBMmCgRL12oek7jO+XPDTGLvrm0BEIoJ9Rgq1/bPLrwJNijBz/FIl6
 yDAX/wc8jLFFdKlR44Xn/fT5TGl1tNIH4vH8o15CxCL9+fzDOoiE9VG2m1thA3QRj7+p
 ms1ebz5GKer3vgSOOPSQaaFM9hs3EI9Dkwu4jb5QnNUqFqr/5lpUtMHfRjjMCEO3kLGa
 c/gGzs4PX0WkK+Ab0wCXB0VheW0Q+0WUKQTkEbrDKcPe5OUTkGTDjrp3LG9BfjRWxMQ2
 nGVQ==
X-Gm-Message-State: AOAM533kyK567L3/8zA9f362aUIjdvvi1kfWYh7BLb6n2D+qK1uVcxkO
 9YuYLvXhh/5dyJTGq+cCz+YSdRsw2agZuQ==
X-Google-Smtp-Source: ABdhPJy6/zRECryJ3XZATF9T6CAmqKGnUCgEkTJ+S/YhGiE+f0SbpXYJBLaE9XnG7mE0az8nlQAXlw==
X-Received: by 2002:a17:906:4f0d:: with SMTP id
 t13mr7064429eju.10.1611163403429; 
 Wed, 20 Jan 2021 09:23:23 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zk10sm1184007ejb.10.2021.01.20.09.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 09:23:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: Summarize configurable features together
Date: Wed, 20 Jan 2021 18:23:19 +0100
Message-Id: <20210120172320.26742-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120172320.26742-1-pbonzini@redhat.com>
References: <20210120172320.26742-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 74 +++++++++++++++++++++++++++--------------------------
 1 file changed, 38 insertions(+), 36 deletions(-)

diff --git a/meson.build b/meson.build
index 1d27f1b8bb..75ce835d48 100644
--- a/meson.build
+++ b/meson.build
@@ -2338,11 +2338,6 @@ if slirp_opt != 'disabled'
 endif
 summary_info += {'sparse enabled':    sparse.found()}
 
-summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
-if config_host.has_key('CONFIG_MODULES')
-  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
-endif
-
 # Targets and accelerators
 summary_info += {'target list':       ' '.join(target_dirs)}
 
@@ -2380,6 +2375,44 @@ if have_block
   summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
 endif
 
+# Features
+summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
+if config_host.has_key('CONFIG_MODULES')
+  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
+endif
+summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
+if targetos == 'windows'
+  summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
+  summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
+  summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
+endif
+summary_info += {'default devices':   get_option('default_devices')}
+summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
+summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
+if have_system
+  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
+endif
+summary_info += {'VirtFS support':    have_virtfs}
+summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
+summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
+summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
+summary_info += {'build virtiofs daemon': have_virtiofsd}
+summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
+summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
+summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
+summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
+summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
+summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
+summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
+summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
+summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
+summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
+summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
+if config_host['TRACE_BACKENDS'].split().contains('simple')
+  summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
+endif
+
+# Libraries
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
 endif
@@ -2411,11 +2444,6 @@ summary_info += {'curses support':    curses.found()}
 # TODO: add back version
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
-if have_system
-  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
-endif
-summary_info += {'VirtFS support':    have_virtfs}
-summary_info += {'build virtiofs daemon': have_virtiofsd}
 summary_info += {'Multipath support': mpathpersist.found()}
 summary_info += {'VNC support':       vnc.found()}
 if vnc.found()
@@ -2433,19 +2461,6 @@ summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
 summary_info += {'libcap-ng support': libcap_ng.found()}
-summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
-summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
-summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
-summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
-summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
-summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
-summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
-summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
-summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
-if config_host['TRACE_BACKENDS'].split().contains('simple')
-  summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
-endif
 # TODO: add back protocol and server version
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
 summary_info += {'rbd support':       rbd.found()}
@@ -2458,16 +2473,7 @@ summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
 summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
-summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
-if targetos == 'windows'
-  summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
-  summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
-  summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
-endif
 summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
-summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
-summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
@@ -2483,10 +2489,6 @@ summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capst
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
-summary_info += {'default devices':   get_option('default_devices')}
-summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
-summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
-summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
-- 
2.29.2



