Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEB3B86CD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:09:23 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycmA-0005ER-QD
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfK-0002OQ-S2
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfI-0006uG-DN
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7q479c3HKYtUzJNO/3mFsW54OcH4FXotX0///SAOshE=;
 b=NqMxbf5wjHlMgm/4afBtOtdjgoVLIf+XLLNEDeF0anBT3wWXRV6L6nyvsqAXusxIWq3Dif
 5HOc+HE0OV+jy41qnCYaacHs8E2pIpH/lgZFA0yREI6WyHeCobKu5sFyfdjUt0viQxwGwD
 hAowAILKAQIAZuMsDj8Ed497zF5UkNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-2CqqzIIyPyqDK6W1aXFrAg-1; Wed, 30 Jun 2021 12:02:13 -0400
X-MC-Unique: 2CqqzIIyPyqDK6W1aXFrAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A12A40C2;
 Wed, 30 Jun 2021 16:02:12 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFB1B18AAB;
 Wed, 30 Jun 2021 16:02:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/24] Prevent compiler warning on block.c
Date: Wed, 30 Jun 2021 18:01:43 +0200
Message-Id: <20210630160206.276439-2-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

Commit 3108a15cf (block: introduce bdrv_drop_filter()) introduced
uninitialized variable to_cow_parent in bdrv_replace_node_common
function that is used only when detach_subchain is true. It is used in
two places. First if block properly initialize the variable and second
block use it.

However, compiler may treat these two blocks as two independent cases so
it thinks first block can fail test and second one pass (although both
use same condition). This cause warning that variable can be
uninitialized in second block.

The warning was observed with GCC 8.4.1 and 11.0.1.

To prevent this warning, initialize the variable with NULL.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Message-Id: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 1d37f133a8..3e277855e7 100644
--- a/block.c
+++ b/block.c
@@ -4866,7 +4866,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
-    BlockDriverState *to_cow_parent;
+    BlockDriverState *to_cow_parent = NULL;
     int ret;
 
     if (detach_subchain) {
-- 
2.31.1


