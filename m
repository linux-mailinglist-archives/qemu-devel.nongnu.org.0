Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B45AC33A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:30:14 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUk56-0004eF-RA
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1I-0007iV-Pu
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1H-00030B-5T
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id bz13so4070304wrb.2
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zg3xTO087zHJTEu9DdsDHo8PhqHlfCLyRHR7IWwnkPA=;
 b=PMCqS3iVJvk5k0EYbxXDUad6P5AlY7oT0bFVOAUttzNiidrwVUsYBE63j21wDOFHWl
 ks3eajvZvHLPYl7mlHu/FO0LLeLXB4HyRy4bGjCA2h6sDCbg/IfUoF18ZfxMYlvwwIGF
 kTT7UBnMv2ArSvZ6rEwKFgIWl/rHCZQLrvbv0iHf2dXsCL4EVQ7A6IS0xEVJw/EQ/Rkc
 ErHJNn6N2mqdalG+/XsJvZGoAcqj9dZtCMgvs8A3+aaGHXWbsNBXXCWuO98I05WFVaLa
 ASdaZmrLigWSGgx2EeAqA3Pwi0ykRDu5YFVu57I+HbLS4AlkmuUklxXJ1XkZYfV7oIfA
 qiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zg3xTO087zHJTEu9DdsDHo8PhqHlfCLyRHR7IWwnkPA=;
 b=uVLeJqBy2CfKE1FO9HmaN2MN2jB68VkZla6/nDi8Pnmk9eJgkX9Mbq8C4qP8wNb6Py
 h8rG9tuPWQjovznXa7aawH9SzG7EmAh3RlyQvejVIpr3veygCQw4GVSen2rfAie96etm
 SGT3z0oipKj29CALpIB49GA4BH/+mvbpWHwrMxgfGXoEdkOGXrK0tfjppck6+C9tAGkE
 sBjxDz4PZoRHODdf76W0jTbkA1VtOe7u/pN/g1TUo1DRliSXOVu00Zvtrt3Mwoqo0e3a
 ArnyZ/QgwxpgLDMdydujQARzOW1vQahfkDibPMB/r5iIJr4CJ9cHnjXaZWhW0EzRrkLi
 vpOQ==
X-Gm-Message-State: ACgBeo1KyeoGiX0+FDLEst1Pt2lybuN3wNft+WTyPgA9HDlYZh7x7Jvg
 99HP6sw9s/nTClzrti4oixEd/kf9pZ0=
X-Google-Smtp-Source: AA6agR6P8SXjc4k5lJQqz5z3Q+eHS2EI8BiRFb+eafxlUN4fYNYgf+GPii7jUxXIw+EKzRIxg1UxCQ==
X-Received: by 2002:a5d:4a91:0:b0:226:d01b:abf with SMTP id
 o17-20020a5d4a91000000b00226d01b0abfmr21962204wrq.268.1662276373253; 
 Sun, 04 Sep 2022 00:26:13 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 x1-20020a5d6b41000000b002250c35826dsm5480581wrw.104.2022.09.04.00.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:12 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/11] target/openrisc: Fix memory reading in debugger
Date: Sun,  4 Sep 2022 08:25:58 +0100
Message-Id: <20220904072607.44275-3-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

In commit f0655423ca ("target/openrisc: Reorg tlb lookup") data and
instruction TLB reads were combined.  This, broke debugger reads where
we first tried to map using the data tlb then fall back to the
instruction tlb.

This patch replicates this logic by first requesting a PAGE_READ
protection mapping then falling back to PAGE_EXEC.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/mmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index d7e1320998..0b8afdbacf 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -148,7 +148,13 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     case SR_DME | SR_IME:
         /* The mmu is definitely enabled.  */
         excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
-                            PAGE_EXEC | PAGE_READ | PAGE_WRITE,
+                            PAGE_READ,
+                            (sr & SR_SM) != 0);
+        if (!excp) {
+            return phys_addr;
+        }
+        excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
+                            PAGE_EXEC,
                             (sr & SR_SM) != 0);
         return excp ? -1 : phys_addr;
 
-- 
2.37.2


