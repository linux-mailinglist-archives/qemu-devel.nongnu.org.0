Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F4674D9F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:03:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlPD-00009Q-PG; Fri, 20 Jan 2023 02:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlOz-0008UG-PR
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlOx-0005GO-Th
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674198087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TC0jWFMGoAYpAGn99fdBxChxOKtjBjhu0HgZzGAObY=;
 b=fPN2deqaGDKERAG5h19eC+IgMvKU5viRq4zMfDYeVLk0ukxi1nI5e5x/HUCrEXWqKuw/5D
 HYfiRdMD9ugGLMPb0z+CnrO3v1vx+ZD1LV2eE3NwQRjcN6W72rKjS5tzDPhdx1vtl8c1YY
 KoZBEyHxarAhPnpFJKtPD2b4nXgtl6o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-z05Pct72NW-LdJHZdLnv7g-1; Fri, 20 Jan 2023 02:01:24 -0500
X-MC-Unique: z05Pct72NW-LdJHZdLnv7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB12D3C0D194;
 Fri, 20 Jan 2023 07:01:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B15C15BAD;
 Fri, 20 Jan 2023 07:01:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8307421E66CB; Fri, 20 Jan 2023 08:01:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 01/12] coroutine: Clean up superfluous inclusion of
 qemu/coroutine.h
Date: Fri, 20 Jan 2023 08:01:11 +0100
Message-Id: <20230120070122.3982588-2-armbru@redhat.com>
In-Reply-To: <20230120070122.3982588-1-armbru@redhat.com>
References: <20230120070122.3982588-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221221131435.3851212-2-armbru@redhat.com>
---
 crypto/block-luks-priv.h    | 1 -
 include/block/raw-aio.h     | 1 -
 include/scsi/pr-manager.h   | 1 -
 nbd/nbd-internal.h          | 1 -
 blockjob.c                  | 1 -
 crypto/block-luks.c         | 1 -
 hw/9pfs/codir.c             | 1 -
 hw/9pfs/cofile.c            | 1 -
 hw/9pfs/cofs.c              | 1 -
 hw/9pfs/coxattr.c           | 1 -
 tests/unit/test-coroutine.c | 1 -
 tests/unit/test-vmstate.c   | 1 -
 util/qemu-coroutine-lock.c  | 1 -
 util/qemu-coroutine-sleep.c | 1 -
 util/qemu-coroutine.c       | 1 -
 15 files changed, 15 deletions(-)

diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
index 90a20d432b..dc2dd14e52 100644
--- a/crypto/block-luks-priv.h
+++ b/crypto/block-luks-priv.h
@@ -31,7 +31,6 @@
 #include "crypto/random.h"
 #include "qemu/uuid.h"
 
-#include "qemu/coroutine.h"
 #include "qemu/bitmap.h"
 
 /*
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 21fc10c4c9..f8cda9df91 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -17,7 +17,6 @@
 #define QEMU_RAW_AIO_H
 
 #include "block/aio.h"
-#include "qemu/coroutine.h"
 #include "qemu/iov.h"
 
 /* AIO request types */
diff --git a/include/scsi/pr-manager.h b/include/scsi/pr-manager.h
index e4ecbe00f6..45de28d354 100644
--- a/include/scsi/pr-manager.h
+++ b/include/scsi/pr-manager.h
@@ -5,7 +5,6 @@
 #include "qapi/visitor.h"
 #include "qom/object_interfaces.h"
 #include "block/aio.h"
-#include "qemu/coroutine.h"
 
 #define TYPE_PR_MANAGER "pr-manager"
 
diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
index 1b2141ab4b..df42fef706 100644
--- a/nbd/nbd-internal.h
+++ b/nbd/nbd-internal.h
@@ -13,7 +13,6 @@
 #include "sysemu/block-backend.h"
 #include "io/channel-tls.h"
 
-#include "qemu/coroutine.h"
 #include "qemu/iov.h"
 
 #ifndef _WIN32
diff --git a/blockjob.c b/blockjob.c
index b7daf2a9f6..54b4091a36 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -32,7 +32,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-block-core.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
 
diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index ff9e3945d1..5688783ab1 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -32,7 +32,6 @@
 #include "crypto/random.h"
 #include "qemu/uuid.h"
 
-#include "qemu/coroutine.h"
 #include "qemu/bitmap.h"
 
 /*
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 93ba44fb75..7ba63be489 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "fsdev/qemu-fsdev.h"
 #include "qemu/thread.h"
-#include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
 #include "9p-xattr.h"
diff --git a/hw/9pfs/cofile.c b/hw/9pfs/cofile.c
index 20f93a90e7..9c5344039e 100644
--- a/hw/9pfs/cofile.c
+++ b/hw/9pfs/cofile.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "fsdev/qemu-fsdev.h"
 #include "qemu/thread.h"
-#include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
 
diff --git a/hw/9pfs/cofs.c b/hw/9pfs/cofs.c
index 9d0adc2e78..67e3ae5c5c 100644
--- a/hw/9pfs/cofs.c
+++ b/hw/9pfs/cofs.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "fsdev/qemu-fsdev.h"
 #include "qemu/thread.h"
-#include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
 
diff --git a/hw/9pfs/coxattr.c b/hw/9pfs/coxattr.c
index dbcd09e0fd..cd0f8488ac 100644
--- a/hw/9pfs/coxattr.c
+++ b/hw/9pfs/coxattr.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "fsdev/qemu-fsdev.h"
 #include "qemu/thread.h"
-#include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
 
diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index e16b80c245..513800d3db 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/coroutine.h"
 #include "qemu/coroutine_int.h"
 #include "qemu/lockable.h"
 
diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
index 541bb4f63e..79357b29ca 100644
--- a/tests/unit/test-vmstate.c
+++ b/tests/unit/test-vmstate.c
@@ -29,7 +29,6 @@
 #include "migration/qemu-file-types.h"
 #include "../migration/qemu-file.h"
 #include "../migration/savevm.h"
-#include "qemu/coroutine.h"
 #include "qemu/module.h"
 #include "io/channel-file.h"
 
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 45c6b57374..58f3f77181 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -27,7 +27,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/coroutine.h"
 #include "qemu/coroutine_int.h"
 #include "qemu/processor.h"
 #include "qemu/queue.h"
diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 571ab521ff..af59f9af98 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/coroutine.h"
 #include "qemu/coroutine_int.h"
 #include "qemu/timer.h"
 #include "block/aio.h"
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 356b746f0b..8494523692 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -16,7 +16,6 @@
 #include "trace.h"
 #include "qemu/thread.h"
 #include "qemu/atomic.h"
-#include "qemu/coroutine.h"
 #include "qemu/coroutine_int.h"
 #include "qemu/coroutine-tls.h"
 #include "block/aio.h"
-- 
2.39.0


