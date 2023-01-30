Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22FF681D61
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1r-0002Al-5g; Mon, 30 Jan 2023 16:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1p-000261-06
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:29 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1n-0005hE-F4
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:28 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so17013105pjq.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=nkRcKBizYWr7pZj704yvIPTpPH7mEmKDQJbirFw5RP9L57RbTjybxy3n9rkxOUeo3b
 OWfEt9y1ERpB7Z7hyN4GionlmpWtCfpXkk8t+y03TN53hE9plvY1ppZlLspUeUVY53J0
 ezHT+9I/vL4Il4hd3FTKQ3BEKqQr+HO2xYodO+LRIvE6/VoWBCdG6VBZYG539kM1ljm0
 pE7LxyfaihPlx9k2OK2HK8YSRuOB41ceLFsANFcMJvdQHvmtC81a5Q70f5o64OrMpSWO
 a2jX++VampLyOQlpVlbMVwmd486mxTucFuij6CylDV5DtSXPwDACVw7vPZBn5M1JKaFR
 h1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=35B2r/BmJ2oNnTqnJqoUDnC1OM+kyv3v7xgHq2J335bac1hmsmaYMWWCtOxOSvfMtj
 30nVB9fkbA8Osht8Jd+YcvtRcFkh/sCN3oSFuFETfbNdyO2FoMc3T54IY6NF8wsXZoud
 pluffs51pVI+OsLltOQDjg4rp2pQ+EM7cSMn7O7LgJyREUwmQDhJuX9FIecp5Z88SGUs
 mscWyIJowRcm0i0IJkASzA5xgJZ1Lj5VO0+IPhhkeohPmuM9o+scsBrxHoUC5/tN0Wj6
 1lYt9xEDWeMc74GONEhEBGHMl82LqHzR7axTCQMbPBlAOjYRpWhMPspZ3i5Bd9Uui8g8
 5rhQ==
X-Gm-Message-State: AO0yUKWko8b2vuGmj0w+b58jH/EixuMOKZhcKO2HqaixWcFy22lpktSu
 zjfvoYe5WEKHh8QTLO7A4G/mnS0l10Q5FdSQ
X-Google-Smtp-Source: AK7set9z/WkfYGBBZCgkILBdSuOdOpefEiKjC6gr4w0KSZ8M8FSbN0M9UMGLo8iI9+WXQhp3de2mkw==
X-Received: by 2002:a17:90b:4c42:b0:22c:9c7e:a95d with SMTP id
 np2-20020a17090b4c4200b0022c9c7ea95dmr6098003pjb.30.1675115365790; 
 Mon, 30 Jan 2023 13:49:25 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v6 23/36] tests/tcg/s390x: Add long-double.c
Date: Mon, 30 Jan 2023 11:48:31 -1000
Message-Id: <20230130214844.1158612-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


