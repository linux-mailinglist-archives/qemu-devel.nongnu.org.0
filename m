Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7AE69B21C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:57:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4vX-0005Bn-P9; Fri, 17 Feb 2023 12:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vV-0005An-HX
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:41 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pT4vT-0000u7-Uf
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:53:41 -0500
Received: by mail-pf1-x432.google.com with SMTP id g7so998160pfv.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDWoUrS3gNFU9IU+ndidQqS1Eb6eRflzx7e/dFgHmuQ=;
 b=qW0nxrrDmzpJPp5WtQkop6cS2PXq3xZlVYb2DUGKYMpSHI/Nbk2Ikrzj97iVxlGR0q
 QYuAoElqh5hLibkQ88w8CnbXGqo+RukN4uQ0uiPDUCVgItq2rBoJFv+HUC0cE+eEva7u
 3TIpoAg3afcBmkvGJKaLvDtgvhrTLRV5PrS44oyfes2cLhF1g/41N0mA3mJq+PWLCigF
 wM9Lc//QPb2skPZMWNKEe8XyVTuyKumxI8xEU6XS+/ljjxJQrZUuWPWg8hPCR3He00Jp
 34+Psrf7NipSTxXkazd49idiMP1B8STz+i7Ja6EFvANxafjUFpHG7ZBg8JKbqUw8JAPQ
 IEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDWoUrS3gNFU9IU+ndidQqS1Eb6eRflzx7e/dFgHmuQ=;
 b=rMmaPvddmL2l93bmS7WMtoXVJneuAGpegQEYmEOmJipue1XZ7e6L9u3CcvJzCP8egN
 uZ9/0UhOwNEAowVAzSPdJ4DJ9TSgh9Rp1wmpanC9NeUYOR/L7W0DZRwYSupvzOKHBxl4
 rQfdjLN4HG9pQ29O1BoachxKyG2wtkSyOvyU1pX0I3Jr3+8e/0Zi8awUVVPrAcq4FpBG
 1xpsueEDb6xEZJloLaeMUjiCLcg9n+tvrWPRarvvjJj2ljvb+9Y1vV875omKpVCOOFbA
 7Z0kpqa6hjngIvrXhMQh9re9WsfjoYCT3bp+JINEY3v18AXIn4eRUgLJyxsQusu9zE6J
 tasw==
X-Gm-Message-State: AO0yUKVl7ZzUXwUJpTXYUNgNAAOYNBINPD4IWqQvojPl0L6En3vhKuf2
 pRpIS0ZY9XzpDiqaxAWT+oMbew==
X-Google-Smtp-Source: AK7set97je10L1V6RK2sQgL7D9KoR8q+x0KVILmLpszcU5ZBtj/DsUAiDSoCg9nXhSl+pBOuXwJPHQ==
X-Received: by 2002:a62:8444:0:b0:5a8:4b27:5db2 with SMTP id
 k65-20020a628444000000b005a84b275db2mr1597092pfd.1.1676656418530; 
 Fri, 17 Feb 2023 09:53:38 -0800 (PST)
Received: from localhost ([135.180.226.51]) by smtp.gmail.com with ESMTPSA id
 j21-20020aa783d5000000b005a9bbef5d22sm2425888pfn.44.2023.02.17.09.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 09:53:38 -0800 (PST)
Subject: [PULL 5/9] target/riscv: Remove privileged spec version restriction
 for RVV
Date: Fri, 17 Feb 2023 09:51:59 -0800
Message-Id: <20230217175203.19510-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
References: <20230217175203.19510-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bmeng@tinylab.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x432.google.com
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

From: Frank Chang <frank.chang@sifive.com>

The RVV specification does not require that the core needs to support
the privileged specification v1.12.0 to support RVV, and there is no
dependency from ISA level.

This commit removes the restriction from both RVV CSRs and extension CPU
ISA string.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230208063209.27279-1-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c |  2 +-
 target/riscv/csr.c | 21 +++++++--------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0dd2f0c753..93b52b826c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -73,7 +73,7 @@ struct isa_ext_data {
  */
 static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
-    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
+    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fa17d7770c..1b0a0c1693 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3980,20 +3980,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
     [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
     /* Vector CSRs */
-    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VL]       = { "vl",       vs,     read_vl,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
-    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb,
-                       .min_priv_ver = PRIV_VERSION_1_12_0            },
+    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
+    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
+    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
+    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
+    [CSR_VL]       = { "vl",       vs,     read_vl                    },
+    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
+    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
-- 
2.39.0


