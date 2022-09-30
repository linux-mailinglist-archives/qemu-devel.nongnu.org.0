Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965455F1093
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:13:47 +0200 (CEST)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJa6-00085W-Lo
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFn-0006Za-8h
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFl-0006eS-Cf
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqljPmUOKueZK3Cr8AphX18L5RtWxTtUbyDTPhe366c=;
 b=jRZN2rgq/G4RJ4tX1SxLqN+QIrc/ON4Nas6CVeE+qg0GXAFpNXhluHD3cvAAgU3x3hCoyu
 ExVcz7vmftQ+CDgVpAz8ak/rvFOX1mD8Ttk9In4QStbI2hJ+l9NMre3aewpCkOlj+NIgl3
 C0mkvjDeULI1feZIyLYpihGogmXqag4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-ADy3QUiNPwa1E7OdLM7W1Q-1; Fri, 30 Sep 2022 12:52:43 -0400
X-MC-Unique: ADy3QUiNPwa1E7OdLM7W1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E241F882822;
 Fri, 30 Sep 2022 16:52:42 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E38017582;
 Fri, 30 Sep 2022 16:52:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 09/18] block/qcow2: Keep auto_backing_file if possible
Date: Fri, 30 Sep 2022 18:52:13 +0200
Message-Id: <20220930165222.249716-10-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

From: Hanna Reitz <hreitz@redhat.com>

qcow2_do_open() is used by qcow2_co_invalidate_cache(), i.e. may be run
on an image that has been opened before.  When reading the backing file
string from the image header, compare it against the existing
bs->backing_file, and update bs->auto_backing_file only if they differ.

auto_backing_file should ideally contain the filename the backing BDS
will actually have after opening, i.e. a post-bdrv_refresh_filename()
version of what is in the image header.  So for example, if the image
header reports the following backing file string:

    json:{"driver": "qcow2", "file": {
        "driver": "file", "filename": "/tmp/backing.qcow2"
    }}

Then auto_backing_file should contain simply "/tmp/backing.qcow2".

Because bdrv_refresh_filename() only works on existing BDSs, though, the
way how we get this auto_backing_file value is to have the format driver
set it to whatever is in the image header, and when the backing BDS is
opened based on that, we update it with the filename the backing BDS
actually got.

However, qcow2's qcow2_co_invalidate_cache() implementation breaks this
because it just resets auto_backing_file to whatever is in the image
file without opening a BDS based on it, so we never get
auto_backing_file back to the "refreshed" version, and in the example
above, it would stay "json:{...}".

Then, bs->backing->bs->filename will differ from bs->auto_backing_file,
making bdrv_backing_overridden(bs) return true, which will lead
bdrv_refresh_filename(bs) to generate a json:{} filename for bs, even
though that may not have been necessary.  This is reported in the issue
linked below.

Therefore, skip updating auto_backing_file if nothing has changed in the
image header since we last read it.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1117
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220803144446.20723-2-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index c8fc3a6160..6c8c8b2b5a 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1697,16 +1697,27 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
             ret = -EINVAL;
             goto fail;
         }
+
+        s->image_backing_file = g_malloc(len + 1);
         ret = bdrv_pread(bs->file, header.backing_file_offset, len,
-                         bs->auto_backing_file, 0);
+                         s->image_backing_file, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read backing file name");
             goto fail;
         }
-        bs->auto_backing_file[len] = '\0';
-        pstrcpy(bs->backing_file, sizeof(bs->backing_file),
-                bs->auto_backing_file);
-        s->image_backing_file = g_strdup(bs->auto_backing_file);
+        s->image_backing_file[len] = '\0';
+
+        /*
+         * Update only when something has changed.  This function is called by
+         * qcow2_co_invalidate_cache(), and we do not want to reset
+         * auto_backing_file unless necessary.
+         */
+        if (!g_str_equal(s->image_backing_file, bs->backing_file)) {
+            pstrcpy(bs->backing_file, sizeof(bs->backing_file),
+                    s->image_backing_file);
+            pstrcpy(bs->auto_backing_file, sizeof(bs->auto_backing_file),
+                    s->image_backing_file);
+        }
     }
 
     /*
-- 
2.37.3


