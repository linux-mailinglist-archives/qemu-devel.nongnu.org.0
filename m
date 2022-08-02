Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE9587FA8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 18:04:24 +0200 (CEST)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIuNa-00050k-O1
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 12:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIuEa-0004Dm-Hw
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIuEY-00027X-TS
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659455702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OFgNyePoapxAy3B2bAo2y5raQmmWKvx7VYqBx4+H48=;
 b=F0BMz+U2jCbzkYvPUuPpfnSTe4Rx8yfRo6wOVP2cjft0RNCgahOOGva59aBRpc06DGMuIV
 BrngfpkqOfkTgTH4ntws18iZvPNSgdMWH9xZLMbJFf2dLmnvFRns5uFWO+YiUaw5rfUbmE
 xwJKs+amRIDTOfSd/IcflZRbXm615Oc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-beB0bqqfNKKcTZicU2ocwQ-1; Tue, 02 Aug 2022 11:54:59 -0400
X-MC-Unique: beB0bqqfNKKcTZicU2ocwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8CBF2800486;
 Tue,  2 Aug 2022 15:54:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69161141510F;
 Tue,  2 Aug 2022 15:54:57 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, thuth@redhat.com,
 peter.maydell@linaro.org, vgoyal@redhat.com
Cc: peterx@redhat.com,
	quintela@redhat.com
Subject: [PULL 4/5] migration: Define BLK_MIG_BLOCK_SIZE as unsigned long long
Date: Tue,  2 Aug 2022 16:54:46 +0100
Message-Id: <20220802155447.216018-5-dgilbert@redhat.com>
In-Reply-To: <20220802155447.216018-1-dgilbert@redhat.com>
References: <20220802155447.216018-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

When we use BLK_MIG_BLOCK_SIZE in expressions like
block_mig_state.submitted * BLK_MIG_BLOCK_SIZE, this multiplication
is done as 32 bits, because both operands are 32 bits.  Coverity
complains about possible overflows because we then accumulate that
into a 64 bit variable.

Define BLK_MIG_BLOCK_SIZE as unsigned long long using the ULL suffix.
The only two current uses of it with this problem are both in
block_save_pending(), so we could just cast to uint64_t there, but
using the ULL suffix is simpler and ensures that we don't
accidentally introduce new variants of the same issue in future.

Resolves: Coverity CID 1487136, 1487175
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220721115207.729615-3-peter.maydell@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/block.c b/migration/block.c
index 9e5aae5898..3577c815a9 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -28,7 +28,7 @@
 #include "sysemu/block-backend.h"
 #include "trace.h"
 
-#define BLK_MIG_BLOCK_SIZE           (1 << 20)
+#define BLK_MIG_BLOCK_SIZE           (1ULL << 20)
 #define BDRV_SECTORS_PER_DIRTY_CHUNK (BLK_MIG_BLOCK_SIZE >> BDRV_SECTOR_BITS)
 
 #define BLK_MIG_FLAG_DEVICE_BLOCK       0x01
-- 
2.37.1


