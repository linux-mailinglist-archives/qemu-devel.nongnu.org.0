Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19C847893E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:51:42 +0100 (CET)
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myApy-0003Zi-1L
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:51:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myAoS-00028F-S1
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 05:50:10 -0500
Received: from [2a00:1450:4864:20::52f] (port=36458
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myAoR-0005G4-AH
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 05:50:08 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z5so6247315edd.3
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 02:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rrAIemtb4192qfSOVxsRbeF+XjROxaOak0qG0wpLn8A=;
 b=k1o2qvQnbzWW6LXu3NMlICAenBvihW4lTYMXBUVkvTF4VHjOeTgaJI71XFHfWo8Fu7
 +USyrvrz817X+QUhAzgfJHKPD3alsxoUktX2eaZufUI/XkU81Fnv5XYsZY6FzPo+OtYE
 kIS5wyL/6OmBON76Y1n1krDrJdK3ttKETQolJVvf+2bjX1So0UWZcSl7zo0lxdSmDMOe
 I3k3nXRcjuodB+xThsvBeVqHfRmts6RqK1Nie4qKZt9xttqoAQtiH/8Tj4egGWyqf/Zy
 LqFJXoe4HNCWWAidUvLZzYEcVblvi7w47YS7qSBDGhckpE2xV2w6W/nrejCUCJ4ZZK1h
 zSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rrAIemtb4192qfSOVxsRbeF+XjROxaOak0qG0wpLn8A=;
 b=fzFGIxHsEBJwKi1w/Kt2UwZ7A5kX7Wa09hqCimK357FCrQDVnkEv8e1xItU/Z1GpgM
 aYdLmAPrn7SC/sx8/XChSZdLFuRaVQj8pHY7E2Zrw3G2aUt1E+/2JPrMm7YEGzf69GNo
 JcyMaxCZXK0MB3tyBKswaR++lTv0X/wIP2uYGz8HA4wpvGT3Lmvjz3oXyoBJPyaHeGuQ
 Cba+KSBIldJqXWiKuCGY5JgqcWOrZh9AqWI1jE23F9UvA/aq8rLNFmt/uP7i6IpJQUEq
 NTTlYTHl1nuIip6kq5I06Fao1ibQKBSvZbxvA7VWYeSVRNt76IEbzMEh2l/pJtB/2dq1
 +Y6g==
X-Gm-Message-State: AOAM532or6DP9EmLgsDXmGRE88Sv46jkQsU8OjNespNhN9ZzTj6wIZGi
 56UHe2te3bFFypKSaGn9i3BBoQC0UBs=
X-Google-Smtp-Source: ABdhPJx5b36cQRGGqfMMFpajv2rWpKsoi8PFf7lxCf+10gqK3SiAcqtjpRFW+UmEUKKqOK3AnkeaRA==
X-Received: by 2002:a05:6402:1c01:: with SMTP id
 ck1mr2260623edb.262.1639738205882; 
 Fri, 17 Dec 2021 02:50:05 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 i9sm2717706ejw.170.2021.12.17.02.50.03 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 02:50:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cpu: remove unnecessary #ifdef CONFIG_TCG
Date: Fri, 17 Dec 2021 11:49:41 +0100
Message-Id: <20211217104941.179823-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"if (tcg_enabled())" allows elision of the code inside it; we only need
the prototype to exist, so that the code compile even for the --disable-tcg
case.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpu.c                  | 5 -----
 include/exec/cpu-all.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/cpu.c b/cpu.c
index 9bce67ef55..945dd3dded 100644
--- a/cpu.c
+++ b/cpu.c
@@ -137,12 +137,10 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     if (!accel_cpu_realizefn(cpu, errp)) {
         return;
     }
-#ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
         tcg_exec_realizefn(cpu, errp);
     }
-#endif /* CONFIG_TCG */
 
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
@@ -169,12 +167,9 @@ void cpu_exec_unrealizefn(CPUState *cpu)
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
     }
 #endif
-#ifdef CONFIG_TCG
-    /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
         tcg_exec_unrealizefn(cpu);
     }
-#endif /* CONFIG_TCG */
 
     cpu_list_remove(cpu);
 }
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 3c8e24292b..bb37239efa 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -437,12 +437,10 @@ void dump_opcount_info(GString *buf);
 
 #endif /* !CONFIG_USER_ONLY */
 
-#ifdef CONFIG_TCG
 /* accel/tcg/cpu-exec.c */
 int cpu_exec(CPUState *cpu);
 void tcg_exec_realizefn(CPUState *cpu, Error **errp);
 void tcg_exec_unrealizefn(CPUState *cpu);
-#endif /* CONFIG_TCG */
 
 /* Returns: 0 on success, -1 on error */
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-- 
2.33.1


