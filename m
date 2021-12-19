Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E047A0E2
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:22:46 +0100 (CET)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx5J-0006IF-HB
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:22:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx04-00064R-FY
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:20 -0500
Received: from [2a00:1450:4864:20::531] (port=43870
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx03-0005ws-33
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:20 -0500
Received: by mail-ed1-x531.google.com with SMTP id o20so27710090eds.10
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0oYhIfTN9v9TVeQFHzicUForqk+cp6n+gOJjLlJ5g6A=;
 b=Xq8Gp1KUgUiNAYICZ+gDPVJu1hbtyaHTXuoJRQnnbgiLKl3DXAKkRlHJtyzipXEP24
 tc0+NSAGNuAa996JHiJFtPTcPmUiYMCWGLz0L0Qpsb0cGdReo/WIklp1nmEIVtsH2sKj
 3awdG0GlFmZZTPXnC3VMCzMqrylA4r1Hgj8I3TwoVCug7/qlifkYax80WWQgm/JdY1Gu
 +pmQa21rrar7gmEE7XRZA+pl0motGn0A/bRLIVWcpZIV3wXRMb2fetf9meDUTWaYdjQj
 n+VXeMyYm2odeiAzE+PcuX1hzjIUdEmq4cF0x3bArDK1LwBd/MZI3EdkIAK/w9v6OWkp
 3CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0oYhIfTN9v9TVeQFHzicUForqk+cp6n+gOJjLlJ5g6A=;
 b=2JAlunA7kyVbXUY8n7TltWYNS9+0yrZ0KwhR0X2Ybi/43apeFqhRWPhnhKbIrnLpUp
 DEmYjIWr7TvGspm+uYqfti2muP0URl2aT8pPmOr1uCxAeTrUsn/5CP+kqNy4qmzIii8S
 JlAzAM7Sno+/JGjfpEfmgGzz3NlK6Ksc+hW5yuC6LTTdxuJdu/iSLUm/n70TTdM8Azzg
 Qn1BWqldFYNZxxKjLGSWKaX04iuvDVs7zqy5lZ1ofQd6+yJxlrbnsmml3e6bWnBgGkKP
 U9KkUD0YaEfHbTBboOcx01OfgpAdQzvqsRvCLTEHfZD5fFNJH6nAhttXuqLg+Y+gOaWj
 61Jg==
X-Gm-Message-State: AOAM531Ghz903fkZZCn1ExNpVf2VizJPRHc3norM2xDkKJsXM7s0m/yk
 tIj7fmCNFYDkuPywM81tV8Pv2wG2hB4=
X-Google-Smtp-Source: ABdhPJynH5/9DCNdd+uZe6Ns7Se8q25NSVN6Zb3Dj3M0WtVNaOSLJf2gboSJUTkdN91sNzoq9PQ1uw==
X-Received: by 2002:a17:907:8a1b:: with SMTP id
 sc27mr2428378ejc.699.1639923437929; 
 Sun, 19 Dec 2021 06:17:17 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/16] configure: unify ppc64 and ppc64le
Date: Sun, 19 Dec 2021 15:16:59 +0100
Message-Id: <20211219141711.248066-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only difference between the two, as far as either configure or
Meson are concerned, is the default endianness of the compiler.

For tests/tcg, specify the endianness explicitly on the command line;
for configure, do the same so that it is possible to have --cpu=ppc64le
on a bigendian system or vice versa.  Apart from this, cpu=ppc64le can
be normalized to ppc64 also in configure and not just in the meson
cross file.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 10 ++++------
 tests/tcg/configure.sh |  4 +++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 77ccc15b73..85caf2e9ef 100755
--- a/configure
+++ b/configure
@@ -661,9 +661,10 @@ case "$cpu" in
   ppc)
     CPU_CFLAGS="-m32" ;;
   ppc64)
-    CPU_CFLAGS="-m64" ;;
+    CPU_CFLAGS="-m64 -mbig" ;;
   ppc64le)
-    ARCH="ppc64" ;;
+    cpu="ppc64"
+    CPU_CFLAGS="-m64 -mlittle" ;;
 
   s390)
     CPU_CFLAGS="-m31"
@@ -3721,7 +3722,7 @@ if test "$linux" = "yes" ; then
   i386|x86_64|x32)
     linux_arch=x86
     ;;
-  ppc|ppc64|ppc64le)
+  ppc|ppc64)
     linux_arch=powerpc
     ;;
   s390x)
@@ -3903,9 +3904,6 @@ if test "$skip_meson" = no; then
         x86_64|x32)
             echo "cpu_family = 'x86_64'" >> $cross
             ;;
-        ppc64le)
-            echo "cpu_family = 'ppc64'" >> $cross
-            ;;
         *)
             echo "cpu_family = '$ARCH'" >> $cross
             ;;
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 9b76f58258..9ef913df5b 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -64,7 +64,9 @@ fi
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
-: ${cross_cc_ppc64le="powerpc64le-linux-gnu-gcc"}
+: ${cross_cc_cflags_ppc64="-m64 -mbig"}
+: ${cross_cc_ppc64le="$cross_cc_ppc64"}
+: ${cross_cc_cflags_ppc64le="-m64 -mlittle"}
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-- 
2.33.1



