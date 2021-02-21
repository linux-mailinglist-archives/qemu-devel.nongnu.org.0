Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3699320B09
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:45:38 +0100 (CET)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpzN-0001Wk-QO
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqK-0007EN-Mo
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:16 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqJ-000371-1q
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:16 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h98so11533409wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e15Rl8H6DBZJO0DusLxuCaUW4jtuBTP32AnE0pOPNJQ=;
 b=IukHqDdKdtDtwISKpz81Lw3mG0CFu5xp37eyql53GVtGluo81mPuzbQiwm78I/5jIk
 MaQG2yl4GnHxdHnTDKIQJJQgzSnfZtWLmILk9NS0wVqayHFtmlYtyBybu/QQfzmcZn80
 CrJPn9/VrfdIpaibcGR60aGt8JQ6MVI1QRkZdLEeNxuzGpEtEeYaEVCbpeB20BxG5jg6
 o3T1bqFNROtIbg7bBQPf17YQjv+lW9sxTUQ8xL3/cvQAv+pg9M+fW0Rd/XLDB3EQEIzJ
 yBJDBtaQG1ax1fuJQIvykhMmFS5KDzln0Ou79/zmu6w3sif+mNWp+sKltVvhryX/8wxZ
 Nt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e15Rl8H6DBZJO0DusLxuCaUW4jtuBTP32AnE0pOPNJQ=;
 b=QURuXBbdgW8pSxb6b5GAeI08Nz0QbxYBnk+tnYOpYECA6LIYXlxRhR/lA8LxBCif0z
 KiXw2OpwQyy+2Rc8cpZGNPsLf9kKaTD0ulTWNQPeMR0p2eKV1uWvkd7K0tGEtWkrnGfe
 Gmhr7QYmiIWE3CO119Lg95buwwZXQ9yvTXlI4oCxxyVK8QOWDjSPSlEuBqn99/1tCAXX
 THurh6R+6k3bWocMZGEVDTu4Jqucm/mKm3f7P3a8WQ0WeAtRLfT3mw78xuBSzSRLat5i
 OG4bAi/ffXHqyvbo3qfcN7L161ZelfPrIqyotNN7W+8A9ciAsnLKEYbi7V2zYdoQMzYZ
 JWtA==
X-Gm-Message-State: AOAM533UW01XRKT9mTQGVqefW1MFIrETSk1Pa5pIqAfsCSkdKg58gCuh
 L+VyB10f21E3/8JCX8eotGbe3nKmvfQ=
X-Google-Smtp-Source: ABdhPJwtPA+o/TU9bXQVUC1AoPsz3ex5WRN8P8yAR64fSszXOy6LNhCRhWNM1nkqFcEiiS0XgXNTgw==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr17792373wri.77.1613918173574; 
 Sun, 21 Feb 2021 06:36:13 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w11sm2368961wru.3.2021.02.21.06.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/43] target/mips: Let CPUMIPSTLBContext::map_address() take
 MMUAccessType
Date: Sun, 21 Feb 2021 15:34:09 +0100
Message-Id: <20210221143432.2468220-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_seg_physical_address() calls CPUMIPSTLBContext::map_address()
handlers passing a MMUAccessType type. Update the prototype
handlers to take a MMUAccessType argument, as it is stricter than
an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-14-f4bug@amsat.org>
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
index 4db8a7582d4..b48f892a513 100644
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


