Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAD237BD89
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:58:21 +0200 (CEST)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgoRQ-0000gR-Q7
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgoPM-0006No-Eb
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgoPK-0004Vd-KN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620824170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WckbXumWYqg+9D7Wb38z2FS+cEW+R++zDZxT5sTGkA=;
 b=OBbQHGXGUPD1Q2VCDaUAPBYg/VeAvbNgCKh+3Xawly3WetJVrF73EFnsecIb5D/sTY4/hR
 nfkNdglb/aodybeA/xx4OxEbslRrnORIL6uEyMSFxUkavkstmKMtWt9xKjl4zbDs3OBEJ+
 3yRktljJaE51QFtJ86SjBMq1MQ6xIJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-DB9WwAKNMG-hb7gQzS5uwA-1; Wed, 12 May 2021 08:56:08 -0400
X-MC-Unique: DB9WwAKNMG-hb7gQzS5uwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F9B110082E0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:56:07 +0000 (UTC)
Received: from localhost (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E3B31E6;
 Wed, 12 May 2021 12:56:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] virtiofs_submounts.py: Check `find`
Date: Wed, 12 May 2021 14:55:44 +0200
Message-Id: <20210512125544.9536-4-mreitz@redhat.com>
In-Reply-To: <20210512125544.9536-1-mreitz@redhat.com>
References: <20210512125544.9536-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The guest test script contained a lengthy section on why we cannot just
run `find` to auto-mount all submounts.  With HEAD^^, that should work
now, so replace it and the recursively_visit() function by a lengthy
section explaining the history, and a `find`.

(Also really check that `find` will not complain about anything.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 .../virtiofs_submounts.py.data/guest.sh       | 56 +++++++------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/tests/acceptance/virtiofs_submounts.py.data/guest.sh b/tests/acceptance/virtiofs_submounts.py.data/guest.sh
index 59ba40fde1..a3e9dc02f2 100644
--- a/tests/acceptance/virtiofs_submounts.py.data/guest.sh
+++ b/tests/acceptance/virtiofs_submounts.py.data/guest.sh
@@ -19,41 +19,27 @@ fi
 
 cd "$shared_dir"
 
-# FIXME: This should not be necessary, but it is.  In order for all
-# submounts to be proper mount points, we need to visit them.
-# (Before we visit them, they will not be auto-mounted, and so just
-# appear as normal directories, with the catch that their st_ino will
-# be the st_ino of the filesystem they host, while the st_dev will
-# still be the st_dev of the parent.)
-# `find` does not work, because it will refuse to touch the mount
-# points as long as they are not mounted; their st_dev being shared
-# with the parent and st_ino just being the root node's inode ID
-# will practically ensure that this node exists elsewhere on the
-# filesystem, and `find` is required to recognize loops and not to
-# follow them.
-# Thus, we have to manually visit all nodes first.
-
-mnt_i=0
-
-function recursively_visit()
-{
-    pushd "$1" >/dev/null
-    for entry in *; do
-        if [[ "$entry" == mnt* ]]; then
-            mnt_i=$((mnt_i + 1))
-            printf "Triggering auto-mount $mnt_i...\r"
-        fi
-
-        if [ -d "$entry" ]; then
-            recursively_visit "$entry"
-        fi
-    done
-    popd >/dev/null
-}
-
-recursively_visit .
-echo
-
+# See whether `find` complains about anything, like file system loops,
+# by looking for a file that does not exist (so the output should be
+# empty).
+# (Historically, for mount points, virtiofsd reported only the inode ID
+# in submount, i.e. the submount root's inode ID.  However, while the
+# submount is not yet auto-mounted in the guest, it would have the
+# parent's device ID, and so would have the same st_dev/st_ino
+# combination as the parent filesystem's root.  This would lead to
+# `find` reporting file system loops.
+# This has been fixed so that virtiofsd reports the mount point node's
+# inode ID in the parent filesystem, and when the guest auto-mounts the
+# submount, it will only then see the inode ID in that FS.)
+#
+# As a side-effect, this `find` auto-mounts all submounts by visiting
+# the whole tree.
+find_output=$(find -name there-is-no-such-file 2>&1)
+if [ -n "$find_output" ]; then
+    echo "Error: find has reported errors or warnings:" >&2
+    echo "$find_output" >&2
+    exit 1
+fi
 
 if [ -n "$(find -name not-mounted)" ]; then
     echo "Error: not-mounted files visible on mount points:" >&2
-- 
2.31.1


