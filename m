Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5B663479
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:56:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF12W-0005Is-Vb; Mon, 09 Jan 2023 17:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12U-0005Eh-Lb
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:46 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12S-0007j9-7h
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:46 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso5509072wmq.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xA2zJhQFDWndGaehXTKSbGgxfQUNaxn1ECLWbGBrK7I=;
 b=ZiWawKgdap3V5zfR9jF6GYBvUIOaaNpcUKjMu0EgoEgehQ7RnKMffxlDsQHXnIuJEt
 Aau+SlfpAipUv5lqgt+GFGfogYu3dYt8IkjLseUWaWJXhfpHZaMVQcGAlgvb4BMszdfl
 T1eDCNDUWq/yH1YFc+c14ypDaPyxgRYI3Dk2G8TOPoGobQQb3v6L2/vhyVv3v1vftWhj
 vVRoXEklPmz8MN7UiYgZgC/MFkzCKv6Erz061b0BwZvxf6t9YOp8xfQkQnukiIyfuORK
 brvG7uD46HxxmgN/Re+E0jwL35sXxrejEoU2Bb5f+GaoBZo96wl0nDKz+eoSvW6Qz6ha
 /HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xA2zJhQFDWndGaehXTKSbGgxfQUNaxn1ECLWbGBrK7I=;
 b=rnhdtZHePjzz42dl1oz2NuUT5RSTVMJQVKXuNlfPFEUDXgdGhj3pS/nuR4TdoP1ml6
 loaxmSMrUoYaeVE6XfTkchtvZh6Ce8rxme9ACdhJHSRYgoJzVTKhY3r92oXtMEUhWorh
 OUgaOBhhPoT5hwepqbo4LMwTKm4XxRwirKrZvq05mV+bFVYuS5ClbFuyDeo+SCF6bZ/B
 kT/xDjsgIcXXrBhwyZLRe3X9q0gqUm+BPMFNefQ4WR1dES8yby8m4DZUohTMjErJIctz
 L7m+IuBf6Pj5k6oF2k9Iih0odi/RN7C+EnkITrbkRTY9MpSkisd3tO4wS5zcVMgjm2EO
 kQcg==
X-Gm-Message-State: AFqh2krYyGIhKlATtEs11qlindrw8H2P11HO88TqxMDjVuS9DrrYrGRi
 RYw0aRsYjpAy+S3yi7hN1VVtOPk4VlM9b8ZP
X-Google-Smtp-Source: AMrXdXu8SMmg22G2XydIBvjetIYSm+D+KPKmr0kRjceSZsQRqxmZmxzkM64qJRkWiZP6OCEIwlioyA==
X-Received: by 2002:a1c:4c0e:0:b0:3d9:f836:3728 with SMTP id
 z14-20020a1c4c0e000000b003d9f8363728mr219439wmf.11.1673304883369; 
 Mon, 09 Jan 2023 14:54:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b003cf71b1f66csm14602830wms.0.2023.01.09.14.54.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 14:54:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [RFC PATCH 4/4] qom: Warn when deprecated class property can be
 removed
Date: Mon,  9 Jan 2023 23:54:19 +0100
Message-Id: <20230109225419.22621-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109225419.22621-1-philmd@linaro.org>
References: <20230109225419.22621-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Per docs/system/deprecated.rst, a deprecated feature can be
removed after 2 releases. Since we commit when a class property
is deprecated, we can warn when the deprecation period is over.

See also commit ef1f5b0a96 ("docs: clarify deprecation schedule").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qom/object.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/qom/object.c b/qom/object.c
index 05b97cd424..cb829f1e44 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -17,6 +17,7 @@
 #include "qom/object_interfaces.h"
 #include "qemu/cutils.h"
 #include "qemu/memalign.h"
+#include "qemu/qemu-version.h"
 #include "qapi/visitor.h"
 #include "qapi/string-input-visitor.h"
 #include "qapi/string-output-visitor.h"
@@ -1300,6 +1301,12 @@ void object_class_property_deprecate(ObjectClass *klass,
     ObjectProperty *prop = object_class_property_find(klass, name);
 
     assert(prop);
+    if (qemu_version_delta_current(version_major, version_minor) <= 2) {
+        warn_report_once("Property '%s.%s' has been deprecated in release"
+                         " v%u.%u and can be removed.",
+                         object_class_get_name(klass), name,
+                         version_major, version_minor);
+    }
     prop->deprecation_reason = reason;
 }
 
-- 
2.38.1


