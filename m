Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846726B12DC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0GF-00083e-Ls; Wed, 08 Mar 2023 15:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GE-00083E-7P
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:19:42 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0GB-0002So-Qp
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:19:41 -0500
Received: by mail-oi1-x232.google.com with SMTP id bm20so13109672oib.7
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 12:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Urkftsk9UwUaTCcoEU1Jq3jTCffHbJotteipZdlPPs=;
 b=Jcl8xVD8tSrTsOe90piusPEXOhv6bxt8wCA9i3GplK1HNWghsCe8RIVFA3jXMk16rx
 Hecd2EZHc1/1NSkExJ4EYsDlyB84MpFk7N5g2uCTuPCDuzxBHCku15kAxhFDOeOmpQd0
 vfNKiarO0GBvMKZ1y/Y2A868m7veII7J9PnbYchyAjd28v/MHeHYw/dmYTgdVoQ92sVe
 iinQHzT4jkKUWEyCmQWEQH7R5erImSY48w/tsJDElyLri5w7AynSxJT9Nj3X7CLX03sN
 L3Xt5nC1g4TXxM/JIHDwYYdYYYISDkTWk3mYeUfwQhJVWq7mt5/roE5u1zd/SZnb45PA
 oPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Urkftsk9UwUaTCcoEU1Jq3jTCffHbJotteipZdlPPs=;
 b=bsqxxYBCD7WhV3QLV1VwrkqxxzUT/boSB2LNKG20hML9h8mcEe2YQ+bHEp1Xq893LR
 8tfR14V7wCz65I+N4zkmo8ambx54E6XTb+EnWs9iedKi3ByD1xH1WRfJN8L7LihPOKyt
 gqtW0ypul8W7OUuDMgY1xfTbeObo/Jh5SD4RLdIgxS0vdnybZM/ZpCRLogwXmYdr5VFj
 uA6LGpzhwV5LoD3Kk5+mcu8FtQwFnQg2+WKLT/juYZAWtZ9wt1VoWt1BjJzwpM9oz+Ah
 xsupaxVWtU5GHbyJHjV0VfCuzvo/tX7zzFuKe3wrHl+/jlQPWYhF1n51QRfzwVsSPd9P
 k+iA==
X-Gm-Message-State: AO0yUKUqj/AfJD1VtrEUy+d+LFz2j2F+4XCBbP0xSwT5jPht00Qp2l95
 sl99JeDFz7Y8i8UlRyUYegyEX13cAxUbWXiG3dw=
X-Google-Smtp-Source: AK7set8ecL23ia4i1AMbOJHEPbxyo9grsACP+W51rUZ3sLJbGEwYxP16zdL3Lw9HRc8Xk/6RVJGAgg==
X-Received: by 2002:aca:1204:0:b0:383:eec0:7564 with SMTP id
 4-20020aca1204000000b00383eec07564mr8568146ois.38.1678306778234; 
 Wed, 08 Mar 2023 12:19:38 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 02/17] target/riscv/cpu.c: remove set_vext_version()
Date: Wed,  8 Mar 2023 17:19:10 -0300
Message-Id: <20230308201925.258223-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
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
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5060a98b6d..0baed79ec2 100644
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
@@ -839,7 +834,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.39.2


