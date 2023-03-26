Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988966C97F1
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 23:07:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgXYm-0004qM-T5; Sun, 26 Mar 2023 17:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgXYl-0004qD-2T
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 17:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgXYj-00054Q-57
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 17:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679864748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=e8ixMzmyjjPlv56jcjntuc5sNZcP63heUbpbqeTRPr0=;
 b=hQS69nvI1AZ/ipWXcD3tCd+rbyObmvNE5EQHzjOS15+jp/7QKP9oMw9Z1c112V0kh1tvnE
 STk+1SULXSvyrmhpQiAJtkq10WaLHsF9J1VtJTE0FqIjRR7Irw958NL8U9+CDWcKcgR1tD
 1TsEI5AXcfU3jYypb97c2Q3bXXUF31Y=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-uOiDdNMLPMOQrkLb6VnTKg-1; Sun, 26 Mar 2023 17:04:34 -0400
X-MC-Unique: uOiDdNMLPMOQrkLb6VnTKg-1
Received: by mail-oi1-f199.google.com with SMTP id
 bg21-20020a056808179500b003869b702d75so1129902oib.17
 for <qemu-devel@nongnu.org>; Sun, 26 Mar 2023 14:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679864673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e8ixMzmyjjPlv56jcjntuc5sNZcP63heUbpbqeTRPr0=;
 b=ekVHfdomjtDh1WKivtdhvI8+JsgVv6i/JgRJbnjrsLONIWRXKFBtICC5uGCCh8sFlF
 HkGhTX95uTuXp0hkXtFciI42Z5ZUzriFlsRaxExl6LGfchsKf+vEqYh3W3A9dxUxNy3S
 61MSeE9htX9HmB1YryOkFA3r7xDy/Rp57fJFL55rQv+bw/qbSPf7dyfp1tZcrokRIS7R
 aIzktTBxgBuKiOIvh32Ct6zn5Gsu0P1iWvYDZko7hPD6afTHMTovSnvPEq3rIksp43MH
 gB/WjT6Uot/cygnQn3E1tiqSgw9NzK6N2avAY8rNt3ko02Ymj3PdRTTDkuhor0vaanyp
 teEA==
X-Gm-Message-State: AO0yUKWuWTfcG4pSARn9dHUxrf8sDmh6g9Gw8pHaodmv5W6jBM6wDjKH
 nkdmzxe0AQbdGpxtD4or5iOoU2Ee+bCSrTwF4JXB3uhTlUQYO+64Tf0LZkzLQvuSoYkOBOl/yHL
 UqS5xFkt/+4xK0IX/FWzmIkawdG9QeRaq1t4KrLHJIKN+xX1VJqIvHIIpdxotyKjD74v4Hd0YgW
 4=
X-Received: by 2002:a4a:4950:0:b0:51a:7a15:9758 with SMTP id
 z77-20020a4a4950000000b0051a7a159758mr4952482ooa.5.1679864673472; 
 Sun, 26 Mar 2023 14:04:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set899iUwFdacuqqDWbSkqLV3f0SwlTVUKylSbmoha3rpEMHohS1m4SHUklHVuzvG4eDOV6NOAA==
X-Received: by 2002:a4a:4950:0:b0:51a:7a15:9758 with SMTP id
 z77-20020a4a4950000000b0051a7a159758mr4952476ooa.5.1679864673126; 
 Sun, 26 Mar 2023 14:04:33 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 p45-20020a4a95f0000000b0051fdb2cba97sm10764648ooi.7.2023.03.26.14.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 14:04:32 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH] meson: install keyboard maps only if necessary
Date: Sun, 26 Mar 2023 18:04:27 -0300
Message-Id: <20230326210427.66079-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos Santos <casantos@redhat.com>

They are required only for system emulation (i.e. have_system is true).

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
 pc-bios/keymaps/meson.build   | 6 ++++--
 scripts/meson-buildoptions.sh | 2 ++
 tests/fp/berkeley-testfloat-3 | 2 +-
 ui/keycodemapdb               | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 158a3b410c..bff3083313 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
                        build_by_default: true,
                        output: km,
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                       install: true,
+                       install: have_system,
                        install_dir: qemu_datadir / 'keymaps')
   endforeach
 
@@ -56,4 +56,6 @@ else
   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+if have_system
+  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+endif
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..6eec7bc57f 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -301,6 +301,8 @@ _meson_option_parse() {
     --includedir=*) quote_sh "-Dincludedir=$2" ;;
     --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
     --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
+    --enable-install-keymaps) printf "%s" -Dinstall_keymaps=true ;;
+    --disable-install-keymaps) printf "%s" -Dinstall_keymaps=false ;;
     --interp-prefix=*) quote_sh "-Dinterp_prefix=$2" ;;
     --enable-jack) printf "%s" -Djack=enabled ;;
     --disable-jack) printf "%s" -Djack=disabled ;;
diff --git a/tests/fp/berkeley-testfloat-3 b/tests/fp/berkeley-testfloat-3
index 40619cbb3b..5a59dcec19 160000
--- a/tests/fp/berkeley-testfloat-3
+++ b/tests/fp/berkeley-testfloat-3
@@ -1 +1 @@
-Subproject commit 40619cbb3bf32872df8c53cc457039229428a263
+Subproject commit 5a59dcec19327396a011a17fd924aed4fec416b3
diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index f5772a62ec..d21009b1c9 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6
+Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
-- 
2.31.1


