Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5992D571647
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:57:10 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCdh-0003ko-6N
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCKS-0006Ev-LA
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCKQ-0001rq-Eq
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nM7wrY/D3ugiS6pxblMsXcRuVCQA1Yk9Qt/yIkB040=;
 b=H2OUU10+tXuozC1aE/IpE6Qi3Nd59WihxQxdTXGT61sarP4o5aAz/kAPxIh9EM6WTAY2HO
 t54209ZutE3xLYlozdjtcVXcqyPw3A/VwospH6mfbPyJMvl9wiTi436E2LRrYMgCLLvRkD
 8+WHGalMx3en4y0FLqapJBx22eERMVo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-xzoUKBeSMcGd8V7V2KxrGg-1; Tue, 12 Jul 2022 05:37:06 -0400
X-MC-Unique: xzoUKBeSMcGd8V7V2KxrGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73E1D185A7BA;
 Tue, 12 Jul 2022 09:37:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 804E340D2827;
 Tue, 12 Jul 2022 09:37:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 14/15] mtest2make.py: teach suite name that are just
 "PROJECT"
Date: Tue, 12 Jul 2022 13:35:27 +0400
Message-Id: <20220712093528.4144184-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

A subproject test may be simply in the "PROJECT" suite (such as
"qemu-common" with the following patches)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/mtest2make.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 0fe81efbbcec..606821ee2732 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -51,8 +51,11 @@ def process_tests(test, targets, suites):
 
     test_suites = test['suite'] or ['default']
     for s in test_suites:
-        # The suite name in the introspection info is "PROJECT:SUITE"
-        s = s.split(':')[1]
+        # The suite name in the introspection info is "PROJECT" or "PROJECT:SUITE"
+        try:
+            s = s.split(':')[1]
+        except IndexError:
+            continue
         if s == 'slow' or s == 'thorough':
             continue
         if s.endswith('-slow'):
-- 
2.37.0.rc0


