Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECBA2EE7B4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:40:38 +0100 (CET)
Received: from localhost ([::1]:45910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxd1J-0000VC-2a
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jpewhacker@gmail.com>)
 id 1kxczl-0007zp-EB
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:39:01 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:38949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jpewhacker@gmail.com>)
 id 1kxczj-0005Id-QT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:39:01 -0500
Received: by mail-oi1-x233.google.com with SMTP id w124so9062710oia.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 13:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vD01i1ayLYd4O0i2Yw54VktL+goCWcNYSiSxrYMMS4=;
 b=Lwv6WeH0YEz2zOyAx5qbeIH9lNDgYy0+dVXT1PQ1Gzatfl87I/r+8zvoMknSL1CqLa
 5VlqbsJkeXhjRY+miGDw+T4ThqVgdKcsaY7Y5act/TpuU4ff6OCxAYBQ7D5eP9mW3aKS
 U+Vm5qsoftrfgMS0ng91B2xAjkxXEJWYgoUFxAjKovSZs5IyFUw3fpHfFN3gx9ToNg2H
 t5dfAvOnBeEyq1Zp2uIE++PIIuvktd2DH+ki/HItYTMtn8JcVVrQxRYtRvpwVZgUPvje
 hKsbqSFqUfblf3UyVtMb0EHLHctBBbw5vlS9+G7Yf9gZ0krCe3OdUUKTxGYWHHDYYY6Q
 7cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vD01i1ayLYd4O0i2Yw54VktL+goCWcNYSiSxrYMMS4=;
 b=NrsB4fptVjfqwlqHgmabrALyz6eRcIN1zy1QEWg6gHarq0ooKLJFERuI2NvkZIjFN2
 eiYaB1cmZPyrQtiY6DrdgAsPGmIoqgDLVwSxzSrBh8taQFas6bOU6rfbuUzqoIWt74aW
 FywDYj1baz/ykt+xqOD1VdSG98TG49JQgXKjvldsY2oe5Pdn+biHsaIvexdT5PtZQ0WL
 zMJUAsgEk2wobOr+LvqGFD3bUVqBWCGjir0ylGBJp20/PCGPAQwb2haYbIk1NplImFAE
 vmo2ZtAMg6fzK36jIaivU3VnWDRX5Ucfm1Vja2K/eyJ7qH4pRnDRQMcg1TOhaoS1FeDt
 FCLA==
X-Gm-Message-State: AOAM530rSTyVKZY7DRvKLJpRNGLoxZriRmVh8/P5B9+OvBhBw4P5fsX5
 SR+C8O8w2mMlq8dVajHj7VoqjviwXC8uqg==
X-Google-Smtp-Source: ABdhPJyyqzYrRw5gOy15e2z0t6Zn99wN6KTLfIWFMKxdP+bMq8qXleTknIGLUOaDGNQRpmhDvwJDWg==
X-Received: by 2002:aca:1004:: with SMTP id 4mr430255oiq.4.1610055537856;
 Thu, 07 Jan 2021 13:38:57 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
 by smtp.gmail.com with ESMTPSA id
 g26sm654719otp.52.2021.01.07.13.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 13:38:57 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Add flags for MinGW32 standalone build
Date: Thu,  7 Jan 2021 15:38:56 -0600
Message-Id: <20210107213856.34170-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=jpewhacker@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Joshua Watt <JPEWhacker@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are two cases that need to be accounted for when compiling QEMU
for MinGW32:
 1) A standalone distribution, where QEMU is self contained and
    extracted by the user, such as a user would download from the QEMU
    website. In this case, all of the QEMU files should be rooted in
    $prefix to ensure they can be easily packaged together for
    distribution
 2) QEMU integrated into a distribution image/sysroot/SDK and
    distributed with other programs. In this case, the provided
    arguments for bindir/datadir/etc. should be respected as they for a
    Linux build.

Add a configure time flags --enable-standalone-mingw and
--disable-standalone-mingw that allows the user to control this
behavior. The flag defaults to "enabled" if unspecified to retain the
existing build behavior

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 configure | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 5860bdb77b..5c83edb502 100755
--- a/configure
+++ b/configure
@@ -358,6 +358,7 @@ strip_opt="yes"
 tcg_interpreter="no"
 bigendian="no"
 mingw32="no"
+mingw32_standalone="yes"
 gcov="no"
 EXESUF="$default_feature"
 HOST_DSOSUF=".so"
@@ -1558,6 +1559,10 @@ for opt do
   ;;
   --disable-fuse-lseek) fuse_lseek="disabled"
   ;;
+  --enable-standalone-mingw) mingw32_standalone="yes"
+  ;;
+  --disable-standalone-mingw) mingw32_standalone="no"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1570,7 +1575,7 @@ libdir="${libdir:-$prefix/lib}"
 libexecdir="${libexecdir:-$prefix/libexec}"
 includedir="${includedir:-$prefix/include}"
 
-if test "$mingw32" = "yes" ; then
+if test "$mingw32" = "yes" && test "$mingw32_standalone" = "yes"; then
     mandir="$prefix"
     datadir="$prefix"
     docdir="$prefix"
@@ -1897,6 +1902,7 @@ disabled with --disable-FEATURE, default is enabled if available
   libdaxctl       libdaxctl support
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
+  standalone-mingw  Build for standalone distribution on MinGW
 
 NOTE: The object files are built at the place where configure is launched
 EOF
-- 
2.30.0


