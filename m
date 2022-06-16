Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF654DF5D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:44:18 +0200 (CEST)
Received: from localhost ([::1]:48172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mz3-0002AG-8l
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjm-0001mb-2A
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:30 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjk-0001sk-9r
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:29 -0400
Received: by mail-lj1-x234.google.com with SMTP id h23so1010679ljl.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ducfZ4paWMGIqaT6FCEcSnD0dMfGs217Vzqx2VvEnlI=;
 b=A075IN1DaGyrPn2Mx34pUcHyL0RVFBA5UQJNmLatFrLa59iCRthazLvhakcGdn6u6O
 G8uiZ/tmC33WG1mIzN1aRQ+deOy6KktAMJsZkRho+XkaLvi3yDk3aT4RsNscmJeHTKXt
 SNKq1lD7K3X5X5LApnYnnuVkFtN8KlD3sU203URX4Lvp7Q1NsZfRic/vhlhH7tHI0zdj
 6ewtvDbWljv08j/TCmVc/3+EYEfsGuPJ9PLwqCNB06ORd2fGlIKa3Bgli3orAafwJWv6
 xLnBwNge3oS0nSOdk9Eog1aHkui5q85y14qWj2xvGhhdakPlc+42t6IBEbPdABEl/BNV
 ShDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ducfZ4paWMGIqaT6FCEcSnD0dMfGs217Vzqx2VvEnlI=;
 b=Nx2+TW+BC8nX4bXJf/ekclacs8yZjreWJNkgwdJ9Hzqm/sAEcnFqH1zSvssT7iilpo
 /X+Q20ppGZqpP+YLEgmIb6VrX7uARjbyYVMfSjEhcwo8XLHKsl9kS3TDVyduyeJp2D+T
 /ZTmlcWkmJBdZwTQd1wWvkhc9yPBhVhDHAs1Rg/V8wmimu596P4d2hha1nN/VVcMIGdz
 biY0wN/kE5qXUGEPtyQ1Tu7NUlfWKjGHGoCl1d/ZdKVMtVYJ25dxGEgdjaGuXOVSw7Wn
 H5eCbgKiBYLdTcZwtfJqiCZUQSjtNb6ufDVLfO2I6uuxsXEXNUz2gYakENd7LeAb/P5G
 26cg==
X-Gm-Message-State: AJIora8e9N0JJdDzd1MEEFlS+QGxy0yGmFJtLKkRqv0tbTtsU+bP68EN
 KbUD+jOmgvVyFAQGHLf4zioGdLxqgv8E6st8
X-Google-Smtp-Source: AGRyM1uB9WC8CRW/diHiWSTC6ByZNd4C6kpgHarJUyqT1d8Z+8gdfvF37AZWtNIEl9YuxGZWtjdHJA==
X-Received: by 2002:a2e:9815:0:b0:255:be2d:2fae with SMTP id
 a21-20020a2e9815000000b00255be2d2faemr2087031ljj.435.1655375306650; 
 Thu, 16 Jun 2022 03:28:26 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:26 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 10/17] migration/snapshot: Build changes for
 qemu-snapshot-tool
Date: Thu, 16 Jun 2022 13:28:04 +0300
Message-Id: <20220616102811.219007-11-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

Tool uses part of migration code thus new lib with stubs for migration
code is added here.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 meson.build           | 18 ++++++++++++++++++
 migration/meson.build |  3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 2d6601467f..ba3b9ab4bd 100644
--- a/meson.build
+++ b/meson.build
@@ -3287,6 +3287,16 @@ if xkbcommon.found()
 endif
 
 if have_tools
+  tool_inc = include_directories('include/hw/core', 'include')
+  lib_tool = static_library('snapshot-tool',
+                            sources: [migration_files],
+                            dependencies: arch_deps,
+                            include_directories: [tool_inc, target_inc],
+                            name_suffix: 'fa',
+                            build_by_default: false)
+  snapshot_tool = declare_dependency(link_with: lib_tool,
+                                   dependencies: [zlib, qom, io])
+
   qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
   qemu_io = executable('qemu-io', files('qemu-io.c'),
@@ -3294,6 +3304,14 @@ if have_tools
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [blockdev, qemuutil, gnutls, selinux],
                install: true)
+  qemu_snapshot = executable('qemu-snapshot',
+                             files('qemu-snapshot.c'),
+                             dependencies: [snapshot_tool] + arch_deps + deps,
+                             objects: lib.extract_all_objects(recursive: true),
+                             link_depends: [block_syms, qemu_syms],
+                             link_args: link_args,
+
+			     install: true)
 
   subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
diff --git a/migration/meson.build b/migration/meson.build
index 8b5ca5c047..13498a6db3 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -7,6 +7,8 @@ migration_files = files(
   'qemu-file-channel.c',
   'qemu-file.c',
   'yank_functions.c',
+  'migration.c',
+  'qemu-snapshot.c',
 )
 softmmu_ss.add(migration_files)
 
@@ -18,7 +20,6 @@ softmmu_ss.add(files(
   'exec.c',
   'fd.c',
   'global_state.c',
-  'migration.c',
   'multifd.c',
   'multifd-zlib.c',
   'postcopy-ram.c',
-- 
2.31.1


