Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB5698402
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:59:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMyZ-0007tN-1K; Wed, 15 Feb 2023 13:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyH-0007bS-RT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:57:37 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyG-0007vU-E6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:57:37 -0500
Received: by mail-oi1-x22a.google.com with SMTP id w11so1979542oiv.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3Rpse8tpnuic4jsmgudmXGGcOHYXYnwKwheV2Dzwek=;
 b=FcoLlVlO2EyTVFlPSJqjZ4uF/aqJZRiq7eIFQ6gK7iKD5x1HT7jRGYguk77LDnNsJ+
 QN94ingGm1iDIa9pSC9tCw2unv+oPKUBWkIAx4weF9Q3UU8rIs9uiiR31B/+CllrBotS
 m+ab4WYTbb9joq7ABM44HNourW2pcASUGv7U9Hl6vUzxpJ1OwA0MOWF7U2t4hg8Pd1t7
 dJX8mnqjUgzduAfIx/Hd4kfHq3dzHSb7FvnV7wh1cMcAyZVl6dK4F1eiAOdtfIJh/Rdv
 ezCGk/z6MgXHJwCTnZUIDeii+h9Mu0ZHUhvILTyi7aUIWoKTwhoLQDgRjFz3gDjQ5u7e
 +8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x3Rpse8tpnuic4jsmgudmXGGcOHYXYnwKwheV2Dzwek=;
 b=XjrrpJyhbnyumA+N07dOJ57AooP2A3l+8Jm8rk2B0luj2H5GptDZZAcdesV4Q+Gwqp
 3hgjqSwCuZuMPO4JNt8WygEga/noKugujBTv+wYor/fQLTrz8NUhN44+IkEq/MSg1MX+
 6hwWcP+THMTMiSkVJ2p+iymHdmYyGLnxEq3w5hmm4tW5iIYkqdc8lT+qdxVFpaXw/CSY
 Fuadq/qLHKE+okye2rPKmfADNcZZxVznrOzoUFizNnB13hNPnXvlCbmyrF3C8g2Ekmr9
 u77L1JRl1hJ84/Vp+nq0BdkuWaH7ol6qImmWY2s4KO1T55Cdq8k3T1fEbK4nk6mWL6hv
 m8Fg==
X-Gm-Message-State: AO0yUKW+/RdSLHLetODqBBqi+DR1ETsNBZhoO2fkKa1dHlRKytj2Cix4
 7cbhB3ngFxU14LxNI+STGh8ozwgahx+9/kA1
X-Google-Smtp-Source: AK7set/DvhK0t/FJCTsjEpczCv54R/ierhNHtg9X91RNyi9WPCrnabmpaUfLgHbdbCkMhWsUfNMyvA==
X-Received: by 2002:a05:6808:147:b0:36f:883:6f76 with SMTP id
 h7-20020a056808014700b0036f08836f76mr1248238oie.7.1676487455043; 
 Wed, 15 Feb 2023 10:57:35 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 01/10] target/riscv: do not mask unsupported QEMU
 extensions in write_misa()
Date: Wed, 15 Feb 2023 15:57:17 -0300
Message-Id: <20230215185726.691759-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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


