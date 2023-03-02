Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A9D6A8361
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:20:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXipu-0002Hv-2X; Thu, 02 Mar 2023 08:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXipq-0002Hf-VZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXipp-0001ql-7S
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677763139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxAPVDMLahqdlBSzs4u04+yyiCpweXLymWLScdyNpF0=;
 b=PRkkCPWIFdYzdsg7oGxTWFQf461bSvsEKWuu9KEix9cKMv2XfP7H6GtoRdiP5YXYqef80g
 CqU+Ru+MFWmu5DgBMhpGhKs2ibzvTyAAmH3+w5kF44aOSqXeID8VPk6zefndsWwiAAI3Tn
 NTK26HNyeotbJzyOHehcrDatsmWX7qE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-1AoV-gYzNSKQ8-xunnlm6A-1; Thu, 02 Mar 2023 08:18:56 -0500
X-MC-Unique: 1AoV-gYzNSKQ8-xunnlm6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ADDB3C0F684;
 Thu,  2 Mar 2023 13:18:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8621C1121315;
 Thu,  2 Mar 2023 13:18:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/4] mtest2make.py: teach suite name that are just "PROJECT"
Date: Thu,  2 Mar 2023 17:18:45 +0400
Message-Id: <20230302131848.1527460-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
2.39.2


