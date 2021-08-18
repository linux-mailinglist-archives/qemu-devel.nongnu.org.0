Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F23F0ADF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 20:12:24 +0200 (CEST)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGQ34-0005Wd-DO
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 14:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mGQ0z-0004kl-Cw
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 14:10:16 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:36823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mGQ0r-0001uU-Kl
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 14:10:09 -0400
Received: by mail-lj1-x236.google.com with SMTP id y7so6715830ljp.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KmkbHrGwaje1cT1DuaFe3Bbut008EeTgvkTy6j5bl6E=;
 b=y7WsaqSCwymDIHrmTnLQ75UN/q3EvusbhGcWEpjvllzRBA16fjGDyhj/4l1lmCllSv
 VRt1mQbXi/Xo4Y5HSVkJGMlJwY30TGXb0tfEuiVTVSY/koW1nCT+CTwyPKeAwo8ypQcc
 CoWlTKPxuoo3/UwMj7YjCUz8CNnxHEYmbH5npfjPOoiWM9tS7dmB2XaG0MCopBp+UPEg
 U1GnsStxFxC6CEiF+0yTSwjASYVgxVzSWGHgBbs2/cqv5x2s19tvfw/ODCPkwUWADrL5
 MdP0SS2ItTbRze0lncZUQiHV+x7jROby1TNTr0QjLM7sybPvXmLzqobr5B46Js33qIRT
 KR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KmkbHrGwaje1cT1DuaFe3Bbut008EeTgvkTy6j5bl6E=;
 b=D7xXd8Z5ABpBugHefEMDXI8hUeTyLyKxuv2+AGSMyAM9uM+PEIfHAf1C+Gl42n7ZlD
 X8yIL5gjqA/y8VrW3qbG8T1zYTgv0o4UyNieRClKky8NhiSboGf2+ivNilwoZgfaIbxQ
 PkK08JBwWw5goUq+1nteZKm3fKBMzhTXhv0i07OtOGtHh90armeSMVyE77T+ZVi4qUpC
 /jsX4TTq12KdwEk1PSmQBWXd30UzO3ddi9ym5cXkUIV7sXRHc0PG1ZO1KrkTR1ANZsGF
 EI7M6UYPatqUZGgvqi0gk4ckNGeTvTwq7Sllg1cEJGCxKdIvw6k6R/3G7M+lbQvUhO12
 Z+yA==
X-Gm-Message-State: AOAM533haGTuh3zfgNEem8Kw8Qy3f1nRwyzW6YTvXxz7WuT89lAySI/J
 cFULmDtblRBZmPvN98K0fR+NTg==
X-Google-Smtp-Source: ABdhPJydc0O6Ye5tYSGwexM6v0DwuztlbamcuXhDBp8hHkgxKf01MxRR40hB+vZkCipdvCH2H2b0nw==
X-Received: by 2002:a2e:300a:: with SMTP id w10mr9065875ljw.510.1629310201857; 
 Wed, 18 Aug 2021 11:10:01 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id h17sm35249lfr.287.2021.08.18.11.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 11:10:01 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: dmitry.fleytman@gmail.com,
	jasowang@redhat.com
Subject: [PATCH] e1000e: Added ICR clearing by corresponding IMS bit.
Date: Wed, 18 Aug 2021 21:09:51 +0300
Message-Id: <20210818180951.132044-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::236;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1707441

The issue is in LSC clearing. So, after "link up"(during initialization),
the next LSC event is masked and can't be processed.
Technically, the event should be 'cleared' during ICR read.
On Windows guest, everything works well, mostly because of
different interrupt routines(ICR clears during register write).
So, added ICR clearing during reading, according to the note by
section 13.3.27 of the 8257X developers manual.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/e1000e_core.c | 10 ++++++++++
 hw/net/trace-events  |  1 +
 2 files changed, 11 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index b75f2ab8fc..288897a975 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2617,6 +2617,16 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
         e1000e_clear_ims_bits(core, core->mac[IAM]);
     }
 
+    /*
+     * PCIe* GbE Controllers Open Source Software Developer's Manual
+     * 13.3.27 Interrupt Cause Read Register
+     */
+    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
+        (core->mac[ICR] & core->mac[IMS])) {
+        trace_e1000e_irq_icr_clear_icr_bit_ims(core->mac[ICR], core->mac[IMS]);
+        core->mac[ICR] = 0;
+    }
+
     trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
     e1000e_update_interrupt_state(core);
     return ret;
diff --git a/hw/net/trace-events b/hw/net/trace-events
index c28b91ee1a..15fd09aa1c 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -225,6 +225,7 @@ e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"
 e1000e_irq_icr_clear_iame(void) "Clearing ICR on read due to IAME"
+e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims) "Clearing ICR on read due corresponding IMS bit: 0x%x & 0x%x"
 e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) "Clearing IMS due to EIAME, IAM: 0x%X, cause: 0x%X"
 e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) "Clearing ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X"
 e1000e_irq_ims_clear_set_imc(uint32_t val) "Clearing IMS bits due to IMC write 0x%x"
-- 
2.31.1


