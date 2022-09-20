Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E35BEF65
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:51:11 +0200 (CEST)
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oal94-0008S1-FG
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqd-0000XK-LQ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:51 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqc-0000hT-4N
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:51 -0400
Received: by mail-ej1-x634.google.com with SMTP id a26so7832587ejc.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ntf0o1o0k0Fp9R/q3eJsmYoFAtSQvEDfr5nhtPjCG70=;
 b=F61/0cH47oOYiz0WiDXe1afjzPCi1PPLPtc3NFwA241fM9B8cDJ8abFQpmYp1Mi83L
 iFVvehZ6gKouskgxxZ7JnYi9Zlm6LEbSZUsl5CnMuiLlsV+IUE+Dqc+CcIVcleIJOsRo
 6rYrewdL+7I5TpLIOK7Wg2Khs1PSI16YFqd7EQjAOHVHBXq+H7VlegcJlnns1PTkDG7j
 djqOPdtej55/ZRDzPWbfx4yVesPsaGLwYz7T36zsOeK9h45vRl7QrIfKssLxsk2rYE2n
 tdpTTmQ5mtRf72QqhBsiAcKzOWYTctaA2chCsGjeBfcMIbOGNsqdTgZgiLUCfA3BqiL1
 Hiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ntf0o1o0k0Fp9R/q3eJsmYoFAtSQvEDfr5nhtPjCG70=;
 b=DgCGNSQo6C3OIyTYfPcNXpM75fi+MA1JOloBgPvClXh+DMpWuGtro1HoM3pPvYnSh5
 9WTY1N9Mi6qd3MFP1Y5jE/rWTUN4TDQAJs1Rz+Cz/xcrrIfGPtKtb39aif787skssAc2
 rY6hpvhouiNgL+rh8jA416AEypTMqz3lJKCeo+uEJBVfLHKAJlDSbb+JtiNyy5mJKObi
 flhUu05kUv2tnp4gGbCesM2kKdWcioGZVrH5GdsbjW6b/2r7bZKOndmFEoCPotlFLEgu
 TPy1fOAWkgmReO1hR/90tiKYDpsz95HB4td5Du9E2Zyi4spJKcYri5T7pYrLp+X97+9+
 JZ1g==
X-Gm-Message-State: ACrzQf2jd/ZHv64bcUAy15Ca3g5uxhwrLmxefUFUefqdS5QnSA1wF9Ww
 wOUhwZdZe6T1ou1+e1WKs3KOsA==
X-Google-Smtp-Source: AMsMyM5BEwDEKB51AVFlryY31gStD1xNqu8DSd6vqzmSp0ntOw1WSlAc3HKYih8zZ+BvLts4TguLiQ==
X-Received: by 2002:a17:907:6096:b0:780:c085:21b4 with SMTP id
 ht22-20020a170907609600b00780c08521b4mr14402388ejc.293.1663694148034; 
 Tue, 20 Sep 2022 10:15:48 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a056402414e00b0043bea0a48d0sm214524eda.22.2022.09.20.10.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 332051FFBD;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 05/30] tests/avocado: add explicit timeout for ppc64le TCG tests
Date: Tue, 20 Sep 2022 18:15:08 +0100
Message-Id: <20220920171533.1098094-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't want to rely on the soon to be reduced default time. These
tests are still slow for something we want to run in CI though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-6-alex.bennee@linaro.org>

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


