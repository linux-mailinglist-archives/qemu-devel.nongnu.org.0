Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D0258CFD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 12:46:44 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD3oI-000685-UM
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 06:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3kP-0008EA-57; Tue, 01 Sep 2020 06:42:41 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:56070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3kN-000249-Eb; Tue, 01 Sep 2020 06:42:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id a65so646527wme.5;
 Tue, 01 Sep 2020 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=enGnTRGa34Kg3obI/KeU8ABbZ2LlNRxAHq2KPmH8fTY=;
 b=rcLlinTXgXZX9RBRi5f7aiY1561OAU9SdO9EBtAle3oXXDM9qAAc1Ai5IKNtdq6ZSC
 cqoBOh0OAxLk6UtsZE3RgwbYhMoustKzGMhKH3REbuJYk2PezCbHiKof4xRclaxr7kZp
 SzvjK6Ug0ry0DyDbzI6RuIOXyhy71crieWnR9rypPc3yTKuU9bSk2JoYEn+fIDdXgc3i
 8G9gmVTmr5hjfGHvee40bbTwOXrkQepN6aNQ00RGQU9/CCP1vBN1r9GgZIyRRURHPppA
 16tL6Tq8WXS4plqV+g1bvz81+FTSTB1r2BgViJ/8d8nEi4niPPvstkkOuLyenrsn0Lyb
 U8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=enGnTRGa34Kg3obI/KeU8ABbZ2LlNRxAHq2KPmH8fTY=;
 b=YaGXMgnoPCqh4ZOP1O7RsH8/XN6LvBWcQX65XHMeq5BuA4AuSd9Yn1gqndXlBgfdto
 anHr39AA0fNN5c2/h3YmPtFqqdZwiIe9O3LpO3ZOLBghN45Mov5Pp9jRaw+dgwasIv4y
 UR2H3A1gWwZ8KoTKtbq3rKvxQ1uTILH5M837fp8LqOS//OWMshMgCIRICQNbX+QYVR1w
 bAWz6VYBtj1MDSAWrVrpvERbi5ygzwwosL8g3R4CnY5jjtAiceDxw2ygXc08Xoan93UQ
 1x6mTOp2rb/ZVPlzzhwyrt/tdmgO6i3mOwWJsOtm3zO/jsUyoetTTHLsp37argOXf7aa
 2z3g==
X-Gm-Message-State: AOAM533Na0YwrjWTJK529yf/87pMjmVBKgPsQBqA5XfMvtz7mKbeT2a3
 35KQfzyVZ36OpUCnTSYiPWIqxXDkpvc=
X-Google-Smtp-Source: ABdhPJwjI7Ph6TPM4Psko3S0GOMlEtQsWkUUKPz6h/lHm5MYKlZw8t9SW1kIoF2N5KNlR92kJwqelQ==
X-Received: by 2002:a1c:2e08:: with SMTP id u8mr1234128wmu.156.1598956956890; 
 Tue, 01 Sep 2020 03:42:36 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id l8sm1693217wrx.22.2020.09.01.03.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:42:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/gpio: Replace printf() calls by qemu_log_mask()
Date: Tue,  1 Sep 2020 12:42:32 +0200
Message-Id: <20200901104234.92159-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patches logging via qemu_log_mask() instead
of using stdio directly.

Philippe Mathieu-Daudé (2):
  hw/gpio/omap_gpio: Replace fprintf() by qemu_log_mask(GUEST_ERROR)
  hw/gpio/max7310: Replace disabled printf() by qemu_log_mask(UNIMP)

 hw/gpio/max7310.c   | 11 +++++------
 hw/gpio/omap_gpio.c |  6 ++++--
 2 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.26.2


