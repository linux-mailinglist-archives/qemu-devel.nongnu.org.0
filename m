Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2266A4408
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8e-0004gI-JD; Mon, 27 Feb 2023 09:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8E-0004Yi-Gm
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:36 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8C-00082r-Rn
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:34 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7228640wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BJTUsUKHk/43En4guI7CyHdqY+UTTyfFYiqMtxXnikM=;
 b=TfPqU46OtlY1ENVI/ycRtXeFytkJYoY0vOehOSwJ5WgLFUMkOmRnCzdvkmKSUoDSsq
 o2Gx2T01fUh3QxgeiyHZ0WI8u4NCTbfp8NQJw97TKwI+4HWorUhmQX2oYN0H3QVtSB0i
 dLTiV/xSsKSUPqtlvaWKxKEw1hmgj+wsSUa743Qks3WWBIZvX2G/30y6MK5UKl0l2qtb
 JlehedxEwiLnvgesbWAdwcwPkjuFS88Gf6UMG1zF7wQO6qTofVPFRx7CiJmokBKh6zIe
 w7d/gsYuRa74o4CqljXNrsdt9vt0H9meOvCJyI02cVGCeVr5/LjvHt5hyS6Sak6lB4iY
 DOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJTUsUKHk/43En4guI7CyHdqY+UTTyfFYiqMtxXnikM=;
 b=agCHT6L/l2DUbn+AVaWi90f1M9oujNwMgkPUiG63nCK9kFVFVs1u6gxlA3gr9FZLeO
 rTV0V46yOH4adXixBzXzXnKehsekLCBFee5OweWMk+AnzpEYbJBk/W+ZGcvntuftnK+k
 TCcDWnu8RXVzSi+Oncw/iCY06b8Vw9M/XwsOjiseWLkr3OD4tbGTzfevHDUdw0AKJdjF
 zAVLsq0f7klJstVlt9GmSXvc6vyUIV/pVCNWSbFucrll5/jLSoGxPD+D8H+G/29nDOvd
 z5bndjtEFoWn3H4jsOK/GBpFcGDlnu7Yt2NAq8EdsEDnni6at3IHAzwHMST8yb5qPj7v
 b52Q==
X-Gm-Message-State: AO0yUKXVLH8++JkH0sPbXieC3dDTTWIc8fObUXuqm3fYiXSqOQaFJyWY
 LCVodDVu+L0lveyGMP8Gqzsf7BaiNJANqq3P
X-Google-Smtp-Source: AK7set/ZwSKrkLUY9bVnI4XaREGHUuVxbMeG+OlySEDu18b5oEuNV6rEvht+lYjhbq90N8rfWLamdQ==
X-Received: by 2002:a05:600c:3b26:b0:3e9:b2f2:27a9 with SMTP id
 m38-20020a05600c3b2600b003e9b2f227a9mr13356251wms.14.1677506728026; 
 Mon, 27 Feb 2023 06:05:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d6a41000000b002c70a68111asm7320528wrw.83.2023.02.27.06.05.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 045/126] hw/i386/pc_q35: Allow for setting properties before
 realizing TYPE_ICH9_LPC_DEVICE
Date: Mon, 27 Feb 2023 15:00:52 +0100
Message-Id: <20230227140213.35084-36-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Bernhard Beschow <shentey@gmail.com>

This is a preparation to make the next patch cleaner.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_q35.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 7137c38846..d949f2efc1 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -235,9 +235,9 @@ static void pc_q35_init(MachineState *machine)
     phb = PCI_HOST_BRIDGE(q35_host);
     host_bus = phb->bus;
     /* create ISA bus */
-    lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
-                                          ICH9_LPC_FUNC), true,
-                                          TYPE_ICH9_LPC_DEVICE);
+    lpc = pci_new_multifunction(PCI_DEVFN(ICH9_LPC_DEV, ICH9_LPC_FUNC), true,
+                                TYPE_ICH9_LPC_DEVICE);
+    pci_realize_and_unref(lpc, host_bus, &error_fatal);
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              TYPE_HOTPLUG_HANDLER,
-- 
2.38.1


