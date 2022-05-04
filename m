Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDCE51A23E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:32:59 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG3m-0002Kt-Ut
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwk-0000tq-Un
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwi-0007HA-9U
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E7xwsxesBQ+3VuWv6RvchuwUM5KU8fumXkBFuXRjQwk=;
 b=L0QHtM7C8IG8C+TcTTVhJr9KilNS6wzCqSDgoe/VhTOvZFQOSB1Kf38TGOhvn0765rw78Q
 zr9Cyk+85c/NsKmgPFp55Jr4oNhqEubPF6n+ciXI/AWL6u4T4MVU0wVVgfUVBkhUSjFnL8
 xWu8nUtlOGCKZFnzkConREl1ReOsh28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-Zdq_0Z4nMwuYJryLv9mhmA-1; Wed, 04 May 2022 10:25:36 -0400
X-MC-Unique: Zdq_0Z4nMwuYJryLv9mhmA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A6C88039D7;
 Wed,  4 May 2022 14:25:36 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF625402189;
 Wed,  4 May 2022 14:25:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 09/13] block/vmdk: Fix reopening bs->file
Date: Wed,  4 May 2022 16:25:18 +0200
Message-Id: <20220504142522.167506-10-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

VMDK disk data is stored in extents, which may or may not be separate
from bs->file.  VmdkExtent.file points to where they are stored.  Each
that is stored in bs->file will simply reuse the exact pointer value of
bs->file.

(That is why vmdk_free_extents() will unref VmdkExtent.file (e->file)
only if e->file != bs->file.)

Reopen operations can change bs->file (they will replace the whole
BdrvChild object, not just the BDS stored in that BdrvChild), and then
we will need to change all .file pointers of all such VmdkExtents to
point to the new BdrvChild.

In vmdk_reopen_prepare(), we have to check which VmdkExtents are
affected, and in vmdk_reopen_commit(), we can modify them.  We have to
split this because:
- The new BdrvChild is created only after prepare, so we can change
  VmdkExtent.file only in commit
- In commit, there no longer is any (valid) reference to the old
  BdrvChild object, so there would be nothing to compare VmdkExtent.file
  against to see whether it was equal to bs->file before reopening
  (There is BDRVReopenState.old_file_bs, but the old bs->file
  BdrvChild's .bs pointer will be NULL-ed when the new BdrvChild is
  created, and so we cannot compare VmdkExtent.file->bs against
  BDRVReopenState.old_file_bs)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220314162719.65384-2-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 37c0946066..38e5ab3806 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -178,6 +178,10 @@ typedef struct BDRVVmdkState {
     char *create_type;
 } BDRVVmdkState;
 
+typedef struct BDRVVmdkReopenState {
+    bool *extents_using_bs_file;
+} BDRVVmdkReopenState;
+
 typedef struct VmdkMetaData {
     unsigned int l1_index;
     unsigned int l2_index;
@@ -400,15 +404,63 @@ static int vmdk_is_cid_valid(BlockDriverState *bs)
     return 1;
 }
 
-/* We have nothing to do for VMDK reopen, stubs just return success */
 static int vmdk_reopen_prepare(BDRVReopenState *state,
                                BlockReopenQueue *queue, Error **errp)
 {
+    BDRVVmdkState *s;
+    BDRVVmdkReopenState *rs;
+    int i;
+
     assert(state != NULL);
     assert(state->bs != NULL);
+    assert(state->opaque == NULL);
+
+    s = state->bs->opaque;
+
+    rs = g_new0(BDRVVmdkReopenState, 1);
+    state->opaque = rs;
+
+    /*
+     * Check whether there are any extents stored in bs->file; if bs->file
+     * changes, we will need to update their .file pointers to follow suit
+     */
+    rs->extents_using_bs_file = g_new(bool, s->num_extents);
+    for (i = 0; i < s->num_extents; i++) {
+        rs->extents_using_bs_file[i] = s->extents[i].file == state->bs->file;
+    }
+
     return 0;
 }
 
+static void vmdk_reopen_clean(BDRVReopenState *state)
+{
+    BDRVVmdkReopenState *rs = state->opaque;
+
+    g_free(rs->extents_using_bs_file);
+    g_free(rs);
+    state->opaque = NULL;
+}
+
+static void vmdk_reopen_commit(BDRVReopenState *state)
+{
+    BDRVVmdkState *s = state->bs->opaque;
+    BDRVVmdkReopenState *rs = state->opaque;
+    int i;
+
+    for (i = 0; i < s->num_extents; i++) {
+        if (rs->extents_using_bs_file[i]) {
+            s->extents[i].file = state->bs->file;
+        }
+    }
+
+    vmdk_reopen_clean(state);
+}
+
+static void vmdk_reopen_abort(BDRVReopenState *state)
+{
+    vmdk_reopen_clean(state);
+}
+
 static int vmdk_parent_open(BlockDriverState *bs)
 {
     char *p_name;
@@ -3072,6 +3124,8 @@ static BlockDriver bdrv_vmdk = {
     .bdrv_open                    = vmdk_open,
     .bdrv_co_check                = vmdk_co_check,
     .bdrv_reopen_prepare          = vmdk_reopen_prepare,
+    .bdrv_reopen_commit           = vmdk_reopen_commit,
+    .bdrv_reopen_abort            = vmdk_reopen_abort,
     .bdrv_child_perm              = bdrv_default_perms,
     .bdrv_co_preadv               = vmdk_co_preadv,
     .bdrv_co_pwritev              = vmdk_co_pwritev,
-- 
2.35.1


