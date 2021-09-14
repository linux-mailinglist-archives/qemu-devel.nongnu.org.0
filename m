Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF040A2A5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 03:39:49 +0200 (CEST)
Received: from localhost ([::1]:43240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPxQK-0001rF-7j
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 21:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPxO4-0000SR-Pg
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 21:37:29 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPxO3-00038c-0Y
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 21:37:28 -0400
Received: by mail-pg1-x529.google.com with SMTP id t1so11180624pgv.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 18:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jO+23q7Z+Ba1xs513jaA8qRCr6b3K8wAWX9oqFv11Kc=;
 b=S+MfX9DQ0gWzSM0tJk7sSag2Qz1tEuSYkNyW6BHofnbHSg4X55GnlGsHpF5TMZtxqP
 mrGaolTJgIl9VvaA/DAuz1cx1yeAuB2EzlDTTFa3Ag92Ws8N1FAs4kc2s2nEHNeErrgd
 Qju5Ok9bdZYKoSguPVPtCq0DF+AedIrlnOXrwcfe4iXF3h0FvZ66bWHJZmkMyYDZ0RII
 MwEiYUeHwtmY5yYjdxlMyI49+ERAUI9ykkuDPPWxB5ZFQE2gegSbKDlrBtS97NCY1nS+
 b8R5gX4hyte0rro6Ky+sAf33+cUmSAAitRnmCYq/mwxiFsrqhCZ8cj/uHdgoKf2ByctH
 d5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jO+23q7Z+Ba1xs513jaA8qRCr6b3K8wAWX9oqFv11Kc=;
 b=o85toD97G64O3kFuoDytxgT++hvWUUmqO327amNIa6imjxvLhAR6AOmqlpUo5c33v4
 obWjC6SgJCZbNK76BojLyUBV6v6TkFD3nKczIEmn4cfgHNKmha1PIk8iu031BfsveEtl
 Khr8zACNqGsfZzzJxfRnzvfnTLMt70gBvsvdOCly2N7VnvXA2ZHxpop684eK+smH3hUg
 1KRA2l2YaKEDYAadPct6VI9L5rN4nVD6XdbKUcZ37PdNMBbAp8/uTjtzCrvAYOfbCQ16
 9Zoyki0e61HDcFCWRiYQeiE3LF2yQhDom9AWTHa58QSHFRxDBMcM9bxWx8/gzObsAQra
 N5SQ==
X-Gm-Message-State: AOAM532ehKk2adiSpVZUZ5XdTaPUGcWnVbE4tE1mYr7BR6DMPZSyF6Br
 RAFx7ScYNa6e0nh9pp7AbAffqw3h0BPWYg==
X-Google-Smtp-Source: ABdhPJz/vfjF8wgdQgFNj2py2/VJX1jVmRgyG7dbLVExDuwC99XPzGM46jVmOXiSRjPelakJxwBkvA==
X-Received: by 2002:a63:1d25:: with SMTP id d37mr13372786pgd.52.1631583444607; 
 Mon, 13 Sep 2021 18:37:24 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k25sm8006750pfa.213.2021.09.13.18.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 18:37:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Backup/restore mstatus.SD bit when virtual
 register swapped
Date: Tue, 14 Sep 2021 09:37:15 +0800
Message-Id: <20210914013717.881430-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frank Chang <frank.chang@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

When virtual registers are swapped, mstatus.SD bit should also be
backed up/restored. Otherwise, mstatus.SD bit will be incorrectly kept
across the world switches.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f4..488867b59eb 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -111,9 +111,10 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
 
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
     uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL;
+                            MSTATUS64_UXL | sd;
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
-- 
2.25.1


