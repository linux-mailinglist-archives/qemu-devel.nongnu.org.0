Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82F6F0D87
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:58:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8gB-0002UY-Cr; Thu, 27 Apr 2023 16:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps8g9-0002Ts-N2
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:57:25 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps8g7-0002MN-2m
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:57:25 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-38dfdc1daa9so5036055b6e.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682629042; x=1685221042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDpKtg80pfh3MVGEDNBfXsCezbM2b4xXFEtlq1vb3Bk=;
 b=CHT0WEOFnkKK8LEUSmXk9a6N4ehSAzitEtkgUytLD9+KVyDPglfSiQyTcrO5djYCkd
 9+95wVEMxh9sqtLXRlfa25UaxHkQn+I391YFdYGtocao1BgNRkvlK4dh2f//Tw8y+8za
 LI40PU5NlCVBgMuoQIlCAVpax70/p/6qfqGVuA9+b19Kew/HFZSWGfA/DfaJMN35H/ee
 XRah/8ODpojCdUpdsZgw6TG3iLLOnuuOzWG827G1yZC9YWysI7Xjk5bkFGrhn7/qjvJb
 AIq0W6Gr0mtmZxwaMmzCSOheAW/lJVw2po8kzayaT4Xi6B8UYInYcs2QxCYoLmnkykLR
 cyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629042; x=1685221042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDpKtg80pfh3MVGEDNBfXsCezbM2b4xXFEtlq1vb3Bk=;
 b=H+A3CJ4lP+k3mVmHYvRZgnGFO9h3p+bHETRAGNDECQOZtwZq8TxP5RNgawv1AkalWK
 GXtXQ5oHTBXiyPBLfrhTd3zPrGRxg0aIr6BCiKStp1AmjdInc1MOzCEoFVFbIlNGvtcs
 Hn9UU3rXRVpdYYc7Be/ORJlq5iY9YNyPmbaoS9fzuQYd5rBz52lN7tAcNF9qRQRmjt+P
 8Ys3VwoAokv6C24VuWYzxLIV1/Jzvvrw0fXWzZIqwDWGXDeF5kaGlJ6R/q1gfDvNToev
 3ua6lZl/5SS8jguu1P6t/Fh8MoTKXhw+BYbByhGoQTs5EovMqIrz+PG695el5NCPGm0a
 5r7w==
X-Gm-Message-State: AC+VfDxcUDA1rTmfXeXyROeGTazBK87gzl9UWQOYtK8aqr9vT+ar3Wyi
 tViZ/DUTNNxPGQYGyrS+ClKwWA+H95Q82cqXk3A=
X-Google-Smtp-Source: ACHHUZ65U42Yc5fUnz87jqJFnl5ZcwHwUP5THZCSG6uY9uB+ti6rFjT8nshBgNmfCyaYOAiCxJY8Mw==
X-Received: by 2002:a05:6808:915:b0:38e:257e:a62a with SMTP id
 w21-20020a056808091500b0038e257ea62amr1256465oih.50.1682629041811; 
 Thu, 27 Apr 2023 13:57:21 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 k205-20020acabad6000000b0038934c5b400sm4804225oif.25.2023.04.27.13.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:57:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/2] target/riscv/vector_helper.c: make
 vext_set_tail_elems_1s() debug only
Date: Thu, 27 Apr 2023 17:57:08 -0300
Message-Id: <20230427205708.246679-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427205708.246679-1-dbarboza@ventanamicro.com>
References: <20230427205708.246679-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 3479a814 ("target/riscv: rvv-1.0: add VMA and VTA") added vma and
vta fields in the vtype register, while also defining that QEMU doesn't
need to have a tail agnostic policy to be compliant with the RVV spec.
It ended up removing all tail handling code as well. Later, commit
752614ca ("target/riscv: rvv: Add tail agnostic for vector load / store
instructions") reintroduced the tail agnostic fill for vector load/store
instructions only.

This puts QEMU in a situation where some functions are 1-filling the
tail elements and others don't. This is still a valid implementation,
but the process of 1-filling the tail elements takes valuable emulation
time that can be used doing anything else. If the spec doesn't demand a
specific tail-agostic policy, a proper software wouldn't expect any
policy to be in place. This means that, more often than not, the work
we're doing by 1-filling tail elements is wasted. We would be better of
if vext_set_tail_elems_1s() is removed entirely from the code.

All this said, there's still a debug value associated with it. So,
instead of removing it, let's gate it with cpu->cfg.debug. This way
software can enable this code if desirable, but for the regular case we
shouldn't waste time with it.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8e6c99e573..e0a292ac24 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -272,7 +272,7 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
     uint32_t vta = vext_vta(desc);
     int k;
 
-    if (vta == 0) {
+    if (vta == 0 || !riscv_cpu_cfg(env)->debug)  {
         return;
     }
 
-- 
2.40.0


