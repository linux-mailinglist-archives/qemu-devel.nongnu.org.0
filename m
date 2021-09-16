Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3C40D28C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:28:46 +0200 (CEST)
Received: from localhost ([::1]:45008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQj0v-0004k6-J8
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijO-0007pa-Dl
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijM-0000sH-Jp
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLSUoDkaQux3bt2HK7o/hFB8uu+8oqTXxlx/NpP+lUk=;
 b=FUrvXtAh43sYWGq63uzHx02EhiP2TkICDfVEgy7Ci8XOIBNQuOkdeGTa1snwNKQVPjNpw/
 1OUyterIKZLoEOW7XhgFbU9MYOLwcUIcLA0rNgktFEVGthmX77i8YxA7lpVSLvdigICtNe
 39TPF5stLVhpkGX/r4iTP2aGqujSmXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-6002h18RMF-O5ojMXfbqcg-1; Thu, 16 Sep 2021 00:10:35 -0400
X-MC-Unique: 6002h18RMF-O5ojMXfbqcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD1B5824FAE;
 Thu, 16 Sep 2021 04:10:33 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 516E719C79;
 Thu, 16 Sep 2021 04:10:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/16] python: Add iotest linters to test suite
Date: Thu, 16 Sep 2021 00:09:54 -0400
Message-Id: <20210916040955.628560-16-jsnow@redhat.com>
In-Reply-To: <20210916040955.628560-1-jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As a convenience, since iotests is an extremely prominent user of the
qemu.qmp and qemu.machine packages and already implements a linting
regime, run those tests as well so that it's very hard to miss
regressions caused by changes to the python library.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/tests/iotests.sh | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100755 python/tests/iotests.sh

diff --git a/python/tests/iotests.sh b/python/tests/iotests.sh
new file mode 100755
index 0000000000..70324540cf
--- /dev/null
+++ b/python/tests/iotests.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+
+cd ../tests/qemu-iotests/
+python3 -m linters
-- 
2.31.1


