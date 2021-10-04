Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9AC4208C7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:52:44 +0200 (CEST)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKeJ-0000kT-Em
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKbV-0006O1-VJ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:49:50 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKbT-0001wG-0W
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:49:49 -0400
Received: by mail-ed1-x52d.google.com with SMTP id l7so38856115edq.3
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wx/PjAyfkj4ohI4PJ7Vi/Y2903RdRJzTnW/zD2NVT8Q=;
 b=HJCf+LZcSdCACyZOwcljutk4YkhhN1Ul94AVr+2ARfJWDa3wZdXZu7dbaGrpfEetVn
 xprfl/USgA5W+DQSUyKDqRM+NOXaqCwOFJAyfOaAViZUe0NFv0Vc16SfS+2M1s1Ho1v/
 S+XXtux7+Wj3VkTXvD5I+oNMEjisJc6ykyeDAY8reNfaFH5j9dahC2iJqULN9fZLZcXr
 mlhx0AHqUjgpvVYya16TtwkyAf/zVcB41MqFdx0lpX6VBcfevu6AaXbCjJ8YYPmYg0ZZ
 MG38SHIDK53ztqT2YevpAEqOj1Ldztsvltp0gcN1K9pH2qw1OirB7vnmaq1F0re7y+H0
 hGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wx/PjAyfkj4ohI4PJ7Vi/Y2903RdRJzTnW/zD2NVT8Q=;
 b=a1T22rNmfWO5VdOVM3ZhT3X9V4SQ3fRyUyIfgPx59YrtWIPQm3xA3V/2RtDXREPQZM
 RRhTSZlTonoelNEF1vMk7h4eYj8H0beFii7PHwuRA/qI/ESmS4MSX36RlN7qYrptV7Wc
 LfDhmC7jwQLPO+PJq2yA2eqdEb8aqH+EIvZaehUeKZOkJwuYlEPImFKLC7RU9dzfOE+I
 hUBfQxt+qDqIQ5hzmX8Sx6XYUlh6T+jNCd0hEDe40LK0CMFKIbQd+ZObO+eyhG1S5C0k
 HkA8I/bL6CidUK+pHZYPvZMaJErYdRpKvg6I7DD00KVeuyg/pCqF3vp4pgtDZunLFe44
 H8UQ==
X-Gm-Message-State: AOAM533WOpPPi74o/zZcbUP98QbcaXag40vKddlDSbc+koXfYUDkk4GX
 RKw4Y4efkXaJTKI53xgVsLNfJ/rQAA8=
X-Google-Smtp-Source: ABdhPJxpJuRMcOdCNyOZpe2pNEMNWCOj5uOuD9x+EFiKpV0u84SiT4ZTiP14FyiZJR3msavbRtRHWQ==
X-Received: by 2002:a17:906:d196:: with SMTP id
 c22mr15810788ejz.231.1633340985432; 
 Mon, 04 Oct 2021 02:49:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id f4sm6264768ejf.61.2021.10.04.02.49.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:49:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] meson: show library versions in the summary
Date: Mon,  4 Oct 2021 11:49:43 +0200
Message-Id: <20211004094943.92925-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004093053.87883-1-pbonzini@redhat.com>
References: <20211004093053.87883-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Meson 0.57 allows passing external programs and dependency objects
to summary().  Use this to show library versions and paths in the
summary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 112 +++++++++++++++++++++++++---------------------------
 1 file changed, 54 insertions(+), 58 deletions(-)

diff --git a/meson.build b/meson.build
index 17e77fe4ef..7b596fdcd9 100644
--- a/meson.build
+++ b/meson.build
@@ -2859,13 +2859,13 @@ summary_info = {}
 summary_info += {'git':               config_host['GIT']}
 summary_info += {'make':              config_host['MAKE']}
 summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
-summary_info += {'sphinx-build':      sphinx_build.found()}
+summary_info += {'sphinx-build':      sphinx_build}
 if config_host.has_key('HAVE_GDB_BIN')
   summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
 endif
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and config_host.has_key('CONFIG_GUEST_AGENT')
-  summary_info += {'wixl':            wixl.found() ? wixl.full_path() : false}
+  summary_info += {'wixl':            wixl}
 endif
 if slirp_opt != 'disabled' and 'CONFIG_SLIRP_SMBD' in config_host
   summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
@@ -2956,7 +2956,7 @@ if get_option('cfi')
   summary_info += {'CFI debug support': get_option('cfi_debug')}
 endif
 summary_info += {'strip binaries':    get_option('strip')}
-summary_info += {'sparse':            sparse.found() ? sparse.full_path() : false}
+summary_info += {'sparse':            sparse}
 summary_info += {'mingw32 support':   targetos == 'windows'}
 
 # snarf the cross-compilation information for tests
@@ -3028,19 +3028,19 @@ if have_block
   summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
   summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
   summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
-  summary_info += {'FUSE exports':      fuse.found()}
+  summary_info += {'FUSE exports':      fuse}
 endif
 summary(summary_info, bool_yn: true, section: 'Block layer support')
 
 # Crypto
 summary_info = {}
 summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
-summary_info += {'GNUTLS support':    gnutls.found()}
-summary_info += {'GNUTLS crypto':     gnutls_crypto.found()}
-# TODO: add back version
-summary_info += {'libgcrypt':         gcrypt.found()}
-# TODO: add back version
-summary_info += {'nettle':            nettle.found()}
+summary_info += {'GNUTLS support':    gnutls}
+if gnutls.found()
+  summary_info += {'  GNUTLS crypto':   gnutls_crypto.found()}
+endif
+summary_info += {'libgcrypt':         gcrypt}
+summary_info += {'nettle':            nettle}
 if nettle.found()
    summary_info += {'  XTS':             xts != 'private'}
 endif
@@ -3052,76 +3052,72 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
 # Libraries
 summary_info = {}
 if targetos == 'darwin'
-  summary_info += {'Cocoa support':   cocoa.found()}
+  summary_info += {'Cocoa support':   cocoa}
 endif
-# TODO: add back version
-summary_info += {'SDL support':       sdl.found()}
-summary_info += {'SDL image support': sdl_image.found()}
-# TODO: add back version
-summary_info += {'GTK support':       gtk.found()}
-summary_info += {'pixman':            pixman.found()}
-# TODO: add back version
-summary_info += {'VTE support':       vte.found()}
-# TODO: add back version
-summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-summary_info += {'libtasn1':          tasn1.found()}
-summary_info += {'PAM':               pam.found()}
-summary_info += {'iconv support':     iconv.found()}
-summary_info += {'curses support':    curses.found()}
-# TODO: add back version
-summary_info += {'virgl support':     virgl.found()}
-summary_info += {'curl support':      curl.found()}
-summary_info += {'Multipath support': mpathpersist.found()}
-summary_info += {'VNC support':       vnc.found()}
+summary_info += {'SDL support':       sdl}
+summary_info += {'SDL image support': sdl_image}
+summary_info += {'GTK support':       gtk}
+summary_info += {'pixman':            pixman}
+summary_info += {'VTE support':       vte}
+summary_info += {'slirp support':     slirp_opt == 'internal' ? slirp_opt : slirp}
+summary_info += {'libtasn1':          tasn1}
+summary_info += {'PAM':               pam}
+summary_info += {'iconv support':     iconv}
+summary_info += {'curses support':    curses}
+summary_info += {'virgl support':     virgl}
+summary_info += {'curl support':      curl}
+summary_info += {'Multipath support': mpathpersist}
+summary_info += {'VNC support':       vnc}
 if vnc.found()
-  summary_info += {'VNC SASL support':  sasl.found()}
-  summary_info += {'VNC JPEG support':  jpeg.found()}
-  summary_info += {'VNC PNG support':   png.found()}
+  summary_info += {'VNC SASL support':  sasl}
+  summary_info += {'VNC JPEG support':  jpeg}
+  summary_info += {'VNC PNG support':   png}
 endif
-summary_info += {'brlapi support':    brlapi.found()}
+summary_info += {'brlapi support':    brlapi}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
-summary_info += {'Linux io_uring support': linux_io_uring.found()}
-summary_info += {'ATTR/XATTR support': libattr.found()}
+summary_info += {'Linux io_uring support': linux_io_uring}
+summary_info += {'ATTR/XATTR support': libattr}
 summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
-summary_info += {'libcap-ng support': libcap_ng.found()}
-summary_info += {'bpf support': libbpf.found()}
+summary_info += {'libcap-ng support': libcap_ng}
+summary_info += {'bpf support':       libbpf}
 # TODO: add back protocol and server version
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
-summary_info += {'rbd support':       rbd.found()}
+summary_info += {'rbd support':       rbd}
 summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
-summary_info += {'smartcard support': cacard.found()}
-summary_info += {'U2F support':       u2f.found()}
-summary_info += {'libusb':            libusb.found()}
-summary_info += {'usb net redir':     usbredir.found()}
+summary_info += {'smartcard support': cacard}
+summary_info += {'U2F support':       u2f}
+summary_info += {'libusb':            libusb}
+summary_info += {'usb net redir':     usbredir}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
-summary_info += {'GBM':               gbm.found()}
-summary_info += {'libiscsi support':  libiscsi.found()}
-summary_info += {'libnfs support':    libnfs.found()}
+summary_info += {'GBM':               gbm}
+summary_info += {'libiscsi support':  libiscsi}
+summary_info += {'libnfs support':    libnfs}
 if targetos == 'windows'
   if config_host.has_key('CONFIG_GUEST_AGENT')
     summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
     summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
   endif
 endif
-summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'GlusterFS support': glusterfs.found()}
+summary_info += {'seccomp support':   seccomp}
+summary_info += {'GlusterFS support': glusterfs}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
-summary_info += {'lzo support':       lzo.found()}
-summary_info += {'snappy support':    snappy.found()}
-summary_info += {'bzip2 support':     libbzip2.found()}
-summary_info += {'lzfse support':     liblzfse.found()}
-summary_info += {'zstd support':      zstd.found()}
+summary_info += {'lzo support':       lzo}
+summary_info += {'snappy support':    snappy}
+summary_info += {'bzip2 support':     libbzip2}
+summary_info += {'lzfse support':     liblzfse}
+summary_info += {'zstd support':      zstd}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
-summary_info += {'libxml2':           libxml2.found()}
-summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
-summary_info += {'libpmem support':   libpmem.found()}
-summary_info += {'libdaxctl support': libdaxctl.found()}
-summary_info += {'libudev':           libudev.found()}
+summary_info += {'libxml2':           libxml2}
+summary_info += {'capstone':          capstone_opt == 'internal' ? capstone_opt : capstone}
+summary_info += {'libpmem support':   libpmem}
+summary_info += {'libdaxctl support': libdaxctl}
+summary_info += {'libudev':           libudev}
+# Dummy dependency, keep .found()
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
-- 
2.31.1


