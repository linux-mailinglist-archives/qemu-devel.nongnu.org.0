Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56CF5AC829
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:44:44 +0200 (CEST)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzIB-0002pt-H8
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9I-00072t-L7; Sun, 04 Sep 2022 19:35:32 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:42943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9H-00057L-5Y; Sun, 04 Sep 2022 19:35:32 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-11f34610d4aso17994330fac.9; 
 Sun, 04 Sep 2022 16:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=knGOKFS2756lg9un0i8XENNl/xbiU4W5WHHiAwpLrxk=;
 b=Yz3/XZKLUcWKh1DQHNk6pW+kt/790wvHxytTy2EFmHymDZ4eeCOiwn385M9Q/bA6hh
 PfNPyenLIbGduexYBOpmRPL71u6p0O/HsBngzzxF+apoInNi/7vpXO2xGseJiKns/wlj
 lwtaGMXxa8z/mtal+ntq16K+ulgwZT26OZwLPJupWzKsd0z2FFKuLZDhBmBZ626Sof8K
 Xu0ycw4VMT7U7kUBgNfkpKBIWFlD4bmv1fk2gCU5LwP+ztRIKgQ27yCCLGtR1ysMDJZQ
 FBtKkMJ00Z6xoavZmcVJLR0x316aYpZAd3TRxWpYB1dgqpDxo0gRJjJ4ECDosIBhYZtV
 Z+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=knGOKFS2756lg9un0i8XENNl/xbiU4W5WHHiAwpLrxk=;
 b=Ktix3XOcafBs2BUjrKG5Okod+KbLv0zluzYV8VqE+4PRJxxtCAbfNWPd6bszpQvLs8
 Z9Yyq3mEr5ivWvK3kx1AmlEUUCW280ZWffJKiuuZS5rIRTlEyWlJf+4TKiWEKHiEwrDL
 ulcSMl5nUEWUiVrvuUbTO6cf7arBi41C1vjhGIEK1xRgMQeVqhUvJFs8nMGygKqYGHVH
 4XEpzMqv4OtYJAP3j4kNRfzS+BNSiDcNGWKaSgQBas5QrPbSzqc3AwbOdTKZeCW88aXI
 6exGqwMj0hwpcOFC4jHwOnCpvusDwT8NZ32TOs4g+pJVPUOU0hjull6WyS1QTPPjNnFu
 keoA==
X-Gm-Message-State: ACgBeo1WAWm/It2XZz7/LtTxYwgF70L/i+3fVUD185BF2GkljZsTsOVp
 /jV12UQ71sR2bJA+gTmWWllsYY6RVI6UtA==
X-Google-Smtp-Source: AA6agR7duh7ztBkn0VxgQd6pZKwKsKmDY3fBNekO1B56eaKBrf8gM3LnZU9TkOvDFXT0hKCM0SmPBQ==
X-Received: by 2002:a05:6870:349:b0:f1:928d:c803 with SMTP id
 n9-20020a056870034900b000f1928dc803mr7496754oaf.19.1662334528405; 
 Sun, 04 Sep 2022 16:35:28 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 11/14] hw/riscv: set machine->fdt in sifive_u_machine_init()
Date: Sun,  4 Sep 2022 20:34:53 -0300
Message-Id: <20220904233456.209027-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
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


