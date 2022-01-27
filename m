Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9B49E259
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:27:38 +0100 (CET)
Received: from localhost ([::1]:54262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3sH-0002Jy-O2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:27:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD3ng-0007VR-5x; Thu, 27 Jan 2022 07:22:54 -0500
Received: from [2607:f8b0:4864:20::929] (port=34744
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nD3nZ-0000t6-L9; Thu, 27 Jan 2022 07:22:49 -0500
Received: by mail-ua1-x929.google.com with SMTP id y4so4425784uad.1;
 Thu, 27 Jan 2022 04:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkOqBW3yfuSaTTuyjWEPxNIEP/+ntD0dBDZnoKFoWdY=;
 b=HmFz2DyeqKnxKfCZv1M5OJFbRbQwPvqGAJhAsmzbFcCGhyCVbWtUgJyeAPB3k/tien
 1RtrP0leGEIpp8opuh8kV+11geyLheRQIbcw0u5tY+G0rzeLijjLhJkhQfXXjkMN9jcR
 SZIrRcKk2cqg+VivNK+xq+q4FNg/TeBM4JwU+7Mp8eoUbb+0pzYWfEjWeQdBLpLfrUb2
 RiGZtCbOP3aNxl1TWhYfs6Zo/hKoAhvl4Fq920MTKcTl8lWopghMuaAjib6ZAdpx9G5d
 joBhzcogmxKrLVw/4HLfLyd89/n0RAg1a4eyNW24B7i2VSTH2qRzD/T148DsHRjVPk2D
 FlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkOqBW3yfuSaTTuyjWEPxNIEP/+ntD0dBDZnoKFoWdY=;
 b=LGKk+9R/CCf6S5bbled1MFEAdSCRD9UyCxBMTUClUzXAsbTMhyqc9DIFtYeiHqG/B7
 a6YammVuzOHZz1V0yKbJR+CBZ6jSRUiM4C136kx1+bF8Sqpd3rmIuo1MIVHzIwjGnc0r
 ltp97seyBVGqErFjsOWQcn866hJdvwKekVpk43umxL4guqJLiM7tUh0y6So00SSImogK
 zPo/lNZBXXfAV+0SW55G8TXk3XehorAshpLiHuXM1Ks6M7JbZVC5M7Tz5mRcS5/tfpA3
 nDDdwJuaJcEjljE55exA0ySoQTFYikxIzzlk7VSJrZJK7cUYtWd9vM2eodjO3GCh/Z1E
 l8xg==
X-Gm-Message-State: AOAM530p7S/527iSNj6FTLxl5SVWKp4gtSVvsTX9aVwsFGBVvN+fRvgF
 aNKb6+qfaUIQWBU3s/2s3CbQSXcs7a8=
X-Google-Smtp-Source: ABdhPJxX/20J8a8k8kV8aPYFF4k9v7dpDpWCm9jwDWD0VbpJE3F7fEg5ZNeV8n38goS2sdiheDqgkQ==
X-Received: by 2002:a67:e1c3:: with SMTP id p3mr1374467vsl.31.1643286163951;
 Thu, 27 Jan 2022 04:22:43 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id e14sm520724vsu.3.2022.01.27.04.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:22:43 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] ppc/pnv: use a do-while() loop in
 pnv_phb3_translate_tve()
Date: Thu, 27 Jan 2022 09:22:33 -0300
Message-Id: <20220127122234.842145-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127122234.842145-1-danielhb413@gmail.com>
References: <20220127122234.842145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Matheus K . Ferst" <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'taddr' variable is left unintialized, being set only inside the
"while ((lev--) >= 0)" loop where we get the TCE address. The 'lev' var
is an int32_t that is being initiliazed by the GETFIELD() macro, which
returns an uint64_t.

For a human reader this means that 'lev' will always be positive or zero.
But some compilers may beg to differ. 'lev' being an int32_t can in theory
be set as negative, and the "while ((lev--) >= 0)" loop might never be
reached, and 'taddr' will be left unitialized. This can cause phb3_error()
to use 'taddr' uninitialized down below:

if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
    phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);

A quick way of fixing it is to use a do/while() loop. This will keep the
same semanting as the existing while() loop does and the compiler will
understand that 'taddr' will be initialized at least once.

Suggested-by: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/573
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 7fb35dc031..466b834f0f 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -792,7 +792,9 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
         sh = tbl_shift * lev + tce_shift;
 
         /* TODO: Multi-level untested */
-        while ((lev--) >= 0) {
+        do {
+            lev--;
+
             /* Grab the TCE address */
             taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
             if (dma_memory_read(&address_space_memory, taddr, &tce,
@@ -813,7 +815,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
             }
             sh -= tbl_shift;
             base = tce & ~0xfffull;
-        }
+        } while (lev >= 0);
 
         /* We exit the loop with TCE being the final TCE */
         tce_mask = ~((1ull << tce_shift) - 1);
-- 
2.34.1


