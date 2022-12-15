Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B664E3F8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 23:47:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5wzA-0004Eh-5k; Thu, 15 Dec 2022 17:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1p5wz8-0004DW-2Y
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 17:45:50 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1p5wz6-00013P-G6
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 17:45:49 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id c14so559922qvq.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 14:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCTf7NMvJLELqtGoZRPSE1QFP//FtelGYPMJRFHqiNk=;
 b=2eBGt10jEePE8+bscEGmvu5Ys9eNbzWzHiP1cNap52QTHl0IfkBITXu17NTKu9G6eB
 1jkw3M4QFkBJP2z1h1vq9JEvwCv7ntFbcojHxgFViuLVWEMtOXySc8joe5QeHyRbNyxD
 0MH5n21NfJ1bho/98mKbaiAl0qSFor5BzjPdZwJTbHaym/5d3BTkwFPYbVwLsVy4EqCF
 9bblNzSCksS9JEtVT8oMHkbug/oYlTpyZBQBrnwQpxztfzXzPAqG8ZCN84KYBsQA5jQ3
 6eie0h3UzWjZ6JySjPIaWW/3sNxt5Mc87cCFBS8/zdgvEmMr4Fzhwwf7ikXnl+P+g+hO
 uSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCTf7NMvJLELqtGoZRPSE1QFP//FtelGYPMJRFHqiNk=;
 b=aSv+0mPitKoJsgfTUd9lD6s4Sr3AUrIpDslFbhzhjozNs8mjfwKFJjxmbLrXegY3T0
 OvyMO41RweKWihx1xeXeCQUCP7d68a5AZOMEwuOznln17FMrDZj9bDzlR5TLWGxItKVF
 7PbWy9UISan5iWQtn/jOvruFGhLXB5Khiw82GTrV4Z/+jfc7SSyUyGKYTjSXKhHmu34X
 aYG4AK9g7dusDX+AjPqprPjSSymv3RoOXAAoGJVpepr7O5gllRtD9J8LdoyoJeQSuQU5
 hJWmkfdsuZTdzekOmVef4xUWp3bQ0FLY3TKl+YW1Wm2X+M0uNLt3YRmi/Hh2SH+exu3f
 tmLg==
X-Gm-Message-State: ANoB5plDYnOtKEp3h8bg6i/sBXJWGJCklgF2gS8ynaZK7EPZgR6Ivm35
 3AcCR3725Qjlw8mhV/cxn2JvHNtDj2qANK1m
X-Google-Smtp-Source: AA0mqf5uuWCft1+h1ePjNWZX5TbFcWhHb66VUmfo78xQ4T7WUVV78mimS23B4ig3dSeJCoHtgYx4gg==
X-Received: by 2002:a0c:ef54:0:b0:4c6:e965:e129 with SMTP id
 t20-20020a0cef54000000b004c6e965e129mr40563187qvs.47.1671144347298; 
 Thu, 15 Dec 2022 14:45:47 -0800 (PST)
Received: from localhost.localdomain
 (pool-72-80-155-134.nycmny.fios.verizon.net. [72.80.155.134])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a05620a0d8400b006fba44843a5sm173445qkl.52.2022.12.15.14.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 14:45:46 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH 2/2] target/riscv: Trap on writes to stimecmp from VS when
 hvictl.VTI=1
Date: Thu, 15 Dec 2022 17:45:41 -0500
Message-Id: <20221215224541.1423431-2-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215224541.1423431-1-abrestic@rivosinc.com>
References: <20221215224541.1423431-1-abrestic@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=abrestic@rivosinc.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Per the AIA specification, writes to stimecmp from VS level should
trap when hvictl.VTI is set since the write may cause vsip.STIP to
become unset.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp support")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 target/riscv/csr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 984548bf87..7d9035e7bb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -935,6 +935,9 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return write_vstimecmp(env, csrno, val);
     }
 
@@ -955,6 +958,9 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return write_vstimecmph(env, csrno, val);
     }
 
-- 
2.25.1


