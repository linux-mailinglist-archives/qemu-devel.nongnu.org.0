Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740D52362D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:51:13 +0200 (CEST)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nongG-00089V-Hl
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbo-00022T-50
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:46:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbm-0001BH-Ib
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:46:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so5140006pjb.5
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQC++Y+pGUPUs/8x3sQ/i/xqv7tFU+CkLDMWJDdpamI=;
 b=hwzEePzDD8eho2m/nLCG0OVoBNWJvhCW9mEOImuXTlg2+gf0ia7oAbKSM4BYyKtoTV
 46H3mBulnlmepSbVJNRiKoTFIX0uYsgm2fQ3knSAaq0+0N4HPoFt2+21wMt52LvcCh2M
 Dj4D/tKbTxSZ24BepOtnGC7T1UqgFMRudYSJPcr4yDObe9+nIJ01oxCv2grAq8ZFKWtN
 yZaj9U033v+iImbt66uADoS2/Sk+mFl6P07mWLpSJY8hm3lGBYT7xHmNFa92zcmocyVA
 Eu/uxcDYg3YNaFLDQ1pmjIBVvAj1YK5HWwQv0lc+zV8kl3XTC441z6ZHzAxg4FWO+21r
 F6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQC++Y+pGUPUs/8x3sQ/i/xqv7tFU+CkLDMWJDdpamI=;
 b=1fLfpqUHF/i3VhCZgeGnUfzBWXauF/GeGYCUMHviBKK4fGjBbSOQqMuZAUnlqRjggp
 UpNQch8h13nQLqAqxIov9bfuahGen6BI758U06UEZKPoqWnFE+Oha+cW09K6vt5ihAkE
 sJkl7zSG9e2Gc7ZsW31PEm2wmtdCvmF8AQ2D844+F4eDcI/D7DWVjv0JOLjMYlBegtvE
 wC/6UJlVzmyOjGGu6J7rCoOa9CaRwU7v2LOIQIHX7e/F64+JeWvFZXeaHpA5DEKiiaNU
 MM+xO1Cgp0Sh0CNxBifAmNK1eCEVyKHCLcisS8Xv+M1oVFpUnIDDgnjdf3VsaOCVeruu
 nBSw==
X-Gm-Message-State: AOAM532vexiTvQ+qAQuUcQt52zXBgyyrzwZdZtnvDPBxuD0Kyut+tEtz
 c2kT+XUqo+diVJy8w1vvID1m3g==
X-Google-Smtp-Source: ABdhPJxrT/pDMXP3nE59GCBHnmvltIpmsxr/S2apkhSJ7ckpd3BwnxwXKpyopDWdlCxaXbLMY65+FA==
X-Received: by 2002:a17:902:dac1:b0:15e:9faa:e926 with SMTP id
 q1-20020a170902dac100b0015e9faae926mr25449593plx.61.1652280392835; 
 Wed, 11 May 2022 07:46:32 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/8] target/riscv: Fix hstatus.GVA bit setting for traps
 taken from HS-mode
Date: Wed, 11 May 2022 20:15:22 +0530
Message-Id: <20220511144528.393530-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, QEMU does not set hstatus.GVA bit for traps taken from
HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
on QEMU. This was working previously.

This patch updates riscv_cpu_do_interrupt() to fix the above issue.

Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097..b16bfe0182 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1367,7 +1367,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
-            write_gva = true;
+            write_gva = env->two_stage_lookup;
             tval = env->badaddr;
             break;
         case RISCV_EXCP_ILLEGAL_INST:
@@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 /* Trap into HS mode */
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
                 htval = env->guest_phys_fault_addr;
-                write_gva = false;
             }
             env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
         }
-- 
2.34.1


