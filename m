Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56636F548E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:23:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8hK-0000tT-1P; Wed, 03 May 2023 05:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8h6-0000KD-AF
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8h4-00066J-CV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso1658608f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105755; x=1685697755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaX2dnRzYU8iVo190OC5WZA7wUtx7L7d4Pkiir1d0ZY=;
 b=XOc9HK8R5MqW10eJ+nQ7NSFIUMMtVR8U/kVTDVZVYMdj0fky20OujG0aEKFOi+vE5a
 ucaSkYgR1SqNIyd5ftxWnilOdLeogJirg4aSBXEApV1IZK2lgQatJKjDtTDaQbaOJj7E
 K2RxHFWaizT9Ko2uBKaSwvCM1B+B/3lO+VV0T9ySvhhcJWAl62cK48iP+EjgsQBS/B7Q
 maQKpecbivW2TpPe77TobSPCwLBbNBdhCf5KX9C/zKfLa1Non58K/OKYSXXOBoA0KG/U
 PfZRJ4cRHmEXI7MKjL0NHtTNn3mOBoiMMnklfX7bGsp3wE2gybPGx+Q3i73IX6Msj33E
 KxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105755; x=1685697755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaX2dnRzYU8iVo190OC5WZA7wUtx7L7d4Pkiir1d0ZY=;
 b=aJD+sx7hfsUqCeB5XV6qRbDpizU+JUu2KA78RR23RHSkDspOoTfNhwflIeWYdPtEME
 Vnoxwr5ECdyUeKiL0qnx7psTLa4l0sxBxQ8rn3sFSXTYq8gK7fwFwYTcSFnYS7AOQM4k
 hIW0vLm1BIvUI3WbD6V70aS4oN72fUg36t3fiZMySsEUL3nd5VJtphUFVJaS3DpUlIvI
 Vi5jOhQOvVzi4KudWXR2fwkV7ZooON17EB6wnWZmwSnkDd37ela5xtNhQMPfDZTW7cj/
 DYYc52rbGspJobh/N5ekayZBJQ8D3DwAJMxZNFA3ta3cJ7Z6Ri78C6pMPitG/YSJifx1
 kvcA==
X-Gm-Message-State: AC+VfDy+UnOt7UMSPAXPz82iHluU6MDbGUXzSPnaTLg7GVO2oPOJx/J1
 5r1yGuoW69kXV4GYnPnHTs6xVQ==
X-Google-Smtp-Source: ACHHUZ68Tw1hJFrUnzXO/+cT34WqjFRTI7GRV0Ziq/lIcQ7B4xC1jUwTGG91dWKisSiNVsF7aPDgUg==
X-Received: by 2002:a5d:4841:0:b0:2fa:ce3:9a0 with SMTP id
 n1-20020a5d4841000000b002fa0ce309a0mr13532921wrs.36.1683105754032; 
 Wed, 03 May 2023 02:22:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5186000000b003062b57ffd1sm8684068wrv.50.2023.05.03.02.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:22:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47F8E1FFCD;
 Wed,  3 May 2023 10:12:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 22/22] tests/qtest: skip bcm2835-test if no raspi3b model
Date: Wed,  3 May 2023 10:12:44 +0100
Message-Id: <20230503091244.1450613-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We can't assume the machine exists and should gracefully skip the test
if we haven't built the model. This is ostensibly fixed by
db2237c459 (tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI)
but I still hit it during my tests. Other qtests seem to use this
pattern to gracefully skip stuff.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/bcm2835-dma-test.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
index 8293d822b9..2e6245e9e2 100644
--- a/tests/qtest/bcm2835-dma-test.c
+++ b/tests/qtest/bcm2835-dma-test.c
@@ -107,12 +107,11 @@ static void bcm2835_dma_test_interrupts(void)
 
 int main(int argc, char **argv)
 {
-    int ret;
     g_test_init(&argc, &argv, NULL);
-    qtest_add_func("/bcm2835/dma/test_interrupts",
+    if (qtest_has_machine("raspi3b")) {
+        qtest_add_func("/bcm2835/dma/test_interrupts",
                    bcm2835_dma_test_interrupts);
-    qtest_start("-machine raspi3b");
-    ret = g_test_run();
-    qtest_end();
-    return ret;
+        qtest_start("-machine raspi3b");
+    }
+    return g_test_run();
 }
-- 
2.39.2


