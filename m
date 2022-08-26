Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300CE5A29A4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:36:58 +0200 (CEST)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaS9-0007Bc-2C
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4T-00087j-UT; Fri, 26 Aug 2022 10:12:29 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4N-0003ot-DC; Fri, 26 Aug 2022 10:12:24 -0400
Received: by mail-oi1-x235.google.com with SMTP id r10so2139081oie.1;
 Fri, 26 Aug 2022 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+tgSxhNIGYEobQmCYPQhC6Jsb/JEojThXZIWNcaw8QA=;
 b=Dr6ruIKObcmYu4vMgPp12YaJro/dezFjmJOondjL1JrY/VNYcpygq5Woxy3K1flMy4
 ujlBtbPJjT27jmKtCv4i8PRps2kRUqYvf+tp1GPfYGSukK0BduP2s5KrHDy/FLRV4CoN
 OoAlKUfjsiZElWr8FTQPfOvCcDnsbCIZYeddvnhj0fMwbhHCriCYqpG/JuoJr+UGmVr2
 UCulrN60ev2jg28rPI0+i+TYJPMAJiWUJY/mkTQlhxHWO6H4Hp6xP0txfx4CFDH+wsyO
 2L18MuWeOqkh8U9R01RKOpfTa0ynQJOo7pvRU56OUzc5Kbi71wzPZzvqja5S13gyh7Im
 o7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+tgSxhNIGYEobQmCYPQhC6Jsb/JEojThXZIWNcaw8QA=;
 b=Ue8CUO1yTHm31znfiiQuZRrlA4dcE8CB5BRDSAOdvVLd7d2pf4qyyInO7t1+So5cCl
 QR1sc5XzlYnq3H/x7jo24Rm3632RpV/v5JWIsfCm03+UJjxT/fKN1thvkeNp8Pi9NqO/
 UPjKs2SEMgezctbTjr/IapZbd49hCugFEJc88TzhQpzZAsoDCbtoct4Wadxz5bz7bu4/
 spcwAQk9Hy78YEiHuLtEnoQGj1jarSAYbD5sOEyi8phxGC+KUCdAVZDX5ZaEJfFIwwUc
 G8oOUoHiyaazadefY8aLQ/MjwKll9iepPcltY6H4bFyCUK8p96f8tZWAI3c817MmUp3C
 5hsg==
X-Gm-Message-State: ACgBeo2ugZyR62g4ZMvL6yKEeWJ5pr5wze5yNf/q/AVZ2/7dyWn+Gy46
 zx6JO5X0OfBsYcu3QufFb+6Oj5E4+Jk=
X-Google-Smtp-Source: AA6agR5wjJqiG1cOJx8vobq//zZYTB6Ng3eAc3iEl4Fvq9YEofj7Tk+ULduKjjPTL3SIHw/o3r1Wbg==
X-Received: by 2002:a05:6808:f8d:b0:343:2d18:c866 with SMTP id
 o13-20020a0568080f8d00b003432d18c866mr1670333oiw.214.1661523141632; 
 Fri, 26 Aug 2022 07:12:21 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH for-7.2 v4 09/21] hw/ppc: set machine->fdt in pnv_reset()
Date: Fri, 26 Aug 2022 11:11:38 -0300
Message-Id: <20220826141150.7201-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
all powernv machines.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d3f77c8367..296995a600 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -608,7 +608,13 @@ static void pnv_reset(MachineState *machine)
     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
     cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
 
-    g_free(fdt);
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands. Free the existing
+     * machine->fdt to avoid leaking it during a reset.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 }
 
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
-- 
2.37.2


