Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA394AE281
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:14:25 +0100 (CET)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWsa-00069a-TH
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:14:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWnX-00032E-83
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:13 -0500
Received: from [2a00:1450:4864:20::435] (port=47095
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWnT-00066b-4b
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id q7so277640wrc.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 12:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kvt1TfUvKKE2DWl3Q8+xXwyGqPqxYFhXR1/NgDzzilg=;
 b=XfRZ9eXJkcIeBR4roww+GdKRs5Wx0H8FCzovdbN4IBRtDg++jFP8cohPRxipRFiZKI
 C16EA+jC2vf7w4Ni7SxcahAf4p+1gwkM6AfhQ9eG4j/uWMeLtX+LEy1y35eB//so+DlN
 gxxt7rLqGPSmIjhMHq4MXBbN1wPtK3y4f4/H8J8okFTuPwwN5uiktuP/jYCR0iwJFXAl
 qPp8j+S55YH1jBrvn10093G3bRO76gh80svjTixvj/1WoQ2Mjv8iUrRLQIfedI2GBMvh
 4PCdk1w+dJjtvDJ+4GoSH5qaqXNiwiE6flie3uq1l7PxnKZkaxB3hsSJCn4TkXs3+kq+
 HhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kvt1TfUvKKE2DWl3Q8+xXwyGqPqxYFhXR1/NgDzzilg=;
 b=wxK6QqzjBtrXjuYUUe8dNY3+72tRxGf/YWCjkOo/7zdwoDiSg3TsoF19NwA25Uk1WX
 ymjNKeNSWQQBoKt2GFEgMFcYC0eifv7IwIT2Q01S6xYB2t5eLxN2yjPLvM2BbQUpPqPf
 TMReZ1jYpTToz02diFsm1FJTntsE5uP/76sqftMSzFevYp8bh+3wHxynIAEDwpIxuzkD
 xRUoIlz/xMB1XK2EvugM26OZ6zcnWbYehrLnkOSVEyIlaP/srH2bX8ujeciswWClbcEj
 tj0dDegPAiAtk1j3+4k195dwZeyEQeiFxqABOGaG8Q/YMwr57SArz0c2ch+O+pfnYK72
 dOCA==
X-Gm-Message-State: AOAM531uIA0VmUWncVXCcY10l9MKgI7hxSmkXzKpmozVlo7T41VjiPgs
 BYwz38MjwZIqhy12FKzAyA8my3sMfYZzpw==
X-Google-Smtp-Source: ABdhPJzqVtiLyNewVE+KTcsiieTn1BKuxzlmaZNpfnrxnMlQOzSi7N1D56kFPZenZMCE/bVOVlIYQA==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr4784644wri.432.1644350939909; 
 Tue, 08 Feb 2022 12:08:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r2sm4098170wmq.24.2022.02.08.12.08.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 12:08:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] include: Move qemu_mprotect_*() to new qemu/mprotect.h
Date: Tue,  8 Feb 2022 20:08:53 +0000
Message-Id: <20220208200856.3558249-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208200856.3558249-1-peter.maydell@linaro.org>
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_mprotect_*() family of functions are used in very few files;
move them from osdep.h to a new qemu/mprotect.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/mprotect.h | 14 ++++++++++++++
 include/qemu/osdep.h    |  4 ----
 tcg/region.c            |  1 +
 util/osdep.c            |  1 +
 4 files changed, 16 insertions(+), 4 deletions(-)
 create mode 100644 include/qemu/mprotect.h

diff --git a/include/qemu/mprotect.h b/include/qemu/mprotect.h
new file mode 100644
index 00000000000..1e83d1433ee
--- /dev/null
+++ b/include/qemu/mprotect.h
@@ -0,0 +1,14 @@
+/*
+ * QEMU mprotect functions
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_MPROTECT_H
+#define QEMU_MPROTECT_H
+
+int qemu_mprotect_rw(void *addr, size_t size);
+int qemu_mprotect_rwx(void *addr, size_t size);
+int qemu_mprotect_none(void *addr, size_t size);
+
+#endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index cb74f4571a3..2a52933ce0e 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -496,10 +496,6 @@ void sigaction_invoke(struct sigaction *action,
                       struct qemu_signalfd_siginfo *info);
 #endif
 
-int qemu_mprotect_rw(void *addr, size_t size);
-int qemu_mprotect_rwx(void *addr, size_t size);
-int qemu_mprotect_none(void *addr, size_t size);
-
 /*
  * Don't introduce new usage of this function, prefer the following
  * qemu_open/qemu_create that take an "Error **errp"
diff --git a/tcg/region.c b/tcg/region.c
index c46021d1604..7b4e65a52e8 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/madvise.h"
+#include "qemu/mprotect.h"
 #include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
diff --git a/util/osdep.c b/util/osdep.c
index 1999f42f6fc..72b678ca2e3 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -38,6 +38,7 @@ extern int madvise(char *, size_t, int);
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/madvise.h"
+#include "qemu/mprotect.h"
 #include "monitor/monitor.h"
 
 static bool fips_enabled = false;
-- 
2.25.1


