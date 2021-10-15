Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7742F665
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:56:49 +0200 (CEST)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOdb-0004xR-EB
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVx-0000Kr-3b
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVv-0001pr-Go
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/rEuvk5XjItLkkvQpvWyj0IkInHGAJcQpBgdMoiJY0=;
 b=OsCYGA0+JE02GVwU4rSyrnF1YlgY4ZxXANBKUwQmfZLKSX7lt1n/JkXZFTx2YdnoA4z4wH
 u+AD/K1HxntDRsYYoEV9Bb+begPSvfPSgdn8tsrpMViv3d1kQ/+9bBZS6bU+ineCUqLfR/
 r8G73Fbe0bmSS8dBy95KInPC9/lOldM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-mmcwlkZ-PUe0QZBnyLAwZg-1; Fri, 15 Oct 2021 10:48:49 -0400
X-MC-Unique: mmcwlkZ-PUe0QZBnyLAwZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00B86DF8A6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:49 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59A9719736;
 Fri, 15 Oct 2021 14:48:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] qemu-option: Allow deleting opts during
 qemu_opts_foreach()
Date: Fri, 15 Oct 2021 16:46:35 +0200
Message-Id: <20211015144640.198044-11-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use QTAILQ_FOREACH_SAFE() so that the current QemuOpts can be deleted
while iterating through the whole list.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211008133442.141332-11-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/qemu-option.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 61cb4a97bd..eedd08929b 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -1126,11 +1126,11 @@ int qemu_opts_foreach(QemuOptsList *list, qemu_opts_loopfunc func,
                       void *opaque, Error **errp)
 {
     Location loc;
-    QemuOpts *opts;
+    QemuOpts *opts, *next;
     int rc = 0;
 
     loc_push_none(&loc);
-    QTAILQ_FOREACH(opts, &list->head, next) {
+    QTAILQ_FOREACH_SAFE(opts, &list->head, next, next) {
         loc_restore(&opts->loc);
         rc = func(opaque, opts, errp);
         if (rc) {
-- 
2.31.1


