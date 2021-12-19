Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF447A0DE
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:19:52 +0100 (CET)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx2V-0000Nj-D2
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx03-000646-Vc
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:19 -0500
Received: from [2a00:1450:4864:20::531] (port=33308
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx02-0005wk-2s
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:19 -0500
Received: by mail-ed1-x531.google.com with SMTP id m21so608483edc.0
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EXZ+RfndWTu7M8bnJezJV53DoYNGcawg43uOsLoxFZ0=;
 b=cuceh0TbfRqEgevzaWz/VlBzU5cdT7qMI0+3HXSj2SvYMMX9fcxaZBGjt3qD7pNWJ9
 30p2NbTFYDO+8U84mAMCRidQ554Df2w/DNE9E7AGuVL8JSjBZ8YjwB/FjQDE1WTJlsy1
 2ADknikDqbhuku6ombUSjQeGQ7Z6xX7UnlU6GJUITVbVOCm2lXGHb0WNW2TjHR5Pxlut
 seplbyx3ccl2ZrCC1tVbgRQJoto65Z/1DCQAywu4AL/AbVf6b7bHRj1rxWCzS7b8tdI9
 ECTS5PoG0ynALaEeg71YSWAe/Y66dOaAg2pSwuaVSHqi5aiHWm0XiVT1ZMNGCPQv8g0x
 cSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EXZ+RfndWTu7M8bnJezJV53DoYNGcawg43uOsLoxFZ0=;
 b=PSC7rv/5XzAC6/y7RMscgewwH86fCc03jP6QxBKY90uO4Cqzi2qY0GQ+h5mkbRZFs9
 7xo6LEpVBu6AyQlRTigVCEoIFb2L4TbzATEyhjCfOEYkxWE/7k7DJIkg4dJBjUhlUHIY
 xDud38R82jbsNJZ0T6pFbddKlnXX0d/BizD2GD5b0Z51Z3wnnU75IsMpaFubXSoUCKJ0
 LQluwoWwfz0B7s3SZl666HFmMvg5/eyuA37x2d8Q4Ygi84S3imYmiLsGciAZoMJlIg/7
 V1n59NUe6ceezMIM6uhgLkbJbRMX++PVjC/yuFKMn6CEpa9EGyQZ4Gy4+dee7X5YJ9N3
 VDLA==
X-Gm-Message-State: AOAM533cI/QHynCEwVhxmxPFJjcJotXKXNVbtWXnm7NImGMJ3S4n3/c0
 wK8RT9QoZMJWzyUuPFpZ+qn2qEgVVbQ=
X-Google-Smtp-Source: ABdhPJxYSJi7pzebSymuFWza/rbAQs+t/Oi5O3w/XNd15PL995VYeWVmYcNK8gKuwvVN1RCXXmzQRg==
X-Received: by 2002:a17:906:7e07:: with SMTP id
 e7mr4384852ejr.461.1639923436797; 
 Sun, 19 Dec 2021 06:17:16 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/16] configure: unify two case statements on $cpu
Date: Sun, 19 Dec 2021 15:16:58 +0100
Message-Id: <20211219141711.248066-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 67 ++++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/configure b/configure
index f0a82dd8f5..77ccc15b73 100755
--- a/configure
+++ b/configure
@@ -636,32 +636,47 @@ else
 fi
 
 ARCH=
-# Normalise host CPU name and set ARCH.
+# Normalise host CPU name, set ARCH and multilib cflags
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390x|sparc64|x32|riscv)
-  ;;
-  ppc64le)
-    ARCH="ppc64"
-  ;;
+  aarch64|riscv) ;;
+  armv*b|armv*l|arm)
+    cpu="arm" ;;
+
   i386|i486|i586|i686|i86pc|BePC)
     cpu="i386"
-  ;;
+    CPU_CFLAGS="-m32" ;;
+  x32)
+    CPU_CFLAGS="-mx32" ;;
   x86_64|amd64)
     cpu="x86_64"
-  ;;
-  armv*b|armv*l|arm)
-    cpu="arm"
-  ;;
-  aarch64)
-    cpu="aarch64"
-  ;;
+    # ??? Only extremely old AMD cpus do not have cmpxchg16b.
+    # If we truly care, we should simply detect this case at
+    # runtime and generate the fallback to serial emulation.
+    CPU_CFLAGS="-m64 -mcx16" ;;
+
   mips*)
-    cpu="mips"
-  ;;
+    cpu="mips" ;;
+
+  ppc)
+    CPU_CFLAGS="-m32" ;;
+  ppc64)
+    CPU_CFLAGS="-m64" ;;
+  ppc64le)
+    ARCH="ppc64" ;;
+
+  s390)
+    CPU_CFLAGS="-m31"
+    ARCH=unknown ;;
+  s390x)
+    CPU_CFLAGS="-m64" ;;
+
   sparc|sun4[cdmuv])
     cpu="sparc"
-  ;;
+    CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
+  sparc64)
+    CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
+
   *)
     # This will result in either an error or falling back to TCI later
     ARCH=unknown
@@ -1252,24 +1267,6 @@ local_statedir="${local_statedir:-$prefix/var}"
 firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
 localedir="${localedir:-$datadir/locale}"
 
-case "$cpu" in
-    ppc) CPU_CFLAGS="-m32" ;;
-    ppc64) CPU_CFLAGS="-m64" ;;
-    sparc) CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
-    sparc64) CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
-    s390) CPU_CFLAGS="-m31" ;;
-    s390x) CPU_CFLAGS="-m64" ;;
-    i386) CPU_CFLAGS="-m32" ;;
-    x32) CPU_CFLAGS="-mx32" ;;
-
-    # ??? Only extremely old AMD cpus do not have cmpxchg16b.
-    # If we truly care, we should simply detect this case at
-    # runtime and generate the fallback to serial emulation.
-    x86_64) CPU_CFLAGS="-m64 -mcx16" ;;
-
-    # No special flags required for other host CPUs
-esac
-
 if eval test -z "\${cross_cc_$cpu}"; then
     eval "cross_cc_${cpu}=\$cc"
     cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
-- 
2.33.1



