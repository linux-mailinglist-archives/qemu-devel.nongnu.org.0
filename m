Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62043C8770
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:29:15 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gp0-0004IR-IH
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUq-0006Tw-8M
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUo-0003y4-MV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id d12so3594512wre.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwRw1ob/qac5/FqzuOGenSxZqRN/B2GFmh5qC/YLlU8=;
 b=j9YgceR2vRV1QTeLNxo2f6d6vv0oLvm4Crg4l5MvYk0MWB8c8FnpGCeoM99IoATxCW
 vr02KkXeTmBWZMjpY8yXH6eRkXNCWhcXxDYxF9sGmOvPT025rEaze8vq33gxmxlhH/uk
 H6IfkFXKdMOvSuYq77woK3Y4tObiIEjy2l1QEW0GBzYDHnh7RpA/EkTIm0AX/qcUqln2
 31Ie/NYyjKlksgIzvCREz+MvUpzMsqUwqXvEdEt28M6F7gYQx8pYhEesWcTe4pUJ4t/M
 LOr5elP1cVq4BiqFNT/awzTJ8/IyMXdORnaNaZ4QXubP0J15g3S8h5CzMD0dwI+gEy9j
 E/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwRw1ob/qac5/FqzuOGenSxZqRN/B2GFmh5qC/YLlU8=;
 b=XJ/ci1POEZa7v5jCbwpcj4pjrUbGVr8jzEkz7MhF5PDPeCf2gVjXF2jQIIVHSznIfc
 I4CMkPS9UpCD63jxxH63+9MD62aZIIw6xGHy4ZjG+SQz5U+Z8jxlnyvVXwi9DI/e52rP
 lbKV6SdVWaC4uQuEp72ycjGY6wT3KFCNWMNC9YHrO5uyc5LcRH3MWQFOTMrDVA2UNtP5
 gxJfXfYlEWlFN6AHSypWn6/ySnnGa9mrqVqHwwrGljRnPNq79G06fE0Bw+nw6b2dd9Ai
 AwSJ1JdWig9jxN/By5wsS4aaZBjNDIWbdsEPFWXcurO2sH5/VJiqmoFBkDFgV/kyzY0y
 Q0vg==
X-Gm-Message-State: AOAM530CbND6YtTGlD6TvrCwtSgVSU1GMOlts7IXPq8qnRcx3DgZUGoi
 pDlVs3kcBJ2zb2+lBfO05l3STg==
X-Google-Smtp-Source: ABdhPJxHMBzvSNAfEQEKuoWizDdQBLWGv9R0p5JauBNxNM7CjTnBdMhHAe5bhUGK1dcgbzABLODpEw==
X-Received: by 2002:adf:ec07:: with SMTP id x7mr13955776wrn.262.1626275301340; 
 Wed, 14 Jul 2021 08:08:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t3sm5535383wmi.14.2021.07.14.08.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F09C1FFAA;
 Wed, 14 Jul 2021 16:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 20/44] tests/docker: remove mingw packages from Fedora
Date: Wed, 14 Jul 2021 16:00:12 +0100
Message-Id: <20210714150036.21060-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

There are dedicated containers providing mingw packages for Fedora.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-11-berrange@redhat.com>
Message-Id: <20210709143005.1554-19-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index f667f03cc5..5849ea7617 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -52,33 +52,6 @@ ENV PACKAGES \
     lzo-devel \
     make \
     meson \
-    mingw32-bzip2 \
-    mingw32-curl \
-    mingw32-glib2 \
-    mingw32-gmp \
-    mingw32-gnutls \
-    mingw32-gtk3 \
-    mingw32-libjpeg-turbo \
-    mingw32-libpng \
-    mingw32-libtasn1 \
-    mingw32-nettle \
-    mingw32-nsis \
-    mingw32-pixman \
-    mingw32-pkg-config \
-    mingw32-SDL2 \
-    mingw64-bzip2 \
-    mingw64-curl \
-    mingw64-glib2 \
-    mingw64-gmp \
-    mingw64-gnutls \
-    mingw64-gtk3 \
-    mingw64-libjpeg-turbo \
-    mingw64-libpng \
-    mingw64-libtasn1 \
-    mingw64-nettle \
-    mingw64-pixman \
-    mingw64-pkg-config \
-    mingw64-SDL2 \
     ncurses-devel \
     nettle-devel \
     ninja-build \
-- 
2.20.1


