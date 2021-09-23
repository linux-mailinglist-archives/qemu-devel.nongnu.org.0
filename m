Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746334154DA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:54:09 +0200 (CEST)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTD04-0007vy-C2
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCw3-0001Ge-6a
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCw1-0006OK-A1
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dU/r0t/0vjkEeSd+fCLLYbMrGD+EDPg/s9TcTTG+zWo=;
 b=a7DgLn4lEQBQpEXTTAgEFsN1MEQ9fcJ7ENSEKovi7uE2HKwKxGCkma8SkeSV9bis9CJ4/Q
 xmjo1prp5iyD0Muh5IlDo02v1rhQk0r3lfit4luHampCE3mg6WuNl3xFnoAVpBLnSmWt6W
 NuTS26y4vTQvi863bYmDfwU5wEwLS34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-mz1PtaVLOdyIpG12MTV9gA-1; Wed, 22 Sep 2021 20:49:53 -0400
X-MC-Unique: mz1PtaVLOdyIpG12MTV9gA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A869802B9E;
 Thu, 23 Sep 2021 00:49:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F5B760BF1;
 Thu, 23 Sep 2021 00:49:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/17] python/aqmp: Reduce severity of EOFError-caused loop
 terminations
Date: Wed, 22 Sep 2021 20:49:27 -0400
Message-Id: <20210923004938.3999963-7-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we encounter an EOFError, we don't know if it's an "error" in the
perspective of the user of the library yet. Therefore, we should not log
it as an error. Reduce the severity of this logging message to "INFO" to
indicate that it's something that we expect to occur during the normal
operation of the library.

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


