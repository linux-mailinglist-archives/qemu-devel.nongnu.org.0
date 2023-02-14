Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CFD696DD3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0uU-0005R6-GD; Tue, 14 Feb 2023 14:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uP-0005Q6-B9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:24:09 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uN-00056i-Qw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:24:09 -0500
Received: by mail-oi1-x22c.google.com with SMTP id dt8so13903089oib.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 11:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LC73mPmFrGq5o3KC93WRhQ0uBlIIBFIRs5CA6y4B+Tk=;
 b=Cq+dQTQfJWoTeDleX+T/9EyfaDIoxDB5Crv4RuI4umGJ8e7vY02x+eAc9k6q6o94vN
 qNkXXhpm99pHedCDyhGoWFL44lZvUOAbadkS4mmK3XcaLGY6NOAuvcHsaGNz31D48GPR
 /+5bXHcxDTinOy/rbxoIggmU+npjNVotnds9t83PlqPwarQ1JrZmdvmQeFODImZvsvst
 9NYcSp4Bv8BY6d/Di2cF/kFpP6hJaWzPBV0AB8FedjyZt64pJvU7NMSMLVlAqtz5ZdsU
 nTCimhRImyKuBLO9w0AXqn5FA6oIEbxpqEAV0bzSkhjpbjYG35epvcDFho8lG24nO4fn
 9xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LC73mPmFrGq5o3KC93WRhQ0uBlIIBFIRs5CA6y4B+Tk=;
 b=uynu/rIcp95Hg1ghGNEQhY3lnGhCOKhsGdh6kRaOIv3wYs1KAT0q9O2d1ejI0+0qF0
 2xN54nzlzOb/9OFqbOmOQvrFgObopApzyaAuppYJmVhWC+dsfL7fZ8Uqovd6B2PvoXtO
 aXjbY3n+fCSzrNAEcyBSytFkkWGfHegDNiD5ceL3yIIrzIgXdRlifjsZTsdm0ryN00vM
 nTyOFO7rs+9HBtdNwCqwr8qlaHLAME4R3e9yEzvAaZ+1p31Krn/0aXkr4FPk3bEa91aI
 +cNgC5ihtR4J65a3YCnnkqYss5tQJ71yI1oJo3XxuD+atbUwoqzXEkXAkJq9MyIIzl2p
 GAWQ==
X-Gm-Message-State: AO0yUKUlGjTlI3cfHftBy6jDw8W401/0puya3FKAkx7dZ/CCCzGd1v/a
 FwYy2zSr/4nD00woCzbmHuY1GIpKvrzmAzZj
X-Google-Smtp-Source: AK7set9o9cke3UPKcHIFJs9PcVy/va3CuNO4lnfcAi+thzvWk+lAZvLf1Uw9j2J6RKtRoPI1N9i9kw==
X-Received: by 2002:aca:2211:0:b0:378:81f8:bb2a with SMTP id
 b17-20020aca2211000000b0037881f8bb2amr1545048oic.33.1676402646194; 
 Tue, 14 Feb 2023 11:24:06 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 01/11] target/riscv: do not mask unsupported QEMU
 extensions in write_misa()
Date: Tue, 14 Feb 2023 16:23:46 -0300
Message-Id: <20230214192356.319991-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The masking done using env->misa_ext_mask already filters any extension
that QEMU doesn't support. If the hart supports the extension then QEMU
supports it as well.

If the masking done by env->misa_ext_mask is somehow letting unsupported
QEMU extensions pass by, misa_ext_mask itself needs to be fixed instead.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..e149b453da 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1356,9 +1356,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     /* Mask extensions that are not supported by this hart */
     val &= env->misa_ext_mask;
 
-    /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
-
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
         val &= ~RVD;
-- 
2.39.1


