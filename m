Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D781825F93F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:23:09 +0200 (CEST)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFEq-0001iD-Pz
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2u-0003XC-Hx
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57729
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2n-000881-RT
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwYuyrCrAx/PDOqYEa2yXtvfWBMReT4sAV+avMPUkP4=;
 b=gpPcbijg6fiEoH3rdE4Ls3dsut8s/lIHHAf5E8o00J77zn+mLNA6LlL0Et46kMOLRjLpwx
 24NPuxATsoJ/enuYWpwnOmwBdJPoi/mp65d0MKe83ihdAhsQoaxTeIDTjd8GyYIp65NGS1
 VusMhZ5R2dU1XsAf3kq9VfKAtsR9qTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-cC0ZVHdTOxCNpEuiNXJBDw-1; Mon, 07 Sep 2020 07:10:28 -0400
X-MC-Unique: cC0ZVHdTOxCNpEuiNXJBDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C880E1084C95;
 Mon,  7 Sep 2020 11:10:27 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D675C9CBA;
 Mon,  7 Sep 2020 11:10:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 33/64] vmdk: Drop vmdk_co_flush()
Date: Mon,  7 Sep 2020 13:09:05 +0200
Message-Id: <20200907110936.261684-34-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 02:54:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Max Reitz <mreitz@redhat.com>

Before HEAD^, we needed this because bdrv_co_flush() by itself would
only flush bs->file.  With HEAD^, bdrv_co_flush() will flush all
children on which a WRITE or WRITE_UNCHANGED permission has been taken.
Thus, vmdk no longer needs to do it itself.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index d90855446a..8ec62c7ab7 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2803,21 +2803,6 @@ static void vmdk_close(BlockDriverState *bs)
     error_free(s->migration_blocker);
 }
 
-static coroutine_fn int vmdk_co_flush(BlockDriverState *bs)
-{
-    BDRVVmdkState *s = bs->opaque;
-    int i, err;
-    int ret = 0;
-
-    for (i = 0; i < s->num_extents; i++) {
-        err = bdrv_co_flush(s->extents[i].file->bs);
-        if (err < 0) {
-            ret = err;
-        }
-    }
-    return ret;
-}
-
 static int64_t vmdk_get_allocated_file_size(BlockDriverState *bs)
 {
     int i;
@@ -3081,7 +3066,6 @@ static BlockDriver bdrv_vmdk = {
     .bdrv_close                   = vmdk_close,
     .bdrv_co_create_opts          = vmdk_co_create_opts,
     .bdrv_co_create               = vmdk_co_create,
-    .bdrv_co_flush_to_disk        = vmdk_co_flush,
     .bdrv_co_block_status         = vmdk_co_block_status,
     .bdrv_get_allocated_file_size = vmdk_get_allocated_file_size,
     .bdrv_has_zero_init           = vmdk_has_zero_init,
-- 
2.25.4


