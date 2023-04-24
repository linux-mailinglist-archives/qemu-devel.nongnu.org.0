Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD91C6ED14D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:29:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy6K-0006ni-VL; Mon, 24 Apr 2023 11:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy6G-0006kx-E7
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy64-0006sI-MT
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso2762975f8f.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350039; x=1684942039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xSalvfnQsVLK8I+FBXVViucc3wM/l9KF4EOKeg2PWAM=;
 b=aLhL1UN59zoeWERsyjR2sb2Uiw8sG9JvFRm4FNGE+Koyx6G+UdkE2lvKoDBsSrAXV0
 R+PbpY4ZeSZB1vYQdZUm3G0VFfdwSfD8R1hfZtooqkRPIteS75o+XEomYtV7CDdolqd0
 3DNmDRWXqn8pE62ku1KXW7GlXOgkROCkbVklVvLzWr3UF96A3Xi62eYxf9eRQb8s6GJB
 2mEbzTPXE9ec7sMfV/XZnNEG114q9+BSfWKOvBSPgpzMAtWUeQxT/EBeVaugWpwrE82Z
 lXI0R9IgaA4dBWLlCTtZMtdAedSEtIihP9K/b4UJfixGUh92ljdegK965FuNuuDkGmE2
 hRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350039; x=1684942039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xSalvfnQsVLK8I+FBXVViucc3wM/l9KF4EOKeg2PWAM=;
 b=c5XAjldLgBhXGSzd6aGloFg9O2r2bd4P81HW8MU7dmbcoQwc9tF+AsBbyitGs+kPWt
 gmzWADpTWyryBx/vZxU5QxLX4LhRKN1aYLpsXwfDsWy1oSQNUcYaAzgM74IoNI7v+nh/
 dWu2yndaVG9Ub8D4E4qcGKmPw3Dmw1rby5oymaK1nKWDFhPQb3IfUlmm7Rm8dk/V2WoY
 NnIWQRtCEWh8G9Xy5eA1e8EP5gRfGUfS8ZghrJZo6PK5Wg3AWRlXVRapbzjhgNqlIzHB
 Qo+abU5uyUA7ejeXEdKQoTs7tD6Yq2CQKtDM4RUY+oMukAD7SPg0YiWqtGUe+gyh/18Z
 tlhw==
X-Gm-Message-State: AAQBX9cMc+Pyo74Ko8cPIOm0GI2z3Gdv8TUHXEHaTLE/6arRY6gk5aNi
 35/GLzvq4tanOh+md68H/mD20A==
X-Google-Smtp-Source: AKy350a2humg4nRsNyKYbWMyjGOn4O4jHCsUpCARctdBB6ARiZQi29ky99e7t/1D4quneGvFoFACaA==
X-Received: by 2002:adf:fdd1:0:b0:2fb:ca40:e433 with SMTP id
 i17-20020adffdd1000000b002fbca40e433mr9340408wrs.35.1682350039207; 
 Mon, 24 Apr 2023 08:27:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b002fdeafcb132sm10971517wrs.107.2023.04.24.08.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:27:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/3] hw/arm: Fix raspi, aspeed bootloaders on big-endian hosts
Date: Mon, 24 Apr 2023 16:27:14 +0100
Message-Id: <20230424152717.1333930-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Both the raspi and aspeed boards load their secondary CPU bootloader
code in a way that only works on little-endian hosts. This patchset
fixes that by making them both use the write_bootloader() function
in boot.c, which gets endianness-handling right.

Patches 1 and 2 are essentially a patch from Cédric from a few
months ago:
https://patchew.org/QEMU/20230119123449.531826-1-clg@kaod.org/20230119123449.531826-9-clg@kaod.org/
I've split it into two patches and tweaked it a bit.

These fixes let us run the avocado tests for these boards on
big-endian hosts.

thanks
-- PMM

Cédric Le Goater (2):
  hw/arm/boot: Make write_bootloader() public as arm_write_bootloader()
  hw/arm/aspeed: Use arm_write_bootloader() to write the bootloader

Peter Maydell (1):
  hw/arm/raspi: Use arm_write_bootloader() to write boot code

 include/hw/arm/boot.h | 49 +++++++++++++++++++++++++++++++++
 hw/arm/aspeed.c       | 38 +++++++++++++------------
 hw/arm/boot.c         | 35 ++++++-----------------
 hw/arm/raspi.c        | 64 +++++++++++++++++++++++--------------------
 4 files changed, 111 insertions(+), 75 deletions(-)

-- 
2.34.1


