Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC856EE2CF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:21:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIZ8-0002Xp-80; Tue, 25 Apr 2023 09:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVU-0006rW-5S
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006ce-Vt
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goC0+V3ApTSiKsw11bGVSK/Vwd7KgTol7PUe4lqysLo=;
 b=Tob8pJqzno/796brV3axFVr0TP5FPdO4YGv/K8eHplGjiKjzTx5Y5BXC6JLAwz5glXp2jA
 Jjom7PcOFJ9GtndpGXE419++LkboC5/Tmfpls16pgm4WBGAbsYPqMRpf7AcBH5Bt3YLusH
 DnP33cJ7g9iTFaVmGt9r2EKgMw7vpbY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-FTFTurJIPG6sACkM5UO9pQ-1; Tue, 25 Apr 2023 09:14:27 -0400
X-MC-Unique: FTFTurJIPG6sACkM5UO9pQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 343538828C7;
 Tue, 25 Apr 2023 13:14:27 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A61340C2064;
 Tue, 25 Apr 2023 13:14:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 24/25] vmdk: make vmdk_is_cid_valid a coroutine_fn
Date: Tue, 25 Apr 2023 15:13:58 +0200
Message-Id: <20230425131359.259007-25-kwolf@redhat.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Functions that can do I/O are prime candidates for being coroutine_fns.  Make the
change for the one that is itself called only from coroutine_fns.  Unfortunately
vmdk does not use a coroutine_fn for the bulk of the open (like qcow2 does) so
vmdk_read_cid cannot have the same treatment.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230309084456.304669-10-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index f5f49018fe..3f8c731e32 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -376,7 +376,7 @@ out:
     return ret;
 }
 
-static int vmdk_is_cid_valid(BlockDriverState *bs)
+static int coroutine_fn vmdk_is_cid_valid(BlockDriverState *bs)
 {
     BDRVVmdkState *s = bs->opaque;
     uint32_t cur_pcid;
-- 
2.40.0


