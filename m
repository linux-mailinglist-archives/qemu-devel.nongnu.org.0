Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C346FD22
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:58:11 +0100 (CET)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbjG-0004uP-O3
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:58:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaog-0006Zb-9S
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:42 -0500
Received: from [2607:f8b0:4864:20::42b] (port=35742
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaod-000719-72
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:41 -0500
Received: by mail-pf1-x42b.google.com with SMTP id p13so7789999pfw.2
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+o1FmBo01epXVOovjS3eUnLJ5rYaUiD10Pv6WFeO4I=;
 b=DTZ2gW3WtirEb+ESPQf0sh4XefVR7sQSu506RJnWVx5XqvmZIWh3Smt/3ZpCc1buD7
 eqEEZsiYlTsi5V9MoDf8MhTb1IhL3TGtMarxnfrtzpDLa22rFr4ZlZUqxaa0OhF0zl7v
 YSC2QhdVqLx1yUj2pnUF5jPoQAmT0f4GjrIg0xuQ3Sqvh3r2gTuTgH/xh3WH6UT+CsAK
 JenslIOZ75DK7xEHueb6iOuj8TyRq+gxgqmBdbyVOdOWvjxVUehiuV0QvZz3WDVKmsG5
 YgeaMnebmQtCjViIw1hGymZ8iAXwk7MacZGjkSl8gCFYRYk0MexKwsfCkKrV+pRYGKzb
 o1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+o1FmBo01epXVOovjS3eUnLJ5rYaUiD10Pv6WFeO4I=;
 b=Iug4xyKm4muX3SMM7cXZTCz4VqLUOldyGXdsvhuowloM0PPBy8e3p1txM3EEE3/Ual
 gDciSuzaUEEvx+o/yDLZnJsSy099LhgD4oQKTEoU6J0pMt+pxKzoy/hj3Ct7gm1TzWoj
 pSoLjiu7ggL1hoevajTvhVhulH7pLCWspdA7qKQp9QiL2PSetmdx0XJ775+zyhMHehEW
 XJDca4/Ygr9uLKWIwvlOKeWM8h/wgEEDgY3FYHn4SpCXjp53xJS7YNRx7y0IqFVE0A5v
 1kzdR23dn+MarhPfAWdaBkUeat+ZDfp48MS8jPgdHwS2K2PCnDN9CyWP1uoTk6nybyag
 ZJbQ==
X-Gm-Message-State: AOAM533XlD1mFE3rCLA3dcJsptGKRJsiC5gPp7i4tVjPDs5tkHucAMJ6
 BZtYXdljdmoJK7HLcmzKNFLEPRFAj2NTueA5
X-Google-Smtp-Source: ABdhPJwRQb4raqn7tK56/9e76DRE3xBd3Y8Fz0ggbgPRGpLI0u89ZJ8BNlo4WGYH44niHTPKgIkjfQ==
X-Received: by 2002:a63:7e0d:: with SMTP id z13mr37470683pgc.349.1639123177381; 
 Thu, 09 Dec 2021 23:59:37 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 48/77] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Fri, 10 Dec 2021 15:56:34 +0800
Message-Id: <20211210075704.23951-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 277a5e4120..71d7b1e879 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3710,8 +3710,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3723,9 +3721,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3738,7 +3733,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -3749,9 +3743,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
-- 
2.31.1


