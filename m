Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF66E69005C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:31:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0SS-0007ln-SL; Thu, 09 Feb 2023 01:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Rw-0007XF-8x
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:30:30 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Ru-0000lA-Co
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:30:27 -0500
Received: by mail-pg1-x530.google.com with SMTP id n3so925510pgr.9
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qlPh49wlbxVVcOm0Ok3pVswLtoV2NRPuPBXAw/YmxdU=;
 b=wp7Yab735sy01MLbrgfsOESNTTb0h03RSrJ/08EgpczVM5M4TOzymFCeAMkBPWNKNm
 /g1h/CZZe0fb3FfaFNqX+OAFyjrcrBdPVjnQq0Kx7qAHYBLyEBm78e3RoNJxISh7jQhJ
 MJJ/Yav2m4F8+LFZFtFrtG7K8gIiW5DwvLnQSrUBM6CwE7hd7dVoqIUWa7ZEfcmj3ju1
 MG2GO6wEykuI4qOei9WjgWfNJCK2D3lr3rhUeawqFWlHLSGl1m5iMggZmHi2wr9aPqJ/
 AeAgOPh1/r98lGKVpSrfuygrqNxG1PcOCEM+7dmG0HKtN7W1Ebfwl8PP6UZ4eSaHC6kK
 QdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qlPh49wlbxVVcOm0Ok3pVswLtoV2NRPuPBXAw/YmxdU=;
 b=R34bNpzY34RB881wQjfnI9fhXBReXhIb/9ZOgv9J9hBTCr3ICoCI8p2gQla9u7cv00
 Enqeif+cahIaL8koRl3HzaDXT2nshBAqb9a3DRVNOsW/qWJjOHTsCWMuZsY5LJTO+KKj
 dQvmfBiuq1cK/vMguz7D/n/w49MmayBVe7sjGeTa7yc411Ofom+QN6l7QvE3z22lF/C9
 b5BOM/qRksgkFNpeITh1yjVVj796TBR2Y+Ft4alfLKImNAMcUrMKFAJVrMFxo398bnF6
 qw9Q+4Qj7Mul3KgMp+uqf3fondp+YzsJsXw6yDY3L2Tmxl5jqYb8Loddyx8Gk4BhaJax
 G+JQ==
X-Gm-Message-State: AO0yUKVTeqpGIXqyzsdupqzklHAh57aNkdu64trA90vqMnC9u46VUigb
 jQg+VV1nRm3l9A1/WYtaKq9B7OrEd2Jz9X40
X-Google-Smtp-Source: AK7set+aIDc0/0LKIFdjo4kcedHR8xbTL6xdARubTtD7bXEb5o15/SNrwLDEuTLZt/kWuRc8gRkwVA==
X-Received: by 2002:a62:1a4f:0:b0:593:b491:40b8 with SMTP id
 a76-20020a621a4f000000b00593b49140b8mr8361545pfa.4.1675924224570; 
 Wed, 08 Feb 2023 22:30:24 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7848f000000b00593c434b1b8sm543649pfn.48.2023.02.08.22.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:30:24 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 2/9] target/riscv: zisslpcfi CSR,
 bit positions and other definitions
Date: Wed,  8 Feb 2023 22:29:40 -0800
Message-Id: <20230209062947.3585481-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062947.3585481-1-debug@rivosinc.com>
References: <20230209062947.3585481-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

`zisslpcfi` extension adds two new CSRs. CSR_SSP and CSR_LPLR.
- CSR_SSP: This CSR holds shadow stack pointer for current privilege mode
           CSR_SSP is accessible in all modes. Each mode must establish
           it's own CSR_SSP.

- CSR_LPLR: This CSR holds label value set at the callsite by compiler.
            On call target label check instructions are emitted by
            compiler which check label value against value present in
            CSR_LPRL.

Enabling of `zisslpcfi` is controlled via menvcfg (for S/HS/VS/U/VU) and
henvcfg (for VS/VU) at bit position 60.

Each mode has enable/disable bits for forward cfi. Backward cfi doesn't
have separate enable/disable bits for S and M mode. User forward cfi and
user backward cfi enable/disable bits are in mstatus/sstatus CSR.
Supervisor forward cfi enable/disable bit are in menvcfg and henvcfg CSR.
Machine mode forward cfi enable/disable bit is in mseccfg CSR.

If forward cfi enabled, all indirect branches must land on a landing pad
instruction (`lpcll`, introduced in later commits). CPU/hart tracks this
internally using a landing pad tracker called `elp` short for `expecting
landing pad`. An interrupt can occur between an indirect branch and
target. If such an event occurs `elp` is saved away in mstatus/sstatus
CSR

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu.h      |  5 +++++
 target/riscv/cpu_bits.h | 25 +++++++++++++++++++++++++
 target/riscv/pmp.h      |  3 ++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9a923760b2..18db61a06a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -181,6 +181,11 @@ struct CPUArchState {
 
     uint32_t features;
 
+    /* CFI Extension user mode registers and state */
+    uint32_t     lplr;
+    target_ulong ssp;
+    cfi_elp      elp;
+
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8b0d7e20ea..1663ba5775 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -39,6 +39,10 @@
 
 /* Control and Status Registers */
 
+/* CFI CSRs */
+#define CSR_LPLR            0x006
+#define CSR_SSP             0x020
+
 /* User Trap Setup */
 #define CSR_USTATUS         0x000
 #define CSR_UIE             0x004
@@ -542,6 +546,10 @@
 #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
 #define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
 #define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
+#define MSTATUS_UFCFIEN     0x00800000 /* Zisslpcfi-0.1 */
+#define MSTATUS_UBCFIEN     0x01000000 /* Zisslpcfi-0.1 */
+#define MSTATUS_SPELP       0x02000000 /* Zisslpcfi-0.1 */
+#define MSTATUS_MPELP       0x04000000 /* Zisslpcfi-0.1 */
 #define MSTATUS_GVA         0x4000000000ULL
 #define MSTATUS_MPV         0x8000000000ULL
 
@@ -572,12 +580,21 @@ typedef enum {
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define SSTATUS_MXR         0x00080000
+#define SSTATUS_UFCFIEN     MSTATUS_UFCFIEN /* Zisslpcfi-0.1 */
+#define SSTATUS_UBCFIEN     MSTATUS_UBCFIEN /* Zisslpcfi-0.1 */
+#define SSTATUS_SPELP       MSTATUS_SPELP   /* Zisslpcfi-0.1 */
 
 #define SSTATUS64_UXL       0x0000000300000000ULL
 
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
 
+#define CFISTATUS_M_MASK    (MSTATUS_UFCFIEN | MSTATUS_UBCFIEN | \
+                             MSTATUS_MPELP | MSTATUS_SPELP)
+
+#define CFISTATUS_S_MASK    (SSTATUS_UFCFIEN | SSTATUS_UBCFIEN | \
+                             SSTATUS_SPELP)
+
 /* hstatus CSR bits */
 #define HSTATUS_VSBE         0x00000020
 #define HSTATUS_GVA          0x00000040
@@ -747,10 +764,14 @@ typedef enum RISCVException {
 #define MENVCFG_CBIE                       (3UL << 4)
 #define MENVCFG_CBCFE                      BIT(6)
 #define MENVCFG_CBZE                       BIT(7)
+#define MENVCFG_SFCFIEN                    BIT(59)
+#define MENVCFG_CFI                        BIT(60)
 #define MENVCFG_PBMTE                      (1ULL << 62)
 #define MENVCFG_STCE                       (1ULL << 63)
 
 /* For RV32 */
+#define MENVCFGH_SFCFIEN                   BIT(27)
+#define MENVCFGH_CFI                       BIT(28)
 #define MENVCFGH_PBMTE                     BIT(30)
 #define MENVCFGH_STCE                      BIT(31)
 
@@ -763,10 +784,14 @@ typedef enum RISCVException {
 #define HENVCFG_CBIE                       MENVCFG_CBIE
 #define HENVCFG_CBCFE                      MENVCFG_CBCFE
 #define HENVCFG_CBZE                       MENVCFG_CBZE
+#define HENVCFG_SFCFIEN                    MENVCFG_SFCFIEN
+#define HENVCFG_CFI                        MENVCFG_CFI
 #define HENVCFG_PBMTE                      MENVCFG_PBMTE
 #define HENVCFG_STCE                       MENVCFG_STCE
 
 /* For RV32 */
+#define HENVCFGH_SFCFIEN                    MENVCFGH_SFCFIEN
+#define HENVCFGH_CFI                        MENVCFGH_CFI
 #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
 #define HENVCFGH_STCE                       MENVCFGH_STCE
 
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index da32c61c85..f5bfc4955b 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -43,7 +43,8 @@ typedef enum {
     MSECCFG_MMWP  = 1 << 1,
     MSECCFG_RLB   = 1 << 2,
     MSECCFG_USEED = 1 << 8,
-    MSECCFG_SSEED = 1 << 9
+    MSECCFG_SSEED = 1 << 9,
+    MSECCFG_MFCFIEN =  1 << 10
 } mseccfg_field_t;
 
 typedef struct {
-- 
2.25.1


