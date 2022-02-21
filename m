Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397BD4BED4D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:39:22 +0100 (CET)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHKz-0004he-AK
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:39:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGH-00081A-QJ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGF-00088W-OC
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxwUROcozBuy9pQwmJ/gNNr5A1jRd8gT5aI4WeCLmO0=;
 b=PZtTkKTRVPSyYCPtKz7U9ykGAaiHbRBbSR8X9Z4oSyU9J/8r9llC1wAMQ8V5kcnPWFD1W6
 4q3dpf1Bfi0vHmiC2IScyudoDPq8pc/Oid/r1+6QNFaAeKBDMJTmoZo/lcnRFIaPEXKGmz
 rfTo5AD8wEN0Rjnxjg6EZ0eZGKqrpsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-PK4RKkOKPPq4iyQ10zhW1A-1; Mon, 21 Feb 2022 17:34:25 -0500
X-MC-Unique: PK4RKkOKPPq4iyQ10zhW1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4F891006AA0;
 Mon, 21 Feb 2022 22:34:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A80801038AAF;
 Mon, 21 Feb 2022 22:34:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/18] iotests: add qemu_img_json()
Date: Mon, 21 Feb 2022 17:34:01 -0500
Message-Id: <20220221223413.2123003-7-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A little helper built on top of qemu_img() that tries to pull a valid
JSON document out of the stdout stream.

In the event that the return code is negative (the program crashed), or
the code is greater than zero and did not produce valid JSON output, the
VerboseProcessError raised by qemu_img is re-raised instead.

In the event that the return code is zero but we can't parse valid JSON,
allow the JSON deserialization error to be raised.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 24765de2e27..1e6947b893b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -309,6 +309,41 @@ def ordered_qmp(qmsg, conv_keys=True):
 def qemu_img_create(*args: str) -> subprocess.CompletedProcess[str]:
     return qemu_img('create', *args)
 
+def qemu_img_json(*args: str) -> Any:
+    """
+    Run qemu-img and return its output as deserialized JSON.
+
+    :raise CalledProcessError:
+        When qemu-img crashes, or returns a non-zero exit code without
+        producing a valid JSON document to stdout.
+    :raise JSONDecoderError:
+        When qemu-img returns 0, but failed to produce a valid JSON document.
+    """
+    json_data = ...  # json.loads can legitimately return 'None'.
+
+    try:
+        res = qemu_img(*args, combine_stdio=False)
+    except subprocess.CalledProcessError as exc:
+        # Terminated due to signal. Don't bother.
+        if exc.returncode < 0:
+            raise
+
+        # Commands like 'check' can return failure (exit codes 2 and 3)
+        # to indicate command completion, but with errors found. For
+        # multi-command flexibility, ignore the exact error codes and
+        # *try* to load JSON.
+        try:
+            json_data = json.loads(exc.stdout)
+        except json.JSONDecodeError:
+            pass  # Nope. This thing is toast.
+
+        if json_data is ...:
+            raise
+
+    if json_data is ...:
+        json_data = json.loads(res.stdout)
+    return json_data
+
 def qemu_img_measure(*args):
     return json.loads(qemu_img_pipe("measure", "--output", "json", *args))
 
-- 
2.34.1


