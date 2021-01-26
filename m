Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F73303151
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:33:45 +0100 (CET)
Received: from localhost ([::1]:50290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DEm-0002lM-C2
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6X-0005f6-8L
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:22 -0500
Received: from mail-pf1-f173.google.com ([209.85.210.173]:33638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6T-0006Aa-BZ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:12 -0500
Received: by mail-pf1-f173.google.com with SMTP id o20so9480600pfu.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 17:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lNNbPBcVDZh5ROvOnWqk8OSUdw/QY2HR5+MLl73XwI8=;
 b=Oh8SeeOD0/uh6BEuZCLu35Ac6+FhI+GsBkDR7fE0oFVIZXgrURs3mgJb5wmuQL4yQy
 EAJeF8bphAMdOm4KaC6Av+FiyKR3ldN8hrSCLiq2KjIwrzZJVli5CFzZ+bp0pU8zEZ9V
 sxLm78CoN//rARBQyBGGUwUqFsg1XFUNEadRq0k5RLLVas4/P6g4usC91pfcsiYXLqw5
 Vgp/NxRfoRntTwcP/pDmBpwVm9mgWd8Tqb5JgxmXKsZHBDO/JEIn7rgafmt9J3a2cy7V
 X24fT7mvBIfgMTl8tkBfzJK1wgWjsYlOtGkUsC6lA9Mfnw4PlpzngV/rhJ6GXWbr5OqB
 3nOA==
X-Gm-Message-State: AOAM532ZjRjT7/T0t7+ckeSAcM1NS7N8tTMoz462MVsZJOlMpntbiSIf
 hyj00Q/BhwCroHfirme37PlNHyV0uvY=
X-Google-Smtp-Source: ABdhPJwXGfL0MMxzUTHdTeDTp6M8HdUxJNTeoPIbjI08upAwpIqocHI8sgmDz/L+Q85K9EKdsNJqqQ==
X-Received: by 2002:aa7:90cf:0:b029:1a3:a176:f4d0 with SMTP id
 k15-20020aa790cf0000b02901a3a176f4d0mr2894037pfk.8.1611624306473; 
 Mon, 25 Jan 2021 17:25:06 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:06 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/11] darwin: fix cross-compiling for Darwin
Date: Mon, 25 Jan 2021 17:24:53 -0800
Message-Id: <20210126012457.39046-8-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.173;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f173.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 1b2fc502ea..96738a19bc 100755
--- a/configure
+++ b/configure
@@ -6402,6 +6402,7 @@ echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
 echo "[binaries]" >> $cross
 echo "c = [$(meson_quote $cc)]" >> $cross
 test -n "$cxx" && echo "cpp = [$(meson_quote $cxx)]" >> $cross
+test -n "$objcc" && echo "objc = [$(meson_quote $objcc)]" >> $cross
 echo "ar = [$(meson_quote $ar)]" >> $cross
 echo "nm = [$(meson_quote $nm)]" >> $cross
 echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
@@ -6420,6 +6421,9 @@ if test "$cross_compile" = "yes"; then
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


