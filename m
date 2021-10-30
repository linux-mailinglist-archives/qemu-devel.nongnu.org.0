Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5940440AA1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:33:12 +0200 (CEST)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsEB-0005WQ-T2
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqU-00069W-Rz
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:42 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqS-0004xl-JW
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:42 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so5767225wmj.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+lo4lWzdzr3YT5nUR1jmX2J46C1ZU1vopQez50JrO28=;
 b=SIhmOttq6zsER+A3JPVIxmzkERV5VzCVks4xRjBAisqSn+gsy99kGDU7SKTCn9xYCD
 Q53xzmHc92NaMdDDlBMFPtPqYgDpTQJ/r8TkhCNG28r8o0qAcyPlBJXzxnZtbGRnKz2K
 5neJAVbjcfq9HfpxqS0BdtzBw9/Hrb6+qyVMiqZfriUx49xyyD19sCPwoZif5OXCGCaE
 YLTRCEu3tpNQXGp9sXaJqKOcixf5iqwuCptLvJofIum/kb2QUQuC1+Tmh85ew+66yH07
 IhtbksajTOhWvGX3aPYWXAAvP3JDrDz4KgbxR33DGUlJjHYTz/MyjIUU/oDKgqh+HDL6
 aRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+lo4lWzdzr3YT5nUR1jmX2J46C1ZU1vopQez50JrO28=;
 b=l/+M674X6kYdO1JynbL0kQW/rlRIv/hoXYWH7tt52Nle822LyI70Yb/dcIDWaJa6xP
 VO855BOo8wS9z+EEn+BcQhv4DD8srDxG7XcXgGqSRZmpOuliCAcmQD75e0NBK/bbDmyU
 XUa4IyR3Unx9fqJhrYyHqjf4YJZUVVktBbPaXBjKAh8vLKnPQT7fzBCtdGjhupt39VPr
 SXOWaJKLER4zsh9vNBPbMB+2s/dxoT043iusV5JbxtxoOtxjms7LzOOPw1i2KpV0mKuY
 iJN4gpBuxxl2Z6UUbbaslEGBVsXrvp1aIe9brO6ejU1uKgSRWJGmuUjnB6fQxNWGUdmg
 H/yg==
X-Gm-Message-State: AOAM532u3/Zzmxk9C8/4K3BlN0+/ba4htCrbNZd6C6/RyzTcdYj11l29
 2xjb3TZLzSm1xzgBlh/W0Tbr4pncCUk=
X-Google-Smtp-Source: ABdhPJxtAa/ij9dm68+1ZdoLGs5W6s4naaADaMW6b7gfiV/R81iFrKBBCo2oM3oAa1KqAEAP9z2fxQ==
X-Received: by 2002:a1c:90:: with SMTP id 138mr6863689wma.27.1635613718151;
 Sat, 30 Oct 2021 10:08:38 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 c1sm5831525wrt.14.2021.10.30.10.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] hw/timer/sh_timer: Fix timer memory region size
Date: Sat, 30 Oct 2021 19:06:14 +0200
Message-Id: <20211030170615.2636436-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The timer unit only has registers that fit in a region 0x30 bytes
long. No need to have the timer region larger than that.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <b1cd196cf1395a602c7a08a4f858e69e50c446a1.1635550060.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 250ad41b487..587fa9414aa 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -350,15 +350,14 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base, int feat, uint32_t freq,
                                     ch2_irq0); /* ch2_irq1 not supported */
     }
 
-    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s,
-                          "timer", 0x100000000ULL);
+    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s, "timer", 0x30);
 
     memory_region_init_alias(&s->iomem_p4, NULL, "timer-p4",
-                             &s->iomem, 0, 0x1000);
+                             &s->iomem, 0, memory_region_size(&s->iomem));
     memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
 
     memory_region_init_alias(&s->iomem_a7, NULL, "timer-a7",
-                             &s->iomem, 0, 0x1000);
+                             &s->iomem, 0, memory_region_size(&s->iomem));
     memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
     /* ??? Save/restore.  */
 }
-- 
2.31.1


