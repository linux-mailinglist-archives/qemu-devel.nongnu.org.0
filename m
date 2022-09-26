Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FA5EAEB7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:54:54 +0200 (CEST)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsJh-0005Ee-OH
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4o-0008Ep-Jq
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:33 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:37443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4m-00029m-0M
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:30 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 w22-20020a056830061600b006546deda3f9so4922292oti.4
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ozDC9a04ZCGETBJqu69PyFI6JbnzTsgup1wMXc7FuEY=;
 b=Hhs77T4W9Wwzc6GJny1Dg9LtqI7mTNqF5jwJKsevBEzo2sbvfW3WlOr+ha4Ko9wV/F
 xRLJFxC2u8NqzITGkm5NNuufDN+iSQMsk0GcwbJma7Gbmr3SFBVKOkX+rtbJ+c+ZhQFo
 kARcRQVdZb1IIu6R88NTLDVPbVO0VRkjyiNNPVBitT2muwIT7qiKdN/SXPuDLoS3ruGs
 BQatYkhSak2Mvu3MZO9zQj7GU057cJQM4orJ5ewstm+yuxPx1kU/ITey0ZSw4We5a8hI
 gSoQ8MoOmxMe5u/GPkPt5x8FwpU66fW8ARBJmc/V9ugfPTUScG+hp02uK9WFrqe+GC49
 B0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ozDC9a04ZCGETBJqu69PyFI6JbnzTsgup1wMXc7FuEY=;
 b=FD9LjpDnC3BATD3yhL68ScnvaGSbczFzNzFoRF788czdbdKKeTVVJRW9Z88/rYtEAq
 B8zAVD/MWV+rLgN74X83SNf66e+HR3qLVwuvq8M3q0COkHKZap28QtBgxjuJWPA6+BMS
 vplEnsvgEN1IgjoFdP24DNuej2KBvAebzGz6cxSlGqikr0OKvn5pjc5zPK2GJB1PESI2
 2Sddp6TaLEesGXJdcRHOzQoA3WAXoPvGD8PhvdNS1qcO7BWJQO7w8vVvmaQEeIvFYWgA
 KqpmrzV3T5hg910xKII2GCJfC60qrITgyJDtV/hF1eKNFlgYmAP7wVpQr+pRdqBg2MPo
 JnqA==
X-Gm-Message-State: ACrzQf0fZUg2agH9duw76DbhRSNYSjsJQRQLDDIgSWvHbx4HciXEmD5X
 L83//0XtTOPe91QLkGX/NL1DeWYBqYY=
X-Google-Smtp-Source: AMsMyM5HKeQrdAhu1C817AAcXgnclc0eDeRQ87epjdnDhp/brEJZmq/Iv4s+Gag/S3xjDdxfR01K9A==
X-Received: by 2002:a05:6830:2706:b0:659:de15:2cae with SMTP id
 j6-20020a056830270600b00659de152caemr11005705otu.4.1664213966468; 
 Mon, 26 Sep 2022 10:39:26 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v8 12/16] hw/ppc: set machine->fdt in pnv_reset()
Date: Mon, 26 Sep 2022 14:38:51 -0300
Message-Id: <20220926173855.1159396-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
2.37.3


