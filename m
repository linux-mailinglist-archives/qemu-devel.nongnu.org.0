Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B254D26EC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 05:06:36 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnau-0000HM-14
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 23:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPT-0003La-7P
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPR-0002xz-Or
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0Gq0KP7awtLm+nP716sAWgOBDi7BO9wUdiEzI8cpTQ=;
 b=dfg+CquSsQLX9S3WdWvx5COL3fw73pxAoWC3OMSqaEOSYkdMCbsb+6aYjUFcSuCX/B8zZR
 TUkYnLcaeL2CFXfpxgNboYwWqv9ByGI81eOrob/lS5GaToVJRdGHSTGXZN0XoD9wSQV6RY
 yLLw3mX65Nobp+CnRRrmz17fHEaaixE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-uQMGpBs9MfamMS9jWkfxOg-1; Tue, 08 Mar 2022 22:54:42 -0500
X-MC-Unique: uQMGpBs9MfamMS9jWkfxOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 221991006AA5;
 Wed,  9 Mar 2022 03:54:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1194F6C180;
 Wed,  9 Mar 2022 03:54:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/14] iotests: make qemu_img_log() check log level
Date: Tue,  8 Mar 2022 22:54:06 -0500
Message-Id: <20220309035407.1848654-14-jsnow@redhat.com>
In-Reply-To: <20220309035407.1848654-1-jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improve qemu_img_log() to actually check if logging is turned on. If it
isn't, revert to the behavior of qemu_img(). This is done so that there
really is no way to avoid scrutinizing qemu-ing subprocess calls by
accident.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index f8d966cd73..6af503058f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -318,7 +318,19 @@ def qemu_img_map(*args: str) -> Any:
     return qemu_img_json('map', "--output", "json", *args)
 
 def qemu_img_log(*args: str) -> subprocess.CompletedProcess[str]:
-    result = qemu_img(*args, check=False)
+    """
+    Logged, unchecked variant of qemu_img() that allows non-zero exit codes.
+
+    If logging is perceived to be disabled, this function will fall back
+    to prohibiting non-zero return codes.
+
+    :raise VerboseProcessError:
+        When the return code is negative, or when logging is disabled
+        on any non-zero return code.
+
+    :return: a CompletedProcess instance with returncode and console output.
+    """
+    result = qemu_img(*args, check=not logging_enabled())
     log(result.stdout, filters=[filter_testfiles])
     return result
 
@@ -1640,6 +1652,11 @@ def activate_logging():
     test_logger.setLevel(logging.INFO)
     test_logger.propagate = False
 
+def logging_enabled() -> bool:
+    """Return True if iotest logging is active."""
+    return (test_logger.hasHandlers()
+            and test_logger.getEffectiveLevel() >= logging.INFO)
+
 # This is called from script-style iotests without a single point of entry
 def script_initialize(*args, **kwargs):
     """Initialize script-style tests without running any tests."""
-- 
2.34.1


