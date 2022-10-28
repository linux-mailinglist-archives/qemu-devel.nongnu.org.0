Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44CC6117E8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSf-0000KM-HW; Fri, 28 Oct 2022 12:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRv-0001NX-Nt; Fri, 28 Oct 2022 12:43:16 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRu-0000ea-8t; Fri, 28 Oct 2022 12:43:15 -0400
Received: by mail-oi1-x234.google.com with SMTP id g10so6685257oif.10;
 Fri, 28 Oct 2022 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xyhQI0Lbzpmp5S+5BT24WfTg1fucLHlEvq9Q5Qt6284=;
 b=WHJ1v2yMROSdj9pdZNaS2/xjQxuZSeddPhIiH1TgoG4RXimFrxw3ediSPHqOGAqCq5
 1X2kTyPaEpQR6C8IFKoIg4D+eUOLvFaIKyK/YqzF2ej3ME8Hg0NHrAw+o1nIsAlWmkzu
 MKbqCiIztWeSvntsXzgyiDYyjVWarlGhXK6kEw63WVOLniR4jtgML3RQzCpu6QNwXFSU
 D9/Hdbw0lIXGukguqWgYYowGJMZE0bfiKiWqteMpbXSExVnSaEWZSHmS0MUzUYFgAuhh
 L5NKG24LMCWHzEjJlswIkhAMtYXW5CHFtIET0Fch154jnvIcg+z48rPqn29Rk8xpfbzN
 kSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xyhQI0Lbzpmp5S+5BT24WfTg1fucLHlEvq9Q5Qt6284=;
 b=Yqek/shn7bU7Io0C3NK6Zjs/tboKoE90E9buv0o6EEJ4vgV0xTDBWyHdottIWI92tB
 9wzR22YZO9EFFKMiBZtS3ekScfqTdGWQm4SnflmXKQvhrd6r3wBGCa7Y3PC0VvX/uYeZ
 wVzme9pENCYPoFtOqWkS8lotTNMcp9KO3td/Na1F1BOOFPYB/8Wgy2TxUUIQlpCNF7de
 /dCfY1v5vXu4Itolgb1yG1merWvT3Ni89/xEiP/z3iLz659Cdyu8ncausVNa8ZeAqCHs
 R6zW0gFIo9F6dyk0GPx0GxrMk4cvgomhRyyv7yXZjCWR9j0AhFkbsSGJD2RQFkZC44pN
 F3iQ==
X-Gm-Message-State: ACrzQf0RWJYciYhl4ovCyVfE+oeb68tSKDn0y/a2yiCOU/YQVJ9vDYXw
 J5MfSlBs3vR6TH7nIYQdg38RKx0nHhKj1w==
X-Google-Smtp-Source: AMsMyM5/PpKvFwLxVQzSJke6RLjAqznHXqakTmeaOp+tclD9yY3yg/jNO0jrFGSeqfp1rxHxaP8Wig==
X-Received: by 2002:a05:6808:2393:b0:355:39af:eb6e with SMTP id
 bp19-20020a056808239300b0035539afeb6emr8697561oib.40.1666975392347; 
 Fri, 28 Oct 2022 09:43:12 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:43:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 44/62] target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY
 builds
Date: Fri, 28 Oct 2022 13:39:33 -0300
Message-Id: <20221028163951.810456-45-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Writes to LPCR are hypervisor privileged.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-27-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.c | 2 ++
 target/ppc/cpu.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 0ebac04bc4..e95b4c5ee1 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -73,6 +73,7 @@ void ppc_store_msr(CPUPPCState *env, target_ulong value)
     hreg_store_msr(env, value, 0);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
@@ -82,6 +83,7 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
     /* The gtse bit affects hflags */
     hreg_compute_hflags(env);
 }
+#endif
 
 static inline void fpscr_set_rounding_mode(CPUPPCState *env)
 {
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2433756973..ad758b00e5 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1370,9 +1370,9 @@ void ppc_translate_init(void);
 
 #if !defined(CONFIG_USER_ONLY)
 void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
 #endif /* !defined(CONFIG_USER_ONLY) */
 void ppc_store_msr(CPUPPCState *env, target_ulong value);
-void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
 
 void ppc_cpu_list(void);
 
-- 
2.37.3


