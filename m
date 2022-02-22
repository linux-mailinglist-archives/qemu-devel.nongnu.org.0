Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EB84C0294
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:59:08 +0100 (CET)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbJT-0004JS-3c
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:59:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawM-0003Pu-BU
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:15 -0500
Received: from [2a00:1450:4864:20::632] (port=44787
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawK-000759-9L
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:14 -0500
Received: by mail-ej1-x632.google.com with SMTP id p14so45963669ejf.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9gsYbLS+oFxHUewZXteoSpkAOteqQtXYimRXD0P1Ec=;
 b=CeyTrCEUZxu7JjXGW3XMN0TdC4JtPLd7GzYpQpashWeiOxSCDCKKStNPf/1yC4aVdB
 qqZIcx0HJMPLJkpvgxP5tLMMFP1AyYbmV/x6fpRhISfe8Wk3qzyg9cDIzGQ6zKka1Jlx
 kfDIiUTAdtDpciL91tCuJ98d2Cet9zN0PlSw//MxlQc1WqdRUIvXygrvPvN2LdDZxuFR
 289gtAccJ6pLT5fiJvdtc1OMN3poF2HO/CJdEb0pzNibU6a6QDbTgd6Sdw/MVs6Em7QX
 QlVrjBTgy6U78s+SE+QBsZjH0SrJlaJRErRQ+13c/TJq0dHC4+eMxOhsLv66Ha/nNIhy
 cgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9gsYbLS+oFxHUewZXteoSpkAOteqQtXYimRXD0P1Ec=;
 b=b2ABRIAhnWaI/7d8iucOjKIhOFjrnCWW3z00V6tpp/+hUNhH3Z02U2hRsdaX1cyAxf
 7AILfoDDaBTxofxK5creWkrvcjtD+sq2nIzjNxeVi5iecleoKIGrIEiMTlirkgpHyxmz
 IQ7fn/eKHG25IEaotATTlLn2EAlnesNKV0UGS909khyss/UHNkufx7QWMut4E9Brq3vQ
 4kK/lL5sQxB3YtKmA6h6FwltKKK9BGrPpPU8IEMJ3uOc80Y/LY1zhtRh/HNI0ttkcHS5
 D9ytrHfAiMkzQeZOPYZa/w2efPQ57up75NMcyF0H22qExcWTgd2RbkIje11yD+M4syFi
 waMg==
X-Gm-Message-State: AOAM530GVBLOQRa2FOX9Rl2GhQstDqYoGruRnsJf1h8Ixu8T08vaoE5U
 su0GOk6drKFWvsyXs5WinEzGlXHnWos=
X-Google-Smtp-Source: ABdhPJxV0B9ON9jtbddBSa4Rxd/5vfIQN1pKrJ3pkdGe4b+5XjK9iJ1lIqe0a2D9/0viB70s4K6sXw==
X-Received: by 2002:a17:906:b287:b0:6ce:98af:3f6e with SMTP id
 q7-20020a170906b28700b006ce98af3f6emr19629246ejz.216.1645558510975; 
 Tue, 22 Feb 2022 11:35:10 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:10 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/22] hw/tpm/tpm_tis_isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:44 +0100
Message-Id: <20220222193446.156717-21-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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


