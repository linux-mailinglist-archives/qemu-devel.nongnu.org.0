Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AECC260B7A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 09:01:51 +0200 (CEST)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFXdW-0008Cf-56
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 03:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kFXcM-0007cF-7g
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 03:00:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54994
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kFXcK-0000TJ-Gj
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 03:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599548434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E0ZhXKghmJkvIciPUKHX3hypiskU3eE8ItTAXYZjSKE=;
 b=A1hiiuDvukAoXBBmMiOAwIf6pgUJGp4GGxjXX3DIItAQkKZuLPJCoaFk9sw1YQkx6dbxQJ
 tMlHk6OUSnH9U5jJWwN2XtFg55vSktXtwVtfaqbCYxC/OfABsvwaTE5TA2owmczjgWPjjW
 ThiHwgaUSB4i6odWQurG3HJ6o8ryl6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131--6V5g15nNn2ADaJRCOkbgQ-1; Tue, 08 Sep 2020 03:00:32 -0400
X-MC-Unique: -6V5g15nNn2ADaJRCOkbgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC1DA18B9EDD;
 Tue,  8 Sep 2020 07:00:31 +0000 (UTC)
Received: from thuth.com (ovpn-112-131.ams2.redhat.com [10.36.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 927DC5D9D3;
 Tue,  8 Sep 2020 07:00:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Subject: [PATCH] block/qcow2-cluster: Add missing "fallthrough" annotation
Date: Tue,  8 Sep 2020 09:00:28 +0200
Message-Id: <20200908070028.193298-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling with -Werror=implicit-fallthrough, the compiler currently
complains:

../../devel/qemu/block/qcow2-cluster.c: In function ‘cluster_needs_new_alloc’:
../../devel/qemu/block/qcow2-cluster.c:1320:12: error: this statement may fall
 through [-Werror=implicit-fallthrough=]
         if (l2_entry & QCOW_OFLAG_COPIED) {
            ^
../../devel/qemu/block/qcow2-cluster.c:1323:5: note: here
     case QCOW2_CLUSTER_UNALLOCATED:
     ^~~~

It's quite obvious that the fallthrough is intended here, so let's add
a comment to silence the compiler warning.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/qcow2-cluster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 996b3314f4..fcdf7af8e6 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1320,6 +1320,7 @@ static bool cluster_needs_new_alloc(BlockDriverState *bs, uint64_t l2_entry)
         if (l2_entry & QCOW_OFLAG_COPIED) {
             return false;
         }
+        /* fallthrough */
     case QCOW2_CLUSTER_UNALLOCATED:
     case QCOW2_CLUSTER_COMPRESSED:
     case QCOW2_CLUSTER_ZERO_PLAIN:
-- 
2.18.2


