Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1996EE2C7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:20:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIXe-0000RG-Rs; Tue, 25 Apr 2023 09:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVK-0006fu-FA
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006cP-6G
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuQuf0oyAdKgbihbApNW080nlqs2h3IQDaIqmyz0AF8=;
 b=TukFV7MZ6ObycZxL//J2+K6Wixe8CvspX2Qu2VJhic+1z2ZowAN4/wSVHEJ3xeqvKslK6n
 y1zvPCqc880SDTHj4EMNtPIO9xLSJ0os80ptuZziYOHCjbdLYIXNZtsuQWREIxDNttggyx
 xSTRknYh1i8vRrkiYuZJKnTd6eu2qVU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-T0szTnGIO2qRga-yS0R_qQ-1; Tue, 25 Apr 2023 09:14:23 -0400
X-MC-Unique: T0szTnGIO2qRga-yS0R_qQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56B57101A553;
 Tue, 25 Apr 2023 13:14:23 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E20D40C2064;
 Tue, 25 Apr 2023 13:14:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 20/25] 9pfs: mark more coroutine_fns
Date: Tue, 25 Apr 2023 15:13:54 +0200
Message-Id: <20230425131359.259007-21-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230309084456.304669-6-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/9pfs/9p.h    | 4 ++--
 hw/9pfs/codir.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 2fce4140d1..1b0d805b9c 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -203,7 +203,7 @@ typedef struct V9fsDir {
     QemuMutex readdir_mutex_L;
 } V9fsDir;
 
-static inline void v9fs_readdir_lock(V9fsDir *dir)
+static inline void coroutine_fn v9fs_readdir_lock(V9fsDir *dir)
 {
     if (dir->proto_version == V9FS_PROTO_2000U) {
         qemu_co_mutex_lock(&dir->readdir_mutex_u);
@@ -212,7 +212,7 @@ static inline void v9fs_readdir_lock(V9fsDir *dir)
     }
 }
 
-static inline void v9fs_readdir_unlock(V9fsDir *dir)
+static inline void coroutine_fn v9fs_readdir_unlock(V9fsDir *dir)
 {
     if (dir->proto_version == V9FS_PROTO_2000U) {
         qemu_co_mutex_unlock(&dir->readdir_mutex_u);
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 7ba63be489..2068a4779d 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -68,9 +68,9 @@ int coroutine_fn v9fs_co_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
  *
  * See v9fs_co_readdir_many() (as its only user) below for details.
  */
-static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
-                           struct V9fsDirEnt **entries, off_t offset,
-                           int32_t maxsize, bool dostat)
+static int coroutine_fn
+do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp, struct V9fsDirEnt **entries,
+                off_t offset, int32_t maxsize, bool dostat)
 {
     V9fsState *s = pdu->s;
     V9fsString name;
-- 
2.40.0


