Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE45850DF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:25:42 +0200 (CEST)
Received: from localhost ([::1]:55184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHPzp-00040f-6n
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oHPdP-0008Ji-Sf
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oHPdO-0000Ih-7q
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659099749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jr0cdIeZwQm9yeviOFlC/QVSAnd2NCODQdmfBRtYP5A=;
 b=PebxDUw/5Lhbmv22lx3H6i7U+crOyZsdNCh9a6CSLRJQHd4jhvaFO1Ill3Y294JR/ktdz+
 Ap5Deip9LekRljeymkgWkJJBBFsAYvrD7JOpdt61CRse+ANMg26LWdh6Cgzd0P1WOvECuW
 JMKwUguJeZsChpyrxEoM7KYzYT60ISU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-jK1iQRqtMIuUylAnjF7ulQ-1; Fri, 29 Jul 2022 09:02:26 -0400
X-MC-Unique: jK1iQRqtMIuUylAnjF7ulQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 251B4380451F;
 Fri, 29 Jul 2022 13:02:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 418802026D64;
 Fri, 29 Jul 2022 13:02:14 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Hannes Reinecke <hare@suse.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Peter Lieven <pl@kamp.de>, kvm@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>, Eric Auger <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefan Weil <sw@weilnetz.de>, Klaus Jensen <its@irrelevant.dk>,
 Laurent Vivier <lvivier@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Michael Roth <michael.roth@amd.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [RFC v2 08/10] Fix some bad coroutine_fn indirect calls and pointer
 assignments
Date: Fri, 29 Jul 2022 14:00:37 +0100
Message-Id: <20220729130040.1428779-9-afaria@redhat.com>
In-Reply-To: <20220729130040.1428779-1-afaria@redhat.com>
References: <20220729130040.1428779-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

These problems were found by static-analyzer.py.

Not all occurrences of these problems were fixed.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/backup.c                   |  2 +-
 include/block/block_int-common.h | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index b2b649e305..6a9ad97a53 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -309,7 +309,7 @@ static void coroutine_fn backup_pause(Job *job)
     }
 }
 
-static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
+static void backup_set_speed(BlockJob *job, int64_t speed)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common);
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..16c45d1262 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -731,13 +731,11 @@ struct BlockDriver {
     void coroutine_fn (*bdrv_co_drain_end)(BlockDriverState *bs);
 
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
-    bool (*bdrv_co_can_store_new_dirty_bitmap)(BlockDriverState *bs,
-                                               const char *name,
-                                               uint32_t granularity,
-                                               Error **errp);
-    int (*bdrv_co_remove_persistent_dirty_bitmap)(BlockDriverState *bs,
-                                                  const char *name,
-                                                  Error **errp);
+    bool coroutine_fn (*bdrv_co_can_store_new_dirty_bitmap)(
+        BlockDriverState *bs, const char *name, uint32_t granularity,
+        Error **errp);
+    int coroutine_fn (*bdrv_co_remove_persistent_dirty_bitmap)(
+        BlockDriverState *bs, const char *name, Error **errp);
 };
 
 static inline bool block_driver_can_compress(BlockDriver *drv)
-- 
2.37.1


