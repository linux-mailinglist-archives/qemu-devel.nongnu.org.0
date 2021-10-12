Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF8642AF4C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:49:24 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPeF-0006Q5-Tu
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYP-0005Nt-6E
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYM-0000Hp-WB
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634074998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNpyqlg6ZHgd6gwgEvCysMM+OiA2Km24Djn0s3fYwwQ=;
 b=jQddX3ai9zuw62qKO6jnOL41+TT+IytyYKdzqJi5vIsDTj4xqOiYG60s2UPkpiFo+XoYpI
 fwgVf36+LAk9nDL2eqsu77OqT/V8DF0xmFxXiNBn8eCf8mFtzq3hCf1CxMINT9fAvZdaoL
 eyyHNkpcU/qq795yuUv4luGwnqYCKxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-73Gk0nQaMvS6hPI8lFN2vg-1; Tue, 12 Oct 2021 17:43:14 -0400
X-MC-Unique: 73Gk0nQaMvS6hPI8lFN2vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B56B81808312;
 Tue, 12 Oct 2021 21:43:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96E485D6A8;
 Tue, 12 Oct 2021 21:43:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] python/aqmp: Reduce severity of EOFError-caused loop
 terminations
Date: Tue, 12 Oct 2021 17:41:48 -0400
Message-Id: <20211012214152.802483-7-jsnow@redhat.com>
In-Reply-To: <20211012214152.802483-1-jsnow@redhat.com>
References: <20211012214152.802483-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we encounter an EOFError, we don't know if it's an "error" in the
perspective of the user of the library yet. Therefore, we should not log
it as an error. Reduce the severity of this logging message to "INFO" to
indicate that it's something that we expect to occur during the normal
operation of the library.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210923004938.3999963-7-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 32e78749c11..ae1df240260 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -721,8 +721,11 @@ async def _bh_loop_forever(self, async_fn: _TaskFN, name: str) -> None:
             self.logger.debug("Task.%s: cancelled.", name)
             return
         except BaseException as err:
-            self.logger.error("Task.%s: %s",
-                              name, exception_summary(err))
+            self.logger.log(
+                logging.INFO if isinstance(err, EOFError) else logging.ERROR,
+                "Task.%s: %s",
+                name, exception_summary(err)
+            )
             self.logger.debug("Task.%s: failure:\n%s\n",
                               name, pretty_traceback())
             self._schedule_disconnect()
-- 
2.31.1


