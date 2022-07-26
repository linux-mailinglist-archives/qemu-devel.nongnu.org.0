Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F04581A73
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:47:15 +0200 (CEST)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQWR-00069D-2D
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQGE-0006bv-0e
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQGC-0003dw-3F
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id bn9so10600628wrb.9
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P5Luishia3JsScTlemeh/OGK//MTXXlEPATJORqsFXk=;
 b=FJ0ozNSOgJ0610Goj99oH33uSlU2wu+o4mLZ6/mlIt/TQErfghJnvEi+Ni24CkcKbj
 sSt5PTn7rguP1jcg/zoKI2xEw48p4KlaHYrzna+YTW1tomW5xlmEidBXoH9OtdG20UFZ
 gKLpWPan0Erl2sAwJ8pTUzWqhKaZUMJKWflXthbAl7IwksYmlw7A8ZjKBuBGJRwSieQo
 i3cz8E17pVgsFyh9fhvPc1OcZ6IO074GVyVHlQDINcSckP/Qa1nSjOOoamy+B1P8+V4f
 Ci6lM/shr8i3LkUA5qt7oQ0FBsd/Uoh+6tR9K0riHODkEhosLDBqX82e/2e1NI3sBMkK
 ebBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P5Luishia3JsScTlemeh/OGK//MTXXlEPATJORqsFXk=;
 b=bk9g7dkK8/MZN0IBY53rhrAsxa9Qu5ZKHKWq6XwwAA4HA0CrFt5px6NVn/AuLkDc1i
 ygtxpveXaPMa4GIQSzckCXCK+okXpxFQUA25oKYWg1MCMH1bA+6Jt2XrV5nd7GbBlAky
 wI77pdEhnBEXilSlF+bA9roxT4C7kra4UybXg+Vst7QHc6OMIM25VXOzjoFJloWH89UF
 D425Z4M7g6vHXhw/Lx2RhXGyIomUlriU/LZIckHebkkRFwIpFtGLGrDv0CXGRFsbDbtL
 RT88ywTmIY2m9CxK+YkDcZSMW35EkX3AV5uhNZ3klh9UNzijFLJWNrDgMbbP81UexOl9
 N4BQ==
X-Gm-Message-State: AJIora+EI7mwdafe7X2Uezktziv8mHOCakLFj8zHqnlzyS+YLUtfvTC9
 vTM8DdfywKYXcezE2BHmWWTH6g==
X-Google-Smtp-Source: AGRyM1shrKDYirTGWOqBEIDMkwAs8zF4wRV1kqspTfiYPqxbU/fzUZTQ5TIfIGwGDFWOXfmA40KiHA==
X-Received: by 2002:a5d:5086:0:b0:21e:4eea:eea with SMTP id
 a6-20020a5d5086000000b0021e4eea0eeamr11444818wrt.47.1658863822781; 
 Tue, 26 Jul 2022 12:30:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c2ca700b003a3253b706esm18044920wmc.34.2022.07.26.12.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:30:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83A4B1FFC6;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 14/21] tests/qtest: add a timeout for
 subprocess_run_one_test
Date: Tue, 26 Jul 2022 20:21:43 +0100
Message-Id: <20220726192150.2435175-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hangs have been observed in the tests and currently we don't timeout
if a subprocess hangs. Rectify that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - expand timeout to 180 at Thomas' suggestion
---
 tests/qtest/qos-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 7e1c8fc579..ac23def284 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -185,7 +185,7 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0,
+    g_test_trap_subprocess(path, 180 * G_USEC_PER_SEC,
                            G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
 }
-- 
2.30.2


