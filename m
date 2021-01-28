Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54F307893
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:49:08 +0100 (CET)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58bb-0001HF-BY
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Uq-0000yF-MX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:08 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Up-0007Oa-5M
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:08 -0500
Received: by mail-ej1-x62d.google.com with SMTP id kg20so8130381ejc.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NePsERJCA+duW4QZFzCVHslJqsTw1k9Xp1nAXSAohg0=;
 b=mmo+/8t7T0o+E56cPv17XAUYRJO1vlcJrlK2jSarbGo2zEg3QSl+ZmhAkXp3T3lztN
 hwe12SwGe5FZAUSkHmVUH/IARqJNTnK17lBtzLYQJBia9dgMaCcoZDavCT7q4rfLk/cK
 0T4KwGKbF2QgOiN1a3E+/m3e25PSYkpngQhPkav/nhQKWIObjSuUnhuQwflIUOv3D+AP
 Fe6d/kFX6PIMinQk5rwrMJhaaMoE966fIMz0vhKWaX3i4fD8MpvK8/BtBwmvL8lmwDBW
 kKVSIPC8tOIPvaZOMGMBSpTPvbmsiEKlCU6Ka2pQJ5jRI2v1x4xLtcfVY0r3VsY7mjae
 mnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NePsERJCA+duW4QZFzCVHslJqsTw1k9Xp1nAXSAohg0=;
 b=C6ggJ5noGMnjPc6pxOqP56+8s7gb2itSLYseDWXTdiJTbKQgFyRYNZS1U6qz2kb7TN
 Nw0uY8exLx9bqMr6nhK+3fqDvuJIjOoJwjrADJ1RfH+LM4BZzMzuRXTuBS7CiDQ0zlBp
 qCnQ8TuADnJSMs/PihgaKdGSM/NPVQaTR8rK9mPUoaFOaVnvXN3Q76yCRMGkJ4qEhMX8
 +SVfnvKSpF7A7NPIoc53uIoakPLmY1h2ojFAD8n+v+sLjQ9I2OCkRnyLkWnJnQa1TBsY
 r6B2VMZEQZjnX1PW3asCcsHR9hV4GADeBKAPJrSBY4I/d4khOFfoevKYVICTaP4Kqite
 ma3Q==
X-Gm-Message-State: AOAM531xfrsJHUItlOm+3WVziZF+AasAKz1vurtn53HAJqOH6m2s5LFd
 kb4zdI9ual+r5v4tgyLpU6pBhLI8Ri8=
X-Google-Smtp-Source: ABdhPJyejaoNtcvyZR1GEPqhfDVa4VaNtP8PO2hkO+1fQk7kt3y5CeVF7GM7yzefcSUtoWkMgTJ3LQ==
X-Received: by 2002:a17:906:3885:: with SMTP id
 q5mr11608862ejd.105.1611844925635; 
 Thu, 28 Jan 2021 06:42:05 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id he38sm2269490ejc.96.2021.01.28.06.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:42:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/13] target/mips: Let page_table_walk_refill() take
 MMUAccessType argument
Date: Thu, 28 Jan 2021 15:41:19 +0100
Message-Id: <20210128144125.3696119-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single caller, mips_cpu_tlb_fill(), passes MMUAccessType
to page_table_walk_refill(). Let the prototype use it as
argument, as it is stricter than an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 9216c7a91b3..afcc269750d 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -621,8 +621,8 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
     }
 }
 
-static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
-        int mmu_idx)
+static bool page_table_walk_refill(CPUMIPSState *env, vaddr address,
+                                   MMUAccessType access_type, int mmu_idx)
 {
     int gdw = (env->CP0_PWSize >> CP0PS_GDW) & 0x3F;
     int udw = (env->CP0_PWSize >> CP0PS_UDW) & 0x3F;
-- 
2.26.2


