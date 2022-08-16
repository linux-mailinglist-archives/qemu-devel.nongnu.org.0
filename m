Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EBA596611
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 01:37:58 +0200 (CEST)
Received: from localhost ([::1]:44600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO68D-00010t-Hz
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 19:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uL-0002rF-LP
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:23:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uI-0007ie-Hd
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:23:36 -0400
Received: by mail-pj1-x102a.google.com with SMTP id pm17so11010248pjb.3
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 16:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6weW70ppJZUiwtERnOMubUYZFkxo9pTvCG4Cd5BWJI4=;
 b=GxSACgJO0D3qXlrZd0SR7wn40gC8uDNyaVDhyKtBzsuuH+uaErPW7MIcbQDMMm1ht7
 gmzvj1PxIg7YmvPQjT6tQNpKM7F5s0iSq5BjThIdhnvZ/0wjazRepg5uMoH3tiON9QJd
 1acPgyCogiiQ2lGe9R5mYWfFf326Yoa1YoeVsfF/WUpJ0q8GjmlLTMrTTySYbE/EqvGN
 ga8bW5MN/XzUM72WGORpu2Sq7fNrRgJ/ot4XbpsAyGXiRAhl882MgsCNBQWaauhUHB1h
 2IXpiZcHpfCP+e8Gv2M8LlirmptTxVUt94Y8U50QBVuTpil5xbMR1Tbgi/3mor2tqj6J
 899w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6weW70ppJZUiwtERnOMubUYZFkxo9pTvCG4Cd5BWJI4=;
 b=VacSK5LT323p7MoJUxB2w4TeMbXq3KJA+eJ/CGSDshnAsw/33K9EHKJ6kcjAzAQeQC
 p8yFdnQODz37czIdKpdtsA3yYRIv7oVNDRMu7nVGtJGdL9LdqhVMWFWmMLRzGAOXdsqT
 Dhp5O0sU8qloOpJCdYx1hJFX1AxxFtckBBmDFNKn7Dz857BUOH1XPyQCCGbHjBaKGF3v
 Z+URqEhGMbnEuVP75YJ5vcZuc0VOEXEAYSo0nJUFm8SVvHya2rCZsmace9BvAK8nIPCp
 qbPiAjPGDbbXwuZBV6jQlpxkV3WGPrYY7OuDy4mIPsNadPjuRCdlgEB2PYQbwMVVabEW
 L//Q==
X-Gm-Message-State: ACgBeo2JcrBHxZi/EHg0SuvU5lkZC3UqINcF0aftZV3s2q2VkTKWn042
 HPRNK/eSq3/ioYNfIl43yUg/ALqZNaRp9w==
X-Google-Smtp-Source: AA6agR6w/Ms1609DFOB7EKIdCfc9zLxivPSG2KbDSgA7qJPcpYchkqMv3naZc2u0LzkaZYwvkHlmRA==
X-Received: by 2002:a17:902:7c05:b0:16d:2c63:da90 with SMTP id
 x5-20020a1709027c0500b0016d2c63da90mr23762058pll.27.1660692212355; 
 Tue, 16 Aug 2022 16:23:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a17090a2c4400b001eafa265869sm78608pjm.56.2022.08.16.16.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 16:23:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v13 6/6] target/riscv: Remove additional priv version check
 for mcountinhibit
Date: Tue, 16 Aug 2022 16:23:21 -0700
Message-Id: <20220816232321.558250-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816232321.558250-1-atishp@rivosinc.com>
References: <20220816232321.558250-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With .min_priv_version, additiona priv version check is uncessary
for mcountinhibit read/write functions.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 07b8b4eb1768..2dcd4e5b2d40 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1640,10 +1640,6 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
 static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
                                          target_ulong *val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     *val = env->mcountinhibit;
     return RISCV_EXCP_NONE;
 }
@@ -1654,10 +1650,6 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
     int cidx;
     PMUCTRState *counter;
 
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     env->mcountinhibit = val;
 
     /* Check if any other counter is also monitoring cycles/instructions */
-- 
2.25.1


