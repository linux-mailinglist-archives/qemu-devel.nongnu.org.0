Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C3508C4D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:38:24 +0200 (CEST)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCPP-0007dl-LZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLU-0001Am-O3
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLR-0000tR-Hg
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e21so2774558wrc.8
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bl5Z1tGN6bAdcGAXv9pgBgtN/4cVjBI/taIq0mznbug=;
 b=P/5mpN/skoyqVvZy3A9Fmn157spOeStivojnNJQnK4G4Fg9cC9r56iqBXJLpTx4SDA
 Dlf0rPkByxiehG6fMfBldnnXC1/xIKDcTmtaNDhDDIb2o07yVqzk6dInsjRYJLLH0Gan
 gLfrzS22rGFiDYB1dyMIpy6EvmexCGZRgEnpVwPcYNtFBQaCKvFAd97wAMBRyjTO2G5M
 n8h7cAeeeMST0BOn+9oRrBrOhBk/nWLCRQ5PrHFIqGfQHkUaWVZfj8ud+Df50yCFHTpP
 276KZmUi7p6KK6nwGnqRSvfs3ngqXix1rOw6PLy1x0BZeTAm4PEAtwnkr1Tm7eDepFPA
 dSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bl5Z1tGN6bAdcGAXv9pgBgtN/4cVjBI/taIq0mznbug=;
 b=wdLEQAEzALXdCmDiOHCFks3xhscLgiCfPBRxSLz7j5HvNC3VYqZ/ZrIv8Z26Kq5Hi2
 0pRiUtiUk1un9m6tJ+L16xEQlQDGwBdnA6OL6RDy9aOa3oDVGb/oeFvwEEDwSSuxDAUb
 RmgMQQZf9e6nTrNrLi5FwO30qeai6h/oJX7eVueCACjwFqXwdPjS6ypFmgo1103AqDqN
 B+Xs9fJeO/fjbg5mioegGV0GxoWh2e+/gA1NuXyxIov3ZFiNF3C8Ga33g4ZbE57s/uUb
 V/wjYCjFe9xikB+T6Yd8i4bnNOGqQLn7/qo570doaVpNUYv7I+WWlXXL5IyhqaI4rj1R
 GDMg==
X-Gm-Message-State: AOAM533F/0MreUhkxTtRtDdWBxwbFI+mmqUwz+uD7Ldl6tH61S50sOro
 m+Cut90NB/ULF4duxfgqQfCpF15cvBPn2A==
X-Google-Smtp-Source: ABdhPJxpH9/drYrU03xU+GZ/MM6VVtx9pd4/fLgsr00IiILCRPPbq8kBFhyCP/+KFhn/AZD6HHpJcw==
X-Received: by 2002:adf:e10a:0:b0:20a:86a3:d06f with SMTP id
 t10-20020adfe10a000000b0020a86a3d06fmr16333424wrz.249.1650468856031; 
 Wed, 20 Apr 2022 08:34:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/34] qga: wixl: get path to sysroot from pkg-config as
 intended
Date: Wed, 20 Apr 2022 17:33:36 +0200
Message-Id: <20220420153407.73926-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The .wxs file uses $(var.Mingw_bin) while configure/meson have always
used Mingw_dlls.  Fix them to match what was probably intended.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure       | 4 ++--
 qga/meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 2fc860ed9a..2bc5a0b84f 100755
--- a/configure
+++ b/configure
@@ -2702,7 +2702,7 @@ if test "$QEMU_GA_VERSION" = ""; then
     QEMU_GA_VERSION=$(cat $source_path/VERSION)
 fi
 
-QEMU_GA_MSI_MINGW_DLL_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
+QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 
 # Mac OS X ships with a broken assembler
 roms=
@@ -2790,7 +2790,7 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >> $config_host_mak
+  echo "QEMU_GA_MSI_MINGW_BIN_PATH=${QEMU_GA_MSI_MINGW_BIN_PATH}" >> $config_host_mak
   echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
   echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
   echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
diff --git a/qga/meson.build b/qga/meson.build
index 392d560941..6d9f39bb32 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -129,7 +129,7 @@ if targetos == 'windows'
                               wixl, '-o', '@OUTPUT0@', '@INPUT0@',
                               qemu_ga_msi_arch[cpu],
                               qemu_ga_msi_vss,
-                              '-D', 'Mingw_dlls=' + config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
+                              '-D', 'Mingw_bin=' + config_host['QEMU_GA_MSI_MINGW_BIN_PATH'],
                             ])
     all_qga += [qga_msi]
     alias_target('msi', qga_msi)
-- 
2.35.1



