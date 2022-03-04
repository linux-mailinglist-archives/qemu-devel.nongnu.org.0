Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC96B4CDA0B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:20:14 +0100 (CET)
Received: from localhost ([::1]:53766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBbB-00059Q-R9
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:20:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6p-0006u6-3q
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6n-0008II-Jl
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qkR0mzkR1jxXgNg36TngK6rUc7CJ+/YVexfF9GNtls=;
 b=KF6cQHT/W5EYAvpaJVp5VUFlTQuvxfb8oTBNfHaffHp7KID1ibk4mqN/+C7flsnyE+Vd1v
 NplOJK5rkylwrY8zOQAKNjxqbDVv7ZiCg7vp1QPsweYzlzm0iiBBdth2Wn/BAsBwtniSNm
 OihwlU4WPymtW3/qunwSP40eDwVSdP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-6vYYzwtRNsOtSoB04V-RRA-1; Fri, 04 Mar 2022 11:48:47 -0500
X-MC-Unique: 6vYYzwtRNsOtSoB04V-RRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0DF21006AA6;
 Fri,  4 Mar 2022 16:48:46 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E12468658C;
 Fri,  4 Mar 2022 16:48:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 49/50] block/amend: Always call .bdrv_amend_clean()
Date: Fri,  4 Mar 2022 17:47:10 +0100
Message-Id: <20220304164711.474713-50-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

.bdrv_amend_clean() says block drivers can use it to clean up what was
done in .bdrv_amend_pre_run().  Therefore, it should always be called
after .bdrv_amend_pre_run(), which means we need it to call it in the
JobDriver.free() callback, not in JobDriver.clean().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220304153729.711387-3-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/amend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/amend.c b/block/amend.c
index f465738665..553890ded9 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -62,7 +62,7 @@ static int blockdev_amend_pre_run(BlockdevAmendJob *s, Error **errp)
     return 0;
 }
 
-static void blockdev_amend_clean(Job *job)
+static void blockdev_amend_free(Job *job)
 {
     BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
 
@@ -75,7 +75,7 @@ static const JobDriver blockdev_amend_job_driver = {
     .instance_size = sizeof(BlockdevAmendJob),
     .job_type      = JOB_TYPE_AMEND,
     .run           = blockdev_amend_run,
-    .clean         = blockdev_amend_clean,
+    .free          = blockdev_amend_free,
 };
 
 void qmp_x_blockdev_amend(const char *job_id,
-- 
2.35.1


