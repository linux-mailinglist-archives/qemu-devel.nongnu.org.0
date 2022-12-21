Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AF6535ED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q3-0000eZ-Se; Wed, 21 Dec 2022 13:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q1-0000bF-Li
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q0-0004JU-0M
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+/09ynFcBHA4MWVO2yoREd4a+0CntG42IHNkNDsO8s=;
 b=WQbEM9en/8B0CQyRmpjX+XH+U8rF39qcuCtaMAJI0XCOVuxAhwXkBSLfoCrp+gowsl8WA0
 8wLoWsEgy65XuGqcfH8ZmPMUobZ4dGjE6+4CZj2rayvCUuqkp2STmC9jm0+CfBMOiJ4/FJ
 AOWC2FpvrTHK16cTGi24CAtgoGMmvGg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-J4zxJ0KROka7CEt8UsfmYw-1; Wed, 21 Dec 2022 13:02:13 -0500
X-MC-Unique: J4zxJ0KROka7CEt8UsfmYw-1
Received: by mail-ed1-f71.google.com with SMTP id
 h8-20020a056402280800b0046af59e0986so12039252ede.22
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3+/09ynFcBHA4MWVO2yoREd4a+0CntG42IHNkNDsO8s=;
 b=g0kUC0IUQb9tzi1/xOU1cnsm0GGBtdTq+1AMmcl8sPTnCbkCMTpZmnv9DVatIsICsD
 vgxZ/JfZPIKXp1Dft/VTg+VqoYgrkNF06YcsNzCWXoTiyqi1JndY1FTQ5RoagmQExTRi
 yuvS1UOhJAd//6RbCtaIttuPxZOWjH5Py6ZoEn/Lrlc/DUQ05ylKZMuJDI1GO+Ttn1eH
 T1i5LEh4L6cLL3+7r/uA8R5CSGFBFWoO5z61baB9VGg2GA+wnLQDMyfW03Bpr0UggnHW
 u4c/kQ1FOA1Vtyzax0pdAjdXtqWJ+QtKqarfqGtyNj7rbzjnrxlQpIMWzpmFXHCgPGMX
 Sg9g==
X-Gm-Message-State: AFqh2ko3oG7jQZ9JpkNnrXvKEihPQca8YK/KoP+1azANDTg5GZlvKKsH
 FdGoiwT8GNcNBGs10Z1FYMtiVS89vvYVtRainyI21d5BrdV+iImJsTaOhRYTddHkq3LNSmoI6TP
 qjUE7Rl2CfYrHfOxPBz7NjV+BdutL2pIvv8lJzAacQnlJMyAHhR6kwid3qnLV0vBK6DQ=
X-Received: by 2002:a05:6402:1948:b0:470:1f1:257a with SMTP id
 f8-20020a056402194800b0047001f1257amr2455613edz.25.1671645732118; 
 Wed, 21 Dec 2022 10:02:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdHKUZ54pb9sJq6BVWZm3WZ+CbSPYpBWyc2vOk8gqORJw4wGelEXDAgxoUGs9i+1ggZHvKkA==
X-Received: by 2002:a05:6402:1948:b0:470:1f1:257a with SMTP id
 f8-20020a056402194800b0047001f1257amr2455581edz.25.1671645731860; 
 Wed, 21 Dec 2022 10:02:11 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r22-20020aa7cb96000000b0045726e8a22bsm7246090edt.46.2022.12.21.10.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 10/24] configure: preserve qemu-ga variables
Date: Wed, 21 Dec 2022 19:01:27 +0100
Message-Id: <20221221180141.839616-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Ensure that qemu-ga variables set at configure time are kept
later when the script is rerun.  For preserve_env to work,
the variables need to be empty so move the default values
to config-host.mak generation.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 9cbbeaa269d1..4958ac99bcef 100755
--- a/configure
+++ b/configure
@@ -2227,20 +2227,6 @@ if test "$have_ubsan" = "yes"; then
   QEMU_LDFLAGS="-fsanitize=undefined $QEMU_LDFLAGS"
 fi
 
-##########################################
-# Guest agent Windows MSI package
-
-if test "$QEMU_GA_MANUFACTURER" = ""; then
-  QEMU_GA_MANUFACTURER=QEMU
-fi
-if test "$QEMU_GA_DISTRO" = ""; then
-  QEMU_GA_DISTRO=Linux
-fi
-if test "$QEMU_GA_VERSION" = ""; then
-    QEMU_GA_VERSION=$(cat "$source_path"/VERSION)
-fi
-
-
 #######################################
 # cross-compiled firmware targets
 
@@ -2336,9 +2322,9 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
-  echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
-  echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
+  echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER-QEMU}" >> $config_host_mak
+  echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO-Linux}" >> $config_host_mak
+  echo "QEMU_GA_VERSION=${QEMU_GA_VERSION-$(cat "$source_path"/VERSION)}" >> $config_host_mak
 else
   echo "CONFIG_POSIX=y" >> $config_host_mak
 fi
@@ -2652,6 +2638,9 @@ preserve_env PKG_CONFIG
 preserve_env PKG_CONFIG_LIBDIR
 preserve_env PKG_CONFIG_PATH
 preserve_env PYTHON
+preserve_env QEMU_GA_MANUFACTURER
+preserve_env QEMU_GA_DISTRO
+preserve_env QEMU_GA_VERSION
 preserve_env SDL2_CONFIG
 preserve_env SMBD
 preserve_env STRIP
-- 
2.38.1


