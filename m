Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9F4DE2D9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:50:53 +0100 (CET)
Received: from localhost ([::1]:57552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJYi-0002gF-HA
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:50:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLS-0002Zo-87
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLN-0005aG-2z
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aRHqLWIRbpT+6OSgc9rN8L3pp706CEQFljyX7sIHhU=;
 b=DKGo3bR0vnFYJ4+dq1vkAfRxoymRswyZ5pEcWZIvCOCuEtX/wEgmtoRuaHfkmoDfX934gp
 Exjpbb5a5gEDWICUYUrYcIN7RBGIhJvQciiAqtYQ/OvFJw3400eYQ/tl7mqGJWff6hw1uk
 yL8h8fY3uC9kT8Q8HxR0rtTE/cKbNUY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-l0ZAcr6gOL2fLLHC5Ld4wA-1; Fri, 18 Mar 2022 16:37:01 -0400
X-MC-Unique: l0ZAcr6gOL2fLLHC5Ld4wA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06E25185A7BA;
 Fri, 18 Mar 2022 20:37:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF65F4292C7;
 Fri, 18 Mar 2022 20:37:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/15] iotests: make qemu_io_log() check return codes by
 default
Date: Fri, 18 Mar 2022 16:36:55 -0400
Message-Id: <20220318203655.676907-16-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like qemu_img_log(), upgrade qemu_io_log() to enforce a return code
of zero by default.

Affected tests: 242 245 255 274 303 307 nbd-reconnect-on-open

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py                  | 5 +++--
 tests/qemu-iotests/tests/nbd-reconnect-on-open | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 0b631e1f8c..c05637bd57 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -365,8 +365,9 @@ def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
     return qemu_tool(*qemu_io_wrap_args(args),
                      check=check, combine_stdio=combine_stdio)
 
-def qemu_io_log(*args: str) -> subprocess.CompletedProcess[str]:
-    result = qemu_io(*args, check=False)
+def qemu_io_log(*args: str, check: bool = True
+                ) -> subprocess.CompletedProcess[str]:
+    result = qemu_io(*args, check=check)
     log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
     return result
 
diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open b/tests/qemu-iotests/tests/nbd-reconnect-on-open
index 8be721a24f..d0b401b060 100755
--- a/tests/qemu-iotests/tests/nbd-reconnect-on-open
+++ b/tests/qemu-iotests/tests/nbd-reconnect-on-open
@@ -39,7 +39,7 @@ def check_fail_to_connect(open_timeout):
     log(f'Check fail to connect with {open_timeout} seconds of timeout')
 
     start_t = time.time()
-    qemu_io_log(*create_args(open_timeout))
+    qemu_io_log(*create_args(open_timeout), check=False)
     delta_t = time.time() - start_t
 
     max_delta = open_timeout + 0.2
-- 
2.34.1


