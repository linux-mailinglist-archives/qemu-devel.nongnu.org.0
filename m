Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4658693CA6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:54:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROx8-0002Fa-K3; Sun, 12 Feb 2023 21:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROx6-0002F6-QP
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROx5-0006vX-A7
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6F1ytG82HghmM9+Be+OnSoaHtAltN0OwlcsGh3hnda0=;
 b=BOSn4ujd3WYHz7f1Ewm/RJDa6WWMKrdyrm0Y1MakgLqL1odxGgyuI5s4qj9NbbystSHReG
 SBAvcXB3qgr6/5xro6XDgK3chLzNhybYX9exp6M724+IllzyBn3PWFWLAWAFZV4VMcqK4c
 dvjWf6S9WDHmy01U+zU1rfXtULoeG5Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-sfaKWd-YNDymmvr18xYUZA-1; Sun, 12 Feb 2023 21:52:21 -0500
X-MC-Unique: sfaKWd-YNDymmvr18xYUZA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso6056689wms.7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6F1ytG82HghmM9+Be+OnSoaHtAltN0OwlcsGh3hnda0=;
 b=QAGpfAo4xTEeR+y9HHFpHJn0cHMnKl426zYEKMbw1LnGHHXySiH2e3v73PCxa88xK6
 dF4hYuN2FT8ptUSBMzK8cQA3/Aa3bTaZrLwVx59pi24L/J6anbo8kSQ0a2rhXJlDg7rz
 cVFkxeplS5u/VXKc+UHUwcC87MTlqq5GzDWD0eNlCbtVxlzceha/KB8pF23Nq1sAicyE
 WDYn+knmyhEc96xoMa04yndwTxBoYFa94lQGQolb4noC4rEghXljH1W4+AyT1jj1lbUY
 mVhsOOD30yVU74/EJ5PKR06fCF0oQZxeX3CLUCbxtQdM9PwaMLVSsdAD+V+uEV0eKbwo
 JDCg==
X-Gm-Message-State: AO0yUKVJi1RqOuNk03tjtTlvQei4Gx+e0fOvJzpKO/E9jfGYI41R+WD8
 F3pmqXOGRGZlifoixpcxgO9pD5lMG4gmSbJRLwQ0Ow4USMnmjNtCc/ig+1UdLO+wLCWBNZBDZpQ
 DjRlJW2K4MsYlW0gmiayXspY5uWOzdA6bc58a2PhQIiH3N48Bp/rvfCexpraBTG9cAjyl8r2X
X-Received: by 2002:a05:600c:4da5:b0:3dd:1c45:fe3a with SMTP id
 v37-20020a05600c4da500b003dd1c45fe3amr3413605wmp.16.1676256740019; 
 Sun, 12 Feb 2023 18:52:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9rghx0DQjPAU9VrEkfJWsHDnyh4R9fsu4JMX8E/jlKi4RkpYrD8tZ48AksHhVP4o/cODgzjg==
X-Received: by 2002:a05:600c:4da5:b0:3dd:1c45:fe3a with SMTP id
 v37-20020a05600c4da500b003dd1c45fe3amr3413587wmp.16.1676256739765; 
 Sun, 12 Feb 2023 18:52:19 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 p5-20020a1c5445000000b003dc492e4430sm12389664wmi.28.2023.02.12.18.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 16/22] migration: Add a semaphore to count PONGs
Date: Mon, 13 Feb 2023 03:51:44 +0100
Message-Id: <20230213025150.71537-17-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: Peter Xu <peterx@redhat.com>

This is mostly useless, but useful for us to know whether the main channel
is correctly established without changing the migration protocol.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h | 6 ++++++
 migration/migration.c | 3 +++
 2 files changed, 9 insertions(+)

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
-- 
2.39.1


