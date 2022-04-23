Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98450CA40
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 14:56:26 +0200 (CEST)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFJJ-0001J4-Jq
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 08:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF8-0006Zm-Kv
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:06 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF6-00053e-3u
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:05 -0400
Received: by mail-ed1-x536.google.com with SMTP id e30so9918734eda.0
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=875vs54jSlHP1j/ag97c6ycrMEKN/NuuwrYXpt6BYgw=;
 b=RF8cIkxNtN3mLWtQHrot5d/DpyYNzE5WesvKrzsNTI3FlWjLHBw4P0dCaYajfe4ZDQ
 XWGX5dj8ytKztYsw1vawITvHqtx449fJTD+n2lVLDwCXImktDaa1sIfgD9KuAzyiFg27
 dkKVrKczJnqtcDtXYjOwg52xau2v9jiK+mqsA2J5I9VT4kmAyoWf/gKtaZyFDE6LOUDO
 Ml2nAALYzvkEj4nesSLetRL4q8jCsc9QTrr38VlbwIBc4NeNloPMXnfVDRRMnHacx7rG
 OtB1fu+z9m0cC82WDGlodosII5z/m+MEhMAMUiLIbYXmFHa52pO00MZSBMotThTgIJJ5
 E7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=875vs54jSlHP1j/ag97c6ycrMEKN/NuuwrYXpt6BYgw=;
 b=5XRUkPR/yIFHpHVMYcdOjaaEp14uNbCIsfup98nOCuYveKpFUvH1KTkPAkBv2uTpmq
 ka+yh97TH1XB9ssZN3/5aJQ2TzA12Oa54AEQ2wnJC8bbDkCumSxtC54MdkJ8g0bBq9w7
 MNnCLGAhhn9SW+8uKFf3eR8Xx0zn1ENk0q4W5m5yFeHUvxDvCesZnbq/uKqBfVCIyBhK
 nEahdl2JQ2yWQSJfQ5CQBcOe1KlP78o5rD6Fjsz3A5lgIkQ7TdG7jR/z5o0UNMLAjyMU
 qpyTIJRfOBdVj4CCbrNR+Q98GhLRnqwoLlwATLnAr28A8+Vtnq1+IOR+5YYUEsO4Gsp/
 c2mQ==
X-Gm-Message-State: AOAM5338T/YUAu7vpiABqTd9hFvPah+9dALAnakm/s0e7j86yVt1Jy63
 x4fEHbrkgGNnFtquWwr0dmu19c75VnOGWg==
X-Google-Smtp-Source: ABdhPJy+KBfXq2ULAnr5bL49WeoUjzenLer3IRafZ+g6uIIN4JS3NflFw9HfiyEDVc3lLxwD9iS+Gw==
X-Received: by 2002:aa7:c793:0:b0:408:4a69:90b4 with SMTP id
 n19-20020aa7c793000000b004084a6990b4mr10053630eds.58.1650718322624; 
 Sat, 23 Apr 2022 05:52:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/34] qga: wixl: get path to sysroot from pkg-config as
 intended
Date: Sat, 23 Apr 2022 14:51:20 +0200
Message-Id: <20220423125151.27821-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The .wxs file uses $(var.Mingw_bin) while configure/meson have always
used Mingw_dlls.  Fix them to match what was probably intended.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure       | 4 ++--
 qga/meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 9e32c96fce..049f669a94 100755
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



