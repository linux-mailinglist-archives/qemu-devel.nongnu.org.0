Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287956F0D86
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:58:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8gA-0002Tx-91; Thu, 27 Apr 2023 16:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps8g8-0002TY-Es
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:57:24 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps8g4-0002Lm-8Q
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:57:24 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-38be12d59dcso5421553b6e.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682629039; x=1685221039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiVLq3sKiADx8HWn5miH3nGjvZBCf1dnUVX0EQPPeOY=;
 b=CSfVnoIZo9eacsu2s6d6TxVFyRfzmHy6bMeWmEqSA3VbW1ryNUzdaOtzT5htmPo32S
 XvhhD2MIDHfQgrQOmWQjN1dXjAk8kCyL4rKBEERw5XYRuGKutS6csJoqdBClBtuki9mg
 oLEn1fetC1WV2joTO1INkIfYalFheQE4qE0owdNoSGR8fCM2BVeNXR7dly8tFj9b/+Mo
 TPV6eH9fJTydqw6OQXkScRntJix/rGE5jcgDEeWbE7eCcE93LKVy4JTpKiQQDoJYPIzM
 /jECd4k4PgA9CFMHkyYKjTPHASFP0CIBJ13POU+9Xk2XcXic2Jotk565F4DuRieq5QjQ
 vZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629039; x=1685221039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wiVLq3sKiADx8HWn5miH3nGjvZBCf1dnUVX0EQPPeOY=;
 b=D9MXks4rrGU9xC21CyPXcLAeSN+GBFiE/qIxeVbQjaQ/yf3dnSQIQ0vG/wEEl5Rmrt
 qWffNW6NUBwcLoAQaubS6KU0aPYdoUIIwWMwplSGRdfE3+5v1tnW9L8VDdCxFn91hN1/
 sM+5GOZwtDGhMqDamB7ZeEqrqYW5TnaMUqJPMHJjiKpvQGiqkzcS+0c9mrP+0nET9abu
 N9ySj4P1u4nxuUcwBjLRMk8zaw/y6y8GE9FtwmR2pTaKq/tcY/pvv+NbG1hJRyIpZ9eA
 w5MVvdbFE8c5rWkAvIgZu2r2d0sQBp1xRihLy1JaB428UbBZmKa2EAFUxoAyd11giu38
 CYxg==
X-Gm-Message-State: AC+VfDygApuDH4SbJwXVfKPkwm1D11DAKNS8JmQDm+fR6AL2x7aaQyer
 mjARvhDTdYaixh6Egsb1Ao+NTZVfZwRvbCEH1YY=
X-Google-Smtp-Source: ACHHUZ4P+W7ZRE0C8VcWu00MyX1jnBWGRoYvl6j97kuESKEva8MkmGwvfMK6bfkmttCZ6Yz0h5KmOQ==
X-Received: by 2002:aca:6502:0:b0:390:720a:d4fe with SMTP id
 m2-20020aca6502000000b00390720ad4femr1470595oim.59.1682629038884; 
 Thu, 27 Apr 2023 13:57:18 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 k205-20020acabad6000000b0038934c5b400sm4804225oif.25.2023.04.27.13.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:57:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/2] target/riscv/vector_helper.c: skip set tail when vta is
 zero
Date: Thu, 27 Apr 2023 17:57:07 -0300
Message-Id: <20230427205708.246679-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427205708.246679-1-dbarboza@ventanamicro.com>
References: <20230427205708.246679-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
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

The function is a no-op if 'vta' is zero but we're still doing a lot of
stuff in this function regardless. vext_set_elems_1s() will ignore every
single time (since vta is zero) and we just wasted time.

Skip it altogether in this case. Aside from the code simplification
there's a noticeable emulation performance gain by doing it. For a
regular C binary that does a vectors operation like this:

=======
 #define SZ 10000000

int main ()
{
  int *a = malloc (SZ * sizeof (int));
  int *b = malloc (SZ * sizeof (int));
  int *c = malloc (SZ * sizeof (int));

  for (int i = 0; i < SZ; i++)
    c[i] = a[i] + b[i];
  return c[SZ - 1];
}
=======

Emulating it with qemu-riscv64 and RVV takes ~0.3 sec:

$ time ~/work/qemu/build/qemu-riscv64 \
    -cpu rv64,debug=false,vext_spec=v1.0,v=true,vlen=128 ./foo.out

real    0m0.303s
user    0m0.281s
sys     0m0.023s

With this skip we take ~0.275 sec:

$ time ~/work/qemu/build/qemu-riscv64 \
    -cpu rv64,debug=false,vext_spec=v1.0,v=true,vlen=128 ./foo.out

real    0m0.274s
user    0m0.252s
sys     0m0.019s

This performance gain adds up fast when executing heavy benchmarks like
SPEC.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/vector_helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f4d0438988..8e6c99e573 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -268,12 +268,17 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
                                    void *vd, uint32_t desc, uint32_t nf,
                                    uint32_t esz, uint32_t max_elems)
 {
-    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
-    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
+    uint32_t total_elems, vlenb, registers_used;
     uint32_t vta = vext_vta(desc);
-    uint32_t registers_used;
     int k;
 
+    if (vta == 0) {
+        return;
+    }
+
+    total_elems = vext_get_total_elems(env, desc, esz);
+    vlenb = riscv_cpu_cfg(env)->vlen >> 3;
+
     for (k = 0; k < nf; ++k) {
         vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
                           (k * max_elems + max_elems) * esz);
-- 
2.40.0


