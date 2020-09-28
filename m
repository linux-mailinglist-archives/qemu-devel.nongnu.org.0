Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999027B16E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 18:09:25 +0200 (CEST)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMviO-0006In-6v
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 12:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kMvdM-0002UZ-NE
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 12:04:12 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kMvdK-0003vZ-6W
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 12:04:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id k10so1959874wru.6
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jOZnrxRTG3Vn0Y7sOS02Z9FyMYbuYQPu1NRLX+duSw=;
 b=tZnoGXl3+47IBn/jurHyNSw25u0qJjmzoYukvCPjke1C4KbtagTFdTISWuzMltvUpH
 hSWbgyeTI2yvqHQEIEG/sq7myF/84mQRIk+RjesVQZ2stKoj+nlE3Ay8qhiPOHcfJRQ6
 dsxHZMGlK6v6ZldcbU6VaVoGL0U4Sbvkxec9FoKg1gOOEjwNsobBb4G0Bdil0zacSSC2
 NTckKh6dJtIJRg1E2D+m1zSYXbx9VIFhdrRZom8enAkODNkt+lG0SS9XHEIyzj7GdiAC
 FkHuPwL1MqscsdQHi/uw94rKwxbcP2BIuwgDyXzr8cU6eIrnlrec3Gt8uskm8sg9minV
 1CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jOZnrxRTG3Vn0Y7sOS02Z9FyMYbuYQPu1NRLX+duSw=;
 b=gKCZsrxln6oS/cdtLYeTCJiiHGJoWCLlpLzgKvKTi+72eOAXAc4XlVp4ELNxQwBnVS
 4uONlXA50hXfbQgFGiubtauw52+01g91FLgZw75jCsycErRktVuH8QUJj/97r6ylKm4R
 8yHlbo7NIzWCLIcY3jv8L42Vs8oVbaRhvPL6fo9LXeVCMRJcPeIbjhNzrZiR7FUkDd7Q
 cqClrp+h7dS1+WT0nDeIqyySWVUTFf5oYEvqHnCiJJkARdYBlQ57GU/JRfwIbEe+AvP0
 vI9p7bhp8U7s2KLUb2RXJqB76ANaC2rxq4NnePZtHpowfq1t5jIIawHhaQ+hA1ZRlKra
 mIRg==
X-Gm-Message-State: AOAM530InteYxdeCmLpdLJynMEYzZYATW/m02ZrJKXBGXgirZNMOsMNN
 y2lzSMYkyl7PN7yHtAm3zbxP6Zk09GQLRyUZ
X-Google-Smtp-Source: ABdhPJxpvZAwQHIJtCkYOaVOE1p4pUU8ySId2SPqatf3EYN6EiAvenMgYHBrx5CdB5ecDnhtl7+TGQ==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr2669655wrn.57.1601309045283;
 Mon, 28 Sep 2020 09:04:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r21sm2420834wrc.70.2020.09.28.09.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 09:04:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Test that gio libs from pkg-config work
Date: Mon, 28 Sep 2020 17:04:02 +0100
Message-Id: <20200928160402.7961-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On some hosts (eg Ubuntu Bionic) pkg-config returns a set of
libraries for gio-2.0 which don't actually work when compiling
statically. (Specifically, the returned library string includes
-lmount, but not -lblkid which -lmount depends upon, so linking
fails due to missing symbols.)

Check that the libraries work, and don't enable gio if they don't,
in the same way we do for gnutls.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I wanted a statically-linked system emulation binary (which, yes,
I know is not really something we support :-)). I got one with
suitably liberal use of --disable-foo configure options, and
this was the only thing I couldn't work around that way.
The patch is needed because there's no --disable-gio. I suppose
we could add that instead (or as well)...
Possibly meson offers a nicer way to do this, but this was
simple and gnutls is doing the check this way already.
---
 configure | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e8e8e984f24..cd79227d763 100755
--- a/configure
+++ b/configure
@@ -3762,13 +3762,21 @@ if test "$static" = yes && test "$mingw32" = yes; then
 fi
 
 if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
-    gio=yes
     gio_cflags=$($pkg_config --cflags gio-2.0)
     gio_libs=$($pkg_config --libs gio-2.0)
     gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
     if [ ! -x "$gdbus_codegen" ]; then
         gdbus_codegen=
     fi
+    # Check that the libraries actually work -- Ubuntu 18.04 ships
+    # with pkg-config --static --libs data for gio-2.0 that is missing
+    # -lblkid and will give a link error.
+    write_c_skeleton
+    if compile_prog "" "gio_libs" ; then
+        gio=yes
+    else
+        gio=no
+    fi
 else
     gio=no
 fi
-- 
2.20.1


