Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB069000A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 06:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPzr4-0000IV-Ps; Thu, 09 Feb 2023 00:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pPzr1-0000GX-Bk
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:52:19 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pPzqz-0002az-RD
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:52:19 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z1so1738063plg.6
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 21:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Tjk0KykcTHvlsxmURAi3rKTnl8MoQpYJfzoeZtBo1M=;
 b=oJWOVQAMqM/Cxn3yRO8YboqXKeCQxM6s73TmbbnSJ9IO8b9WE49QDVQV/ZXTtL6VQV
 lznbbTAJoG83n2Z8E5zANKOaCffqxhxCzatD35NCiVr/Nm2+NXqDxP6uhn/QVRJyfyPv
 /zMOH+Na0K4+XjCKTwiboabNCfs2JSbzMAQA5Ju/x8kozOFFuCbdlKYkOL1odyK+sDI4
 hWwvCixOjj+QWG4xeb9sdgr+hZgz8//TFAg6mU5vXMxjj9dOVkzzStQ53DEgu/m1RiEN
 GFUJCzEhNPQNVQom/x1jVFbhpLGRlcyJfqG1GuSeZAgOUpWzfnmhLpne6jdNI1OwdIBF
 +Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Tjk0KykcTHvlsxmURAi3rKTnl8MoQpYJfzoeZtBo1M=;
 b=gdCWFjtspuAwnag/q5b1BFgZpzzXLIJThFa8mmUq4cYt8CiOOWvM1iYGbWJ9afzc7w
 CqEls36wnhqtPtjQwDDea2FPMPoffPhPjB+/bu2S07QsVCB/F+cYz88wjwmecQrLsz0P
 KflmDZHdYA3gyYv3MJ7zz9YipDl5Fgiy3DD4UC3FL872a0e2Y1aP0tyq8XgPrAQ2vWPm
 tIoLFeOQpDA5ehkzV9zA7l4bJfqUUaOIpRlVeH28Q9qnTapqA6ff7C/mhrDx2LqeNDbz
 ZsXiUF9CoKxjoprrcnX7iwq/ffNl2xa7Vy7d33AVDuTelJzQAaZs9nI3QY3P32HKG8MA
 Q++Q==
X-Gm-Message-State: AO0yUKVrQC7hybXjLDVa7XiL9tH0vEvXJaTD4FCtIWJEWJ2C+dBNvZcy
 g+49QouPmzqyvdqHXYwyvD+x8w==
X-Google-Smtp-Source: AK7set+vhaNC32y+r2ftx3v/y3Qh76xJNxEZuntPWHzVydmClgJAaB4moI4MI0AGS4Ew9vfmHoGI8w==
X-Received: by 2002:a17:90a:be08:b0:22c:4b10:39de with SMTP id
 a8-20020a17090abe0800b0022c4b1039demr2652663pjs.3.1675921933757; 
 Wed, 08 Feb 2023 21:52:13 -0800 (PST)
Received: from gram.dc1.ventanamicro.com
 ([2405:201:d019:c0a2:db4c:93fc:9135:d16f])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a17090a928c00b0022c326ad011sm452436pjo.46.2023.02.08.21.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 21:52:13 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH] target/riscv: Smepmp: Skip applying default rules when
 address matches
Date: Thu,  9 Feb 2023 11:22:06 +0530
Message-Id: <20230209055206.229392-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

When MSECCFG.MML is set, after checking the address range in PMP if the
asked permissions are not same as programmed in PMP, the default
permissions are applied. This should only be the case when there
is no matching address is found.

This patch skips applying default rules when matching address range
is found. It returns the index of the match PMP entry.

fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 target/riscv/pmp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index d85ad07caa..0dfdb35828 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -446,9 +446,12 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                 }
             }
 
-            if ((privs & *allowed_privs) == privs) {
-                ret = i;
-            }
+            /*
+             * If matching address range was found, the protection bits
+             * defined with PMP must be used. We shouldn't fallback on
+             * finding default privileges.
+             */
+            ret = i;
             break;
         }
     }
-- 
2.39.1


