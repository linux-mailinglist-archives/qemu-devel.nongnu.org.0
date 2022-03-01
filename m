Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CCA4C88AC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:00:07 +0100 (CET)
Received: from localhost ([::1]:39824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzIc-0002kl-UL
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:00:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6T-0003QZ-MK
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:34 -0500
Received: from [2a00:1450:4864:20::333] (port=37462
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6S-00078v-0v
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so388000wmj.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FQ+h9Whzspn2FeDhefPTKuXX0JogRqseFVyd+c+eLhE=;
 b=ui4tVcwTbAZnifNSRRu67Lpt7JlTT36WeN7wsgDnGl6/AALXX8DEy5zC6bqgbAv005
 QrBSQvs6uBqBOCfy0Oem1Kt6TH50j+Ut4KcTs7KtM5vgEstTEENlYh3HHP64twEOnjFc
 QSaEAa7HUaX5wVmEbKtdaVe7vSODJaUkTdQogfLm6L+kRpJvZPrGcfecXY758/sWFGi3
 6DHQdvprKkGir6L4wZH3tNZQLyj2+rH0IomJa5wi6825SQZVXcCni57UIej0xWULlGUV
 HzX+P5r9OvT7vPuy0lFtxfb8injo4t1oG1AOUW56ri1jxPkWE/aZcur8DwX2uvZIQSWZ
 3cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FQ+h9Whzspn2FeDhefPTKuXX0JogRqseFVyd+c+eLhE=;
 b=Ipwe/rJ0Q3hlhu0wDgcTB6W1XnOPetqvUi9dGsdQhcLa++x3HScv4Eez9Wvd3fIJew
 1V9RcQWEET0sYJ0dtlcTSqrxHn9zaeVFve248lQjyCxCXZ9XhLqeTD0T+y4dadA9PWfH
 vdTaKEjIdqM5iPkUURstv7N8AVzYs9Jkqth2KHuFt7VeQopw10RZXjRjqTTiVXasHljo
 4I/ThIw9k/7y/oJK56PTuck7IvGK6bpewr4UrbuG7t5cgv6sSdVBffNK0DB4OF/YfwdL
 bmDzYRwD6FKZjTb199rwP6o3qQDkvHSKHWmfIu28w8HUjLEV13JodoP6uF/sQLMvaSBm
 X5gQ==
X-Gm-Message-State: AOAM533YOj4fnVoOttwSVCbiKieY39sexC010uMGpX6OVQRzGVQB9qKk
 hzArJRBCYyblpkvUkf0JOwes2w==
X-Google-Smtp-Source: ABdhPJxe707FYmkacr9yJzOvrCfkEL8QE6WIqLs7nad80PF2zuBhe9v8yj+YWuuQ12A3uobbWJPuOw==
X-Received: by 2002:a05:600c:3d98:b0:381:738e:d675 with SMTP id
 bi24-20020a05600c3d9800b00381738ed675mr5372352wmb.7.1646128050574; 
 Tue, 01 Mar 2022 01:47:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a5d56c6000000b001edb64e69cdsm13099581wrw.15.2022.03.01.01.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BAE11FFC2;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/18] tests/tcg/ppc64: clean-up handling of byte-reverse
Date: Tue,  1 Mar 2022 09:47:07 +0000
Message-Id: <20220301094715.550871-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than having an else leg for the missing compiler case we can
simply just not add the test - the same way as is done for ppc64le.
Also while we are at it fix up the compiler invocation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-11-alex.bennee@linaro.org>

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 0368007028..9d6dfc1e26 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -10,19 +10,14 @@ PPC64_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64_TESTS): CFLAGS += -mpower8-vector
 
-PPC64_TESTS += byte_reverse
 PPC64_TESTS += mtfsf
+
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+PPC64_TESTS += byte_reverse
+endif
+byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
-else
-byte_reverse:
-	$(call skip-test, "BUILD of $@", "missing compiler support")
-run-byte_reverse:
-	$(call skip-test, "RUN of byte_reverse", "not built")
-run-plugin-byte_reverse-with-%:
-	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
-endif
 
 PPC64_TESTS += signal_save_restore_xer
 
-- 
2.30.2


