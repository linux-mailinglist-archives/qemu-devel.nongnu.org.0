Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4666983F4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMye-00081r-35; Wed, 15 Feb 2023 13:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyN-0007i5-JA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:57:43 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyI-0007vG-SW
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:57:41 -0500
Received: by mail-oi1-x236.google.com with SMTP id bd6so16640945oib.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Ogl+RmsTuQKGbHwWL7YbtcFc2a1h5NOUKob+9lW4sA=;
 b=jQ07UfJNwJQi5B+O+HiP6ewYT/fSCOu79nfT3G8yaztn3ZQWBBo72psVIMPZQISBW0
 TLewFyR5NiXFi4ACeXfqxGNqRZgj0yQ3ErzqGjNxXezBY2Q6UTku/pSVE6ThqeuSqF4J
 +zRAHjf85fUQeBijEINdOlD1XqUJrOVQmbfHOHHgMif+TgTHagSlmMRPY3LOXjcLkMzr
 s6MLWDEb9WKs3EVW8kOmkF6ZWdR7JVrKTYRE6XxtOLK74Za9q3o9rrO7XmhVMDnT8j2L
 wXA6Bkgl5FvhAiTtEBdon8HdNeKskg5/KWQtLyOMWXb/eMW2yBR5k7AzB2bAAGaApEWf
 GgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ogl+RmsTuQKGbHwWL7YbtcFc2a1h5NOUKob+9lW4sA=;
 b=fEdPJbvdC79Bius5Rmc6V+1pzrR8+lPIndqZOR+CjvaMFze0uGc2jyXZMDAuxPC18e
 nPD+cHCmNAAaF5byrSAJCYaaONceXBCS0PCdqXGfHcZAb2bhCCU6sEgdik4iWhedZeya
 tnXuNWp3HUlT9k6CfT2oSfPXzWZnawEbpUc3IYI4WKy4qF7M+iBwVBe00QtEyxcUWn5w
 An/Q1ojdYWKPxPjygt8IxNYRWN4UwKsqu/RfRyI9figbcWAJ8ttI1USizu/NrQ+Rt7ii
 Q9yZlm1EZ1y7FEWCAYCJiHPmRcLC76QMC44zClLGOWK1BMTWP9h0cHgpEBmdlRQallW4
 NDkw==
X-Gm-Message-State: AO0yUKWSTC+oYrlFmE/NzjX8TuCtAnSPsmxPKilQErM1yCSoLYutTfTY
 ymr00IV2urqaeUyJ8Hz+5n12rvahb83r4HPf
X-Google-Smtp-Source: AK7set+tLP3B9PXez80z08GAQtqgo6BLcJHzVLBiJh7tHb+2otHPNI2wQuuZH6ufYEDAAsAkDsFMMA==
X-Received: by 2002:a05:6808:1185:b0:37a:2bf0:502a with SMTP id
 j5-20020a056808118500b0037a2bf0502amr2615611oil.24.1676487457908; 
 Wed, 15 Feb 2023 10:57:37 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 02/10] target/riscv: always allow write_misa() to write MISA
Date: Wed, 15 Feb 2023 15:57:18 -0300
Message-Id: <20230215185726.691759-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
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

At this moment, and apparently since ever, we have no way of enabling
RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
the nuts and bolts that handles how to properly write this CSR, has
always been a no-op as well because write_misa() will always exit
earlier.

This seems to be benign in the majority of cases. Booting an Ubuntu
'virt' guest and logging all the calls to 'write_misa' shows that no
writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
RISC-V extensions after the machine is powered on, seems to be a niche
use.

Regardless, the spec says that MISA is a WARL read-write CSR, and gating
the writes in the register doesn't make sense. OS and applications
should be wary of the consequences when writing it, but the write itself
must always be allowed.

Remove the RISCV_FEATURE_MISA verification at the start of write_misa(),
removing RISCV_FEATURE_MISA altogether since there will be no more
callers of this enum.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 1 -
 target/riscv/csr.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..01803a020d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e149b453da..5bd4cdbef5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1329,11 +1329,6 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
-        /* drop write to misa */
-        return RISCV_EXCP_NONE;
-    }
-
     /* 'I' or 'E' must be present */
     if (!(val & (RVI | RVE))) {
         /* It is not, drop write to misa */
-- 
2.39.1


