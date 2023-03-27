Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1696CA550
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:13:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmea-0006Ug-BI; Mon, 27 Mar 2023 09:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeS-0006N4-9s; Mon, 27 Mar 2023 09:12:44 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeN-000171-4a; Mon, 27 Mar 2023 09:12:43 -0400
Received: by mail-pl1-x62f.google.com with SMTP id o2so8388572plg.4;
 Mon, 27 Mar 2023 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679922755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xi1uYvklRj2SMeAqNt1YnuyX67YxXB8cWYLUFKUd5bs=;
 b=SEyo+0bxxj8isMmhluV5sk2P+BxTjBbnPT3qNX0U5fUZafeit352AFN+ko1wHFWAlm
 yw4bNGxt/ltcTnWYj8dyvFJ1mZAUv9S4EqL0zGFRDG7Z98kUZPQmfaJNcsQI25hi6GZ6
 GU0ioYG3QxZpvqbnQJSBf6Jj6n987GNPaosGGAfF7ik04vtO53yinORM4iiEQ5zej9Mx
 d0z3Pft2nxhFWj8BxIdHJZ1s+0/ZPq+EM86acUHd+WoEVSqIkOLx9joV/wy+80DNRE3G
 tayT7pdlIWdlthOzA8nUiTwh89+e8L4SDJEtgDhFMrZdNEKYUUzH6jH7+5gqZmA4eEv4
 I4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679922755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xi1uYvklRj2SMeAqNt1YnuyX67YxXB8cWYLUFKUd5bs=;
 b=IbT1a3b39IquI1mVCnCidZXuzRiyWrJD+RqNogwXg8oN/9ne+gXopuEYEIvtUuZ18E
 LYK7i7disH0WKRNAX9AVfu6tcTPbM+ahUSwROF/KceZX/qlFk9fK1lFWOaTqci/1Tkr6
 PaDBKv7j+dZ/sJ7UOG8Lz5PZFoUoL50FjAI9t1Zjdq7nKmtz/aSl33Inw4G/sq74IxTW
 scDSdSNqWw8JsSnFpjHKHgRQlVKsRAhL6nRdCPKl2jFVo+xvVVrh6cnPaVF2TN6AfDXm
 hcgKZPBumIfSnNFvTFrcJlNV/NCMXOgYyOhAnusmlNoNpqjs4d9PBBedK/lPBAzuhKFC
 pZKA==
X-Gm-Message-State: AO0yUKXQ7zshdCHZCbEI3kymvE/OZ5q9smJ9e3p/oRjsFtRv/1XAQLHB
 RLZbWU41JrdBehJimpHNNCfFx9B+TWY=
X-Google-Smtp-Source: AK7set/tKoe2tIn67ymm1oljl5nSFtKgm0a35661xTdX77ExKGepQg2T53zAhfH4j9krtk7/Qw1Xog==
X-Received: by 2002:a05:6a20:4d92:b0:da:aaec:9455 with SMTP id
 gj18-20020a056a204d9200b000daaaec9455mr10679187pzb.43.1679922754992; 
 Mon, 27 Mar 2023 06:12:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a63f50c000000b0050bcf117643sm17301638pgh.17.2023.03.27.06.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 06:12:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 4/6] target/ppc: Alignment faults do not set DSISR in ISA
 v3.0 onward
Date: Mon, 27 Mar 2023 23:12:16 +1000
Message-Id: <20230327131218.2721044-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327131218.2721044-1-npiggin@gmail.com>
References: <20230327131218.2721044-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This optional behavior was removed from the ISA in v3.0, see
Summary of Changes preface:

  Data Storage Interrupt Status Register for Alignment Interrupt:
  Simplifies the Alignment interrupt by remov- ing the Data Storage
  Interrupt Status Register (DSISR) from the set of registers modified
  by the Alignment interrupt.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Use insns_flags instead of excp_model [Fabiano review]

 target/ppc/excp_helper.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 07729967b5..6ac003bcd5 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1449,13 +1449,16 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         break;
     }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        /* Get rS/rD and rA from faulting opcode */
-        /*
-         * Note: the opcode fields will not be set properly for a
-         * direct store load/store, but nobody cares as nobody
-         * actually uses direct store segments.
-         */
-        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        /* Optional DSISR update was removed from ISA v3.0 */
+        if (!(env->insns_flags2 & PPC2_ISA300)) {
+            /* Get rS/rD and rA from faulting opcode */
+            /*
+             * Note: the opcode fields will not be set properly for a
+             * direct store load/store, but nobody cares as nobody
+             * actually uses direct store segments.
+             */
+            env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        }
         break;
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
-- 
2.37.2


