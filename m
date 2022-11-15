Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34E629ABB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouw6r-0006wM-29; Tue, 15 Nov 2022 08:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5a-0006Jp-5m
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:59 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5Y-0004Ll-Nn
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:57 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a14so24304161wru.5
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8ejrVwLiLoS+pUm7oqY+yG/9wMKF0S3iW/Yln0D5sU=;
 b=H4fvM+jcpWaWe9EgIc/A338bMvcnlB4oVKZiUfcP8quCr1xxVVUm8bQecjECRuMu2I
 U9rvqH8owCzhHlL8//nz9zXogsj8adbT6l8y3OA62RpPuKCqZATkF/W4cgZsl0DAZPtf
 ay4kXBvpdMA+Gtiae2BnnjnsgAoXuZE+UWQRv2hQ84E4GtCpw3QlYeHDDMVGlv/khP7p
 d7uYtegpvu42aAFa6sQD1SyH1rZrBzj5t4TSxc8rPlEkaTke3BLiJktAe6a2RifN8SYR
 eYvjLRIFk1CuITJZpw26aol0ums9kRtck+UPICOidMh0WfLPtUekfokshS7ZXHi+Xjpb
 MfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8ejrVwLiLoS+pUm7oqY+yG/9wMKF0S3iW/Yln0D5sU=;
 b=FNtBJeSwrjC/MAC1WhvtEX7hksoTZPWWaAQekf5YUbxxgLfRJJC6iHsv394E2Sc/vf
 ZXvooXdzZFB5ZxlG1sbHq/mxfx1oIL5XBFveV4Dt/ViMjmKCEsXZCFVMIEdTt2xEViKD
 9S/uG6/2AmkhGfz63w6Y4tOaxEEGUhO9ztcW1pUTkoxy84xegrxqXSqjZBiXKqXaFswv
 hDuCrgZCxtXWfrDDOkZzY4i0fTCEy6G4vM8fGOIsXUrNW7zV1JTTUpJNCht+aTesNi6B
 CwxrX63UjbpEa0EIfuVVPF69FF7/CJlNZ7xNP2iF+9OTLlj03I1ONek1929aupvrtwCh
 nAyg==
X-Gm-Message-State: ANoB5plxQI6o5Lk0DOFfN5rh4CrD8wDSXMC3Mb2mEIkJv6wwyPq/dzZq
 t022DEWpctg+vza5aAeLjY/UVw==
X-Google-Smtp-Source: AA0mqf6Oj5Scr7ZFq1D1a9oUP6YFMSNbIk0KY5HDj2TlLsRudxg9mnRoVWhSykG14H+U3wUPJwZWRA==
X-Received: by 2002:a5d:6289:0:b0:236:ea8:a410 with SMTP id
 k9-20020a5d6289000000b002360ea8a410mr10256026wru.128.1668519294796; 
 Tue, 15 Nov 2022 05:34:54 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d452d000000b0022cbf4cda62sm14865421wra.27.2022.11.15.05.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:34:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2A4871FFC1;
 Tue, 15 Nov 2022 13:34:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 09/10] tests/avocado: Raise timeout for
 boot_linux.py:BootLinuxPPC64.test_pseries_tcg
Date: Tue, 15 Nov 2022 13:34:38 +0000
Message-Id: <20221115133439.2348929-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133439.2348929-1-alex.bennee@linaro.org>
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

On my machine, a debug build of QEMU takes about 260 seconds to
complete this test, so with the current timeout value of 180 seconds
it always times out.  Double the timeout value to 360 so the test
definitely has enough time to complete.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221110142901.3832318-1-peter.maydell@linaro.org>
Message-Id: <20221111145529.4020801-11-alex.bennee@linaro.org>

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 571d33882a..2be4be395d 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -116,7 +116,7 @@ class BootLinuxPPC64(LinuxTest):
     :avocado: tags=arch:ppc64
     """
 
-    timeout = 180
+    timeout = 360
 
     def test_pseries_tcg(self):
         """
-- 
2.34.1


