Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C432F0A6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:05:35 +0100 (CET)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDtO-0000Dj-KT
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkJ-0006x5-DF
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk5-0007D4-D5
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8cF/Y9bJGN1pFXWJcC+07N6YgIYnq/uce0/xddGQWY=;
 b=b7iV/BP25K0YDpksq0ZLn2rsMWsceyxwYr440S6KqHnYHNXpJ7gKOTBoQZkxoRuYYberKL
 729DE/jQx9jVA08HhqJlfJibs0syKBIqPvQJprlFqzaZykwf5UH3aYReMh9V+j2Ty9BmuZ
 kIPLC4MQXicQj4G0gzjF7vmZuBJAUn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-xdhXLvHRMQqUuf4vtqXwVg-1; Fri, 05 Mar 2021 11:55:52 -0500
X-MC-Unique: xdhXLvHRMQqUuf4vtqXwVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF87F100A44A;
 Fri,  5 Mar 2021 16:55:09 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E36D960BF3;
 Fri,  5 Mar 2021 16:55:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/31] backup: Remove nodes from job in .clean()
Date: Fri,  5 Mar 2021 17:54:25 +0100
Message-Id: <20210305165454.356840-3-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Max Reitz <mreitz@redhat.com>

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
Message-Id: <20210219153348.41861-2-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


