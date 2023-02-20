Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5180069CA41
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4hX-0001aE-Pf; Mon, 20 Feb 2023 06:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hU-0001Z2-Ri
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hS-00054p-HD
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:20 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so646894wmb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AVEmTV8eUabu0JrtQ7tHPjA9qtxyI1a/sYkY8Q+FRBA=;
 b=X0heOi+2EtZVoeXlHG4E6fwJ8vjPphZeY72HFskoyaApaum4iMfO0dqpCDTQNrxNY9
 yzEnUwh+fICPH+xKy3aBdQbz0po3iKckNv3LQE5yFjExcA+l2ecnbDnyYznVNst+Ki68
 C7nFk+d/N4/xX6mNIoPuuZLGjQn6k21fnNs9shRMfrqMO4m+T6U6Kmqp+Wwr+nTB72+h
 rowZnLIWDpPNmkfMCuu5o+aYNF+G6migpeLwK1J5yGWQ4R+qIeECC45p+DuU/ShFxiCE
 M34qpSS4jzwesmlNIO0Cn0d+qJuvkcxtC9rB/7BL/KhnG+relLvFeuNSs6XmAGFj+cDn
 pITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AVEmTV8eUabu0JrtQ7tHPjA9qtxyI1a/sYkY8Q+FRBA=;
 b=r3BNmyVwB+Qq/Ujfe3XWhqUwmXPxCSPwtuMEsDLOflsA3otbUtx/aGEpaf359eCen7
 B3zHBQ7tb79iAJIn0Lrd6rU9Gvp8+C2i0f4WtH17l00fOc7A1rnnDAnlNzLkPaKfnlfz
 pNFm5ssskhSPXymp15aULefZFsuN/GiVES73UGW//LdZhB9uOYZljojUXYdDoyM8xioP
 n65Slgs1R1KxyCH7a+FG0Oa4cjCxPyWXCciebDcNGn1sV4Pl+ikCeifL54JDXyCM9Xkk
 Vpq76MmFtfMV4fXfoiJWsuoTGurL50Y5h5XK38xgD4YjfgKHLH39YPwS8IKpJgonlRkO
 3zxA==
X-Gm-Message-State: AO0yUKVgj+YgioX8gObTnHeU8ztzHldD+wIlxlLs0dEwZ1ZpkIHOo8B/
 wzJHkwj4vu2o7A6PGLGMztzyRYGxHoezrbCJ
X-Google-Smtp-Source: AK7set/daatUxqcdgQp4aZmhLas+CiRTJKikfbOw38BfG+x2bIlRYW+3LBZBp9sDUFRBR8V4+6zylg==
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id
 x7-20020a05600c188700b003e20918ecd4mr375109wmp.37.1676893876789; 
 Mon, 20 Feb 2023 03:51:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c274100b003dfe549da4fsm1388723wmw.18.2023.02.20.03.51.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/8] hw/arm: Cleanups around QOM style
Date: Mon, 20 Feb 2023 12:51:06 +0100
Message-Id: <20230220115114.25237-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

- Reduce "hw/qdev-properties.h" inclusions
- Open-code various QDev helpers used few times
- Use QOM cast macro when relevant

Philippe Mathieu-Daudé (8):
  hw/gpio/max7310: Simplify max7310_realize()
  hw/char/pl011: Un-inline pl011_create()
  hw/char/pl011: Open-code pl011_luminary_create()
  hw/char/xilinx_uartlite: Expose XILINX_UARTLITE QOM type
  hw/char/xilinx_uartlite: Open-code xilinx_uartlite_create()
  hw/char/cmsdk-apb-uart: Open-code cmsdk_apb_uart_create()
  hw/timer/cmsdk-apb-timer: Remove unused 'qdev-properties.h' header
  hw/intc/armv7m_nvic: Use QOM cast CPU() macro

 hw/arm/mps2.c                            | 41 ++++++++++++++++--------
 hw/arm/stellaris.c                       | 11 +++++--
 hw/char/pl011.c                          | 17 ++++++++++
 hw/char/xilinx_uartlite.c                |  4 +--
 hw/gpio/max7310.c                        |  5 ++-
 hw/intc/armv7m_nvic.c                    |  6 ++--
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  7 ++--
 include/hw/char/cmsdk-apb-uart.h         | 34 --------------------
 include/hw/char/pl011.h                  | 36 +--------------------
 include/hw/char/xilinx_uartlite.h        | 22 ++-----------
 include/hw/timer/cmsdk-apb-timer.h       |  1 -
 11 files changed, 67 insertions(+), 117 deletions(-)

-- 
2.38.1


