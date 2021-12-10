Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6646FCBF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:28:58 +0100 (CET)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbGz-000586-Vs
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvane-0005RG-ES
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:38 -0500
Received: from [2607:f8b0:4864:20::536] (port=40485
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanT-0006mn-BJ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:38 -0500
Received: by mail-pg1-x536.google.com with SMTP id m24so7372002pgn.7
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k9G1dAW6nMK0cDYaM+i2mYTi5BuGz+8IoxMCYf5y+uI=;
 b=L7b6PIU6pBmpLHkVgH5e8KY/5TMxx+/VN4xTg6fC9E8xQESClf5ZFRP7FDbi9nsNLE
 efh2HsnSp4sXr4JmYhthm3g/FfCy79CwZXYBdOIkrqdNvrc7QvkGhlhkYYnowwc8F+l4
 g0xB4lZCLrHufep69uMod0QcF5yDStW0u+Y1ANtB/fCi390Mq+dAfvMkbit9bTp62h4P
 3dcWTEebs5tQKQrec5ykS9/HA0yBUJQno5S4bVzBGaX0joxLZ3gR3fUARtfANA6qmSHw
 JCLEVMJ7hcx1XE9E8Lr6y4GZN5akD5KtWcPLWNRcYXhL9gxxbFBg1hb17Jmm2wnu6UUz
 CEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9G1dAW6nMK0cDYaM+i2mYTi5BuGz+8IoxMCYf5y+uI=;
 b=3LzYSBW6M0Tiintl8WdGC845WWiwHloZuTmPZs+PU422CVI22RefErZwfD9A8KDwEN
 YvvTJlOgxImeFmQBKmucNLhN8VojQlFOsSQ2hAg+P8y6ksC8u7NLXOXxrgM2jW8Onwq2
 MoxSHC+ysIit9bn6ZyrjbitUXkOlf1cRxBtZgT/qUAKs0dHI7EelZFh1h+sHU3roQLO1
 lWnAz3dQaiT4Of078Iht1xh9UygQ2XISWmqJqhZ5OusrZ3kfW3FJiE1/BUSozpy30oPA
 ynWnYU9/D8R1uavk+RG0ZQBuPvuQl3Cks10TuF8BlvD3ZptVNRusCptB/D/oXGDT8IVt
 ihHw==
X-Gm-Message-State: AOAM531JWJLpgWFzS+EYtffGCcC8VdB0+Tk1079iYIO3CuCMrVC+j6TA
 kxuHGihc68CnIwUOiV5Cvoqgv1AtZMQ82jy0
X-Google-Smtp-Source: ABdhPJwCZMgsT7TNmSkdV/iJKOCDa4LTMEArDMngOE6FaI23HCNA0mhPQbUY6fCkr8HvWm9fpLLIfg==
X-Received: by 2002:a65:645a:: with SMTP id s26mr23816039pgv.316.1639123105891; 
 Thu, 09 Dec 2021 23:58:25 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 22/77] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
Date: Fri, 10 Dec 2021 15:56:08 +0800
Message-Id: <20211210075704.23951-23-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index df45c1620c..3da4f3b1e6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -374,10 +374,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.31.1


