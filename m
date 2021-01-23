Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C4301325
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 06:00:13 +0100 (CET)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B1w-0003Qr-6B
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 00:00:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayf-0006yg-7A
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:50 -0500
Received: from mail-pf1-f180.google.com ([209.85.210.180]:37899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayc-0005s1-Dr
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:47 -0500
Received: by mail-pf1-f180.google.com with SMTP id y205so5175714pfc.5
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Evc3Shcq8rsCtOF7PANGsgPxIxxAPv8CQExUls7YgO4=;
 b=kTwjFgCC0CWn2k0yU/ofto2s6U054dwS7HdoHuVdIHriK1IXpmjYDh/BOOcGT9ZfpQ
 WTgpP/dcymT6r5l/jl7zUuwGFTPBONZyUQEiY/WaYOUM+LM3TjsLw3olVGRMhezd+CS4
 9eLNOtCUnmaMZtMvQhKhJHfcrLuZ4aWfdE7eF5qYSgY14CKSqv9+Rt269T0jMrsMvxJw
 Jx977XU5/N8FfhaZG/Ac4/xbWU6H1gsK5RcUUZHYJFRiPFaGBsub00XcFy7eNSAUbE6W
 YcdT7Qg10z5ltM4bmxY8FiNDLSUPle0B1oxBDimFVpKx1jjSu4OZCOOLUu5UPCvTd7Rf
 WHLQ==
X-Gm-Message-State: AOAM533dsnU5CN1hmAuq5zLTK+uOmHqIG3dsBw+vp8VBTKIY8w3XVmLI
 P1U52R7RKrVUGyVWbxgK2s7tVbT04P4=
X-Google-Smtp-Source: ABdhPJxjaNAT7xnAWuxMbRa3Zv/PiI+t5aQqFjnUtyf48cFvh5aF+UXepxG8ebzARxI2nYSqJPWh1g==
X-Received: by 2002:a65:6409:: with SMTP id a9mr7965431pgv.171.1611377804538; 
 Fri, 22 Jan 2021 20:56:44 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:44 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/11] darwin: fix cross-compiling for Darwin
Date: Fri, 22 Jan 2021 20:56:28 -0800
Message-Id: <20210123045632.18482-8-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.180;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f180.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add objc to the Meson cross file as well as detection of Darwin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 0fd3f14c5e..d4588ed892 100755
--- a/configure
+++ b/configure
@@ -6422,6 +6422,7 @@ echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
 echo "[binaries]" >> $cross
 echo "c = [$(meson_quote $cc)]" >> $cross
 test -n "$cxx" && echo "cpp = [$(meson_quote $cxx)]" >> $cross
+test -n "$objcc" && echo "objc = [$(meson_quote $objcc)]" >> $cross
 echo "ar = [$(meson_quote $ar)]" >> $cross
 echo "nm = [$(meson_quote $nm)]" >> $cross
 echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
@@ -6440,6 +6441,9 @@ if test "$cross_compile" = "yes"; then
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


