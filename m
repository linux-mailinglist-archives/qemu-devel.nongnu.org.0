Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C46EC8C1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:24:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQ7-0007jZ-Kn; Mon, 24 Apr 2023 05:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPe-0007Fe-TQ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:12 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPQ-0004nG-K4
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:09 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so43348755e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328175; x=1684920175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gATlHo8jZj7xSKmpmcEVbxmuB9cXEWUKLiKEpRBnCw=;
 b=Q2UNVkztqm07zxn07aQUR+0xUDgzL1hfxGJ4UK1sdPrRKnSe62QvfHPBrGYJQhLNuq
 WIX8EoOP0F2UKq6e//EVavhv7A8p3OXvnLfHFFRJGGJ15ITsIsv/NqH89pg9jPxDc+8A
 O1BCE2MnFbWr4UqpDPHvUlITdVae1OvpfFcw58D5tYE5xIB5R/LiZAavBboQcSR3m2aF
 HnBWKrfBmmIoT21FKw7+0CnxyY0T0/pprw9u5MugaV3ByhylkHwrQy/3odjug170iAVG
 9ylRF6Sb3ktPGvRedJjtSP45Kp7g9sey1XnlYbFlVkcbgGQ7fnjDV7p5M6UAEgI7U6AE
 pxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328175; x=1684920175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0gATlHo8jZj7xSKmpmcEVbxmuB9cXEWUKLiKEpRBnCw=;
 b=Sb+tEet1woQW5sQXko07YreopiKwmw5qvlD8IMmxTsAL0dptaMbLfXM8UH++laaQoB
 8sAOu5grbcHtCQ7YwW7aMQgpE3t+Uq9SofVTk+8K2tG08S6/q3GaTzCWgr+imDnQ+DM5
 9yvljUCLJ9Fdanai+Mv5NUCSnHia4QWrb8jPOTFxmreIyQr9aKQZwBP5k5q+EsFYKNnF
 GYlPGKaRbZXZuBjP7EzIvEyv9dJDTKY69D87j2Msw24lM4FssifPzMpxd1scA/soKeHH
 d9oBUxUNYINZ5ly+TAqnmbiAWCpPypSqQQTytukp050mB6wuNdPoiZR1CikMjO3Cgb77
 y1og==
X-Gm-Message-State: AAQBX9cO8iGIdxSSI8XVH2RCNI6NepPgzv6e1NWH7r0FeL+Yyi7x8EnU
 nLlzEphq+WAZZw193NoSBkCOmQ==
X-Google-Smtp-Source: AKy350auoJt2YuKXJvVsF5SyqzTGBDOxq9qJMRFR/qilc8ZTHVDu6ONGXevqRCU7gINNyRsDTAJV2g==
X-Received: by 2002:a7b:c5c2:0:b0:3f1:7316:6f4 with SMTP id
 n2-20020a7bc5c2000000b003f1731606f4mr6853130wmk.20.1682328175248; 
 Mon, 24 Apr 2023 02:22:55 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm11582037wmk.20.2023.04.24.02.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F3A11FFC2;
 Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 10/18] MAINTAINERS: Cover tests/avocado/machine_aspeed.py
Date: Mon, 24 Apr 2023 10:22:41 +0100
Message-Id: <20230424092249.58552-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

tests/avocado/machine_aspeed.py should belong to the ASPEED section
in the maintainers file. Improve the wildcards here a little bit,
so that it is covered, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230421110345.1294131-4-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 034ff71dac..d0f48a5113 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1113,7 +1113,7 @@ F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
-F: tests/qtest/*aspeed*
+F: tests/*/*aspeed*
 F: hw/arm/fby35.c
 
 NRF51
-- 
2.39.2


