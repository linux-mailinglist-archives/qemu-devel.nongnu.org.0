Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F5262EFBB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 09:38:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwsJ-0004Ch-Sg; Fri, 18 Nov 2022 03:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1ovwsH-0004CU-Ne
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:37:25 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1ovwsF-00085S-Fd
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:37:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so4442644pjk.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 00:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rhGQjfJqqUlqsThZPNRkO64w6Tz4zq2pcnx7WJ6Od6M=;
 b=R4WWsJbxmY3xzF10uQ/c9BS5kk8WS7kVNW4EJp+3aExVVq3v3E/5gzKhq2IPcGjdJX
 zWiopFSecGMAf+UTWSWJ4oAfumV/Uw6spsi6kf8f0+H/7qqInopQ8EErsVaG52JoQ26C
 kDwVCtzcgKbanewFhJg2TajUeeD4Z1kzzln5cJXoJAiztsCHcUbLcD4+NihzAS3Nde9h
 1i78pWXXo4NovkGpoH+I/eja+lWUFjH/C1h12VhsYEoAmtNagfi19yyAoLqVAmRSst3N
 YE72QMHTJWJF/ZUmImN68hY55h86eo3hVVcmU7nn9Xp5hQdpDZv9FkoSMuigAjC6YH3o
 Go1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rhGQjfJqqUlqsThZPNRkO64w6Tz4zq2pcnx7WJ6Od6M=;
 b=MOw3p4sSo3t+hgTOAPE+moe7OqHQ5kl3X8sFAn51vIzU5+ciAsauq24mABNGOEnWO6
 3eXVzc5Hv9SU04L0KAogyqxGHJ//pXs0fzPtjClrFuwMPIolGgtpubzMgLUEh2Pff3MO
 Cjd45H01t7rldTIowxePV0FtoeSrwmm44EtvUODRjJl1obTMyF1UbC3jKLwM0I5Qx/46
 XCPtqHU/qiRtgwDgzzAMNSYDGiyCsU0VATWuLP5YJYyuIpd47B0OObFphQF18gu/s1Kh
 tPf4qd5Tg/Gl39rxQdtDpR01dHyzgAO9KlIK5IS5uhuQegmwX2c27nzYDDSXwp3w38qO
 SxkA==
X-Gm-Message-State: ANoB5pkRgMBgmdkdx8SotZf7fJ3/JD7EelogV6sA4LEOvdb2VqGoLewd
 oS6xK0omHg6LhxoN95ZEENXfmLYShymxgPLJ
X-Google-Smtp-Source: AA0mqf6SZlYaO9P/M9etUdpuHvEGRAtFTpPM9ER6PZXEB2H6HuLbTTMaXGmowal3lid5ZAsSdjylDg==
X-Received: by 2002:a17:902:f111:b0:188:ca57:8945 with SMTP id
 e17-20020a170902f11100b00188ca578945mr6654798plb.116.1668760640871; 
 Fri, 18 Nov 2022 00:37:20 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a624e0e000000b0056bd6b14144sm2533489pfb.180.2022.11.18.00.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 00:37:20 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, peterx@redhat.com,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC PATCH] migration: reduce time of loading non-iterable vmstate
Date: Fri, 18 Nov 2022 16:36:48 +0800
Message-Id: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The duration of loading non-iterable vmstate accounts for a significant
portion of downtime (starting with the timestamp of source qemu stop and
ending with the timestamp of target qemu start). Most of the time is spent
committing memory region changes repeatedly.

This patch packs all the changes to memory region during the period of
loading non-iterable vmstate in a single memory transaction. With the
increase of devices, this patch will greatly improve the performance.

Here are the test results:
test vm info:
- 32 CPUs 128GB RAM
- 8 16-queue vhost-net device
- 16 4-queue vhost-user-blk device.

	time of loading non-iterable vmstate
before		about 210 ms
after		about 40 ms

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 migration/migration.c | 1 +
 migration/migration.h | 2 ++
 migration/savevm.c    | 8 ++++++++
 3 files changed, 11 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index e6f8bc2478..ed20704552 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -224,6 +224,7 @@ void migration_object_init(void)
     qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
     qemu_mutex_init(&current_incoming->page_request_mutex);
     current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
+    current_incoming->start_pack_mr_change = false;
 
     migration_object_check(current_migration, &error_fatal);
 
diff --git a/migration/migration.h b/migration/migration.h
index 58b245b138..86597f5feb 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -186,6 +186,8 @@ struct MigrationIncomingState {
      * contains valid information.
      */
     QemuMutex page_request_mutex;
+
+    bool start_pack_mr_change;
 };
 
 MigrationIncomingState *migration_incoming_get_current(void);
diff --git a/migration/savevm.c b/migration/savevm.c
index 48e85c052c..a073009a74 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2630,6 +2630,12 @@ retry:
         switch (section_type) {
         case QEMU_VM_SECTION_START:
         case QEMU_VM_SECTION_FULL:
+            /* call memory_region_transaction_begin() before loading non-iterable vmstate */
+            if (section_type == QEMU_VM_SECTION_FULL && !mis->start_pack_mr_change) {
+                memory_region_transaction_begin();
+                mis->start_pack_mr_change = true;
+            }
+
             ret = qemu_loadvm_section_start_full(f, mis);
             if (ret < 0) {
                 goto out;
@@ -2650,6 +2656,8 @@ retry:
             }
             break;
         case QEMU_VM_EOF:
+            /* call memory_region_transaction_commit() after loading non-iterable vmstate */
+            memory_region_transaction_commit();
             /* This is the end of migration */
             goto out;
         default:
-- 
2.20.1


