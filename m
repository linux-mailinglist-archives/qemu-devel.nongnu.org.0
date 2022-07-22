Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D857757E7E6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:07:44 +0200 (CEST)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyw3-0005SA-Tm
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyov-0002sD-D0; Fri, 22 Jul 2022 16:00:21 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:33622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyos-0005CN-9b; Fri, 22 Jul 2022 16:00:20 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so4129079otk.0; 
 Fri, 22 Jul 2022 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ix0V0IY8A5Ri9rM6kmEs+/lX0f+nUh1CsW4T8Bh8oSg=;
 b=HrAoja/x6XtOQtqYXUvC6Qr/Fibby1uPdEpUHqCEibqwb26QnWWdANUsgo1pHd/Tpz
 G1nkKX6Roe6BlY1mRa622mN4ny3Apr90Cn2nYYLFSq/4gKHoGG64E4sTg6DA/3XdLwKx
 NRdpdC9WkvdTS85dbJ8yJyZCmWBOtyYY6FtMnhAD1m91TTXFVf4/00s6jnpc+MpNCcO7
 r43nUOFAMLijnbb1vjrXSSj5GglIvmo4rMp9BAxhHNHZ0dgv4aPvEfidpj4OLhOaVMGX
 ljTCdLJRAFCPuj4gfU42IEnUzt9JvfxztXV+hVhp6SKLExCqfz3v8xS7PFfDHPLsQo+w
 WjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ix0V0IY8A5Ri9rM6kmEs+/lX0f+nUh1CsW4T8Bh8oSg=;
 b=MQdT6nKuH4Ig1mmBhDOYCj6GcLVjdPVMgU6zCd0J7fk+T4dmgv4UxuF8DBzF8G5Req
 aCO9DLRV3cSN9Se/a9nsOIHtRDP5IqbCeajXqRsJTw2jLTsV1Cy7QYquJpCPZ7ZaAmMj
 UGA1d4ibKG97QgaPZfCjCK328PfAs6AWwbLV4GNapeKYEp+CmFIH/VtH1G4wThFiSZV8
 A2gnrHUMlWgG+wMDTU8WcCAHs/mwesetL/aliBpkkDUH3ZTK5yrecC6i5g1hbWN7BgqO
 RrjFPTiO3pbYpakxLNW6kQj8FzEujuW2Py0Y7ZnctmyC6mwelIouykvprEcNkS/dQPnu
 pN/w==
X-Gm-Message-State: AJIora/iQPzacaht0Igei2GQpYMtNURG82Vc5N81HZzn8gdz3iPHwupJ
 8pERzkROz8qSrrrUkZykwp09oQmVJJ8=
X-Google-Smtp-Source: AGRyM1skiz4jsQfHCuBJS/SEh2zktbueTIinurDQIjutZY3RslonQe9irbHYhmh9eeHGw2F7/JYiSA==
X-Received: by 2002:a05:6830:43a0:b0:61c:c25b:eb88 with SMTP id
 s32-20020a05683043a000b0061cc25beb88mr641398otv.111.1658520016882; 
 Fri, 22 Jul 2022 13:00:16 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org
Subject: [PATCH for-7.2 02/10] hw/ppc/pegasos2.c: set machine->fdt in
 machine_reset()
Date: Fri, 22 Jul 2022 16:59:59 -0300
Message-Id: <20220722200007.1602174-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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

We'll introduce HMP commands that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..9827c3b4c2 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -329,6 +329,9 @@ static void pegasos2_machine_reset(MachineState *machine)
     g_free(pm->fdt_blob);
     pm->fdt_blob = fdt;
 
+    /* Set common MachineState->fdt */
+    machine->fdt = fdt;
+
     vof_build_dt(fdt, pm->vof);
     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
-- 
2.36.1


