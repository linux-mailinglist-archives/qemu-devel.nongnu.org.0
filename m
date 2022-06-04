Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01E53D512
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 05:29:08 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxKTL-0003eF-8F
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 23:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxKRb-0002xu-9a
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 23:27:19 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:47048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxKRZ-00027o-H8
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 23:27:18 -0400
Received: by mail-pg1-x52e.google.com with SMTP id c14so8574816pgu.13
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 20:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5W/3yX44AIkgeob7bPv9TvMqlPILNL2TnqkzVGtsU2A=;
 b=KX7j4xJiTS3h2iernWrfgbKbWLF4ocVIbmQ5bsXb9CzTBvqnCoc/su0pxRvF6Y+2VX
 ZlBS30/RS/0psz9s7n17vb/xddMX7OkWE24GrutWBPqsbGGc271eOb1zy3M9gTLLeBSt
 i4V2LngWnn2sgkhM9wbaNO23TDqFEbn4kggRKrDmH0F7I2GdIXTjyelOCmZKy0Eyy3b5
 sdBTuTpOqnbVrOu9qjI1cMi04hJW+ZsOvoNWdGr+u40oySeW13UWRDOcDDhrSgqGVtT5
 lWA9h0//U0/y6PcSvc/n5JUI856+KsWLSKWoxckI4jiOHvjS5Nl3dGH7q4t85i4uAhcs
 ywOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5W/3yX44AIkgeob7bPv9TvMqlPILNL2TnqkzVGtsU2A=;
 b=CP/z5W2PTx7381zIhJhgTkYPL6PSBbSk16OZq89OrVzAI7DdntFJzbG5iz4aUoucox
 r8xYEoPpp16Is2HL7DlxdphEHEFcE+Ga60jrLvuqtvd2X9TVshUsxv2IOCisDEBxlsyG
 uOB7ddBkXkuzq2Olq21KTY7R6nkeGOFj/nYdIbydnHRA4tzavtnaWjqGlTFfYxhBJzvq
 RKRDo5xSOEe/RmzxUgwmNJM/ZGncxCVfMk68ug2KelTrCVNzMMvowdSYFRXGbSnizKjt
 iR54rnoRBK06pkF0OFG3g/YoPbR9u8YkAuWJ0X7IDNZJvUEaNFpVqUiExv+TdVQreYuk
 I4nw==
X-Gm-Message-State: AOAM531fdWhn1Kb2NXDbwe35W/Kw7AWSpdnfWbRIav+t35TCb3ucmFbL
 NL3JPPU3huqt1vtahC01zgbpR2slOByGhA==
X-Google-Smtp-Source: ABdhPJzCv1PKMG4tWYBvmO+Yy6EqNNloXEfbm54OEdsFyFpRFfgNOt76qOb7rG7yy5QE6Uxw9O/8ig==
X-Received: by 2002:a65:6a50:0:b0:3f6:4566:581d with SMTP id
 o16-20020a656a50000000b003f64566581dmr11667648pgu.122.1654313235736; 
 Fri, 03 Jun 2022 20:27:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a17090ad31000b001e2afd35791sm5939591pju.18.2022.06.03.20.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 20:27:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
Date: Fri,  3 Jun 2022 20:27:13 -0700
Message-Id: <20220604032713.174976-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

GCC11 from crossbuild-essential-armhf from ubuntu 22.04 errors:
cc1: error: ‘-mfloat-abi=hard’: selected architecture lacks an FPU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/arm/Makefile.softmmu-target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 3fe237ba39..7df88ddea8 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -20,7 +20,7 @@ LDFLAGS+=-nostdlib -N -static
 
 # Specific Test Rules
 
-test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0
+test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
 run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel
-- 
2.34.1


