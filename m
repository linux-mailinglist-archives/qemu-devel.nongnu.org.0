Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DC512D2F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:40:13 +0200 (CEST)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyl2-0001Fk-Hl
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy25-0000Gn-Il
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:45 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy23-00055k-QX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:45 -0400
Received: by mail-ed1-x530.google.com with SMTP id k27so4398424edk.4
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=875vs54jSlHP1j/ag97c6ycrMEKN/NuuwrYXpt6BYgw=;
 b=ibgaYLeJDbS8WXeKPO6usa+B9CgYOqH012zljD7g7K9U51mLYkSYOMkizbXZB8Mn6F
 jwuOP5RmOAUouLOfKgUOmuH5sDi/ojnECje8CzxMxaVtml5VFcxKggjgFj1nsD3BNSIF
 0K0CxIxKftbAomFsbx4uDIow0wpq6fNHxGEEEsJSD1G5oFt3jt7pXveXzPaRtcYi/a+K
 XpFKBCZJOFcL7vzeYgnwGazg6SnFMhYPbb1EJemACT55WCbnVZmmFkQ8ODBa23UC+dUz
 gb4AvPiHQWowJ5SxE3uZNbvzTnYL13Tubl7TjDXnauV0/UWDH/2t4v2ARk4VGm0HDp0D
 76hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=875vs54jSlHP1j/ag97c6ycrMEKN/NuuwrYXpt6BYgw=;
 b=yycczkSTLSe9z380HAMZgMy/cKkwIBpXtZJX3uWBjoc+PdvR9F0uJ7wtE87GCIsvEJ
 Z93ai/4FZG/i+/80dRVxogUKWejGG6pn8FNduEu0OEmCohlFKwLFmOUqUGQubxiQZo4X
 0B4FBtVS1mFXBR2kItenifN9CnReGCRew2QnA+TSmQsEV34WOcpD58Js3IjnGOfDOkbN
 7pgJUNg0PnTro0UfkRt0tkXo2LdxFmf1LDFPyDMUrMJqdHR0ALPmVCjgHooSVI6sq49d
 LvdWT4zp1ntwFhyRJMSi6ALxLBYE2iB1Vzwnt2cOPkkt0CmRFF2AQFJx4r/O9Paa0MLV
 K/Ng==
X-Gm-Message-State: AOAM531lUfs7P2848aEQVQkFQGayfWe6KA/qyFY97MD8PsQU0LYb2ggS
 8SWrLhRvDEJSbKny9T0x5IWHrbbP79FY2A==
X-Google-Smtp-Source: ABdhPJx9qnOXfWVxodfMEYHABXai4qoaEak0aBWL2+tqknadB0N1S1R/bulq7vD9cmChRMb8UkbUgg==
X-Received: by 2002:a50:d4d0:0:b0:425:f894:7a73 with SMTP id
 e16-20020a50d4d0000000b00425f8947a73mr14230220edj.245.1651128822429; 
 Wed, 27 Apr 2022 23:53:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] qga: wixl: get path to sysroot from pkg-config as
 intended
Date: Thu, 28 Apr 2022 08:53:24 +0200
Message-Id: <20220428065335.189795-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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



