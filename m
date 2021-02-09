Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1EC3156BF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:28:54 +0100 (CET)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ygv-0000Ug-5M
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKU-0003aw-M8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKS-0002Ht-Hj
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCd5VPaweV0QnK2JlRUPl/yoUKg+WTPaXC8x4ej1Qts=;
 b=dO/F4S0/hNIWornNoAd/CmunlGf4OS6zhY7hD2DJZvdsvxz/1h8APT4My06sa/1YArx7E9
 XByTRD0LTCJRnOJCOWxHNLVad7a/+VVtX1d08tqfUhFt2Cq079dy5OtFf3jhCbY5TXTeJq
 6XJxAczjojG2IuRqTdk1OOVbcORukzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-f5merSrRMaiYB1Cp02WNQA-1; Tue, 09 Feb 2021 14:05:37 -0500
X-MC-Unique: f5merSrRMaiYB1Cp02WNQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D9D3192AB78
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:05:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5EF860C04;
 Tue,  9 Feb 2021 19:05:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 15/24] DAX: virtiofsd: Perform an unmap on destroy
Date: Tue,  9 Feb 2021 19:02:15 +0000
Message-Id: <20210209190224.62827-16-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Force unmap all remaining dax cache entries on a destroy.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index badac23fef..21ddb434ae 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2947,6 +2947,17 @@ static void lo_destroy(void *userdata, struct fuse_session *se)
 {
     struct lo_data *lo = (struct lo_data *)userdata;
 
+    if (fuse_lowlevel_is_virtio(se)) {
+        VhostUserFSSlaveMsg msg = { 0 };
+
+        msg.len[0] = ~(uint64_t)0; /* Special: means 'all' */
+        msg.c_offset[0] = 0;
+        if (fuse_virtio_unmap(se, &msg)) {
+            fuse_log(FUSE_LOG_ERR, "%s: unmap during destroy failed\n",
+                     __func__);
+        }
+    }
+
     pthread_mutex_lock(&lo->mutex);
     while (true) {
         GHashTableIter iter;
-- 
2.29.2


