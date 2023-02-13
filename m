Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D353694E01
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:31:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcff-00084y-D5; Mon, 13 Feb 2023 12:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfW-00083E-SB
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:11 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfO-0005NU-5M
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:04 -0500
Received: by mail-ej1-x636.google.com with SMTP id lf10so1859914ejc.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5KmASiCB+obTTVXGwbVR7k9DInJvjUYQUnuzL1m818=;
 b=SsovkVUlXzTpRbwDLwIl0Ik9Yl3ewxGRionB2FYwXuqRo6wVY7EH0M69lteR1JL1Qj
 T3xY7ahd3ZQWm1bhf2J1AFDUIRnH7jE69rLK8r84BOn7xdd8HhFobwkTUhGE3UaYMfDC
 33Jo4dDPmGzrhT96gxHwR6TlvOPkEMSSbe1kIuICc3lMG9Ni7b2C3avyU08RWgmaZhk6
 BL3QHdly5MA9PvnMXY1tdB+z3ZWX68HtKN7plqPq27MaEGB5rSIGUju96kc9LDjV7Hiy
 NAcKGa9Bk6kIXCcjUZM6b5IhwPxd1Z+nHLkfi6QCeeJVHdg53FjyGzHz7c/wotNwoeKF
 wviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P5KmASiCB+obTTVXGwbVR7k9DInJvjUYQUnuzL1m818=;
 b=o43C/PeGGUsURTfJesFQu/KlFD3oXMXw8DslY4pOUyrOH8RP+opc18tv576F6UvH+i
 T0HMl09ArEXYVOS3OMAtigZtlQG71/0rJQKt+gD7ELfZMstSgwFFd2vx5sglKJ/6Y1cI
 I7VyH8wiR937fLVDbs24sHznb+xPOvrcoLBsc/wloRTpzvJfSUafl5qpFHq5zpPKMAq5
 kAABLd6hQE1PF8TW8suudK636xK1WbE4HCJxMOVAZZdsbHItUJDhK3smajDnCnlRpiFq
 HjQBhqUWnIkSrCeym/MkUbZECm4/YDUjaYxYB1RQ9V60SBC0nwvbFBv2o4H44YcFauAe
 9xRQ==
X-Gm-Message-State: AO0yUKUi5nj+StZruw8db7sKS+B3vu62EBSTW+xtAMcN0yxLN0MSJ2yV
 Z464xicwPz3Raf2pbsW3Swk3EDqRtYs=
X-Google-Smtp-Source: AK7set+3z/SAQbnMjfH3vk9THCdCNjZknJ2ltrrKBmZwuyaOxk9vbZlTIWFL8NTMQdKlDCZ1YtG66A==
X-Received: by 2002:a17:906:a0d7:b0:812:d53e:1222 with SMTP id
 bh23-20020a170906a0d700b00812d53e1222mr22303373ejb.31.1676309460508; 
 Mon, 13 Feb 2023 09:31:00 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 01/12] hw/i386/ich9: Rename Q35_MASK to ICH9_MASK
Date: Mon, 13 Feb 2023 18:30:22 +0100
Message-Id: <20230213173033.98762-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The Q35_MASK macro is already defined by TYPE_Q35_HOST_DEVICE, so let
TYPE_ICH9_LPC_DEVICE have its own one to prevent potential name clash.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/i386/ich9.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 222781e8b9..36e0ccd16a 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -75,7 +75,7 @@ struct ICH9LPCState {
     qemu_irq gsi[GSI_NUM_PINS];
 };
 
-#define Q35_MASK(bit, ms_bit, ls_bit) \
+#define ICH9_MASK(bit, ms_bit, ls_bit) \
 ((uint##bit##_t)(((1ULL << ((ms_bit) + 1)) - 1) & ~((1ULL << ls_bit) - 1)))
 
 /* ICH9: Chipset Configuration Registers */
@@ -137,13 +137,13 @@ struct ICH9LPCState {
 #define ICH9_LPC_NB_PIRQS                       8       /* PCI A-H */
 
 #define ICH9_LPC_PMBASE                         0x40
-#define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       Q35_MASK(32, 15, 7)
+#define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       ICH9_MASK(32, 15, 7)
 #define ICH9_LPC_PMBASE_RTE                     0x1
 #define ICH9_LPC_PMBASE_DEFAULT                 0x1
 
 #define ICH9_LPC_ACPI_CTRL                      0x44
 #define ICH9_LPC_ACPI_CTRL_ACPI_EN              0x80
-#define ICH9_LPC_ACPI_CTRL_SCI_IRQ_SEL_MASK     Q35_MASK(8, 2, 0)
+#define ICH9_LPC_ACPI_CTRL_SCI_IRQ_SEL_MASK     ICH9_MASK(8, 2, 0)
 #define ICH9_LPC_ACPI_CTRL_9                    0x0
 #define ICH9_LPC_ACPI_CTRL_10                   0x1
 #define ICH9_LPC_ACPI_CTRL_11                   0x2
@@ -162,7 +162,7 @@ struct ICH9LPCState {
 #define ICH9_LPC_PIRQH_ROUT                     0x6b
 
 #define ICH9_LPC_PIRQ_ROUT_IRQEN                0x80
-#define ICH9_LPC_PIRQ_ROUT_MASK                 Q35_MASK(8, 3, 0)
+#define ICH9_LPC_PIRQ_ROUT_MASK                 ICH9_MASK(8, 3, 0)
 #define ICH9_LPC_PIRQ_ROUT_DEFAULT              0x80
 
 #define ICH9_LPC_GEN_PMCON_1                    0xa0
@@ -172,7 +172,7 @@ struct ICH9LPCState {
 #define ICH9_LPC_GEN_PMCON_LOCK                 0xa6
 
 #define ICH9_LPC_RCBA                           0xf0
-#define ICH9_LPC_RCBA_BA_MASK                   Q35_MASK(32, 31, 14)
+#define ICH9_LPC_RCBA_BA_MASK                   ICH9_MASK(32, 31, 14)
 #define ICH9_LPC_RCBA_EN                        0x1
 #define ICH9_LPC_RCBA_DEFAULT                   0x0
 
-- 
2.39.1


