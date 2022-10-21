Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDE607420
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:32:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloOK-0003mj-7n
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:32:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmVI-0004XL-Jb
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUq-00045K-3i
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:12 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUm-0007wx-JS
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:11 -0400
Received: by mail-pf1-x430.google.com with SMTP id 204so1813457pfx.10
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdBm4FYSaXAEIMUKW2CPObVghOgHCVm2fbsMS+g8SJ4=;
 b=XCwPw1vONgUIgPdJFHb1fV5RB4ESJK6B0LUD8kfrGGg6owFSr5STWcbydzlDOBMlpn
 +yp5YAhVf1OGDMGufuZtbXqfR5ccqrDU96oXePbAb3KYpiOT9dE9AImJhmO7donHET+H
 6WU/HTGDJFAQFnR3BXz9sbu8ygXc4eFX3WdkEOhXZx54yiRbltgO2k5IMLZSz6QQkC9q
 ACiY+hzSEy02pIqqjofS3c67WydMSzTN/myAcnZR+wVc8uWA5DTQ8/I8faFG6kDgnuSv
 3b/wHa291mbw3jJNV6xg0d/kgWmVp9MyxUXAgwDceakpGDh8r43p95p7cFPEPQiaO1Il
 bdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KdBm4FYSaXAEIMUKW2CPObVghOgHCVm2fbsMS+g8SJ4=;
 b=44VEWy1BerOBfbYOH3a19SgwsJL2WA13k55eo43H0TZ4+wuIfYjfdLEV22MDl0gD/X
 iiNPe/juXe9lqje6gfhkpfTvFyeqVdjum5FUVulPpX99qh+gpfP/OzVCwGr9JbiPVsQ0
 YFcNlDwLqZvrXurkmWDuvZ40KH1KyMOZ7vj6yz42LL3tDJlEeJz+prADkBQykH5JrC04
 z05Xx9eL5Mbv0W+lLR0tzzlDu9z8UL3NznBCM9Vfsx69C9KUqdjb67jsAwwtzMejTcFa
 g9uxuXcPi/Ky4XfIcNNZEeV+l11MfNvXiMp3DG9vs7AY4ANow5ySDCtVuiJjLBSNe9ov
 9wug==
X-Gm-Message-State: ACrzQf3PmnGGwt4f7ZgP2Al8ntSJiLlSpSs79plKBgI+8zHzvMpN3LUT
 q1XzF75ESVmk8a5BmvQHEBES04Ab1fUi0V2Z
X-Google-Smtp-Source: AMsMyM532JZCziOf7um6YS6b+fx5Ndch9KBgTAns6KioDKnYOxAS6UjkhX2LzobpFSKSZwb4Jpf6AA==
X-Received: by 2002:aa7:888b:0:b0:563:aa1:adae with SMTP id
 z11-20020aa7888b000000b005630aa1adaemr17979801pfe.15.1666337463991; 
 Fri, 21 Oct 2022 00:31:03 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090a6d8900b002008d0e5cb5sm1042721pjk.47.2022.10.21.00.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:31:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 7/9] tests/tcg/s390x: Add long-double.c
Date: Fri, 21 Oct 2022 17:30:04 +1000
Message-Id: <20221021073006.2398819-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021073006.2398819-1-richard.henderson@linaro.org>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index c830313e67..627668e1ce 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -17,6 +17,7 @@ TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
+TESTS+=long-double
 
 Z14_TESTS=vfminmax
 vfminmax: LDFLAGS+=-lm
-- 
2.34.1


