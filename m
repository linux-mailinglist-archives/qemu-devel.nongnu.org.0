Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D837F6A41C1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcho-0004b8-9O; Mon, 27 Feb 2023 07:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWchS-0004Vr-Pn; Mon, 27 Feb 2023 07:33:52 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWchR-0008Nc-0D; Mon, 27 Feb 2023 07:33:50 -0500
Received: by mail-ed1-x532.google.com with SMTP id da10so25185886edb.3;
 Mon, 27 Feb 2023 04:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DZ4IC21cN4EEqkYPJ+LbANCivKRiX+Zc8yuBjmuGaQ=;
 b=CC1bktP+LJPs3UrSIQM7DNO/SKMFI+vqiFvC/ccuYAn8lY/zC5WyNz5YSrmJPkPUAp
 nDHdHbO6DpfLc9FRxBeNNwwiH0vfJYPqLjeMCaupHZSD539t8VTiwDNRON3NtznHDqvS
 oblyOWTet9SxBb0/+Znb4f7DIyiofPO24IsFGpr3HpvGRYAJdE9KmZ9t1nSPT6d4dgbp
 jgRgUm2laPIgI9e85WCGbVZUt3L85J9v0Qpt6IiydTv5lnLHJpN//we4wnXcFcTHEBc9
 W4cUi0tzadsFxUCV6DAdTbkDG4PS148xoIr9mKDwGgtQentgI8oTMIyUeZN7sHs2xS8n
 PAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DZ4IC21cN4EEqkYPJ+LbANCivKRiX+Zc8yuBjmuGaQ=;
 b=slq5pbUWiXPDr0iGXimUJOMN4FSlFqSbEMcwPuxlHtBMAa5sxFhvy+TjOgUfJ3aJ8q
 erabZMPQrVyfnAMW7VRtLiNYQKWPneD1yy30qrTveYl8DSBYvX2KnTprrG+l75QicxVI
 a16e2HytHZezdVfilBW84pZLkLfDhKtKjgVEpr13/R3473xLZmBwEifKHd9Xl8juTqS/
 E6qY53/sswCnisV/JVp3ng0GAz4BSmH8cxr/b/+svJtZXcL/Okib+pClGTOR8+IJ9Xoq
 d1vAM14qnqp7R4zB+B7vZYac+gJMrv8wxPyCMWO5rF2yOghapZ+tNbyFPnA1Wm50ztBX
 lZFQ==
X-Gm-Message-State: AO0yUKV/WoeCBGcojZ9NgeCaDujP7jTbqatcPHWM3lsdmW2zWFWDth12
 ajkyLodjulb5Wj9Qn1dIcu7KS6YrzIg=
X-Google-Smtp-Source: AK7set8+2+s0sU/w0B1Ah8mNoenrajOhK+l8GJDekWcgEgWAonBL/Cb4kR2iZZ4fhuCTda35oOhTVg==
X-Received: by 2002:a17:907:33cc:b0:895:58be:94a with SMTP id
 zk12-20020a17090733cc00b0089558be094amr35270535ejb.14.1677501225607; 
 Mon, 27 Feb 2023 04:33:45 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 oy26-20020a170907105a00b008b133f9b33dsm3092124ejb.169.2023.02.27.04.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:33:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 1/3] hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router
Date: Mon, 27 Feb 2023 13:33:14 +0100
Message-Id: <20230227123316.18719-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227123316.18719-1-shentey@gmail.com>
References: <20230227123316.18719-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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

The firmware of the real PegasosII board routes all PIRQx to IRQ9, so do
the same in QEMU. The PCI_INTERRUPT_LINE registers of the respective
internal PCI functions are already initialized with IRQ9 which are
currently used for routing.

Note that the PCI interrupt router isn't implemented yet in the VIA
south bridges. This change has therefore no effect until this happens.

Inspired-by:
<c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
("hw/ppc/pegasos2: Fix PCI interrupt routing")

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/pegasos2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index a9563f4fb2..41688699eb 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -268,6 +268,12 @@ static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
                               PCI_INTERRUPT_LINE, 2, 0x9);
     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
                               0x50, 1, 0x2);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x55, 1, 0x90);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x56, 1, 0x99);
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
+                              0x57, 1, 0x90);
 
     pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x109);
-- 
2.39.2


