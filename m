Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E025B8CF7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:28:23 +0200 (CEST)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVFO-00068Y-0S
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnu-0006TT-Nb
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUns-0002mU-1g
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:58 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r66-20020a1c4445000000b003b494ffc00bso3322688wma.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BknxQV6MVmcZavM1lYtAyUVlipzDOdv8QGgE/5Rl11s=;
 b=gtZ/owBgh3ZX1O7ANL2s02hFC1hn9P1vdsXMom2VKqPMewA55YiDx68MeTZ3W5LRa0
 IUhGls+C5nJtMmc1q/lN5OPvf3np1IsU4DbJTLnIjFKz2CWEP7gqMcEHmMwybes7g5fj
 0WqX85b9W0ZlM5v0uwpdVP8JRqa1EXNB8sojFLlieLXSP9pCqwxM8S/SVeqV45HPzC/+
 nbu7dY5KVH86kuwbug0suU4KtLs6024glfcAjgR5uI5+DqAIsCLr83iNNGIjklDXHwV7
 ihP4fgQmJ+BzqS1o5O6OGmg2h+5MY7Ndzb6u/lVrUNHbFXAGl/mnuGof0hPyqwDKXbK/
 lfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BknxQV6MVmcZavM1lYtAyUVlipzDOdv8QGgE/5Rl11s=;
 b=qpI9O6lbSXCIgtBo6EiQmHdmt2ujUSnjS5dbzFcoYTeTRztyhDYjcMCPaO+Tvy4rKd
 7qRkITHW95wSIDoLPXs02OmWapamLSYqLNE+d6m6u3Y3T6ohyoY5S9PG4RCj1qf3fi72
 TZX1rApNJ/SjAwXZZ8TloYmCnlJzu9yTzjvao8EaMrHiyhYTEh4tYa3nTMlpyj/wlyC+
 k8sF6vYIShOcyPKCl5MXQ0cPF/uyrmr6+gtmDdfq0fUYBoZDJQEggo1YUxZbn02ibvgv
 26ZfbAQSRb9e/kN2EVNhMF4KDUiLtvKkb7fqNt9sccF0aTyZmNEGa8VjExjiq2ken0Hf
 PSYw==
X-Gm-Message-State: ACgBeo38zvkYe6k6jJypM6X84GdhtB3zAmSfK9a+/0IdAA4z1cskfO2c
 tHZTD/KrnNV4oWFQ5Of+xEg8/w==
X-Google-Smtp-Source: AA6agR5fy5J24N7FaaLcfzBKPlzCaO7w2sQOiBxq706oiZpOihgCdhxqSaspMObDlZJAI1tUaaqPpw==
X-Received: by 2002:a05:600c:33a8:b0:3b4:874c:f48f with SMTP id
 o40-20020a05600c33a800b003b4874cf48fmr3518217wmp.131.1663171194650; 
 Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d4536000000b0022a293ab1e9sm14170600wra.11.2022.09.14.08.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C49021FFBD;
 Wed, 14 Sep 2022 16:59:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 05/30] tests/avocado: add explicit timeout for ppc64le TCG
 tests
Date: Wed, 14 Sep 2022 16:59:25 +0100
Message-Id: <20220914155950.804707-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

We don't want to rely on the soon to be reduced default time. These
tests are still slow for something we want to run in CI though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 4f07c27ac6..b7522ad3a1 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -115,6 +115,8 @@ class BootLinuxPPC64(LinuxTest):
     :avocado: tags=arch:ppc64
     """
 
+    timeout = 180
+
     def test_pseries_tcg(self):
         """
         :avocado: tags=machine:pseries
-- 
2.34.1


