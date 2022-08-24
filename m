Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0F959F7E1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:34:56 +0200 (CEST)
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnip-0004Kx-OU
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuz-0004SJ-AQ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuv-0001nk-A1
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id x19so15188906plc.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gaj+hsFra3tAAn41KvUkD6S/64I4IDGVCSXdBoXHO4Y=;
 b=VUtrICafBqG5XkXx5nGmzMDoekmJWM/zvT+7TEVeQwS6I4+3SDULmAVSprYnc9G7bd
 CWK3bv8bL0rZZBrWld38PDkozHxJCl7oDZ7o6zYBqbRkVFsyvC1R6god2OjZ5g3nrwVX
 kwnzODmz522M5Rt4MrtMrOgU1tbAtUYQHyA1uL9GKJUokgCnGDtNNzsuV2n9iLsQMg34
 u7TOSKp7lhFUDz/3JWzNGn/pGvD8s6x2WlByRfKwkcoD3AeTNBNgCFWtBSOl1rxU1FBx
 NpxwV8UXAqgiHQD02y+vpEU1TTMtYmIlZYLsudha2iN7aPFORe507/tMtCOTxuYvJ4H8
 J2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gaj+hsFra3tAAn41KvUkD6S/64I4IDGVCSXdBoXHO4Y=;
 b=8DFQ4mtw2KxmW+pXd2ZOf8pjW3m25eZrFwbZuzD9dXQdlMGrP61S4L1jrVtimtHi77
 wpdTHbhBZRAUrss3V45c19mgRvtBdaOlx52cnpT2pxajK9QyXk6tPvFqluJCAWNH30c1
 GAR4v9F1dQaEVN0rblAgSJxSf1VbpyoRvf2Pd+ulLOSL0A02z1dxPLnkFnr4InBy0qyc
 NiM83WKp4eW4USZlj2cQGT3Ji77jkxPwtvlqwVrgMHoSDn50iywY82jNkxETA4otHbnN
 wtNMe2F6J+A0gmOqSBolzpMxGqSi7QBNerkuOzDEqo6AJqS5V/Lxqc45Pg0NIB/nWXVr
 IxjA==
X-Gm-Message-State: ACgBeo0zEcTmtipGZk1cxLF/EDM6VUdNrsG4XEcgVXSAunvn6Og/PJf5
 ivjpZ5LyJyFK7tgLlhuWRkmepzo0FNw=
X-Google-Smtp-Source: AA6agR5B1Wi6+1whPfRy/KEcWJHZxlVPYEwuKw02+TfXPJNmwX8h1PBi8SGm932FejldgP0EVJU6KQ==
X-Received: by 2002:a17:90a:304a:b0:1fa:d832:5aca with SMTP id
 q10-20020a17090a304a00b001fad8325acamr7351025pjl.16.1661334199814; 
 Wed, 24 Aug 2022 02:43:19 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:19 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 41/51] tests/qtest: migration-test: Kill "to" after migration
 is canceled
Date: Wed, 24 Aug 2022 17:40:19 +0800
Message-Id: <20220824094029.1634519-42-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Make sure QEMU process "to" is killed before launching another target
for migration in the test_multifd_tcp_cancel case.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/migration-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 125d48d855..18ec079abf 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)
     wait_for_migration_pass(from);
 
     migrate_cancel(from);
+    /* Make sure QEMU process "to" is killed */
+    if (qtest_probe_child(to)) {
+        qtest_kill_qemu(to);
+    }
 
     args = (MigrateStart){
         .only_target = true,
-- 
2.34.1


