Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA667548B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqVj-0001Mh-BB; Fri, 20 Jan 2023 07:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIqVf-0001Ek-HL
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:28:43 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIqVd-0000h3-L9
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:28:43 -0500
Received: by mail-wr1-x435.google.com with SMTP id y1so212453wru.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=egpAiiN14qH0Rb0+ZIpRTIZqd0WFiBfd5LuBwwOlBKQ=;
 b=Oc5fOFpOUpBn0DrKUI3iLADmxZVOu+9A0Cpl5JxOCFS7vMR48qRnS8K+MivqR0QIOM
 78MNwx2AWRpKyjMMX5WeOyM9P5Wwb7zHVejSnKO/MgoAxjCE2casMcenNXQ+VKyZJrxu
 dCChSK5RX2S/5boVv8qnNjKR6/ZMvE8gP6ltzGMngj/icWmxRK7Esy+mB07Ffz41Pw8t
 XlA+QSIOEMxqHIrzoJ1K1LuqT7Cfbgfep3ng3CKQIWO/JsNErr1mrcQbEnKz7VsXRJyI
 ZpOwqXJbrSr20BqaS5lXyu3edocpcUMf6YAoc90PRJHjf95fksjc6XdIsbwyKZz4kl6I
 H1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egpAiiN14qH0Rb0+ZIpRTIZqd0WFiBfd5LuBwwOlBKQ=;
 b=YTthyI9mKIQD8ktE1fKqBiNZ6yvFzeGZfrZtYSymVXWXiW4D1OfKogrjbxyagnEjOu
 vFi/oBqyT8q0nT6h2yL39CsE3FpXSfKNv99wtyrbHljkCkCsSKydNDo0e3EovRG/QozS
 yRBD2nwSm9DxBDYYUKQQeCd0T9HyBV2pETj6l92zKCiKDg+nEPCDwGs/sxe4CRUnfcM5
 zvCxNuxVx7+W6ijxAB1scx94Eh252ZKKJRUMrPervqlgM/CZdSFX2Ln9vzJSe45JEJTi
 qJHryuv0EYg0FmRXRjD0w2KEb46CS9OlfSR3aJdAEJZfqeEDU489TA2trN6rtS/jPxM5
 ihCg==
X-Gm-Message-State: AFqh2kpGDXLELvP0Y7kdWoqlnCIZ4kqxSk6xf/0+UlDmTt5fFOzgNtht
 Ui41bYK73Y0a/vNZ+RowaIOOhhbQJ8R4K+OJ
X-Google-Smtp-Source: AMrXdXvCdMZ0yt/FpTe2zQpOK/YD0Gz/2zIsHrMjfZ8uHIlT8xy4+7UswZRu11KeMmOzZuVvfFghwQ==
X-Received: by 2002:a05:6000:1374:b0:2bd:f63c:5457 with SMTP id
 q20-20020a056000137400b002bdf63c5457mr12918715wrz.48.1674217718902; 
 Fri, 20 Jan 2023 04:28:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a0560001b0800b002423edd7e50sm35579991wrz.32.2023.01.20.04.28.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 04:28:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 0/2] tests/avocado: Truncate M2S-FG484 SOM SPI flash to 16MiB
Date: Fri, 20 Jan 2023 13:28:34 +0100
Message-Id: <20230120122836.81675-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The M2S-FG484 SOM SPI flash is 16MiB. Truncate the file
provided with the Avocado test to avoid:

 qemu-system-arm: device requires 16777216 bytes, block backend provides 67108864 bytes

before merging the "m25p80: Improve error when the backend
file size does not match the device" patch:
https://lore.kernel.org/qemu-devel/20230119123449.531826-2-clg@kaod.org/

Philippe Mathieu-Daudé (2):
  tests/avocado: Factor file_truncate() helper out
  tests/avocado: Truncate M2S-FG484 SOM SPI flash to 16MiB

 hw/arm/msf2-som.c                   |  5 ++++-
 tests/avocado/boot_linux_console.py | 16 +++++++++++-----
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.38.1


