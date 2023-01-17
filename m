Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B0670B57
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9n-0002SQ-Lu; Tue, 17 Jan 2023 17:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9i-0002N5-Rd
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9g-0007oM-Qm
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IKX66sMu8sDsM/hjR01wibhbeGfEJDdJKC6LTJjtWeE=;
 b=SeHQY775v2rWS0lwK/KlNQqWZYGlxL4SuM1NJbb4jdkn5Jb9bEsoZ40EQF2Wi7ioSJOwju
 F6J5mFh8/QQ6fXxNUq1GJTn9g8pnU4X/q13/VLf+sxw8tyAR9TZS6F455uvcnedyZ2ZfXy
 vqazjA1dzVJQHON7/dBSrv3yCTFF3AA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-RIqQ8iZdOBu2qJdbWPN0yg-1; Tue, 17 Jan 2023 17:10:06 -0500
X-MC-Unique: RIqQ8iZdOBu2qJdbWPN0yg-1
Received: by mail-vk1-f199.google.com with SMTP id
 f123-20020a1f9c81000000b003e1a7591524so868519vke.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKX66sMu8sDsM/hjR01wibhbeGfEJDdJKC6LTJjtWeE=;
 b=EZmDryfRnl9qQoPNdMsOxt2UUNcobTgMopwR19zDvXDltsSIo9muzOh2u2LgaW+7W+
 ExC3Ak+8INy5WCojmEhJjAL0ao7Yc52Q1SjB3PXc7R+G4cf75jECO/73LU86CxHV/s26
 3rG2EBxV2+DbzFhwbF/m19xOmdg+k/I2cxgMxTIDyG5CxdyBij/4zzph+6D6ar5XDn2v
 8LJoAK6mxF2aYCrc4PDdlBOTNB2h5lmirl1yOD1HHncUn1wTWHcu58oY4k+LLTT6DUk/
 mZZbovcUTvG9F4c3lBDbv3bSabfRuQ/SxPHm15uMMNG3AzztLVKc2neq2DjnkkBd2BmI
 tMdw==
X-Gm-Message-State: AFqh2kpZXhpZkoJwz6OTwrMEihfFbhI1aZIPJ4VANKVU61PuSnQ7o83B
 ctIRCvJ/s9/kX0jQCcDE1s8AIt5TRkdbQaifkKRK0pEyZH4DRE0eq2aATxJhE3beElwHwUgHfDg
 RUHIZv9VS2AovqwEHdDtbA4i38/AZhxBKGy/Jyug6Yau3cg/0YLyRH3Z/C0aj2ugW
X-Received: by 2002:a05:6102:d0:b0:3d2:34b5:fe26 with SMTP id
 u16-20020a05610200d000b003d234b5fe26mr2533318vsp.16.1673993404432; 
 Tue, 17 Jan 2023 14:10:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXts4qgBQFv/LjEZO4Mz/RIzNdV6Ix7eF5wfpYxKwCxiGZIuw6oYDbxOIJfYK4RB95O7CZUGaw==
X-Received: by 2002:a05:6102:d0:b0:3d2:34b5:fe26 with SMTP id
 u16-20020a05610200d000b003d234b5fe26mr2533286vsp.16.1673993404167; 
 Tue, 17 Jan 2023 14:10:04 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:10:02 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 18/21] migration: Allow postcopy_register_shared_ufd() to
 fail
Date: Tue, 17 Jan 2023 17:09:11 -0500
Message-Id: <20230117220914.2062125-19-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Let's fail double-map for vhost-user and any potential users that can have
a remote userfaultfd for now.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/virtio/vhost-user.c   | 9 ++++++++-
 migration/postcopy-ram.c | 9 +++++++--
 migration/postcopy-ram.h | 4 ++--
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index d9ce0501b2..00351bd67a 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1952,7 +1952,14 @@ static int vhost_user_postcopy_advise(struct vhost_dev *dev, Error **errp)
     u->postcopy_fd.handler = vhost_user_postcopy_fault_handler;
     u->postcopy_fd.waker = vhost_user_postcopy_waker;
     u->postcopy_fd.idstr = "vhost-user"; /* Need to find unique name */
-    postcopy_register_shared_ufd(&u->postcopy_fd);
+
+    ret = postcopy_register_shared_ufd(&u->postcopy_fd);
+    if (ret) {
+        error_setg(errp, "%s: Register of shared userfaultfd failed: %s",
+                   __func__, strerror(ret));
+        return ret;
+    }
+
     return 0;
 #else
     error_setg(errp, "Postcopy not supported on non-Linux systems");
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index dbc7e54e4a..0cfe5174a5 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1582,14 +1582,19 @@ PostcopyState postcopy_state_set(PostcopyState new_state)
 }
 
 /* Register a handler for external shared memory postcopy
- * called on the destination.
+ * called on the destination.  Returns 0 if success, <0 for err.
  */
-void postcopy_register_shared_ufd(struct PostCopyFD *pcfd)
+int postcopy_register_shared_ufd(struct PostCopyFD *pcfd)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
+    if (migrate_hugetlb_doublemap()) {
+        return -EINVAL;
+    }
+
     mis->postcopy_remote_fds = g_array_append_val(mis->postcopy_remote_fds,
                                                   *pcfd);
+    return 0;
 }
 
 /* Unregister a handler for external shared memory postcopy
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 32734d2340..94adad6fb8 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -161,9 +161,9 @@ struct PostCopyFD {
 };
 
 /* Register a userfaultfd owned by an external process for
- * shared memory.
+ * shared memory.  Returns 0 if succeeded, <0 if error.
  */
-void postcopy_register_shared_ufd(struct PostCopyFD *pcfd);
+int postcopy_register_shared_ufd(struct PostCopyFD *pcfd);
 void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd);
 /* Call each of the shared 'waker's registered telling them of
  * availability of a block.
-- 
2.37.3


