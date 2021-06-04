Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D42339B2B5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 08:36:08 +0200 (CEST)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3R9-0003YA-3c
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 02:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1lp3OQ-0008Ue-8H
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 02:33:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1lp3OO-0003S0-De
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 02:33:17 -0400
Received: by mail-pg1-x530.google.com with SMTP id l1so7081780pgm.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hwRk5KiKDGwMWRbeUjZilIkpsjsCKoLcQneQu1av5yg=;
 b=LHRmBRw5tHZa6G0c+jaKhK5drLAjEEcbgzY60fcdxnaAR8FWp35Vc6x1h3p7tLU37R
 9EOJC6fYIoqFF37mpR82V8xApJd5LJ3t6xCIZ3BPWX+zq7q8qn2buw7fKVEIg1ZQLCWB
 /fjKi9g7rY7atMYMnRs+u1nOLEdhMcJnl1MfhkGnRchDjDvJVjpxUCgZ13TUeGw2A6B+
 VWCUAmx7cxLMQQUeHZT5RANW2FkG9wpR32P2cYbgRXr8nzvHDmF8C4WDHKAlqmyCfEIA
 EHX64c8/SdFsVBMnu7s53z4O7fVAtLlBtImewCQF3tMhgQ0tkEs0QytuallCZHME00Lj
 Owaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hwRk5KiKDGwMWRbeUjZilIkpsjsCKoLcQneQu1av5yg=;
 b=WSeXTKuCtB8D/FkscFmreOa2TiQdQfSpLDsC25jecl9qbyFaz1/C9uUIkQ2iZ7w5jz
 OkYM4ue6fZvMAyC6nv25PPblJ/l+CHtgDT06VzUTfD/gPD+5YbSG5CyLV0wg3grCcUc6
 /BtyQJxShc7JCpQRNtCFiebcaKZ1l+hDuKcO4VLF5F/FyTTK5TPh0dLj21Vx+k1/FiUd
 TvN8M3/LgHcduA8wor3o0488Y1iZmabJ15KUM5k/V7WumHLJ1M5WuqKL74SM74hbTN3d
 KxEL/TIvl4p60/hKXOHw4gUsmVVAjoo9KmfRSzXkq3t9ufiZ0yo1tUw8MFRtptww+Onc
 yWTw==
X-Gm-Message-State: AOAM531WEPFwfLHM75edDwhLxgzxeYYd28OJ3Qbt/Y2LsyM+mhPH09hy
 bRCwY5ZZfvXCipBGC73ACcZ1PA/NIBf+dg==
X-Google-Smtp-Source: ABdhPJyfcEpNbPWO/NiHNXkTCihJws2vIiWCyjp31WOfQ+/mmtmgB9owO5pRL9ur1Kq3eWvY4qu9oQ==
X-Received: by 2002:a63:1b52:: with SMTP id b18mr3392050pgm.263.1622788393679; 
 Thu, 03 Jun 2021 23:33:13 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.HINET-IP.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id w59sm3804589pjj.13.2021.06.03.23.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 23:33:13 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: qemu-devel@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 frank.chang@sifive.com
Subject: [PATCH] linux-user/elfload: Implement ELF_HWCAP for RISC-V
Date: Fri,  4 Jun 2021 14:33:04 +0800
Message-Id: <20210604063304.48501-1-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=kito.cheng@sifive.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RISC-V define the hwcap as same as content of misa, but it only take lower
26-bits.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 linux-user/elfload.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 17ab06f612..41b9ef72ea 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1433,6 +1433,17 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define ELF_CLASS ELFCLASS64
 #endif
 
+#define ELF_HWCAP get_elf_hwcap()
+
+static uint32_t get_elf_hwcap(void)
+{
+    RISCVCPU *cpu = RISCV_CPU(thread_cpu);
+    /* Take lower 26 bits from misa.  */
+    uint32_t hwcap = cpu->env.misa & 0x3ffffff;
+
+    return hwcap;
+}
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-- 
2.31.1


