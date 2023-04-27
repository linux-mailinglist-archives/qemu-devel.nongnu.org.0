Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D606F08D1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:56:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3wx-0007nF-Jd; Thu, 27 Apr 2023 11:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3wv-0007mN-DM
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:54:25 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3wt-0006mR-Eg
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:54:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so5479872f8f.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610862; x=1685202862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1P7UU9XkAh8MdcejAHOkstfLQyMrAhkzu8fMbugyBnE=;
 b=kW8ScI7xAfNER6iqVf7fVc+1LbkT51PgGlYlsGIQ5GaQInLbJMqq2uZQxjWBwfAVdb
 GL53Tzdk38EGAZEUPjmH1HkAy+ek8NExEN81rkZUyC0ACZUYKogy3z+ZL0j5iTUbK91G
 O4h6qcHENOsbVFAJHGyNn2B+acDotwbgC5aP2JJF/EAU3yivgpK5bURSs4LU9BHG9LIo
 yemfpLyLc9Efw8kfVjv3RRhljCuX7GnUJwOLqLgmOFM7izSvqd3oRDsUbcn9V5Ocai6G
 oG0arE1mpAhnGlYYPrwMZg55gqv66Je+/ioUZ4T7G2vnXdB25lj6gzKRg9psxUY60qXf
 PrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610862; x=1685202862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1P7UU9XkAh8MdcejAHOkstfLQyMrAhkzu8fMbugyBnE=;
 b=aVRTwCHfMwffmnyltmbDfCvqZXhzHIH4SFRJxGDLGevAZw8UCydTrN2Wrn5TiA7Ykk
 CL7cm10WaloOAAQE89hALOQaIkrO2lxPUNtN8C7E9PX9eONisbULicBvcGSJ3Or+zPFg
 mlQC4DAL6uOWFqquM6DSwEEKp04KcfKqnnGAHP36LPwc/CjjYvjuGZA98yAVzJebtvTM
 s04n2mJ/CY+8u/hbE36uwf6WC9MidefiPFZVkV95IKA7KRiWCArrcGD3/Vaxs0XTtXMx
 QhKK43dZFhuy52qrrv2yRIH89Ek6y3e06/tAdIh2+vdClFJgYBxBUS53htvKksc3tVWP
 veLg==
X-Gm-Message-State: AC+VfDyk5EXLFJw6+B7wqq+BKoWLxi+CDX+XN69CaVAQXLcCc7ev6hX2
 mnBCf+zYPRUoddOKIQquW9jilw==
X-Google-Smtp-Source: ACHHUZ6UhxL0cwM5v4fqHvBdAX30kYis4QoVXB5YTTun1COAKNUe2JAUivHflEC3HbRTuIBVK1oipw==
X-Received: by 2002:a5d:438c:0:b0:304:6963:561f with SMTP id
 i12-20020a5d438c000000b003046963561fmr1586298wrq.58.1682610861918; 
 Thu, 27 Apr 2023 08:54:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm24841577wmk.27.2023.04.27.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:54:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 76E891FFC6;
 Thu, 27 Apr 2023 16:45:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 17/18] docs/devel: mention the spacing requirement for QOM
Date: Thu, 27 Apr 2023 16:45:09 +0100
Message-Id: <20230427154510.1791273-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20230424092249.58552-18-alex.bennee@linaro.org>

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
index 5bc6f2f095..ac2ce42a2f 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -628,6 +628,43 @@ are still some caveats to beware of
 QEMU Specific Idioms
 ********************
 
+QEMU Object Model Declarations
+==============================
+
+The QEMU Object Model (QOM) provides a framework for handling objects
+in the base C language. The first declaration of a storage or class
+structure should always be the parent and leave a visual space between
+that declaration and the new code. It is also useful to separate
+backing for properties (options driven by the user) and internal state
+to make navigation easier.
+
+For a storage structure the first declaration should always be called
+"parent_obj" and for a class structure the first member should always
+be called "parent_class" as below:
+
+.. code-block:: c
+
+    struct MyDeviceState {
+        DeviceState parent_obj;
+
+        /* Properties */
+        int prop_a;
+        char *prop_b;
+        /* Other stuff */
+        int internal_state;
+    };
+
+    struct MyDeviceClass {
+        DeviceClass parent_class;
+
+        void (*new_fn1)(void);
+        bool (*new_fn2)(CPUState *);
+    };
+
+Note that there is no need to provide typedefs for QOM structures
+since these are generated automatically by the QOM declaration macros.
+See :ref:`qom` for more details.
+
 Error handling and reporting
 ============================
 
-- 
2.39.2


