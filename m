Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED032F6998
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:32:51 +0100 (CET)
Received: from localhost ([::1]:51866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07QQ-0002Ed-7D
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06gk-0000a5-1k
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06gW-0005pr-G3
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=waRpQeMmI+OyRXJ1iEv747KR9KPmFDzQu/Etfs943VI=;
 b=b3bQvicDKj4gpcO7cwgnuyxixcFeKDmY/nbDNhJoiAOermTqgfoZ+5ADh52WHbfHQWMhNP
 FBVeRm/hqO2TTyamSM+kPYicbzCRa+Cul7iVcDmG+UZ5JGdHdti9EFxcRspRUshGimlC3h
 RCmlBKNFFjMmdVoN0P65+ObFmjIRNXs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-6yUwEM3mPc-PPS0cTiY13w-1; Thu, 14 Jan 2021 12:45:18 -0500
X-MC-Unique: 6yUwEM3mPc-PPS0cTiY13w-1
Received: by mail-wm1-f71.google.com with SMTP id r1so2148777wmn.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=waRpQeMmI+OyRXJ1iEv747KR9KPmFDzQu/Etfs943VI=;
 b=NRYFQSaeRkRupX0vMvntljR+TUndEQa6wU7VOpDfV3VAzdanYCve47z4BKSk6HlIva
 vJvC0w85BbTI6HNp2wbySExkILBohudIDIfM0wc3sXwtM581wOjfd8utozellLK7GGEh
 p7ZaVflAyO/a7Ok5zq6GqqZUYQ1F5lyOzFDYgIY7Q2f0q0j5IBxs8IQkjHMXLDI17dim
 W9MR9EVpziWwjo9bSv1KWo8aL04XKeQn+8BKyR0HpuVbbOoyLjRzbKTU5j/Qh+jYcJnv
 0DJPIFdoyvjTkfPVnm1JfZcuVdy63eCybL+u00pkZUTUXEJy8QGY2HO3tPsR+89C/nBR
 HyMw==
X-Gm-Message-State: AOAM532GsD6LwX8Bz99fQ1Gw6U5Q6mNI9gbiFL+5j3dTBR0AqQND1NJy
 Wxl0vKMjM130j5zUP2vXsPKuO90hzJ42lynTxXGYiMwIYGWBMIT/72knDidpn6mpKsA2o3ineAL
 6td5fTfgrvNki3ULa7X3rtv31yl3JdiFIoX9bQYDs8qJbq4r+I0sByo9v967lOz4y
X-Received: by 2002:a5d:6983:: with SMTP id g3mr9147158wru.168.1610646316814; 
 Thu, 14 Jan 2021 09:45:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRnlQSfYOEUr02LzYwEDlhTEnKxJrlGz/s32OGaWbZIqknNxDOsSQI53u7zRxH0bMPnunNog==
X-Received: by 2002:a5d:6983:: with SMTP id g3mr9147138wru.168.1610646316625; 
 Thu, 14 Jan 2021 09:45:16 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x17sm11131704wro.40.2021.01.14.09.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 09:45:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson.build: Declare global edk2_targets /
 install_edk2_blobs variables
Date: Thu, 14 Jan 2021 18:45:08 +0100
Message-Id: <20210114174509.2944817-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114174509.2944817-1-philmd@redhat.com>
References: <20210114174509.2944817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Globally declare in the main meson.build:
- the list of EDK2 targets,
- whether the EDK2 blobs have to be installed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Patch trivial to review using 'git-diff --ignore-all-space'
---
 meson.build                     |  8 ++++++++
 pc-bios/descriptors/meson.build | 30 ++++++++++++++++--------------
 pc-bios/meson.build             |  5 +----
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/meson.build b/meson.build
index 3d889857a09..ecc45d04d6a 100644
--- a/meson.build
+++ b/meson.build
@@ -88,6 +88,14 @@
   }
 endif
 
+edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
+install_edk2_blobs = false
+if get_option('install_blobs')
+  foreach target : target_dirs
+    install_edk2_blobs = install_edk2_blobs or target in edk2_targets
+  endforeach
+endif
+
 ##################
 # Compiler flags #
 ##################
diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
index 7040834573d..ac6ec66b007 100644
--- a/pc-bios/descriptors/meson.build
+++ b/pc-bios/descriptors/meson.build
@@ -1,14 +1,16 @@
-foreach f: [
-  '50-edk2-i386-secure.json',
-  '50-edk2-x86_64-secure.json',
-  '60-edk2-aarch64.json',
-  '60-edk2-arm.json',
-  '60-edk2-i386.json',
-  '60-edk2-x86_64.json'
-]
-  configure_file(input: files(f),
-                 output: f,
-                 configuration: {'DATADIR': qemu_datadir},
-                 install: get_option('install_blobs'),
-                 install_dir: qemu_datadir / 'firmware')
-endforeach
+if install_edk2_blobs
+  foreach f: [
+    '50-edk2-i386-secure.json',
+    '50-edk2-x86_64-secure.json',
+    '60-edk2-aarch64.json',
+    '60-edk2-arm.json',
+    '60-edk2-i386.json',
+    '60-edk2-x86_64.json'
+  ]
+    configure_file(input: files(f),
+                   output: f,
+                   configuration: {'DATADIR': qemu_datadir},
+                   install: get_option('install_blobs'),
+                   install_dir: qemu_datadir / 'firmware')
+  endforeach
+endif
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index fab323af84e..6a341b6cea0 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,7 +1,4 @@
-if 'arm-softmmu' in target_dirs or \
-    'aarch64-softmmu' in target_dirs or \
-    'i386-softmmu' in target_dirs or \
-    'x86_64-softmmu' in target_dirs
+if install_edk2_blobs
   bzip2 = find_program('bzip2', required: true)
   fds = [
     'edk2-aarch64-code.fd',
-- 
2.26.2


