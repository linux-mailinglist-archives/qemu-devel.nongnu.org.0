Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483968F8D2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:29:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr3N-0003Sc-Cp; Wed, 08 Feb 2023 15:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPr3L-0003SS-IP
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:28:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPr3K-0004A2-46
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kwk67BsCUneg2OIixwsflKflQC4BLP4eo50c6bA+NIE=;
 b=ZicHir1bUYSI8LggqtP3JImJAKrZw9tJbDI3WQEtJ6LdlxMzy8fHJ3Ee+gLEfWpIv+58+o
 /qTq/pjkHaDNEgF9JbNAXxEkZ1x79/s15CWz/lXfcQ1GuJTeBeOIH5BcmYhGEfJu4Tb+dQ
 eUwJD+7xZ49uLMazPH3gCXifvN+gVIg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-EMkrM-zwPlevhmMwEIEcYw-1; Wed, 08 Feb 2023 15:28:23 -0500
X-MC-Unique: EMkrM-zwPlevhmMwEIEcYw-1
Received: by mail-qt1-f197.google.com with SMTP id
 hf20-20020a05622a609400b003abcad051d2so11320556qtb.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kwk67BsCUneg2OIixwsflKflQC4BLP4eo50c6bA+NIE=;
 b=pjiOSRYkvnBJXJSAJaJRzCYcPRHycByxfzd1rZc+fNwr596eAEmyvVc/yYb1UkuL4S
 Mq1xwUBgkkSeEpDUnpOslEXWJ1IRLVT0RokZLRfm5HNtmJK5xhhPwm6/8HqOX2JRx3cg
 wwWuWLNzy9Bl6Fx8ijAIeAjECxkpgRpmqyS4gmbiGWfp+E1lZUWwKlXNNacjkFbdTt03
 mrMa0FL3EtE9X30PZdzIg13GFA9peuKmYoTfiG+5V6ql9Vm8NoHG8dbUI9nU+dGnfqQi
 mR9QRzbzekRJUdiFp9SJIISBRBA2imO9afNSfSwt1pJ3RBihE+S/pWjmVj8ma8jg8C24
 26yA==
X-Gm-Message-State: AO0yUKXsnGJ8WBqNBtHeJ89MxEic7B1i5vF2v29+h7E5CZcqt21p8lQr
 8Fi5ccQcJeP1nyACKrfPYNmnJGBD97diHvC+QO0X7oENt5v8kuTo/kEUJbOfE/OglaHPPREAv9L
 vzq4QeUZSJe8IxLnQ0Ai+xbJ9xRPkRfV+9i1op9rmHys4ia+zXfI738+ZTnuNJZnbjwMwSg==
X-Received: by 2002:a0c:dd0f:0:b0:539:aae2:8dc4 with SMTP id
 u15-20020a0cdd0f000000b00539aae28dc4mr11854645qvk.4.1675888102394; 
 Wed, 08 Feb 2023 12:28:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9bnJ6cO+1DZqZy5qVrvxU+5CIr7ACY1Pm9SO0tme7S0m+QLIj3s8Z3phQM63ZmIw7AUt9WxA==
X-Received: by 2002:a0c:dd0f:0:b0:539:aae2:8dc4 with SMTP id
 u15-20020a0cdd0f000000b00539aae28dc4mr11854595qvk.4.1675888101934; 
 Wed, 08 Feb 2023 12:28:21 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a37e204000000b0070d11191e91sm12287144qki.44.2023.02.08.12.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 12:28:20 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v3 3/4] migration: Add a semaphore to count PONGs
Date: Wed,  8 Feb 2023 15:28:12 -0500
Message-Id: <20230208202813.1363225-4-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230208202813.1363225-1-peterx@redhat.com>
References: <20230208202813.1363225-1-peterx@redhat.com>
MIME-Version: 1.0
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
index fb0ecf5649..a2e362541d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3025,6 +3025,7 @@ retry:
         case MIG_RP_MSG_PONG:
             tmp32 = ldl_be_p(buf);
             trace_source_return_path_thread_pong(tmp32);
+            qemu_sem_post(&ms->rp_state.rp_pong_acks);
             break;
 
         case MIG_RP_MSG_REQ_PAGES:
@@ -4524,6 +4525,7 @@ static void migration_instance_finalize(Object *obj)
     qemu_sem_destroy(&ms->postcopy_pause_sem);
     qemu_sem_destroy(&ms->postcopy_pause_rp_sem);
     qemu_sem_destroy(&ms->rp_state.rp_sem);
+    qemu_sem_destroy(&ms->rp_state.rp_pong_acks);
     qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
     error_free(ms->error);
 }
@@ -4570,6 +4572,7 @@ static void migration_instance_init(Object *obj)
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
     qemu_sem_init(&ms->rp_state.rp_sem, 0);
+    qemu_sem_init(&ms->rp_state.rp_pong_acks, 0);
     qemu_sem_init(&ms->rate_limit_sem, 0);
     qemu_sem_init(&ms->wait_unplug_sem, 0);
     qemu_sem_init(&ms->postcopy_qemufile_src_sem, 0);
diff --git a/migration/migration.h b/migration/migration.h
index c351872360..4cb1cb6fa8 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -276,6 +276,12 @@ struct MigrationState {
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


