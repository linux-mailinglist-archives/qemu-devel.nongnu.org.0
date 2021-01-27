Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE753306824
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:43:38 +0100 (CET)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uTJ-00078C-Ri
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uRH-0006GX-91
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:41:31 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uRF-0008DA-OT
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:41:30 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c12so3658312wrc.7
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WDUUFabGCpfCL1l7QMgDUHrlWMhVwt9PxBXe9pD+ufs=;
 b=Eqy+HoSlDRoulNTSMZtNG914Hl7s4eROt6t72Gzyir3QBOgS6sH/kjPyrmyaYug6fY
 R+7lTfDLFyAfQiyb5XE884K4+EM+dKUIXYQwVeBEvUnSkw87hrAE30Pvmq+DGaVPlxzn
 gnWbWMcvrVhuxoDXlbddBYBiuH3cCfWC26ZyVrHYG6fCNhB9eWcum+TqIwEhaMdfMcCU
 neRAplowYRYciy6C6gacTFPOPT75GTGmTvwOSGWCclbCu9tkbTmt1Na6qI81mIy7gy0B
 Znm3OorpuhROGV+ciqeK9RoySP3ELGXc9UpmFGdPVl0EDayjyvK+8/JtLYflmwUyjCqe
 JD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WDUUFabGCpfCL1l7QMgDUHrlWMhVwt9PxBXe9pD+ufs=;
 b=p8zMfTKSzeXaWhsMIvldeHA3UREHfVG8KRdJU3rbRrU8QELtlr7N70Mvra7H1XGYQQ
 ZT76DprMkiaNzH/40bsRs9o2i5FEuQbm1UiDfrikaqdHYy7pj6bGhLVEMPQ+bHSuPhOy
 8PTQwVnraotikA6wrZiSJi5TCbQ64N44RRFeRL3yjAL6SplZYQwZeP8yhvrUCmtfqMWH
 3UMNZJ+n9Ct3QEHoeSPbjk8iHdLOTwW6r6d0cMtD84y/d1MnkLugqiAebpqeiodg/MhI
 ZGCGsqC3xi0gfjZ9oOT9d4Gu+kDdPZsmZ6vZC5t1ja1SfgI1LM3qFlqgZPJZsIXhL8ls
 tbNA==
X-Gm-Message-State: AOAM533wKCAHT8q8pRNKOdvrLzrX224sg9vH1aJijFAYloi7dLVJV1b7
 v1m7cPQi9ogv8VW46jcFkbQ4L/udseE=
X-Google-Smtp-Source: ABdhPJwx9C/A9A9IzjY2XOkpvaaaUURgmt1+rHZQ9QkZgfzfMQMoo+8T0GoaRxRayGSjKDLW6vepqg==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr6927457wrw.399.1611790887618; 
 Wed, 27 Jan 2021 15:41:27 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d30sm4942341wrc.92.2021.01.27.15.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:41:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/nios2: Replace magic value by MMU definitions
Date: Thu, 28 Jan 2021 00:41:18 +0100
Message-Id: <20210127234119.3537399-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127234119.3537399-1-f4bug@amsat.org>
References: <20210127234119.3537399-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_get_phys_page_debug() uses 'DATA LOAD' MMU access type.
The first MMU is the supervisor one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 57c97bde3c6..fea34c957d9 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -209,7 +209,7 @@ hwaddr nios2_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     unsigned int hit;
 
     if (cpu->mmu_present && (addr < 0xC0000000)) {
-        hit = mmu_translate(env, &lu, addr, 0, 0);
+        hit = mmu_translate(env, &lu, addr, MMU_DATA_LOAD, MMU_SUPERVISOR_IDX);
         if (hit) {
             vaddr = addr & TARGET_PAGE_MASK;
             paddr = lu.paddr + vaddr - lu.vaddr;
-- 
2.26.2


