Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF33587AC7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:33:19 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpDB-0003jS-Sz
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohN-00055Y-D4
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIohI-0006Oa-Iw
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:00:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id bv3so3283905wrb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 03:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=c6gCqIJw8yCV7CUCpwJSaqkLGHMke2sDpgsD4kivFT0=;
 b=z6InKbnXMEFjzUDcE1l2HPIZfCAminWu0mPvyhTzaP+hTtpI4yJiBGyXfyRIGcEZcC
 9IVlu3nXdNK9OlLdqpcPSqup7dxDAHtiXd5T9giGZA49a2Nqs6cxodsv/fP5/gly2BW5
 +Q+5aUbvpyA21aHHyDPBSW9+HCSToixsRbNxNmUtmchz/mkEjCN4maTyQvDb4L4ZJB1/
 cyU8VyrImvciokmcdWwq85HMDPy+WwQtwkTxqSXMQrdJ606SxcSpcTfDMy0GOLB2QGRS
 G3s20jd7gYjLwaAR8AYL8khzLzuLavEDY+kAjsxWd32stOc7GTvigwd3bX67JWpDHbdK
 8Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=c6gCqIJw8yCV7CUCpwJSaqkLGHMke2sDpgsD4kivFT0=;
 b=n0DgQ7HZaJMJQks2t+64k/z8tCUZiDH4opUmQdVb0J3WbILzx1C0Gh/Fe18FYBBaeU
 mpJTjjl8qLgf8L45wpMrx0Ut/N5PgJVqIiDnTXMlm8oG+UdXfLbVpFR78ZK52uzTXnWc
 0LFl+jI0m2rnxkM2r9tcntuc1EMd+aM5HDKvJh7ZL0AxHL2X9w1gMmnUWLukN6qW2fXy
 Qnw4m+tCoLX/YwQGUXeUud/FpU+WateacUo642fm/6jfKFzHJ+mGcPfxu1hv07rcuNcr
 0f0mN4pDiP5s0GOau8hh/hO9uuZJobjU0UxdjpefqNb2S82+KmuUw/ivkHUe9n/nUdrn
 dXWQ==
X-Gm-Message-State: ACgBeo0b8U5NYpIwQia5q0eJ/dvs5F9Xjp0AfXONTi9f6SePMRjPuB7R
 gBJ+MBOUYkBmBtfZBZGFWVrqug==
X-Google-Smtp-Source: AA6agR4MnUMGJlqpj5YowPI4nBvMfeu56k66slxoAjGVVJATj1uhl4k68tqfv1riBZpMVP0BA4S4AA==
X-Received: by 2002:a05:6000:178d:b0:21d:a453:b7c6 with SMTP id
 e13-20020a056000178d00b0021da453b7c6mr13635813wrg.275.1659434419258; 
 Tue, 02 Aug 2022 03:00:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a5d6292000000b0021ec32d130asm14765519wru.74.2022.08.02.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 03:00:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 143F91FFC7;
 Tue,  2 Aug 2022 10:50:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 15/22] tests/qtest: add a timeout for
 subprocess_run_one_test
Date: Tue,  2 Aug 2022 10:50:03 +0100
Message-Id: <20220802095010.3330793-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>

---
v3
  - expand timeout to 180 at Thomas' suggestion
v4
  - fix merge conflict with earlier patch
---
 tests/qtest/qos-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 01a9393399..d958ef4be3 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -185,7 +185,7 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0,
+    g_test_trap_subprocess(path, 180 * G_USEC_PER_SEC,
                            G_TEST_SUBPROCESS_INHERIT_STDOUT |
                            G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
-- 
2.30.2


