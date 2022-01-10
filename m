Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13A489B96
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:51:08 +0100 (CET)
Received: from localhost ([::1]:50970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6w0p-0000FA-N8
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqu-00021f-UM
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:52 -0500
Received: from [2a00:1450:4864:20::52d] (port=34647
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqt-0000T2-Au
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:52 -0500
Received: by mail-ed1-x52d.google.com with SMTP id u25so54502513edf.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGMvmwi4ckE38iut27TXSJpJDVCHdzkEy050+pNb4pI=;
 b=FgkMyDWqIjQ/BmTK9It9gf3Mda7m1qPperW7InIkBB3MjIRt4S4yuHSg3rNT0Jule2
 h9ztkWP44z6TP7awoZPGSQg4eThRJwssoi9W122jho+cMbBFsN60nmoBuJVnqtZ7b/L/
 wjQvQBbkq252KNKEOZByW+B/iyOCV61jZpkAfiV/bWCX8zRhm7RInT3E69jlNkWSvWH1
 yjIR9oUYxNPEzs+xxoZTooeKkvpQEKYVzLJSA91r4H55w0Jv5W0fJeUK0Hx32RrX356i
 IqBH7xxwU3Mz9Bw92+pxBP1MkjO335ByrkJeL6gZYP330K0H91eLv4+ETzVXFNw7/Rn2
 85lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZGMvmwi4ckE38iut27TXSJpJDVCHdzkEy050+pNb4pI=;
 b=EhfWhLuAus+Sk6r62w1Q3Ndccz0irP3flV3AVbFzrU4iAVlulysmcAtA+85FeCYyBW
 0MAdZdTMt1WWiejgsfGdtT6ILQa1TjoTt/hjgmfIc5+ocdzKOVU/LzqQiiD4JeWQ/x2V
 Cut7S3HvwUZCDHQls8KYiiGwOTDkuVETtfNVdOsf2Zv5RbkM3kyWGspsNC2mE/Hol7Zl
 yIm0PFcmImPWknAtcFL26/fxhCtFakVDn6N6KkUYU+tMkGAYf3vuO9806edbm6wpvzr8
 7Jtdj5qTW/0Y6g8uQRGpgZWsCTOIv5EfJ0QFggfuGrITIas9RlrKmyVjqimFgQSEDXAj
 zhEw==
X-Gm-Message-State: AOAM530oca3U1z/cr1/e1wthGZkXbR+/bwQBR22L7OR0XGy83tDy/CW0
 JNlCCYMVWesmA9uFaBNHZW4Zcd8tlfE=
X-Google-Smtp-Source: ABdhPJyiJ/K9CAEhwvchTdMR6YY4F2uBC/ocqwbmh4dHrhZ//EGMVMPL025b4kvXHp7STKe+N/a4XQ==
X-Received: by 2002:a05:6402:31f0:: with SMTP id
 dy16mr7121932edb.364.1641825648186; 
 Mon, 10 Jan 2022 06:40:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] configure: do not set bsd_user/linux_user early
Date: Mon, 10 Jan 2022 15:40:22 +0100
Message-Id: <20220110144034.67410-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to other optional features, leave the variables empty and compute
the actual value later.  Use the existence of include or source directories
to detect whether an OS or CPU supports respectively bsd-user and linux-user.

For now, BSD user-mode emulation is buildable even on TCI-only
architectures.  This probably will change once safe signals are
brought over from linux-user.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 1b5fa5ae93..f35d3f198f 100755
--- a/configure
+++ b/configure
@@ -320,8 +320,8 @@ linux="no"
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
@@ -538,7 +538,6 @@ gnu/kfreebsd)
 ;;
 freebsd)
   bsd="yes"
-  bsd_user="yes"
   make="${MAKE-gmake}"
   # needed for kinfo_getvmmap(3) in libutil.h
 ;;
@@ -583,7 +582,6 @@ haiku)
 ;;
 linux)
   linux="yes"
-  linux_user="yes"
   vhost_user=${default_feature:-yes}
 ;;
 esac
@@ -1259,18 +1257,26 @@ if eval test -z "\${cross_cc_$cpu}"; then
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
+    if [ "$targetos" = linux ] && [ -d $source_path/linux-user/include/host/$cpu ]; then
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



