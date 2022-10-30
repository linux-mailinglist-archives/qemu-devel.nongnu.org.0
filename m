Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F03612D91
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGuT-0002CL-DF; Sun, 30 Oct 2022 18:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGt2-0006FJ-FJ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGss-0000Po-Mc
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id g12so13657846wrs.10
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goKoxPsgu6fb0v9OXKt6oq3b6m96eLVrsKKxut7D+Ho=;
 b=rsmw6eMbikVNZzTvtnof/90P4rE3rUeTYNNXUvlZB3tbG67gTDvPE+S+j9eEWlbN1f
 0ZczidapS4H1PfcT8dAmoH5ADgo+FCxf+pesZryfoZf6BvXes2WZKYbtDN8Korr69JNw
 9WFMHKGHdu5jmfboP9cS4gdizfKSyJa0zVJ7f1DS04tdrkHHmrLBo7sM/2WBM1Ro5ojL
 caX9Qzh+/QebKEydDVbQIcgsf+LbGpU87Wmix4SQxG2k5rv6mqVeE43KwvRRADFwOMBs
 PRyXhNCLfz8eTkn5cmrL3Rnvozu/rUiZ9hij8j/tYyU0SIhoC/LTh+FmVWw68eEqIk6D
 gZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=goKoxPsgu6fb0v9OXKt6oq3b6m96eLVrsKKxut7D+Ho=;
 b=Z5kxHfZfbzA5HiQuckSaipbAHP3dGAf0aP3Hk4VQAHsxCPjrHKx0602HnNFJyrdApD
 n6yvLBAHjIxqC1DMGygFaaUlAjSf+Pv325HvUQiGUiYxWsIQUJeWxVCukMHi4eMDEOMT
 QDPHcuYHsOMxy70rizGkBQMU1X7ZB/D6/gsAPqZVaXr1INKhd398m7nch6mhO/WUp+wg
 Z4vtX87elZCopa7HLqeYiT+PcS32EwidXPjqmy6SgiUeA6fMa0jx7GSdKQJ5kGS8smr8
 /14h/xaXX29QhIn6JwlqeGcmUvSaa6HlFKplefo6GB7YdOs57F+k0TC3fEXhAVAed2gr
 woqg==
X-Gm-Message-State: ACrzQf1VrMV4SZxL3tTB8t2+Q2wRJcIWYnAGzf02465hFGvEqbrlV/uh
 5xT5uYPCaPWw7fpgEka5+QsVMwN/Sld2bw==
X-Google-Smtp-Source: AMsMyM6CNC4wVX6X7gGUEz79aT1CW46Zw3pLWAOCQ4rfjEVZWFihwGT+8a5x5rvL6eXieseVB1VieA==
X-Received: by 2002:adf:f989:0:b0:236:5730:62f1 with SMTP id
 f9-20020adff989000000b00236573062f1mr5998100wrr.98.1667169264808; 
 Sun, 30 Oct 2022 15:34:24 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003a84375d0d1sm5536087wmb.44.2022.10.30.15.34.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:34:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>
Subject: [PULL 52/55] hw/mips/boston: Don't set link_up for xilinx-pcie
Date: Sun, 30 Oct 2022 23:28:38 +0100
Message-Id: <20221030222841.42377-53-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

PCIe port 0 and 1 had link_up set as false previously,
that makes those two ports effectively useless. It can
be annoying for users to find that the device they plug
on those buses won't work at all.

As link_up is true by default, just don't set it again in
boston platform code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20221024143540.97545-1-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/boston.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a0..aa7942bbc0 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -424,7 +424,7 @@ static inline XilinxPCIEHost *
 xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bus_nr,
                  hwaddr cfg_base, uint64_t cfg_size,
                  hwaddr mmio_base, uint64_t mmio_size,
-                 qemu_irq irq, bool link_up)
+                 qemu_irq irq)
 {
     DeviceState *dev;
     MemoryRegion *cfg, *mmio;
@@ -436,7 +436,6 @@ xilinx_pcie_init(MemoryRegion *sys_mem, uint32_t bus_nr,
     qdev_prop_set_uint64(dev, "cfg_size", cfg_size);
     qdev_prop_set_uint64(dev, "mmio_base", mmio_base);
     qdev_prop_set_uint64(dev, "mmio_size", mmio_size);
-    qdev_prop_set_bit(dev, "link_up", link_up);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -729,21 +728,21 @@ static void boston_mach_init(MachineState *machine)
                      boston_memmap[BOSTON_PCIE0].size,
                      boston_memmap[BOSTON_PCIE0_MMIO].base,
                      boston_memmap[BOSTON_PCIE0_MMIO].size,
-                     get_cps_irq(&s->cps, 2), false);
+                     get_cps_irq(&s->cps, 2));
 
     xilinx_pcie_init(sys_mem, 1,
                      boston_memmap[BOSTON_PCIE1].base,
                      boston_memmap[BOSTON_PCIE1].size,
                      boston_memmap[BOSTON_PCIE1_MMIO].base,
                      boston_memmap[BOSTON_PCIE1_MMIO].size,
-                     get_cps_irq(&s->cps, 1), false);
+                     get_cps_irq(&s->cps, 1));
 
     pcie2 = xilinx_pcie_init(sys_mem, 2,
                              boston_memmap[BOSTON_PCIE2].base,
                              boston_memmap[BOSTON_PCIE2].size,
                              boston_memmap[BOSTON_PCIE2_MMIO].base,
                              boston_memmap[BOSTON_PCIE2_MMIO].size,
-                             get_cps_irq(&s->cps, 0), true);
+                             get_cps_irq(&s->cps, 0));
 
     platreg = g_new(MemoryRegion, 1);
     memory_region_init_io(platreg, NULL, &boston_platreg_ops, s,
-- 
2.37.3


