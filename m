Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E432D33769A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:12:42 +0100 (CET)
Received: from localhost ([::1]:35462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMzR-0007dK-Ur
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc2-0004kg-UX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMbz-0002ki-AF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NDpUBrEnQeD1qiSP2fIm8w1VfH7sm3q8+AQJC9vn5o=;
 b=VqQ3BajeU/7aU6TBVaHieeOA7Y8hboBIBxFxwY+W+5NcZmKeyZP8X7vwy3ZxaGEwk96d4G
 mzWZyKWpXtnTq+Liz83p7EHLf8GJdJZ5dEbRS7rusJRHDPAjC3zClaR+br6faoOB2W0CuJ
 O++sPm25mT0whzzjPKlBNeT4gENd/qI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-k3G0G7A8Oi-L4UtsLlNN4g-1; Thu, 11 Mar 2021 09:48:21 -0500
X-MC-Unique: k3G0G7A8Oi-L4UtsLlNN4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C8D100C618;
 Thu, 11 Mar 2021 14:48:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 306035DAA5;
 Thu, 11 Mar 2021 14:48:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/38] block: remove format defaults from QemuOpts in
 bdrv_create_file()
Date: Thu, 11 Mar 2021 15:47:34 +0100
Message-Id: <20210311144811.313451-2-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

QemuOpts is usually created merging the QemuOptsList of format
and protocol. So, when the format calls bdr_create_file(), the 'opts'
parameter contains a QemuOptsList with a combination of format and
protocol default values.

The format properly removes its options before calling
bdr_create_file(), but the default values remain in 'opts->list'.
So if the protocol has options with the same name (e.g. rbd has
'cluster_size' as qcow2), it will see the default values of the format,
since for overlapping options, the format wins.

To avoid this issue, lets convert QemuOpts to QDict, in this way we take
only the set options, and then convert it back to QemuOpts, using the
'create_opts' of the protocol. So the new QemuOpts, will contain only the
protocol defaults.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210308161232.248833-1-sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 2daff6d29a..6f91dda831 100644
--- a/block.c
+++ b/block.c
@@ -670,14 +670,48 @@ out:
 
 int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
 {
+    QemuOpts *protocol_opts;
     BlockDriver *drv;
+    QDict *qdict;
+    int ret;
 
     drv = bdrv_find_protocol(filename, true, errp);
     if (drv == NULL) {
         return -ENOENT;
     }
 
-    return bdrv_create(drv, filename, opts, errp);
+    if (!drv->create_opts) {
+        error_setg(errp, "Driver '%s' does not support image creation",
+                   drv->format_name);
+        return -ENOTSUP;
+    }
+
+    /*
+     * 'opts' contains a QemuOptsList with a combination of format and protocol
+     * default values.
+     *
+     * The format properly removes its options, but the default values remain
+     * in 'opts->list'.  So if the protocol has options with the same name
+     * (e.g. rbd has 'cluster_size' as qcow2), it will see the default values
+     * of the format, since for overlapping options, the format wins.
+     *
+     * To avoid this issue, lets convert QemuOpts to QDict, in this way we take
+     * only the set options, and then convert it back to QemuOpts, using the
+     * create_opts of the protocol. So the new QemuOpts, will contain only the
+     * protocol defaults.
+     */
+    qdict = qemu_opts_to_qdict(opts, NULL);
+    protocol_opts = qemu_opts_from_qdict(drv->create_opts, qdict, errp);
+    if (protocol_opts == NULL) {
+        ret = -EINVAL;
+        goto out;
+    }
+
+    ret = bdrv_create(drv, filename, protocol_opts, errp);
+out:
+    qemu_opts_del(protocol_opts);
+    qobject_unref(qdict);
+    return ret;
 }
 
 int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
-- 
2.29.2


