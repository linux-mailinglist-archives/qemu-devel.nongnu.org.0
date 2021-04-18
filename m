Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1523636ED
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 19:06:47 +0200 (CEST)
Received: from localhost ([::1]:36598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAsg-0001cn-04
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 13:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAdZ-00049I-2X
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:51:12 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAdX-0002h6-5O
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:51:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso5582072wmq.4
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbo6eivOCaZBpkoFmmWLC7qMT2W86qCttoyj3YX6ZWc=;
 b=UkeIBWbSzl63CaNWGObT51yrq9c1SDqC5PnMaUHpSibk7NEDArNgviJjfkRZP+NGTd
 Ay/EDyDBTcImGi1W+IJqpqyAFHnT0nK8LJjZoq4UIQuf3in834HzCMBdnbpY2GVp5IZT
 ICgHICW49xzw9tVLa+JYxzAuoxKIvKsFbsGr+JV3zV8WiD9zPQ7tAexQ9rl7pJ4trDga
 Gs6Ogm7iVU+pJDdpZ8wUtIBC8voiQEQUir0oqJsbvnGXolkFvlLVXxCvefAJjgmZml8B
 4V/g45ACtiDhXAdDsmchhTh+5WGoZXSPqlD8g4lWd2RjsL5+ljrQ+lACYTaw264o0Uay
 BeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qbo6eivOCaZBpkoFmmWLC7qMT2W86qCttoyj3YX6ZWc=;
 b=eX1gLBY+j5hdMXuJ/MH/0vOxu6aald47cHq4sIWdNxlat1WA4Ri77IN2rsxadlbDC5
 OK5MlWyuv6DkRKpneUtZx0aF0GPD/gaH2Sp4CtXnTgR3jc7dzoDSopFOzt2ok9f5Vlpp
 bWTot08FlTFw+tB1NAJnq0L60IjdKUCl/EMmCxkGOQo375OaAgqql9jaI9OTejMzX2mk
 6Eui4RC6TcR42h2R1u1beL9jNRbsu0gjHQuLw52GE0Dvyqeze6Zlq2QtEM0NWGzZ7x8B
 /juZSHbbZm/1jzqJ8W42acvrCNaTFqV8PyhP2jIU916inp3WI+C0N5fSzlpbkXGGFZQt
 ENOQ==
X-Gm-Message-State: AOAM532tkg19YRcOgvbnL+aiY55M+0ng20gqhI7TxRSeFQ3NRCENNIDX
 jdDFQrdwzcCX+AgSQS5LeSd7Lg3+dnJnrA==
X-Google-Smtp-Source: ABdhPJybhGhCwBFUpBvDgXv4awd2oQLR1L4KsDRNfT99mSnIMoDsnPrhbu+L0S8q5TIbPUCyTiZ6ig==
X-Received: by 2002:a1c:7f4a:: with SMTP id a71mr17740127wmd.1.1618764664584; 
 Sun, 18 Apr 2021 09:51:04 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y125sm3598621wmy.34.2021.04.18.09.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:51:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/mips/jazz: Remove confusing ifdef'ry
Date: Sun, 18 Apr 2021 18:51:02 +0200
Message-Id: <20210418165102.1139848-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Claudio Fontana <cfontana@suse.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The jazz machine is not used under user emulation and
does not support KVM. Simplify the ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210226132723.3969650-3-f4bug@amsat.org>
---
v2: Rebased.

Based-on: <20210418163134.1133100-1-f4bug@amsat.org>
---
 hw/mips/jazz.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1a0888a0fd5..29d32ef516f 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -120,7 +120,6 @@ static const MemoryRegionOps dma_dummy_ops = {
 #define MAGNUM_BIOS_SIZE                                                       \
         (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
 
-#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static void (*real_do_transaction_failed)(CPUState *cpu, hwaddr physaddr,
                                           vaddr addr, unsigned size,
                                           MMUAccessType access_type,
@@ -142,7 +141,6 @@ static void mips_jazz_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     (*real_do_transaction_failed)(cs, physaddr, addr, size, access_type,
                                   mmu_idx, attrs, response, retaddr);
 }
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void mips_jazz_init(MachineState *machine,
                            enum jazz_model_e jazz_model)
@@ -211,10 +209,8 @@ static void mips_jazz_init(MachineState *machine,
      * memory region that catches all memory accesses, as we do on Malta.
      */
     cc = CPU_GET_CLASS(cpu);
-#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     real_do_transaction_failed = cc->tcg_ops->do_transaction_failed;
     cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
     /* allocate RAM */
     memory_region_add_subregion(address_space, 0, machine->ram);
-- 
2.26.3


