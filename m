Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBE4C0232
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:44:42 +0100 (CET)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb5V-0003vu-E8
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawC-0003KH-7c
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:04 -0500
Received: from [2a00:1450:4864:20::629] (port=46942
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawA-0006rQ-F0
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:03 -0500
Received: by mail-ej1-x629.google.com with SMTP id qx21so45965275ejb.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYCWkHPOuJ94dyXJk+F5NkE0t29yoLIYoBmG6Tsv8gE=;
 b=mMND920gbBSFh5hlh3ginXE4RCrmnvdYRTb01TeSCZVmti3zvyEM48RqppHxnGdkF8
 ErKcQv7j3DGy/qygIMTSuu/ul1Fl9XIe0aLgKmsVDTogqZ4s73FSLcSnOzxgaxlRdaXI
 GXrmAvnV9/uvHJ24gasLXaeNNXxfJO+6GT6ZUXmZYAA4E0TsEQ9oeoVbvZALH2dxovXv
 P8tYeMMIGtMrpZMnPvBHT8MCBY9RcMGAcSYBI4ElYZ0FMMV3gQdPRF0tICWTD+jPcntG
 OEsd+iKijAFi4c4Pb4MuDgX8y220yXfO2o7ymivByFLZeVmpKARVDnD4Wze2SZBhnEtv
 Eziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYCWkHPOuJ94dyXJk+F5NkE0t29yoLIYoBmG6Tsv8gE=;
 b=CYrq4J5Xq2ZR3ypeR+6nUf1CPr4T8bGnXzgvCScbgFB4bTOY4Mwd90p2Qyw37V5S8J
 5n9yIqC/OZViaWIt/n2b00I+l/dWgSWsbhhbFfj1pPXbSOK4Zw/SeMGfWXneWk0bCIVF
 yLm+0DSikZ34CU6oqHigd1RvZtsvyVumEVEiS/P3DPTUQ2QakKK8sSooG4zXEi+CrLwE
 x035UtMYh1Dk4f20EHmhrr66OruKljnWB9sNyFLZf23xahR1iNzfPnbxgyjLKMJeDkCa
 Zro/kGjXj2BYZEvne8ieWCBWUYgkv1/Oy3AtQDz7ONSvS0DMGRegnxcqM+/zeABqAIZ4
 3GmA==
X-Gm-Message-State: AOAM531CY09EUXVq1Apc0qZcV/6HJ1KEnVnXIEnBVyDojH1p1KJw8aNT
 KfPIcOvLGAkmPdhV5Tsk7bbJFNKyQ/g=
X-Google-Smtp-Source: ABdhPJx1WBzPMIXxUEWCq9EBxHTbmwNI0AlyDgHzDKfW345MwcH9pon4k5BF4Oav2uJSFLKKiE1ZbA==
X-Received: by 2002:a17:906:2608:b0:6c9:b248:4dcf with SMTP id
 h8-20020a170906260800b006c9b2484dcfmr20054080ejc.320.1645558500929; 
 Tue, 22 Feb 2022 11:35:00 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/22] hw/audio/sb16: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:33 +0100
Message-Id: <20220222193446.156717-10-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/audio/sb16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 60f1f75e3a..2215386ddb 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1408,7 +1408,7 @@ static void sb16_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq (isadev, &s->pic, s->irq);
+    s->pic = isa_get_irq(isadev, s->irq);
 
     s->mixer_regs[0x80] = magic_of_irq (s->irq);
     s->mixer_regs[0x81] = (1 << s->dma) | (1 << s->hdma);
-- 
2.35.1


