Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8ED4CDAC5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:34:07 +0100 (CET)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBoc-0003qv-88
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:34:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6A-0005l6-Sn
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB66-0007Wv-Td
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ATfoxIqS/4CInOpIrgkGGu4ACsvBXErhI+aWNlTSqM=;
 b=h38n3qPk5J4WnAIKpnWnKgYHA/mM8pwESybV5Or9FiiUjS8AbYM3gfLwyixePM3TA1l7nb
 c/pYw2vNEgIKtiXTWk9wIm2Pt1SDY/W6vqR0RGtOKm3tP1/6vvlgoG5r8pBh1b4kHwd17+
 VyqdeN7dlRs/WODinxOTf1uovyQfPOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-KNm2W9pIOMSCicRJGP88Dg-1; Fri, 04 Mar 2022 11:48:01 -0500
X-MC-Unique: KNm2W9pIOMSCicRJGP88Dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B7DF801AFE;
 Fri,  4 Mar 2022 16:48:00 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A00168547F;
 Fri,  4 Mar 2022 16:47:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 33/50] include/sysemu/blockdev.h: global state API
Date: Fri,  4 Mar 2022 17:46:54 +0100
Message-Id: <20220304164711.474713-34-kwolf@redhat.com>
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

blockdev functions run always under the BQL lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-21-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/sysemu/blockdev.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index f9fb54d437..3211b16513 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -13,9 +13,6 @@
 #include "block/block.h"
 #include "qemu/queue.h"
 
-void blockdev_mark_auto_del(BlockBackend *blk);
-void blockdev_auto_del(BlockBackend *blk);
-
 typedef enum {
     IF_DEFAULT = -1,            /* for use with drive_add() only */
     /*
@@ -38,6 +35,16 @@ struct DriveInfo {
     QTAILQ_ENTRY(DriveInfo) next;
 };
 
+/*
+ * Global state (GS) API. These functions run under the BQL.
+ *
+ * See include/block/block-global-state.h for more information about
+ * the GS API.
+ */
+
+void blockdev_mark_auto_del(BlockBackend *blk);
+void blockdev_auto_del(BlockBackend *blk);
+
 DriveInfo *blk_legacy_dinfo(BlockBackend *blk);
 DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo);
 BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo);
-- 
2.35.1


