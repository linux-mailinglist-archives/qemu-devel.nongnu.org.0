Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DD4484426
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:04:58 +0100 (CET)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lMu-0005lA-Ig
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:04:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGQ-00075E-SN
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:14 -0500
Received: from [2a00:1450:4864:20::533] (port=40832
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGO-0004SS-Eu
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:13 -0500
Received: by mail-ed1-x533.google.com with SMTP id z29so149500574edl.7
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AC6ErmWtRpsUx1brzrDK0Ia3KrPL2DwJ+38gkjtWVT8=;
 b=GnSHVV1aglHm/vR7bz/gQkSgyexbBdbNmSA9DEJh6Auv38TYIINwrIo5wW5WJIWYeA
 40iQQWXCDV/HCvqNQVCiEIuZtQK9A3xjlIhloQNeRwlSoJkvU9YVbdahB8WLY4ZPi1tc
 wO5Njkaa/M5wOUB6SKBwyxBeNvcCU6HrWMcKfvqv9zRVwJtqFmOqHcHF4qfvIURQJyRw
 L9aswPneQEAsDr4qktu3HgPsoOlPx1UoOJ9zc6dRy0W/YsM16da9KjL9/2DNZ+nC+hzA
 CBnnqX9D7Fb3roReAlfcr/NvFm++rVOj1QsARlD11//xqDBOE20r3yruEHdl8ADulNMq
 2XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AC6ErmWtRpsUx1brzrDK0Ia3KrPL2DwJ+38gkjtWVT8=;
 b=BFSN3W+sXUZCMp5SoGu18IRs1/O+nt+R8EF1mGxi8C6aaGrwmdw2tymiCFeI3r6y8j
 TLUHUnsgvMc2f3sVJ4ZJ904RUUHO2xgYvc04ILQK83Kz7FLg+SvdpBNal4OkMTax8mUl
 CZt1rG1O+AsPfXIdbM7NN4tBZSyWQGPQlrbNkQh4UjCF4Ov2SSwKpxV93kIchbcLP/pd
 Xxol06fYfKaSJg/P/qNHyw0w272HTUo43h2KCoJWBogcD1BOwCu5byPCWFE4cN+VGZls
 NMiU5B1V7qV2gJucEDcKWPJMMaSdWFpT5sEH3zqvlPsrtzRResJG03nbvB94DRFwmqpN
 05FA==
X-Gm-Message-State: AOAM5316i4t1kCwcirF7lHdEk5QPUICUMsU56/08gzPoTMUbGZTjNr9I
 fN8XCH2iF7CcSMredMtknuamL905PLE=
X-Google-Smtp-Source: ABdhPJzdkP1iVtfqvcqTGJi7H9VRQ8rNT4pRR4XWGkRRXRLgGcFVIvdP0Cr/XtDBnRSZuHKPIsT4Hg==
X-Received: by 2002:a05:6402:1702:: with SMTP id
 y2mr48948355edu.372.1641308291000; 
 Tue, 04 Jan 2022 06:58:11 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] configure: do not set bsd_user/linux_user early
Date: Tue,  4 Jan 2022 15:57:40 +0100
Message-Id: <20220104145749.417387-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
index 5e61439761..b93ba2c86c 100755
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



