Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0123068B6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:37:51 +0100 (CET)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vJm-0002jQ-9H
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4vIG-0002F1-5V
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 19:36:16 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4vID-0005hT-Au
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 19:36:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u14so2922642wml.4
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 16:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8utqxPpitXaSmR9NLbaxoT1sgLxrNIez816r2NaVv6A=;
 b=bMpRCHDnP/hmo5j1sma07V9SukzR7PtfgNllO+569sffkc86IZ0/DTPWahnP7d5syJ
 vVIIxCrtb9VsHlArBZD3OaAqQmHp2eSIxRX/Lb7X3ExrspcB+0ymURMxy3R8oaklncIp
 1k5KmykBvk5H6cOb0DlQruhF3UnLRvloW9GFxo9VdSdSvPkwoKvk20oxd4izRrYynUMh
 +AhDhjM8ktpo1Zt12Gimwp0l5bCjrsYg8gwHj9vYRJlxI/i+FZa1ZPlh2qGoPXOP0tCi
 m/KdpqjSnlSe7S73/kuuTssdRnc5BJUcL9fDNMfid+PPWCcBYM3Sqit/2mmTUGDuRd9a
 MMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8utqxPpitXaSmR9NLbaxoT1sgLxrNIez816r2NaVv6A=;
 b=SeR0nZlhS331IK7jLFk5MigSBWCoSwFo1MT7enejQgIBsq9Ouwk6A6YgB/ULVOKvB4
 qDqqrrAwBgvh2rGl2f/CDhjPoNeSG54OA2nDNHvaAjzN4veaAlGhpidB/h5xXmaHB1IX
 Lx5jNkuE+cxILfgxnuMmaJyB2apfB/Ey/SiyOiifKzC1g4PZQbUXhPTmTxjbJv+Lu6s/
 YYAg8ZMPnzJmfrKdB33UVLmTfBxAansLeqz7zLAxLK3wRUiUrCK00N1RYv1ZGTlABR05
 yeSH0JY9AOS7+W5jJDZU2q8dQzf/+skec6PbZK9+nWJJCfw17/6GyHoKCA6QYHfvmotj
 auSA==
X-Gm-Message-State: AOAM533uI2b0llmdVUuhHZqqkxUy8I4r50VkVREnWimoJK34kNjq6t9x
 Qnb63o3OnH6fnlCSfoQe4NUt4jU7PsA=
X-Google-Smtp-Source: ABdhPJw0NcoW/OUd866vrh59NNvVbovyYUFYS7GstUoCT5NrvdsljoovwfGsIwsYk1rGti2DEd8D/w==
X-Received: by 2002:a1c:9cd8:: with SMTP id f207mr6391200wme.155.1611794171095; 
 Wed, 27 Jan 2021 16:36:11 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b132sm4175544wmh.21.2021.01.27.16.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:36:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/moxie: Let moxie_mmu_translate() use MMUAccessType
 access_type
Date: Thu, 28 Jan 2021 01:36:08 +0100
Message-Id: <20210128003608.3563322-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Anthony Green <green@moxielogic.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

moxie_mmu_translate() doesn't do much work. Still keep its
prototype similar to the other targets, by taking a MMUAccessType
argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/moxie/mmu.h    | 2 +-
 target/moxie/helper.c | 2 +-
 target/moxie/mmu.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/moxie/mmu.h b/target/moxie/mmu.h
index d80690f4d2f..9fddc336746 100644
--- a/target/moxie/mmu.h
+++ b/target/moxie/mmu.h
@@ -14,6 +14,6 @@ typedef struct {
 
 int moxie_mmu_translate(MoxieMMUResult *res,
                         CPUMoxieState *env, uint32_t vaddr,
-                        int rw, int mmu_idx);
+                        MMUAccessType access_type, int mmu_idx);
 
 #endif
diff --git a/target/moxie/helper.c b/target/moxie/helper.c
index b1919f62b34..0e72b1726e3 100644
--- a/target/moxie/helper.c
+++ b/target/moxie/helper.c
@@ -112,7 +112,7 @@ hwaddr moxie_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     MoxieMMUResult res;
     int miss;
 
-    miss = moxie_mmu_translate(&res, &cpu->env, addr, 0, 0);
+    miss = moxie_mmu_translate(&res, &cpu->env, addr, MMU_DATA_LOAD, 0);
     if (!miss) {
         phy = res.phy;
     }
diff --git a/target/moxie/mmu.c b/target/moxie/mmu.c
index 87783a36f82..228d4c42ff4 100644
--- a/target/moxie/mmu.c
+++ b/target/moxie/mmu.c
@@ -24,7 +24,7 @@
 
 int moxie_mmu_translate(MoxieMMUResult *res,
                        CPUMoxieState *env, uint32_t vaddr,
-                       int rw, int mmu_idx)
+                       MMUAccessType access_type, int mmu_idx)
 {
     /* Perform no translation yet.  */
     res->phy = vaddr;
-- 
2.26.2


