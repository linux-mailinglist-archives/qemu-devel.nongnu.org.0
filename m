Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9230789C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:52:08 +0100 (CET)
Received: from localhost ([::1]:47044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58eV-0005kh-Qh
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58VQ-0001J3-Hq
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:44 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58VM-0007Za-22
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:41 -0500
Received: by mail-ej1-x635.google.com with SMTP id rv9so8076759ejb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LefTOWxu3inc8M7Wvu2JcycWzpy3LZGRauTlVjHIniA=;
 b=CAqQanQqoCCGv48+lYut0h4GPW52OpMAn5DC6Sqr/DzeDtppwV1xHyU+jVSdhJgErd
 yegyOP3WNDytFQavQw3/FOuU8p1qawalmGbyKnrxvG4xTcCFrjzcG0DgajtptJlqNdHN
 Ru4scxFD9H5rpddp+/FGCDad4UyOBdtiA9dZ8P6BuV83XfiBqiC6VoRnj+Viua/GaKew
 tTc64nOeeBgs6iV482t2MtfGcXYqhpU8y5+C+BZVxCKXZhILYqKFU03If4CWYK//yvlg
 TDCF3myzW4VJq8g76xorLCpERo/F9azI2wzS/75jN/LHOwfpUVGk0HQGLiVbDhj4h93l
 h+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LefTOWxu3inc8M7Wvu2JcycWzpy3LZGRauTlVjHIniA=;
 b=GHZw2D5Ve7m3m0EVLn/1qx/x94xHdDbQwB3DAlbj02MptVH71kzCVL2Xfj/M0m+ivO
 PHdsjOlNx8Bysan7h+orBqtkAnzTH+Rji6jWOjJsf08sBa/Q9iHzyYDsGKXkAEBJfPse
 Yc7FOGDIf4m+NGouJ0pa6JCnop2YrGheB2v6tVjMw5QD96YgrXLDKZMRVpo+4votNKvB
 JUjamuHJXaWdUbPpeDhBpeY9wZTS2MKTTZ5ZvJ7tteVJqAcUz+09rE0Bt+qSTZcAaZl9
 XuodxxOF8eL1bqnfINMkZY1dZm0+ac4VzuHwMZ4xHZbbitLn5rTwnFxr1lvKY0q4Gg0F
 23Ew==
X-Gm-Message-State: AOAM533N2jhO5xhgb44qqAm4vl60K6jIr19V0JhkKy/y9Hpxwc9rx/FK
 ImnvVx7HzPa+P6jp+0e092tUyiG5km8=
X-Google-Smtp-Source: ABdhPJxccUDhcJr9D9KiiD7Q+5pPn9TCzbxmrNX7KSfDUnVm3CrZmqcNB5ZNKbggczWGEg5s/6kP+w==
X-Received: by 2002:a17:906:9401:: with SMTP id
 q1mr11714453ejx.516.1611844958537; 
 Thu, 28 Jan 2021 06:42:38 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id co6sm3085161edb.96.2021.01.28.06.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:42:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/13] target/mips: Let CPUMIPSTLBContext::map_address() take
 MMUAccessType
Date: Thu, 28 Jan 2021 15:41:25 +0100
Message-Id: <20210128144125.3696119-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_seg_physical_address() calls CPUMIPSTLBContext::map_address()
handlers passing a MMUAccessType type. Update the prototype
handlers to take a MMUAccessType argument, as it is stricter than
an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h   |  8 ++++----
 target/mips/tlb_helper.c | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 34915c275c4..99264b8bf6a 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -111,7 +111,7 @@ struct CPUMIPSTLBContext {
     uint32_t nb_tlb;
     uint32_t tlb_in_use;
     int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, int rw);
+                       target_ulong address, MMUAccessType access_type);
     void (*helper_tlbwi)(struct CPUMIPSState *env);
     void (*helper_tlbwr)(struct CPUMIPSState *env);
     void (*helper_tlbp)(struct CPUMIPSState *env);
@@ -126,11 +126,11 @@ struct CPUMIPSTLBContext {
 };
 
 int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, int rw);
+                       target_ulong address, MMUAccessType access_type);
 int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, int rw);
+                          target_ulong address, MMUAccessType access_type);
 int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, int rw);
+                    target_ulong address, MMUAccessType access_type);
 void r4k_helper_tlbwi(CPUMIPSState *env);
 void r4k_helper_tlbwr(CPUMIPSState *env);
 void r4k_helper_tlbp(CPUMIPSState *env);
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 14f5b1a0a9c..2dc8ecafc3b 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -39,7 +39,7 @@ enum {
 
 /* no MMU emulation */
 int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, int rw)
+                       target_ulong address, MMUAccessType access_type)
 {
     *physical = address;
     *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -48,7 +48,7 @@ int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 
 /* fixed mapping MMU emulation */
 int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, int rw)
+                          target_ulong address, MMUAccessType access_type)
 {
     if (address <= (int32_t)0x7FFFFFFFUL) {
         if (!(env->CP0_Status & (1 << CP0St_ERL))) {
@@ -68,7 +68,7 @@ int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 
 /* MIPS32/MIPS64 R4000-style MMU emulation */
 int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, int rw)
+                    target_ulong address, MMUAccessType access_type)
 {
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
     uint32_t MMID = env->CP0_MemoryMapID;
@@ -97,13 +97,13 @@ int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
             if (!(n ? tlb->V1 : tlb->V0)) {
                 return TLBRET_INVALID;
             }
-            if (rw == MMU_INST_FETCH && (n ? tlb->XI1 : tlb->XI0)) {
+            if (access_type == MMU_INST_FETCH && (n ? tlb->XI1 : tlb->XI0)) {
                 return TLBRET_XI;
             }
-            if (rw == MMU_DATA_LOAD && (n ? tlb->RI1 : tlb->RI0)) {
+            if (access_type == MMU_DATA_LOAD && (n ? tlb->RI1 : tlb->RI0)) {
                 return TLBRET_RI;
             }
-            if (rw != MMU_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
+            if (access_type != MMU_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
                 *physical = tlb->PFN[n] | (address & (mask >> 1));
                 *prot = PAGE_READ;
                 if (n ? tlb->D1 : tlb->D0) {
-- 
2.26.2


