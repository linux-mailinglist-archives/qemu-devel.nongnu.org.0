Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CEA5961A9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:56:57 +0200 (CEST)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0oD-0001fT-12
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0T6-0005FQ-NL; Tue, 16 Aug 2022 13:35:13 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:44835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0T2-0002Zx-S6; Tue, 16 Aug 2022 13:35:06 -0400
Received: by mail-vs1-xe29.google.com with SMTP id s129so10821597vsb.11;
 Tue, 16 Aug 2022 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=c4DO02fMggKj77kLQLbQjKWFx6/+KdtQ2bkm4VISnXU=;
 b=FWj0QfX3a5RSyBxUd4rRa2SoDCrhhLYuYmLS37E4rG5twEvz5Zwu6ITldaZVqcA50b
 lJPoNBMUL1Sl73H8Iw1wHmOLv4C4uzq1qBq5zeMQ7RuJT8CoHfxSNz9yJJYkJ/shY21N
 l9206ciXH41hZBWFXtc/KoakNqq9JM0uAAEeHPoUPIUYdYKQgoYMvnW4QfiN1mPSkgVp
 q1/4mwbRYXY4C78eEW4Wsxcz/Ko2byCYJZZOOZAmibski3xR4Cpa/fnPaOG35HRX/Oqy
 LVXjn7hXJ5LiPwDc8A+nZx/grtY0ZaM4Z9+JgCuwWSJjttf9ehq4dYCZPtUjXijB0Vaz
 5Xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=c4DO02fMggKj77kLQLbQjKWFx6/+KdtQ2bkm4VISnXU=;
 b=J6q5pXk5brPePRPFea5cI/GNbdRQJN3yQS079XV3Gl1wOYtkRalBJZxHfm9iMrsdWi
 uAARxV/n7H1ivbvpdy+LlvMAGBvzfH39wkgd3msfiDUqT9CX30Gpovt0D26y3V4LspX3
 Op/8nLwZVstQdLUQyqzjCrkYfzjmmWfnAoMC72ktwnFYT9uI8dfGq+U2W3LXR8VHvZJR
 5Z3FIwrxMpcMwg2wVIjlfgWAjp6f1QUZAS2rxxx6RqEXKcjpAkxjZ++EnEWvxSTgnZh1
 y11KcovLsuwOxMwexCZwm/pjde6uI9NKpg/IEPJtzFK7MdmkG3lK/vuaOuFn5CdDFe8i
 h0uQ==
X-Gm-Message-State: ACgBeo3B55LTbMaOsC4qtqj37R6S6SoYzBpoNJVoEkr8gMgJaRVr/p5u
 i/+bbknQzujxiscwgt5xd8CYwxbc8cvumw==
X-Google-Smtp-Source: AA6agR6a+Q0jTNAkaFTeGVky9JT+gQ0LsXghOTOL8eGC1O6p+aOsWTlt4CaBHLCBVhWz83NenyramA==
X-Received: by 2002:a05:6102:3313:b0:388:505d:3860 with SMTP id
 v19-20020a056102331300b00388505d3860mr8787563vsc.24.1660671303386; 
 Tue, 16 Aug 2022 10:35:03 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-7.2 v3 11/20] hw/riscv: set machine->fdt in
 sifive_u_machine_init()
Date: Tue, 16 Aug 2022 14:34:19 -0300
Message-Id: <20220816173428.157304-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
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


