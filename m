Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E6B508C5F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:46:30 +0200 (CEST)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCXF-0004nx-Rl
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLS-00016K-R4
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLQ-0000t8-8h
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so3953330wma.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5g0ARLKIY1y/ttR8zFbP5fhBI16ZJzJ38rCmGJLpx9w=;
 b=dTzLzrNtPYN8WVSQ/KenQCEiyPVin+rCpedVmdOVdZ8YJGwBlvagk/hazZLBDlGnVF
 HIvd6NEf8dXAzLFBxGfHxe1N7iml95dpsYV6KlQ0/LJSYSCGzrgAAZ1T/7wsOEIiz3f2
 F752quDTYPU7NJ+3oHrUeKiqVrsodN+z1MxklI26kaeoMW2mJO3TrKZT77/ZINvvYiU9
 UzoWY4losXL3AiAqSjx2bD/rVFHwCPaUeA0MlxGaajHxfKZTFH7mG5zWSybHxBr9CKBw
 rNl8F6tlq891ApFp0CGMkL0ebJqy5eFnZGHSdIebnnVj1jk+OZ0WDBeQVsc/SosuTINw
 idhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5g0ARLKIY1y/ttR8zFbP5fhBI16ZJzJ38rCmGJLpx9w=;
 b=32X0yiAF+AyxQNtHe+FBkLXFhjy/ZzBRCTBFp1/OYchoaeznueYKNEioXLNOeL+IKQ
 5bbyNyh+O3CWSYkzZNpcv9/NDr+TjAF+LGm00qfTKAjYclXi6b3xBXtWUb0UdS3uHLA3
 QvsLqUwjhaMB/NX6s3D9u7+895eUYQXdxkeQf+o+h9U0GM33MtfKsdtDkGmNM+oYP8Cm
 AatbaTD5M6S6Djg4l7upVnyUqpvLUkJ0WU+GwcFjq4XqhFEXT8x7I6VZICWNtMBDhHmZ
 qbOks16U4raO3p83V1K3pz3FplQCPJUwXCraN1OesRxHQy6THxFNpg2H/Kw6cwhQxLmO
 CX3Q==
X-Gm-Message-State: AOAM532UQptZhZEC3eJ0UWg3u37JmwHElsdGLK+H2JDdWDHxdpnWR+hG
 wkuhSqPftjelVc05tYO9Af/GZiTe+I3Rhw==
X-Google-Smtp-Source: ABdhPJyMZhMr0AjXsmRVOBpk76hGg1YxjfYzWWLedNRiF5GnD4Oi2yZC/7LiY0vzvLgR/3AYPumrlA==
X-Received: by 2002:a05:600c:3d88:b0:391:7aa1:792b with SMTP id
 bi8-20020a05600c3d8800b003917aa1792bmr4340305wmb.8.1650468853991; 
 Wed, 20 Apr 2022 08:34:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/34] configure: remove dead code
Date: Wed, 20 Apr 2022 17:33:35 +0200
Message-Id: <20220420153407.73926-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
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

tcg_interpreter is never written, it is purely a meson option;
trace_backends is never read.

And SeaBIOS is only build from the source tree with roms/Makefile,
so the config.mak file is unused.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/configure b/configure
index 7c08c18358..2fc860ed9a 100755
--- a/configure
+++ b/configure
@@ -320,7 +320,6 @@ linux_user=""
 bsd_user=""
 pkgversion=""
 pie=""
-trace_backends="log"
 trace_file="trace"
 opengl="$default_feature"
 coroutine=""
@@ -391,7 +390,6 @@ for opt do
                       cross_cc_vars="$cross_cc_vars cross_cc_cflags_${cc_arch}"
   ;;
   --cross-cc-*) cc_arch=${opt#--cross-cc-}; cc_arch=${cc_arch%%=*}
-                cc_archs="$cc_archs $cc_arch"
                 eval "cross_cc_${cc_arch}=\$optarg"
                 cross_cc_vars="$cross_cc_vars cross_cc_${cc_arch}"
   ;;
@@ -2881,9 +2879,6 @@ fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
-if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
-  echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
-fi
 
 if test "$opengl" = "yes" ; then
   echo "CONFIG_OPENGL=y" >> $config_host_mak
@@ -3025,7 +3020,6 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
-LINKS="$LINKS roms/seabios/Makefile"
 LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
@@ -3060,24 +3054,6 @@ done
 export target_list source_path use_containers cpu
 $source_path/tests/tcg/configure.sh)
 
-# temporary config to build submodules
-if test -f $source_path/roms/seabios/Makefile; then
-  for rom in seabios; do
-    config_mak=roms/$rom/config.mak
-    echo "# Automatically generated by configure - do not modify" > $config_mak
-    echo "SRC_PATH=$source_path/roms/$rom" >> $config_mak
-    echo "AS=$as" >> $config_mak
-    echo "CCAS=$ccas" >> $config_mak
-    echo "CC=$cc" >> $config_mak
-    echo "BCC=bcc" >> $config_mak
-    echo "CPP=$cpp" >> $config_mak
-    echo "OBJCOPY=objcopy" >> $config_mak
-    echo "IASL=$iasl" >> $config_mak
-    echo "LD=$ld" >> $config_mak
-    echo "RANLIB=$ranlib" >> $config_mak
-  done
-fi
-
 config_mak=pc-bios/optionrom/config.mak
 echo "# Automatically generated by configure - do not modify" > $config_mak
 echo "TOPSRC_DIR=$source_path" >> $config_mak
-- 
2.35.1



