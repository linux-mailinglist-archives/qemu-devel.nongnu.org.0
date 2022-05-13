Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0AC5258E9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:13:40 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIw7-0002YW-Az
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIpA-0007LF-SA
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIp9-0007nP-0U
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652400386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYZbJ70OmbPfbMKX54+AlxbyC4G+hCh+4siMBCUdMnQ=;
 b=dlapaF7lAixmWQ10niSTgsQYTy1MKCk1SGABb8ouAGrXoIhycchupDB51ZHKS/AKhmE/fy
 /RO2Z51hPIrnJ52bzaPMByWBwjb8kmwUfXBF2k/ljj4xFEAFrmkrf1dHu2tLf5aa8/tNRB
 r2jfnaryK6Sn6phzuwAVheZQWpvz6WI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-Kp7wuxKyO0G3Zrb2FZZc8A-1; Thu, 12 May 2022 20:06:25 -0400
X-MC-Unique: Kp7wuxKyO0G3Zrb2FZZc8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1EE6296A629;
 Fri, 13 May 2022 00:06:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78B8B15341CE;
 Fri, 13 May 2022 00:06:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH 8/9] iotests: fix source directory location
Date: Thu, 12 May 2022 20:06:08 -0400
Message-Id: <20220513000609.197906-9-jsnow@redhat.com>
In-Reply-To: <20220513000609.197906-1-jsnow@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

If you invoke the check script from outside of the tests/qemu-iotests
directory, the directories initialized as source_iotests and
build_iotests will be incorrect.

We can use the location of the source file itself to be more accurate.

(I don't know if this is actually *used*, but what was there was wrong,
I think.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/testenv.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index a864c74b123..0007da3f06c 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -217,10 +217,10 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
             self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
         else:
             # called from the source tree
-            self.source_iotests = os.getcwd()
+            self.source_iotests = str(Path(__file__, '../').resolve())
             self.build_iotests = self.source_iotests
 
-        self.build_root = os.path.join(self.build_iotests, '..', '..')
+        self.build_root = str(Path(self.build_iotests, '../..').resolve())
 
         self.init_directories()
         self.init_binaries()
-- 
2.34.1


