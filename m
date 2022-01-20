Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B768C49564D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 23:21:30 +0100 (CET)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfo6-0007ZF-V2
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 17:21:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj8-0002qE-2o
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 15:08:10 -0500
Received: from [2607:f8b0:4864:20::834] (port=45633
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj6-0006ib-2H
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 15:08:09 -0500
Received: by mail-qt1-x834.google.com with SMTP id x8so7557543qta.12
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+ihxa1Ld5LxT20StF+81LT6lsXU3VYkkQbIBKYyb9w=;
 b=EbqYbbOu9agKYYpJipy722ZUTzDgTp25eZ+Y7AlBKndmwkenu4yJ1+S7UjS1nzWO0e
 2/s4LyUypr1TncQoulW2uk60+MIiw+sPvgn7htpwTW9TJ5uSRD8BHlj0BK5cJhufKq7b
 Vm3ryvYwK4goxLQxHDSaslVhS+XCsuEKgeb8V+9v8Ur02SGDpE2Jk0g7yn6NK40QngEr
 u8E9nTR2lJ4sdYxtjff/LsDQ+Ho3CR0jliEFwJvrR+bWjMCbxlG8nEExTgsgwoetIm98
 t6qwThhw7eAlv6K3ohA4OY2iSPYvjhOvl26yJH4nxh9Ng2nTrCn6zg0COl8fftE20Scc
 xdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+ihxa1Ld5LxT20StF+81LT6lsXU3VYkkQbIBKYyb9w=;
 b=YorJtkB/QTJm2m5dVfjFSjBSX2yKt1L+2IJlYHrviomZzDhlesdv5v3aC1GN8iNnxh
 cjAXTftvKNBYhdrd17dkPFLiFe5vLkGbQAlAEjxdKuI+XaiXC2kZ2toJlX9HqmvnIIip
 HbHySaMRYO93ge5DYEPsRXFZ7nPrrM92Pbo2UhA+e63Hp29ElYW1qaqfyXGZMtzVIfQ4
 Bhq3z346sqjTKtniFT6RQR9NBO4XMJNtE5C7hQmMsTBBSOqlclbUd6zKYMwusbMcbTF8
 BF3DxrJL5b9idKoHhTNgC7tZ3ScUEUfMAYUuCzPdny1ekxiTreEF5mUKLRJ5bBPU8D6p
 VwoA==
X-Gm-Message-State: AOAM531vZTpadGllQq921lDfr85rfjbefa/q7OnFsc5LXr2l/W8GBSMd
 DJB63vksmEDfkf2w3c6FYxTVYEgEppkS9A==
X-Google-Smtp-Source: ABdhPJw+Vp5wD9222Ynvu/EQCjpP8cSEINE6XOkd9qh8kq+l86VQk+Rouu0C7OqVicbMVLR7YIj4nQ==
X-Received: by 2002:a05:622a:512:: with SMTP id
 l18mr641866qtx.120.1642709286765; 
 Thu, 20 Jan 2022 12:08:06 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id a136sm1834160qkc.56.2022.01.20.12.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:08:06 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC 2/5] target/riscv: Introduce privilege version field in the CSR
 ops.
Date: Thu, 20 Jan 2022 12:07:32 -0800
Message-Id: <20220120200735.2739543-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120200735.2739543-1-atishp@rivosinc.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=atishp@rivosinc.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow/disallow the CSR access based on the privilege spec, a new field
in the csr_ops is introduced. It also adds the privileged specification
version (v1.12) for the CSRs introduced in the v1.12. This includes the
new ratified extensions such as Vector, Hypervisor and secconfig CSR.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h |   1 +
 target/riscv/csr.c | 103 ++++++++++++++++++++++++++++++---------------
 2 files changed, 69 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 671f65100b1a..7f87917204c5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -521,6 +521,7 @@ typedef struct {
     riscv_csr_op_fn op;
     riscv_csr_read128_fn read128;
     riscv_csr_write128_fn write128;
+    uint32_t min_priv_ver;
 } riscv_csr_operations;
 
 /* CSR function table constants */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index adb3d4381d1f..762d3269b4a4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1991,13 +1991,20 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
     [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
     /* Vector CSRs */
-    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
-    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
-    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
-    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
-    [CSR_VL]       = { "vl",       vs,     read_vl                    },
-    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
-    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
+    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart, NULL,
+                                           NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat, NULL,
+                                           NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm, NULL,
+                                           NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr, NULL,
+                                           NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VL]       = { "vl",       vs,     read_vl, NULL, NULL, NULL, NULL,
+                                           PRIV_VERSION_1_12_0 },
+    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype, NULL, NULL, NULL, NULL,
+                                           PRIV_VERSION_1_12_0 },
+    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb, NULL, NULL, NULL, NULL,
+                                           PRIV_VERSION_1_12_0 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
@@ -2063,36 +2070,62 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
-    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
-    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
-    [CSR_HIDELEG]     = { "hideleg",     hmode,   read_hideleg,     write_hideleg     },
-    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,     rmw_hvip          },
-    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
-    [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
-    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
-    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,        write_hgeie       },
-    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
-    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
-    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,        write_hgeip       },
-    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
-    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
-    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
-
-    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
-    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
-    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,        write_vsie        },
-    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
-    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
-    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
-    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,     write_vscause     },
-    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,      write_vstval      },
-    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,       write_vsatp       },
-
-    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
-    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
+    [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,   write_hstatus,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,   write_hedeleg,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HIDELEG]     = { "hideleg",     hmode,   read_hideleg,   write_hideleg,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,   rmw_hvip,
+                                         NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,   rmw_hip,
+                                         NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HIE]         = { "hie",         hmode,   read_hie,       write_hie,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren, write_hcounteren,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,      write_hgeie,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HTVAL]       = { "htval",       hmode,   read_htval,     write_htval,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,    write_htinst,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,      write_hgeip,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,     write_hgatp,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta, write_htimedelta,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+
+    [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,  write_vsstatus,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,  rmw_vsip,
+                                         NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,      write_vsie,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,    write_vstvec,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch, write_vsscratch,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,     write_vsepc,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSCAUSE]     = { "vscause",     hmode,   read_vscause,   write_vscause,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSTVAL]      = { "vstval",      hmode,   read_vstval,    write_vstval,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_VSATP]       = { "vsatp",       hmode,   read_vsatp,     write_vsatp,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+
+    [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,    write_mtval2,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
+    [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,    write_mtinst,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
 
     /* Physical Memory Protection */
-    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
+    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
+                                     NULL, NULL, NULL, PRIV_VERSION_1_12_0 },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
-- 
2.30.2


