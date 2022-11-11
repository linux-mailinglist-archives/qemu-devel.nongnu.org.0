Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB1626108
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiw-00086X-GW; Fri, 11 Nov 2022 13:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYim-00080R-4N
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:44 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYij-0005F1-8z
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id g12so7493063wrs.10
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yY8gyIcqdeUzmVMf2hGXZI0D0ZNZAMDajQW2IAWcs9k=;
 b=GcI1a7EIhPDPNefAqv6Bpn5eJN01sqhOjR0SfJEfad7YX2YJsulmB6Hry/seZmF5XX
 XTwOl8pKV2jKlrAQzjfMFFSte0bg14aDRtdm5hVnmKHTY7KYZ460vn+hIRhZSQctQuLI
 1AlSrjTYgmg00GvB3fUafvh7V5dqbjF3zu+j/pXhkluRe6/h6tugTEr58j+Bu5dzREmh
 8AXlN317ElQjG5yHrt6aG/VxHMhzxMCSw1QExwReaZ/5Eg70GSZkUr/snIUBDwlupQFd
 5/zig7tX/eU7ap3fiid3zYArDh2ZvhGgnr9cjU9dRB0YyeLxZx12ycudDTNwRSFcSzWb
 /ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yY8gyIcqdeUzmVMf2hGXZI0D0ZNZAMDajQW2IAWcs9k=;
 b=dELypGuQxMknkRoegVV4pWg9YfGrUGQW0MyfNwl6/1+pq7hUbiBEOWGr0X2EXwoVFt
 x+xUyGjI3G00ZfS3mMGNQOCnH2P3QAy4m9c0Ygsy+/Boa2TGfTbx38GHbQ34C83YYCFh
 gOucqA3oE36tclzwSVjdp+CczA77XndtEXYuozxER84gnPWrUskjlcOMGro+FDyfG9vx
 gV3BC7+xmZi0wt/E7jkwmo3wMk+lUaAKDHRfixFtVXXl2wj4AXFDsO/zUI4F5bK642cm
 weLUORjvG3r5e7D8E3UNOT44urSDYMYVf/xyRNhb0z3/bumWhzwVwQt3uaqMu8xHq5CK
 D2xA==
X-Gm-Message-State: ANoB5plk8KZ8gMQJhuBBdb2iB5y9AsnWWOZtwFVgvAhMeLhEcm2cSEXy
 vog0re0rmgQYS4mV2qurYeb+mg==
X-Google-Smtp-Source: AA0mqf5MEYrMdgFVdncRAuzc10YciFpqdKneBztrXnbfeSaEKAj0yBZQlhUPilyOsieweaGjiMlxpw==
X-Received: by 2002:adf:e384:0:b0:230:e4e7:b191 with SMTP id
 e4-20020adfe384000000b00230e4e7b191mr1916023wrm.158.1668191138097; 
 Fri, 11 Nov 2022 10:25:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a5d614f000000b0022ae401e9e0sm2535857wrt.78.2022.11.11.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA61E1FFBA;
 Fri, 11 Nov 2022 18:25:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v5 02/20] target/arm: ensure TCG IO accesses set appropriate
 MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:17 +0000
Message-Id: <20221111182535.64844-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Both arm_cpu_tlb_fill (for normal IO) and
arm_cpu_get_phys_page_attrs_debug (for debug access) come through
get_phys_addr which is setting the other memory attributes for the
transaction. As these are all by definition CPU accesses we can also
set the requested_type/index as appropriate.

We also have to handle where the attributes are totally reset if we
call into get_phys_addr_twostage.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - reword commit summary
v5
  - fix for new *result ABI
  - use MEMTXATTRS_CPU to fill in the initial values
  - also reset attrs in get_phys_addr_twostage
---
 target/arm/ptw.c        | 3 ++-
 target/arm/tlb_helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3745ac9723..4b6683f90d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2634,6 +2634,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
+    result->f.attrs = MEMTXATTRS_CPU(env_cpu(env));
 
     ret = get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, result, fi);
     fi->s2addr = ipa;
@@ -2872,7 +2873,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
         .in_secure = arm_is_secure(env),
         .in_debug = true,
     };
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool ret;
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 0f4f4fc809..5960269421 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -208,7 +208,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo local_fi, *fi;
     int ret;
 
-- 
2.34.1


