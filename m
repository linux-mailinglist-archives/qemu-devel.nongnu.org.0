Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB02696DE1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:26:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0ua-0005V1-OE; Tue, 14 Feb 2023 14:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uW-0005U2-Pz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:24:16 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uV-00057m-3V
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:24:16 -0500
Received: by mail-oi1-x235.google.com with SMTP id bi19so13885538oib.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 11:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+WX98kJ7NnSOTVd8lNN7pVD9wL9O2bU7MA0j7JP4yQ=;
 b=bj7E0ky8VmIroAXgqqij3SrYs9GnxC5AiEbkYdJt9jC0e2oeShM5quItXrOsBHdto2
 KEVnZj8Xwp596I0I7Q/3iTswz1KVGrP535max2Fw4nfPOcxNc1Dr5ugOdYDZTdZBLfW/
 eHiS6ZW5m/+QfjyfdDSAtca/JkG8elMnPqIq88F91FsOb135boWcuHkdex2Fh9jiXRSS
 Cv981EMLylDjO2yioe7OcXut7AQD5bV/9a/rqnwUnIbhB/mQXWsbzfm4Ry+lwT6j2V8l
 1u/YppW138Yn45CBWjTNWKS8oizQ3ZE90ER4q97OA0C8n69uMUaF37DtVEHgfImmS3F+
 ZoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+WX98kJ7NnSOTVd8lNN7pVD9wL9O2bU7MA0j7JP4yQ=;
 b=36ieXkAbKYka2FqaSpq5cORpiO6a7m47rLBIxZdX5g3qHeM+QHcnCKL7p7RW3SJCVv
 DqyhbCpVQmvs9BOnYFjrp1FUU+90W4MGv7v6a0iXLFiKXHQgIIfSoLDLSQIRlk+WqCLF
 uHnkegIO09ry0SsVW9fCra0+FMUV8vHHlJhUBRNXXCupPDcdSRnx/TVvgDa/UmBTJ8Vi
 KJf5Yk/kVCHYL91dwOePybL3yF99DnmmMG3YrlKGJoMnP3196WkT2URgdUqIsZW0aYHY
 74q9ZqOWXxmWef1naTqeUg+YKJNRcwsOtUwuwvMhkRI+ZSkooDcsJpAeaCv6E+S1QVlo
 5ymA==
X-Gm-Message-State: AO0yUKUNDUCM7iJIHrxvn2f2gs+OvJtY1ZRg35OjbHYCul64GBkXHWfS
 UkdamyY4/QD+Z1gJkHRKvYkYSNcDzf5vFcxO
X-Google-Smtp-Source: AK7set8pyd1qqE7pBu+vDsqWIa6fa97zJYcZRiSGN+EPxc6o1rrNdZzn0PAY2O4IzpQiWpgY7/oFYQ==
X-Received: by 2002:aca:121a:0:b0:378:9b59:5288 with SMTP id
 26-20020aca121a000000b003789b595288mr1485993ois.16.1676402651900; 
 Tue, 14 Feb 2023 11:24:11 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 03/11] target/riscv: allow users to actually write the MISA
 CSR
Date: Tue, 14 Feb 2023 16:23:48 -0300
Message-Id: <20230214192356.319991-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
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

There is a good chance that the code in write_misa() hasn't been
properly tested. Allowing users to write MISA can open the floodgates of
new breeds of bugs. We could instead remove most (if not all) of
write_misa() since it's never used. Well, as a hardware emulator,
dealing with crashes because a register write went wrong is what we're
here for.

Create a 'misa-w' CPU property to allow users to choose whether writes
to MISA should be allowed. The default is set to 'false' for all RISC-V
machines to keep compatibility with what we´ve been doing so far.

Read cpu->cfg.misa_w directly in write_misa(), instead of executing
riscv_set_feature(RISCV_FEATURE_MISA) in riscv_cpu_realize(), that would
simply reflect the cpu->cfg.misa_w bool value in 'env->features' and
require a riscv_feature() call to read it back.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 1 +
 target/riscv/csr.c | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..69fb9e123f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1197,6 +1197,7 @@ static void register_cpu_props(DeviceState *dev)
 
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
+    DEFINE_PROP_BOOL("misa-w", RISCVCPU, cfg.misa_w, false),
 
     DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5e4d056772..fe572b83e9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -498,6 +498,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool debug;
+    bool misa_w;
 
     bool short_isa_string;
 };
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e149b453da..e949e6248a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1329,7 +1329,7 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 static RISCVException write_misa(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
+    if (!riscv_cpu_cfg(env).misa_w) {
         /* drop write to misa */
         return RISCV_EXCP_NONE;
     }
-- 
2.39.1


