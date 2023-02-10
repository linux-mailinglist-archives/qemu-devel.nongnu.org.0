Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F87691FDD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:38:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTa3-0005Jp-IP; Fri, 10 Feb 2023 08:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa1-0005JM-Oj
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:45 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa0-0007Tx-8T
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:45 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-16ab8581837so6567192fac.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ANpy95G6JPx1yI24ko5mDktdJos2r8N2C+cU1crWQs=;
 b=YkKNy+iOQnfbrtoBNd2pOMe0WZBUO3CAvnSDUY7ZvyQ0vCe02ZyAICP2YDtZjLqhTN
 J8emTeTHliiFrunxhjxZkxNdpqjmPjFQeC5INiWP18eq3Gu36Z438hDBUNYnUfas+Wv+
 OQJTJgDIiCqICYQvPpaZo9D+thwnGi76aShcc5Z6TkeeXJBOh1++/1HlQ3croptQHPsi
 WNjkpj0b39+nj+A70X21GinvkhlCVYMa9uQt0NBeM6xuxKC+aFm0iD3Ojq8IJCGYqYk5
 WXok7uvCg53/dtBa92uxGpin2mbvo6rIHrxYAwqA8OO2/5dsubGnwWdEqjWmHLJlNW3G
 Z+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ANpy95G6JPx1yI24ko5mDktdJos2r8N2C+cU1crWQs=;
 b=4fZ7d/1E/4I1QNKGxmjrdI8WXE/kErVKhhc7yc1DNAxA1hbHEZmS1cYi4RCN1DKd7j
 GL2zrzZ1JySUhvm/wpwR7yML1SFESxhS3rEfVB909IJEqVzRks8/AcY+ZtugC3AaEgj4
 YjMK61fWVARXL5xWRcMK7y6w/AnrrfbpM5x/WVtJzJgINM+EFDYLyb869wCrFB2v08e4
 c4M3ZCa+7/Xne+c/s6TB4PHyA2TmJzaWID2QrTXJnziXlmEY7QaWIckEXbdrTie3jImk
 jc/eosxRxtOTITnfKY5U6bEa3JwMCC36/f8ALiY9eYl6F/UJr2GVVcff1Dxy5PLLI0xv
 AOiA==
X-Gm-Message-State: AO0yUKWBec0Ru9lsRHlo+uArSuI/fHTQkcu4j6tBZAF2KHVdW1wBnQi2
 fkI9wPWwMxmWkUf5ng10qkOvsx2uOte61nOE
X-Google-Smtp-Source: AK7set+UXz3xEpB9AKyNiylZ4gX3z3VWpHBtvdLeULiKlKky/FJkLTYjDzAlF67t/xWONYsJXoRIrg==
X-Received: by 2002:a05:6870:50b:b0:15b:96af:50ac with SMTP id
 j11-20020a056870050b00b0015b96af50acmr8678301oao.29.1676036202751; 
 Fri, 10 Feb 2023 05:36:42 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:42 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 01/11] target/riscv: do not mask unsupported QEMU extensions
 in write_misa()
Date: Fri, 10 Feb 2023 10:36:25 -0300
Message-Id: <20230210133635.589647-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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


