Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A424159E60D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:33:46 +0200 (CEST)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVuS-0002jW-MU
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn5-000219-S2
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:07 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn3-0000S4-1c
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a4so17459789wrq.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3FO/jNrx9K5o/CpczuXoS1BiQEzozSQlVpBn8zveOaU=;
 b=JaEAKh9hgkV7P+l9nLA+LKaX9fwfTS1CKHIaKJdC+TJGlDhYsurCnzEjISxtOOSHgb
 oaHsK29FlVu3xN0RNY4XsyA+Eh7STQpwwPci+mps/C34Yi1RTU8SNzRb019KZjgnaohn
 jjOzXBHWQbamLEVdKnHsFVQLRTnI/xTXmSsMLD+Xp+5YoaZdP9MviLn3k9G5lpf8Krv3
 EooDkHS00PnN4oYdt6abQSNUFI4FVpqZ1DRaBccTNFmKeaGJeQRHbgUvRThdgzutI4cI
 d4P59SiEWyn/uw9LfOY4IIVgZR+1FUAPSW4BzQhigJ8tkA6gwAQJOcRD6+AyruBwaW+4
 SKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3FO/jNrx9K5o/CpczuXoS1BiQEzozSQlVpBn8zveOaU=;
 b=X3CJQmMW+sia1k/CHnKLlIUVeqwYmd9TEg1hH5UZj5E1KPC1TYjkJ0RBkt9lhDUb0Y
 XoohaLGW2Cz9QZaXbSckkhSyG7Jgk/oswef41nECiCJqESMKh1UvuPiXyMRC2OlkXssA
 sP5RFSUYJjkOm7o+wzwd+T4ynef+87BQgZsLt+dHUYnRDfYRvuPttLLzkPL48KBruPgw
 2utzQ1sDpmBml5QwTQfL5g7jEM6gWFhyfg6EbTXrqpT1fYzqDFStiQoDz50SymRNizaO
 CC1w44xMxWmxE6pSW7twaz+j5ZU5QnPb8+HM8H7iBldoDJUi2yxJA2By1o7fhbkZmnB9
 9Hwg==
X-Gm-Message-State: ACgBeo2SZMt1pgcjnS+ifXoUOrT6TFDduZ2ixvzg1WmaImfk3+ea6VKd
 2zosBy/WdviBc2tOWf+rY41D/A==
X-Google-Smtp-Source: AA6agR5cDDVHkjIpQR1VDuElftxSNwO+zG+9Y7oX62uAwMa/VUaj3FGaAnnTdhPu+se4jPhl0lrLjQ==
X-Received: by 2002:a05:6000:1848:b0:225:586b:e64f with SMTP id
 c8-20020a056000184800b00225586be64fmr6369710wri.173.1661268362516; 
 Tue, 23 Aug 2022 08:26:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003a5c2abc412sm25634670wmp.44.2022.08.23.08.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 08:25:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A2E41FFB8;
 Tue, 23 Aug 2022 16:25:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 1/6] tests/avocado: push default timeout to QemuBaseTest
Date: Tue, 23 Aug 2022 16:25:53 +0100
Message-Id: <20220823152558.301624-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823152558.301624-1-alex.bennee@linaro.org>
References: <20220823152558.301624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

All of the QEMU tests eventually end up derrived from this class. Move
the default timeout from LinuxTest to ensure we catch them all. As 15
minutes is fairly excessive we drop the default down to 2 minutes
which is a more reasonable target for tests to aim for.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822165608.2980552-2-alex.bennee@linaro.org>

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ed4853c805..0efd2bd212 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -227,6 +227,10 @@ def exec_command_and_wait_for_pattern(test, command,
     _console_interaction(test, success_message, failure_message, command + '\r')
 
 class QemuBaseTest(avocado.Test):
+
+    # default timeout for all tests, can be overridden
+    timeout = 120
+
     def _get_unique_tag_val(self, tag_name):
         """
         Gets a tag value, if unique for a key
@@ -512,7 +516,6 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
     to start with than the more vanilla `QemuSystemTest` class.
     """
 
-    timeout = 900
     distro = None
     username = 'root'
     password = 'password'
-- 
2.30.2


