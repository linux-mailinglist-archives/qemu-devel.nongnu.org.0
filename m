Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6AC66205C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 09:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEnik-0005eS-5V; Mon, 09 Jan 2023 03:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnih-0005dm-Uw
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:41:28 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnif-0001eP-7k
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:41:27 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so8432258wmb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 00:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B7l2Ne5QgaT9qY5iZJA1B6ys6kOA6AyFQ52dwLgtzLg=;
 b=iP864h/QCRmS1WRmtx7jLD+JiCBRkWvl75Ju0RXaqK5laEwzIMVwwHk2oIIBfoyhL0
 1xkQc7YSuV1s7t7tZpJWgdTYd75UO3+sa41QzGxzagXmA4nHw1keU3E2BXB8We4PDWKB
 xveVYQfxlJSCxi55YRq6rbUkmd971XkP1MFskoTZvi8VjWjxgJVOUG2XS8yrETUZQjjW
 c2BooFMIw7JcnCWi606teSzL9LgJLVEXWTznekzfeszBYxYTUlvoLcL30/ObNGDv39v6
 XfmHdcB+Ze0eyAdBBFNBBVXjTqNEraqKPv90ici+1vHp+bOhe6vj48G3/MmRqHgGuTTm
 ST5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B7l2Ne5QgaT9qY5iZJA1B6ys6kOA6AyFQ52dwLgtzLg=;
 b=E6LJtEIH6XbOW0hRzOFw8l8Zib3jGAAriSm2mbyeZO1ESpVwrxPjbwni8GPJdc/J0g
 mNkGhKoAoCA7q2PjEN4jArw6K1qgFHM/cWyaNnxnVtEIXST+5L2iBuCZwdIsHxek4kYR
 IB4jqEczDIhUNHDz18TAzAk33tgJEns3Tdxt5Gqgpl1qvf6jqYXGiD08Dpx4u+koYDsP
 hBvwcXQPffbjQQrTcjXnHssiGJtNkIlQIcbqvPwSTu0Jo/GmZkZELzkonxGTMtlH4J4S
 pocjXfR2VbiEG421LtPGrdl42MXuIk6nEnzF6JiYtM+oW2FPhWCbaGlYIwTBo2iu+67G
 7Fbw==
X-Gm-Message-State: AFqh2kpAfc/2ay4UsyZd7soy+dNchZn5L99LZgb3wgO0wz+3c76lL3Aq
 vkCVMlKXKCLwIDQ8i/tl46OVsGpschXynyrF
X-Google-Smtp-Source: AMrXdXvw+2Cvuai1bwcvfvtxgNrRsJ0nOufX2/AC1IZ0sz1RMSb2toblswUIvXcfWEZoNikYlcF/0Q==
X-Received: by 2002:a05:600c:6003:b0:3d6:10e:68a8 with SMTP id
 az3-20020a05600c600300b003d6010e68a8mr46566564wmb.0.1673253683565; 
 Mon, 09 Jan 2023 00:41:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm16017146wmo.24.2023.01.09.00.41.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw/i2c/bitbang_i2c: Housekeeping
Date: Mon,  9 Jan 2023 09:41:16 +0100
Message-Id: <20230109084121.72138-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

- Remove unused dummy MemoryRegion
- Convert DPRINTF() to using trace events

(series used as base for follow-up, better if merged via ARM tree)

Philippe Mathieu-Daudé (5):
  hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
  hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
  hw/i2c/bitbang_i2c: Change state calling bitbang_i2c_set_state()
    helper
  hw/i2c/bitbang_i2c: Trace state changes
  hw/i2c/bitbang_i2c: Convert DPRINTF() to trace events

 hw/arm/musicpal.c            |  3 +-
 hw/i2c/bitbang_i2c.c         | 81 +++++++++++++++++++++++-------------
 hw/i2c/trace-events          |  7 ++++
 include/hw/i2c/bitbang_i2c.h |  2 +
 4 files changed, 62 insertions(+), 31 deletions(-)

-- 
2.38.1


