Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4E68AB41
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUE-0005D5-LX; Sat, 04 Feb 2023 11:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUA-0005CN-Th
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:54 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLU9-0002XU-Dj
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:54 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 o16-20020a17090ad25000b00230759a8c06so4651111pjw.2
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=rm3G0MUjs7FLL+eTsQjQ+Mcgv+mf+P81Q0I0Har2OqbTAOnFAqdA6Y8etT+L0FWATv
 V1WMxOb2UYvrxMyqRy0aB4YlCEW2xte/VBNAmYNSJFcQp5ok9/mR+9F3YM2vCst0vPdN
 KhiNgP7NSrHEpK19tXnoTJqANPSkjPE934OCpr7qPTA2+89d5DC8dg8EZzq7/+4ybAFs
 9ST3f+9eiEb++cHr9uP6xhZxMfB57q6hq6SrYk5S5gdCnfO27iW5CsEPauwzXo1IbPOV
 oh7Y2tr6cfD1kVZjG/0SO71QcZCtSlIIr5796dRcFJd1TSdbP/0e6EqaGlWjb7JSsM/Q
 2o6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=m88evoljxkg42gNDgaKslVXpa9i+9kqhG/SquGi7zOUY7hvkzc78InqrQF2EeZ+5o4
 P4/PxK213r0V5cTT24ouOx87wG69tF9exFMOgWS/TcmWkP8o6td/GTvC3MFlIDxTW0le
 izTKlW5fGRjJvupx5Btyr+zxhJVTHy467knamgbBZsPblhbkvaxeyz9TZLsTc0L3+Cpf
 MfjhClBWAU17mAZleHAXP92BW6ikbea6umm0Lkbk3/KUO07elS9ief3C/5Y5v4mW5hrw
 vNdAz3LGQpPGUhYf1NbiNl9qRC5uQoORvjfhciqbATpdWou01/xArbQkS48liDxe6tlN
 e6sg==
X-Gm-Message-State: AO0yUKWVhWnZaB3CU6Odv8vVyXeD3ccvWgFzO56STXVuML6NyJk2KAZI
 +6UBY9Qjfvd57NCJTS4xcN1Oq5ggqz4eLgOr
X-Google-Smtp-Source: AK7set9SWrvmkpERmmsW7sYpI8tN8yJqQy+jSwA4OKdqKQ/nwG5nA3bjMIaJ6hXES4N3yJzC7iR/DA==
X-Received: by 2002:a17:902:e2cb:b0:198:68b1:6255 with SMTP id
 l11-20020a170902e2cb00b0019868b16255mr12084106plc.56.1675528432614; 
 Sat, 04 Feb 2023 08:33:52 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 25/40] tests/tcg/s390x: Add long-double.c
Date: Sat,  4 Feb 2023 06:32:55 -1000
Message-Id: <20230204163310.815536-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


