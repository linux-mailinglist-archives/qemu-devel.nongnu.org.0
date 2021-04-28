Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C3036D657
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:17:34 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiCD-0005T2-8w
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxH-0006c0-DC
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxE-00059t-1r
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52sJo4zGbTiWFJ96lEj14we1NkkFAPEqKSP8AvKcADo=;
 b=L75c+H1xzDrI3+ukqztBRXwJMBogLWmOJkGLtuWl8M1Nub6Aww1XxFltkyGo80iuML8Nn0
 iCgTklu+tj1BwxkTVCVuL1hdnLoN6LuUmop0G4JmOlfuLGlmW61yp1sCsK4zVXmzXabLZc
 ZC4WULlDQyNBaGYi1ZYQJ5ikEm4QPfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-Vljhfga3OemUna_uNBf8VQ-1; Wed, 28 Apr 2021 07:02:00 -0400
X-MC-Unique: Vljhfga3OemUna_uNBf8VQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6871107ACC7;
 Wed, 28 Apr 2021 11:01:59 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53DF51002D71;
 Wed, 28 Apr 2021 11:01:58 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 17/26] DAX: virtiofsd: Perform an unmap on destroy
Date: Wed, 28 Apr 2021 12:00:51 +0100
Message-Id: <20210428110100.27757-18-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Force unmap all remaining dax cache entries on a destroy.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index ed5b6c9e2d..600e102839 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3129,6 +3129,20 @@ static void lo_destroy(void *userdata, struct fuse_session *se)
 {
     struct lo_data *lo = (struct lo_data *)userdata;
 
+    if (fuse_lowlevel_is_virtio(se)) {
+        VhostUserFSSlaveMsg *msg = g_malloc0(sizeof(VhostUserFSSlaveMsg) +
+                                             sizeof(VhostUserFSSlaveMsgEntry));
+
+        msg->count = 0;
+        msg->entries[0].len = ~(uint64_t)0; /* Special: means 'all' */
+        msg->entries[0].c_offset = 0;
+        if (fuse_virtio_unmap(se, msg)) {
+            fuse_log(FUSE_LOG_ERR, "%s: unmap during destroy failed\n",
+                     __func__);
+        }
+        g_free(msg);
+    }
+
     pthread_mutex_lock(&lo->mutex);
     while (true) {
         GHashTableIter iter;
-- 
2.31.1


