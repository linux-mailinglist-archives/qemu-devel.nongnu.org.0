Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A766EABA4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:29:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqng-0001QJ-Qf; Fri, 21 Apr 2023 09:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqne-0001NP-ML
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:42 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnb-0003q1-VF
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:42 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-546db536a6bso1048900eaf.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083658; x=1684675658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTEuK/TipxDMuIwEPwLq6RIPLKqwF8JtMA6wZHqbIok=;
 b=GOuOVi7BPulimjHF/C4zItmnc08mTEytxJQVTBfZKZDaUhrgvRP/fZ0RePpEXRQKkP
 IFvLGKYyAbSY4nU98ysvUa4TYkv/eN9cEVwU+do7FpWVU2T0w2PqztXkRp163qhwENR7
 H1iBbdHZntEFfqdk7Z8xelTtz/VK8mu6D4jD+xpghbEkM+v8GZav2d9xIvCX01fVeHJW
 DcJNajDk2gip/h0VmhhFlUkqhTAWUr80FdIE+acEqT+FZgidDHyBWDY1oz7sTGbn76P2
 Vft8+BvoUMMXrWgFGYJUs/5Uo6JAYJKpbHv/ald+dwx7ZxTep2Ma5M2HwiarUp6K1v4o
 ohHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083658; x=1684675658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTEuK/TipxDMuIwEPwLq6RIPLKqwF8JtMA6wZHqbIok=;
 b=CHt5Y8tOD+OgSqz08A8oAY2YZq1fLWhRnX9zd+US/EnZsR3WhCv8gh7Ja/JZcqXo+f
 MQbtA87z18cfnLDpI7z9777vbGYN+aJo8YxlaCVNl2cLNOoY0VZyaXIHaTdAAlPRNkTR
 o9zmi9app9BqSsoOs+Fe9TRkKUFU0bp6UXZ6IHFbDV7RAzOtlZ5GsZkK8Jp7INdxjRTC
 28sJsFiOCmFcfbKbSNn/WStm3vps7C6bl/nn78ldnRcuV80ixLhjEs19N7WXO4InxCF2
 mFHcttIcrtpJHOoTW80vEmjEpajROD7InerFUUCNnRQb60gs7QPseFNC3nbRf0gLElfT
 ox2A==
X-Gm-Message-State: AAQBX9eC0zs05HPziqzInYVRjKfRZEUJ2BFrHvHmxifUpDw6nViXb5nh
 vIgqU9TQpctV+RLjJ3TeQSbVXciwE35zHZJcdic=
X-Google-Smtp-Source: AKy350bRATVbUPPThlId0NdnPzY+Ymtw5SnOUPswiKecIhvCp/63tpZOYxVUVLqpRXptrDJ9EFZ1Lg==
X-Received: by 2002:a05:6808:651:b0:384:67e1:c9f7 with SMTP id
 z17-20020a056808065100b0038467e1c9f7mr2550971oih.45.1682083658603; 
 Fri, 21 Apr 2023 06:27:38 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 02/11] target/riscv/cpu.c: remove set_vext_version()
Date: Fri, 21 Apr 2023 10:27:18 -0300
Message-Id: <20230421132727.121462-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This setter is doing nothing else but setting env->vext_ver. Assign the
value directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index feca13aefb..fed7b467e4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -252,11 +252,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
     env->priv_ver = priv_ver;
 }
 
-static void set_vext_version(CPURISCVState *env, int vext_ver)
-{
-    env->vext_ver = vext_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -834,7 +829,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         qemu_log("vector version is not specified, "
                  "use the default value v1.0\n");
     }
-    set_vext_version(env, vext_version);
+    env->vext_ver = vext_version;
 }
 
 /*
-- 
2.40.0


