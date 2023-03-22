Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A96C5A53
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6vC-0006hG-P4; Wed, 22 Mar 2023 18:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6v1-0006h7-Ch
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:26:55 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6uD-0006WG-Nf
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:26:53 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-17aceccdcf6so20872178fac.9
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=gbBCocpwvCiAtcWGkHLrxYdx70SaREElbl7KQ69FLnUshiTVUohD1NJykocyX0M9Zy
 XzncVFOuPtTa4CGU43DRM2nBHi52tlGF0QUzXOlcsxEdGriZIeS/PGjAhAAMl6A2cKzJ
 snO8fK+OiOLkVMnUqnJOxoaVaW4zxWrcBF74q2oUz4Zmk+5OjVNdYp6dObnFx7SxqL8D
 RNa8T4ivn6gnR2/taAgpMQ8cEE6l5Pi75yJfC4FFjdx8yTmFlHz9YilKCsrcra0bz+9S
 ru1cMpLoNjhFdYlgpcLTDiseIO+pJ+baapBQlNA2E7X8IslzvLdesz0DF7UvgQZ/epVx
 sC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGHUYpVmGV+OzIAgNAop0j4Vk4kPrXqyPo/RElMU7P0=;
 b=2BhpP2zSciZAdY3rtJ8o0q2XEyk0uKpoURHTUNBs+K9/lderdvCY77731SVa6iH9Bk
 QhHmVkDMdZaxziGinsMZ/6cyjVfFzJJLZ+SjSTQznhdVWkRiLyojww7tsswuHEXbgMhO
 BPI9fdCIh3YSz2qarQr2SW4e6qxGgKuYZ2ZoSfn21TpuOPdOVAiC+5aawf/IvWNmOA+L
 R5bpMOtzYaVGve/rykm8oe+PSMkG4HLdZu19GIHCADn0143ezGYXXIVSJRCCksJYqRws
 +N90690m9HADBMcuwI59qug4f+Hiooz0SDp5z5uQ/3VuVP9li0E80jvlCI+aSfXfChC1
 ysrw==
X-Gm-Message-State: AAQBX9dPu3N9gkkhKGMFVGkhYuH42Xk8KS5HqObD9nlXxtNyEHxv9eg3
 pb4izEYXsKeXdUby9fiuqr8N3Hs/gXBBAHUA6rY=
X-Google-Smtp-Source: AKy350YRBQZtCxUKA0okoagPXBDgH2JfZUYVaT9+eTyHQ5hQV9r+YFxQ7Gz5iGc7Zhomm4Sy8KWwlQ==
X-Received: by 2002:a05:6870:5715:b0:17e:1663:7bc with SMTP id
 k21-20020a056870571500b0017e166307bcmr857076oap.54.1679523653173; 
 Wed, 22 Mar 2023 15:20:53 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:52 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 10/25] target/riscv/cpu.c: avoid set_misa() in
 validate_set_extensions()
Date: Wed, 22 Mar 2023 19:19:49 -0300
Message-Id: <20230322222004.357013-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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

set_misa() will be tuned up to do more than it's already doing and it
will be redundant to what riscv_cpu_validate_set_extensions() does.

Note that we don't ever change env->misa_mlx in this function, so
set_misa() can be replaced by just assigning env->misa_ext and
env->misa_ext_mask to 'ext'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c7b6e7b84b..36c55abda0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -949,7 +949,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, doing a set_misa() in the end.
+ * cpu->cfg accordingly, setting env->misa_ext and
+ * misa_ext_mask in the end.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
@@ -1168,7 +1169,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVJ;
     }
 
-    set_misa(env, env->misa_mxl, ext);
+    env->misa_ext_mask = env->misa_ext = ext;
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.2


