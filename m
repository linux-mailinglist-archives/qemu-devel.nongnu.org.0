Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224369236D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWPJ-0000OM-OU; Fri, 10 Feb 2023 11:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPH-0000Nc-21
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:37:51 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPF-00008K-JT
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:37:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id o36so4249668wms.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uZyX7beYR1/8hPTlA0f9tYFKMMepz6hOSd4CeavM+Z0=;
 b=n2E46jbzRFXkWkurdBdqhfVXcQEU6sfSDwelBGxbchDXm5tcLSzEv/jFqOejZhc1qp
 LDLq0laVFaSRITc8/oj71udMNZKpvZSWPZ4JH2cdXTdE/dZautGLL4wt/Cc42Coi8iOo
 lxbfevijWcYfhofNoVCHybJo8tFth8zZZiRH+RNpz5oSw5X+68chdL+Hvc4E5L3LBneM
 Cfr+209RyvzIoUqB6/u9dQp/q4Pjtb7SFa+rQCpCSj321qrtWJjzbAlzr1/wvpaUnzRc
 qZTNUbFWlsMCvG01CX5FbpOODlva0mF5HOnR4iE47fNy1QZGXFs/XCt/XXAed47glHpO
 pihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uZyX7beYR1/8hPTlA0f9tYFKMMepz6hOSd4CeavM+Z0=;
 b=ECmyjLHlTJmH1yg648KB2utTYR8HBUeZSVsjrbP4WYkfEZaeYoH64mf19KoDKgjDuJ
 MjLBuFnDiw1jufrwD7m1ZbEBzfz0toFuRVrYHJIO+jV+EPJyvAi+yB31TxmLtBPKyVeg
 9O29ac2SiLfhgNiYt7UZ+xtPgg16ImsS5sbFU/B43f41TYV5AdyhHSkyTl9zoVwWaWSq
 iWnJHvDlcWaXpJs4ePjjB+pc44UMt/7LPXu0WM8yt5Ota9pd0evb2dbx2Rbe72aWo9lh
 rdXzmj3qL9fmIptWTjhpoNq/e1iLJBzkbYoKst0SscAuh4u1NkjgScfcoQXG3QfevOsX
 faUw==
X-Gm-Message-State: AO0yUKVomabBLXwApX/099Bxbrq/jnWPdAOvUL9/opU7HBI+pi06dOSL
 kgnem9fU02AX4WMAGkf8WZgxzJZQVNeowhCJ
X-Google-Smtp-Source: AK7set8tRCs5K37T+TRrODXDevwery3AdR/K0e67cRTo6LkNBrReWC7kTZTQi5NFVVLfRt0qX9MM7Q==
X-Received: by 2002:a05:600c:1656:b0:3db:742:cfe9 with SMTP id
 o22-20020a05600c165600b003db0742cfe9mr14904890wmn.34.1676047066785; 
 Fri, 10 Feb 2023 08:37:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003df30c94850sm8496952wmc.25.2023.02.10.08.37.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:37:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/11] hw/isa: More housekeeping
Date: Fri, 10 Feb 2023 17:37:33 +0100
Message-Id: <20230210163744.32182-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Trying to clarify the ISA API.
Most patches should be trivial enough,
so not much to describe here :)

Philippe Mathieu-Daudé (11):
  hw/intc/i8259: Document i8259_init()
  hw/isa/i82378: Rename output IRQ as 'cpu_intr'
  hw/isa/i82378: Remove intermediate IRQ forwarder
  hw/isa/vt82c686: Remove intermediate IRQ forwarder
  hw/mips/jazz: Rename ISA input IRQs as 'isa_irqs_in'
  hw/sparc64/sun4u: Keep reference to ISA input IRQs in EbusState
  hw/isa: Reorder to separate ISABus* vs ISADevice* functions
  hw/isa: Un-inline isa_bus_from_device()
  hw/isa: Rename isa_bus_irqs() -> isa_bus_register_input_irqs()
  hw/isa: Use isa_address_space_io() to reduce access on global 'isabus'
  hw/isa: Factor isa_bus_get_irq() out of isa_get_irq()

 hw/hppa/machine.c       |  2 +-
 hw/i386/microvm.c       |  2 +-
 hw/i386/pc_piix.c       |  2 +-
 hw/intc/i8259.c         |  4 ++--
 hw/isa/i82378.c         | 19 ++++++-------------
 hw/isa/isa-bus.c        | 29 ++++++++++++++++++++---------
 hw/isa/lpc_ich9.c       |  2 +-
 hw/isa/piix4.c          |  2 +-
 hw/isa/vt82c686.c       | 16 ++++------------
 hw/mips/jazz.c          |  6 +++---
 hw/ppc/pnv_lpc.c        |  2 +-
 hw/sparc64/sun4u.c      | 12 ++++++------
 include/hw/intc/i8259.h | 10 +++++++++-
 include/hw/isa/isa.h    | 27 ++++++++++++++++-----------
 14 files changed, 72 insertions(+), 63 deletions(-)

-- 
2.38.1


