Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142DB48EB59
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:14:19 +0100 (CET)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NLO-0006QY-5j
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:14:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0c-0003D6-48
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0a-0000MQ-Lc
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3tJhglUcJz48pyYktcgRGFCerCkrIo+T9WluYYSZ1c=;
 b=UjQuw6OisPP25S6jO5efjWmvP6HiZsqRZBiRfHt8tRmC9bQIW2xIcMTI2E1/6yOHAQLOnE
 ru/0v5I3zZh8HzjXM36uQuM2McHfQmVpWoEo5wJiRmohj62aEAl994xMJGUEdtDd+Ij6xk
 INgsPfYAVuTI4Pr5ZLDQXqqhVaHOax4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-t73sNy0iPsC3WVzg4YrFfQ-1; Fri, 14 Jan 2022 08:52:46 -0500
X-MC-Unique: t73sNy0iPsC3WVzg4YrFfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77DC91023F51;
 Fri, 14 Jan 2022 13:52:45 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7008A105B20E;
 Fri, 14 Jan 2022 13:52:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/16] vvfat: Fix size of temporary qcow file
Date: Fri, 14 Jan 2022 14:52:21 +0100
Message-Id: <20220114135226.185407-12-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The size of the qcow size was calculated so that only the FAT partition
would fit on it, but not the whole disk. However, offsets relative to
the whole disk are used to access it, so increase its size to be large
enough for that.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211209151815.23495-1-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 5dacc6cfac..36e73d4c64 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1230,6 +1230,7 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
                  dirname, cyls, heads, secs));
 
     s->sector_count = cyls * heads * secs - s->offset_to_bootsector;
+    bs->total_sectors = cyls * heads * secs;
 
     if (qemu_opt_get_bool(opts, "rw", false)) {
         if (!bdrv_is_read_only(bs)) {
@@ -1250,8 +1251,6 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
-    bs->total_sectors = cyls * heads * secs;
-
     if (init_directories(s, dirname, heads, secs, errp)) {
         ret = -EIO;
         goto fail;
@@ -3147,8 +3146,8 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     }
 
     opts = qemu_opts_create(bdrv_qcow->create_opts, NULL, 0, &error_abort);
-    qemu_opt_set_number(opts, BLOCK_OPT_SIZE, s->sector_count * 512,
-                        &error_abort);
+    qemu_opt_set_number(opts, BLOCK_OPT_SIZE,
+                        bs->total_sectors * BDRV_SECTOR_SIZE, &error_abort);
     qemu_opt_set(opts, BLOCK_OPT_BACKING_FILE, "fat:", &error_abort);
 
     ret = bdrv_create(bdrv_qcow, s->qcow_filename, opts, errp);
-- 
2.31.1


