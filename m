Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C86888F9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:26:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNh50-0007xf-Ay; Thu, 02 Feb 2023 16:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNh4w-0007vR-F5
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 16:25:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNh4t-0006xv-Ob
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 16:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675373107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wC11PH8VvFSND2yahcwxbC8VUz8aelvJrVdxn5q3eZQ=;
 b=RhxYBOR1RNMo0YdeNGFNmsxd1V2+M9rLg1uI0NucG9RxM9lYYaMAEyTwZpTAVi1tKmueou
 qTx43qfgqccvYYZz6dvzHZqUBAFB3jy7PMuqTAYvfK+EudE3i75uDFED65lyROJoSy4jjo
 H+rBx+9HsVFAyJOTGpX42Qz2iT+B6Io=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-7TDSuhG1OfiTgE8VyNBbOw-1; Thu, 02 Feb 2023 16:25:05 -0500
X-MC-Unique: 7TDSuhG1OfiTgE8VyNBbOw-1
Received: by mail-qk1-f200.google.com with SMTP id
 x12-20020a05620a258c00b007051ae500a2so2093453qko.15
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 13:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wC11PH8VvFSND2yahcwxbC8VUz8aelvJrVdxn5q3eZQ=;
 b=32R7VWnN+C4jlUQm+xr/0gNZloikAwIvc7FdWhA6HvHkT7pEchULtSu1hjvAN6eGLt
 QagytUHgaiYeo/t2GrsSOK5XoYIPtkD3l/9RTNnd4X18r460nifizzXRg2WAqBkaV8v+
 9bC5HRtflmX2VVJX52R1IuGqSS4X+rKZUVsw3k91K0+b9f6vEpPe+846PeKKwSv/Ub5C
 PF7MJeGR0HQ20W1Wc9/3DQX7bY89GrZrFlPiAi0hbj+KUcGwoEPYCDEueJjE4KUfAZh/
 sQ7VrDPB6g5+MyFs5vk4XLJQ8/syFA7Z8sFbpDa7DWOrSQ9y5M53GJDkEpJO0xS6YFyD
 Bozw==
X-Gm-Message-State: AO0yUKVBV+7W5OObDy4riDXaQQxqu+CUefPy0+y9ZLinsjURCpFa4k++
 BX8OiLY28GAAw5PENWGKl3w9TK9J+y6TvL40NV8/YjyTQJWHaafMMb29Zhk0OREBVs7vaYv0eAa
 2isvefz/A/LzKobSWRIFqzWTioQErL94jSfr9cncYOJsrsCWYFJsQgQt4GFaqTKW3
X-Received: by 2002:ad4:5695:0:b0:539:4aa4:3422 with SMTP id
 bd21-20020ad45695000000b005394aa43422mr11914033qvb.0.1675373104996; 
 Thu, 02 Feb 2023 13:25:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+Bkf7n7rK9ujMCJknLWkwuHt88q/9z7kpBjql6jGSfHxTcUIECRBiKkMJPfyYAvf5YXrelfQ==
X-Received: by 2002:ad4:5695:0:b0:539:4aa4:3422 with SMTP id
 bd21-20020ad45695000000b005394aa43422mr11914001qvb.0.1675373104706; 
 Thu, 02 Feb 2023 13:25:04 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05620a210c00b00725fd2aabd3sm508645qkl.1.2023.02.02.13.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 13:25:03 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: [PATCH v2 2/3] migration: Add a semaphore to count PONGs
Date: Thu,  2 Feb 2023 16:24:57 -0500
Message-Id: <20230202212458.726496-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230202212458.726496-1-peterx@redhat.com>
References: <20230202212458.726496-1-peterx@redhat.com>
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
index ef7fceb5d7..d66f5cfcd7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2993,6 +2993,7 @@ retry:
         case MIG_RP_MSG_PONG:
             tmp32 = ldl_be_p(buf);
             trace_source_return_path_thread_pong(tmp32);
+            qemu_sem_post(&ms->rp_state.rp_pong_acks);
             break;
 
         case MIG_RP_MSG_REQ_PAGES:
@@ -4488,6 +4489,7 @@ static void migration_instance_finalize(Object *obj)
     qemu_sem_destroy(&ms->postcopy_pause_sem);
     qemu_sem_destroy(&ms->postcopy_pause_rp_sem);
     qemu_sem_destroy(&ms->rp_state.rp_sem);
+    qemu_sem_destroy(&ms->rp_state.rp_pong_acks);
     qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
     error_free(ms->error);
 }
@@ -4534,6 +4536,7 @@ static void migration_instance_init(Object *obj)
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


