Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4382C682F78
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqvr-00047S-8s; Tue, 31 Jan 2023 08:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqvp-00047C-S6
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:44:17 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqvm-0006V8-T2
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:44:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id k16so10379673wms.2
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 05:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnBnWPYZTJbtqglsFebcan2CK1/moGM7upa/HPAcASY=;
 b=s87HJBFMwu70JeiT/b45Ow0Qn3rHu7bS7vFRw+vffUis2sgQLkD+oCVOfdv8D+geiP
 VbzIKHNznO1fMXLxedThqw33tg/MAU0tdQj9emshENFZ17zRwd9oAKQ8yxnc/kArFA8Y
 1x3PdoBOWCMTalFQSYgCFqVf8FZDJfKGdaxfkoVMjbItJYHtU5NxQnipTm+M+YTkKpSB
 wDHOeGPbzSsg4Kj7J15OIr/zbHPhIjWOuoF4xam+0+ma7hANb6wD0kvU6Z5jXUjWYvK1
 k/U5bHe/Nf6l5kMv1ix0B7tteGv5jZKhWfQtf+BCQbysnFLKz0on7jVVoNU8AjrpHy0R
 C55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnBnWPYZTJbtqglsFebcan2CK1/moGM7upa/HPAcASY=;
 b=i+Y88CUUbnGtI7WbDX4pRxcTjGGYKQbbZ9f9TUy8sfQLc8/yBkAvSVBtPCXZIUi+b7
 zQqc3Hxh7eSalqQyRZIO9MbCJ2Ibw/B3qkpxDzXaeFSCDoczLvmUc/KsAlG/ZMm25WR/
 m5pVvMPFb8KwYgsNt81wviSA73K8PlyMF8pArgTZ/Td6nRmBfaY4V+6Qjuifda4EKICl
 PS81diavghzZArCYVpyIaLG8vlUyCMWJI3sSdNqIQLMrsiR4ECh1Y1aCVtjmDIX1upZB
 fhLpPfmDubJ29JVB0qewmEQfVBZqxOalJJJLdyGB6x6TGkiJ4aImpp8t6jaDjmmSw/qx
 rN0w==
X-Gm-Message-State: AFqh2krK8uPl0pIyt1kSHIbdwUvASJxZsSaOuRh23YjtWkdsLOgQsPb4
 Hm7Mn4pF7oMpVKRK34y+R+lsgA==
X-Google-Smtp-Source: AMrXdXvSi4cR1fwWVRlWrtR2Q9AZ1HH7nA3Hr2AuyvmfwS2+JHt/p8biQlRTFnpAOHejUIjQKGDyxg==
X-Received: by 2002:a05:600c:4f96:b0:3db:2dbb:d70e with SMTP id
 n22-20020a05600c4f9600b003db2dbbd70emr42419610wmq.6.1675172653566; 
 Tue, 31 Jan 2023 05:44:13 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c2d9300b003dc4fd6e624sm9127246wmg.19.2023.01.31.05.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 05:44:13 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v9 5/5] riscv: Correctly set the device-tree entry 'mmu-type'
Date: Tue, 31 Jan 2023 14:39:06 +0100
Message-Id: <20230131133906.1956228-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131133906.1956228-1-alexghiti@rivosinc.com>
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The 'mmu-type' should reflect what the hardware is capable of so use the
new satp_mode field in RISCVCPUConfig to do that.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/virt.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94ff2a1584..48d034a5f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
-    char *name, *cpu_name, *core_name, *intc_name;
+    uint8_t satp_mode_max;
+    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
@@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         cpu_name = g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_MMU)) {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-                                    "riscv,none");
-        }
+
+        satp_mode_max = satp_mode_max_from_map(
+                            s->soc[socket].harts[cpu].cfg.satp_mode.map);
+        sv_name = g_strdup_printf("riscv,%s",
+                                  satp_mode_str(satp_mode_max, is_32_bit));
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type", sv_name);
+        g_free(sv_name);
+
         name = riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
-- 
2.37.2


