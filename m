Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5D6AF782
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZekv-0001km-Ae; Tue, 07 Mar 2023 16:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZekl-0001ce-Mc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:47 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZeki-000820-HV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:21:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso22015wmo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAHamumlI5FrlTCElRi1QUFk7plXdP35MVHkqDIF1rs=;
 b=jtAqhpDVLxVwXmgxHiNgjACbFNQwA0VKq7q4LtYsM3CQGFB0RIEqC8louk8VQhlyXm
 S57+zn22ER38VBA9XxZMhWqBIii6KakOK7NsGxg+tj30PskI5QLATji+EE2xl0LpFxvM
 +2ndV8EKW17ImTi+uZM7KAJJbmns7xckvgd+pWKT7rX7g/sC54C3g51fvu1JcuZtAgwi
 KdkU92Acyfb03eXRBWxmPAY+KMfZ2OIJ1TDyn/RDC1dw8/9O6su53CevqBt+Rlcwods6
 CDhqqH5v+GXfvxMKQXka+5DceY6sIkHfGyrHDWS1gPzYW+MGWzkp1CTJoFfks+FL1PIi
 WrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAHamumlI5FrlTCElRi1QUFk7plXdP35MVHkqDIF1rs=;
 b=l/roLWwdskr46fdUxw3xCFYID4mqSWoYaJKPpYghckYjWs8f2X1Tg9IK4KV/pnAzw1
 BGWhb+EAaIq+X0KgxdcPhmc1Vr5hEGhSOT5pb7aHSGr/xa4w2+rFm/1YdZj17q/nb0p3
 fXXbyEHI4mFVVxDVgl3LRMHCQ/ieiXXgrLvTgmpKzyZ1Pzd+WL5FAuB+EsYD7xKl8wan
 +Yo8xdmLXVYakGo6rPE/ct9+lqDOOWr8+hiSEEw864BNkEHWPzDmsxW++q5wUsTqVmYi
 q8gcZg7YIPjVfikl4ZqN0V0WEOhXObIcklH4nBhvBU9dsKJTK7d0C1wKvggL1hkOhj+C
 aEBg==
X-Gm-Message-State: AO0yUKUa8iggZE+pQaAYgr5rv0Sv3bLC07EeaN8vmFveHX9mJMgBS2Gc
 sVuY2tULYRDLPIA7zaLJ/SJ9uA==
X-Google-Smtp-Source: AK7set9f1fa1Wi8M0ABeRGgzvAkuGKmRn1+ScoIR2GQyiCuRbbkX5EUgSXriGRaiS7TVIYkE2hPpqg==
X-Received: by 2002:a05:600c:4f92:b0:3ea:f6c4:5f28 with SMTP id
 n18-20020a05600c4f9200b003eaf6c45f28mr14115651wmq.36.1678224103124; 
 Tue, 07 Mar 2023 13:21:43 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b003e11f280b8bsm18956062wmq.44.2023.03.07.13.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:21:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2610A1FFC0;
 Tue,  7 Mar 2023 21:21:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/30] gdbstub: move fromhex/tohex routines to internals
Date: Tue,  7 Mar 2023 21:21:17 +0000
Message-Id: <20230307212139.883112-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

These will be needed from multiple places in the code. They are
declared as inline so move to the header and fix up to modern coding
style.

The only other place that messes with hex stuff at the moment is the
URI handling in utils but that would be more code churn so leave for
now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-9-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-9-richard.henderson@linaro.org>

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 32daaf73a3..b4620f99c4 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -57,6 +57,33 @@ typedef struct GDBState {
     int supported_sstep_flags;
 } GDBState;
 
+
+/*
+ * Inline utility function, convert from int to hex and back
+ */
+
+static inline int fromhex(int v)
+{
+    if (v >= '0' && v <= '9') {
+        return v - '0';
+    } else if (v >= 'A' && v <= 'F') {
+        return v - 'A' + 10;
+    } else if (v >= 'a' && v <= 'f') {
+        return v - 'a' + 10;
+    } else {
+        return 0;
+    }
+}
+
+static inline int tohex(int v)
+{
+    if (v < 10) {
+        return v + '0';
+    } else {
+        return v - 10 + 'a';
+    }
+}
+
 /*
  * Break/Watch point support - there is an implementation for softmmu
  * and user mode.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index abb1777e73..ba46ed73b3 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -546,26 +546,6 @@ static void put_buffer(const uint8_t *buf, int len)
 #endif
 }
 
-static inline int fromhex(int v)
-{
-    if (v >= '0' && v <= '9')
-        return v - '0';
-    else if (v >= 'A' && v <= 'F')
-        return v - 'A' + 10;
-    else if (v >= 'a' && v <= 'f')
-        return v - 'a' + 10;
-    else
-        return 0;
-}
-
-static inline int tohex(int v)
-{
-    if (v < 10)
-        return v + '0';
-    else
-        return v - 10 + 'a';
-}
-
 /* writes 2*len+1 bytes in buf */
 static void memtohex(GString *buf, const uint8_t *mem, int len)
 {
-- 
2.39.2


