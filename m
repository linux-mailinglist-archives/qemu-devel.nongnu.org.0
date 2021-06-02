Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEAD398B31
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:57:49 +0200 (CEST)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRNU-0002bR-Up
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCU-0001pJ-Go
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCP-0007L1-Dc
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igWrkTKNYAoinrQsAdI9dJItNXjwsqII+NxMQaz3M/M=;
 b=SK5VUP/7VVWQLJd19GGtDNTyibNJzfXAt5LHKJqu3rEAjQghqT4B53c1MxCeP31vdynVcl
 WYCj4Ig1Gu+UwCf39P92zaxxpqPACofmQy5zuNb4yfBTzeKyVPW//BG57GbbYqHfRlaqfT
 5NZ0p7fChLPGsvBlrb/Kxv37YhOb4Dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-ywTC6w9tOUaBstOXo9-v6w-1; Wed, 02 Jun 2021 09:46:18 -0400
X-MC-Unique: ywTC6w9tOUaBstOXo9-v6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE090A0CDD;
 Wed,  2 Jun 2021 13:45:49 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C078119CBE;
 Wed,  2 Jun 2021 13:45:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/20] block: improve bdrv_child_get_parent_desc()
Date: Wed,  2 Jun 2021 15:45:21 +0200
Message-Id: <20210602134529.231756-13-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We have different types of parents: block nodes, block backends and
jobs. So, it makes sense to specify type together with name.

Next, this handler us used to compose an error message about permission
conflict. And permission conflict occurs in a specific place of block
graph. We shouldn't report name of parent device (as it refers another
place in block graph), but exactly and only the name of the node. So,
use bdrv_get_node_name() directly.

iotest 283 output is updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210601075218.79249-4-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                    | 2 +-
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index c0fd363605..94cb7b6637 100644
--- a/block.c
+++ b/block.c
@@ -1149,7 +1149,7 @@ int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough)
 static char *bdrv_child_get_parent_desc(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
-    return g_strdup(bdrv_get_device_or_node_name(parent));
+    return g_strdup_printf("node '%s'", bdrv_get_node_name(parent));
 }
 
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 97e62a4c94..c9397bfc44 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.30.2


