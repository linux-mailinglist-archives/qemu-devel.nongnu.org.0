Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C84B675463
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUJ-0003HT-0o; Fri, 20 Jan 2023 07:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUC-00032X-OU
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUB-0000Qq-44
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZlGSO37j4BgianjtSJ+7rpTABqAvlAwckGK2YIjWR4=;
 b=HDe7+Dvk78dtkymT9OgWu6mxP2A+bKXf+/y36XeOx7jP8xFe7pKkBivEd1/7pyfnemt0KF
 cRtY00CSpSN+2+9AqqZ3AqjlROhOqJoofY92wBFXscC6pTUfNf9DdZlIxsd3zGfAH2WiOd
 XMxHMuKpmNSrErmz6ANGzpGmVsSc8Qk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-pktlbZFePayYddgMu3v6yw-1; Fri, 20 Jan 2023 07:27:06 -0500
X-MC-Unique: pktlbZFePayYddgMu3v6yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F37C811E9C;
 Fri, 20 Jan 2023 12:27:06 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74FC240C6EC4;
 Fri, 20 Jan 2023 12:27:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 27/38] block: Improve empty format-specific info dump
Date: Fri, 20 Jan 2023 13:26:22 +0100
Message-Id: <20230120122633.84983-28-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Hanna Reitz <hreitz@redhat.com>

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
Message-Id: <20220620162704.80987-2-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
index fea808425b..b2584f8740 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -759,7 +759,35 @@ static void dump_qdict(int indentation, QDict *dict)
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
@@ -767,7 +795,12 @@ void bdrv_image_info_specific_dump(ImageInfoSpecific *info_spec)
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
@@ -848,7 +881,7 @@ void bdrv_image_info_dump(ImageInfo *info)
     }
 
     if (info->format_specific) {
-        qemu_printf("Format specific information:\n");
-        bdrv_image_info_specific_dump(info->format_specific);
+        bdrv_image_info_specific_dump(info->format_specific,
+                                      "Format specific information:\n");
     }
 }
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 7a412d6512..d7e562dda6 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1788,8 +1788,8 @@ static int info_f(BlockBackend *blk, int argc, char **argv)
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
2.38.1


