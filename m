Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3F64BEA9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cze-0000Im-Bm; Tue, 13 Dec 2022 16:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzT-0000G6-EM
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzR-0007fK-UF
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670967545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlUuDhuH2MYPNNQx7CecYXVPXua+Kg8ijPATqs4gGgU=;
 b=cughDSN0hEDd/x3k1BAMV8DtdXUl5KpvR1/jk/64xJss+AMfPHQuSZW0/PxIzmWHbQ6+AA
 z//DiuKYhwU0p2KBuN0aicds8+9V2cyCyRKWRGal3jrSl8QoXy44WyjKBf7QuTceCuHsDM
 IMc4GPi5N2hVOaiHhpu5QbjqEW/tLbE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-D5H7ta-ZMf62xi-O5xsKcQ-1; Tue, 13 Dec 2022 16:39:04 -0500
X-MC-Unique: D5H7ta-ZMf62xi-O5xsKcQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so1194554qkn.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nlUuDhuH2MYPNNQx7CecYXVPXua+Kg8ijPATqs4gGgU=;
 b=PQEQH/WBKWxFCFdO8jCWRysICrYMvz/paExiXzrXgKTTFzbZA+J2AJW/evL4B1lwMc
 aE9SBsyTlQyjNMD9n9N7c+gTyzswUL65qiQE1mzdDIcMH1X/zhuN2nz98xYLmyLRsZlu
 tf3qXibyJ4p9DBsfP7Zj1kLhP+2KLbG4uxtMuXrQcnzZFMdNI8DxmIHGJ/hBqMv7s92q
 UhJ5umiW+4rlxNtQU6jOHrdD484yjNdavy5SylSLObxwz4jdPbxcDGehIPdvQTaImKM8
 gwUdukQqoUsi1na25sWA4pdnllWohrH1nR0Y5+bCMUIYiSZjpSrgLY1mQXzgltFkn65g
 8TGQ==
X-Gm-Message-State: ANoB5plxp+9xFuNyEdYmXu4xfsp38AvTniEdMjvNqshEEhqzk7jXJo55
 3EBkbzXRoRIA0TJvkjq21PTP/xqGEhAVOmR+bP5xouVgLoDILjnSXekd6rcRQplyJ26rN34FfDE
 oBLejRW52NeTBieVTfIBGqdim/GoKAd/Sd/7taA6MN9RSUP+90UqklDxIQhUVbjHI
X-Received: by 2002:ad4:4d45:0:b0:4c7:6ee5:257c with SMTP id
 m5-20020ad44d45000000b004c76ee5257cmr27167296qvm.51.1670967542522; 
 Tue, 13 Dec 2022 13:39:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5PW7bY76+Q43XHeZnrplCcueI5UZbYMCnFFWCoZOU/XqabFTNB/atFGT3l+7/PIbfpgqgChg==
X-Received: by 2002:ad4:4d45:0:b0:4c7:6ee5:257c with SMTP id
 m5-20020ad44d45000000b004c76ee5257cmr27167272qvm.51.1670967542238; 
 Tue, 13 Dec 2022 13:39:02 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006feb158e5e7sm8607487qkp.70.2022.12.13.13.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:39:00 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH 4/5] migration: Add a semaphore to count PONGs
Date: Tue, 13 Dec 2022 16:38:49 -0500
Message-Id: <20221213213850.1481858-5-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221213213850.1481858-1-peterx@redhat.com>
References: <20221213213850.1481858-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This is mostly useless, but useful for us to know whether the main channel
is correctly established without changing the migration protocol.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 3 +++
 migration/migration.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 898bc9fe5c..fa59846717 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2981,6 +2981,7 @@ retry:
         case MIG_RP_MSG_PONG:
             tmp32 = ldl_be_p(buf);
             trace_source_return_path_thread_pong(tmp32);
+            qemu_sem_post(&ms->rp_state.rp_pong_acks);
             break;
 
         case MIG_RP_MSG_REQ_PAGES:
@@ -4470,6 +4471,7 @@ static void migration_instance_finalize(Object *obj)
     qemu_sem_destroy(&ms->postcopy_pause_sem);
     qemu_sem_destroy(&ms->postcopy_pause_rp_sem);
     qemu_sem_destroy(&ms->rp_state.rp_sem);
+    qemu_sem_destroy(&ms->rp_state.rp_pong_acks);
     qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
     error_free(ms->error);
 }
@@ -4519,6 +4521,7 @@ static void migration_instance_init(Object *obj)
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
     qemu_sem_init(&ms->rp_state.rp_sem, 0);
+    qemu_sem_init(&ms->rp_state.rp_pong_acks, 0);
     qemu_sem_init(&ms->rate_limit_sem, 0);
     qemu_sem_init(&ms->wait_unplug_sem, 0);
     qemu_sem_init(&ms->postcopy_qemufile_src_sem, 0);
diff --git a/migration/migration.h b/migration/migration.h
index ea8d083a51..61dc2c81df 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -275,6 +275,12 @@ struct MigrationState {
          */
         bool          rp_thread_created;
         QemuSemaphore rp_sem;
+        /*
+         * We post to this when we got one PONG from dest. So far it's an
+         * easy way to know the main channel has successfully established
+         * on dest QEMU.
+         */
+        QemuSemaphore rp_pong_acks;
     } rp_state;
 
     double mbps;
-- 
2.37.3


