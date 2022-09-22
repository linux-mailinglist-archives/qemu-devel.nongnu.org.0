Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121FB5E69E3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:50:58 +0200 (CEST)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQLg-0007WN-DR
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1obObA-0007IU-Su
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:58:48 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1obOb6-0004q1-HC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:58:47 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so2604572pjk.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=g151PNUk/a7LItKdEKf8ohvN14x9wEGJ63ngSuCRrTs=;
 b=lp+HtylerCpz/IeNCAbBRVXtE+ErX4XtARqbs2RaW51KBZTyg2RzPYKEqMV4ZJy3Jc
 t5ByBij5u06ZHE50WcQcVA2l+jYDf8RXy8d76fSUDGbzDb3X6xf52TT1zozEoo/VBDRJ
 kx8R6QEtojNPs+NLRBa9/fC9WUai/RDkPy/oycyzBcAQUl7u8gvcu3ki8IIUcAunMaoF
 FnvmCZoDBqZkZ4tiWqO4DSlDSoPrwf9CazTLdW3T48RMONzoSGb35tOpTXdrz1lBOWd5
 eqqGzO4ISubFDeN2wUBY235i37STo+TKJprhlv2v88c+Du7Z+lQPWj3t1RNHxKqDlLJv
 yoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=g151PNUk/a7LItKdEKf8ohvN14x9wEGJ63ngSuCRrTs=;
 b=RROQlcufmtGtjdda1dE0z9yBW1qmzPHpXjFPu7/4eWPRZNHQRAhyZjoeSgrn7lWscj
 eALeYS4W4ZZcK+ofyki3Zrr3wl9r/1a+S+4hqulERDy0lZHSxvlLIw94vMG60JB1pWuI
 WgqqbuTaIJDzh4EuetJ+ATbwBirLTBnyPb7koMoIxvVd9jU27DnWfzI8LOiaKU0FDpL6
 4QtBW7MVxQbz89T05k1TG1DFuOBrk8bko9aMfM/NZ9a6dQv7s7N0oGOJotEY3yHjUtjQ
 K3fB/0g3eaPrdaU1apJ/WExb4TGbKt2meLNEBtkPVUKxoXaqH/l1VJZgkkRt9PAxdE+A
 105Q==
X-Gm-Message-State: ACrzQf1O8lDsyyHH2wRRrzRSmrvmYe9UKMX/JBGNFI8UzGAt+x3LNcuO
 VwMZiTQcJKUPzEUvg334BqvXS2NVnFt5JFnx0bKSbA==
X-Google-Smtp-Source: AMsMyM7k+Pjy9zyPYsm+CL8pUTCbA004XssRLXx+IaSBb286JrhOIlw666ulhwKob+jzQlo/1VnzHFSGCWCSRvaoAE4=
X-Received: by 2002:a17:902:f604:b0:172:75a4:33ea with SMTP id
 n4-20020a170902f60400b0017275a433eamr3848235plg.7.1663862321849; Thu, 22 Sep
 2022 08:58:41 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 22 Sep 2022 08:58:30 -0700
Message-ID: <CAB88-qN7Uz-W-UQY1SZA2XZ7cNQPKCxCVcangrveFvxuBKdfrw@mail.gmail.com>
Subject: [PATCH v2 0/3] Implement the Opentitan watchdog
To: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=tkng@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series implements the OpenTitan Always-On Timer device, and
includes several fixes/feature additions to existing devices.

The memory map used for reference can be found here:
https://github.com/lowRISC/opentitan/blob/217a0168ba118503c166a9587819e3811eeb0c0c/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h

The main components of this patch series are:
1. The OpenTitan AON Timer device itself, and an associated qtest.
2. Fix a bug found with the sifive plic device.
3. Adds support for writes to mtime in the Ibex timer device and adds
a qtest for it.

Tyler Ng (3):
  hw/watchdog: wdt_ibex_aon.c: Implement the watchdog for the OpenTitan
  hw/intc: sifive_plic.c: Fix interrupt priority index.
  hw/timer: ibex_timer.c: Add support for writes to mtime

 hw/intc/sifive_plic.c              |   4 +-
 hw/riscv/Kconfig                   |   4 +
 hw/riscv/opentitan.c               |  21 +-
 hw/timer/ibex_timer.c              |  98 +++++--
 hw/watchdog/Kconfig                |   3 +
 hw/watchdog/meson.build            |   1 +
 hw/watchdog/wdt_ibex_aon.c         | 405 +++++++++++++++++++++++++++++
 include/hw/riscv/opentitan.h       |   7 +-
 include/hw/timer/ibex_timer.h      |   6 +
 include/hw/watchdog/wdt_ibex_aon.h |  67 +++++
 tests/qtest/ibex-aon-timer-test.c  | 189 ++++++++++++++
 tests/qtest/ibex-timer-test.c      | 178 +++++++++++++
 tests/qtest/meson.build            |   4 +
 13 files changed, 953 insertions(+), 34 deletions(-)
 create mode 100644 hw/watchdog/wdt_ibex_aon.c
 create mode 100644 include/hw/watchdog/wdt_ibex_aon.h
 create mode 100644 tests/qtest/ibex-aon-timer-test.c
 create mode 100644 tests/qtest/ibex-timer-test.c

--
2.34.1

