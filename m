Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09D6CF41A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 22:11:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phc6c-0006LD-8E; Wed, 29 Mar 2023 16:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6a-0006Kc-Sj
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:12 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6Z-0007oK-EH
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:12 -0400
Received: by mail-oi1-x236.google.com with SMTP id r16so12473492oij.5
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 13:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7raJYv508hDPYTX7Dx1KX4h6DtiCuFfCm123h7f7NA=;
 b=FulcEYrhXfxpHqHRYyNB0hoaZ8b98GPltA1TBOYeSNXG4QOVqUZxqCu9cJ5OPNdKoS
 9ecizmzdRHwJaw3EXbxxBAaVGO3Qt1KEx5xvbG2yN8L+vvuaUK72lr0PmM3eaNX0Dvgk
 lvEwg6ukrBadadmxIlBGR6HaMV8+JhL3RroMfnt6qvc0JamclxOeRZ0am06NdnsyIjsX
 DE+biJsW4cbMYFCdDzfwlxh+9wGTG4fE8/cloQpRSg3GIeAmcJXRt/j/u0xUOttbclBS
 CTjPPja+Y1pZmIsvrazbiDE6OtKuW2aufFKNZwztDipEPvA+sCizkb7eRUcyj8ZTjjZc
 7qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7raJYv508hDPYTX7Dx1KX4h6DtiCuFfCm123h7f7NA=;
 b=4DZWfmJowUD1DtbKbvNkvAS9iVRlbhV8psh9Bj1h4doH1U5INTz+CtIQNAySnhV6FH
 TJ3mhUxCi1/V6/CE0G85c6vsz2eoYTOUgojlH6d3m7vPKUrXVOKgWQbZtVKWA/S4ip49
 xFo3ucitWu49OGX3LMfTP4CxJtdilJYAjx0TfDtNF757BTBkxJAwlfyoEiD7++RvE3k/
 rTFa8TxVjqMsj5h3SsJWnIzXMH3/EwcyPRjY/XLsq5okTvs6+fzZNxF0du5fdAd4zRQM
 SFERT1MghlHRP6jgbva+BiTcmqNAt1TPrb00qdU4C9+P3Zw3NWvTeGeEC4cLFloiaTZt
 Q7fA==
X-Gm-Message-State: AO0yUKV8YGCF2wfb33TVsIaTlBbRer4UNmKHwfkp6oinYYO9yRhDi4mL
 flXm7ug9B0s0ORx3rD6/tXRRPr796bGwR5vCsIs=
X-Google-Smtp-Source: AK7set+/EbM9rqjga0p64CFqW+aWOnWYIh72ttbLEHHYbf70cOil7xSZloT+lqcOHnt+TokI44lAoQ==
X-Received: by 2002:a05:6808:18a0:b0:387:205b:70c7 with SMTP id
 bi32-20020a05680818a000b00387205b70c7mr12484869oib.13.1680120550071; 
 Wed, 29 Mar 2023 13:09:10 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:09 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 2/9] target/riscv/cpu.c: remove set_vext_version()
Date: Wed, 29 Mar 2023 17:08:49 -0300
Message-Id: <20230329200856.658733-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 610e55cb04..19e0a6a902 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -245,11 +245,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -827,7 +822,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.39.2


