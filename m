Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F220F138
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 11:10:40 +0200 (CEST)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqCHn-0006CR-01
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 05:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBO-0002T1-II
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:02 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56338
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBK-0002rH-Gx
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/n8Az3N+PgeRs32jxTwMMmGifwtofJOiJNFkEPV13hM=;
 b=SwR2s1cz0CMn4qPajtWm6qbKigrOiWtlRk0cGpT3wgDwiwpYW6sYoVMJYQyPZIRvh8vvEq
 1V1gzOGyekakf+aYvvnZhC+UyQLwyhVPFE4yjmlXrk6PD7kqaVVv7CP5O3YWpE5O2C11sK
 vJ8pPmXyyVVEjH/OfR6rUqPs6tcJ9Oo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-cDJ9B1cIOXKqU5J0ELTVPQ-1; Tue, 30 Jun 2020 05:03:56 -0400
X-MC-Unique: cDJ9B1cIOXKqU5J0ELTVPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C54F18A072B;
 Tue, 30 Jun 2020 09:03:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2EDE741AC;
 Tue, 30 Jun 2020 09:03:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C17EA1138474; Tue, 30 Jun 2020 11:03:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/26] qga: Plug unlikely memory leak in
 guest-set-memory-blocks
Date: Tue, 30 Jun 2020 11:03:33 +0200
Message-Id: <20200630090351.1247703-9-armbru@redhat.com>
In-Reply-To: <20200630090351.1247703-1-armbru@redhat.com>
References: <20200630090351.1247703-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 01:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

transfer_memory_block() leaks an Error object when reading file
/sys/devices/system/memory/memory<INDEX>/state fails with errno other
than ENOENT, and @sys2memblk is false, i.e. when the state file exists
but cannot be read (seems quite unlikely), and this is
guest-set-memory-blocks, not guest-get-memory-blocks.

Plug the leak.

Fixes: bd240fca42d5f072fb758a71720d9de9990ac553
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 qga/commands-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ae1348dc8f..cdbeb59dcc 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2421,6 +2421,7 @@ static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memblk,
             if (sys2memblk) {
                 error_propagate(errp, local_err);
             } else {
+                error_free(local_err);
                 result->response =
                     GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
             }
-- 
2.26.2


