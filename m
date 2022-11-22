Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3988633927
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0r-0002Pk-B1; Tue, 22 Nov 2022 04:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0n-0002I8-FW
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0l-0003pN-Un
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso10869111wms.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7Z8ogQEbj/l37me+vKTddNiXN3s0GS1v0ETJ7AQqmA=;
 b=kJlfV3bYwBQANuoAQGOnacKLK4k4suvHaLcwV5Jc5ldyvnBa8R6ml0nBN67LKWQGps
 yswpNpj+xZOoGMKHcQrIhNhxGt7dcA9tCEFawPzBcOwTZmTbB4Q9rCpznpOI9tUu0MD5
 ZH6zGUr+kKrh8Zj5UgvVmkArwxT9jIjWbaK7Xv1xiN5wGCR0YmQbFhSNB6aE0IUTvSqK
 F9MVdV0UBnFTJA+QxQxGu7jHysVRzopdRp83dyIG4UIL0WBcJvbjUQs2tZBMrErDZcZx
 H4KLdDDqWcxWoJ45lVuZ3Psf3wpge0mBprDySMKT7rXZvWjjSyC5HQvoNNDTRTZfTaoC
 Vqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T7Z8ogQEbj/l37me+vKTddNiXN3s0GS1v0ETJ7AQqmA=;
 b=Nyf0B+1tR/3pSYtKu5eZzXp+ou3VSopb9E8uIofUS0/3oVy+UO9fS6vNMr74rjQ5Ep
 GDE7VdczgK9q6tN50tETE8h3ENhQT9fJs1ET2NsaWiFSD0q+Bq+dYPrrxSVu+5gzLu0B
 8mncR1dncSPJFlRJrozVRuRoVjJ5M9QhpwgnR/EcdoBS6rgqZE2mTwNqA/VdUd6T36XE
 Ox2EYx7BCGSAFcWHPb36W+XSWche31kXp8oV3McwRVsjRR/+ucOi1HZtiIy9vVJC2OTk
 Z7LZvnDt+8k+Hbl/sfi8nuVUczCFO1NeW2q+O2Sr3lPDNkKtefKDlEIHowuV0riAt9Ex
 Z9sw==
X-Gm-Message-State: ANoB5pm34vHOQu91Fcz6EBhu1kLzx09Na/491V4pz2bvZw7v9xrYmFhH
 Hlhx3UKNooBmcTf1oEtcbctUcQ==
X-Google-Smtp-Source: AA0mqf4JNECRGhK9+C6C0eRa+4fZAVAODYxOp+XFMTwA/ACW6jMeae4DfJsTEB1TBk/2NJYBVct5oQ==
X-Received: by 2002:a1c:f606:0:b0:3b4:bf6d:f9ba with SMTP id
 w6-20020a1cf606000000b003b4bf6df9bamr15458029wmc.133.1669110974634; 
 Tue, 22 Nov 2022 01:56:14 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a5d6281000000b0022ae0965a8asm13542984wru.24.2022.11.22.01.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 522A01FFC0;
 Tue, 22 Nov 2022 09:56:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 08/11] tests/avocado: Raise timeout for
 boot_linux.py:BootLinuxPPC64.test_pseries_tcg
Date: Tue, 22 Nov 2022 09:56:07 +0000
Message-Id: <20221122095610.3343175-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Message-Id: <20221117172532.538149-9-alex.bennee@linaro.org>

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 32adae6ff6..8c8a63ec2e 100644
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


