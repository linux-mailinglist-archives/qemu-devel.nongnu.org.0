Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5574548B8BA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:37:16 +0100 (CET)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NtK-0000Tc-UT
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:37:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7NL8-0007aU-RQ; Tue, 11 Jan 2022 15:01:55 -0500
Received: from [2607:f8b0:4864:20::930] (port=38710
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7NL3-00019r-1P; Tue, 11 Jan 2022 15:01:52 -0500
Received: by mail-ua1-x930.google.com with SMTP id h11so691595uar.5;
 Tue, 11 Jan 2022 12:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZlTq0GO8CjT+ay2v9CJFIOaVGrLAOe/OcDsEgBGVBo=;
 b=kEF3v/VR20lwU0AtXvpN9JXfCZ/PyC7PGYhp7/Quy7GeI3vlBR5NqudLkasIa8qt5C
 YJ0IdA6HX24a4p5TxDugKc/O+SU3mw6Gzf64AQb3rW72p2S2QR0OGwTd40qAdeRv3d7V
 LpF5W3F4RrBfEt6EDU4hMa+hzI92Sy4ybq2PSxlv7TLZ4PcFLE0skoyqsQoH63UiLkxt
 uoEpvVGnmTgdkfERAkHxQeYOwbopMOk9JEVPKTHEs9x7c6AWs6K9W/5EDn8g4bFPLY5v
 DqzoNcJSyGMNlkZh0IWwXunQvu7z6Kq4L3wZH1VhwuDpUfxYzYRRLTS33JD6PnF257P4
 vWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZlTq0GO8CjT+ay2v9CJFIOaVGrLAOe/OcDsEgBGVBo=;
 b=jAA4Wssw4gbmzWF3iSEm0egJxVjZRDyUsIsEFL+KGoHhStrEWI/OPa2CdM3uZt3nMX
 lwXK72ctcSUMOlRGP8n0K1M29N9m4hzHpLD2fNqNzBR62b0ufgV69FwvMpk0vMMTAdQp
 meXxwx4Gbkw2/iU4sYLMHjPZcyPMsR49GHykY/kpS6vFKU7y8zBQGCnIc/O3AT71E7wY
 TTZXVkyYnKL2bvHjMok1moelTNjqp2KDNRK1NI8BdIQApshPARdmxnWVoiiu1CXsQ+TG
 TBfDUPEZ6sYJp3mlUMY6Ipf2KVEXOqeykxhGKpGH4AdMrtSmaOm6J5JIHaPo8OJWfk9Z
 1W0g==
X-Gm-Message-State: AOAM530L8OEKtI4eyJVyrl72Wcy6+F+8eu8Yrf3DLusFSrq3N1jREFHN
 I/hrOD+WMaYCi/qk7P7ZxA1TW/PF2DRcXtxw
X-Google-Smtp-Source: ABdhPJzyt86pysnG3rgphD6QqHim/qTDuR0a8z65nd5sixXUgVb09plbP2HjfjulRCTajtxYvDde1g==
X-Received: by 2002:a05:6102:c46:: with SMTP id
 y6mr2841099vss.53.1641931303681; 
 Tue, 11 Jan 2022 12:01:43 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id u33sm6430734uau.7.2022.01.11.12.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 12:01:43 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] ppc/pnv: use stack->pci_regs[] in
 pnv_pec_stk_pci_xscom_write()
Date: Tue, 11 Jan 2022 17:01:32 -0300
Message-Id: <20220111200132.633896-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111200132.633896-1-danielhb413@gmail.com>
References: <20220111200132.633896-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pnv_pec_stk_pci_xscom_write() is pnv_pec_stk_pci_xscom_ops write
callback. It writes values into regs in the stack->nest_regs[] array.
The pnv_pec_stk_pci_xscom_read read callback, on the other hand, returns
values of the stack->pci_regs[]. In fact, at this moment, the only use
of stack->pci_regs[] is in pnv_pec_stk_pci_xscom_read(). There's no code
that is written anything in stack->pci_regs[], which is suspicious.

Considering that stack->nest_regs[] is widely used by the nested
MemoryOps pnv_pec_stk_nest_xscom_ops, in both read and write callbacks,
the conclusion is that we're writing the wrong array in
pnv_pec_stk_pci_xscom_write(). This function should write stack->pci_regs[]
instead.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index be29174f13..a7b638831e 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1086,39 +1086,39 @@ static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
 
     switch (reg) {
     case PEC_PCI_STK_PCI_FIR:
-        stack->nest_regs[reg] = val;
+        stack->pci_regs[reg] = val;
         break;
     case PEC_PCI_STK_PCI_FIR_CLR:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR] &= val;
+        stack->pci_regs[PEC_PCI_STK_PCI_FIR] &= val;
         break;
     case PEC_PCI_STK_PCI_FIR_SET:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR] |= val;
+        stack->pci_regs[PEC_PCI_STK_PCI_FIR] |= val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSK:
-        stack->nest_regs[reg] = val;
+        stack->pci_regs[reg] = val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSKC:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
+        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSKS:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
+        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
         break;
     case PEC_PCI_STK_PCI_FIR_ACT0:
     case PEC_PCI_STK_PCI_FIR_ACT1:
-        stack->nest_regs[reg] = val;
+        stack->pci_regs[reg] = val;
         break;
     case PEC_PCI_STK_PCI_FIR_WOF:
-        stack->nest_regs[reg] = 0;
+        stack->pci_regs[reg] = 0;
         break;
     case PEC_PCI_STK_ETU_RESET:
-        stack->nest_regs[reg] = val & 0x8000000000000000ull;
+        stack->pci_regs[reg] = val & 0x8000000000000000ull;
         /* TODO: Implement reset */
         break;
     case PEC_PCI_STK_PBAIB_ERR_REPORT:
         break;
     case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
     case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
-        stack->nest_regs[reg] = val;
+        stack->pci_regs[reg] = val;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWADDR_PRIx
-- 
2.33.1


