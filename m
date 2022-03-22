Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791EF4E3E18
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:07:03 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdHy-0002mk-IN
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:07:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8S-0002YT-Dp
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8R-0006S7-0V
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WogYTUP1vS1ERQbFHwX1HKelUZkM4XJNsONZrTURogA=;
 b=YEhZb/WgnyUcGJVO8j6LIZts1oWA+6qNTQLj35GJvwU0ytzwTH4Eog+Qvmtp5v8FnnObT7
 0lzO4bNUVneyDqHOVEe52GitPK2KHjoJHwjcV3JAoR5Ug1JNTow/tX8RY2SF3uXnrtURGo
 hloDg8jSikwjHM6ByEXdgJwdgKnreno=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-PaVa0EArM2-I6U1WDeFQhw-1; Tue, 22 Mar 2022 07:57:07 -0400
X-MC-Unique: PaVa0EArM2-I6U1WDeFQhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F05843C16181;
 Tue, 22 Mar 2022 11:57:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACD8D40C1257;
 Tue, 22 Mar 2022 11:57:06 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/25] iotests: add qemu_img_json()
Date: Tue, 22 Mar 2022 12:56:33 +0100
Message-Id: <20220322115647.726044-12-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

qemu_img_json() is a new helper built on top of qemu_img() that tries to
pull a valid JSON document out of the stdout stream.

In the event that the return code is negative (the program crashed), or
the code is greater than zero and did not produce valid JSON output, the
VerboseProcessError raised by qemu_img() is re-raised.

In the event that the return code is zero but we can't parse valid JSON,
allow the JSON deserialization error to be raised.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20220321201618.903471-7-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.35.1


