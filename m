Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC92610334
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:48:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9ml-0002ms-GL; Thu, 27 Oct 2022 16:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9mi-0002l1-R2
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:47:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9mh-0007QY-2Y
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:47:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bk15so4142157wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ll8H0vPz3VfN6+3VovJST10zVfxJqsN/lK26IFPV6AM=;
 b=v53U/bIeQ7amXbNRnlyiDpsKVKvtWuy5ycsBq7dz5EfRQUGSP/qn/O3bYdjV8tQu5y
 T5QF5JMTO8PqftW7w0sB425FS896OT8GLUsJZKNeX3mW1QVkwE2BXO4sOAWo5hYqUccF
 Ln3V2BTmdBU1UKIdtzhg6jflRLNzKd/EZgJdnsi1yDO6xcfBFVex5ZF8t4rxdba0jY1L
 MWNmzp3CkMvNVX72nrRdHyl1C0WNaG+qXwQgBDZjXsVCc/aUAL/jhK0ij8IQMyDXKF+e
 wtGgU/Z86V7tZXsjnsI5Ory/XDZOLm72BxAx2E6AbHVuTOXcjKdZ908CEtBmWdLJB5Tv
 Cqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ll8H0vPz3VfN6+3VovJST10zVfxJqsN/lK26IFPV6AM=;
 b=mqR8BIuF48JkWaUdWsW+e15I8oaIjodkZECVjJv6Ob96oY2uN+XGsaxs14OVwLY3ai
 oxxlebcnnl8o+KNQ/6AMhVEpN6o7co9O/oMaM3ziesbnvimaAc+P83zp5sHJwuvTzeyI
 drXdn6dU4/qkp4mELINOFpeE+R9FSCB1jAYTPnvOpXa+98gGDYspApPK5HlUKrqZzvxb
 h9DGPuKZgcpCydWPR8MCxnPtNGpoeLIebvUChyjTqxUJKzd93600ST72VwBBHbSSHi1z
 DduSxrhiW1yH9p/1posL0385EpPQ10XfWCHRBoNRr9g6QWp4LJo7CpDL/lQcSxliHT9S
 jv3w==
X-Gm-Message-State: ACrzQf0artKDyuf6LhJnFqFBerercv8rD0Py3FDPVpMNMR5efgiQB38A
 Ux4b2sVhM3srea1iDZ7vztK5zGkqU16idSyJ
X-Google-Smtp-Source: AMsMyM5qHgKijNk8QLnY/mB2KUq/O7b1Lxb55RNdMpLyoTTkErSHMcT9jvI3mEeHJ6tWl/nOu9YBAQ==
X-Received: by 2002:a5d:47c5:0:b0:22e:655e:f258 with SMTP id
 o5-20020a5d47c5000000b0022e655ef258mr31633268wrc.569.1666903645245; 
 Thu, 27 Oct 2022 13:47:25 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c1c8300b003c6b7f5567csm9163445wms.0.2022.10.27.13.47.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Oct 2022 13:47:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v2 0/3] hw/isa/piix4: Remove MIPS Malta specific bits
Date: Thu, 27 Oct 2022 22:47:17 +0200
Message-Id: <20221027204720.33611-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Since v1:
- bswap -> tswap (Bernhard)

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

Based-on: <20221026191821.28167-1-philmd@linaro.org>
https://lore.kernel.org/qemu-devel/20221026191821.28167-1-philmd@linaro.org/

Philippe Mathieu-Daudé (3):
  hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
  hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
  hw/isa/piix4: Correct IRQRC[A:D] reset values

 hw/isa/piix4.c  |  8 ++++----
 hw/mips/malta.c | 23 ++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.37.3


