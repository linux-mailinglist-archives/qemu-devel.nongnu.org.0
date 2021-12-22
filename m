Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DFF47D585
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:57:03 +0100 (CET)
Received: from localhost ([::1]:55142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n04vG-0005Gw-LI
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n04r1-0006S6-4E
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:52:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n04qw-0006Ub-N2
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640191948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRX+D0ZoJk1LcieBjeCXrUaFeuMJAhnFrYudaVE0hro=;
 b=ekaK796ywRd1AKPxhUFzixg3XgeCYPDwUWCC8xxTqlZZwnd3JY//nnZzFe2GW/KaXv1wD5
 8PGIucyvImh1NZ4J07SZYR7wtK0ehQIOHJ+IRHSX1Abj/lLKRd6hYDxzq50kmf+EqULFN1
 TM3yumd/kIncEHsJO62oGVediDzHWGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-jt10GU_xOi-VwAqKJzNdtg-1; Wed, 22 Dec 2021 11:52:25 -0500
X-MC-Unique: jt10GU_xOi-VwAqKJzNdtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2356081CCB5;
 Wed, 22 Dec 2021 16:52:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F8C956AA2;
 Wed, 22 Dec 2021 16:52:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/3] iotests/testrunner.py: move updating last_elapsed to
 run_tests
Date: Wed, 22 Dec 2021 17:52:07 +0100
Message-Id: <20211222165208.693159-3-hreitz@redhat.com>
In-Reply-To: <20211222165208.693159-1-hreitz@redhat.com>
References: <20211222165208.693159-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to use do_run_test() in multiprocessing environment, where
we'll not be able to change original runner object.

Happily, the only thing we change is that last_elapsed and it's simple
to do it in run_tests() instead. All other accesses to self in
do_runt_test() and in run_test() are read-only.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211203122223.2780098-3-vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index fa842252d3..a9f2feb58c 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -287,7 +287,6 @@ def do_run_test(self, test: str) -> TestResult:
                               diff=diff, casenotrun=casenotrun)
         else:
             f_bad.unlink()
-            self.last_elapsed.update(test, elapsed)
             return TestResult(status='pass', elapsed=elapsed,
                               casenotrun=casenotrun)
 
@@ -353,6 +352,9 @@ def run_tests(self, tests: List[str]) -> bool:
                     print('\n'.join(res.diff))
             elif res.status == 'not run':
                 notrun.append(name)
+            elif res.status == 'pass':
+                assert res.elapsed is not None
+                self.last_elapsed.update(t, res.elapsed)
 
             sys.stdout.flush()
             if res.interrupted:
-- 
2.33.1


