Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA3136043
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 19:37:58 +0100 (CET)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipcgu-0007YA-6d
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 13:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ipcf8-0006B9-5k
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 13:36:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ipcf6-0003gU-Ba
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 13:36:05 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21211
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ipcf6-0003e2-6n
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 13:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578594963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5xlufII58IGsZmQb9Mg0KMnN8GeBQ9fWIG9wmRYcbY=;
 b=XqbEVTzMlm0OHLkB8bsWZsgbS0ScYxM3JKS9VQGsBX/C1EyjaJZL2vEgMNtObfpOrXi4YF
 mH9ER/U8NjNBQBkUhX/0SabCa0+doPPreoTUuhrmUq79SktdKV9ZU0f/CwE4X9r2Qv7CyB
 6giZlA+DV58DEhpisWF1UkyaBCxTsC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-RBC7j9-CPR-6k-N__TTITw-1; Thu, 09 Jan 2020 13:36:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D0C4477;
 Thu,  9 Jan 2020 18:36:01 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-193.ams2.redhat.com
 [10.36.117.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EA5F86CBF;
 Thu,  9 Jan 2020 18:35:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] block: Mark 'block_resize' as coroutine
Date: Thu,  9 Jan 2020 19:35:43 +0100
Message-Id: <20200109183545.27452-3-kwolf@redhat.com>
In-Reply-To: <20200109183545.27452-1-kwolf@redhat.com>
References: <20200109183545.27452-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: RBC7j9-CPR-6k-N__TTITw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, marcandre.lureau@gmail.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block_resize is safe to run in a coroutine, so use it as an example for
the new 'coroutine': true annotation in the QAPI schema.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7ff5e5edaf..1dbb2a9901 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1341,7 +1341,8 @@
 { 'command': 'block_resize',
   'data': { '*device': 'str',
             '*node-name': 'str',
-            'size': 'int' } }
+            'size': 'int' },
+  'coroutine': true }
=20
 ##
 # @NewImageMode:
--=20
2.20.1


