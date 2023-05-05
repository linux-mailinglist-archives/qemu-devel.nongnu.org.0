Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB96F863C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:54:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxki-0003Nk-C1; Fri, 05 May 2023 11:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkg-0003M5-Ev
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:46 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkd-0008Dv-B6
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f315712406so104948825e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302022; x=1685894022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zoEEH2SuG2Jc65Yq/EaqjlTvHP7WVTKMHEseOjxo3JE=;
 b=Vq1pgt3cgbVS4TIbhrWIQe1uP9QRp6/PFRLzOumcKivyP7q1hUZtP6CYC05/JOsdzN
 Hf+CgKDXb1Tc5dR/V1JF6CxtCd0tAQ5e5rbhn1IlOzyxVWapFRoMBRHF9P9lgInc1pp7
 j72xtSnC/ovUTf17Yeny2spbi51Wf4O/o9hYSMW8lrJRDozSlc7GUwwhPZh+/uABAbFp
 VXFCxN52l9CAwJWZ64G+Yk+GtNgWqCed0MzGr569FcPFIVUEbUrLjicpnVJ06GhypYhb
 7vmf6414vOe+9V0eBGCVElvLSErHJqyln40G41V3n7QzLOCYPkkYu6lfVy5h2jO4H+HK
 naRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302022; x=1685894022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zoEEH2SuG2Jc65Yq/EaqjlTvHP7WVTKMHEseOjxo3JE=;
 b=D0he69xubj6nevu+bGcdr3QrLLn0aNXmQZ4bLi+V1HQ3bBiNtmrUDfvVkBdjzAgwHT
 OJaGvb+HgEN9TEA2Hwa2WYS41Qpb1e1F4wB/8M16GS7xq2Le6v6IliX1ih/57Ll0GpQ4
 3TOzmAO6BPA/fGqP/mrcMdZ8O2JYNrMlPHAu/N9IhMTbZJ6G7HKl6zH/eMaIB8xjBAJj
 Hiq+VVVQWaqbpyRgZVWUAY0F3+/GJrv7j5zLNRcyeo0no0lAeR8pa635iIr4yfWyjoaC
 3GWzfzT1ROUHjotc1u5gM9MCDcCS5YKKPFavIeQIDdV2UarNUZNEm89/D5+avlxDPF9C
 oHRQ==
X-Gm-Message-State: AC+VfDwJ/B0Bu64mGdA0do6DV6hPM4PhgSJYDk4t5+8s8/iSsTyE/E5u
 mof0HeNRZylyx1yDiBRf+tmQkg==
X-Google-Smtp-Source: ACHHUZ5QNo4zUgiYRyqfRlibc51u00SddyeGcpjJT5CAwsCZX3FgK5XSL1GJwUh5Hli0y2aD8aa4iA==
X-Received: by 2002:a5d:5233:0:b0:2f8:1305:dce1 with SMTP id
 i19-20020a5d5233000000b002f81305dce1mr1796857wra.19.1683302021798; 
 Fri, 05 May 2023 08:53:41 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k11-20020adff5cb000000b0030649242b72sm2751012wrp.113.2023.05.05.08.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8EDB81FFC3;
 Fri,  5 May 2023 16:53:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 08/10] tcg: remove the final vestiges of dstate
Date: Fri,  5 May 2023 16:53:34 +0100
Message-Id: <20230505155336.137393-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505155336.137393-1-alex.bennee@linaro.org>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now we no longer have dynamic state affecting things we can remove the
additional fields in cpu.h and simplify the TB hash calculation.

For the benchmark:

    hyperfine -w 2 -m 20 \
      "./arm-softmmu/qemu-system-arm -cpu cortex-a15 \
        -machine type=virt,highmem=off \
        -display none -m 2048 \
        -serial mon:stdio \
        -netdev user,id=unet,hostfwd=tcp::2222-:22 \
        -device virtio-net-pci,netdev=unet \
        -device virtio-scsi-pci \
        -blockdev driver=raw,node-name=hd,discard=unmap,file.driver=host_device,file.filename=/dev/zen-disk/debian-bullseye-armhf \
        -device scsi-hd,drive=hd -smp 4 \
        -kernel /home/alex/lsrc/linux.git/builds/arm/arch/arm/boot/zImage \
        -append 'console=ttyAMA0 root=/dev/sda2 systemd.unit=benchmark.service' \
        -snapshot"

It has a marginal effect on runtime, before:

  Time (mean ± σ):     26.279 s ±  2.438 s    [User: 41.113 s, System: 1.843 s]
  Range (min … max):   24.420 s … 32.565 s    20 runs

after:

  Time (mean ± σ):     24.440 s ±  2.885 s    [User: 34.474 s, System: 2.028 s]
  Range (min … max):   21.663 s … 29.937 s    20 runs

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1358
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230503091756.1453057-9-alex.bennee@linaro.org>
---
 accel/tcg/tb-hash.h       | 6 +++---
 include/exec/exec-all.h   | 3 ---
 include/hw/core/cpu.h     | 5 -----
 accel/tcg/cpu-exec.c      | 7 +------
 accel/tcg/tb-maint.c      | 5 ++---
 accel/tcg/translate-all.c | 6 ------
 6 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
index 83dc610e4c..1d19c69caa 100644
--- a/accel/tcg/tb-hash.h
+++ b/accel/tcg/tb-hash.h
@@ -61,10 +61,10 @@ static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
 #endif /* CONFIG_SOFTMMU */
 
 static inline
-uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc, uint32_t flags,
-                      uint32_t cf_mask, uint32_t trace_vcpu_dstate)
+uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc,
+                      uint32_t flags, uint32_t cf_mask)
 {
-    return qemu_xxhash7(phys_pc, pc, flags, cf_mask, trace_vcpu_dstate);
+    return qemu_xxhash6(phys_pc, pc, flags, cf_mask);
 }
 
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ecded1f112..3ee76af28b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -548,9 +548,6 @@ struct TranslationBlock {
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
-    /* Per-vCPU dynamic tracing state used to generate this TB */
-    uint32_t trace_vcpu_dstate;
-
     /*
      * Above fields used for comparing
      */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 397fd3ac68..4b399643d0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -262,7 +262,6 @@ typedef void (*run_on_cpu_func)(CPUState *cpu, run_on_cpu_data data);
 struct qemu_work_item;
 
 #define CPU_UNSET_NUMA_NODE_ID -1
-#define CPU_TRACE_DSTATE_MAX_EVENTS 32
 
 /**
  * CPUState:
@@ -403,10 +402,6 @@ struct CPUState {
     /* Use by accel-block: CPU is executing an ioctl() */
     QemuLockCnt in_ioctl_lock;
 
-    /* Used for events with 'vcpu' and *without* the 'disabled' properties */
-    DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
-    DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);
-
     DECLARE_BITMAP(plugin_mask, QEMU_PLUGIN_EV_MAX);
 
 #ifdef CONFIG_PLUGIN
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index bc0e1c3299..973da2a434 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -175,7 +175,6 @@ struct tb_desc {
     tb_page_addr_t page_addr0;
     uint32_t flags;
     uint32_t cflags;
-    uint32_t trace_vcpu_dstate;
 };
 
 static bool tb_lookup_cmp(const void *p, const void *d)
@@ -187,7 +186,6 @@ static bool tb_lookup_cmp(const void *p, const void *d)
         tb_page_addr0(tb) == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
-        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
         tb_cflags(tb) == desc->cflags) {
         /* check next page if needed */
         tb_page_addr_t tb_phys_page1 = tb_page_addr1(tb);
@@ -228,7 +226,6 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     desc.cs_base = cs_base;
     desc.flags = flags;
     desc.cflags = cflags;
-    desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
     phys_pc = get_page_addr_code(desc.env, pc);
     if (phys_pc == -1) {
@@ -236,7 +233,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     }
     desc.page_addr0 = phys_pc;
     h = tb_hash_func(phys_pc, (cflags & CF_PCREL ? 0 : pc),
-                     flags, cflags, *cpu->trace_dstate);
+                     flags, cflags);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
@@ -263,7 +260,6 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                    jc->array[hash].pc == pc &&
                    tb->cs_base == cs_base &&
                    tb->flags == flags &&
-                   tb->trace_vcpu_dstate == *cpu->trace_dstate &&
                    tb_cflags(tb) == cflags)) {
             return tb;
         }
@@ -282,7 +278,6 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                    tb->pc == pc &&
                    tb->cs_base == cs_base &&
                    tb->flags == flags &&
-                   tb->trace_vcpu_dstate == *cpu->trace_dstate &&
                    tb_cflags(tb) == cflags)) {
             return tb;
         }
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index cb1f806f00..432a0cffdb 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -50,7 +50,6 @@ static bool tb_cmp(const void *ap, const void *bp)
             a->cs_base == b->cs_base &&
             a->flags == b->flags &&
             (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
-            a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
             tb_page_addr0(a) == tb_page_addr0(b) &&
             tb_page_addr1(a) == tb_page_addr1(b));
 }
@@ -888,7 +887,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     /* remove the TB from the hash list */
     phys_pc = tb_page_addr0(tb);
     h = tb_hash_func(phys_pc, (orig_cflags & CF_PCREL ? 0 : tb->pc),
-                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
+                     tb->flags, orig_cflags);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
@@ -969,7 +968,7 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
     /* add in the hash table */
     h = tb_hash_func(phys_pc, (tb->cflags & CF_PCREL ? 0 : tb->pc),
-                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
+                     tb->flags, tb->cflags);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
     /* remove TB from the page(s) if we couldn't insert it */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5b13281119..2ea42970e1 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -65,11 +65,6 @@
 #include "internal.h"
 #include "perf.h"
 
-/* Make sure all possible CPU event bits fit in tb->trace_vcpu_dstate */
-QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
-                  sizeof_field(TranslationBlock, trace_vcpu_dstate)
-                  * BITS_PER_BYTE);
-
 TBContext tb_ctx;
 
 /* Encode VAL as a signed leb128 sequence at P.
@@ -348,7 +343,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
-    tb->trace_vcpu_dstate = *cpu->trace_dstate;
     tb_set_page_addr0(tb, phys_pc);
     tb_set_page_addr1(tb, -1);
     tcg_ctx->gen_tb = tb;
-- 
2.39.2


