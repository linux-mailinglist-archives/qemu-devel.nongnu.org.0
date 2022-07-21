Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109F457CFF7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:42:29 +0200 (CEST)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEYJn-0007Do-Fl
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9y-0007aO-CD
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:32:18 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9w-0002f2-Jx
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:32:18 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 p6-20020a17090a680600b001f2267a1c84so3919177pjj.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Je9MHe3VryaN6zCedh1antLmu9Mtkb1MdA1lqSJiN0=;
 b=CcqpyjxKw+grwTAk47O1JS3eeCr5Y4LI0exoFzCHM5McwNFNBFCFb+yfRlhF8ZwIzR
 l0p/p06yHJXVBllIoxZftzB4OIWjAdXxv+t37sVdU/cBgA3CwrV9G/7WSZ0/P4+j5TcD
 kp5riyNGUXrkEBRR/TbJc4A2ijHU6R55/BRchc6rceQzwnlZ1u1R0peVDiryinxnXhe7
 iX+PgPIPWsrtuiZlRa8IouCOqxb0tdBM0S0EZ8NPWlupgNQgP5zQMVg3mgc9WU/TVCPG
 GhhcoRT2+vHuHKZDMtI6PojnjXG3f6Ah3PK+pW5oIrf29WKHUJXv5jfKBWdd1CpGdxLQ
 sBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Je9MHe3VryaN6zCedh1antLmu9Mtkb1MdA1lqSJiN0=;
 b=fLjWmszktNW4jk8Nxu5TWddMs9KexwOlKzwUp1T5hOMdFkviCWoKlY6NpzPf/dv4Pl
 RH6QZ6qwdsJZH726dFKWg958lT9fdqjK1LvdrYwV2iiJ1a85I4a6P1KHZxwPBuH8REUr
 hU50pIg+q0gAe/Fv2wph3tWMJFi1coIRVm93rpkQ9ZVxQyEufj33H8nQM2cMHgdvwyXn
 0Kjau1w4rxytqeXpe6xFo9qiypa4bn9XIIeBxYa2yqB77Fntid4EcYcLxrObwHlz3Y6X
 oQWVWex3VMq7Srov/AVRxrXmNkjWs8SF1m1z9qNks6huLvADunMd697Zbqs0L5ICTJE4
 vsFA==
X-Gm-Message-State: AJIora/TjNw0JIO5w1ADQ7DdSxbNRYlgs1t3VLe+rR+1QT47aCTq+pho
 VJ7AZXZUmrhGLfAv4Fp5Hl6/fG+qbpCXrA==
X-Google-Smtp-Source: AGRyM1t9c7hJnB0Q0szvrtDr4ve+qDaJILgcwKLpQjDLb1SxxxLtNrM4GWF94Fbk6vCKo/XsAHd9Nw==
X-Received: by 2002:a17:90a:f284:b0:1f2:786:201 with SMTP id
 fs4-20020a17090af28400b001f207860201mr11982371pjb.113.1658417534869; 
 Thu, 21 Jul 2022 08:32:14 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([182.70.95.50])
 by smtp.googlemail.com with ESMTPSA id
 f4-20020a170902684400b0016bdf0032b9sm1814379pln.110.2022.07.21.08.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:32:14 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v6 5/5] target/riscv: smstateen knobs
Date: Thu, 21 Jul 2022 21:01:36 +0530
Message-Id: <20220721153136.377578-6-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721153136.377578-1-mchitale@ventanamicro.com>
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add knobs to allow users to enable smstateen and also export it via the
ISA extension string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db2b8e4d30..2b7ed95396 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -98,6 +98,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
@@ -987,6 +988,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.25.1


