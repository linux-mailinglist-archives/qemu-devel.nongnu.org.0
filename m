Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB61453D30
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 01:37:18 +0100 (CET)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn8wv-0000ZH-J3
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 19:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8uD-0006hD-3K
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8uB-0006yI-KX
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637109266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziGqGC4r5w99xVhSdX7pV7nmFe5VlZNHpkcB/GG1apg=;
 b=TRmvT9yLMufSTR/MZSs+yKukglYogonedo4tlZHgpOnLAP1tLZcyXw9GPKdOc7G66pnMu2
 D8xj2Inz4948UFT1H784QfqICLf8Nsr9EdiWFl85senWHjSkafc4kGMJwfPuXokuZeI74i
 SQBdhV+JxZq7y8r1OS/g+TAxVSkpsho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-D0NnQVWuNO2A55Xw-HJSqg-1; Tue, 16 Nov 2021 19:34:23 -0500
X-MC-Unique: D0NnQVWuNO2A55Xw-HJSqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32FBD804140;
 Wed, 17 Nov 2021 00:34:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A09267842;
 Wed, 17 Nov 2021 00:34:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] python/aqmp: fix ConnectError string method
Date: Tue, 16 Nov 2021 19:33:14 -0500
Message-Id: <20211117003317.2844087-3-jsnow@redhat.com>
In-Reply-To: <20211117003317.2844087-1-jsnow@redhat.com>
References: <20211117003317.2844087-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When ConnectError is used to wrap an Exception that was initialized
without an error message, we are treated to a traceback with a rubbish
line like this:

... ConnectError: Failed to establish session:

Correct this to use the name of an exception as a fallback message:

... ConnectError: Failed to establish session: EOFError

Better!

Signed-off-by: John Snow <jsnow@redhat.com>
Reported-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-id: 20211111143719.2162525-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 860b79512d..5190b33b13 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -79,7 +79,11 @@ def __init__(self, error_message: str, exc: Exception):
         self.exc: Exception = exc
 
     def __str__(self) -> str:
-        return f"{self.error_message}: {self.exc!s}"
+        cause = str(self.exc)
+        if not cause:
+            # If there's no error string, use the exception name.
+            cause = exception_summary(self.exc)
+        return f"{self.error_message}: {cause}"
 
 
 class StateError(AQMPError):
-- 
2.31.1


