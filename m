Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E584948C3D1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:14:25 +0100 (CET)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cWG-0001q4-W8
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:14:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7c50-0003Vz-1t
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:46:14 -0500
Received: from [2607:f8b0:4864:20::934] (port=33620
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7c4y-0006I5-Cw
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:46:13 -0500
Received: by mail-ua1-x934.google.com with SMTP id u6so4297797uaq.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RgR++mzd4nHAJ0qj6nm77nGNzlG5e04+4pukBUPNhbY=;
 b=QeqPI2r/ltKfk46mmxxBWDmUH4pmY9BmWpP98B1qHUBlqH1h3t4cmQ6Qb1QCCV7tzO
 GVsOmHELZsDg7q8T4jBivkC68vLHodS9jwDZCnZiV6h+vPqQn0MMwD7YW0M2tzlO4hmK
 3Iw2k+O2+6YkD8EWkEVfVcShk1CNTWiFcgJIk/tE8XHgUViRduY4qTPtwGniD1J4qVsl
 q4Bk60En8aITh7udtuRAqrQ9t7KFG+5b7JFgThZZ9WaW/uyXCC6rkSjogOzFoiZaBx8Y
 FNo/r9vDPuZUWB8aQrPkoX5z9uKrEppCb4lZl1WbjWFWKaWJpmetkCd2kttRXSKxcWfT
 vOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RgR++mzd4nHAJ0qj6nm77nGNzlG5e04+4pukBUPNhbY=;
 b=rH1eKfi++5E/bN4Al7K0i3hVHQj7faRh6yBq6ahwHboKIHnhCz0Tmu2/iTXcRun0fA
 UFeak2bSMIf282VTBy2TGV65XpVciRYB5c2DWkaQvQCp5GFZlBab0Znrj4MSWMrKFWB4
 hxyME9K0jFF9cAhA49227vRnbsjEaFnLADKXJkABXZ0f8ZU6K9QAuTSj+I/CMuZadzBo
 Rt8QxxNydNu7yY2KnDjKHb5WweaiNCmv7quEFQ4glKX/BQPyccby4SmY2RBNExJgG+bj
 93eGT9jPvnh1k3GUybTYBtFHICc3Zde1248R278jgp4pZtID0Occ4Qh5eRTLzD6qBY5V
 k5tw==
X-Gm-Message-State: AOAM531KzaBKGb56BfWJciblG7+b2KJViCJD0r6meD+4YeLY826e8uo1
 Y8MN71pNaSXWXKaYneeUL0NQlw==
X-Google-Smtp-Source: ABdhPJyFicdx3Z3T4zP7Ti0GUrnanfSBOvdVhrdVFP165PJiVCHyVCaI2tCJljFXhJCe7X6SMSobYw==
X-Received: by 2002:a05:6102:2279:: with SMTP id
 v25mr2407962vsd.22.1641987971402; 
 Wed, 12 Jan 2022 03:46:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j27sm7301361vkl.52.2022.01.12.03.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:46:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BBDD1FFD0;
 Wed, 12 Jan 2022 11:27:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 24/31] docs/devel: more documentation on the use of suffixes
Date: Wed, 12 Jan 2022 11:27:15 +0000
Message-Id: <20220112112722.3641051-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x934.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using _qemu is a little confusing. Let's use _compat for these sorts
of things. We should also mention _impl which is another common suffix
in the code base.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20220105135009.1584676-25-alex.bennee@linaro.org>

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 4f770002a7..793a8d4280 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -151,6 +151,12 @@ If there are two versions of a function to be called with or without a
 lock held, the function that expects the lock to be already held
 usually uses the suffix ``_locked``.
 
+If a function is a shim designed to deal with compatibility
+workarounds we use the suffix ``_compat``. These are generally not
+called directly and aliased to the plain function name via the
+pre-processor. Another common suffix is ``_impl``; it is used for the
+concrete implementation of a function that will not be called
+directly, but rather through a macro or an inline function.
 
 Block structure
 ===============
diff --git a/include/glib-compat.h b/include/glib-compat.h
index 8d01a8c01f..3113a7d2af 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -46,9 +46,9 @@
  *    int g_foo(const char *wibble)
  *
  * We must define a static inline function with the same signature that does
- * what we need, but with a "_qemu" suffix e.g.
+ * what we need, but with a "_compat" suffix e.g.
  *
- * static inline void g_foo_qemu(const char *wibble)
+ * static inline void g_foo_compat(const char *wibble)
  * {
  *     #if GLIB_CHECK_VERSION(X, Y, 0)
  *        g_foo(wibble)
@@ -61,7 +61,7 @@
  * ensuring this wrapper function impl doesn't trigger the compiler warning
  * about using too new glib APIs. Finally we can do
  *
- *   #define g_foo(a) g_foo_qemu(a)
+ *   #define g_foo(a) g_foo_compat(a)
  *
  * So now the code elsewhere in QEMU, which *does* have the
  * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
-- 
2.30.2


