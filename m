Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F71F1AFE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 16:28:07 +0200 (CEST)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiIkw-0007D8-UU
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 10:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbf-0001Lt-Nt; Mon, 08 Jun 2020 10:18:31 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbe-0004Vt-Sd; Mon, 08 Jun 2020 10:18:31 -0400
Received: by mail-pj1-x1041.google.com with SMTP id ne5so3346343pjb.5;
 Mon, 08 Jun 2020 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b5zym9cztP0wVFAPAsyVGx/rfgOEvJsGGKKcdqXM6z4=;
 b=DtTyFaKADqu8XPfj0kuUWgG4QH+kdmG4nuOmsScGoVdLEG4CsRi+YHsR7/yX9mq0Ig
 8UMj4qtjB2ricB9vCMrLYNf0yBC0dtE5LOMGNc54Hvy1wjEBhpW6B7oC9u6lzRXI13un
 KHBVMCUhZTr4nlDi3/vqNNpxWnmAkPddeAkidDUMJR+iV6pExSMR64D+lQuYhp9esPCi
 K/GKWXCHeDToS2WpLo2ELavPR4kFBg4UVR1w3I77g99JZXnGl90KZqkGjnnzWgGRRM1D
 W0quJXY65GiuhkRi10jBi/tooOtvUGkfrqN6Bo8NakM7kDvT93ORWfI63InG6UayFJ9R
 DeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b5zym9cztP0wVFAPAsyVGx/rfgOEvJsGGKKcdqXM6z4=;
 b=hYUPUk9BqknCvs0eOGji0fR6miEoBwMQU7J91VRmVOMNM3xhRISrnJBUEvcvqAN2JP
 I5ftGndlYCwlSSvyxtSs6OsCdnSTwFn9G1XDfYlBRkQAhPsJN7XVqYJ3gVE3yYv9SA4/
 zbOot0nLvXcVywL0yZ4byqUEtVGCTKXbC/shn533MRi/uzi1SKKBTXlQTilWdwAmUfjI
 YxjCGsew0j6JDrGluKr8r4kGgcC7MopXHDoTEXOCRCt8D9Goo1GGqLYi/DcctW/DLaYI
 P/S65ZoToS/7p12D5TDDKmLGNVKW8TzxSgvr9a2I477rrRVvHdcTjT4zDztNdTM9oy0D
 NeWA==
X-Gm-Message-State: AOAM530hxk1vMvvq0fe1FuA3I0s/wsAWnWmcoI9deXCkDGl5TU1CBnIG
 B5wfjOmWxLPEytCt40uHCNE=
X-Google-Smtp-Source: ABdhPJyiZNy0p5P1zSsdnj127z0w0b76y6FYU83pPRxH+hBDLe2BLFTXnRFzw01862TZofMLQkavZQ==
X-Received: by 2002:a17:90a:e506:: with SMTP id
 t6mr1039908pjy.35.1591625909280; 
 Mon, 08 Jun 2020 07:18:29 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id b19sm7292575pft.74.2020.06.08.07.18.28
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 08 Jun 2020 07:18:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 11/15] hw/riscv: sifive_u: Add a new property msel for MSEL
 pin state
Date: Mon,  8 Jun 2020 07:17:40 -0700
Message-Id: <1591625864-31494-12-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
References: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

On SiFive FU540 SoC, the value stored at physical address 0x1000
stores the MSEL pin state that is used to control the next boot
location that ROM codes jump to.

Add a new property msel to sifive_u machine for this.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c         | 7 +++++++
 include/hw/riscv/sifive_u.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 07e2ba0..aaa5adb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -507,6 +507,13 @@ static void sifive_u_machine_instance_init(Object *obj)
                                     "Set on to tell QEMU's ROM to jump to "
                                     "flash. Otherwise QEMU will jump to DRAM");
 
+    s->msel = 0;
+    object_property_add(obj, "msel", "uint32",
+                        sifive_u_machine_get_uint32_prop,
+                        sifive_u_machine_set_uint32_prop, NULL, &s->msel);
+    object_property_set_description(obj, "msel",
+                                    "Mode Select (MSEL[3:0]) pin state");
+
     s->serial = OTP_SERIAL;
     object_property_add(obj, "serial", "uint32",
                         sifive_u_machine_get_uint32_prop,
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index dcf7f3b..d82cfe0 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -63,6 +63,7 @@ typedef struct SiFiveUState {
     int fdt_size;
 
     bool start_in_flash;
+    uint32_t msel;
     uint32_t serial;
 } SiFiveUState;
 
-- 
2.7.4


