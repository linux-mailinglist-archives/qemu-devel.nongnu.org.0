Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087FA40D24B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:20:15 +0200 (CEST)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQisg-00023w-0R
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijE-0007PR-HW
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQijC-0000kI-OK
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5bnYvaVaZR3Rc4sd0Frx86BC+9YsKCE/Qfue57FWLY=;
 b=ge5+of7E0aVieBOIjxQa974Nw6mHeZxTMj4Nq1sZTQSLoOhoT9VSyewzZNVWxqHVwYsrsm
 bUcaguHsWbSov8hgAdJQYu+LO+Q6eF+ni9tnlaI1xMVeEE7zDrmQUzY/cy2EdCIirFIgVx
 kUN+c0VGwo3KLdA1+ZHSfwT2+0i8IvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-gOvhuztqPVKCQfr9A8AjHQ-1; Thu, 16 Sep 2021 00:10:24 -0400
X-MC-Unique: gOvhuztqPVKCQfr9A8AjHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3275824FA7;
 Thu, 16 Sep 2021 04:10:23 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F64619C79;
 Thu, 16 Sep 2021 04:10:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/16] iotests/297: Add 'directory' argument to run_linters
Date: Thu, 16 Sep 2021 00:09:49 -0400
Message-Id: <20210916040955.628560-11-jsnow@redhat.com>
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

Allow run_linters to work well if it's executed from a different
directory.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/297 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 08d2b87108..e05c99972e 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -66,6 +66,7 @@ def get_test_files(directory: str = '.') -> List[str]:
 
 def run_linters(
     files: List[str],
+    directory: str = '.',
     env: Optional[Mapping[str, str]] = None,
 ) -> None:
 
@@ -76,6 +77,7 @@ def run_linters(
     # fixed (in tests, at least)
     subprocess.run(
         ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX', *files),
+        cwd=directory,
         env=env,
         check=False,
     )
@@ -103,6 +105,7 @@ def run_linters(
                 '--namespace-packages',
                 filename,
             ),
+            cwd=directory,
             env=env,
             check=False,
             stdout=subprocess.PIPE,
-- 
2.31.1


