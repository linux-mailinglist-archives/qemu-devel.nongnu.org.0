Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D1686A40
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNF1o-0001WV-9p; Wed, 01 Feb 2023 10:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNF1m-0001Vm-Ux
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:28:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pNF1l-00070m-Ce
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 10:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675265280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kd51aFPAvuW0Q9XRXRzTh4Hz980obJ5XCDHSYQ1gNvE=;
 b=WJk60kxqrvSLWCWL6nL36S+IM8VXyJeKOgLRFewPovVjJNY/Kau67q+KzzmU4ktvjdS0xY
 1DxfpJM7rkK12iYAITeMVNOoivVaRXtXwxSbcWP34X04USYdeEldrDl4ktWfBP/9/SZm/8
 lyGzG6bxxs7csgQK9pr7UB4BjS3md9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497--d3f9_-zPvOuDugdrO5t-Q-1; Wed, 01 Feb 2023 10:27:57 -0500
X-MC-Unique: -d3f9_-zPvOuDugdrO5t-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DC7F857A93;
 Wed,  1 Feb 2023 15:27:56 +0000 (UTC)
Received: from localhost (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D190404BEC0;
 Wed,  1 Feb 2023 15:27:55 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 qemu-stable@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 1/4] block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
Date: Wed,  1 Feb 2023 10:27:48 -0500
Message-Id: <20230201152751.270508-2-stefanha@redhat.com>
In-Reply-To: <20230201152751.270508-1-stefanha@redhat.com>
References: <20230201152751.270508-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When a write request is converted into a write zeroes request by the
detect-zeroes= feature, it is no longer associated with an I/O buffer.
The BDRV_REQ_REGISTERED_BUF flag doesn't make sense without an I/O
buffer and must be cleared because bdrv_co_do_pwrite_zeroes() fails with
-EINVAL when it's set.

Fiona Ebner <f.ebner@proxmox.com> bisected and diagnosed this QEMU 7.2
regression where writes containing zeroes to a blockdev with
discard=unmap,detect-zeroes=unmap fail.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1404
Fixes: e8b6535533be ("block: add BDRV_REQ_REGISTERED_BUF request flag")
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/io.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/io.c b/block/io.c
index a09a19f7a7..24a2bc42d3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1926,6 +1926,9 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
         if (bs->detect_zeroes == BLOCKDEV_DETECT_ZEROES_OPTIONS_UNMAP) {
             flags |= BDRV_REQ_MAY_UNMAP;
         }
+
+        /* Can't use optimization hint with bufferless zero write */
+        flags &= ~BDRV_REQ_REGISTERED_BUF;
     }
 
     if (ret < 0) {
-- 
2.39.1


