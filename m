Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B904E31A4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:22:44 +0100 (CET)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOY7-0007Fk-7a
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:22:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS6-00062P-0p
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS2-0001jJ-8u
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KuQZ8eyxFjCMJhMaZ7g/FwZ1hsKMehLk+Q61/vfO4lg=;
 b=VWUVvahvduF0QsTIf6/8INpFMiOQiw1ekXPwaG365ZdSvRQe1XhmoUcoKGPWpZhXOu/SbR
 mbRoAFX3qvpnjK6gb0sVqaViY+OcYx6rEE+WXoD0D1lFiy38E3Sb3G28Eztr79PkBWsooO
 lGPWuvPemPsvdlsZ8JEy7T9WDZwzLKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-wntsam5UNu6GaeGBKVJnOQ-1; Mon, 21 Mar 2022 16:16:22 -0400
X-MC-Unique: wntsam5UNu6GaeGBKVJnOQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE743185A79C;
 Mon, 21 Mar 2022 20:16:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F649454D60;
 Mon, 21 Mar 2022 20:16:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/18] iotests: add qemu_img_json()
Date: Mon, 21 Mar 2022 16:16:06 -0400
Message-Id: <20220321201618.903471-7-jsnow@redhat.com>
In-Reply-To: <20220321201618.903471-1-jsnow@redhat.com>
References: <20220321201618.903471-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_img_json() is a new helper built on top of qemu_img() that tries to
pull a valid JSON document out of the stdout stream.

In the event that the return code is negative (the program crashed), or
the code is greater than zero and did not produce valid JSON output, the
VerboseProcessError raised by qemu_img() is re-raised.

In the event that the return code is zero but we can't parse valid JSON,
allow the JSON deserialization error to be raised.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/iotests.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 9351f9c6ac..56aa068277 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -277,6 +277,38 @@ def ordered_qmp(qmsg, conv_keys=True):
 def qemu_img_create(*args: str) -> 'subprocess.CompletedProcess[str]':
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
+
+    :return: A deserialized JSON object; probably a dict[str, Any].
+    """
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
+            return json.loads(exc.stdout)
+        except json.JSONDecodeError:
+            # Nope. This thing is toast. Raise the /process/ error.
+            pass
+        raise
+
+    return json.loads(res.stdout)
+
 def qemu_img_measure(*args):
     return json.loads(qemu_img_pipe("measure", "--output", "json", *args))
 
-- 
2.34.1


