Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9FA4AF461
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:47:43 +0100 (CET)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoFy-0004a7-5e
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:47:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlk-0002zk-6b
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:29 -0500
Received: from [2a00:1450:4864:20::632] (port=42528
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlJ-0007qU-6t
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:07 -0500
Received: by mail-ej1-x632.google.com with SMTP id m4so7691050ejb.9
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5fBV+KIdUFmQ3pIeT1jmWEUfUNk8eoCOUO8KAhKTuwg=;
 b=mL/dGOpslCk9qJ6OJyn3Oaq+aM9QDuTnCLY0oe/Mg4Vg9hThnzSAIgryLmOdbslld9
 wBfqfhHqlQIzut8mrKJ43+J+MfN3385Nvl9CRbdE96AE5Ecpwl7VXik3VUNroA3vzqvq
 jWw5QUpJHnusRlXq18xdNBglGjCuYlOJ0nVTOyHzK6yvtJzx2cb3zwqjnmNa4iIzOfu/
 agxz2ufFQUU718TtvuA+bXsGgkTZSs9UVSXdw8Ourk8QZqmzZ7z+9fyF2GQ98lQWFSnx
 PXj3hWFC51CyksaVlPiMP3anwf22tycI4uUM+gCalzLCUQxhLQzHZy6i0AJxX/K4j2Wv
 UJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5fBV+KIdUFmQ3pIeT1jmWEUfUNk8eoCOUO8KAhKTuwg=;
 b=0J0XjgWsJWPolmGhkRNmrorAW7TMNqdNaxMPqFBZWuXm+dUFJdP7upNVE2XnT0Stq7
 1p922IoZoh8bQLc+qAULlRilWa1EdVBc3QsXif4QPtXX7WRrvYZhvvWub4IxnfE5DupS
 U/PBZMf/+8oPihAHEWdfl3J8xjDHlw9n8y+Kdqu7v4yq6SEnPuODTpc4l5sYkOuM/y+y
 iYg05/voxF1QAIUxqBHJBX1hWgSApHR6GZuNcZaMvwjYHFMT/5B3rh3eh6rSJbCO401+
 S+OvQGUP35K6h/Z4SP3uFdBd6f9N7KJcEJO/RuNYcUxj4f0JiBrSZNMxw5yPjrPOEmMf
 crVw==
X-Gm-Message-State: AOAM531x1jvg5MjibSk3kfIKqxGtbhY+KHL1bdvLS+GNqVbf5myXyRU4
 8yLmyhPmBdshhuoPc8lG44beFA==
X-Google-Smtp-Source: ABdhPJzfktW+qn8UX5m1A/aoZSoMkl2C0FLt+rWZic7eIJ+YDzSebUu7p6Pxi0+aJFD3Plyi02aOJQ==
X-Received: by 2002:a17:906:5d16:: with SMTP id
 g22mr2153820ejt.753.1644416134023; 
 Wed, 09 Feb 2022 06:15:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g2sm8311159edt.44.2022.02.09.06.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73FE01FFBA;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/28] tests/qtest: enable more vhost-user tests by default
Date: Wed,  9 Feb 2022 14:15:03 +0000
Message-Id: <20220209141529.3418384-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If this starts causing failures again we should probably fix that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220204204335.1689602-3-alex.bennee@linaro.org>

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3d6337fb5c..2a4568cd7d 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -995,20 +995,17 @@ static void register_vhost_user_test(void)
                  "virtio-net",
                  test_migrate, &opts);
 
-    /* keeps failing on build-system since Aug 15 2017 */
-    if (getenv("QTEST_VHOST_USER_FIXME")) {
-        opts.before = vhost_user_test_setup_reconnect;
-        qos_add_test("vhost-user/reconnect", "virtio-net",
-                     test_reconnect, &opts);
+    opts.before = vhost_user_test_setup_reconnect;
+    qos_add_test("vhost-user/reconnect", "virtio-net",
+                 test_reconnect, &opts);
 
-        opts.before = vhost_user_test_setup_connect_fail;
-        qos_add_test("vhost-user/connect-fail", "virtio-net",
-                     test_vhost_user_started, &opts);
+    opts.before = vhost_user_test_setup_connect_fail;
+    qos_add_test("vhost-user/connect-fail", "virtio-net",
+                 test_vhost_user_started, &opts);
 
-        opts.before = vhost_user_test_setup_flags_mismatch;
-        qos_add_test("vhost-user/flags-mismatch", "virtio-net",
-                     test_vhost_user_started, &opts);
-    }
+    opts.before = vhost_user_test_setup_flags_mismatch;
+    qos_add_test("vhost-user/flags-mismatch", "virtio-net",
+                 test_vhost_user_started, &opts);
 
     opts.before = vhost_user_test_setup_multiqueue;
     opts.edge.extra_device_opts = "mq=on";
-- 
2.30.2


