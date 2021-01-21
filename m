Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C1B2FE704
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:03:57 +0100 (CET)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wom-0001qq-1Z
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WiR-0003Ak-QF
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WiP-0007xh-11
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ig1Up8363DqhIuhXF4HA9fSpX9TJiz8xfIHS77NRSWw=;
 b=BqwG7CekZOfsh/o6dHSS9E6PlVVbUrqYxsZE/Fyfbe/9uu0/ZGqgyl9ClcZbl+dpssOdir
 dxL5hxg3PAl6ZyVkQr3Bz0FYIkkihtj6uwBStflaxPVCWrmSFN2yQBagceeMeoMzbUXpTU
 OrPedusHAy+xJAtkwxv86vUfJ5llPww=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-EgjvmwdPMfelEnMoUursig-1; Thu, 21 Jan 2021 04:57:18 -0500
X-MC-Unique: EgjvmwdPMfelEnMoUursig-1
Received: by mail-ej1-f69.google.com with SMTP id j14so536836eja.15
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ig1Up8363DqhIuhXF4HA9fSpX9TJiz8xfIHS77NRSWw=;
 b=bCteuU8mWIqYliSAS1K1zm1Wy9kyp3g7e7ieyZAiQVI54KTVDyBfevNkP7DW+BIgbK
 IojodcstswNjT9fjOoHUVFWiX+nUVFTkw2E22z46aGYqX/+cfr1xB9Th2eH4z1dkyHCF
 3sp0MwNbS975aM2AmY4zkbQqmD9SbtY2rWNO8N5g7wLBN71a6HKLnDEUL6xadGt31uCM
 oy6uf1l2S8TDRXO++jYYpEB5r4pErHFQeNEm9j55wlaxgG59+iJU6u6Lm0UVEUjrUSeh
 IWc8EuoQCakxBtm1o/9vZRWlgoULott5mjLVNQBL/5tHwHHX9dV3pMM/7tZIF/+Qrb5x
 +NwQ==
X-Gm-Message-State: AOAM532caGX4TqJcHPnY6V1sAqUoWpN2/VNK8fgAne657UYYV4ppoHk4
 kLrUeVM+3oMQ/Iu3CKOsvUnRWTxzbjMB9zLOLkNtpRkGOScJqp0skETOtrOwxGWIxr95PKq0vmv
 s1pIEghbz0xSvBzbLSsRP7wa8iztJCgSUmurruTtJkwt/AaAasb7HvdOsLgxh95a8
X-Received: by 2002:a17:906:f0c4:: with SMTP id
 dk4mr8743527ejb.225.1611223036810; 
 Thu, 21 Jan 2021 01:57:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZkdoFYtf3OSFA1X+b8NMFlpmxOXMzu0EZBvMhDCHuF/HJ12ydx1TdDfq8Ez+lNscFr1X0Pg==
X-Received: by 2002:a17:906:f0c4:: with SMTP id
 dk4mr8743516ejb.225.1611223036582; 
 Thu, 21 Jan 2021 01:57:16 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id lv13sm2000370ejb.55.2021.01.21.01.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:57:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] meson: Display library dependencies altogether
Date: Thu, 21 Jan 2021 10:56:16 +0100
Message-Id: <20210121095616.1471869-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121095616.1471869-1-philmd@redhat.com>
References: <20210121095616.1471869-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 62 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 29 deletions(-)

diff --git a/meson.build b/meson.build
index 9274775a81a..8535a83fb70 100644
--- a/meson.build
+++ b/meson.build
@@ -2473,6 +2473,7 @@
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary(summary_info, bool_yn: true, section: 'Crypto')
 
+# Libraries
 summary_info = {}
 summary_info += {'sparse enabled':    sparse.found()}
 if targetos == 'darwin'
@@ -2503,22 +2504,6 @@
 summary_info += {'brlapi support':    brlapi.found()}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
-summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
-summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
-summary_info += {'ATTR/XATTR support': libattr.found()}
-summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
-summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
-summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
-summary_info += {'libcap-ng support': libcap_ng.found()}
-summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
-summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
-summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
-summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
-summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
-summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
-summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
-summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
-summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
 # TODO: add back protocol and server version
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
 summary_info += {'rbd support':       rbd.found()}
@@ -2531,28 +2516,47 @@
 summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
+summary_info += {'ATTR/XATTR support': libattr.found()}
+summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
+summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
+summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
+summary_info += {'libcap-ng support': libcap_ng.found()}
+summary_info += {'seccomp support':   seccomp.found()}
+summary_info += {'GlusterFS support': glusterfs.found()}
+summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
+summary_info += {'lzo support':       lzo.found()}
+summary_info += {'snappy support':    snappy.found()}
+summary_info += {'bzip2 support':     libbzip2.found()}
+summary_info += {'lzfse support':     liblzfse.found()}
+summary_info += {'zstd support':      zstd.found()}
+summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
+summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
+summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
+summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
+summary_info += {'libudev':           libudev.found()}
+summary(summary_info, bool_yn: true, section: 'Dependencies')
+
+summary_info = {}
+summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
+summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
+summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
+summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
+summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
+summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
+summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
+summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
+summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
+summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
+summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 if targetos == 'windows'
   summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
   summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
-summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
-summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
-summary_info += {'lzo support':       lzo.found()}
-summary_info += {'snappy support':    snappy.found()}
-summary_info += {'bzip2 support':     libbzip2.found()}
-summary_info += {'lzfse support':     liblzfse.found()}
-summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
-summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
-summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
-summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
-summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
-summary_info += {'libudev':           libudev.found()}
 summary(summary_info, bool_yn: true, section: 'Misc')
 
 if not supported_cpus.contains(cpu)
-- 
2.26.2


