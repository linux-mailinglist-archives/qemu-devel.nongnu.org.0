Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CFE6EC8D1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:26:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQA-0007wi-CP; Mon, 24 Apr 2023 05:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPo-0007Oa-1h
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPT-0004pG-Hg
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:18 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso2557679f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328178; x=1684920178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ymh1KmF1OssFCV8CswQJao0hOIMo+XbhaPHzwGuiKz8=;
 b=uT+ZCJ1wEBDq7TmrZeZGhrgzO26xURh4c4nX6qGOo4OqKvHcIRxN+uKvYt6GurNkY8
 gTC/l1D9NqP1QiKRx97y1emjAxohpMKe6Tyxv3m9DZ8tSREn7E1Hnnw2I+ARAcUPUnuK
 yDpAZoScYIIZAvWqj5ojfm+j245QGQTxHUegNhZ6cP3ogh5Qbp1ZTlXe/j9zZlsDB1w1
 7BjVDcBB3/9OzVxmhAYRLzN6zdrQzq5InrZpQ3pli0T2p+Xlo29WGW1DY8lJOIszhKzO
 BS1wgS1TsA9W9W6GeGL6ZNks18KfC2dZqGt6NXEcgGHAOlVd3hfOA2bFLOqJxubaAvAJ
 vxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328178; x=1684920178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ymh1KmF1OssFCV8CswQJao0hOIMo+XbhaPHzwGuiKz8=;
 b=S2/tSE9om5veBkexl8FWi4rGPs57zhXp4y3JUWDLsTk2hPg4gsfLcUrff4Y6gnJO/h
 5N8a5FLolxc+a8LqzBZpQnG+NpDYPPmjgrSsATw+Gt4aPC54xJkJrn1DgLehvkjrn3H5
 pVRMHN/nFkSFqaFL+L45wxBHP4hYEbspBqd5PdybWGYE5NHfWHh6inUF6rP4sXcWtiIe
 o/ejLJOqDGPWoHLW22PhLMzIHXYnCNP4Jk9pb7uCt6LZ0pJWyYl7SO21h+wU0ddgw3pU
 SR+cjMBnjA2wKQuzLDURz9QATjjFtLveB3K86ubGLsBujpqDdnl6ShVpS6RHixD60v4n
 9DmA==
X-Gm-Message-State: AAQBX9eTE8GkRmhHsPEdWHu6bWOph/L6O7DjBnwciXn7JMjq+3bqxnZ7
 OUrjI3+P/UiZJipvw5DrRJa0kA==
X-Google-Smtp-Source: AKy350anfhPe4x0DtWvXLd5zofs4N+YTUOEZbYDTE0pdkuCd86lZIDl/6l6HTMFp3yTgXJzMVrH73w==
X-Received: by 2002:a05:6000:8e:b0:304:6d32:d589 with SMTP id
 m14-20020a056000008e00b003046d32d589mr3845013wrx.18.1682328178209; 
 Mon, 24 Apr 2023 02:22:58 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfee46000000b002f0442a2d3asm10372906wro.48.2023.04.24.02.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F1B41FFC7;
 Mon, 24 Apr 2023 10:22:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 17/18] docs/devel: mention the spacing requirement for QOM
Date: Mon, 24 Apr 2023 10:22:48 +0100
Message-Id: <20230424092249.58552-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230420155723.1711048-9-alex.bennee@linaro.org>

---
vppr:
  - use Mark's formulation, briefly mention property separation.
---
 docs/devel/qom.rst   |  2 ++
 docs/devel/style.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

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
index 5bc6f2f095..e9fce0fc69 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -628,6 +628,46 @@ are still some caveats to beware of
 QEMU Specific Idioms
 ********************
 
+QEMU Object Model Declarations
+==============================
+
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


