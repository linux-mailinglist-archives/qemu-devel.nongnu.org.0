Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831AA1769C8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 02:03:15 +0100 (CET)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8vxq-0004E3-GO
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 20:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45447)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl0-0002oS-EV
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vky-0004Yn-Oc
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:58 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38713)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkx-0004WE-UX
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:56 -0500
Received: by mail-pf1-x443.google.com with SMTP id q9so560280pfs.5
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 16:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=w0rkiSrEP29kyeWR5iSkNuT9vmqTLCQckp24RIRfysc=;
 b=ltbIk7D25Snlht3Gxq1PCQTiotaY+wadEJCQH312niibQLkKCgqbMRERmMq1n9ksag
 lXzPPfwa7v8fCIVxVW/Xa3RiWcLClK6fZ/BnDVGeBxTTHoXfSyqQfp0WNKuLP2r+OFMd
 8UuR+Ar5AGW3k7lSJeBT9QEdiljeZeSFi08bObHgSqORwiRRH6CkJAwpMGLXEiVIgTHj
 HHIXrx1VyR9XTpRvim3PH9ozG7g6GCEcN4NEVUj2vrhR0UuMQvmI6b/zIqbn8Np/pdOh
 YU3rhpDenj0vC/LQd94va3uCBwhQFvhrX7HkmJRDX7SV4f0PyVRnCWCU2vB77CSQd8od
 VOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=w0rkiSrEP29kyeWR5iSkNuT9vmqTLCQckp24RIRfysc=;
 b=t3VgMepTq62s1KOGEIAK+VdbouWZRomSStLrXf2ylyJXNeQIHvPoIVYotApS7kvz+z
 wBYZWD5FsxCBScWNRPwK/SX5ceKlj/id7yXTG8wvwT2vCTXg3ct1tYD900Cps2EmM02b
 22lP3rU8rVEMf4DAGrB04A+8TqRmnadc913TEIHVWvh8ADYDTD9sgHps7PMnLFVfl1W0
 f/MI8V7KgGSY7VMLAugXZD5gwH8rxoFOvO7WdM3gm0u4d/VRaFP+ekmxtfpg4nb9YvXq
 PLnv5lGKNmG5jPkPhAPL6d7Lj1Kdc2GKRfVQ/c/aRMkhqV+MkK3bSUsHBg40QFhlwMxS
 kFPA==
X-Gm-Message-State: ANhLgQ2KFsfKrVz/0Oajh8F5TcGuV8iXcJctr2eTIuCF8k9bKseZcIwX
 4skWWqMa4B/s+YHMSL6GMDW8+A==
X-Google-Smtp-Source: ADFU+vu4CDhk/Vcb14fa4GvavTH3LG9812Uh3ztyKwAICIYd/6BOYf4W/CPnRC7trbrLaUxnCFAcvQ==
X-Received: by 2002:a63:2356:: with SMTP id u22mr1451340pgm.245.1583196592667; 
 Mon, 02 Mar 2020 16:49:52 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 9sm18307328pge.65.2020.03.02.16.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:52 -0800 (PST)
Subject: [PULL 31/38] target/riscv: Raise the new execptions when 2nd stage
 translation fails
Date: Mon,  2 Mar 2020 16:48:41 -0800
Message-Id: <20200303004848.136788-32-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 584b0c71fb..9e28b19c29 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -587,16 +587,28 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     }
     switch (access_type) {
     case MMU_INST_FETCH:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_LOAD:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_STORE:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.25.0.265.gbab2e86ba0-goog


