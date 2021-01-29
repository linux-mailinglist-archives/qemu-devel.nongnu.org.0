Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC510308810
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:07:22 +0100 (CET)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RcY-0004jK-0f
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW6-0004Ss-0d
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVt-0006zJ-VS
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id p15so8367314wrq.8
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rIuJfM2H38AD9rjbnhVNMilR5WET5VmWsDJu8FbR7Kk=;
 b=O0tlptxZMfjsEhViqgb9I6N859ZACKi777y3RTVFD0ldaxGLvxbJNYPhY86TxjSRsT
 qiNQDk0g50I649uiFBB6Z5GGspx2DS4SVdrr7pDUcvF12zAx1h8pE0SVz2EO3rEJPWpO
 8QVrsLdVPLwMTSpNLzdetIRskl7tOqP9tDC9jZp2IIcsi7oK4JT6PrGVAQniqRELeAUo
 6xlASO8DBudY455wPa30KcmO/rzNIgpxr6O6zUvDmwVOskD7Bq9P19RJp2oERtdED9FL
 2VVfDJ7ElvVD4ACV56fBBrSc2Q1E9dTZbqEjoobQUgjROn0PiGh2W/4Gzf0EpgWDWTXW
 ckUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rIuJfM2H38AD9rjbnhVNMilR5WET5VmWsDJu8FbR7Kk=;
 b=HRo8LSBGPY0oCXPjVfwUWYJ7giQ7yNOCf9f52W0tJWy5/wabO7vmaXNz0F/nQNVHtl
 aTg23W5eqaCXBHSeTxlbSPegsnWbEjgMRdW9HiHuV7Dd39MXBk/pNn8/8Si03hmwXIDp
 AX5VRsPSi78zook0wvnIIuzmg8rz0RF5QWSz+zsOeitQT1fEfJnW+ewoeXSAquqoLNGG
 lfwVfvh/0r3ztTfPnjmSwVs5+FIhz2Wh0dKHHEJEIDOEyxMTYHqZ9ojzsByeilxJWrQY
 LgYPyleH6IEORRRXEKRld5ydVJpwamnkNjIW1AU2gK1SmtAn+HhqmvrL5lZ7uIYx4xOX
 4S/A==
X-Gm-Message-State: AOAM5331WfDKBqQ5DyXSat5YfSby9qi/L/m4uJHchS1Ke/yqW137kn4P
 /8WFA6/SpBfrc8DEb4H/TfEK5KL2t+1KJQ==
X-Google-Smtp-Source: ABdhPJyO6uNc9rzZy8NQj412MWAy4bqwJwxtmGbByLS8JJ0M770NUFK1nvg6JwhzXEiP4OdVYtIEJA==
X-Received: by 2002:a05:6000:1105:: with SMTP id
 z5mr3874614wrw.15.1611918026940; 
 Fri, 29 Jan 2021 03:00:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/46] darwin: fix cross-compiling for Darwin
Date: Fri, 29 Jan 2021 10:59:39 +0000
Message-Id: <20210129110012.8660-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

Add objc to the Meson cross file as well as detection of Darwin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210126012457.39046-8-j@getutm.app
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index cd44b21149e..e520a434065 100755
--- a/configure
+++ b/configure
@@ -6282,6 +6282,7 @@ echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
 echo "[binaries]" >> $cross
 echo "c = [$(meson_quote $cc)]" >> $cross
 test -n "$cxx" && echo "cpp = [$(meson_quote $cxx)]" >> $cross
+test -n "$objcc" && echo "objc = [$(meson_quote $objcc)]" >> $cross
 echo "ar = [$(meson_quote $ar)]" >> $cross
 echo "nm = [$(meson_quote $nm)]" >> $cross
 echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
@@ -6300,6 +6301,9 @@ if test "$cross_compile" = "yes"; then
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
2.20.1


