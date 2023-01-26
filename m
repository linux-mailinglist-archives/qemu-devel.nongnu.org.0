Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233367C3E1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:40:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2e-0000HP-PM; Wed, 25 Jan 2023 23:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2X-0000H3-18
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:09 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2V-0004Rg-Fw
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:08 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so756996pjl.0
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=DRk6XXyztC0i8zM1NC8JU0QlibApXebR0Xvz2JS2Z62Ch95pvxhxtkxJWUe9ykvzro
 KHhaKHjz5aXe0cmQqJ64+j2o1rbASsS086cYkWAKQJK8OoIeaJkpGDPKCaRaXvYEa42d
 s+3aLvQ3oJyyIAXbeAqDFPD/026GS58Le3W2YjKtr6VLnYr6ZNKF5l9POtlAUg8EZq3d
 v4ug8uFHOj6BsFIeRdATlinQt+X0Sy+kHS+lhA8LYZEappLj+h5a4Mew4ehgg7muiwrr
 0GqREtGMJN+2SY8BSe9nw/N3/oD2AqCIW02uuyCwsVleB2g4ytOsQXddwVo0slyLKxEi
 aiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=agjusueq45T2O6wImamFQr1sjzxQ10HtIj+GwonbJHEHa0S6LAgoTZWZMGvk2BB/At
 JX/Q4sb5PusomFf8FVoiCac+jGVJWnP1hXljuyRJtRRJdZ9R5ycqa9yfZ80XfPmerPsG
 oS0fhzCeHlCrCSwHDtqjH1oIGVdaDlKNJiIGsN/GzT5aNMAS7C3txEozBh3IDGY90XkS
 H1yqHPjAL7W+NeVmlUcepU7ROKO8fk2GhCgyjr8N5SUzx/UX35v4Qe2RmA4JSkRhjLmo
 vGL7jAEEYY6oQwwm+YFGjxN+tJgkYITdoHGWmMAh9h3MPIi3MMNwgMNfFxis8n/h8zOc
 /nuQ==
X-Gm-Message-State: AFqh2krd/slLFFmaRTKpVcxTUL1yvzRJx8w91AT8JfpbFA4tCktY0pvv
 Tbfu4nSafG5Hn3VYwNDGdnMkI+bjQiUc8dezXXQ=
X-Google-Smtp-Source: AMrXdXu1PuwkYeYlLAi5dB574aQc2FYJZa5N1iaHlwhFoTMor8T1Q05nV8YugeTvURI/buTPuc1VtQ==
X-Received: by 2002:a17:90b:3143:b0:22b:b6b0:7889 with SMTP id
 ip3-20020a17090b314300b0022bb6b07889mr21150978pjb.15.1674707943423; 
 Wed, 25 Jan 2023 20:39:03 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 23/36] tests/tcg/s390x: Add long-double.c
Date: Wed, 25 Jan 2023 18:38:11 -1000
Message-Id: <20230126043824.54819-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/long-double.c   | 24 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/long-double.c

diff --git a/tests/tcg/s390x/long-double.c b/tests/tcg/s390x/long-double.c
new file mode 100644
index 0000000000..757a6262fd
--- /dev/null
+++ b/tests/tcg/s390x/long-double.c
@@ -0,0 +1,24 @@
+/*
+ * Perform some basic arithmetic with long double, as a sanity check.
+ * With small integral numbers, we can cross-check with integers.
+ */
+
+#include <assert.h>
+
+int main()
+{
+    int i, j;
+
+    for (i = 1; i < 5; i++) {
+        for (j = 1; j < 5; j++) {
+            long double la = (long double)i + j;
+            long double lm = (long double)i * j;
+            long double ls = (long double)i - j;
+
+            assert(la == i + j);
+            assert(lm == i * j);
+            assert(ls == i - j);
+        }
+    }
+    return 0;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 79250f31dd..1d454270c0 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -26,6 +26,7 @@ TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=div
 TESTS+=clst
+TESTS+=long-double
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1


