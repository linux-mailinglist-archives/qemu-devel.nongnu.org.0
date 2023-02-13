Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0BA693C5E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRObP-0001hj-ND; Sun, 12 Feb 2023 21:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObN-0001h2-PA
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObM-00039k-1X
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUfdlqTOaMY/BDBu9wtEDIhadSAGMERvz+eZij4EHiY=;
 b=DTaUPAiz7BRzUCF5DkfSaWQffxx9z+KF/20shFXFCGezptgkor8HV2SWxiZY6+gEJODDwN
 DlNWuAzKWpv8sjUJ1sLlsHNFoGk716nEVKaMbj5pTPVAYr61NFrf+a5+b575kx5goeAlEw
 TwJrMO0czycY/xIdcxYB2fxMp3hav6U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-wXNrvfLDON-Mwjo8NmsZHA-1; Sun, 12 Feb 2023 21:29:45 -0500
X-MC-Unique: wXNrvfLDON-Mwjo8NmsZHA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r14-20020a05600c35ce00b003e10bfcd160so6034819wmq.6
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUfdlqTOaMY/BDBu9wtEDIhadSAGMERvz+eZij4EHiY=;
 b=tWMI7NKWajl8QHW4aRthr1FYcZ5VVSbtk0tMqXbSkSObTMbSiAQP0GCsTpkleL096m
 Jcuun5waY52sk+qvOZc2MPedWnjrL4af4iz0s1hSQqmHSxykBs58L47ktOI8a5jRofI5
 1pwzFB2646dY3onK9CXWrsLC9bSlRaM3h5nHRHpSimIqgpth/nONc7dKBrWUWN1bmFnV
 JN6utEvlXT0zt80mIPHxq+Vns/SXshoFVv4598ikkKso7XNwDGmfp2XXmYbAGQYEnfnJ
 FIzyBLj2ntG5QrB+r1tGY7JP5OQHBbyzEiyFos6RWryfa69SIop/DcVhO2KfsbBjldsY
 +crw==
X-Gm-Message-State: AO0yUKWznrz543Pl5i/WI6gj0H+Tf9f+2oBchJNtmOWBdAqlLMIGH/cJ
 cLiwbg1tybNxZQG7A0CQ2EDNfWab9iGJUUp1ViNHzJPbJSTpM98xlm5l506u/PjU5cLv5f5VTfe
 dUkpR9ys84fUYR0AbOAFOVsq+ZhLMiw4gydoa+TylIXwx/kQfrq+tiivWzOykwm5g7VkbeRVC
X-Received: by 2002:a05:600c:16c4:b0:3da:270b:ba6b with SMTP id
 l4-20020a05600c16c400b003da270bba6bmr19254508wmn.41.1676255383829; 
 Sun, 12 Feb 2023 18:29:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8Qn//cbEFCcD4e2+XicGyA204Lx92VcE6cIPopwYnuJH8nb0AvOSENVD2dZOQN6mpvOm8Cmg==
X-Received: by 2002:a05:600c:16c4:b0:3da:270b:ba6b with SMTP id
 l4-20020a05600c16c400b003da270bba6bmr19254490wmn.41.1676255383583; 
 Sun, 12 Feb 2023 18:29:43 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c080700b003daf672a616sm11843175wmp.22.2023.02.12.18.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:43 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 18/22] migration/multifd: Change multifd_load_cleanup()
 signature and usage
Date: Mon, 13 Feb 2023 03:29:07 +0100
Message-Id: <20230213022911.68490-19-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

Since it's introduction in commit f986c3d256 ("migration: Create multifd
migration threads"), multifd_load_cleanup() never returned any value
different than 0, neither set up any error on errp.

Even though, on process_incoming_migration_bh() an if clause uses it's
return value to decide on setting autostart = false, which will never
happen.

In order to simplify the codebase, change multifd_load_cleanup() signature
to 'void multifd_load_cleanup(void)', and for every usage remove error
handling or decision made based on return value != 0.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h   |  2 +-
 migration/migration.c | 14 ++++----------
 migration/multifd.c   |  6 ++----
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index ff3aa2e2e9..9a7e1a8826 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -16,7 +16,7 @@
 int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
-int multifd_load_cleanup(Error **errp);
+void multifd_load_cleanup(void);
 bool multifd_recv_all_channels_created(void);
 void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
diff --git a/migration/migration.c b/migration/migration.c
index a5c22e327d..5bf332fdd2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -559,13 +559,7 @@ static void process_incoming_migration_bh(void *opaque)
      */
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    if (multifd_load_cleanup(&local_err) != 0) {
-        error_report_err(local_err);
-        autostart = false;
-    }
-    /* If global state section was not received or we are in running
-       state, we need to obey autostart. Any other state is set with
-       runstate_set. */
+    multifd_load_cleanup();
 
     dirty_bitmap_mig_before_vm_start();
 
@@ -665,9 +659,9 @@ fail:
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                       MIGRATION_STATUS_FAILED);
     qemu_fclose(mis->from_src_file);
-    if (multifd_load_cleanup(&local_err) != 0) {
-        error_report_err(local_err);
-    }
+
+    multifd_load_cleanup();
+
     exit(EXIT_FAILURE);
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 99a59830c8..cac8496edc 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1013,12 +1013,12 @@ static void multifd_recv_terminate_threads(Error *err)
     }
 }
 
-int multifd_load_cleanup(Error **errp)
+void multifd_load_cleanup(void)
 {
     int i;
 
     if (!migrate_use_multifd()) {
-        return 0;
+        return;
     }
     multifd_recv_terminate_threads(NULL);
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -1058,8 +1058,6 @@ int multifd_load_cleanup(Error **errp)
     multifd_recv_state->params = NULL;
     g_free(multifd_recv_state);
     multifd_recv_state = NULL;
-
-    return 0;
 }
 
 void multifd_recv_sync_main(void)
-- 
2.39.1


