Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEE5663C9C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:18:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA0q-0006Zi-37; Tue, 10 Jan 2023 03:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0o-0006Yd-9K
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:38 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0m-0006HA-2f
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:29:38 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso9206966wmq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DCXUIVf0arT8UMGlNT6Zng3MtIHNoVWqjWtp/UuBCL0=;
 b=j8JFfYAmTXTrpMWr/Kpfa9NOMbDkhTFmeQ5azgJZOlDlz33pRip1TmSB2TEygo4ieJ
 Hr8bclA6o+K6+r+ug2T8GukOz9OI9XPB3OWKfXRIPL5rrOaA6px13eV4gegTPkoFkozs
 8RahUDLn4savrLAgjTinCxgeC7BA/nRJS+7MdInUz2nYXyFGIIMKwGzpsb+L0lmtbhuk
 /8Gx/dJh65ywg5P7WPJdWFGwgK+049L3TSVGFKcaBRvBFEQHpAUA7YNJdjyuDrbvrmP8
 smz85pPiQYZvxC1ymngHtW1xMVvPT6Sx8AfsdNWnrDIuq/6//WrZr8nXEcIrfcuQvX0k
 hi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DCXUIVf0arT8UMGlNT6Zng3MtIHNoVWqjWtp/UuBCL0=;
 b=P8Pmhk8lHQYaMOd5ouNWr+xl+ANmyDXxQ0g9CnDVBjlplcUUjRHf9DQScK8Mae9cLE
 BxHx3lr//pEEn763rcNLjkaFS2Rkz9HLf3j8H4sS6MZlXe39VfmzhpaxTe4WIYyThQW9
 z1WUFXusGElyxwxS+1JEentPW0B5mPCva5xtm9Zfm1Qunnfwq8vDW+wqaJR3UoaZ3ZGp
 96eoueMgU0ubCOohpzCcgqGciyDeWmabnMCx9L3YEIIbGxdzTJJI/3xz/8YF798R+F5L
 NA8h+5MplBCILHAapy1wn3REDd60mEU+cpTkxorp1mOyJGzqge9DZZYLI1CvaF2uhQF8
 YEoQ==
X-Gm-Message-State: AFqh2kqn3Li19Yo3S+NumizpP3KEMFEYsoqRa5i29lOlFQwn4UtUY75J
 pqd/MB74ITLtM0ki2G+VvPthIxI442XfYtOp
X-Google-Smtp-Source: AMrXdXthf2UOug6p8trUnTeE6rvkr5XkCJnVuxIqVwBMFDBVNhnJnKf4OFONE7OamtHabItADA9tsg==
X-Received: by 2002:a05:600c:3ca8:b0:3d9:e8b3:57fa with SMTP id
 bg40-20020a05600c3ca800b003d9e8b357famr7013471wmb.30.1673339374260; 
 Tue, 10 Jan 2023 00:29:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c2cdb00b003a84375d0d1sm20048713wmc.44.2023.01.10.00.29.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/5] hw/i2c/bitbang_i2c: Housekeeping
Date: Tue, 10 Jan 2023 09:29:27 +0100
Message-Id: <20230110082932.24386-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Series fully reviewed.

Since v1:
- Fixed overwritten RECEIVING_BIT7 entry (Richard)
- Picked R-b tags

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
 hw/i2c/bitbang_i2c.c         | 80 ++++++++++++++++++++++--------------
 hw/i2c/trace-events          |  7 ++++
 include/hw/i2c/bitbang_i2c.h |  2 +
 4 files changed, 61 insertions(+), 31 deletions(-)

-- 
2.38.1


