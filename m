Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEB5AC133
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:43:01 +0200 (CEST)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ2d-0002v6-7C
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuz-00078r-O5; Sat, 03 Sep 2022 15:35:03 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYux-0005Kq-CP; Sat, 03 Sep 2022 15:35:00 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eab59db71so12815399fac.11; 
 Sat, 03 Sep 2022 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jSnxKaWGWO9NSnu9m80T0E8udOWWs5LaK48wxQ12xy4=;
 b=hQM2ZWjRm8jxyHSXX0Q608SJQ/INOYPSp5V4uXWhixpdqxK1RuzmjgV+6lkhCLmxuN
 e7Hfpy39zNEo+c7fFTXK48b5eSrlGEJLqx+7p8OC8boifc5wL+9COV7G9zM2TZrPfXsR
 ZWjxnLO+U4jk20LrJYQQGDLB22cQx/Wbpdvqgv0p71mGqgEyjFu/HipCBFVYovcnXJtC
 gDA+4VP9uPP6qAZwPP5u1Nu0VSYp+pHEZ25RRZ7SK8BFfwNzr5DTxSgCKOSHzKniWmaH
 tZZM1yhsaQhCR9cx/KOHl+Kd5wAFby3kekIzW+E8EFa2B/5JjDyukr3xMNhzkMbWF2LB
 iFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jSnxKaWGWO9NSnu9m80T0E8udOWWs5LaK48wxQ12xy4=;
 b=rNODQ4XSo0nS3JeKJYwrgKed2I262m1tmTtA7aALJLE1gvsrQfbVyYY2UA8hX2MUV6
 sWZ7861NNbVhE/T1L1WLcpA9R4B4wqzQtecJxj4D3SO8Yz9QDYxFEOVNiAJrwAoHeHuA
 TPQkwP5beJT+VGOl52bS+ledKOu62H6qk5PLpBl2fklbkUQFcygSrxi4Y3m0gzZNA7wQ
 n+oBrAgC+ydV0bPjBwrzT9wXeJq5D2V6W2Iwbu/IlWAgDCXawVNuIQ7heyVE5jr+pBXY
 Y0unV07kAT+QxSO0yNfvBJ1ywWZIcWchmwfF1JlKKBUKxreUqvJtabNxRBKns8hCMXtI
 uq+g==
X-Gm-Message-State: ACgBeo2lekspJAzTrNftAUdUpCAsq7Z38dEvxcUd2KV2JFBlTFGHFxqs
 /wYsVc5mA3e+iVSmlRQV8H4LkOkudyTSiw==
X-Google-Smtp-Source: AA6agR44+UTHyZmzVCeULSnWz1QRwRFViC+rhtb9W/2/bYHuLRSOHF+scBKWsr5iRFXOKG3tRPewiQ==
X-Received: by 2002:a05:6871:8f:b0:116:861f:2684 with SMTP id
 u15-20020a056871008f00b00116861f2684mr5197402oaa.70.1662233698207; 
 Sat, 03 Sep 2022 12:34:58 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 11/14] hw/riscv: set machine->fdt in sifive_u_machine_init()
Date: Sat,  3 Sep 2022 16:34:17 -0300
Message-Id: <20220903193420.115986-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

This will enable support for 'dumpdtb' QMP/HMP command for the sifive_u
machine.

Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/sifive_u.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e4c814a3ea..07e25d0740 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -634,6 +634,12 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * the 'dumpdtb' QMP/HMP command.
+     */
+    machine->fdt = s->fdt;
+
     /* reset vector */
     uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
-- 
2.37.2


