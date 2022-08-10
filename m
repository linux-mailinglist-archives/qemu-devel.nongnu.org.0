Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B80D58ECEB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:19:00 +0200 (CEST)
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlbu-0005lL-Q9
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLlAV-0001uL-35
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLlAM-0007t5-1O
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJEjBHrHzv11//F1wtjzfMSrHuEe+LS5JdAUogditrc=;
 b=PjUk81AkEm3YdMYvJ2PGdQ/5sN52xFKL7iZeXqhhMI66NWGW/xtt7QUEjSSry6rvUnNNNt
 6ipkhclwhRTrnasg2JlKjHXRPczo3ywDi8DkaZoprtc3UPVOHDGogjPtVgxiaqafaIdyQY
 oa/lp3qbqVqS9K2XTGmikkzUKGE9cFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-2IOeSgQ_NXSG-kkmtZziwQ-1; Wed, 10 Aug 2022 08:50:25 -0400
X-MC-Unique: 2IOeSgQ_NXSG-kkmtZziwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5144806002;
 Wed, 10 Aug 2022 12:50:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A45FE1121315;
 Wed, 10 Aug 2022 12:50:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 15/16] mtest2make.py: teach suite name that are just
 "PROJECT"
Date: Wed, 10 Aug 2022 16:48:56 +0400
Message-Id: <20220810124857.1360211-16-marcandre.lureau@redhat.com>
In-Reply-To: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
References: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 scripts/mtest2make.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 0fe81efbbc..179dd54871 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -51,10 +51,11 @@ def process_tests(test, targets, suites):
 
     test_suites = test['suite'] or ['default']
     for s in test_suites:
-        # The suite name in the introspection info is "PROJECT:SUITE"
-        s = s.split(':')[1]
-        if s == 'slow' or s == 'thorough':
-            continue
+        # The suite name in the introspection info is "PROJECT" or "PROJECT:SUITE"
+        if ':' in s:
+            s = s.split(':')[1]
+            if s == 'slow' or s == 'thorough':
+                continue
         if s.endswith('-slow'):
             s = s[:-5]
             suites[s].speeds.append('slow')
-- 
2.37.1


