Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D0E6A92C8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:43:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0z9-0007ze-6A; Fri, 03 Mar 2023 03:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yx-0007L0-OA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:39 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yv-0007qp-Ap
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:39 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso1565674pjs.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832896;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1NW+NIexrpPmdGr0YETGUz1SO+EPDDsXBDOKSAL+94I=;
 b=7whNdQVEyKS45V+NcQrgr3c/mC2WV7+Tp9VBZL92YOqkvvq+b0Ar1/UHC1rBaXwvny
 GPM+XDEqRYpqBzNdP9/g1xjH4TXg1j7Q/B1bQ0rIPDhGbxRSCJpczhzI/8ijxr2//Trm
 MI89iAlOSHz3FylA5mw3JQtN35H/UP6WHVPAVQk5ZNpJdnYenspFErexSASQjFt7jhbx
 YEM0BWJFsMmbfXmBOIR/cLQjE1bXj6p8DD4o4fvgP5m6iAr1iBPV7QD2QaFbMbXgMZDG
 44gZxIkdLcyyPSoy6/SYDushRoXaeAfGoGl4CcpmU+iw9W78Jc/YiXOjbe8uEqzv8JYM
 jofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832896;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1NW+NIexrpPmdGr0YETGUz1SO+EPDDsXBDOKSAL+94I=;
 b=UqerxyhhB0D6vS73X7iAGEsA9AH0+a2EvBNjaNXMg56ltCiR3KSTs3pB1VjWcFPOwQ
 u3RLGzQveKAws4iho48oljfzu+4O+kiYedr5LGlhqf6Nov3sLau4lqguKTSVCyYFjlvh
 F7xgaD3M2t9dyiC0jOLB/J6uWjPlLGIz8OkU5mpE4fazX+PVI1kRk3HA5Nn0tY6XiJf6
 F/9mQ8E/Xzq4bAtzamMC1mCskAnNcEn74U5un2CwbfvuasQhazK103ty3vj4TzwNe3BD
 2UbATCiJcDDPja24vl9dtVV3wjxusu47wGYyoWe5FeojtpLelyRH9U62XN9Zv6qQGVxJ
 TQIg==
X-Gm-Message-State: AO0yUKVSBvCROWRuMvwWuDXB0uz7Q128pS0TVMk9jKWbpmiBTYXktKP0
 vNDlWaZop49KtET4RRyWocB1OQ==
X-Google-Smtp-Source: AK7set9Jb7TQ/PJn/mIBx3TkF6CuY6HXF9O74HvUxpLpeioUndaD5ZuRNc8Xl4I9mulPBumrRxh6LQ==
X-Received: by 2002:a17:90b:38c3:b0:236:704d:ab8c with SMTP id
 nn3-20020a17090b38c300b00236704dab8cmr900526pjb.26.1677832896142; 
 Fri, 03 Mar 2023 00:41:36 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 nl2-20020a17090b384200b002311dbb2bc5sm2853499pjb.45.2023.03.03.00.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:35 -0800 (PST)
Subject: [PULL 12/59] target/riscv: Fix the relationship between Zhinxmin and
 Zhinx
Date: Fri,  3 Mar 2023 00:36:53 -0800
Message-Id: <20230303083740.12817-13-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Just like zfh and zfhmin, Zhinxmin is part of Zhinx so Zhinxmin
will be enabled when Zhinx is enabled.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-3-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a717f5d995..dcd85f7f27 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -754,8 +754,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     }
 
     /* Set the ISA extensions, checks should have happened above */
-    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
-        cpu->cfg.ext_zhinxmin) {
+    if (cpu->cfg.ext_zhinx) {
+        cpu->cfg.ext_zhinxmin = true;
+    }
+
+    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) {
         cpu->cfg.ext_zfinx = true;
     }
 
-- 
2.39.2


