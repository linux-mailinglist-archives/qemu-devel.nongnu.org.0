Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3054A3DE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 03:53:17 +0200 (CEST)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0vk4-0000rA-U6
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 21:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0vhm-0006gn-Hs
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0vhi-0006O3-8o
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655171449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NVmuNH9eiLt4ZzZ5mkBmhgSe8ngCJaVtRqla2h9EPg=;
 b=PuXDJu+wD3Owx6MPZlqar9cmt3wwJKB9pT8OhjHMUOG9QOfCfVVLfnGef4zaE6Ue4JIkwQ
 s80i849RQHluYQ3J3McxxjaMq+IwgQZu9cTy8pRDysZIFS8VxHhTYHdNdxs9eaWYq+ajTR
 kzyt6VYSl3h0Y06b/ynff4bIFthsZyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-axlNsXH4Onm9Gb4n6qH-Kw-1; Mon, 13 Jun 2022 21:50:46 -0400
X-MC-Unique: axlNsXH4Onm9Gb4n6qH-Kw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56AF68027EE;
 Tue, 14 Jun 2022 01:50:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5EC72026D64;
 Tue, 14 Jun 2022 01:50:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 1/5] tests/qemu-iotests: hotfix for 307, 223 output
Date: Mon, 13 Jun 2022 21:50:40 -0400
Message-Id: <20220614015044.2501806-2-jsnow@redhat.com>
In-Reply-To: <20220614015044.2501806-1-jsnow@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

Fixes: 58a6fdcc
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/223.out | 4 ++--
 tests/qemu-iotests/307.out | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index 06479415312..26fb347c5da 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -93,7 +93,7 @@ exports available: 3
  export: 'n2'
   description: some text
   size:  4194304
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: 1
   opt block: 4096
   max block: 33554432
@@ -212,7 +212,7 @@ exports available: 3
  export: 'n2'
   description: some text
   size:  4194304
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: 1
   opt block: 4096
   max block: 33554432
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index ec8d2be0e0a..390f05d1b78 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -83,7 +83,7 @@ exports available: 2
  export: 'export1'
   description: This is the writable second export
   size:  67108864
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: XXX
   opt block: XXX
   max block: XXX
@@ -109,7 +109,7 @@ exports available: 1
  export: 'export1'
   description: This is the writable second export
   size:  67108864
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: XXX
   opt block: XXX
   max block: XXX
-- 
2.34.3


