Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3236E694262
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVnY-0005Df-AJ; Mon, 13 Feb 2023 05:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnW-0005DW-VZ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:10:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnV-0003OT-Bo
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:10:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so10868042wma.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4DvDo0UQW2wHHaZyEw/ZO2I4PAch3e8r1jmccdccY0=;
 b=Vetiidoy994cgLQd8Tg0t/nVbIAPuAnoxmD5wLDLCSNAIhULpFJTVf6VNm+QCBg4VO
 yVjhNPBqqqxD2Uy+9/CtFExcLTOoRT1bw6ib3cThuRto4Tvx1cRKjJgpNzO4tWrgH+VC
 L6IpwRSEVIpdkeMzjOjf6R7fZ2YNp9Kw6mp1TtXIror4vNAiWfFJ1TVhhd8lUPvzAM4+
 oDYMYti+tSLLFrV3aKBoIyo8Q44q5PDvT0WrgiVvq/bnIt1jkZ5PYrwbdGKR8/dh8MH3
 W3RRw1ctXM095PmUIC2xsOAPSsNtxVMUNsPL997ZTG85fG3HuXPtILNu5ElakMSchJbs
 zFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s4DvDo0UQW2wHHaZyEw/ZO2I4PAch3e8r1jmccdccY0=;
 b=T9gr+Dzz1A7D6WCn7vg8ri93yUBPsPX5BsZeA+NDQIuXzZA8c/cluNVO1oY5sqGIRn
 iI+xkIi20zeoG+m3kPF6ts4WelMOrOqJmBwHfr/Ch0itbQUl90yK3WUua3AvJq47W7rI
 eDAzR+oMR6o//BSjTUz1pyHyH6lr9DplvnWjT+1Vx5Lbfbp9qOMKBormAL4cr7mv/5Dl
 Hy0Ey5oyl3ARbirDEWno8B6b3y0vqjHIMbVCoiMSjTVzmi9iJ8MdZARoVG+9hcJOBbXE
 BBg2Dpt1xQ1WkbfY76wHBJsReOEfz1fpQDKH6G9gLUR1uOEQytJIzXCd5PTEyXpRDgKg
 PGAg==
X-Gm-Message-State: AO0yUKV38DeivAOgNVgrF3SlJ1QpSVn9uYPP5CFC2gcO0YguoLwph8KR
 ps6K2fqGDowtFexFvVBahkZcYNpuWst/+9vg
X-Google-Smtp-Source: AK7set/Rq2+Dgsbbi1llXfpsSUj6YKN3z3hUSZk5BZfaOcZj8hR91AcNjnRNJwdWdtyP89BTsEcUTg==
X-Received: by 2002:a05:600c:329d:b0:3dd:97d6:8f2e with SMTP id
 t29-20020a05600c329d00b003dd97d68f2emr17865001wmp.17.1676283055385; 
 Mon, 13 Feb 2023 02:10:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c191400b003dd8feea827sm18304989wmq.4.2023.02.13.02.10.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:10:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/7] hw/net/eepro100: Abort if pci_add_capability() ever
 fail
Date: Mon, 13 Feb 2023 11:10:42 +0100
Message-Id: <20230213101048.94519-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213101048.94519-1-philmd@linaro.org>
References: <20230213101048.94519-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

If pci_add_capability() ever fail, the EEPRO100 device is broken,
which is a bug. No need to report that to the user, abort instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index dc07984ae9..dce75039ec 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -549,13 +549,8 @@ static void e100_pci_reset(EEPRO100State *s, Error **errp)
     if (info->power_management) {
         /* Power Management Capabilities */
         int cfg_offset = 0xdc;
-        int r = pci_add_capability(&s->dev, PCI_CAP_ID_PM,
-                                   cfg_offset, PCI_PM_SIZEOF,
-                                   errp);
-        if (r < 0) {
-            return;
-        }
-
+        pci_add_capability(&s->dev, PCI_CAP_ID_PM, cfg_offset, PCI_PM_SIZEOF,
+                           &error_abort);
         pci_set_word(pci_conf + cfg_offset + PCI_PM_PMC, 0x7e21);
 #if 0 /* TODO: replace dummy code for power management emulation. */
         /* TODO: Power Management Control / Status. */
-- 
2.38.1


