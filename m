Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C82F3721
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:31:45 +0100 (CET)
Received: from localhost ([::1]:56628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNWC-00052Q-Mh
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG8-0003h1-Qg
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:08 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG6-0004ue-1E
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:08 -0500
Received: by mail-ej1-x62b.google.com with SMTP id n26so4580652eju.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IZ0TOcz3fD2IXmTaYkpIyDqSBkwh9M+ZYZS1uqpiRXY=;
 b=o3Et6K5ixZkvDmuxUTnYZnbijsfeiA8B+FGEUI92hO7VaReiq2j+2iwblZ7yZVG90K
 rP9DdU31cHpMGpIM2lgQTq0leWWA517gNtdVa5wE42rWzEKzS7dHO0xi6iRMq6jWrU5K
 UdA4Tmdca/9qmqsHbaY5Upu+zgsnoHMfN59y3tse0CfdFBV4/CB0H2LGjiwl1458TwSv
 nihCkzhc3CSlxC0XUYEe2AXHo6MrrTDnO9tp31silSqgf6HVQAZjsyksIlPIjNopbWQO
 ZBa/Uq4wBCaJ2zy82Aogf5vIzHL/FjQjNW6BE/abaHxTpUkV4yVuknrsM8R2OLL1EW2G
 hMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IZ0TOcz3fD2IXmTaYkpIyDqSBkwh9M+ZYZS1uqpiRXY=;
 b=YaLggcWsu2cH6z6MM95Hn3ZWiPzEUnqkzqBgCDxDhKBDUhjr+PLpp2UTfpZEMlxO6S
 K6NO9qbNujQl9plFE+LKL0rzuI/dVLw2baxZYyzhZHGFW52852LW1HwD2jw2ebi1gZUE
 4pfTG9svoxIBeNlUm2SFxoE6fBwH1lH+TWfPZefj6+gKB7uZ/IXoRe/273yX1ScS4nb3
 MbIYsWneHaVCo0bC6X0oEKz8spdIoLBI1pOPeZvilmRsLVKc3+FQ6gJm576XsS1LyYEN
 QREwpqV1kX+7zV1NfeYJ/CTxeb9kTQuLLBysLoCUle/i4O6XpXvaFwNPj1wdFdN0KTHI
 zZtQ==
X-Gm-Message-State: AOAM531sjq26KZsk+yd4Fn3OQHFWTtarxTRPYfxpM5dAeTp2l3GGGZvR
 hb1hp2AYLfphGvgbYQEC115Nc1osKnv7rA==
X-Google-Smtp-Source: ABdhPJyXREYCFAxTktMEnx1jYEkkBkeKql8gqARt1qYU1Gjx5D+w1XdJOXkb0k/SnY3mm79367ErWw==
X-Received: by 2002:a17:907:3f29:: with SMTP id
 hq41mr2883536ejc.227.1610471702981; 
 Tue, 12 Jan 2021 09:15:02 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] meson: Propagate gnutls dependency
Date: Tue, 12 Jan 2021 18:14:42 +0100
Message-Id: <20210112171450.791427-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Bolshakov <r.bolshakov@yadro.com>

crypto/tlscreds.h includes GnuTLS headers if CONFIG_GNUTLS is set, but
GNUTLS_CFLAGS, that describe include path, are not propagated
transitively to all users of crypto and build fails if GnuTLS headers
reside in non-standard directory (which is a case for homebrew on Apple
Silicon).

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20210102125213.41279-1-r.bolshakov@yadro.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build          | 2 +-
 io/meson.build             | 2 +-
 meson.build                | 5 +++--
 storage-daemon/meson.build | 2 +-
 tests/meson.build          | 6 +++---
 ui/meson.build             | 2 +-
 6 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index d44c92ab04..eeaefe5809 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -40,7 +40,7 @@ block_ss.add(files(
   'vmdk.c',
   'vpc.c',
   'write-threshold.c',
-), zstd, zlib)
+), zstd, zlib, gnutls)
 
 softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
 
diff --git a/io/meson.build b/io/meson.build
index bcd8b1e737..bbcd3c53a4 100644
--- a/io/meson.build
+++ b/io/meson.build
@@ -12,4 +12,4 @@ io_ss.add(files(
   'dns-resolver.c',
   'net-listener.c',
   'task.c',
-))
+), gnutls)
diff --git a/meson.build b/meson.build
index bd4ff3118b..5e95dd6c93 100644
--- a/meson.build
+++ b/meson.build
@@ -1814,7 +1814,7 @@ blockdev_ss.add(files(
   'blockdev-nbd.c',
   'iothread.c',
   'job-qmp.c',
-))
+), gnutls)
 
 # os-posix.c contains POSIX-specific functions used by qemu-storage-daemon,
 # os-win32.c does not
@@ -1970,6 +1970,7 @@ qmp = declare_dependency(link_whole: [libqmp])
 
 libchardev = static_library('chardev', chardev_ss.sources() + genh,
                             name_suffix: 'fa',
+                            dependencies: [gnutls],
                             build_by_default: false)
 
 chardev = declare_dependency(link_whole: libchardev)
@@ -2188,7 +2189,7 @@ if have_tools
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
-               dependencies: [blockdev, qemuutil], install: true)
+               dependencies: [blockdev, qemuutil, gnutls], install: true)
 
   subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
diff --git a/storage-daemon/meson.build b/storage-daemon/meson.build
index c5adce81c3..68852f3d25 100644
--- a/storage-daemon/meson.build
+++ b/storage-daemon/meson.build
@@ -1,6 +1,6 @@
 qsd_ss = ss.source_set()
 qsd_ss.add(files('qemu-storage-daemon.c'))
-qsd_ss.add(blockdev, chardev, qmp, qom, qemuutil)
+qsd_ss.add(blockdev, chardev, qmp, qom, qemuutil, gnutls)
 
 subdir('qapi')
 
diff --git a/tests/meson.build b/tests/meson.build
index 1fa068f27b..29ebaba48d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -159,11 +159,11 @@ if have_block
      'CONFIG_POSIX' in config_host
     tests += {
       'test-crypto-tlscredsx509': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
-                                   tasn1, crypto],
+                                   tasn1, crypto, gnutls],
       'test-crypto-tlssession': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c', 'crypto-tls-psk-helpers.c',
-                                 tasn1, crypto],
+                                 tasn1, crypto, gnutls],
       'test-io-channel-tls': ['io-channel-helpers.c', 'crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
-                              tasn1, io, crypto]}
+                              tasn1, io, crypto, gnutls]}
   endif
   if 'CONFIG_AUTH_PAM' in config_host
     tests += {'test-authz-pam': [authz]}
diff --git a/ui/meson.build b/ui/meson.build
index 013258a01c..e6655c94a6 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -29,7 +29,7 @@ vnc_ss.add(files(
   'vnc-ws.c',
   'vnc-jobs.c',
 ))
-vnc_ss.add(zlib, png, jpeg)
+vnc_ss.add(zlib, png, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
 softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
 softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
-- 
2.29.2



