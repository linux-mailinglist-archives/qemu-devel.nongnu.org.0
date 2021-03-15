Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12633C655
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:05:03 +0100 (CET)
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsWU-0006Eq-0s
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEf-0007Y0-Ne
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:37 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:39630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEd-0001ha-RY
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:37 -0400
Received: by mail-oi1-x234.google.com with SMTP id u62so19691179oib.6
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yn1M+lE2v7EuyDGAcu9RIP6tnxoaTYcb2VMIE3C3SLM=;
 b=U24q8MguD3lrzDPcT0ygbzeATl19chSf3Uz+T6xI+7+FIJDRhoAdsrWslkbcigXCko
 wSpQ/R2D1kWkwClVnfAOZb0zT5edih+WHd5ojez93+mjnVjM0FbD6uh1BJqlSzMSNMX5
 XD6F927PitOo76VVh9aJIgBXC8X9kOu+ocHK/aE7/rUlyV/32RrhHNR69OXulGcNc8pn
 +155ewB8SLjrITLPJmfYOevO09eoy1huf7ddbRlVXbWOahEa9rU/L2HI9G3qOiI2KGqL
 k460Dpiq29gP0bcDLo6xseDqvcGxidmf/rmleWmk3hs4AXe37rfLqESbbtTQg403D29L
 0sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yn1M+lE2v7EuyDGAcu9RIP6tnxoaTYcb2VMIE3C3SLM=;
 b=aw/XPctzno5236pvSnVEYVpj2tkUV2VFuWJmDm7J2Jc+a7rStWcFzHHv0ztvXjAKQL
 1RSTaXIBokl9Dd0HGkF8585VM67kzv+38Fi6tHIMzOlgVAoQeMgJAEHi7Ew2HIy6jsGs
 i2w8+WrbYjYMaZm81DTaz2aGaIkebhxi97En3H25cxlJg5MxuFADDdpc2QHsvksicdGr
 rgKZOrCDPHm2gpHpwuVxWKas8gfwT5389sprA2FUc8rGHHRUo00nmxwOjFS/zTkogxCQ
 utBd9NXy9fb13kaXTm4KRSKa3SbIPr/ufE15tUBmmVv8dMofPw7fCZYlUeysDulV5AHZ
 jkMA==
X-Gm-Message-State: AOAM530eUY9YhPnNZXMTUEZCvnXr4pM9CUJ6856seaGUfBkkFEXSey81
 UYv2SzJjhrhk0Bmf36ge+nwhGFHYZ4rPsYw1
X-Google-Smtp-Source: ABdhPJxoKdsHkpB9/EznBYr+Bu+UIAvu9mjUSWw7/yFnQ1DNR0fOw1RXWBwB0viyNy7JqeHZeq68sQ==
X-Received: by 2002:a54:4419:: with SMTP id k25mr343386oiw.141.1615833994859; 
 Mon, 15 Mar 2021 11:46:34 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/17] hw/ppc/pnv_core: Update hflags after setting msr
Date: Mon, 15 Mar 2021 12:46:12 -0600
Message-Id: <20210315184615.1985590-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ppc/pnv_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index bd2bf2e044..8c2a15a0fb 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -29,6 +29,7 @@
 #include "hw/ppc/pnv_xscom.h"
 #include "hw/ppc/xics.h"
 #include "hw/qdev-properties.h"
+#include "helper_regs.h"
 
 static const char *pnv_core_cpu_typename(PnvCore *pc)
 {
@@ -55,8 +56,8 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
     env->gpr[3] = PNV_FDT_ADDR;
     env->nip = 0x10;
     env->msr |= MSR_HVB; /* Hypervisor mode */
-
     env->spr[SPR_HRMOR] = pc->hrmor;
+    hreg_compute_hflags(env);
 
     pcc->intc_reset(pc->chip, cpu);
 }
-- 
2.25.1


