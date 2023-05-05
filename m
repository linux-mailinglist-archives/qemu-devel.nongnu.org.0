Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E96F7A5D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:06:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtw-00059J-Gu; Thu, 04 May 2023 21:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujts-0004oV-P5
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:20 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujti-0007fb-8t
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:20 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so960522a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248768; x=1685840768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0X8g131CVFq/pjT+ErsV8dyrgFnoRBEg/6IUxaJk6ls=;
 b=ORB76+x5Oes4m/e49uVa1Zrh82qgY1We3nN223kVEAdrwARfWhNaBoYevGAWkpe/5C
 oYLQX3eQRu3xbpdItiajTb2EWAPrBk1IT6qA1rD/+/K118Fj8J/+6crkvqcH2yZgIn0x
 zgJjS+d3oBseWUk9NFk2/j0Q5iWyfUz5nuqsU8Z9twy/QdXScu0GkFs7VH/3uIkjB/6W
 s5dxVFvv39ZQKpXK8I5kahOkrirX6nr+9BFJkNoi4/DP/Km8sCgNpx5MuccTMH6BenDN
 LU4gevYP3O2aPEmxKA5439HLeNqFiGsfCgWEqWGfptgRkQKaJMwcneKNG/2wldaW5U4z
 M/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248768; x=1685840768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0X8g131CVFq/pjT+ErsV8dyrgFnoRBEg/6IUxaJk6ls=;
 b=lzD1rkoI2I6bFO2wbDPPMxrdYmIHRYsrLy92WflQytzbMo2Pf7VVtWvPC0eNFJ2sBx
 Ig7BVZaKnSEvYLzJpNBDNxM4KlXs1ecyo6y/E0385j7Pu8xURMtiOroRHXPPiLTti7Oy
 tFrews3ASzaMXztK5w6ZHLdJbGQvdX632ZLEYndAcRwfOZgwU70sUBvOzXFtSKjUDIBs
 DIvlnCUq1UJX17YdvH0nX8G6yrWpbQR2Nuvh2MVrrspAbVwEjoeqK5ThF8NLrBEo4pGl
 rmySCeJ8ZGQCtcY03UgQx5MTBYdzqv01S828sigxvm1BICA+l+gbXS8lsoC6ur2QWWj6
 aJEg==
X-Gm-Message-State: AC+VfDzesTafR4fKhYOe6Yprp2KYdteBn9Zzt87WCXu5AKVbzdSpVtXy
 SJqt/sd8rO6MUJ6SZWCccUT/DJr7SvB2Tg==
X-Google-Smtp-Source: ACHHUZ5ldR+D09E5oU+fwo8dL2+8v91uPEPfzqRqA9K7JTQaDJPKailCIp9R6mwk9aueSPNewg3ikw==
X-Received: by 2002:a17:902:ab83:b0:1aa:fdab:24a5 with SMTP id
 f3-20020a170902ab8300b001aafdab24a5mr4776539plr.10.1683248768100; 
 Thu, 04 May 2023 18:06:08 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:07 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 50/89] target/riscv: remove cfg.ext_g setup from
 rv64_thead_c906_cpu_init()
Date: Fri,  5 May 2023 11:02:02 +1000
Message-Id: <20230505010241.21812-51-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

This CPU is enabling G via cfg.ext_g and, at the same time, setting
IMAFD in set_misa() and cfg.ext_icsr.

riscv_cpu_validate_set_extensions() is already doing that, so there's no
need for cpu_init() setups to worry about setting G and its extensions.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-19-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1ecb82bb5d..b005bcb786 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -403,11 +403,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
-- 
2.40.0


