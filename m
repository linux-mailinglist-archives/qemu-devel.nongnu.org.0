Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E044BABE5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:38:46 +0100 (CET)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKoU9-0005jc-Vf
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nKlk9-0007NY-2Z; Thu, 17 Feb 2022 13:43:05 -0500
Received: from [2a00:1450:4864:20::633] (port=36772
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nKlk7-0007N2-CR; Thu, 17 Feb 2022 13:43:04 -0500
Received: by mail-ej1-x633.google.com with SMTP id a23so9410444eju.3;
 Thu, 17 Feb 2022 10:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=NJ1TbyXRdWRoNbrHprkOeyKSjtDCgSO9ZG41674G78g=;
 b=j8HKAgWVcQtG9kETJy7BFqbncYD/XtDQGpPMFmzWh5Uk0BACNfkM561kXN30lOwUP6
 yMf+z3V9yy7OlnRVmupt0xicxDlSs2B4HXjzobJz7Yat72Gy+DJKm8ACrAFp19ak4KK0
 roGfOw91Jpw3cltr7VjqglbOuJ6oKALZ2yyRl2bpS5KK4Q6eeAx9D+gNHPw4KxMOB2N7
 cbqTvcfaf1F3nuY4p5cNtqj3qe+wHL87CccrbVsWR6rHaooSZ0X9Pm0edxo6YybBNkly
 Fv1NAcbL5oGsk5EGXmonGhJNvZPJOUBP6jMhWkEO2d6bj1Ck2hjJARBT1+BIZfku8xh+
 qaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=NJ1TbyXRdWRoNbrHprkOeyKSjtDCgSO9ZG41674G78g=;
 b=W6XjJs5RSfAA4/zotiZwVm/F19rTyfGzAlYdsNc5Bn8pyKl8HBR/266FkTXIBHA8wg
 NcaSSWijRG3haRlTY+fxhEBuGlCvtsmt9IsVyY2dTLkCL6yU/JkGsakBb+hQnrOGLSQf
 ezoQ9U3s8JYKHmuWKYIaC/DH3m3Ffih6Wnicnm8XXxqV57vGjpHVFOAsOGGZ1IJiF7vZ
 RWMDxzKXXi8lzI4HlpgFCkbwsBdFjQefgnz/83L4eygu6MjaPrs0tk7a2ZGQTCOf9pMH
 H6WTyVhzSZgvBr9b9g0brhjtyU0DKP7UbGADI1GWvNoe4RBW4kYB5KfRpZUAuwxfybev
 +fqg==
X-Gm-Message-State: AOAM530HJPuBAUOyn293+RHSa8xtHSe9Mmiqohrc0/tSQmd9WA9C57Kw
 OZy3k7rHX0cijJK1XtKf/lVhJIgvoRQYSfjPfKh1y4GUfz8=
X-Google-Smtp-Source: ABdhPJyjR3IDrSAjKe2brosrV4CKyW+kOLstmufwM8AgwidQenE5lcIclWk9NAiIj4XYhbq9Nr2iaVk6VzzSSbFEZ8A=
X-Received: by 2002:a17:906:a10:b0:6ce:7107:598b with SMTP id
 w16-20020a1709060a1000b006ce7107598bmr3373847ejf.653.1645123378840; Thu, 17
 Feb 2022 10:42:58 -0800 (PST)
MIME-Version: 1.0
From: Joshua Seaton <josh.a.seaton@gmail.com>
Date: Thu, 17 Feb 2022 10:42:47 -0800
Message-ID: <CAPbYy+_14jeLBzihGjY-v0L1inZ1CGc+8TFu7NuPiaZie8skyg@mail.gmail.com>
Subject: [PATCH] configure: Support empty prefixes
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=josh.a.seaton@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 17 Feb 2022 16:33:57 -0500
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
Cc: qemu-trivial@nongnu.org, geist@foobox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At least as of v5 (before the meson build), empty `--prefix` values were
supported; this seems to have fallen out along the way. This change
reintroduces support.

Tested locally with empty and non-empty values of `--prefix`.

Signed-off-by: Joshua Seaton <josh.a.seaton@gmail.com>
---
 configure | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index 3a29eff5cc..87a32e52e4 100755
--- a/configure
+++ b/configure
@@ -1229,20 +1229,30 @@ case $git_submodules_action in
     ;;
 esac

-libdir="${libdir:-$prefix/lib}"
-libexecdir="${libexecdir:-$prefix/libexec}"
-includedir="${includedir:-$prefix/include}"
+# Emits a relative path in the case of an empty prefix.
+prefix_subdir() {
+    dir="$1"
+    if test -z "$prefix" ; then
+        echo "$dir"
+    else
+        echo "$prefix/$dir"
+    fi
+}
+
+libdir="${libdir:-$(prefix_subdir lib)}"
+libexecdir="${libexecdir:-$(prefix_subdir libexec)}"
+includedir="${includedir:-$(prefix_subdir include)}"

 if test "$mingw32" = "yes" ; then
     bindir="${bindir:-$prefix}"
 else
-    bindir="${bindir:-$prefix/bin}"
+    bindir="${bindir:-$(prefix_subdir bin)}"
 fi
-mandir="${mandir:-$prefix/share/man}"
-datadir="${datadir:-$prefix/share}"
-docdir="${docdir:-$prefix/share/doc}"
-sysconfdir="${sysconfdir:-$prefix/etc}"
-local_statedir="${local_statedir:-$prefix/var}"
+mandir="${mandir:-$(prefix_subdir share/man)}"
+datadir="${datadir:-$(prefix_subdir share)}"
+docdir="${docdir:-$(prefix_subdir share/doc)}"
+sysconfdir="${sysconfdir:-$(prefix_subdir etc)}"
+local_statedir="${local_statedir:-$(prefix_subdir var)}"
 firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
 localedir="${localedir:-$datadir/locale}"

@@ -3763,6 +3773,11 @@ if test "$skip_meson" = no; then
   mv $cross config-meson.cross

   rm -rf meson-private meson-info meson-logs
+
+  # Workaround for a meson bug preventing empty prefixes:
+  # see https://github.com/mesonbuild/meson/issues/6946.
+  prefix="${prefix:-/}"
+
   run_meson() {
     NINJA=$ninja $meson setup \
         --prefix "$prefix" \
--
2.35.1.265.g69c8d7142f-goog

