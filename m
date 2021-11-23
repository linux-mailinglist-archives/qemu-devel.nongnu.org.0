Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA445AA44
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:43:23 +0100 (CET)
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZpC-0006Ba-6H
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:43:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkN-0004Sl-0S
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:23 -0500
Received: from [2a00:1450:4864:20::32a] (port=42933
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkL-00051A-Ge
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:22 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so3257536wmd.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HHuNKnhfo/1w0XhuBwX3/PDJWu35E1qSroF+d/Nu4gg=;
 b=FimBvJdcIMhGd7b1EaVa1vdJBrLU5iBS3jvMX3zJQq3+jut1z1Yv10PTbHieu5pwGM
 xJ5HaBQKwUTbO2S1v2ULqcnoRtbvGbeZqQcSDF4rppQMbu1aTxAMyq/P3WhkjoRXsijn
 iEY8B2KSaJ7b7Wb0J3MJzeIkY6TyXVrckDDGhXw2crKC3mjcqfH5B2gro9dxaZBWQ3Nv
 C5nOKWpBeT101OqJoY3ythmtxIWEBagcs+6QCsURjxw7mdOsW27gh7I8sIOYP/48IcYe
 31lxWInrxZWLuve5eYgeXzvB7Hs0CIieQAQPt5ruqKNJI/zFbwLBk8ZbFb0ss785oaVn
 X7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HHuNKnhfo/1w0XhuBwX3/PDJWu35E1qSroF+d/Nu4gg=;
 b=Hqr8o8T8xIgKDHjXkYKLoEqm8FjiRlbwHYuIh27UiO3ylbcUctDy54mWvdDBKhgRy6
 BZEnqceJDEAuxSAkiX6HLPjqifrnkvSk6r3ceaUnPfsIKdIOFZB2VXwWQwW2ZGZOeHZI
 lI+WJSAJ59EWvuB2z84hND9HWsaMlqBYciCGzDR4KI5M+i8wrMw/U6uY48pSFb/cI4oF
 rpbODrivZuuSQ6CHK7Txstr+gh8Ewn6VPt8RK6xU+TuX0K7tn2wL8AnG6ThXqD1/5/JR
 k+FTduqo1yoqrHr0g0l0bfODSJSpfkNo/dvZoMcLT1RcK30aSgNOdZi6TriOafpzNho8
 F/OA==
X-Gm-Message-State: AOAM532MgG3HAIyoKzPrvNg6iRLk6VtP0lyjcxxBYV9rgjOWp8euL4bo
 NAdEW3gYndVG/VlvtD3Vtic97lxt+Fh3SCXxgJM=
X-Google-Smtp-Source: ABdhPJxiKkNcVLYY82iMsdPZrTJPwX68iGECosA4kHcRpsYqwH+8luhmuebzAxyiShn/0GBeI2bwTA==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr5305484wmq.25.1637689099538; 
 Tue, 23 Nov 2021 09:38:19 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/16] bsd-user: Create special-errno.h
Date: Tue, 23 Nov 2021 18:37:54 +0100
Message-Id: <20211123173759.1383510-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the internal errno used by qemu internally its own
header file, for use by safe-syscall.S.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h    |  6 +++++-
 bsd-user/special-errno.h | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/special-errno.h

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 141e08456c..73cfa24b7f 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -151,6 +151,10 @@
 /* Internal errors: */
 #define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
 #define TARGET_ERESTART         255             /* Restart syscall */
-#define QEMU_ERESTARTSYS        TARGET_ERESTART
+
+#include "special-errno.h"
+
+_Static_assert(TARGET_ERESTART == QEMU_ERESTARTSYS,
+               "TARGET_ERESTART and QEMU_ERESTARTSYS expected to match");
 
 #endif /* !  _ERRNO_DEFS_H_ */
diff --git a/bsd-user/special-errno.h b/bsd-user/special-errno.h
new file mode 100644
index 0000000000..03599d9b5a
--- /dev/null
+++ b/bsd-user/special-errno.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * QEMU internal errno values for implementing user-only POSIX.
+ *
+ *  Copyright (c) 2021 Linaro, Ltd.
+ */
+
+#ifndef SPECIAL_ERRNO_H
+#define SPECIAL_ERRNO_H
+
+/*
+ * All of these are QEMU internal, not visible to the guest.
+ * They should be chosen so as to not overlap with any host
+ * or guest errno.
+ */
+
+/*
+ * This is returned when a system call should be restarted, to tell the
+ * main loop that it should wind the guest PC backwards so it will
+ * re-execute the syscall after handling any pending signals.
+ */
+#define QEMU_ERESTARTSYS  255
+
+#endif /* SPECIAL_ERRNO_H */
-- 
2.25.1


