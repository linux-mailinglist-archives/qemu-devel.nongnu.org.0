Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CF518279
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:42:53 +0200 (CEST)
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlpzY-0004QH-Ih
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nlpqo-0003yd-C7; Tue, 03 May 2022 06:33:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nlpqm-0003ev-Ow; Tue, 03 May 2022 06:33:50 -0400
Received: by mail-pf1-x42a.google.com with SMTP id z16so14375338pfh.3;
 Tue, 03 May 2022 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/kA7T2GMCtCLNudknximE6UqDzwULMgjCP/toncnkA=;
 b=afBKUlygdwo1jruzAbBSY4njWqPlBhY9m5XANkgEwteZtSWV70HU+I1nP/eLgUZ+Ms
 UUfKJxaUvxp+PsNJpXEJj/81ZDYaEh5yz2/ho5fKHY7s6nZwaVhNyjq62wtxvopZfYkT
 Nyutc2+VVp7sbC/5eAL7FzRCXPcn13lFWVkuhl5HiDMfh4jPtjtI6TPnEnnUDF4Nzjns
 9s8ANxdoSFqBT6a5ip2S48itTl3NeSQbOCgTb3w4PYeaM3U05kkwdzODdaYuc8HxkGeG
 c5B6fHqmAP/Xj9bV/DggIjsI0F+o2NFhGlSlenIHCWkDjx/HrJUVmF5ivv7zfYpJljUf
 cxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/kA7T2GMCtCLNudknximE6UqDzwULMgjCP/toncnkA=;
 b=Slv+Ig/Xkp5iAdbQqf52REua+wzQO215R+7dUfwGVObLVXQcYuywrGwJ/OIw7pS1r6
 OCU4y3mPcOw61OnrVgstGtyuQY5o4/P0vKuWxyozvctm6YCiswl67zKRXwDB4mj7D9pf
 k1n2qTPCdw7rh/d11A+egUsDNhxO9L/air/YTdc3Vb2f7K0QvNlafl85w5j4HlTATe2J
 7MOlCv9KRXPykFvR+jjZKg1Ej+hVZMnPko/iPpVOAQp9Wdw2wiSuisZ0yV/kNW8izVAG
 ZGFg3zbjG4/M7o84bTbqRRlOQJ7jSCyXRBhfeiyAnzwstdWFx+2l4a+XClM5yNbQap5F
 DoUQ==
X-Gm-Message-State: AOAM5330T/67hV/cduCb55s2ebz2QN8fqqh3Twb7D7XjKP2YNK42exu0
 p1XR8YlAHhuGtJ6MndIRfRI8LIfJSTUElA==
X-Google-Smtp-Source: ABdhPJyBkUkVcYqVnsmDhywkZYvhvdChiC2g/lYO49D8N4VZoa2lVbO2CS+IoRwI3AKUqikZBN83BA==
X-Received: by 2002:a63:82c1:0:b0:3c2:83b9:e975 with SMTP id
 w184-20020a6382c1000000b003c283b9e975mr1233177pgd.297.1651574026229; 
 Tue, 03 May 2022 03:33:46 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-108-62.tpgi.com.au.
 [193.116.108.62]) by smtp.gmail.com with ESMTPSA id
 x48-20020a056a000bf000b0050dc76281dcsm6056301pfu.182.2022.05.03.03.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 03:33:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 1/4] target/ppc: Fix eieio memory ordering semantics
Date: Tue,  3 May 2022 20:33:31 +1000
Message-Id: <20220503103334.2046414-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42a.google.com
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

The generated eieio memory ordering semantics do not match the
instruction definition in the architecture. Add a big comment to
explain this strange instruction and correct the memory ordering
behaviour.

Signed-off: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/translate.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index fa34f81c30..abb8807180 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3513,7 +3513,31 @@ static void gen_stswx(DisasContext *ctx)
 /* eieio */
 static void gen_eieio(DisasContext *ctx)
 {
-    TCGBar bar = TCG_MO_LD_ST;
+    TCGBar bar = TCG_MO_ALL;
+
+    /*
+     * eieio has complex semanitcs. It provides memory ordering between
+     * operations in the set:
+     * - loads from CI memory.
+     * - stores to CI memory.
+     * - stores to WT memory.
+     *
+     * It separately also orders memory for operations in the set:
+     * - stores to cacheble memory.
+     *
+     * It also serializes instructions:
+     * - dcbt and dcbst.
+     *
+     * It separately serializes:
+     * - tlbie and tlbsync.
+     *
+     * And separately serializes:
+     * - slbieg, slbiag, and slbsync.
+     *
+     * The end result is that CI memory ordering requires TCG_MO_ALL
+     * and it is not possible to special-case more relaxed ordering for
+     * cacheable accesses. TCG_BAR_SC is required to provide the serialization.
+     */
 
     /*
      * POWER9 has a eieio instruction variant using bit 6 as a hint to
-- 
2.35.1


