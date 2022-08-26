Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECEA5A2956
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:26:01 +0200 (CEST)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaHY-00034b-6u
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4V-0008CJ-Cd; Fri, 26 Aug 2022 10:12:32 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4T-0003zt-UT; Fri, 26 Aug 2022 10:12:31 -0400
Received: by mail-oi1-x232.google.com with SMTP id w196so2103690oiw.10;
 Fri, 26 Aug 2022 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=c4DO02fMggKj77kLQLbQjKWFx6/+KdtQ2bkm4VISnXU=;
 b=X22we7pGJG5Hy61HFQyLJ67kAxc0Lbt6tROZD5iAxekoeUh3U8LhQJMXgtGlr9bsEl
 6wX4/qaQZO27b5uvCUW3Tt630NXPxwFi3b0+wm2hspcBNNV3uOwGcj4x/C+xxHRQsz3S
 eILTT+bss5wFWXTxoVQ4EDKcHb2dgaHscfi9FT+C6/ws/nTy37q7hl9GAjaMu8DQxpYQ
 ocQgTDV6FS7lGRhuzLx/E3iCIQCpOoeJEX/96SnaWxE+Ny1R7uoJ3WYHhbiY+Bl2JwQf
 a5rhyVkLGjyijQhUvqsLTVMgH4oyxLqWjFqJgRQ/u5vZzU/DfR01S02NTx3P2XirV1wi
 n/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=c4DO02fMggKj77kLQLbQjKWFx6/+KdtQ2bkm4VISnXU=;
 b=T+4r3Pk492K3yqINxm8dI+9Cd+Xk7SfArrVSy8Qn1oVEsLkn2vWur9ydzHRt27EEz1
 hX9IzbxmgcazPeuHnB7cLHXVpMhUM+vcRzYl0KPDFB3caBpigcEsnm/jJLogMvvCbD7V
 iyNvuXb9YBuvXjbKpEUUNi+ZGbwxOaFHWCR9xBVfXRcujaQFT5QPAKStqJQQSIL4aMFN
 9MSfM+LH/FputUwSb3G+miJm+P7vQgiCW9nELyRRjYyaotYu6x/7eCNzPVE5ec3B3wu1
 a4hmIOwe1ixjc5KGqIFCPaQEQBFcyZiG6bid8N554XkACq2yj8CaZMnBi4gbM1EWd3Jv
 9LaQ==
X-Gm-Message-State: ACgBeo0iu7yABYZwMm3o9ZzFRBkJhUBLn0tPj5LFo2GriN2TUdwvJpxo
 ieP+rGI+oakKWUtrukL3wiLEAGbSvxk=
X-Google-Smtp-Source: AA6agR7okurD3pmkxTQteYD7l+QWZDnzEraA0mCHogeG0+dRkEiBcKRuHu1FaDrI84FvgQYDSBRniQ==
X-Received: by 2002:a05:6808:201e:b0:343:6192:1e21 with SMTP id
 q30-20020a056808201e00b0034361921e21mr1725215oiw.277.1661523147390; 
 Fri, 26 Aug 2022 07:12:27 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-7.2 v4 11/21] hw/riscv: set machine->fdt in
 sifive_u_machine_init()
Date: Fri, 26 Aug 2022 11:11:40 -0300
Message-Id: <20220826141150.7201-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
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
the sifive_u machine.

Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/sifive_u.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e4c814a3ea..f14d8411df 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -634,6 +634,12 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = s->fdt;
+
     /* reset vector */
     uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
-- 
2.37.2


