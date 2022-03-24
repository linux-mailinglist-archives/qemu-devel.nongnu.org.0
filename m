Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82574E68DF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:51:57 +0100 (CET)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSYu-0007tA-QY
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:51:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEm-0000NQ-AA
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:31:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEc-0005pb-VC
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jpEJrK7nT8EZveZ7BbmepXMy6N57yFI9GAA6yaaIrg=;
 b=byPayquYOmK4VbTx54cLlbWR0itACkegS/fGLp+ilI2UN/2+1Rn2/ZxhMvIe42kvUyhn51
 SE72fVFnEhDcpXxfKne/+To2ezoJjLBx54T/dF4fywYtLJHTTXDYZgMMxgFKpRlfrHwT4X
 mzzIt0xrqx+5r1C8CWGaHSfzMpwpDKU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-GAzG6w_1OIyg5I7zAH4lZw-1; Thu, 24 Mar 2022 14:30:52 -0400
X-MC-Unique: GAzG6w_1OIyg5I7zAH4lZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF6353801ECA;
 Thu, 24 Mar 2022 18:30:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE3E9C27D8A;
 Thu, 24 Mar 2022 18:30:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/17] iotests: make qemu_io_log() check return codes by
 default
Date: Thu, 24 Mar 2022 14:30:18 -0400
Message-Id: <20220324183018.2476551-18-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like qemu_img_log(), upgrade qemu_io_log() to enforce a return code
of zero by default.

Tests that use qemu_io_log(): 242 245 255 274 303 307 nbd-reconnect-on-open

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py                  | 5 +++--
 tests/qemu-iotests/tests/nbd-reconnect-on-open | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1d103a3872..1a3662db0b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -365,8 +365,9 @@ def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
     return qemu_tool(*qemu_io_wrap_args(args),
                      check=check, combine_stdio=combine_stdio)
 
-def qemu_io_log(*args: str) -> 'subprocess.CompletedProcess[str]':
-    result = qemu_io(*args, check=False)
+def qemu_io_log(*args: str, check: bool = True
+                ) -> 'subprocess.CompletedProcess[str]':
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


