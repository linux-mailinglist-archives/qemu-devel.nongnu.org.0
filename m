Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986202B5F03
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:20:58 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezyj-0008OS-N9
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuF-0002Vm-CT
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuD-0002hN-Mj
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605615377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MHw0RbpZ2HsFdCtkvNdSz1Vz5v6AvHQHy7Y6JprKkXQ=;
 b=RyH3E0NlUtKGFZ+uhjHgbfUwdFTm89ovKn5UoQ9vZYqzu0LI1IEu29U3bcSgojCMSbkamY
 Au598W8a0sp2mv/jGOM4ZqpTWffuQYB2uXHZwV+NUjbkSoxLaS8deJMF92QTXQuRsDIymB
 DntLRSpK05P3WH85zt6+7CXlO/OQKWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-ewAn3toCMH2u-5MT5w_rjQ-1; Tue, 17 Nov 2020 07:16:14 -0500
X-MC-Unique: ewAn3toCMH2u-5MT5w_rjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4042718CB726;
 Tue, 17 Nov 2020 12:16:13 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 479A910013D0;
 Tue, 17 Nov 2020 12:16:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 5/7] quorum: Require WRITE perm with rewrite-corrupted
Date: Tue, 17 Nov 2020 13:15:56 +0100
Message-Id: <20201117121558.249585-6-kwolf@redhat.com>
In-Reply-To: <20201117121558.249585-1-kwolf@redhat.com>
References: <20201117121558.249585-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Using rewrite-corrupted means quorum may issue writes to its children
just from receiving read requests from its parents.  Thus, it must take
the WRITE permission when rewrite-corrupted is used.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201113211718.261671-2-mreitz@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/quorum.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/quorum.c b/block/quorum.c
index e846a7e892..b10fc2089e 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1163,7 +1163,12 @@ static void quorum_child_perm(BlockDriverState *bs, BdrvChild *c,
                               uint64_t perm, uint64_t shared,
                               uint64_t *nperm, uint64_t *nshared)
 {
+    BDRVQuorumState *s = bs->opaque;
+
     *nperm = perm & DEFAULT_PERM_PASSTHROUGH;
+    if (s->rewrite_corrupted) {
+        *nperm |= BLK_PERM_WRITE;
+    }
 
     /*
      * We cannot share RESIZE or WRITE, as this would make the
-- 
2.28.0


