Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD4858B0F7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 22:56:12 +0200 (CEST)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK4Mc-00007L-Qa
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 16:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oK4LF-0006vj-Cz; Fri, 05 Aug 2022 16:54:45 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:42720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oK4LD-0004CI-UX; Fri, 05 Aug 2022 16:54:45 -0400
Received: by mail-ua1-x92f.google.com with SMTP id l7so1463587ual.9;
 Fri, 05 Aug 2022 13:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=9/tmLJws/u4CEM/BcYiDQmfD8qI7sQ+R7welU1JTEvk=;
 b=ZAioicZvx0dj4dQJb8YJvcttL+Dg5Y02YwOyYkdnsnvbZbFw4xtwuDm1jGc8pXv6bg
 N5Ohoz0GcNdFhac5HwWwdahcfCyboNaaowTk3CaPTe94ahKdEasojSQGiqkB5nEsUgUo
 L99+xPGhwv8TDWJ+b0NvM/JtMCuhV7DIcJktL0sEdRQPDLlyu6y7G/rCR8mDWXXqnv1d
 NYQ+SnfiGfvrZmXgSGxR1mFYKOW7xOkFrAurwA/Fz3VdMoa3wF3LKK2wIPjly1WBmP7a
 KJxS3qiZKwsAn1v1JKyq8qlbLoknfgBnDZBTDjUthQ//JLmJrpo53lIpF1L4yXkb+0FM
 xj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=9/tmLJws/u4CEM/BcYiDQmfD8qI7sQ+R7welU1JTEvk=;
 b=62TCp7WpF4kuRyjp37EZatJ/0IJX74JXsdylx47ZbJdbEmJd8xhYQpHFdfBTUN6Vm/
 3VkHYHXbnU0FnTnW1f7FEdFpSsNOnvUoo4mGIwI1b9ovZrdAbNblxnV6QLMVSqnf/W+7
 qrs292lIb0xn/XqqZrVbss9qHxpjWadXHh44qlVrZAAqh0yB8rMBBQe8hnIjhM5KymYs
 bsfYcc2M7Za9ggH758vmAfkYd8SN3Aw20thncn7VAPLdTc9r+vQweuIIHfzBSxi6YnBb
 2po8+zCbba7UGKjvzVq0PJZ6Y0ORCDDDmUQ1ukgGKpiY4S8d9LeFWmNdZJGQV+JVBF2o
 FSqA==
X-Gm-Message-State: ACgBeo0Ojg786icUu6bTh7idAASFqVeOC+RcIismVRfBAffnwZ6Wp39q
 2h6cbyRFlnWXHL8UFD/lHlELHPcsgLM=
X-Google-Smtp-Source: AA6agR7L9b5j5KbwF7LsCZC3MDFFipQ11w0PfX4O45wafuUhpr2VFRtCPxrjPpm5Vpstng9T+aITVw==
X-Received: by 2002:ab0:7250:0:b0:383:ef47:d9cd with SMTP id
 d16-20020ab07250000000b00383ef47d9cdmr4139001uap.45.1659732882233; 
 Fri, 05 Aug 2022 13:54:42 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ab014c9000000b00384ca77a9e8sm4161129uae.27.2022.08.05.13.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 13:54:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] hw/ppc: ppc440_uc: avoid multiply overflow in dcr_write_dma()
Date: Fri,  5 Aug 2022 17:54:35 -0300
Message-Id: <20220805205435.139286-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Coverity reports a OVERFLOW_BEFORE_WIDEN issue in dcr_write_dma(). When
handling the DMA0_CR switch we're doing a multiplication between two
integers (count and width), and the product is assigned to an uint64_t
(xferlen). The int32 product can be overflow before widened.

Fix it by casting the first operand to uint64_t to force the product to
be 64 bit.

Fixes: Coverity CID 1490852
Fixes: 3c409c1927ef ("ppc440_uc: Basic emulation of PPC440 DMA controller")
Cc: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 11fdb88c22..31eeffa946 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -908,7 +908,7 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
 
                     sidx = didx = 0;
                     width = 1 << ((val & DMA0_CR_PW) >> 25);
-                    xferlen = count * width;
+                    xferlen = (uint64_t)count * width;
                     wlen = rlen = xferlen;
                     rptr = cpu_physical_memory_map(dma->ch[chnl].sa, &rlen,
                                                    false);
-- 
2.36.1


