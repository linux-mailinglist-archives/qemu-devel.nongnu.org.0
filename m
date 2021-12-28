Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0B480CDE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:52:29 +0100 (CET)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IWK-0003TH-HN
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:52:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJ1-0003p7-BR; Tue, 28 Dec 2021 14:38:44 -0500
Received: from [2607:f8b0:4864:20::f33] (port=41493
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIy-000463-FN; Tue, 28 Dec 2021 14:38:41 -0500
Received: by mail-qv1-xf33.google.com with SMTP id h5so17250475qvh.8;
 Tue, 28 Dec 2021 11:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4WZ6JNIq3xK0p0FOmEg7AUGxE7yaj6GV0bZDM+lh/uI=;
 b=lmfvFE4rZSNO6ueI3dDa5T/mVd+mLABJYVDmFZxZg8KT8dAaQDb46D7avRFAVTKTJ0
 i/UqclDDxmCsmbS+mU2R98xnoQuO6QioJPrpjG8nu4ihoi5YkHUsGY6TAlL8U3Lh340Y
 7V5q5tatoCykY/J1aW8w9Q/6xF3dlnCFRfIWD1Kr1hYVkBenGemYr3J2Cx6O3TvGs4G2
 0phTfbe20vyPuc87X6W+ILZdJwJE51se+E6eSwDLSELVFNTemVucoCbpRSEhicyljxWV
 LwLfdmndkEQJ/SynW7e33g4BRwNtX0Ux7y3DuDNmhT4sXjixEjpFlsQ5y/HTxICOwV6X
 1hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4WZ6JNIq3xK0p0FOmEg7AUGxE7yaj6GV0bZDM+lh/uI=;
 b=b7SMQwTyz3OlaWuigTdUjHY8XLo4JW2OSUfy8HofJGwU3EevajFwg80uHbkfrmLK+U
 sfBtt4liZEXkitL0gnxzAHl7HNQmsvGWTWnWChw0VpffQ67fIQzZnB0qdtvXSyI1q+V1
 AkdwKPbbuvgdEKJxVvnj5f6DMKBrJQUsOqGDMnL/i20bjwN1WWoMEXp5FYMDlbW+6W0/
 vgsy+d5cnOcPZ6gwASeJTpmo8lrXoMakOSy0OzTAmjteb0mDNu84RjNLFS/Hx3Aj8lXQ
 jZGxTPJwHsdwjxbFR/y8UhnG1f67q9/a3Fqlg+Et3eezwhrYSmr8GLn/u2ruxLqJ69rX
 dWrA==
X-Gm-Message-State: AOAM5330SIiKcf6hjb93xGFFh1L9Rh5LHicZXG3z/3/jTM+/eHMU32QC
 al8jyaCRqUatoyKbi0GyEVhaiY5lYWw=
X-Google-Smtp-Source: ABdhPJzYNxo6w5gnD/IL0awVeSeTMzIfDZJkNn+wqJ0y/YJA6JRWUQlJGS8ETDGwlmdJ+xQEuqSgZQ==
X-Received: by 2002:a05:6214:e83:: with SMTP id
 hf3mr20757988qvb.13.1640720318352; 
 Tue, 28 Dec 2021 11:38:38 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:38 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] pnv_phb4_pec.c: use pnv_pec_get_phb_id() in
 pnv_pec_dt_xscom()
Date: Tue, 28 Dec 2021 16:38:00 -0300
Message-Id: <20211228193806.1198496-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Relying on stack->phb to write the xscom DT of the PEC is something that
we won't be able to do with user creatable pnv-phb4 devices.

Hopefully, this can be done by using pnv_pec_get_phb_id(), which is
already used by pnv_pec_realize() to set the phb-id of the stack. Use
the same idea in pnv_pec_dt_xscom() to write ibm,phb-index without the
need to accessing stack->phb, since stack->phb is not granted to be !=
NULL when user creatable phbs are introduced.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 4f6db26633..56ffd446ab 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -466,8 +466,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
                       pecc->compat_size)));
 
     for (i = 0; i < pec->num_stacks; i++) {
-        PnvPhb4PecStack *stack = &pec->stacks[i];
-        PnvPHB4 *phb = &stack->phb;
+        int phb_id =  pnv_pec_get_phb_id(pec, i);
         int stk_offset;
 
         name = g_strdup_printf("stack@%x", i);
@@ -477,7 +476,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
         _FDT((fdt_setprop(fdt, stk_offset, "compatible", pecc->stk_compat,
                           pecc->stk_compat_size)));
         _FDT((fdt_setprop_cell(fdt, stk_offset, "reg", i)));
-        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb->phb_id)));
+        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb_id)));
     }
 
     return 0;
-- 
2.33.1


