Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FF34A9F16
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 19:34:52 +0100 (CET)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG3Q3-0007X8-Kr
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 13:34:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gf-0004P6-7u
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:47:57 -0500
Received: from [2a00:1450:4864:20::431] (port=42730
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gd-0003p5-CP
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:47:56 -0500
Received: by mail-wr1-x431.google.com with SMTP id d15so3948247wrb.9
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cM5thpLFKGcun/AuN22UR+P9rN7cvJEekCW/fCyIm4c=;
 b=6+/2WsbkIIRY7LGLbjwQ93sNeVv9vCSt34QGuwb4fGrlCYcSUP51mH7J5efH5W5gX7
 fJYuB80HycYUEgdJvue/MKVO8KSV1DijMq3/wFcjfpFvDBO/gxshITcls3xZXfLSOU/x
 bAJwF+WEwxhSpFBtG0/BNpTIDy+AdBI4RpPefSMFsF22hV67u6jnq1FITFug4FIWsIlg
 vkxweMa2Z3YEUR8mE6pQMbvUGPEXedk5JNw+GDpn3mfOI+DnBLFbDYN3tsAEl3Zo+ZNT
 1h5VmQh8Pd1KwowDB885TwrvC9/jJDWxFn3P1epsMa+h4A8sBn1bIIHGsLVV4Ir8dYN7
 jRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cM5thpLFKGcun/AuN22UR+P9rN7cvJEekCW/fCyIm4c=;
 b=y9J1NkZ33oW8HRWCUIOwoNTYHiODJaYEn/2uM499rH6mv3GaZQdApwePKoR5l2yNHZ
 Hd55uwZMnsCpmuTPHsW0L5xNa9e/ZQrSwiNSibCZYSItAD7UTw+TLHkS/Akp8OGCSaOA
 SteLomRuaajaAegz4qyZxjYp+xYMfqQuD3Km5yFWtMXLQJeXcF0M93cRzWrSG8tTk+AI
 ZlaJqDbpfeQfq0WG3V/T5WAtExQasFXX0g1TDI108CE8T7zgc94dNhYRctQ1EpzphYxG
 R7cYiep3xtMhNRHjeyQ6T0WUuTr4Dwqco5/rE4GEL3hD+NNd4iEmm27vnF2PV4aLqsBr
 8tZg==
X-Gm-Message-State: AOAM533EfhsVNcmhDGOiakWcJrEGvLAz6vZlERtZ/wVkHW4vdy7UFC8h
 8kbMQlohrxMpD9DmKgTjLHhrrw==
X-Google-Smtp-Source: ABdhPJwIFzQmIUeXBYtJecCAdxlLJy57mJwAsltwnXg22zgQMz5FicpFo2ywKs/wIp9Xqyc8FVHr5A==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr3104wrr.664.1643996873999;
 Fri, 04 Feb 2022 09:47:53 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:53 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v9 08/23] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Fri,  4 Feb 2022 23:16:44 +0530
Message-Id: <20220204174700.534953-9-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::431;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h        | 23 +++++++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8838c61ae4..6b6df57c42 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -256,6 +256,22 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
 
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
+    ((((__xlen) & 0xff) << 24) | \
+     (((__vgein) & 0x3f) << 20) | \
+     (((__virt) & 0x1) << 18) | \
+     (((__priv) & 0x3) << 16) | \
+     (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
+#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
 
@@ -433,6 +449,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f7b8645a13..5ed4e9223c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -396,6 +396,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
     env->rdtime_fn_arg = arg;
 }
 
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask),
+                                   void *rmw_fn_arg)
+{
+    if (priv <= PRV_M) {
+        env->aia_ireg_rmw_fn[priv] = rmw_fn;
+        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
+    }
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
-- 
2.25.1


