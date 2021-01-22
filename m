Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882D2300D8D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:18:38 +0100 (CET)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32tB-0005gi-JF
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mE-0004wH-2V
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:26 -0500
Received: from mail-pj1-f46.google.com ([209.85.216.46]:36109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mC-0004cT-Hj
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:25 -0500
Received: by mail-pj1-f46.google.com with SMTP id e6so4609260pjj.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWegMfg0i0hDDWGoVKdg+A4xiQ6lvBugKe41iD56/ps=;
 b=PI50yaKP199bbgUxUXnkvNxEvBNOKbf3pnTG9Dk5D9J0khCs6SiDT8zklIv2WSmVnW
 Unsv1FnkmPdh0Ru+PtfHNMkZg/qowgLgB9EAA1aZO1Oir4u5Vx05SjAT+Yc7EUbQYgwS
 6CnbcWKa4H0RFKAaUZ0bPQ3PCxW1bah+Mczr8Zcxlcw3cZSejLckqsITmuQtpe6s9rfp
 DtZ2FJs3QQhzoko4UkVILWx3f3dL1/jIhG+myMhPJmCrEcvPkyae9QCHpnJoaiIfKK5a
 iya8V4yfhCP6GyAmXz2Otm6aeiggekaNqMGEZxqL0VrenQIFJN6Qy7LNMOjpFJZoWrAV
 Y8Fw==
X-Gm-Message-State: AOAM531tDJgWzBuRChUMGn0SYYSa4b6OpmWa4Y7B7zANXOOUDUMxPZIj
 bnMlm5Y0YqNUUPrs90JpqDA0JNwE+xg=
X-Google-Smtp-Source: ABdhPJxj2YQPmDPrJtNRcu9zsj4pAkNI8jloVc0VFwYNuz9rz1rh0/NIwcYWHLVImpEu6cUx63gpLA==
X-Received: by 2002:a17:90a:b28f:: with SMTP id
 c15mr7110896pjr.79.1611346282949; 
 Fri, 22 Jan 2021 12:11:22 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:22 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/11] darwin: fix cross-compiling for Darwin
Date: Fri, 22 Jan 2021 12:11:09 -0800
Message-Id: <20210122201113.63788-8-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.46; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add objc to the Meson cross file as well as detection of Darwin.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 4c485dd962..7e5ec7a5a1 100755
--- a/configure
+++ b/configure
@@ -6443,6 +6443,7 @@ echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
 echo "[binaries]" >> $cross
 echo "c = [$(meson_quote $cc)]" >> $cross
 test -n "$cxx" && echo "cpp = [$(meson_quote $cxx)]" >> $cross
+test -n "$objcc" && echo "objc = [$(meson_quote $objcc)]" >> $cross
 echo "ar = [$(meson_quote $ar)]" >> $cross
 echo "nm = [$(meson_quote $nm)]" >> $cross
 echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
@@ -6461,6 +6462,9 @@ if test "$cross_compile" = "yes"; then
     if test "$linux" = "yes" ; then
         echo "system = 'linux'" >> $cross
     fi
+    if test "$darwin" = "yes" ; then
+        echo "system = 'darwin'" >> $cross
+    fi
     case "$ARCH" in
         i386|x86_64)
             echo "cpu_family = 'x86'" >> $cross
-- 
2.28.0


