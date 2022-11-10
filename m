Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B8C624453
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 15:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot8YJ-0006tU-7E; Thu, 10 Nov 2022 09:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot8YF-0006t7-GE
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:29:07 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot8YE-0007Qt-14
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 09:29:07 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l14so2523607wrw.2
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KeBF/SYc9WD7Nty/WAMvMpKYbJLTLdB2z2IFJY2Cf10=;
 b=yhfxHROesogbtskTyi5qMZbRp8/5UKVU3Lf5Uf3+JS/JI4BQ14kncMpSYpWqyRBrNG
 3KZQ3eNdpP02do3xPLYlY8UKG/SZcRGnI6mvBdfyy4fo2JKAVR4DurZm44mFeSM92NSN
 z9lQp+nyqWqUhIHOA0ZvO4yK1sYcMbZr8dwHWWJVm41WhvefwHYl8CBwrZzu3dnfypcg
 6MtwHGWmD/jTJuW/WF0/yj6/pj4bZCJ1gG9TZd2tjxZVaDhHfjvNDVh/XQOd7dqBQtSv
 Dc4vooDUjEIUO1vpXmdMyff2d0T8ZVPo4OMFnBJvykJx3vG3iqfGXjvbkwFnQGdBc6ra
 x2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KeBF/SYc9WD7Nty/WAMvMpKYbJLTLdB2z2IFJY2Cf10=;
 b=6ea9lj4OkebJaKDsuKIHN40aBaXr+7bS+bcjWALUkkygkYXVKMoaAl0xd/f80hLXqO
 9zDkD/s6fxbJonqHtj6zFhUoXS0Mieq4QwS13Ma77XgxwJZzxLgECucW2Nk6XnXxUfKs
 iitUOaSTr0CA1QkfASzfZeNT7jpHroH+ecBS3HxZ8uCpJA3YGdjbXQYFoHy2Z/GOkM9Z
 +pu/7qwEW8mtp/K+5rQjFJH0CLCcj6+MV6rj9UXFketG1BPwdrhXW2c334OZy5trNzhe
 IxmFv0bxlFrLgAAXtPwkqkklSNOBvut8ItOk87nGSq7/Nvegbf1E70JZgEyEKiIJlDkR
 7HmA==
X-Gm-Message-State: ACrzQf0LqdLJ+UXqPPYCCXCSltbnNIX0WPN89zmOQCP1xbGRLs/DXeXp
 Wne1bFA09OvHuz+pNqthQKIpTfgKD7qM9g==
X-Google-Smtp-Source: AMsMyM6GT4wPm444Yl6FWyFEdZ8Fjgr+UlXkvMxFftQhkZ81w8e5HatfrDv03N4v7bRJmqylTPRtZg==
X-Received: by 2002:adf:fc05:0:b0:236:63fa:c792 with SMTP id
 i5-20020adffc05000000b0023663fac792mr1021459wrr.476.1668090544156; 
 Thu, 10 Nov 2022 06:29:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c3b8f00b003c6c3fb3cf6sm6312634wms.18.2022.11.10.06.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 06:29:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for-7.2] tests/avocado: Raise timeout for
 boot_linux.py:BootLinuxPPC64.test_pseries_tcg
Date: Thu, 10 Nov 2022 14:29:01 +0000
Message-Id: <20221110142901.3832318-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

On my machine, a debug build of QEMU takes about 260 seconds to
complete this test, so with the current timeout value of 180 seconds
it always times out.  Double the timeout value to 360 so the test
definitely has enough time to complete.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 571d33882ae..2be4be395d1 100644
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
2.25.1


