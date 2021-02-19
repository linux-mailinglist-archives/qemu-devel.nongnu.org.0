Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F1C31FC6D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:54:22 +0100 (CET)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD86n-0001Xc-4v
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lD7n6-0000JR-KT
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:34:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lD7n3-0005xM-Oe
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613748835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhyplz4z2JTDluTugxtAWQyUQxGVhu1tswFD6jY9vXQ=;
 b=OV3ZU8pyCd4X1onrQXrpFDcY05FWLvR8DPx1aAZmL8g5ClDGbjXbxzgBSwLwMB4RX6e5OI
 ZD8suWJx/xWTCBWi9zqK7/Xegc5a3tDWObcrlbBTdcnbhIH8bbeQTW4VTxXLsBCuV0fyAI
 +AjlGggMVc4RMN7fMWIyDjUbBiEG3ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-vdtayVPWOgmyygdkKmQErw-1; Fri, 19 Feb 2021 10:33:54 -0500
X-MC-Unique: vdtayVPWOgmyygdkKmQErw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBDD5C73AE;
 Fri, 19 Feb 2021 15:33:52 +0000 (UTC)
Received: from localhost (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 555A41970D;
 Fri, 19 Feb 2021 15:33:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/3] backup: Remove nodes from job in .clean()
Date: Fri, 19 Feb 2021 16:33:46 +0100
Message-Id: <20210219153348.41861-2-mreitz@redhat.com>
In-Reply-To: <20210219153348.41861-1-mreitz@redhat.com>
References: <20210219153348.41861-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The block job holds a reference to the backup-top node (because it is
passed as the main job BDS to block_job_create()).  Therefore,
bdrv_backup_top_drop() cannot delete the backup-top node (replacing it
by its child does not affect the job parent, because that has
.stay_at_node set).  That is a problem, because all of its I/O functions
assume the BlockCopyState (s->bcs) to be valid and that it has a
filtered child; but after bdrv_backup_top_drop(), neither of those
things are true.

It does not make sense to add new parents to backup-top after
backup_clean(), so we should detach it from the job before
bdrv_backup_top_drop().  Because there is no function to do that for a
single node, just detach all of the job's nodes -- the job does not do
anything past backup_clean() anyway.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/backup.c b/block/backup.c
index 94e6dcd72e..6cf2f974aa 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -103,6 +103,7 @@ static void backup_abort(Job *job)
 static void backup_clean(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
+    block_job_remove_all_bdrv(&s->common);
     bdrv_backup_top_drop(s->backup_top);
 }
 
-- 
2.29.2


