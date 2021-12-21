Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC247BE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:07:35 +0100 (CET)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzczW-00084d-Tq
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:07:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxb-0005Jz-AX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:35 -0500
Received: from [2a00:1450:4864:20::32e] (port=40578
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxY-0004yn-SB
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so1388937wmj.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwquXMcRtP+JeTEQ8y9DI2JPbN/svif4Xsndrbgrh6A=;
 b=XNuzDPZurRWN7rnH6gOdhPuTDtXkfmT/LqY8JLOWHPeK1Bsh0pFcPs5SLqN9Hx9KNJ
 FGJuwICRAZ+K+ZFEy4y/U/hxjv7o4CQcrqnlMl/Ci2xxguylfR8qXV17QTiQK9rFVd/Q
 C6nHa/lnA+IBWT4q0JfXVS/C7p9unSY8COykf8cfTtLzxN19BJKAywW3K8aM0XDPMyut
 v0sMCphlRgrSm0FG9I4ryREJhl91gYFcn0ERuzYYP+dpS5/6ed6luRbMj4C6GVEvDtqY
 CLHH9wIYfmpRrKv+SM1Qd0Ez7IYpTCD0FfaGSz4r77Gs5oD4NfqsBzGw8j7DxG7JqG3q
 Bh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SwquXMcRtP+JeTEQ8y9DI2JPbN/svif4Xsndrbgrh6A=;
 b=w+yFT+EeQetbI7UjaIXqXxjLMaO1w3HASMuTFliKeWGZWRDw6tYyaCNljJHUzH6sew
 7VEfTn+xBL5JHhqigpXZOnnd1OJh/jgICqPGWdlrg/85K0bdiuUIhAhSOAiRaf9Pe/Tb
 3f7JTkdoTfESLzxsGjp5HSOAyXDVexoyXI1/zEikMJ+wHlf70wpLQr+R5Cduo8ZYsWCm
 TdYTFzlW2Ywr29PfV5Vzy5b2cT+Qs5qItLOsCxDvYav3fd/gHOEe8uood9HH6weICfIK
 vq/iQ/sAVvMsdjBiCTM+7Qs2UWoLBfTMJKQqIdyddPZlXiX8Oc0wo6/cX6Ebksy0K7d8
 1FXw==
X-Gm-Message-State: AOAM531YQ2tQ3z/WJ4KEjpE5TDJsvVRzRg5TVDwG84x+HylU2AhCwCO5
 TuCbOgI9dfplGrcNKbRDfqO/PdtzfNg=
X-Google-Smtp-Source: ABdhPJyMWBFwMifGMV6EczmF8ZBGfpot72ApJ9el6tIpIDCQRRNt8Tqe1fn461IsLcPSFM7onoMBVg==
X-Received: by 2002:a1c:f005:: with SMTP id a5mr2346016wmb.19.1640084731335;
 Tue, 21 Dec 2021 03:05:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] configure: do not set bsd_user/linux_user early
Date: Tue, 21 Dec 2021 12:05:20 +0100
Message-Id: <20211221110526.351709-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211221110526.351709-1-pbonzini@redhat.com>
References: <20211221110526.351709-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to other optional features, leave the variables empty and compute
the actual value later.  Use the existence of include or source directories
to detect whether an OS or CPU supports respectively bsd-user and linux-user.

For now, BSD user-mode emulation is buildable even on TCI-only
architectures.  This probably will change once safe signals are
brought over from linux-user.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 1bce9635d9..6dafbcd362 100755
--- a/configure
+++ b/configure
@@ -321,8 +321,8 @@ linux="no"
 solaris="no"
 profiler="no"
 softmmu="yes"
-linux_user="no"
-bsd_user="no"
+linux_user=""
+bsd_user=""
 pkgversion=""
 pie=""
 qom_cast_debug="yes"
@@ -539,7 +539,6 @@ gnu/kfreebsd)
 ;;
 freebsd)
   bsd="yes"
-  bsd_user="yes"
   make="${MAKE-gmake}"
   # needed for kinfo_getvmmap(3) in libutil.h
 ;;
@@ -584,7 +583,6 @@ haiku)
 ;;
 linux)
   linux="yes"
-  linux_user="yes"
   vhost_user=${default_feature:-yes}
 ;;
 esac
@@ -1262,18 +1260,26 @@ if eval test -z "\${cross_cc_$cpu}"; then
     cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
 fi
 
-# For user-mode emulation the host arch has to be one we explicitly
-# support, even if we're using TCI.
-if [ "$ARCH" = "unknown" ]; then
-  bsd_user="no"
-  linux_user="no"
-fi
-
 default_target_list=""
 deprecated_targets_list=ppc64abi32-linux-user
 deprecated_features=""
 mak_wilds=""
 
+if [ "$linux_user" != no ]; then
+    if [ "$targetos" = linux ] && [ -d $source_path/linux-user/host/$cpu ]; then
+        linux_user=yes
+    elif [ "$linux_user" = yes ]; then
+        error_exit "linux-user not supported on this architecture"
+    fi
+fi
+if [ "$bsd_user" != no ]; then
+    if [ "$bsd_user" = "" ]; then
+        test $targetos = freebsd && bsd_user=yes
+    fi
+    if [ "$bsd_user" = yes ] && ! [ -d $source_path/bsd-user/$targetos ]; then
+        error_exit "bsd-user not supported on this host OS"
+    fi
+fi
 if [ "$softmmu" = "yes" ]; then
     mak_wilds="${mak_wilds} $source_path/configs/targets/*-softmmu.mak"
 fi
-- 
2.33.1



