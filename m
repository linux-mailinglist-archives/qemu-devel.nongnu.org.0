Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F00A4C0077
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:51:34 +0100 (CET)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZK1-0007k4-3p
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:51:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7h-0004Au-M3
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:49 -0500
Received: from [2a00:1450:4864:20::52d] (port=44697
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7f-0002rZ-TS
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:49 -0500
Received: by mail-ed1-x52d.google.com with SMTP id x5so38626750edd.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9gsYbLS+oFxHUewZXteoSpkAOteqQtXYimRXD0P1Ec=;
 b=hEzmFYQ5g8Vrs7Ktqe7Ca4+D+WTHxYYSeoBoLfP2WtPDEKoG+QXwtqePsOmOWwuh0Q
 50cCXq5+dMWQYaZyLq0y52ydM4vOU8SnD6ANEal2wAvkmOjXTeQQ+VqqtNXEWGhty7dH
 rjHKvVYROilALaIAuItmNqCE0vHIVIHB/oQDitaEyGSu5kiYgb5PqO9glYp2cBRhmDqr
 ozKoTYPSZwJy9/7bAx5jT6inFOAsvpuUF15rhkaPW9HZMnfdnkhLLxqthUdpsclLWi00
 f+IMMydC4g34sVCF95ZGXAjQcVuBNabNDewkw+CUNGRqFctulr/7KmdeiFrb01MIVt/h
 G+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9gsYbLS+oFxHUewZXteoSpkAOteqQtXYimRXD0P1Ec=;
 b=c+isaEAJ16LmnmQcISu3ZJj29/qFDRrDvUqb0Iw6S2+EXaDJEfOCprmzTeaTKkiKEx
 5PWb1PXszwFfBXK+0MIEqwI8l9PSKeG6HO/bKar/t/wF54FUAjKgDYUdDf+YXOE1nZO4
 pDMbLeIbcaOd3myl7uHpRR1f8zcBYmEmI5Ur29B8XqV8YIm7ZA52otBIjE1MewvKt0B8
 mE/Osd/sYWmfS5Q3nmkcvmDcBTDujAxobBTbRbAuXC1F8wTJQ3yAi+5Fe5ENT9CrdBRF
 33mGKMt+KpKlTDYqQyO6O8wOgi/cqEWljXBQqB3xjsjSkmmby+QdbBFIuMZQS5BH66N2
 MeGA==
X-Gm-Message-State: AOAM533G6ugdYt+XpoGJHO9EZrIucaK55Pie9pECAI8U/arkZrahYzk0
 BCn7qfQhGc1vATEkqdUNw2aq4a2gYcQ=
X-Google-Smtp-Source: ABdhPJy5DcxRKCsKsRiBPIpWMDh3nFvKZzwe73HhKgU2/mpyfGFodQct7+m6BEe8muYNp4nRRukG9Q==
X-Received: by 2002:a05:6402:2751:b0:412:d64c:fa65 with SMTP id
 z17-20020a056402275100b00412d64cfa65mr18181213edd.204.1645551526532; 
 Tue, 22 Feb 2022 09:38:46 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/22] hw/tpm/tpm_tis_isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:17 +0100
Message-Id: <20220222173819.76568-21-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Bernhard Beschow <shentey@gmail.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/tpm/tpm_tis_isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 10d8a14f19..3477afd735 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -127,7 +127,7 @@ static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
+    s->irq = isa_get_irq(ISA_DEVICE(dev), s->irq_num);
 
     memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
                                 TPM_TIS_ADDR_BASE, &s->mmio);
-- 
2.35.1


