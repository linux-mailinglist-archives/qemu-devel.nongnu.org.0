Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BD5FC890
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:41:16 +0200 (CEST)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidr9-000420-3w
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oidoC-0006iC-Rv
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:38:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oido8-0001E7-8P
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665589086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AshRl0qff47RtQHimqHVJFq8Vb6NhZReyz43xzowdD0=;
 b=QuvkrGWned5RoziPi00qR7VLJwDXi3R1uoMv4LY0f/gPsViRNokGndykGydikYAC2mloIR
 urPbYmqdy2PXk41FoBkmTVsGAAryKt4myhFFb+DxOBOF2bPjRYuqR+OtGX5yPYhPdabMF2
 8NbPFv/M/HNVjlU+BQoEgNjbJFqZkmQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-7k5oZr4EM72H3My-TIP5IQ-1; Wed, 12 Oct 2022 11:38:03 -0400
X-MC-Unique: 7k5oZr4EM72H3My-TIP5IQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E0E6811E75;
 Wed, 12 Oct 2022 15:38:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1C77111E407;
 Wed, 12 Oct 2022 15:38:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 70A7B21E6931; Wed, 12 Oct 2022 17:38:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, lvivier@redhat.com, amit@kernel.org,
 mst@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, david@redhat.com
Subject: [PATCH 2/4] backends: Improve error messages when property can no
 longer be set
Date: Wed, 12 Oct 2022 17:37:59 +0200
Message-Id: <20221012153801.2604340-3-armbru@redhat.com>
In-Reply-To: <20221012153801.2604340-1-armbru@redhat.com>
References: <20221012153801.2604340-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When you try to set virtio-rng property "filename" after the backend
has been completed with user_creatable_complete(), the error message
blames "insufficient permission":

    $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio -object rng-random,id=rng0 -device virtio-rng,id=vrng0,rng=rng0
    QEMU 7.1.50 monitor - type 'help' for more information
    (qemu) qom-set /objects/rng0 filename /dev/random
    Error: Insufficient permission to perform this operation

This implies it could work with "sufficient permission".  It can't.
Change the error message to:

    Error: Property 'filename' can no longer be set

Same for cryptodev-vhost-user property "chardev", rng-egd property
"chardev", and vhost-user-backend property "chardev".

Signed-off-by: Markus Armbruster <armbru@redhat.com>

# This is the commit message #2:

# fixup! backends: Improve error messages when property can no longer be set
---
 backends/cryptodev-vhost-user.c | 2 +-
 backends/rng-egd.c              | 2 +-
 backends/rng-random.c           | 2 +-
 backends/vhost-user.c           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index 5443a59153..f9c5867e38 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -339,7 +339,7 @@ static void cryptodev_vhost_user_set_chardev(Object *obj,
                       CRYPTODEV_BACKEND_VHOST_USER(obj);
 
     if (s->opened) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
+        error_setg(errp, "Property 'chardev' can no longer be set");
     } else {
         g_free(s->chr_name);
         s->chr_name = g_strdup(value);
diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index 4de142b9dc..684c3cf3d6 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -116,7 +116,7 @@ static void rng_egd_set_chardev(Object *obj, const char *value, Error **errp)
     RngEgd *s = RNG_EGD(b);
 
     if (b->opened) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
+        error_setg(errp, "Property 'chardev' can no longer be set");
     } else {
         g_free(s->chr_name);
         s->chr_name = g_strdup(value);
diff --git a/backends/rng-random.c b/backends/rng-random.c
index 7add272edd..80eb5be138 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -96,7 +96,7 @@ static void rng_random_set_filename(Object *obj, const char *filename,
     RngRandom *s = RNG_RANDOM(obj);
 
     if (b->opened) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
+        error_setg(errp, "Property 'filename' can no longer be set");
         return;
     }
 
diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 10b39992d2..5dedb2d987 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -141,7 +141,7 @@ static void set_chardev(Object *obj, const char *value, Error **errp)
     Chardev *chr;
 
     if (b->completed) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
+        error_setg(errp, "Property 'chardev' can no longer be set");
         return;
     }
 
-- 
2.37.2


