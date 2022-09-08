Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA685B2726
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:49:45 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNWy-0002Wj-71
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOn-0005Vp-2K; Thu, 08 Sep 2022 15:41:17 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:38863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOl-0007DG-BT; Thu, 08 Sep 2022 15:41:16 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1278624b7c4so28967130fac.5; 
 Thu, 08 Sep 2022 12:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=knGOKFS2756lg9un0i8XENNl/xbiU4W5WHHiAwpLrxk=;
 b=AX4S6/xlYLC+J9EW2gdT28IxrQYPRBzw3sTEw8cCG6xDIcRHRueISMkuw8QSArK1q3
 jtHwNLqN07w7PfsJd+8MDNfM4fjuOOkON9zaeIXakLiofPdNnS55up9h4ZBjJliqQ31q
 vG0yX6kHROtgxMPQZ9jBN9rYHK9SRIDhDCRtpC670UWfctrROOtAt1sZm8CcZsJceS+u
 LgWUmRcPM0wzLMNeXVVkLcDNFAIG8UpV9oQgiVIuI3V22sqtZYhG/j+fWghZOojJyGN/
 D7CGZoX+AUbEm7uwssKQk0nTS5D2Tixx7+GU/0Tn84TOqEKkAS95SbqJJUwr2CwuGFUh
 BzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=knGOKFS2756lg9un0i8XENNl/xbiU4W5WHHiAwpLrxk=;
 b=ul6hQEUdKWPWaNcczp7xKvaBFkiZcVAlSl8lo2bSrzIgEzLL7ZRfwL4OG/jF0wr3hw
 rPEeWNp6H2Uun7KPUxK7v8pcn+MDKzKrqjBPv3i6W6NH0+C7/HvmWXXq0O0LgcrWy2ni
 QExHfyHPotQZ8T4IIgalWcBz5jRHQm5FEftjTFPrW1wxDOH5ii/aD9I+rlSkL4JsfV1c
 iKJfvigO2uoiYNEsoGN/1lpgCpZrAv48uUtQRQoedbMYtHs39DNZOYLVe6aKQvI9meEG
 K9m1XcP2qz0HfRBJkG7oDRQ2RizmHe9CeEsd+n4jOYtJP4BM3eDBAF+XGHOKJFGKcLBv
 MhzA==
X-Gm-Message-State: ACgBeo3ODZG/BUC+KA321n9zopR13tC+b4XqLDiJF1a92/nRLn/NQaLD
 /LNNMd5oXXsUOOVBSlad+PtduGDeUWyaaQ==
X-Google-Smtp-Source: AA6agR5pFoVlo8BD/b2buGykXcrgupFfFhj40rggGk0amWnFcw4/1TNACTRUkLYQaSR6k5m9PaTpJw==
X-Received: by 2002:a05:6870:538e:b0:112:49fd:6753 with SMTP id
 h14-20020a056870538e00b0011249fd6753mr2933064oan.62.1662666074107; 
 Thu, 08 Sep 2022 12:41:14 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:41:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 11/14] hw/riscv: set machine->fdt in sifive_u_machine_init()
Date: Thu,  8 Sep 2022 16:40:37 -0300
Message-Id: <20220908194040.518400-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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
 hw/riscv/sifive_u.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e4c814a3ea..b139824aab 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -634,6 +634,9 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = s->fdt;
+
     /* reset vector */
     uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
-- 
2.37.2


