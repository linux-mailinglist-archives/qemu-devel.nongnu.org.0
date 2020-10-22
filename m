Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C1E295997
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 09:48:59 +0200 (CEST)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVVLG-0007Is-OB
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 03:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVG0-00013S-VM; Thu, 22 Oct 2020 03:43:34 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:44568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVFp-0007dI-CT; Thu, 22 Oct 2020 03:43:30 -0400
Received: by mail-lf1-x143.google.com with SMTP id b1so1009123lfp.11;
 Thu, 22 Oct 2020 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iGcClsENfMRlEEj1DdXzesuzsrG1w6qHhs9fkCduQVY=;
 b=fbUlSsoNarvg6cRPA/XasjZJdKwbAF8Uif/N50wZWi9TrLuCwdlXS0Cis0ycV6PHKo
 bJ8Fag//1YASkwSt4ikcUItrhgDd7UaJN4JGrnfCUXFNYRL2HfnicnDkWHrPLweyuDz/
 F7ehlRny9CIbukczYpSa+jjSK3cyB2komcZReI6tSPbhBenGdlSE/D2vJrgLBGREYqKt
 WKO8a8GXq8t4NxpQ81+S0rpdx6sN/hWrKK814ECg/toohMEn0kczASovt52mBS0clF1g
 QraoG527c93icI9IX36rcROlgHkfDemL1cmv6d9yJcWWzaLaQo6CH2Mdp+B5iX9NV+9V
 ntxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iGcClsENfMRlEEj1DdXzesuzsrG1w6qHhs9fkCduQVY=;
 b=GMQnI4I9wpyWVOLAz3Paj1hCrYaJZGw0MHlOMNX/0ZgKql59l/Q3iTkKZZKAlQ5Yfb
 +fuYcaC8Pr07f7TNOoNaKmINVHZojVPqJTddAlxpZIKUOdQZLWUy/mEfA9Hnaf+p8EA7
 vao2J/6TTqUP4TnKnzmZUriB1+rC2fvqL6pCu9HtUaxf7vgG+ICHAOfh24gY2ETDUIfA
 MgReul7JLd4z0bmXRnATom1ijelGgTvlm6QiSSTodCHyPpQh0IAhAE7ZiPmRrETs8K4Z
 ++NaWpfQb5Ja/viApPcPZODM6OyNFh1dLFutR8Vi1RJQOKAB8J+c55fTRQh4vOytLMpV
 zCWA==
X-Gm-Message-State: AOAM533pv5Pnf8TAsA+nUtGK2A17tf190VrGqk4gArcfHyVCAcKqmSnp
 jroYY5SnYpguQZ0rH6cUntQ=
X-Google-Smtp-Source: ABdhPJyET/SiBiKPYXFwBOv5uwKOKQlweJRhx7u33e1gxtaLrJP6Dn8+0UygCCrcufHxJAA+b2FEQg==
X-Received: by 2002:ac2:5dea:: with SMTP id z10mr452470lfq.468.1603352598322; 
 Thu, 22 Oct 2020 00:43:18 -0700 (PDT)
Received: from neptune.lab ([46.39.229.104])
 by smtp.googlemail.com with ESMTPSA id n19sm138887lfe.142.2020.10.22.00.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 00:43:17 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH v5 3/6] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Thu, 22 Oct 2020 10:43:06 +0300
Message-Id: <20201022074309.3210-4-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022074309.3210-1-space.monkey.delivers@gmail.com>
References: <20201022074309.3210-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, space.monkey.delivers@gmail.com,
 Alistair.Francis@wdc.com, kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db72f5cf59..1c00d9ea26 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -255,6 +255,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
     }
+    if (riscv_has_ext(env, RVJ)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mmte    ", env->mmte);
+        switch (env->priv) {
+        case PRV_U:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmbase ",
+                         env->upmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmmask ",
+                         env->upmmask);
+            break;
+        case PRV_S:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmbase ",
+                         env->spmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmmask ",
+                         env->spmmask);
+            break;
+        case PRV_M:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmbase ",
+                         env->mpmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmmask ",
+                         env->mpmmask);
+            break;
+        default:
+            assert(0 && "Unreachable");
+        }
+    }
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.20.1


