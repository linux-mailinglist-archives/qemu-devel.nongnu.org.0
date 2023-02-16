Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA96C699AEC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:13:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnV-0000ca-91; Thu, 16 Feb 2023 12:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnT-0000Y3-My
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:51 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnR-0007zA-UA
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:51 -0500
Received: by mail-wr1-x429.google.com with SMTP id d4so2453182wrj.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fKaIoyL82f1ne64Qgj6g8dHFUQLBIO6UYjkBABaWKfo=;
 b=DgMZthnnyOXKstFHEfxLIhWvu3GsizjxAKRkE6vmPlD5aqylDgssdLO5ZudJ+tzCcU
 aHTuR1f9OLzMytjBXrRcxi61hIUyGbIyOprb8RIU8N0omXrTReXicjH2x9wDd+oH/XNL
 eof/51EhN9ilCNKKNvFLemIv+ZLDWvrDp1ViUJGnXh3irLEVc+l6uZYx6pjN0iBRZ9q2
 ksa5i5HCMznEFdtjFl8vvcS0fqoiFUcYSAUsKeXPdXyk5n0MFfglRldx2HlVU98nr/HV
 7lnJYK4RfHfu+YgXZwMMyTVg8ooY53kirY4R3iMmEDdn/2N4UGKMa6OhrhG9jiEdQNP2
 2C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fKaIoyL82f1ne64Qgj6g8dHFUQLBIO6UYjkBABaWKfo=;
 b=4QV7MZAlO1Hyhp93dZs4C432BEmqaFoAvs2DQRZvCp5tZZv/7w24zsJVNGITNOFMT7
 y3s5DMw8awbxEEn4z0Ci911eUl0aXAQYEW9rzqru3YErjms+h5hKxaWfCl5P0y9S0hPy
 +gDPVbJuAq7QUAFuT23gNcvZq+UpJtOobaycebcKC8tEUEX7PYtuiad/kp2LcghVHXlK
 H5yE0MgWlYWOYstaafPDdgmviw1aP1iOUdeq2LFMJPr+B+WfE632O1hJ3xsdRn9EJTWZ
 QJaMfCcvWbYkC/4v/4Cjj1/qvzKBs9dKFvjuRRthRh79Hf+lbSyvd7cSsV2CLNwFd1l6
 r4Cw==
X-Gm-Message-State: AO0yUKVMUc1N7NT0wKLZl4w+nn25m7pRDx00WiKyBETij4pNzCw85bRc
 Polfj6dmfU5kGK7JWKrXjzmZOyG01rJJeoq/
X-Google-Smtp-Source: AK7set8lAtvWZwvMg7AaQme2SYwkU2S5/AjnQirPpzrfD3y9MamXbNJHq0MgGNoRWFhZwmNrJtCDuQ==
X-Received: by 2002:adf:f851:0:b0:2bf:ee7d:5369 with SMTP id
 d17-20020adff851000000b002bfee7d5369mr4703442wrq.59.1676567507588; 
 Thu, 16 Feb 2023 09:11:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/30] tests/avocado: Skip tests that require a missing
 accelerator
Date: Thu, 16 Feb 2023 17:11:19 +0000
Message-Id: <20230216171123.2518285-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Fabiano Rosas <farosas@suse.de>

If a test was tagged with the "accel" tag and the specified
accelerator it not present in the qemu binary, cancel the test.

We can now write tests without explicit calls to require_accelerator,
just the tag is enough.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 25a546842fa..a313e88c07e 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -274,6 +274,10 @@ def setUp(self):
 
         super().setUp('qemu-system-')
 
+        accel_required = self._get_unique_tag_val('accel')
+        if accel_required:
+            self.require_accelerator(accel_required)
+
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
-- 
2.34.1


