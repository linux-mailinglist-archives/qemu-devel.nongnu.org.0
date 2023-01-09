Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B382F66346F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF12T-00058X-MD; Mon, 09 Jan 2023 17:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12Q-00051R-4W
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:42 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12N-0007jm-Pd
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:41 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso80472wmb.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmsiOvblx944I2vPr/ngo2q8F1qd2s6a6mFL2ICxK8U=;
 b=zBOlBtqPleDHf0VdO+y+cAIUshMH5wpIxsHdQ1/8Ysxewl1rpAxa0IohtYijfMmaFw
 40lem8oQt0rbRt/u2PfxdcX4BcBBwHjzc+wxi3ZRb9IsSaLQo/xy79kali1Dz6fL+ZQ2
 hHz8RwTTfKtBo/Tx9734tp7U+oNJCzbf8oStlbk6YwLz/dHpvKD5mAVLxCvkJ4GZ0N8K
 J5GdZjwR+HXN+tQXNgFjYi5gad0a4O2rHEWnotR8WsqfCrIrYmwryxDbYttxM2Jt/sNY
 B/0NZ2z+4RxUMOuGB4mEXhgTKJyKtzuV/FkJutV8BuwExV6ehmXhuhxJKMJyUExeWOPx
 69BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zmsiOvblx944I2vPr/ngo2q8F1qd2s6a6mFL2ICxK8U=;
 b=pEwmIVELwcwbF3VbHDWl0eNfTNcWu0XfvHrbSkOZ9xPuy9cEvh0CQHlzn57jRRP/1x
 yep/E25EEa2gzmWQU7r/LlXoImv3z/Z5P6OhcbY6xkTzSdoZSCmBtPQxhC+ZSBmA7nL3
 4UKhYXdO2HIuFbPl4f/QGQ8h4EO/IpeQrGQM5P/3cs/NjpVnysAX2DkrYY4x3T2AM28K
 1/eJW/PLpOTWWFs56t9q0BMuvZZqBkQdBj7USljqH/77aj524eMbd4Rnm+jQrtYtDTzq
 4Omq4Hp0KUq8CWMyCFhmor8k1D2H4HxiR+cIKPPvJvfOr7mAq0KzAOdpMIRIEMNPMrBq
 JueQ==
X-Gm-Message-State: AFqh2kpxzgxbt9fG/x+eJ7+jf8grRRUs1z/q4MgDwJV/JE23SzvlnWuu
 LUQCWgl93g02JvnsGFPZC7+KxXCRVaDLMRDT
X-Google-Smtp-Source: AMrXdXsRlLkZ/9H9ds1U559l3BgFirCYACmlt9POcIPyTcDQV0jWonAf/J5tZ2lcZSmbU/CpDqRsgg==
X-Received: by 2002:a05:600c:348b:b0:3d2:2a72:2577 with SMTP id
 a11-20020a05600c348b00b003d22a722577mr46677666wmq.27.1673304878167; 
 Mon, 09 Jan 2023 14:54:38 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b003d9ed49ee2bsm7266879wms.1.2023.01.09.14.54.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 14:54:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [RFC PATCH 3/4] util: Introduce helpers to compare QEMU versions
Date: Mon,  9 Jan 2023 23:54:18 +0100
Message-Id: <20230109225419.22621-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109225419.22621-1-philmd@linaro.org>
References: <20230109225419.22621-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add qemu_version_delta() to compare 2 QEMU versions,
and qemu_version_delta_current() to compare with the
current QEMU version.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/qemu-version.h | 36 ++++++++++++++++++++++++++++++++++++
 util/meson.build            |  1 +
 util/qemu-version.c         | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 include/qemu/qemu-version.h
 create mode 100644 util/qemu-version.c

diff --git a/include/qemu/qemu-version.h b/include/qemu/qemu-version.h
new file mode 100644
index 0000000000..c9274bfaf0
--- /dev/null
+++ b/include/qemu/qemu-version.h
@@ -0,0 +1,36 @@
+/*
+ * Utility function around QEMU release version
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_UTIL_VERSION_H
+#define QEMU_UTIL_VERSION_H
+
+/**
+ * qemu_version_delta - Return delta between two release versions ('A' and 'B').
+ * @version_major_a: Version 'A' major number
+ * @version_minor_a: Version 'A' minor number
+ * @version_major_b: Version 'B' major number
+ * @version_minor_b: Version 'B' minor number
+ *
+ * Returns a negative number is returned if 'A' is older than 'B', or positive
+ * if 'A' is newer than 'B'. The number represents the number of minor versions.
+ */
+int qemu_version_delta(unsigned version_major_a, unsigned version_minor_a,
+                       unsigned version_major_b, unsigned version_minor_b);
+
+/**
+ * qemu_version_delta_current - Return delta with current QEMU release version.
+ * @version_major: The major version
+ * @version_minor: The minor version
+ *
+ * Returns the number of minor versions between the current released
+ * version and the requested $major.$minor. A negative number is returned
+ * for older versions and positive for newer.
+ */
+int qemu_version_delta_current(unsigned version_major, unsigned version_minor);
+
+#endif
diff --git a/util/meson.build b/util/meson.build
index d8d109ff84..655debeec1 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -58,6 +58,7 @@ util_ss.add(files('yank.c'))
 util_ss.add(files('int128.c'))
 util_ss.add(files('memalign.c'))
 util_ss.add(files('interval-tree.c'))
+util_ss.add(files('qemu-version.c'))
 
 if have_user
   util_ss.add(files('selfmap.c'))
diff --git a/util/qemu-version.c b/util/qemu-version.c
new file mode 100644
index 0000000000..d409a6e574
--- /dev/null
+++ b/util/qemu-version.c
@@ -0,0 +1,37 @@
+/*
+ * Utility function around QEMU release version
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/qemu-version.h"
+#include "config-host.h"
+
+#define QEMU_FIRST_MAJOR_VERSION_SUPPORTED 4
+#define QEMU_MINOR_VERSIONS_PER_MAJOR 3
+
+int qemu_version_delta(unsigned version_major_a, unsigned version_minor_a,
+                       unsigned version_major_b, unsigned version_minor_b)
+{
+    int delta;
+
+    assert(version_major_a >= QEMU_FIRST_MAJOR_VERSION_SUPPORTED);
+    assert(version_major_b >= QEMU_FIRST_MAJOR_VERSION_SUPPORTED);
+    assert(version_minor_a < QEMU_MINOR_VERSIONS_PER_MAJOR);
+    assert(version_minor_b < QEMU_MINOR_VERSIONS_PER_MAJOR);
+
+    delta = version_major_b - version_major_a;
+    delta *= QEMU_MINOR_VERSIONS_PER_MAJOR;
+    delta += version_minor_b - version_minor_a;
+
+    return delta;
+}
+
+int qemu_version_delta_current(unsigned version_major, unsigned version_minor)
+{
+    return qemu_version_delta(QEMU_VERSION_MAJOR, QEMU_VERSION_MINOR,
+                              version_major, version_minor);
+}
-- 
2.38.1


