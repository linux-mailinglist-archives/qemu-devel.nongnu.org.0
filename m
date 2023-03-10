Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0206B4FAA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:57:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagzL-00065R-Ue; Fri, 10 Mar 2023 12:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pagzH-0005zy-DG
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pagzF-000393-Vc
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678471017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=81SVzWAlEv6BdKgmRvXHoevU8kfRl8j1VMv25IEirA4=;
 b=gQXqsZZ3ONVDCeqV3jr+VVkIBo2fl3iTJiyhu2CYegzpYSWtT8OndCukcMhgJyPivMK+i2
 1Sf5xRZyLfrIRXJfLO4vq3sq5Mf2KFEIWpIkZu8q+QVbfRQwVtfNiAuwx95KtSefUM45y8
 5oFH33jtLWlBPVN1lvu5mShYJvllddE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-5xyNvsv8P4Ka919fgqr9sw-1; Fri, 10 Mar 2023 12:55:53 -0500
X-MC-Unique: 5xyNvsv8P4Ka919fgqr9sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7990185CBE0;
 Fri, 10 Mar 2023 17:55:35 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C64F41121318;
 Fri, 10 Mar 2023 17:55:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 3/3] qed: remove spurious BDRV_POLL_WHILE()
Date: Fri, 10 Mar 2023 18:55:29 +0100
Message-Id: <20230310175529.240379-4-kwolf@redhat.com>
In-Reply-To: <20230310175529.240379-1-kwolf@redhat.com>
References: <20230310175529.240379-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Hajnoczi <stefanha@redhat.com>

This looks like a copy-paste or merge error. BDRV_POLL_WHILE() is
already called above. It's not needed in the qemu_in_coroutine() case.

Fixes: 9fb4dfc570ce ("qed: make bdrv_qed_do_open a coroutine_fn")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230309163134.398707-1-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/qed.c b/block/qed.c
index ed94bb61ca..0705a7b4e2 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -594,7 +594,6 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
         qemu_coroutine_enter(qemu_coroutine_create(bdrv_qed_open_entry, &qoc));
         BDRV_POLL_WHILE(bs, qoc.ret == -EINPROGRESS);
     }
-    BDRV_POLL_WHILE(bs, qoc.ret == -EINPROGRESS);
     return qoc.ret;
 }
 
-- 
2.39.2


