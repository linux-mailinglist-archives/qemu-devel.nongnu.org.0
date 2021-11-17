Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CB454B2D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:39:25 +0100 (CET)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNy0-0005U1-Nq
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:39:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtE-0003MP-I8
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNt8-00088Q-36
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ap4sEt8ZfSx0lqgzCPOkQ2QMH0aRdFl0dLpn6iICdz8=;
 b=CAdZWEpBY6DMjSgLT9jOWxvfa8b1OK5iSg3t/xjyu7BTiuQWx0Eup1dYin3+CLQyCetjts
 QwbwF3NQjTb5054SArkkU2/2fraI2WfxSGghZfhG/KdqmMSRN+iL9yOjAlkG0oKpJQ13bM
 lUDwwoUizX9CelkutNUuwXw82NdPVvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-hAy4kiBhM86c6P6KrywAFA-1; Wed, 17 Nov 2021 11:34:19 -0500
X-MC-Unique: hAy4kiBhM86c6P6KrywAFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C99D10168C7;
 Wed, 17 Nov 2021 16:34:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0EA260BF1;
 Wed, 17 Nov 2021 16:34:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A1F0811329AF; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/13] blockdev: Drop unused drive_get_next()
Date: Wed, 17 Nov 2021 17:34:09 +0100
Message-Id: <20211117163409.3587705-14-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

The previous commits eliminated all uses.  Drop the function.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/sysemu/blockdev.h |  1 -
 blockdev.c                | 10 ----------
 2 files changed, 11 deletions(-)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 32c2d6023c..a750f99b79 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -50,7 +50,6 @@ void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
 int drive_get_max_devs(BlockInterfaceType type);
-DriveInfo *drive_get_next(BlockInterfaceType type);
 
 QemuOpts *drive_def(const char *optstr);
 QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
diff --git a/blockdev.c b/blockdev.c
index b35072644e..0eb2823b1b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -303,16 +303,6 @@ int drive_get_max_bus(BlockInterfaceType type)
     return max_bus;
 }
 
-/* Get a block device.  This should only be used for single-drive devices
-   (e.g. SD/Floppy/MTD).  Multi-disk devices (scsi/ide) should use the
-   appropriate bus.  */
-DriveInfo *drive_get_next(BlockInterfaceType type)
-{
-    static int next_block_unit[IF_COUNT];
-
-    return drive_get(type, 0, next_block_unit[type]++);
-}
-
 static void bdrv_format_print(void *opaque, const char *name)
 {
     qemu_printf(" %s", name);
-- 
2.31.1


