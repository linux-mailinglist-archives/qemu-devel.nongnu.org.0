Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6406661BD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:24:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFecP-00035Z-RL; Wed, 11 Jan 2023 12:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec8-0002jw-3P
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:15 -0500
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec6-0006Nr-9A
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:11 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id
 d9-20020a4aa589000000b004af737509f4so4188780oom.11
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJyEstskuH3VB5vAnrT5gTar803EFvBC9v6S2B7z6CM=;
 b=L2pFBYsb8J3paWXpLJNkVc1tBgbIiPh0tyuJkea24Z6f5UE1WmDF6/T5dAtxPrsMGW
 elJs6zyn4xW5hL4udW6yUMxJh0mpRQYM/dBe8nP9LG8C9USieuabHQTN00TtkUccRQHX
 ISfX69jIGr2YtqwQoxfm5T4FOKz30pKbYKtPrpgA9RplJD3t44x6nK9Q+d9B/watFB/T
 48y0RHKMs0T55p9u4OkWx6QWyh7COmsbL3Si+e45ahwPQCtp5CxkKOmnVNEFwF8RwdYq
 mbMqx7SrUZOdgFK77xUzlh2/SYVBoGXN64EV8axAiT6r0W2luVDmobM3cvSSlnPz7vgN
 bKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJyEstskuH3VB5vAnrT5gTar803EFvBC9v6S2B7z6CM=;
 b=hD3B/AtgBL9brgAGuECn3pHFcNh0zJEqq7hsGtS7+ubyBLARfXgXo9m+PvSMKGFkkf
 70X+ftqJ/rYWc1cX6mrSU5fofEOztJcmUJsiBQw3FVNf3ybHtHwp1zu2ecgunhfwKIgp
 OV2eCvpjr43Z8nGXGNXNxmUFmALLOrvpgjfgllwnP+qiHt/0dTmpyjtpKZnI5iYczRNF
 REB91zSlE+FuPfKVIBfY9LJUJNG5KI8UF/xO8krqYS70mnnzZulcChU3tWIR7bhbtGfm
 wbDyvTbu7ExtWnBMRed6XE+Vqo5Za+EJCxtoT64TUhM4eBZN5Gx5teMBFdNxXAgwlxVl
 sFaQ==
X-Gm-Message-State: AFqh2kpPx2SEP1pbwQ0187hZ0zVU3td4BKh53Gp65UvYgrZ6VvTeuuPK
 3/ew6/9n5vnfI/w9dDjEjshQluPx555sqLxDlYs=
X-Google-Smtp-Source: AMrXdXsyyYqgbi9vnztN0qEJUh4sEMhVgpD0UW9FODp3c3sMvB7k9jMqwNHuHLS867xUDzKnfPJSpA==
X-Received: by 2002:a4a:c54d:0:b0:4f2:ff6:6168 with SMTP id
 j13-20020a4ac54d000000b004f20ff66168mr3065732ooq.3.1673457007534; 
 Wed, 11 Jan 2023 09:10:07 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:10:07 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 06/10] hw/riscv: use ms->fdt in
 riscv_socket_fdt_write_distance_matrix()
Date: Wed, 11 Jan 2023 14:09:44 -0300
Message-Id: <20230111170948.316276-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

There's no need to use a MachineState pointer and a fdt pointer now that
all RISC-V machines are using the FDT from the MachineState.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/numa.c         | 8 ++++----
 hw/riscv/spike.c        | 2 +-
 hw/riscv/virt.c         | 2 +-
 include/hw/riscv/numa.h | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index f4343f5cde..4720102561 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -164,7 +164,7 @@ void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
     }
 }
 
-void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void *fdt)
+void riscv_socket_fdt_write_distance_matrix(const MachineState *ms)
 {
     int i, j, idx;
     uint32_t *dist_matrix, dist_matrix_size;
@@ -184,10 +184,10 @@ void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void *fdt)
             }
         }
 
-        qemu_fdt_add_subnode(fdt, "/distance-map");
-        qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
+        qemu_fdt_add_subnode(ms->fdt, "/distance-map");
+        qemu_fdt_setprop_string(ms->fdt, "/distance-map", "compatible",
                                 "numa-distance-map-v1");
-        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
+        qemu_fdt_setprop(ms->fdt, "/distance-map", "distance-matrix",
                          dist_matrix, dist_matrix_size);
         g_free(dist_matrix);
     }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 05d34651cb..91bf194ec1 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -174,7 +174,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         g_free(clust_name);
     }
 
-    riscv_socket_fdt_write_distance_matrix(mc, fdt);
+    riscv_socket_fdt_write_distance_matrix(mc);
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1d3bd25cb5..e374b58f89 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -805,7 +805,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         }
     }
 
-    riscv_socket_fdt_write_distance_matrix(mc, mc->fdt);
+    riscv_socket_fdt_write_distance_matrix(mc);
 }
 
 static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
diff --git a/include/hw/riscv/numa.h b/include/hw/riscv/numa.h
index 634df6673f..8f5280211d 100644
--- a/include/hw/riscv/numa.h
+++ b/include/hw/riscv/numa.h
@@ -100,9 +100,9 @@ void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
  * @ms: pointer to machine state
  * @socket_id: socket index
  *
- * Write NUMA distance matrix in FDT for given machine
+ * Write NUMA distance matrix in MachineState->fdt
  */
-void riscv_socket_fdt_write_distance_matrix(const MachineState *ms, void *fdt);
+void riscv_socket_fdt_write_distance_matrix(const MachineState *ms);
 
 CpuInstanceProperties
 riscv_numa_cpu_index_to_props(MachineState *ms, unsigned cpu_index);
-- 
2.39.0


