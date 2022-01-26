Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6389149D356
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 21:18:46 +0100 (CET)
Received: from localhost ([::1]:47680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCokf-0004ZP-HK
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 15:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCogy-0000Ap-KE; Wed, 26 Jan 2022 15:14:56 -0500
Received: from [2607:f8b0:4864:20::230] (port=46654
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCogw-0005cU-Dj; Wed, 26 Jan 2022 15:14:56 -0500
Received: by mail-oi1-x230.google.com with SMTP id y23so1718029oia.13;
 Wed, 26 Jan 2022 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vgs4ZRYoFMEPHstEvbl7Jw7UVg0M4T8VJNHyCHZmMaQ=;
 b=jfvxmjk8jy1SRAMiNma+ZrOPabR6eNepIdAj5NxM5rZScxtsQUxuICUjoEg59GtTfo
 s/w82zoWak3tbEKRYN/oQ6EIao8kFArplxnLUJRj4YPqnDyTh7DaDjQzwKhNnipc7k5r
 V8M4Ne1n60Uuggd2sql8V2g1HugzkHGDmagMU/+UASKZCa4Zqj5wy83Lm7uNT/yv8NXa
 S0ZMGT3KPr+D5vplcl7poqsHhqXEldWUZOT0fGy4PXZLf3IcEG/yJ+rb7UxAKUBqPdyU
 VaShVSH9/MzDTBMg6v3vhZl/fdvkYOoGIotWpJLY/+okW/mT0No1ei1LCVBeF8sjyAk4
 CznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgs4ZRYoFMEPHstEvbl7Jw7UVg0M4T8VJNHyCHZmMaQ=;
 b=oCdnzykL22GO+amjH0EnTUdiPc4N3VmYCk5cAHJhsat6AKeUMaEcE43EE17Me1ACNV
 dZRtXjWB+JseWeSj6EQzaMvfLiGuUwG6drDnmEayZJLoEKMO9R+g43zm0gWi3mycYaSW
 cxcYTySHrFJwPWU6U3mUs/E3bKzeBGLRLYhlcSmvLr2OgbEGZ6REDC0ykGu2+LNfVYEe
 f3POCvb72egWQGZbmd95VUcQVHw15/9k3wy6nwuz/qrzd2YgUZLolZjCsfhUscoZLuv+
 dmu/qQORwud4UD7fjf/cIgNMbM70CUpjBh38eR8JQexwknH40u1apy37EMuDPDl5s362
 HPEQ==
X-Gm-Message-State: AOAM532ksuJSlzxVkLXxQj/gvZiRKgdhm77NNyszu/h8fn9GT4QJV5SA
 lco315ODH75KjG/kF0bijbcKT76EvHw=
X-Google-Smtp-Source: ABdhPJzheed6FQpLe/nTUgSuhIdo5L+N3jRE79Fy7prL71YOoi5ja6WjIxclvX89qkoVrdufvuuNVw==
X-Received: by 2002:a05:6808:ecc:: with SMTP id
 q12mr4985886oiv.118.1643228089090; 
 Wed, 26 Jan 2022 12:14:49 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id s11sm5587021otq.69.2022.01.26.12.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:14:48 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] ppc/pnv: use a do-while() loop in
 pnv_phb3_translate_tve()
Date: Wed, 26 Jan 2022 17:14:37 -0300
Message-Id: <20220126201438.822457-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126201438.822457-1-danielhb413@gmail.com>
References: <20220126201438.822457-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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
 hw/pci-host/pnv_phb3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 7fb35dc031..39a6184419 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -792,7 +792,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
         sh = tbl_shift * lev + tce_shift;
 
         /* TODO: Multi-level untested */
-        while ((lev--) >= 0) {
+        do {
             /* Grab the TCE address */
             taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
             if (dma_memory_read(&address_space_memory, taddr, &tce,
@@ -813,7 +813,7 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
             }
             sh -= tbl_shift;
             base = tce & ~0xfffull;
-        }
+        } while ((lev--) >= 0);
 
         /* We exit the loop with TCE being the final TCE */
         tce_mask = ~((1ull << tce_shift) - 1);
-- 
2.34.1


