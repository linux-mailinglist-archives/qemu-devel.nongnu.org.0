Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF16661BC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:24:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFenM-0001pb-Mt; Wed, 11 Jan 2023 12:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFenF-0001jb-L8
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:21:44 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFenD-0000Be-Vq
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:21:41 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-15027746720so16193820fac.13
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WpW2VpuntxADTdZCNhLxoWPtSNkb+dtxKN6M+FjaJxQ=;
 b=SzfsH1hpi7MnYkx87l+bGRVJdW2px+nY4qn3HbD/jidzXvMjHLUuiKdK0YkE5K/+RM
 HEj9NKg8xA37gdkvFo8+FvAt3hWafASVHdpIfoWGnyai/MkKVWfB92ZQHx6yMK7Kwea0
 3OMI0Wi0tEFY8lrbGSVvsJbeQhre9ahzyznO8PZNvyuRT3+MwFABqUFEnbumG6ej/h7Y
 GlzOo3sl0YjnFIYg1uF+WGe3UkFKjaFLIoU8nKCl2I2mpFTLZ1f0u3Br4BIrgdAFHeIv
 uzzYZDVSjbeAiiMxslRefTLn2D81zWIa2RYsQ5JK3Ie1h6PCB+QM7Mf8ltBgxSA0Hy8w
 AdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WpW2VpuntxADTdZCNhLxoWPtSNkb+dtxKN6M+FjaJxQ=;
 b=pdXteJC26c6CF89FN2ps6IzMdSyie5KqbUxKVjoNZKgeqRdgUJ4Qi6WdlvlqK0J51g
 lYeggC+8ovoSWK6mAtT3hBgvlH3LDmEb2IM5ouE3WzydOl4/4wNJHiGzBsQL87U19s58
 Jtsac/fu4X5Do9j8Lrvhnki7x4GapTYMWZ7VaiHbAOZv+8RlFO3xZ0CpYaFK19lAmvbl
 6+NXZp2p9tUGRFGQ7QC1p6TBExf871QEfmsgmOwTuBFO/ZpVlaVWl6WFYi54ZpMXmIQK
 bDKfZk0lYo38hP5LHGgGd0yHraqDEVVjJth8dSNRQabTQ5q+inx3rSywbeCx8FB2aQ0/
 Ps0A==
X-Gm-Message-State: AFqh2kr2wR5uZQeBfSknw8grJ5C/XhbHapALQyoctxcTCYsaOhG8mA3C
 vcsZSLf/0sKCNzg6AGz4h72K4DYh89frdQy05C4=
X-Google-Smtp-Source: AMrXdXsNto2+VtueZ+gBxYYjWDXks4/h3dC5AFaHWVqOakDvd1CbfENc60iZ3xLShRsn4e6K29jamQ==
X-Received: by 2002:a05:6870:c989:b0:150:8834:f644 with SMTP id
 hi9-20020a056870c98900b001508834f644mr20259611oab.57.1673457698218; 
 Wed, 11 Jan 2023 09:21:38 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 el35-20020a056870f6a300b0014474019e50sm7535098oab.24.2023.01.11.09.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:21:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/mips/boston.c: rename MachineState 'mc' pointer to 'ms'
Date: Wed, 11 Jan 2023 14:21:33 -0300
Message-Id: <20230111172133.334735-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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

Follow the QEMU convention of naming MachineState pointers as 'ms' by
renaming the instance in create_fdt() where we're calling it 'mc'.

Cc: Paul Burton <paulburton@kernel.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/mips/boston.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index edda87e23c..6ef6b020a2 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -515,7 +515,7 @@ static const void *create_fdt(BostonState *s,
 {
     void *fdt;
     int cpu;
-    MachineState *mc = s->mach;
+    MachineState *ms = s->mach;
     uint32_t platreg_ph, gic_ph, clk_ph;
     char *name, *gic_name, *platreg_name, *stdout_name;
     static const char * const syscon_compat[2] = {
@@ -542,7 +542,7 @@ static const void *create_fdt(BostonState *s,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
-    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
         name = g_strdup_printf("/cpus/cpu@%d", cpu);
         qemu_fdt_add_subnode(fdt, name);
         qemu_fdt_setprop_string(fdt, name, "compatible", "img,mips");
-- 
2.39.0


