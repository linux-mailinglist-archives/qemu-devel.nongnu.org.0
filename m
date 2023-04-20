Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E376E98E8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:58:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWf8-0000CS-G7; Thu, 20 Apr 2023 11:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf6-0000BQ-FZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:32 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf4-0007vB-KS
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n43-20020a05600c502b00b003f17466a9c1so3310472wmr.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006248; x=1684598248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pZT3Il0Z6ehRMXrKuFjhJyb9HkLDoEsCo9Ux/XBJuc=;
 b=D9VRfp9MtT/vYu6qDryy8LitOvu8IXhgzR0NR7+vQ9PYVYymyiMnA+cZdfgX07MTr5
 jmplAVwDpBwRlsUuQePfj9Oob+lSuqGKRPFUSLyqtGxg5bWerNE96RHpQLzylb3NrhgB
 ca/KDhDkfrE1n/5EgMFznQGSoyH50ysvxh0/cPltKi6HYO6XVlvK8xwkYe2rCXz07nnb
 iFJXArJU0sQ7H5EpJQv6chooNWL4IV4REujZHzXlYK/3u36ngxcywFtHXvvJOToUOqig
 gjwsCOLJgy/D5PcZVOshTkRxD6ijFqyiVQqXpdclycA/HYHdb4Qi48XJSni4RsKEpF5X
 nwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006248; x=1684598248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pZT3Il0Z6ehRMXrKuFjhJyb9HkLDoEsCo9Ux/XBJuc=;
 b=ln3kH+MOK3o+FytViW4MErNzL5hDMEbmN8hur9ifau1jjP9Xomh6Pm5G9UrjLudSLK
 BXgxWzo/sE7cWrOGyohiL111t4mQxYZbYkDg3jZFB4g49fq7js6c9giLmGEMZr8+xy+z
 /b1Ovo2lvsMXQGKehRpbhgXE2TQ5D4Tc04x2XsGlsO99RQ5+UrdkdBwYJkuV8p7H9oLY
 OuDUfsegJx5HkotElQiZKmpRWgqUxUHwSxz5Olbe/PIi686YiFw7+SshKuEGPG2ARczk
 jomEbRADH1hoR+kHenSsXzPyTeuTE8VElA9eVqXDXge8qTxbOnyClnkvxJbgL5YVoITo
 5g4Q==
X-Gm-Message-State: AAQBX9faEehHfst9ZEU8+mswBUAh+KZGAC06mbW7OtvsFXF4M/7MQ2fn
 rs86orQXk5y4UYlRm18A385Xi4MG7NsmZwo8g4c=
X-Google-Smtp-Source: AKy350bcvNlLdSG5wLb8TN+auFPhVNVTBW+2judPYd5U9nBCbUMtK2cTABkl3ChoPHYnLV8odJlgXA==
X-Received: by 2002:a7b:cb8d:0:b0:3f1:789d:ad32 with SMTP id
 m13-20020a7bcb8d000000b003f1789dad32mr1836342wmi.11.1682006248649; 
 Thu, 20 Apr 2023 08:57:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b003eddc6aa5fasm2024962wmb.39.2023.04.20.08.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 52CA31FFC0;
 Thu, 20 Apr 2023 16:57:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 8/9] docs/devel: mention the spacing requirement for QOM
Date: Thu, 20 Apr 2023 16:57:22 +0100
Message-Id: <20230420155723.1711048-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We have a more complete document on QOM but we should at least mention
the style requirements in the style guide.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 docs/devel/qom.rst   |  2 ++
 docs/devel/style.rst | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 3e34b07c98..c9237950d0 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -1,3 +1,5 @@
+.. _qom:
+
 ===========================
 The QEMU Object Model (QOM)
 ===========================
diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 5bc6f2f095..0bd01f3fca 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -628,6 +628,35 @@ are still some caveats to beware of
 QEMU Specific Idioms
 ********************
 
+QEMU Object Model Declarations
+==============================
+
+The QEMU Object Model (QOM) provides a framework for handling objects
+in the base C language. The first declaration of a storage or class
+structure should always be the parent and leave a visual space between
+that declaration and the new code.
+
+.. code-block:: c
+
+    typedef struct MyDeviceState {
+        DeviceState parent_obj;
+
+        /* Properties */
+        int prop_a;
+        char *prob_b;
+        /* Other stuff */
+        int internal_state;
+    } MyDeviceState;
+
+    typedef struct MyDeviceClass {
+        ObjectClass parent_class;
+
+        void (*new_fn1)(void);
+        bool (*new_fn2)(CPUState *);
+   } MyDeviceClass;
+
+See :ref:`qom` for more details.
+
 Error handling and reporting
 ============================
 
-- 
2.39.2


