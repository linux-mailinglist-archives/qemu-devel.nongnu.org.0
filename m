Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5C146E11
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 17:14:29 +0100 (CET)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuf7k-00018C-Ho
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 11:14:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrS-00055g-Mo
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrR-0003WK-LD
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:30 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42621)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iucrR-0003Uk-DD
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:29 -0500
Received: by mail-wr1-x431.google.com with SMTP id q6so3119773wro.9
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 05:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zVE/Z4UxYsjdTDPlx4VdYtWBShlEwOiw2OjNy5t9tP4=;
 b=QLeAMIJeRuxSMS6Uaq34c7/XUDhRkAKJOAF8RZkYBcvlOU6kedC/wvsldXCoeTypuD
 rw9ftzwRmPrKx1L5Bfav4YhfKM8jGouQZ8rn/g/W+eWj+CPzu/4Tmkv/vtlE8YJjVP17
 tRYzfA0PLs66vSPx3XIzxC91jbsHl3zYif2H9c4BUr9WGL1UV2CsJBkeUajJ8FiyxAeb
 nXdmcyifzwyQzXwMF4tbfejUK1fx6xC3Jo4zjM82O6gI5sYf43+4AijRck2ZaXnKXFNq
 Jxvo8tBUnCJEZ2nz5sksFGhcVW/2VIl2JdSbduUf24DX4J97it66qlvPZbjzfLLgvkAx
 svug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zVE/Z4UxYsjdTDPlx4VdYtWBShlEwOiw2OjNy5t9tP4=;
 b=QHomVw9EQMZUau3BBkZgrulSv42nbtXbZBw1kyErJCjgl09shDqnWX4Pi16SNgoSCl
 wpgxq9aK0y5sIB6bRZixYSkKkloomeUxq8iHvTK/lWNKuL5zTuVQUNujA0oIsE9oGCtW
 eDF8Jat6ADmp8YHEQ60MlQPKMv2PWFpqZ6/gM29jl0hIjoTeXM5khXU4iNWLx2c+vfnR
 JftYKnAFNvn18LEaISn4/1KQq46ShoaEr0LjoenWZlCXbkHttmwR5FwNU2Nnhdi2bMwY
 c+alP/hQpQ1ylg4qWsKxqygVlNJAf66E8+7XwJYnVznKKAMfHzixq7EDEDU7CBr30ytt
 wMAA==
X-Gm-Message-State: APjAAAUXvR4eoLWzmQq6PYM5ru4dzBLO6p6+KZcsl6BWv05IwOWE2tBZ
 Eoes8wkG1F+XquXyjyjZa84xqSpk
X-Google-Smtp-Source: APXvYqzmreOBlRd+COrCt8oHOhYmdFzg6+xgN8T+15/k1S0G69SE+0/z4eWAkBWUZQ2esC3kT+unHw==
X-Received: by 2002:adf:e984:: with SMTP id h4mr18017039wrm.275.1579787368158; 
 Thu, 23 Jan 2020 05:49:28 -0800 (PST)
Received: from 640k.localdomain.com ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id s15sm3073171wrp.4.2020.01.23.05.49.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 05:49:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/59] hw/ppc/spapr_rtas: Access MachineState via
 SpaprMachineState argument
Date: Thu, 23 Jan 2020 14:48:27 +0100
Message-Id: <1579787342-27146-25-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
References: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We received a SpaprMachineState argument. Since SpaprMachineState
inherits of MachineState, use it instead of calling qdev_get_machine.

Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200121110349.25842-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/spapr_rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index e88bb19..6f06e9d 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -267,7 +267,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *cpu,
                                           uint32_t nret, target_ulong rets)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineState *ms = MACHINE(spapr);
     unsigned int max_cpus = ms->smp.max_cpus;
     target_ulong parameter = rtas_ld(args, 0);
     target_ulong buffer = rtas_ld(args, 1);
-- 
1.8.3.1



