Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D823762119E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOB2-0006Rw-R6; Tue, 08 Nov 2022 07:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOB1-0006RE-1d
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:58:03 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOAz-0005oW-Iy
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:58:02 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso8328911otn.0
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 04:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/jrbFGYzUy50fye2d5xQf2USygLwFAgYaKpovyOzEw=;
 b=D0owSHw1CJzL2OBLtlniNmAjQqHX/H2HQkoZi1hkwvjYdG7d95FcErp7vbLlTEaNZS
 LR0o6mtv2b7YhNnN22V7T39BaKHIhnGvpYQFO9IpfZTfMUhG7jdVtZBG8sWKCwTn7L1F
 MrOcmLEVyURue7SmtkP0C48awloiwsV1x+eaEbTrNmLniXHEvSRmrp3ISdTkCLc9kBEG
 iq6ae3jFhciECZcXAAlAFd4bnVqm3Lq6jx9eeod1MgWLEM9+l8901txLAc7XEOuOOoA/
 ZM9GU2AyKJudSlUlYeHRv14vejlqddrb83J2K96t4+kaQVNuCKe/GP+5wtLaTP0Earlw
 t8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/jrbFGYzUy50fye2d5xQf2USygLwFAgYaKpovyOzEw=;
 b=SPA91KTe5OpwMIh7RpZsI3F6Ee8IxlcFsmNn8SWfCaHdZaHXJ7XbgIbc4aVQYFIqED
 hL0tXcJtFFm10p3f0dp+DLvZDkfIJT5kG0sKFLI4pifh/2DzGYPHBg/aJDJ0gAYRHOvS
 lzu5SiEJEw7X1OezVq6xHqjARPe79Xizl5o36Zxcvq3QEazHZ5rMXq6Wh2KX1N68R8OW
 X6o1PLToPYClkTbMkDjBcbTLg0I92DTJT8vXEI0zO3cvef9AVi3tjtDy/3kBjYE5iSxg
 avHJDA39cdOmkE0ZhyGLQy/1kGOc1nyrWZ18EJdUd3k6dSwa8B6Y+vFSGXAE2/koHKeb
 TKQg==
X-Gm-Message-State: ANoB5pmt/mp2T/Xhy9IxkQImvGD1J4gat9wrdpFRbf/kWF49Uhnxt6Cb
 zNOJtv8ODItucTQuOHja2Mwxzw==
X-Google-Smtp-Source: AA0mqf5nP6xCiMFaTuJv8cxfUUdRkyvlSVDxznONoEf1HGYnWoqDkaAb13ze56uzlwjTy8tgEINIiw==
X-Received: by 2002:a05:6830:134b:b0:66c:da9f:732a with SMTP id
 r11-20020a056830134b00b0066cda9f732amr5708603otq.76.1667912280070; 
 Tue, 08 Nov 2022 04:58:00 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:57:59 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 1/5] target/riscv: Typo fix in sstc() predicate
Date: Tue,  8 Nov 2022 18:26:59 +0530
Message-Id: <20221108125703.1463577-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=apatel@ventanamicro.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We should use "&&" instead of "&" when checking hcounteren.TM and
henvcfg.STCE bits.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..716f9d960e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -838,7 +838,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
     }
 
     if (riscv_cpu_virt_enabled(env)) {
-        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
+        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
               get_field(env->henvcfg, HENVCFG_STCE))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
-- 
2.34.1


