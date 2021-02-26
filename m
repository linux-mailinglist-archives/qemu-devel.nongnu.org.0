Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA932636A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:33:44 +0100 (CET)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFdFX-0000gA-3C
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFd9h-0006UP-8H
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:27:42 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFd9d-0002Na-B8
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:27:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id u11so1645979wmq.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 05:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2gsJbpv42AOeUT/UNWYygQZCoVIRU495UbUCd6k+cHQ=;
 b=fvfLrsoVMRAMU58KR3idQk1b3ge8+ujusZ2EWBChjWU7xFi0mi7G2jWHRaEz+mQ5iU
 IEdUGtRIaZkWMxn3b0twWN3jLK4WssbPnkPRpJcRlrQ1Dgi6sE8mk3d0rLJk0sP8aIew
 gl7tFV2EvcsYulNYoS/I47Zj1RdBsoStVSN1Ty52aGAMhu1ATw9GZITHgDKh8aAn0Eb1
 /mxz6uPFBS5Ayf+SHdIQ3OIBnHem+IigBe0JG2S68+djNRPrCEAKO4oKeaDQaDw9fu/p
 UVN4Xvn9OcbZuPy4Qpu4AJn94VCReP6g9vQBkXwntVv+0GY9a8KpEfPem0N4I0LAFFvi
 qEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2gsJbpv42AOeUT/UNWYygQZCoVIRU495UbUCd6k+cHQ=;
 b=SdWSUHyXQySf0tq9ShovspMiowM9quaKjBxcwrdvQaGQCAD59FROE3K2SRRvdt79WO
 TzDDibDvuU39xoMPgooF82Y8lJzWtsiXl2YbJVWh0h4g2ENwDfhElwJrc1CuOTnmk8PV
 n0nVhlgIXRXKWCZ6dnOLQWn3hFgcskQ/uXOMqd0ayRQTB/typ8+8GYmddTOb3aTyu0fy
 15L443V5rfMGCUB/wNJcLyQVa0cHX2Vhi2VHvr24nRchkllbFXdZanqRGyNBkc7lV1Ck
 IjtdTndpWX8vXtMxdv+yUxeuDURzJkbqnJ6xJQxfPFLoys7XVGbyCAjXR+jfFMJmYN5v
 BO2Q==
X-Gm-Message-State: AOAM530B1Q5KuGYjeHDDHIZrxOTlm8CwvbzcU/ETG/NQcbZHGDPwOVrI
 syzdI6AgBtm8RQEi41givN1q1m09zug=
X-Google-Smtp-Source: ABdhPJzCoJFwKU+broPBDV+da3ZWpYLJzHCMcZxnsZXA1QMVBj8Xg6STu7iOJ7lilmivaggNoCwCbQ==
X-Received: by 2002:a1c:c244:: with SMTP id s65mr2924446wmf.96.1614346055827; 
 Fri, 26 Feb 2021 05:27:35 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q24sm11292063wmq.24.2021.02.26.05.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:27:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] hw/mips/jazz: Remove confusing ifdef'ry
Date: Fri, 26 Feb 2021 14:27:23 +0100
Message-Id: <20210226132723.3969650-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226132723.3969650-1-f4bug@amsat.org>
References: <20210226132723.3969650-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The jazz machine is not used under user emulation and
does not support KVM. Simplify the ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/jazz.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 83c80860626..cd24e8778b1 100644
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
2.26.2


