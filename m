Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293E35AA508
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 03:28:08 +0200 (CEST)
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTvTb-0001v6-7H
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 21:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0l-0000TO-0E
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 18:50:11 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt0i-00057c-En
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 18:50:10 -0400
Received: by mail-lj1-x22f.google.com with SMTP id x10so578974ljq.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 15:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=pK0T5K9iLXIRmFjx2HXck4xniY+enuaxvAUkjGmDIvo=;
 b=tLe7gtDJL2FyJFwyz2SQ6WWUgfKINm5aYoaEWyP7/1nc2F+2y5q+fyPGr55kw8Ku20
 olveg1gnjRCinrrNJe7brqrm3UWboWjjqadoQIfkct1lEKt1C8XdFVqXdoZdxYaVrtSO
 /88xIcjQat4uNS2F401KIIyb1mmJqSkz2L2akvzDnfFPjArjRO0fFSPRPDaF65qtvEp7
 M4X8Y7jbs71IS7rokVcXNNN3OiywsGpAa9vgJZCSaW7WVLIfrbIjqsiTXkUcUgGcJxRo
 QPMV1ybcOlpStzFs3XKo3Z6QMhNiayVrHCVu6NQaz807PO1WybKTQT4u82Xakz/TP/UM
 A+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=pK0T5K9iLXIRmFjx2HXck4xniY+enuaxvAUkjGmDIvo=;
 b=vvpn1RTO1BNYb7G53Oys9GzmnWTEA7YzZFyYVBGm22knvknsxM2M1+mmpIZCfxXPpQ
 oWDWT8VexQ1dzyDeqvyh7a7T6kPHklJI1En0iAIJhWFCHaChlWU4ccsQW1k5BJkFRxba
 H/8EqPHYT+3ePMRffCYWAxlP45ydlmmf5ls93KXp0axswSCpjuYUFlCnkgd6NiMMOJlO
 2GhzRAWu88+f1pCWYI68GmYRQbuEJYCyFIETrLlEzrUAPAFwisHe8JrKefVBYVsQNhXs
 B2bmVqPnqNKqSmoCyD5BCNlo8IFLFFvoN2jydIwniSzclOJhXW4Gu0Wl1ct7aQGRMXfy
 lH1w==
X-Gm-Message-State: ACgBeo0s5nfZ1qY8Go3VHJrDVskjs4ST5GW0O7+j/R0Wnf8BNEdUDw1k
 O1lCK6bp+tu6iecuhpMoMb6ZPnK82Xp5gSrMhu8k+g==
X-Google-Smtp-Source: AA6agR7xzKWIvioV08tqobb46/NnS7VAEpzXlXsxf+6KPEd3UTuipn1KztX5of5LfdEeyBK/FxjcU1AfSvHysHtHz6U=
X-Received: by 2002:a05:651c:b0c:b0:268:dae4:9727 with SMTP id
 b12-20020a05651c0b0c00b00268dae49727mr528372ljr.526.1662072605864; Thu, 01
 Sep 2022 15:50:05 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 1 Sep 2022 15:49:55 -0700
Message-ID: <CAB88-qN40Z+M-jZaJ11+zRF=qa0j8rGttW1yAx3=t=27ne1tYg@mail.gmail.com>
Subject: [PATCH 0/4] Implement the OpenTitan watchdog
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=tkng@rivosinc.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 21:22:28 -0400
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

This patch series does three things:
1) Adds an implementation of the OpenTitan Always-On Timer's watchdog
functionality
2) Fixes a bug encountered with the SiFive PLIC device during development
3) Updates the register addresses and adds support for writes to mtime
for the Ibex timer

(2) is necessary for the bark interrupt to work. (3) will bring the
Ibex timer up to spec.

Tyler Ng (4):
  hw/watchdog: wdt_ibex_aon.c: Implement the watchdog for the OpenTitan
  hw/intc: sifive_plic.c: Fix interrupt priority index.
  hw/timer: ibex_timer.c: Update register addresses
  hw/timer: ibex_timer.c: Add support for writes to mtime

 hw/intc/sifive_plic.c              |   2 +-
 hw/riscv/Kconfig                   |   4 +
 hw/riscv/opentitan.c               |  22 +-
 hw/timer/ibex_timer.c              | 114 +++++---
 hw/watchdog/Kconfig                |   3 +
 hw/watchdog/meson.build            |   1 +
 hw/watchdog/wdt_ibex_aon.c         | 432 +++++++++++++++++++++++++++++
 include/hw/riscv/opentitan.h       |   9 +-
 include/hw/timer/ibex_timer.h      |   5 +
 include/hw/watchdog/wdt_ibex_aon.h |  67 +++++
 tests/qtest/ibex-aon-timer-test.c  | 189 +++++++++++++
 tests/qtest/meson.build            |   3 +
 12 files changed, 809 insertions(+), 42 deletions(-)
 create mode 100644 hw/watchdog/wdt_ibex_aon.c
 create mode 100644 include/hw/watchdog/wdt_ibex_aon.h
 create mode 100644 tests/qtest/ibex-aon-timer-test.c

--
2.30.2

