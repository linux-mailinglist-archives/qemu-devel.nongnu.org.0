Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8A55B270C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:44:49 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNSB-0004xm-Gs
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOh-0005Ed-Fd; Thu, 08 Sep 2022 15:41:11 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:43550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOf-0007Da-U3; Thu, 08 Sep 2022 15:41:11 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1279948d93dso27359589fac.10; 
 Thu, 08 Sep 2022 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ec2Lo/5G8PihGWfWUwrMlKjdFfVtvxfpeHSd7ZKavpg=;
 b=dV1xQhJw/qmlnrP4gf9qXl3e0vT/+D0P2ivBi3XxguanA21TddkZIKugCEZgJdkXou
 mm9THCSa13Oq3fgUT8uqR66T1qKKOJSNO8bN1QUTJEEzEDElGWbH3MucdP7+zshuO1h/
 FnDDMj/NzP/S0ggYSF0bRlt+Ee9Dvaru5x7P4kZIYqVHocCoyIfqbha8pZ66sJQ5WFmr
 I0rfdQtS3ZQCCSWU0rPyuTYn50WzsHq7Il/bkwxZdcgNXTMcb2ZXa57MlmN6al4bnGN6
 WFxbcd0WKrI6M4R8sndVIo2CgcZt8nGsrBtPkNvL2tRDVRgtuipQYanIODETYENUijL8
 Nb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ec2Lo/5G8PihGWfWUwrMlKjdFfVtvxfpeHSd7ZKavpg=;
 b=yV1e1x9zkMqQ/PCOuuvI14ZOH4/fR9nmgC56FNIJHv+ByC8bNqmngSXxvDLD2lRLmk
 xipY/px1DJL0VdQGA/ZWfznaRPmJRsi21BmXjuizJwzHbLTVvmUUXZLH9N3D0Ih40Ztw
 8lesrjwmZBeBMAFdUcI1mM0i0fIMgPexnBzDcZ8TYrbfcpdoSIufNoTjbrDhbSF2Nia6
 hvjIQkfI3tR19jMTwv3pd223HprY/o2VXGW0ZwtnS9ALANsJ/6gjDeaH76d3sm4UZvvy
 /mxScThox9nS6pfHFBRGttWrRjCgv5oOmr/AprQerf/ARWIfkKq8JfS3AH/QhNga2Ksz
 vgvQ==
X-Gm-Message-State: ACgBeo3aut/e53J2yPIpl4MfxeZkFveIykNH2csDaJ1ZrTujvvZyndkx
 ++g5QuvaOHLgT9ZFtW+78CiCAd/sHSW6iw==
X-Google-Smtp-Source: AA6agR4bp1wZpmFcgE3q0z6F3HCRcU3Nrj/vBFdM0kQmAo3g367K60Higvr66PsWOtX65rDaKT/uUA==
X-Received: by 2002:a05:6870:8a09:b0:126:7a92:1b0b with SMTP id
 p9-20020a0568708a0900b001267a921b0bmr2814258oaq.152.1662666068421; 
 Thu, 08 Sep 2022 12:41:08 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:41:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v7 09/14] hw/ppc: set machine->fdt in pnv_reset()
Date: Thu,  8 Sep 2022 16:40:35 -0300
Message-Id: <20220908194040.518400-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable support for the 'dumpdtb' QMP/HMP command for
all powernv machines.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 354aa289d1..6a20c4811f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -678,7 +678,13 @@ static void pnv_reset(MachineState *machine)
     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
     cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
 
-    g_free(fdt);
+    /*
+     * Set machine->fdt for 'dumpdtb' QMP/HMP command. Free
+     * the existing machine->fdt to avoid leaking it during
+     * a reset.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 }
 
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
-- 
2.37.2


