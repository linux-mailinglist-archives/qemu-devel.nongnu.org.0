Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F96737DD
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITft-0008Ga-U1; Thu, 19 Jan 2023 07:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITfe-0008Bw-G1
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:30 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITfd-00027P-0n
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:05:30 -0500
Received: by mail-wm1-x331.google.com with SMTP id m15so1332205wms.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mXk15ZOpBngQ/BM3gBJ3bVRucyb9HQyhmQ07oK+jYw=;
 b=NYIx5GkAo5jo5ye7V/OdvKk4rdqwukueqESJbIPRQvhpD4fBM6gQN2oCVX88rgHsxc
 +NUvzIepTa4rNUmj0uPCdIuNj1fy5s1DotiFpLXIhYRJzxVdqFQu4CYqDVDSdcsdlalc
 9mMsP7ZZuej1ac5rxQwjQ2EPvJe3rjyeRE1bxwTtMUxYo59CpOOv1f0/kolDLJZrvTc9
 MxVmciEGHULjm1Xk3hYgFOpRaGPdAaq+NJLnUKEJE7ohAaqMV7kQTV/avUyb1JBztp0B
 ylRCX2hM7ti+05GP7ohSK4QV918AJ7/E95GAB+WAdXBzqpu3Nq0EdviKhQrLGQbq6w0M
 e+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mXk15ZOpBngQ/BM3gBJ3bVRucyb9HQyhmQ07oK+jYw=;
 b=ERti8+obpj3TL2sUa10TgxYoAqlbpM3CqfmnhqsKaf94wpRwjZnH1e1Hcs7m2+R2JY
 2yyY9eQie6FE+FwHpxFQIicxXP5rbo0+JH4bK6oUt4tbE+GD5nZVBiatBUMMxcbmjNb3
 ifq2Yyb0e3wNx0cJ4Nycf+UPLESXm8KQADbPAEAjIMTvxy7vFArQNUBNuxrpD1FXUboW
 eO+faZCcQ564M/eg6xBVMaeA886R/TWZtmUI1xvNDhBuC8NHothN4iw2YFHcKxQAm+r/
 Ea7G3iU8Jcpavcd4XVNmZKwgkVYZSoR90nfzQnA932jO2FIUv9kI+JYPV+Mr0Vy2Syjp
 4FuA==
X-Gm-Message-State: AFqh2krA1pLa8pPOFZmCuLgV58TJnyQDRW2TCqckbbQXC9i8Troi2qM6
 MO+TwsykOPFglKhP7pWrdIWz8nJH2TVMriQ2
X-Google-Smtp-Source: AMrXdXs/TvAu9yjz0B7/wBFWu0QOl7nGCpWgQupE/x0bwiJDnnEw86QITq46/uFcuD9EVmvT4yNdrA==
X-Received: by 2002:a05:600c:601c:b0:3d3:4f56:62e1 with SMTP id
 az28-20020a05600c601c00b003d34f5662e1mr10009277wmb.27.1674129926304; 
 Thu, 19 Jan 2023 04:05:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003dafcd9b750sm4915266wmq.43.2023.01.19.04.05.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 04:05:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] tests/qtest/vnc-display-test: Use the 'none' machine
Date: Thu, 19 Jan 2023 13:05:13 +0100
Message-Id: <20230119120514.28778-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119120514.28778-1-philmd@linaro.org>
References: <20230119120514.28778-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

If we don't specify any machine, an architecture default
might be picked. But some architectures don't provide any
default, such ARM:

  $ make check-qtest-aarch64
  ...
  19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
  qemu-system-aarch64: No machine specified, and there is no default

Since we don't need any particular machine to run this VNC
test, use the 'none' machine.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/vnc-display-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
index fd63e3a881..df468c7b22 100644
--- a/tests/qtest/vnc-display-test.c
+++ b/tests/qtest/vnc-display-test.c
@@ -44,7 +44,7 @@ test_setup(Test *test)
 #else
     int pair[2];
 
-    test->qts = qtest_init("-vnc none -name vnc-test");
+    test->qts = qtest_init("-M none -vnc none -name vnc-test");
 
     g_assert_cmpint(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
 
-- 
2.38.1


