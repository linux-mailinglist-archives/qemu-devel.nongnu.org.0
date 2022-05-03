Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966D518D6D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:47:19 +0200 (CEST)
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyUP-0004x2-S9
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlyQL-0007gO-Ul
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:43:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlyQG-0001Yt-2I
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651606975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AsLwc0WzmagZVTZ7m/+iyLFqXRi9tQCnpaz66vDCpIE=;
 b=FcvC9YY2ukLKcdN7y7ZbTbgcOaaXosBX1ugj6UhLqm+gdYHkBBA9komjIomuE47MDIkGy9
 5Q58ghnPipSIiDnF37iRcmp/vepOpXsLer8VM7UVoEo1RS6sY4iJWLx3CHHT6hQQWgJoFM
 fuRsPwyOKY1BA/FK1ThQdXezvNiMXKY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-_bAikI1CPrW5SyxDFIz8OA-1; Tue, 03 May 2022 11:10:55 -0400
X-MC-Unique: _bAikI1CPrW5SyxDFIz8OA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EFC23D4F445;
 Tue,  3 May 2022 14:55:32 +0000 (UTC)
Received: from localhost (unknown [10.39.193.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E95ED40D2820;
 Tue,  3 May 2022 14:55:31 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 1/4] block: Improve empty format-specific info dump
Date: Tue,  3 May 2022 16:55:26 +0200
Message-Id: <20220503145529.37070-2-hreitz@redhat.com>
In-Reply-To: <20220503145529.37070-1-hreitz@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

When a block driver supports obtaining format-specific information, but
that object only contains optional fields, it is possible that none of
them are present, so that dump_qobject() (called by
bdrv_image_info_specific_dump()) will not print anything.

The callers of bdrv_image_info_specific_dump() put a header above this
information ("Format specific information:\n"), which will look strange
when there is nothing below.  Modify bdrv_image_info_specific_dump() to
print this header instead of its callers, and only if there is indeed
something to be printed.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/qapi.h |  3 ++-
 block/qapi.c         | 41 +++++++++++++++++++++++++++++++++++++----
 qemu-io-cmds.c       |  4 ++--
 3 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/include/block/qapi.h b/include/block/qapi.h
index 22c7807c89..c09859ea78 100644
--- a/include/block/qapi.h
+++ b/include/block/qapi.h
@@ -40,6 +40,7 @@ void bdrv_query_image_info(BlockDriverState *bs,
                            Error **errp);
 
 void bdrv_snapshot_dump(QEMUSnapshotInfo *sn);
-void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec);
+void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
+                                   const char *prefix);
 void bdrv_image_info_dump(ImageInfo *info);
 #endif
diff --git a/block/qapi.c b/block/qapi.c
index cf557e3aea..51202b470a 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -777,7 +777,35 @@ static void dump_qdict(int indentation, QDict *dict)
     }
 }
 
-void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec)
+/*
+ * Return whether dumping the given QObject with dump_qobject() would
+ * yield an empty dump, i.e. not print anything.
+ */
+static bool qobject_is_empty_dump(const QObject *obj)
+{
+    switch (qobject_type(obj)) {
+    case QTYPE_QNUM:
+    case QTYPE_QSTRING:
+    case QTYPE_QBOOL:
+        return false;
+
+    case QTYPE_QDICT:
+        return qdict_size(qobject_to(QDict, obj)) == 0;
+
+    case QTYPE_QLIST:
+        return qlist_empty(qobject_to(QList, obj));
+
+    default:
+        abort();
+    }
+}
+
+/**
+ * Dumps the given ImageInfoSpecific object in a human-readable form,
+ * prepending an optional prefix if the dump is not empty.
+ */
+void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec,
+                                   const char *prefix)
 {
     QObject *obj, *data;
     Visitor *v = qobject_output_visitor_new(&obj);
@@ -785,7 +813,12 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec)
     visit_type_ImageInfoSpecific(v, NULL, &info_spec, &error_abort);
     visit_complete(v, &obj);
     data = qdict_get(qobject_to(QDict, obj), "data");
-    dump_qobject(1, data);
+    if (!qobject_is_empty_dump(data)) {
+        if (prefix) {
+            qemu_printf("%s", prefix);
+        }
+        dump_qobject(1, data);
+    }
     qobject_unref(obj);
     visit_free(v);
 }
@@ -866,7 +899,7 @@ void bdrv_image_info_dump(ImageInfo *info)
     }
 
     if (info->has_format_specific) {
-        qemu_printf("Format specific information:\n");
-        bdrv_image_info_specific_dump(info->format_specific);
+        bdrv_image_info_specific_dump(info->format_specific,
+                                      "Format specific information:\n");
     }
 }
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 2f0d8ac25a..084ec44d3b 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1819,8 +1819,8 @@ static int info_f(BlockBackend *blk, int argc, char **argv)
         return -EIO;
     }
     if (spec_info) {
-        printf("Format specific information:\n");
-        bdrv_image_info_specific_dump(spec_info);
+        bdrv_image_info_specific_dump(spec_info,
+                                      "Format specific information:\n");
         qapi_free_ImageInfoSpecific(spec_info);
     }
 
-- 
2.35.1


