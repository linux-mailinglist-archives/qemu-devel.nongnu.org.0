Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC66371DC0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:07:40 +0200 (CEST)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldc2l-0005ZV-MZ
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbr9-0002Eu-9k
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbr5-0003wg-NC
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:39 -0400
Received: by mail-wr1-x436.google.com with SMTP id h4so6286668wrt.12
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkpirsNiMlVmZd+09xTtwkgWmN3PKfelYRM6Pw/fjeM=;
 b=OOtOYgDirwGM2GuYc2u7QqN4aQCeuRvfZrNw2AARPtVhDAab07yTdQBihHIDqdJE1F
 dqwGRWuV65JNOfgLx+uqRJ6L+t++Aii1ogUoKm9+6C1Ott8b+rLpb48hB8sMi8jgli80
 1X0+t64FdbCKO3NEaiA5BudHeu6d7iohGiP6Tcn/OTNXAunkhGZlYV0mvqBQSI4fV+De
 2ODg4oL8SyOOOgaE2Q6mZwBr5+ZsLGieIyvAquUbe0Czl5IYaE+nGDik1STcy0CkELEp
 LpuFNqPWItWsQNPE5v8DjfGwJH5nzBLkwd3S9iLignXxQiM9XVelCgtzeP60f4+4ubpc
 ZeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkpirsNiMlVmZd+09xTtwkgWmN3PKfelYRM6Pw/fjeM=;
 b=ui3rABKzOwfAxWtpPnRdwooSkD1/fPFTGYt4dC9RLB8/Ausfv7lSLnP+EL8MprCp4F
 8JfKPtxGkmlzzdF7YgVkdUxd5FLBILMPBw00n67WgIHbL53sj9QMh9bsEIry0w++N6BB
 qXWA7gEv8irVAL+Ib6zxS8dGeF0ErzJfXuCEwo4hRZJqRGJrdif3Omk2EldPRLY0nmtS
 7fi8W/b3rjrC8qdZWzoiRQnrTZd0/LLBXyLTQAhfEQznYmH0TjmSbQUnuA5EhOnHklAV
 xJMevRoJI6Qr0WX/LdQpH9MRuy3lYU+pfxZT9JN4h5yL5Wqz7HQuredZOEaYzIDmfkrd
 AE3Q==
X-Gm-Message-State: AOAM531eRtk2/tRcix1wze835xsOAj8YTKeSbTzAcOq1mH8BauFFidMW
 GLZb/6OUUyr+IFG3/P9nz0Ftrxdwd9VEJg==
X-Google-Smtp-Source: ABdhPJzc8tfuTITPtWwgfUWPJ48A7BPdhOiESJV6ECTqYajr6qdVy/SxK7E5+RKFFym13bp3CStrdA==
X-Received: by 2002:adf:e70b:: with SMTP id c11mr1595433wrm.196.1620060929842; 
 Mon, 03 May 2021 09:55:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l12sm15282794wrq.36.2021.05.03.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 09:55:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] tests/qtest/rtc-test: Remove pointless NULL check
Date: Mon,  3 May 2021 17:55:24 +0100
Message-Id: <20210503165525.26221-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210503165525.26221-1-peter.maydell@linaro.org>
References: <20210503165525.26221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rtc-test.c we know that s is non-NULL because qtest_start()
will return a non-NULL value, and we assume this when we
pass s to qtest_irq_intercept_in(). So we can drop the
initial assignment of NULL and the "if (s)" condition at
the end of the function.

Fixes: Coverity CID 1432353
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/rtc-test.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/rtc-test.c b/tests/qtest/rtc-test.c
index 402ce2c6090..8126ab1bdb8 100644
--- a/tests/qtest/rtc-test.c
+++ b/tests/qtest/rtc-test.c
@@ -686,7 +686,7 @@ static void periodic_timer(void)
 
 int main(int argc, char **argv)
 {
-    QTestState *s = NULL;
+    QTestState *s;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -712,9 +712,7 @@ int main(int argc, char **argv)
 
     ret = g_test_run();
 
-    if (s) {
-        qtest_quit(s);
-    }
+    qtest_quit(s);
 
     return ret;
 }
-- 
2.20.1


