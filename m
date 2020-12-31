Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639B42E8285
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:53:30 +0100 (CET)
Received: from localhost ([::1]:53986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6oz-0005N0-EP
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lJ-0001D1-Rb
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:41 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lI-0006N0-E0
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:41 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r3so21064445wrt.2
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dbQcqp+ljH9dixNyANVfZXDH8+4pVph9oe3JUeTn5w=;
 b=KTkMcdaLQ+M+6Ujn+w8NnLe6S5cMiDheHSv5aKm6zbRR4jXPap3Aks7r2G383Y/PXa
 4LGFww/mf7y96WMTwJXDMoe/iz2LfAIlu/ty5PSiF5EgY49r8MWFVRPhRlf2YlvOeKxw
 SAZhQcU9Dtzyeiv/xzhO1ACYq/iugoh5QP32MIZpDyVf2vPRWNHiaB7XxU9x+1E9Ok39
 2kEKchFOMTC6YxuzpBg3TIkbV3VQoGO6J3JchDFerNW4e5Y/BBDrsDhSD4VzYcPGzG28
 Yhh8XkBcjt/9f4KtMKUaOA8ZEaBXVQfTu/YYM8lS4iW2fLseOecllO1xo3hbnlonHCQg
 4dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9dbQcqp+ljH9dixNyANVfZXDH8+4pVph9oe3JUeTn5w=;
 b=spvZSR/gIQ9/d+xpJvFfaaT5rEqgiAi325tC7cg1Fit03c1oX9vDdpoPgkXQyYTy1+
 ETffCRxOXk+tLFemH7YgPbn+5ZJQpSHEzQjc7uNgr6PG6c+nmgWsc7H/T9Hm2O9HCF+M
 t6GMQ8p+3nASkFEIxASjD0dsUVtqZu7SuDTNV5W6zKah2lvKzT/i3UQOobkuj73pfML3
 9ycotz6m6bjdIjP2iG36guHvPi4LanTeehaid5bk7soNNzAlHgNSYE1cwnvICAGJ/wM5
 h3OQjfdIes9iz6L7ZeU8exbRt/P0xCi6jgm6+V7JhTszhUzgmczCRq4OG9e95/aMFh6s
 KhgA==
X-Gm-Message-State: AOAM530KwD9KzK1L1t731JXF6KWTCS+bpB/Tv7kRSU05oPNx8fw21moD
 0JhpqL++RoMeCByzOZ08rReaaqYuzdI=
X-Google-Smtp-Source: ABdhPJz2XQ//XEm+IRLh1Rvisu6ftnBMqMOTpVRXTV/2Ql2zgghbFzJkvhvddkkYz5IjAIKtbtrYFQ==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr66744461wrv.397.1609454978926; 
 Thu, 31 Dec 2020 14:49:38 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id f14sm14235284wme.14.2020.12.31.14.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/18] hw/pci-host/bonito: Simplify soft reset using
 FIELD_EX32()
Date: Thu, 31 Dec 2020 23:48:58 +0100
Message-Id: <20201231224911.1467352-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index fe94e6740b5..104c58331d0 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -244,7 +244,6 @@ static void bonito_writel(void *opaque, hwaddr addr,
 {
     PCIBonitoState *s = opaque;
     uint32_t saddr;
-    int reset = 0;
 
     saddr = addr >> 2;
 
@@ -277,13 +276,12 @@ static void bonito_writel(void *opaque, hwaddr addr,
         s->regs[saddr] = val;
         break;
     case BONITO_BONGENCFG:
-        if (!(s->regs[saddr] & 0x04) && (val & 0x04)) {
-            reset = 1; /* bit 2 jump from 0 to 1 cause reset */
-        }
-        s->regs[saddr] = val;
-        if (reset) {
+        if (!FIELD_EX32(s->regs[saddr], BONGENCFG, CPUSELFRESET)
+                && FIELD_EX32(val, BONGENCFG, CPUSELFRESET)) {
+            /* bit 2 jump from 0 to 1 cause reset */
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
+        s->regs[saddr] = val;
         break;
     case BONITO_INTENSET:
         s->regs[BONITO_INTENSET] = val;
-- 
2.26.2


