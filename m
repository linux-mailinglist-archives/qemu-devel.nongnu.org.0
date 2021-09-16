Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302740D28F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:31:48 +0200 (CEST)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQj3r-0008TX-E4
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijR-0007q7-J6
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijP-0000tq-B1
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQD+xvNddz3IgxRD7bdkK21oFfXzQ6rrTLfD3Du0hJg=;
 b=Su8fbtlKWgA87un4OHz9cdPcwAj9JUC/FdPu+KK9Pw28Q0qdQpO8Mg5Ptz19BS/p3niSS/
 EYD7cIloVZpGYT7hatbvxMTktPsioAExtkoToYMjIAnQcUBDuj43zcb/w3ztaGeCkmcaT8
 trQe87XQzZoKFIF8zrVFXRLJBJrLRYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-qciGnQlpO1uo-la-Jh5Ftg-1; Thu, 16 Sep 2021 00:10:33 -0400
X-MC-Unique: qciGnQlpO1uo-la-Jh5Ftg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ADD41084689;
 Thu, 16 Sep 2021 04:10:32 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 843AD19C79;
 Thu, 16 Sep 2021 04:10:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/16] iotests/linters: Add workaround for mypy bug #9852
Date: Thu, 16 Sep 2021 00:09:53 -0400
Message-Id: <20210916040955.628560-15-jsnow@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This one is insidious: if you use the invocation
"from {namespace} import {subpackage}" as mirror-top-perms does,
mypy will fail on every-other invocation *if* the package being
imported is a package.

Now, I could just edit mirror-top-perms to avoid this invocation, but
since I tripped on a landmine, I might as well head it off at the pass
and make sure nobody else trips on the same landmine.

It seems to have something to do with the order in which files are
checked as well, meaning the random order in which set(os.listdir())
produces the list of files to test will cause problems intermittently.

mypy >= 0.920 isn't released yet, so add this workaround for now.

See also:
 https://github.com/python/mypy/issues/11010
 https://github.com/python/mypy/issues/9852

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/linters.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
index 4df062a973..9c97324e87 100755
--- a/tests/qemu-iotests/linters.py
+++ b/tests/qemu-iotests/linters.py
@@ -100,6 +100,9 @@ def run_linters(
                 '--warn-unused-ignores',
                 '--no-implicit-reexport',
                 '--namespace-packages',
+                # Until we can use mypy >= 0.920, see
+                # https://github.com/python/mypy/issues/9852
+                '--no-incremental',
                 filename,
             ),
             cwd=directory,
-- 
2.31.1


