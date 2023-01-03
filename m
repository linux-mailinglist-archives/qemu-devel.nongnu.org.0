Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECA65BE66
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 11:50:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCeq2-00067S-Go; Tue, 03 Jan 2023 05:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pCeq0-00066m-9R
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 05:48:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pCepy-0001tO-Du
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 05:48:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id l26so20762775wme.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 02:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OjsCgixJ853aLDT+sx3gTfL1hNKd5uADdfrKzgPAsPE=;
 b=VyXDnsn5mvf1+rWcbFVas3xTc0a1pR+PVfWWezJj8tqHvo/WMqkUwOlmtcoGRnW55x
 6vuR1nMlmiCNjbl19h3oQevE0ueHi0Y917Swi7AbQud5dACOuJAkTsrU/eOOCOtQn65E
 xWQzdhpC1H6E1Z62ut/ZGmDEPvwHRcomV4ZLZuJAHDr9Cvav7qYRfVHacQDGr0eCieul
 NbmDsn9cBAy5j+v69k6kxRMdJ1Nyqfgm17aBr2f/t58mjaVbspzEg/w8zpuTQMBxPgWM
 FMPglY4cK+ZLhpkqLt4LUF9rLUhSMhrLZfhLBwe75YZomuooS4FQ+4jcqT45iykspxx4
 OtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OjsCgixJ853aLDT+sx3gTfL1hNKd5uADdfrKzgPAsPE=;
 b=IeAh714Ct62MvZr3Tz1dYZDdYEVxsWmR9EPMbZX7zs9wkMLpqsXBqP4hQDHreQAejl
 61qEShnJ8kurXb2O6c9ysmdaaPyEu8BwuMT1+mjhCaid19rBpNzy1ucEiS5Y557kQuCp
 LjoKwMRh/ltyLZQ+bNcjo6Z7AvzCNMMQm+NEH5MoFZOWF7e400OO+NNJ0k2Za2g+1tf7
 M+YQOwF8eeWtm29w3ekF6F8L7+CRRo3HP44b3tYhto1HvXg9baR3aFw1kmf0+31GzjLv
 njEQJs0Q8grz0MFYOilzA0ECMljTDmBH/9aPAiLSe2VLliGMqhW4DZtJH8Nq4O9856cc
 MLZA==
X-Gm-Message-State: AFqh2kpbSN1VxuF8Apsy/w/DP/kzBOjFjQ0TAbmU/yP7kFkKxmEbPtaj
 vzflzHpBpM5iv3ikuRonBarp1w==
X-Google-Smtp-Source: AMrXdXsT/Dj2DpR/hhLfyECPq8g4KlCopywqxXfA3dl1iemBXj2Ho/CUXKpf26Ur+/3nBtjRc5QoJA==
X-Received: by 2002:a05:600c:3ca2:b0:3d9:a5a2:65fa with SMTP id
 bg34-20020a05600c3ca200b003d9a5a265famr9645115wmb.7.1672742884517; 
 Tue, 03 Jan 2023 02:48:04 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003d9980c5e7asm22601397wmq.21.2023.01.03.02.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 02:48:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5CE61FFB7;
 Tue,  3 Jan 2023 10:48:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH] docs: add some details about compilation units to coding
 style
Date: Tue,  3 Jan 2023 10:47:58 +0000
Message-Id: <20230103104758.767266-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The build-system documentation remains the canonical description of
how the whole build system goes together. However we should at least
reference the fact that we use conditional compilation in the coding
style document which I assume is the first document a potential
contributor actually reads (if at all).

[AJB: should we make more explicit reference to NEED_CPU?]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Alessandro Di Federico <ale@rev.ng>
---
 docs/devel/build-system.rst |  1 +
 docs/devel/style.rst        | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 1894721743..eb50578f8b 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -107,6 +107,7 @@ developers in checking for system features:
    Run pkg-config passing it $ARGS. If QEMU is doing a static build,
    then --static will be automatically added to $ARGS
 
+.. _meson:
 
 Stage 2: Meson
 ==============
diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 7ddd42b6c2..36c7868854 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -607,6 +607,42 @@ are still some caveats to beware of
 QEMU Specific Idioms
 ********************
 
+Module and file layout
+======================
+
+The QEMU project is a large and complex one where individual files can
+be re-built multiple times for various final binaries. This is often
+accomplished through heavy use of #define values to control
+conditional compilation. However care should be taken to avoid
+introducing files that are compiled for every target for trivial
+differences.
+
+Some general rules of thumb:
+
+  * CONFIG_* flags come from either host or target specific defines.
+    You can see where they come from by comparing config-host.h and
+    $TARGET-config.target.h
+
+  * #ifdef CONFIG_USER_ONLY/CONFIG_SOFTMMU should only be added to
+    files that already use them to compile multiple versions.
+
+  * Try and avoid target_* specific typedefs in common code
+
+See the build system :ref:`meson<meson>` documentation for the details of how
+the various compilation units are handled.
+
+"Templates" and generated code
+==============================
+
+We make heavy use of C's macro facilities combined with multiple
+inclusion to generate code. This tends to use header files (usually
+with the .inc suffix) with different #define'd constants. While the
+use of C11's _Generic keyword has improved things a bit this technique
+is still best suited to repetitive boiler plate code. If more complex
+code generation is required consider using a script to generate it,
+see for example the decodetree and qapi header scripts.
+
+
 Error handling and reporting
 ============================
 
-- 
2.34.1


