Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B872B7B17
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:21:46 +0100 (CET)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKav-0001v6-8s
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ3-0008W4-Cb
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:49 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ1-0003ey-Pv
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:49 -0500
Received: by mail-ed1-x533.google.com with SMTP id q3so1368540edr.12
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjXbb8xKE+TyxvfT3qZhLOmOC5AA7l7IBgY8qM/QOVM=;
 b=Vrpic9zlmjo0vFiHGLg1nu4DNHjyJ/Wuo+XC9LfZuRnuBBSvpnS9VYi8uUUyoOZVRb
 WZFPDz8g5LoG/ZwkIUYBJ1ep6lqRoAMvCJWZo8m4yBqSIoFDgcnG6cRBjlZzPIdg0Rjm
 sSDzCpjUsPmWlmHKagSQOBDnOJmykiv70qDgcimw+LvQCQpeAXGNy6gvbCiu+3pxfdl1
 Mm/2rTCEW+H73zOoWo9qwUlyi+dyfCoa4CGQRHzs8yocoVQ/QPQo0yTfJQPMkL9XWGkK
 4i2kW1ZhAFnV3gak6t18EkyWR1WGyW+jxMCOoCuJKyg5LAqPTiG01szYPH7JguIsAHuR
 2Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EjXbb8xKE+TyxvfT3qZhLOmOC5AA7l7IBgY8qM/QOVM=;
 b=iR3iAcg4hQx4t9egIrgZ2FfQCTUtswiJaEPvdYe+eZsC0A2TLUC6C/Wurgm6eyvcEc
 ME6R6tiHuqsIUSKG7lWvqPOq4aZk0ztuK9zEuCRxe6VOSZuFQ7efCnkSGp0YqkNOmdZl
 X77fTRTCCaz+d7khO6036l3gfRehrVhROOIOMbmxNFy2Mto42+6jsI3G31nHcpf4E/h0
 zPSeR4HQ5NwndYYFu8Qv5j/mA35gBxvG+gfmN2YX360zh7if2fXsAWFOwYkhdB+OjW51
 PsyFy9lKftw8whhKlEbr1S8CyhvRs1UfEqVsTaRDBoIobXSgVu/t8whO+flMS+kuuZ6e
 +GDw==
X-Gm-Message-State: AOAM533DaUy4qoyeW9bT5Fm9MUrmFTTU8lLUFtyGLJA0DU8ZVLHy+IQr
 +HCCk0JR++zJQbYqJ8Ckgtn+cqiwfYI=
X-Google-Smtp-Source: ABdhPJxZweyXNGnULu4rD3XX7Q8x5vqVqB3fvlAjctybWoMC122qWeYZZAGZeH+AFYTsDS7Dr+aPpg==
X-Received: by 2002:aa7:d1c6:: with SMTP id g6mr24768259edp.130.1605694786206; 
 Wed, 18 Nov 2020 02:19:46 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13230052edx.90.2020.11.18.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:19:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] meson: Fix build with --disable-guest-agent-msi
Date: Wed, 18 Nov 2020 11:19:36 +0100
Message-Id: <20201118101940.132594-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118101940.132594-1-pbonzini@redhat.com>
References: <20201118101940.132594-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

The QGA MSI target requires several macros which are only available
without --disable-guest-agent-msi.

Don't define that target if configure was called with --disable-guest-agent-msi.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20201117201834.408892-1-sw@weilnetz.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/qga/meson.build b/qga/meson.build
index 53ba6de5f8..520af6ce9b 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -61,23 +61,25 @@ if targetos == 'windows'
     if 'CONFIG_QGA_VSS' in config_host and 'QEMU_GA_MSI_WITH_VSS' in config_host
       deps += qga_vss
     endif
-    qga_msi = custom_target('QGA MSI',
-                            input: files('installer/qemu-ga.wxs'),
-                            output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
-                            depends: deps,
-                            command: [
-                              find_program('env'),
-                              'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
-                              'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
-                              'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
-                              'BUILD_DIR=' + meson.build_root(),
-                              wixl, '-o', '@OUTPUT0@', '@INPUT0@',
-                              config_host['QEMU_GA_MSI_ARCH'].split(),
-                              config_host['QEMU_GA_MSI_WITH_VSS'].split(),
-                              config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
-                            ])
-    all_qga += [qga_msi]
-    alias_target('msi', qga_msi)
+    if 'CONFIG_QGA_MSI' in config_host
+      qga_msi = custom_target('QGA MSI',
+                              input: files('installer/qemu-ga.wxs'),
+                              output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
+                              depends: deps,
+                              command: [
+                                find_program('env'),
+                                'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
+                                'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
+                                'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
+                                'BUILD_DIR=' + meson.build_root(),
+                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
+                                config_host['QEMU_GA_MSI_ARCH'].split(),
+                                config_host['QEMU_GA_MSI_WITH_VSS'].split(),
+                                config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
+                              ])
+      all_qga += [qga_msi]
+      alias_target('msi', qga_msi)
+    endif
   endif
 else
   install_subdir('run', install_dir: get_option('localstatedir'))
-- 
2.28.0



