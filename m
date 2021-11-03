Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55F04446FF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:24:01 +0100 (CET)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJzV-0005hj-4L
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoM-0005vF-Oz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoB-000748-GD
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id s13so4682630wrb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/FYDfyeABj7CDR/MgjAQldLjA0oTUIGaG3FQyOZ6q8w=;
 b=HyBW2RSYWE19Ye3Cgd9Uf45qe1oahrr+4n16f6cU/VfBmx8ylNaDlJwniYoL59g5Hp
 v2dRKvOmN6h8kUqvjhNs5pieOLix/h2CCWjJw3pxbBQeHUlFsf3U5jgWFEiId6RVccDG
 0aXYtG90ganwIho2asWuaoF63ckKnoO0EPm7rP10s8fi+lvmyzG6CC98Nf2eUthH17tH
 GAtRV47ITUiHZw2AkKv+asS1gyFTKxG3lrkJeRmlA9CQfP+VjHSLIKxdmYOffQZi4j20
 Ggi2/wLs+1t48hocBPkk7onHn1J6ZAxJPVgCXNL7n4/MALlkToq36oHmOKuD/VmH8D45
 sUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/FYDfyeABj7CDR/MgjAQldLjA0oTUIGaG3FQyOZ6q8w=;
 b=iHfiGzqju68Mw1g4QWbEBB2mPyGeXwhHJGvgkD+Vw/q8aB9vSL1AUDkh39v41UVMxO
 zN4Pie5KUfNDFUOQVLDi+7UlbqZykTQCBipM85B/8cn+Hum6Md+6tMYfpQQuQpNElz+h
 PBetm2EjvxhNoG0v+mn73WgZ6lWgWieyLIzXk3UErQR4gRu7fFYfDI4cUtG5wXCBawuf
 2xNCUbzyIBBSwEMou9S/1ZzpOHIyVdv6r2kSIDBlbWrj6vVBEIGIZA5RpAeWtH81Pq7r
 FGFg8IE/YAPawIqGvTBYTT/buj2txmGZOkEq8PQhAwkn0S0A2f7NRJT/+Rnpir6e431z
 nDoQ==
X-Gm-Message-State: AOAM531RgqKO+zUli1oS7qigU/IlqkwBjk5Ctd56NVhNmn9b8PV/oBBC
 SkQGTnG9GQ1e8XRKWhZsg8HcvA==
X-Google-Smtp-Source: ABdhPJwFtd94hAGlgYc+IXsFmTHlz3lQjc9zX1u2BHe64RWavaqPke3aM2V/94ynzDbmfVx/Cn4U3A==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr12611366wrq.6.1635959537654;
 Wed, 03 Nov 2021 10:12:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k21sm2439020wmj.45.2021.11.03.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 33A6F1FFB5;
 Wed,  3 Nov 2021 17:06:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 20/21] tests/tcg: remove debug polluting make output
Date: Wed,  3 Nov 2021 17:05:57 +0000
Message-Id: <20211103170558.717981-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 5343a837cd ("tests/tcg: move some multiarch files and make conditional")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211026173914.79377-1-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index b962ed8236..a83efb4a9d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -16,7 +16,6 @@ MULTIARCH_SRCS += $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
 endif
 MULTIARCH_TESTS = $(MULTIARCH_SRCS:.c=)
 
-$(info SRCS=${MULTIARCH_SRCS} and ${MULTIARCH_TESTS})
 #
 # The following are any additional rules needed to build things
 #
-- 
2.30.2


