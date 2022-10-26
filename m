Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A960E98F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:49:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmMb-0002gf-5E; Wed, 26 Oct 2022 15:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmMB-0002KU-9Z
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:46:33 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmM4-00071e-Bt
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:46:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id l32so10979932wms.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XdDjlXVUDlcjbrdf+xR9wnd2eu+SAgI38xT3u6Nj3pw=;
 b=RQLXHyG3EQkw4gJvTXEGLzhHEQwB5A5F5NtCjPmAV4qFFfAGOkf5e6K9Kutlom6Ik6
 iW9fm0M7njFmSiADg950bPDHcdk/TWcU678CVKPHsci962KCANAoMhuBI8r+CA110w2L
 AfER4UOsedFjg9t6bsVXkfKwyJMo6nsyRGwEG7Eb5IUMxy7waBFm7T3K5EeEqnvHpe3y
 9K2ktqJM4n68L5rZ0uTTtVqD8Kc1K2S+Naerxux86bylSUy5bLfyNogN/S4X2b/oLxCu
 ORr+w+2HtSOl16NeLFoO2YxPv4buBFgIrrDyI/0CrNYoG+L/4GqUn7I7AYneglf33+Pg
 YvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XdDjlXVUDlcjbrdf+xR9wnd2eu+SAgI38xT3u6Nj3pw=;
 b=CPYDA1m67j2CLxZdv5XwMga18bxMhkTCxJvZSjRVh74Dtsbmt8II6UjZqCPalL1fuJ
 aVI3q9fvBg6Qg7rJEbnKKwEQBJZvJI7fSQSDFTJQxfcHxI8PoBtcWl1dIZkic2s0KCGT
 j6kqzuxmXxWzccKmanka/NtDHXT8INT0aKkjys491ruR0lZ1EK/qMuxiJGRu4/cYecdb
 jkWxpAfj20nYZ7rjys/R5WjOw4EoaDSD3K1eDin8IgXfX+wgN4gAgaYuHRACkZxjS13a
 E58kb4PXOGyaDtm11yY4q95KO/AG8xPtmBqW0hhTgeVdjWl+Un+YqnSkk//QzwHPo8HF
 y/hQ==
X-Gm-Message-State: ACrzQf2wIikPNHBVnaWuZ5bJY52G10f50urlJmO6ltg0dFfoZnA/6EuC
 qntDT6J//MfFcKJMdq+6WPEiJg==
X-Google-Smtp-Source: AMsMyM5St2N0+cgVkebPEGRX1cUKbIjrq/c+iOh0K7ubMq3B0zgu+lJs8xEWvmjxbHQoMmyEiZnjwg==
X-Received: by 2002:a05:600c:3c92:b0:3b5:62e4:e423 with SMTP id
 bg18-20020a05600c3c9200b003b562e4e423mr3644527wmb.162.1666813582505; 
 Wed, 26 Oct 2022 12:46:22 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a05600c4d8500b003c5571c27a1sm3105677wmp.32.2022.10.26.12.46.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 26 Oct 2022 12:46:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/isa/piix4: Remove MIPS Malta specific bits
Date: Wed, 26 Oct 2022 21:46:16 +0200
Message-Id: <20221026194619.28880-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bernhard posted a series merging both PIIX3/PIIX4 models
in one [1]. Due to Malta-specific board code forced into
the PIIX4 reset values, Bernhard had to include an array
of "register values at reset" as a class property. This
is not wrong, but to model properly the model, we should
simply use the hardware real reset values, not try to
bend the model to please the Malta board.

This series fix this issue by having the Malta bootloader
code setting the board-specific PIIX4 IRQ routing values.

Note patch 2 still misses an equivalent nanoMIPS code.

Regards,

Phil.

[1] https://lore.kernel.org/qemu-devel/20221022150508.26830-1-shentey@gmail.com/

Philippe Mathieu-Daudé (3):
  hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
  hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
  hw/isa/piix4: Correct IRQRC[A:D] reset values

 hw/isa/piix4.c  |  8 ++++----
 hw/mips/malta.c | 23 ++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.37.3


