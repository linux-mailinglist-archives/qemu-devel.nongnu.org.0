Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CAC306738
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:46:27 +0100 (CET)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4tZy-00018I-MI
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4tWk-0006QC-Ti
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:43:06 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4tWj-0001eG-4D
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:43:06 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z6so3504288wrq.10
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D7TTiZh4CEBq1goSTNvOHrjObfTRjeZppiTNX6JNiI8=;
 b=PmXrf2AXigkygEF1xVZC1Ov6Wl+HR95zFMzQY/3EwIUso3yONhrU3zkTQcNbV8mGLj
 hIAF7qi/HdNpHX2a+rjz/8wUSbxiCzv0KqpqoLtBYjn5QB+ktLt1JLv6huuYEhDufypC
 y+kKIj5y98ZxxhR5rXu4RueS8whPVuY4gb+8HRjQHHStCfGaPWAtrhsYIJWscjeTIuIg
 TLVtsC3otAMnimMZmnOqALAWfYEU50O9KUqEdAzm+olwG9PcGLMTE94RfKcINT3OEKw9
 kNoK3ys7zxxH+q8vw+mYgKto078I/L/Zle2/MeJwMpYge4c0fZwA+H9b/NP2/u+rGX6y
 gVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D7TTiZh4CEBq1goSTNvOHrjObfTRjeZppiTNX6JNiI8=;
 b=GGKERE3fb0Cr9jdC8TUV1ucA4N2buy6BmcXoXZ1IeZ8BnpZxmicTMMjS4MwrMeXKD0
 VrOCVYfoR0vJhVfAdcH/Ts7+GI4JHp++y8eIThskNmf9cBWfyQExCWpI1C/8nHGACgXL
 jF6k+7A3qvlOA5ng8GaH1XhU0hvp493MF5HaybwRBMdHIMmgkO5SlKKPh3nF9a/Q2qN7
 kPMBkkwNYiT+ctZjmW9g1sqP5t7+l4l3TTbd/V/p/DPr0N8B0J4Fx0CU/CsfbDiJbE89
 o8yLeA5+AvpEuLsJTzVZCnxLea/LNlYTiKzN8Nlo8IdGkNqfayWSyyILbfRkQrMATeyO
 Qh0A==
X-Gm-Message-State: AOAM532exSLY4y4RxkNj/Iisl5hrVB0XExMIQSTTkTK5ESXkrRdZTxdf
 TIxTWC9KaVjnpMp0ghlzvWNPZlIxmf4=
X-Google-Smtp-Source: ABdhPJzGu3US36AMfOAu9I9YVEPvzcsi1x0pjWXoqaXv5lXog9H6jNHyELW4j00llb4skPU+UMtZNg==
X-Received: by 2002:adf:c109:: with SMTP id r9mr13435621wre.261.1611787383304; 
 Wed, 27 Jan 2021 14:43:03 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r124sm3970413wmr.16.2021.01.27.14.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 14:43:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/tricore: Replace magic value by MMU_DATA_LOAD
 definition
Date: Wed, 27 Jan 2021 23:42:53 +0100
Message-Id: <20210127224255.3505711-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127224255.3505711-1-f4bug@amsat.org>
References: <20210127224255.3505711-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, David Brenken <david.brenken@efs-auto.org>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_get_phys_page_debug() uses 'DATA LOAD' MMU access type.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/tricore/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 77152932630..81171db833b 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -50,7 +50,8 @@ hwaddr tricore_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int prot;
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
-    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx)) {
+    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr,
+                             MMU_DATA_LOAD, mmu_idx)) {
         return -1;
     }
     return phys_addr;
-- 
2.26.2


