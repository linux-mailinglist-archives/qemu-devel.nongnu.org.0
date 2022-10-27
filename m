Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E43A60FD89
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:53:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo63h-0000jF-Gj; Thu, 27 Oct 2022 12:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63I-0006y5-1B
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:48:28 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63D-0002PF-5R
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:48:19 -0400
Received: by mail-pl1-x636.google.com with SMTP id y4so2136801plb.2
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qs0X8zxgyj3M+ThrhWzA5l1+0EjQf/1I4S4JsajyPOI=;
 b=eo9KncHjTiK2grvCzyv91erlxKz6R6qsV6kaBo61xPvTCVrWiGsjofvwYEG6wKDJcN
 +4Pac3UQwRgAR8Jp+/cd9s/cPErJ9oiCBm9HsirYNUIZqhXiEsw4zfmtVyH91P7w3DFO
 foWkJvQhShlX7/S5XAirshiwdK+xojewLu50czyPlFsePFls7uN1bipMxsAn1W58ibgh
 e1fS8pG3Vq45cjrjZcmPguHLCWwxXlU0yhaAFhPKtOyxmkFt0xeT+O9BrS6GZmSHFQT8
 m7HkXUGblYKeIOYCN1xxA/0u7AdesGhfTwoeRjdOnCf0KCBM9ctirnvgHmvKjnKnZWi0
 vROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qs0X8zxgyj3M+ThrhWzA5l1+0EjQf/1I4S4JsajyPOI=;
 b=usZbIob0dEMxw3HNONUT4W5ZuvixDAwvRJaClMCUCcR/Cw8vj8hUipMqGeFeLksPR8
 6nBufxhXPAVfm8LDfDTmoIlcZ8BK39d4Hm9jDyjDWhArUnjWW7fOSzPE7cfzt9wksZJq
 HYcmn025bCdHERLEnDK+jxn1CSjQ9nzBBAoQvN50FEru5QwEiQhOW9ljHWodtVYo6qAx
 94YvwOSFntLhhFfC+knOqjE2MY32fax8cCY9higqQCF1oVfWkIFkef/W4xYkvN/h+Oyr
 QrYYTiTXqY2j2ViikD3cM7j5G42rCUx13ZAEkrGNV6PJb/5q5rhNVY1Yt5ykSZu5XutV
 +JDw==
X-Gm-Message-State: ACrzQf1jiGuho6s84CyoaOUalKa6wXkFBi2GeJpg4f1C21M02+ZBHSSO
 H6tbvaOAUB8WjPZRC0CSx+07MQ==
X-Google-Smtp-Source: AMsMyM5dJKqlpdcGnrgJIQSxX/PUXVsyhVfg8IguBgqgDTNQCEOT0tOLdLN0ZsWrMh3iI3wDWxNuNA==
X-Received: by 2002:a17:90b:4d0d:b0:20d:6fc0:51 with SMTP id
 mw13-20020a17090b4d0d00b0020d6fc00051mr11000066pjb.10.1666889291345; 
 Thu, 27 Oct 2022 09:48:11 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:10 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/5] target/riscv: Update VS timer whenever htimedelta changes
Date: Thu, 27 Oct 2022 22:17:40 +0530
Message-Id: <20221027164743.194265-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027164743.194265-1-apatel@ventanamicro.com>
References: <20221027164743.194265-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The htimedelta[h] CSR has impact on the VS timer comparison so we
should call riscv_timer_write_timecmp() whenever htimedelta changes.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/csr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 716f9d960e..4b1a608260 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2722,6 +2722,8 @@ static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
 static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -2731,6 +2733,12 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
     } else {
         env->htimedelta = val;
     }
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -2748,11 +2756,19 @@ static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
 static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
                                         target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
-- 
2.34.1


