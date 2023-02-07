Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790AB68D19F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJa9-0000MY-G5; Tue, 07 Feb 2023 03:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pPJZt-0000LR-49
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:43:49 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pPJZr-0003S1-DA
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:43:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id be8so14922967plb.7
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QUReV4KMvI7An8ubheslQVfRM2aU7U816taWVsImywA=;
 b=a5orAumV77+kcjH0Ni32yXBpSYK+gd9VCjoKYhVuYtUQp1RdpCTENNwm71GelEydi2
 xkNWqiemH27UYHtrOuIiThlvn7OAxm4UsM4WRgU9zReOuT/E8l7mi2FWoeHVkjh5jU3w
 O8Zbll1QZp6JriSmW8PRam6133aSEkY3pJjTf5kBoWJAtIVsTUUUBoZBApQAPXQL4yNy
 n4WDklI33l7Usc5TUf6zeQAZv4SvpGhe/G+Ehx9nlVh42qTibKQ4ryDO2d6E5nBQS3pS
 CS6jfA6Ln1W5NuGenB3rtrloqs3ijwid/nfamzi4QRBUdbbdxblLHvTyVZ/W3rYEsWK1
 Xo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QUReV4KMvI7An8ubheslQVfRM2aU7U816taWVsImywA=;
 b=QAyOIw0fPYY1n3T+LHjl6tkfPOSEbhSCCMkiuIAMan9/OrCeFe/kKqXUC0E/hzxzCr
 s0/eLbVud/DpK/mKYHqlbpDOgZM3fsAHnJzhT+NKad4EQpBheQ62Wfk9cd+4ShFlocEn
 WkgRQhpDlzjk4jidi7811jF1OKa58ARVTPn6c7Q2GCc74vfL2BYS02AKV5AkKYwGR2Hr
 ucAHTAI30pYWg+R3crqqbX9/3mtH8eRpMaF53icbYIcgnbQXogEjiaImT9L4y4ZjzkiI
 0HzE69y+Inqz5vbtCsB/o1Jh5A+MX0fiR3RW5lhvifu6XzfkimfBo79UqWhBYH82hHlX
 yMSA==
X-Gm-Message-State: AO0yUKXU1IEqi3qlyQLstKa1yNW5F9TY8dt1j/JtPFW8T0EJa8VLaOrX
 5n8hd21T7LNXNLCEhWulLjGmXVMZhAJyXDye0WJORF0YviqD0vRGD0uNh9pp9Rmz9oa3Kgtgctn
 u5SldD54P+w/9hM7qj6zWibmf264mY6CqVCdq7oHNxjk5Qc8zFo9Cg3boUQQwzkqpdsQ2CY5//m
 I=
X-Google-Smtp-Source: AK7set+MVL77dHpKwxO5VfAF71g/keFiItjUgyaHv/dlZYh0XixvAwOvvgUPhHsEXffTO4uU2jwCyw==
X-Received: by 2002:a17:902:c612:b0:196:49a3:d349 with SMTP id
 r18-20020a170902c61200b0019649a3d349mr1844112plr.30.1675759425381; 
 Tue, 07 Feb 2023 00:43:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a170902e8ce00b001949c680b52sm8273534plg.193.2023.02.07.00.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:43:45 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] target/riscv: Remove .min_priv_ver restriction from RVV CSRs
Date: Tue,  7 Feb 2023 16:43:35 +0800
Message-Id: <20230207084341.303907-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
dependency from ISA level. This commit removes the restriction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fa17d7770c4..1b0a0c1693c 100644
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
2.25.1


