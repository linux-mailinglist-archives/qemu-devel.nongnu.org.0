Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D152516E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:41:00 +0200 (CEST)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAvz-0007qA-I0
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApb-0006Ad-DB
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApY-0003Qa-8d
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjGNCvj1Zken4M74xajCTiZhE3E89VrsFke8eY/QFUg=;
 b=ir1OVlzgPTxM+LDYsvpMikuZ42zdd54ZCOud/L1llwlDAAiqqVCMGYTh82mnjcF0I1wAkh
 QisJUhqDkhHViOP8KR7hJOpMwf1+ztAI0tl0QnTePKvzYENfQHBgF78dmF/8SEjIf8LVJ/
 oj9JrxepcUk1udCA2JtrpacalkE6Wc4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-jK06WjVbPL6i6-ANRS8z_Q-1; Thu, 12 May 2022 11:34:15 -0400
X-MC-Unique: jK06WjVbPL6i6-ANRS8z_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99F02185A79C;
 Thu, 12 May 2022 15:34:15 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5C88401E9D;
 Thu, 12 May 2022 15:34:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/10] iotests/testrunner: Flush after run_test()
Date: Thu, 12 May 2022 17:33:54 +0200
Message-Id: <20220512153401.202863-4-kwolf@redhat.com>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
References: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

When stdout is not a terminal, the buffer may not be flushed at each end
of line, so we should flush after each test is done.  This is especially
apparent when run by check-block, in two ways:

First, when running make check-block -jX with X > 1, progress indication
was missing, even though testrunner.py does theoretically print each
test's status once it has been run, even in multi-processing mode.
Flushing after each test restores this progress indication.

Second, sometimes make check-block failed altogether, with an error
message that "too few tests [were] run".  I presume that's because one
worker process in the job pool did not get to flush its stdout before
the main process exited, and so meson did not get to see that worker's
test results.  In any case, by flushing at the end of run_test(), the
problem has disappeared for me.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220506134215.10086-1-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index aae70a8341..10d9e8ef27 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -378,6 +378,7 @@ def run_test(self, test: str,
             else:
                 print(res.casenotrun)
 
+        sys.stdout.flush()
         return res
 
     def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
-- 
2.35.3


