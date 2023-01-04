Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E265DE37
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDB54-00038n-9f; Wed, 04 Jan 2023 16:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <azoghby@rivosinc.com>)
 id 1pD8lf-0002a2-Di
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:45:43 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <azoghby@rivosinc.com>)
 id 1pD8ld-0006k5-Dk
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:45:39 -0500
Received: by mail-pf1-x429.google.com with SMTP id a184so12717833pfa.9
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 10:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jFCiBqiFRd74CyBLDrcmTBlgbMkmwC6NDoQgRZga20k=;
 b=o7QyLBOwsiqkNdU6eBGEsPLRVAUIOVt7GtqYbkjQgmXg1OrumCOPNSSDtn0hTD9+/n
 TqjSJ6pi4xYG8iVSXC+HVOxqCtokuW5DupUWXIVg3TSkOa2tNru9X5dLEvyEDYNJ1EPI
 uRKttf7ptoIufqUtf9grdGuPXgaW2KYCyTT9GEPPoGo3/UfmU44R8TNn+Kk5hJot9Y/Z
 Y79DdHzur0cnjj6ZMQnId/QrVVAQh6wGuZXOMzsiISG0zZYmx41YkL/Knc+H1zySNVwP
 4vWw6rcYG6JiZW+GkMT2CSi6OSAo1COYiyDXwmsgtyCdR2TQVELbr25hoaYNt3TZdKdZ
 e/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFCiBqiFRd74CyBLDrcmTBlgbMkmwC6NDoQgRZga20k=;
 b=vho6HgxdmWLdgpJveNFTZXGikrmpDug71cG3PS8XW3+am4ZIOOidaOwAmHE5spuLv2
 xfrXjhXRTDJjgy3QGWWwthH8LbGL0qmqMTo9cSBqaGamRrntSUnw94ugDntoXBSA2Z0w
 EgSW1tA/GTYAezGE1RwVsUsk/iUK/GYH1Qtbr4st4G0v5pfzT7Rev4WhWcRPDx9s0BuY
 pWM+eqiy7M2mcbndCl+Z+7AGqkWckRghl8GipD4oUt7BCH5rgz/VPQeeInOMWj/BkWY3
 d0HN2B0HGHKKIBAaU3JAJ/7vo4O/8G5xsG+tjpXi4YWZDoLyOMhC8OqqLD8uERnu5jsV
 xWLg==
X-Gm-Message-State: AFqh2krSDzlXgj6lVkDxTgwHMIsbkpf8QmxRgMwHUMH0jykRFwdDahqG
 mHU0ZCBqES3WytCw4SeuYwcYh6p1KzJXUdo=
X-Google-Smtp-Source: AMrXdXsahJ0xQzyK86yCCbVyZT5ilRku1v5Q48Orld6b7vidOFEM66Q78km0Z1yHp79yf2xILeitog==
X-Received: by 2002:a05:6a00:a1d:b0:581:73c4:f0bb with SMTP id
 p29-20020a056a000a1d00b0058173c4f0bbmr37826719pfh.2.1672857934348; 
 Wed, 04 Jan 2023 10:45:34 -0800 (PST)
Received: from azoghby-Laptop.hq.rivosinc.com ([50.221.140.188])
 by smtp.gmail.com with ESMTPSA id
 h4-20020aa79f44000000b00572c12a1e91sm1550956pfr.48.2023.01.04.10.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 10:45:33 -0800 (PST)
From: Andrew Zoghby <azoghby@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Andrew Zoghby <azoghby@rivosinc.com>
Subject: [PATCH] hw/timer/ibex: fix register addresses
Date: Wed,  4 Jan 2023 10:45:15 -0800
Message-Id: <20230104184515.96895-1-azoghby@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=azoghby@rivosinc.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 04 Jan 2023 16:13:47 -0500
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

Change the register addresses to match
https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table.

Signed-off-by: Andrew Zoghby <azoghby@rivosinc.com>
---
 hw/timer/ibex_timer.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index d8b8e4e1f6..a8a23b22d7 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -38,20 +38,19 @@ REG32(ALERT_TEST, 0x00)
     FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)
 REG32(CTRL, 0x04)
     FIELD(CTRL, ACTIVE, 0, 1)
-REG32(CFG0, 0x100)
-    FIELD(CFG0, PRESCALE, 0, 12)
-    FIELD(CFG0, STEP, 16, 8)
-REG32(LOWER0, 0x104)
-REG32(UPPER0, 0x108)
-REG32(COMPARE_LOWER0, 0x10C)
-REG32(COMPARE_UPPER0, 0x110)
-REG32(INTR_ENABLE, 0x114)
+REG32(INTR_ENABLE, 0x100)
     FIELD(INTR_ENABLE, IE_0, 0, 1)
-REG32(INTR_STATE, 0x118)
+REG32(INTR_STATE, 0x104)
     FIELD(INTR_STATE, IS_0, 0, 1)
-REG32(INTR_TEST, 0x11C)
+REG32(INTR_TEST, 0x108)
     FIELD(INTR_TEST, T_0, 0, 1)
-
+REG32(CFG0, 0x10c)
+    FIELD(CFG0, PRESCALE, 0, 12)
+    FIELD(CFG0, STEP, 16, 8)
+REG32(LOWER0, 0x110)
+REG32(UPPER0, 0x114)
+REG32(COMPARE_LOWER0, 0x118)
+REG32(COMPARE_UPPER0, 0x11c)
 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-- 
2.34.1


