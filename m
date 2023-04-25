Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141D06EE2B5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:19:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIYP-0000XK-36; Tue, 25 Apr 2023 09:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVN-0006l3-Fv
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006bn-7n
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5saFqpyHhnk4jLXIg5Xk9qB/2nICv9QvVbxh3P0Vy3E=;
 b=bxPy3ZXVlSmryuwmXKJ2izqS40YbIx6DDI1ty8Ttjre4tEH3Mi9K8dlh3FTbcre29lj21I
 nfGkR+Qpq8FEY6QZrQxWXOq8x3W2nrai9geg/gHES3fJDQjugNi9WUX0WXpj2B8KzfCEZ5
 9zvG60Eoitcz4TIuyrvYcikcwZcIZNI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-s5uXk66ZMjmuVfQUauv2IA-1; Tue, 25 Apr 2023 09:14:22 -0400
X-MC-Unique: s5uXk66ZMjmuVfQUauv2IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72FDC3C10221;
 Tue, 25 Apr 2023 13:14:21 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B852F40C2064;
 Tue, 25 Apr 2023 13:14:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 18/25] mirror: make mirror_flush a coroutine_fn,
 do not use co_wrappers
Date: Tue, 25 Apr 2023 15:13:52 +0200
Message-Id: <20230425131359.259007-19-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

mirror_flush calls a mixed function blk_flush but it is only called
from mirror_run; so call the coroutine version and make mirror_flush
a coroutine_fn too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230309084456.304669-4-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 663e2b7002..af9bbd23d4 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -886,9 +886,9 @@ static int coroutine_fn mirror_dirty_init(MirrorBlockJob *s)
 /* Called when going out of the streaming phase to flush the bulk of the
  * data to the medium, or just before completing.
  */
-static int mirror_flush(MirrorBlockJob *s)
+static int coroutine_fn mirror_flush(MirrorBlockJob *s)
 {
-    int ret = blk_flush(s->target);
+    int ret = blk_co_flush(s->target);
     if (ret < 0) {
         if (mirror_error_action(s, false, -ret) == BLOCK_ERROR_ACTION_REPORT) {
             s->ret = ret;
-- 
2.40.0


