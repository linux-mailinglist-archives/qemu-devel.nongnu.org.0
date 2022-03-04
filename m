Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE24CDA37
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:24:05 +0100 (CET)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBeu-0002fr-O6
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6s-00074J-Bk
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6q-0008S2-Nu
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yk080iE2jn0HBqCQTQNyJ4kfoM+BlngCbKXhXXWJU/I=;
 b=BIW1ii0GBW1PxfoVi8t92+et/nyfd0m4TYBEhn0X1knpVPWASI+OgsW5fUiD9N2ZOODnLQ
 LZlhH+WtRdV3hGPu0uZCRfJdqo6um4JYZWcojZJr6dK1Qp1tDJyL8QUP9DqaVCp+1A3Ow6
 zrZk/KD0rxp/WQcOTroenKTBrtu3w24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-vykplS93Mfi4PG3CayEhTw-1; Fri, 04 Mar 2022 11:48:49 -0500
X-MC-Unique: vykplS93Mfi4PG3CayEhTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34B081006AA5;
 Fri,  4 Mar 2022 16:48:48 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35E3683BF9;
 Fri,  4 Mar 2022 16:48:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 50/50] block/amend: Keep strong reference to BDS
Date: Fri,  4 Mar 2022 17:47:11 +0100
Message-Id: <20220304164711.474713-51-kwolf@redhat.com>
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

Otherwise, the BDS might be freed while the job is running, which would
cause a use-after-free.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220304153729.711387-5-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.35.1


