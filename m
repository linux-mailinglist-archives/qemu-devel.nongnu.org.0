Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD372D439D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:57:11 +0100 (CET)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmzxu-0008Pd-GK
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmzv7-0006lG-8G
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:54:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kmzv5-0000Kd-Kp
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 08:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607522054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTBlu82JM07TJK0WUoOslvbjwE7Y4wK55SOnPYWc4sc=;
 b=Rtt40Zg/ZDhl/Pubu5BH17W1P2nSj0TfjzUVJT8NjMFhMiC98e4QBdUGyiOmmIF/wca4YH
 rSStlb8H0OioBVb677EnzS+H+vfAkDXT9X5PPzFlWbtj7G83pC8ce0pvm8WmSeYDmx8ET1
 toNmyIHvN+AfzFM4SWLsjvHU+Bd8qZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-tpeZ6fFbNkKC4iu842aSrg-1; Wed, 09 Dec 2020 08:54:12 -0500
X-MC-Unique: tpeZ6fFbNkKC4iu842aSrg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 547CA1005E4A;
 Wed,  9 Dec 2020 13:54:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A0955D6BA;
 Wed,  9 Dec 2020 13:54:07 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] file-posix: add sg_get_max_segments that actually
 works with sg
Date: Wed,  9 Dec 2020 15:53:52 +0200
Message-Id: <20201209135355.561745-3-mlevitsk@redhat.com>
In-Reply-To: <20201209135355.561745-1-mlevitsk@redhat.com>
References: <20201209135355.561745-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Yan <tom.ty89@gmail.com>

sg devices have different major/minor than their corresponding
block devices. Using sysfs to get max segments never really worked
for them.

Fortunately the sg driver provides an ioctl to get sg_tablesize,
which is apparently equivalent to max segments.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/file-posix.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 226ddbbdad..10ebc4c5b7 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1181,6 +1181,26 @@ static int sg_get_max_transfer_length(int fd)
 #endif
 }
 
+static int sg_get_max_segments(int fd)
+{
+    /*
+     * /dev/sg* character devices report 'max_segments' via
+     * SG_GET_SG_TABLESIZE ioctl
+     */
+
+#ifdef SG_GET_SG_TABLESIZE
+    long max_segments = 0;
+
+    if (ioctl(fd, SG_GET_SG_TABLESIZE, &max_segments) == 0) {
+        return max_segments;
+    } else {
+        return -errno;
+    }
+#else
+    return -ENOSYS;
+#endif
+}
+
 static int get_max_transfer_length(int fd)
 {
 #if defined(BLKSECTGET)
@@ -1267,7 +1287,7 @@ static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
         bs->bl.max_transfer = pow2floor(ret);
     }
 
-    ret = get_max_segments(s->fd);
+    ret = bs->sg ? sg_get_max_segments(s->fd) : get_max_segments(s->fd);
     if (ret > 0) {
         bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
                                            ret * qemu_real_host_page_size);
-- 
2.26.2


