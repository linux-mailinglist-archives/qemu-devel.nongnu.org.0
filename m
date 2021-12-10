Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D18446FC13
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 08:50:45 +0100 (CET)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvag0-0002h0-H1
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 02:50:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZb-0002RJ-CR
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:44:07 -0500
Received: from [2607:f8b0:4864:20::52f] (port=33280
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZX-0007sC-Uq
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:44:07 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f125so7415816pgc.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10G0n8QECL+Lz3MENuqMLGCkO4btwYigI+he9C2xY0Q=;
 b=HrSWnT9xOdz2odyqBgnk+1mTmruXimJX0VtEMZH2sGn55Jk7Jz2gp7ytA+AXPnB8Al
 SPerCniG0AusltfJ3cMhzJfwvIrMMvmOnienoxS0B/PSsRyhrNqUYSVXFOMe/6xGXS1e
 YWL3xZz48c2k7IYkxd3xUt8IAZTGhfZbYIgd6z91dUKQjdeFhI8FjZZF5TyHn8rz1L5P
 ZC/WoQvfswdE5nZUbvrzFP0xdO1KV2s5+96Yg7pM6rPbofDKPVxvRQlHTT5+VNvS203b
 l4uiIl4mAwckpMA2QiwbVZMxaDV6t/Yx5YD+tg3Pox8CieM6jnBE6u5CZG4560lnWOp0
 E74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10G0n8QECL+Lz3MENuqMLGCkO4btwYigI+he9C2xY0Q=;
 b=GuCTi+qTpIWMG6RfV7Bv58VKPP9FGMcADccMSoTP3pLdw/UifEaGwdNFgellq0Ziod
 U3p29y5KSe0wChsZTsXUR1TYNE3DL7EPiOOl2GyYFfhgI5CElv9Snik2IvQqLpUib3ye
 airPx5uIjleTTWuU1Nk8oiq+P/98Zyd8SGxIDO7CMgCUxxjfBht/CH3o/aYXz9SaRRtr
 UtunTP2QIGsdohtrdqON5SVwtU4wJrDHbexOnHOMs855NLxQIWKm4RisyxTYjTiSfWnp
 41E3jrwxtKdkjSqy3dQWlC1wKcddDOuBHEiOJdFfN9wmYsee+3ZI9sIHGf4sVQ1p8KZw
 0T8g==
X-Gm-Message-State: AOAM532i3CY5QEjZ9tpUVYkTY59tRtPy9Tp2JhV6KfWkPzIPz9rBJkUZ
 nfDnPUx1TnDtgr0Nf8HSplwiVacdSbyVBKWk
X-Google-Smtp-Source: ABdhPJx3cwjiong8i1LZGO2r54P9pqW5196RXJq4APQoItXzBo4Xx5wtvQfj1rRoZthxOyoSNd0vEA==
X-Received: by 2002:a63:e08:: with SMTP id d8mr30268195pgl.27.1639122242538;
 Thu, 09 Dec 2021 23:44:02 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:44:02 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/8] target/riscv: zfh: add Zfh cpu property
Date: Fri, 10 Dec 2021 15:43:25 +0800
Message-Id: <20211210074329.5775-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
References: <20211210074329.5775-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..0f808a5bee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -629,6 +629,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.31.1


