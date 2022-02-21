Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521F4BED7D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:56:18 +0100 (CET)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHbN-0008VU-HF
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:56:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGn-0001Ci-Mf
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGl-0008FS-L1
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1mM3CYvKVw8MvI6SwLl612hl5JXG/ZjVwkIWrbkYTE=;
 b=T6mfgVjbmBwKyKmbFxsQQ562F0QcgdgXIyWWdTG7no2U2KEIEc3reOsV5pkEuLYGOX+yGx
 eSvfEdIX5c9OunpfToFZA+tnPh2w1VPbBp97L8ZHsUTKkIEcwLBaR5SAb1++MvI6f2S1t/
 2PLbgO/rnhU8ZJBW5yy4KZ74kBvcH/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-9ZPLgEZVOpKFuYTsfBHXzg-1; Mon, 21 Feb 2022 17:34:48 -0500
X-MC-Unique: 9ZPLgEZVOpKFuYTsfBHXzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B66C11E10;
 Mon, 21 Feb 2022 22:34:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7EC51038AAF;
 Mon, 21 Feb 2022 22:34:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/18] iotests: make qemu_img_log() check log level
Date: Mon, 21 Feb 2022 17:34:12 -0500
Message-Id: <20220221223413.2123003-18-jsnow@redhat.com>
In-Reply-To: <20220221223413.2123003-1-jsnow@redhat.com>
References: <20220221223413.2123003-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improve qemu_img_log() to actually check if logging is turned on. If it
isn't, revert to the behavior of qemu_img(). This is done so that there
really is no way to avoid scrutinizing qemu-ing subprocess calls by
accident. You're gonna have to work for it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6da6890596c..0519b2a8019 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -348,7 +348,13 @@ def qemu_img_map(*args: str) -> Any:
     return qemu_img_json('map', "--output", "json", *args)
 
 def qemu_img_log(*args: str) -> subprocess.CompletedProcess[str]:
-    result = qemu_img(*args, check=False)
+    """
+    Logged, unchecked variant of qemu_img() that allows non-zero exit codes.
+
+    If logging is perceived to be disabled, this function will behave
+    like qemu_img() and prohibit non-zero return codes.
+    """
+    result = qemu_img(*args, check=not logging_enabled())
     log(result.stdout, filters=[filter_testfiles])
     return result
 
@@ -1635,6 +1641,11 @@ def activate_logging():
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


