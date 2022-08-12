Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A4759106E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:59:47 +0200 (CEST)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTKM-0007xG-JA
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6d-0000N9-GX
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6b-0002PE-VW
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:35 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so3744027wmq.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 04:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=hx6m0atusoWvzRNWFznpkTkf4+f5YmcU6tdYnA1e2kg=;
 b=YaYiAJysx/aIbyKBivNUJQYnMNZhIYobX9mhLZIybIx0HUnr9TQYi52iI/ElJO+hDI
 6eqktvGCpEUhOdsDQa6jJxAAlzrHbUGL9cfejnZC//L+5e7BiQGaQ//R4OPDLmT9VEhq
 yxsGt1ugkWmqAc7MT1I69KV7C7vkviFqpoO2mt7Un0W5oC0QkTc4kd+9y/F5hv5HwsWV
 ejUBlPPXePdvlw+TLyqFCMmeW0Z8wU3h6SuZOdgElKqKBCsJ3zXgVGyifbu5S/FkV5N0
 yKdHx0BZT7TJBz/rt54yaRN1ygMbLbKB4BkCUHXL0v63ffTYD6IUAs+j8eEv0FqIZ0UJ
 A3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=hx6m0atusoWvzRNWFznpkTkf4+f5YmcU6tdYnA1e2kg=;
 b=FlPAAqOt70tY92GRtfv4jV7mdhkvPypHgN5IZ86v1gaUhBmSTc8Mka3+PXXVZIPp+7
 pa+z+d1xud+zrmfDutKmjLt318q2AQpKlUVKKG31rkRGNavKa1nETo1Ge6HxnGUQvoz6
 ELOEe02MiuG4pfsbsy8jeUGFiOTLjyjD47nbJSpREFbjbhR2dGdFiEeWBAhvyKE6LWYa
 R1q4mNQfb3WWoObJltpvsg/vTXF2CLM2fbK2TV98CSHpZd+f+DGwZxXnFTciNxi6VFfL
 Mio7zkjPIc3+gHplASnphDiu1BFThZTphUnjWCMf8eQYbo6EpRatD4OtPmSDEmMBN5y+
 i8wA==
X-Gm-Message-State: ACgBeo1O0XbXwvXxrf5XyS4lhDBnyYKQdEBlEyvvl0W4yj9LhZHnfaKF
 tTmxCpYgO0biMXZpAI0P4+lywCzxHW0uZQ==
X-Google-Smtp-Source: AA6agR6O9N1BxlhC7NERAXsEm9Mj4sHrlGD1K5pi8fRTtAW0OrHidiejzNQUOvEde/uJlGVrh/O5Eg==
X-Received: by 2002:a05:600c:3d11:b0:3a5:cd9b:eb08 with SMTP id
 bh17-20020a05600c3d1100b003a5cd9beb08mr1593320wmb.82.1660304732707; 
 Fri, 12 Aug 2022 04:45:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b003a5418245b9sm11257797wms.19.2022.08.12.04.45.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 04:45:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] tests/unit: fix a -Wformat-truncation warning
Date: Fri, 12 Aug 2022 12:45:25 +0100
Message-Id: <20220812114527.1336370-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812114527.1336370-1-peter.maydell@linaro.org>
References: <20220812114527.1336370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../tests/test-qobject-input-visitor.c: In function ‘test_visitor_in_list’:
../tests/test-qobject-input-visitor.c:454:49: warning: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
  454 |         snprintf(string, sizeof(string), "string%d", i);
      |                                                 ^~
../tests/test-qobject-input-visitor.c:454:42: note: directive argument in the range [0, 2147483606]
  454 |         snprintf(string, sizeof(string), "string%d", i);
      |                                          ^~~~~~~~~~
../tests/test-qobject-input-visitor.c:454:9: note: ‘snprintf’ output between 8 and 17 bytes into a destination of size 12
  454 |         snprintf(string, sizeof(string), "string%d", i);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Rather than trying to be clever, since this is called 3 times during
tests, let's simply use g_strdup_printf().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20220810121513.1356081-1-marcandre.lureau@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: fixed commit message typos]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/unit/test-qobject-input-visitor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index 14329dabcfe..5f614afdbf1 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -447,9 +447,8 @@ static void test_visitor_in_list(TestInputVisitorData *data,
     g_assert(head != NULL);
 
     for (i = 0, item = head; item; item = item->next, i++) {
-        char string[12];
+        g_autofree char *string = g_strdup_printf("string%d", i);
 
-        snprintf(string, sizeof(string), "string%d", i);
         g_assert_cmpstr(item->value->string, ==, string);
         g_assert_cmpint(item->value->integer, ==, 42 + i);
     }
-- 
2.25.1


