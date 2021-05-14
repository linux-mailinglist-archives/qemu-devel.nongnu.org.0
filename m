Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EED380EEA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:27:51 +0200 (CEST)
Received: from localhost ([::1]:39256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbbK-0004ww-B6
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhax4-0006k8-7C
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawz-0006C5-1V
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bw31QTeWT/LIuvuFX1LiZTFPhLya1gYtLmzW/1YQeQ=;
 b=eRNlP7/GLS8LD7tiAuKZtqpCG8UMFdBZ9+jl+WwcAnv9vPOeaHkksXyMH30IIGQqV2YGn3
 0FLgVKjgisKqZZgijKXoG32q4JCAu76uHgkkpnZf2y27BukIVSPv49S6LYmcAcvqNfEO9I
 2qiig13TiwPcDA0RcNrLYQbFOcGRoSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-gLTLQLfDM7GDHU615e9x5w-1; Fri, 14 May 2021 12:45:59 -0400
X-MC-Unique: gLTLQLfDM7GDHU615e9x5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C9A8802690;
 Fri, 14 May 2021 16:45:58 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C753010016FC;
 Fri, 14 May 2021 16:45:57 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/19] write-threshold: deal with includes
Date: Fri, 14 May 2021 18:45:14 +0200
Message-Id: <20210514164514.1057680-20-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

"qemu/typedefs.h" is enough for include/block/write-threshold.h header
with forward declaration of BlockDriverState. Also drop extra includes
from block/write-threshold.c and tests/unit/test-write-threshold.c

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210506090621.11848-9-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/write-threshold.h   | 2 +-
 block/write-threshold.c           | 2 --
 tests/unit/test-write-threshold.c | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index a03ee1cacd..f50f923e7e 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -13,7 +13,7 @@
 #ifndef BLOCK_WRITE_THRESHOLD_H
 #define BLOCK_WRITE_THRESHOLD_H
 
-#include "block/block_int.h"
+#include "qemu/typedefs.h"
 
 /*
  * bdrv_write_threshold_set:
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 65a6acd142..35cafbc22d 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -12,9 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "block/block_int.h"
-#include "qemu/coroutine.h"
 #include "block/write-threshold.h"
-#include "qemu/notify.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-events-block-core.h"
diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index 49b1ef7a20..0158e4637a 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/write-threshold.h"
 
-- 
2.31.1


