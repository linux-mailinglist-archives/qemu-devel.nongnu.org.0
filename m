Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A34CD82C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:43:38 +0100 (CET)
Received: from localhost ([::1]:38294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA5h-0007lq-SR
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:43:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQA09-0007mQ-KM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQA07-0007Xs-HO
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646408270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHmCSoucrHaQHirB6lh7gWEVtW2t7wNeqE1FY1WCEoA=;
 b=P6USZGAUIBABqn+zayKr/pRSx66Wx04rJ3sfxF2iULUv3r0+p7dL5OQYwP1xvZCNl72Tft
 8yfA/7UtTfp5LfCRBfhqPS9ScixoWaiZ3NH6YhTzLemQLoib2+OjLCBjP4u4IuoVwVOjxw
 y7mqU4Lai6C7qDq0JBCAUz/ThEvx6Hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-WzLDioDgMa-RVO9Jo8p3jA-1; Fri, 04 Mar 2022 10:37:49 -0500
X-MC-Unique: WzLDioDgMa-RVO9Jo8p3jA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CE34824FA7;
 Fri,  4 Mar 2022 15:37:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3119583C11;
 Fri,  4 Mar 2022 15:37:48 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/5] block/amend: Keep strong reference to BDS
Date: Fri,  4 Mar 2022 16:37:28 +0100
Message-Id: <20220304153729.711387-5-hreitz@redhat.com>
In-Reply-To: <20220304153729.711387-1-hreitz@redhat.com>
References: <20220304153729.711387-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise, the BDS might be freed while the job is running, which would
cause a use-after-free.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/amend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/amend.c b/block/amend.c
index 553890ded9..f696a006e3 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -69,6 +69,8 @@ static void blockdev_amend_free(Job *job)
     if (s->bs->drv->bdrv_amend_clean) {
         s->bs->drv->bdrv_amend_clean(s->bs);
     }
+
+    bdrv_unref(s->bs);
 }
 
 static const JobDriver blockdev_amend_job_driver = {
@@ -129,6 +131,7 @@ void qmp_x_blockdev_amend(const char *job_id,
         return;
     }
 
+    bdrv_ref(bs);
     s->bs = bs,
     s->opts = QAPI_CLONE(BlockdevAmendOptions, options),
     s->force = has_force ? force : false;
-- 
2.34.1


