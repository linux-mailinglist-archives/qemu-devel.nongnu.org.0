Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F04F306735
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:44:48 +0100 (CET)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4tYN-0007pZ-Lk
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4tWp-0006VR-MO
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:43:11 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4tWo-0001eq-8z
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:43:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id e15so3003550wme.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hsf6YslG+iiwGWWyzTzUT651ZdNva63Lvir9YoamAx4=;
 b=K8EQn8GTmUm9OhKOy8D8hABbFns8fRdgboTQVFsPW8omlNRQD/s3q5hL3vAgV5CVid
 l/v+79k8vQpxYwkkNRYAidgKt9h7YbbLkQa7p/qbtcafQ33ZpQ53koAU6rvieSCbf/d2
 fRWtX9BWwYelWexOS6FgW1rRz2d8Bl2kxTXeyEnXizIl1oWJLPH8W5JbTvBFqvTnQgRP
 bOJ1pLhYHMFfJUqeTQWzuIiX9kGssWnTc6DiqfUYjDxqycRol0xQNC/xw8ecRA9ON+h0
 OGa+72Ih9SdA3Ip8+NTIYHoEb/gpaBO88EZlZ9dR2nzOLiQeEMtCyB+tNcEdAVnenJeH
 pkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hsf6YslG+iiwGWWyzTzUT651ZdNva63Lvir9YoamAx4=;
 b=e2xAFHY5GrBoA0liM9IeYG8WLqu0Fd6Xp1oN4S2nXo59QtXS761OITPtRkTKN2zDrl
 PJGvX86df1+Zq/wM6l9Me8lWlKVXxCHRt3vjqpfiBJXeZCV3Ziw7RCECze+BayT8nOGd
 rxGkQE5m2yyvJjC7tzeI57667SMU7noluS4zcaoo7bEgjU/lgpYtyEfMOhIf9yz5lZqd
 MutJqlFujuelHkt4aRfESn8bBpcx9YmUQZ/OQCBhDrf+HrMU0nb9S6ffDNZ8uJMWUDaC
 brweXIgOAW9RbJT9OF5kOelzNJfZFCJprbCx93YIjbW2z00U3SpMenQ+EqSsJQ0CL3r5
 uTVw==
X-Gm-Message-State: AOAM532gKrAy9hkVUnRNaUhDpdIdh/EJYZ6Gw7vx1J3Gh3RFAnoR1kI9
 +FOZxToJHrchnatAIBu+WckBde42iJk=
X-Google-Smtp-Source: ABdhPJxefUx5HtYSGlomhi3A2311yHC3rNT8NTLgzr2dvatp6hP23xr0pW5S1FKBRXURA0y+/rhZgg==
X-Received: by 2002:a1c:df08:: with SMTP id w8mr5797209wmg.81.1611787388638;
 Wed, 27 Jan 2021 14:43:08 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q9sm4331552wme.18.2021.01.27.14.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 14:43:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/tricore: Pass MMUAccessType to
 get_physical_address()
Date: Wed, 27 Jan 2021 23:42:54 +0100
Message-Id: <20210127224255.3505711-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127224255.3505711-1-f4bug@amsat.org>
References: <20210127224255.3505711-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, David Brenken <david.brenken@efs-auto.org>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'int access_type' and ACCESS_INT are unused, drop them.
Provide the mmu_idx argument to match other targets.
'int rw' is actually the MMUAccessType, rename it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/tricore/helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 81171db833b..c5e997f3215 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -33,7 +33,7 @@ enum {
 #if defined(CONFIG_SOFTMMU)
 static int get_physical_address(CPUTriCoreState *env, hwaddr *physical,
                                 int *prot, target_ulong address,
-                                int rw, int access_type)
+                                MMUAccessType access_type, int mmu_idx)
 {
     int ret = TLBRET_MATCH;
 
@@ -72,13 +72,11 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     CPUTriCoreState *env = &cpu->env;
     hwaddr physical;
     int prot;
-    int access_type;
     int ret = 0;
 
     rw &= 1;
-    access_type = ACCESS_INT;
     ret = get_physical_address(env, &physical, &prot,
-                               address, rw, access_type);
+                               address, rw, mmu_idx);
 
     qemu_log_mask(CPU_LOG_MMU, "%s address=" TARGET_FMT_lx " ret %d physical "
                   TARGET_FMT_plx " prot %d\n",
-- 
2.26.2


