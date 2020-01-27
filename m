Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F414A5A9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 15:04:02 +0100 (CET)
Received: from localhost ([::1]:45710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw4zh-0005iX-8E
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 09:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iw4yg-00057r-0F
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:02:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iw4yd-0001ET-GH
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:02:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50876
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iw4yd-0001Ae-1A
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 09:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580133774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5LIVx1f+8fMGBTfLAnXnB1uwqs+4uNhf7K1YgWiRV2s=;
 b=MLUJ2bmLO1YpJRY6KvAiEisi+4GcwU16fec+k+ybPQ51euskJExBklnEXAJW+sxoLYLQDS
 6MqfGLo257ET8hhw1oNqv10UBG1R8QPWDnbNQzGtWHmymcl7cAcdC8O8Uo5HgoKgXVGOdn
 NWJ2AhoqyrKxOf52bk6jax9SQXCh1EQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-hhQV-4QGM2WUdlfDj0Ydag-1; Mon, 27 Jan 2020 09:02:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D223A1005510;
 Mon, 27 Jan 2020 14:02:50 +0000 (UTC)
Received: from thuth.com (ovpn-117-94.ams2.redhat.com [10.36.117.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43F6A86441;
 Mon, 27 Jan 2020 14:02:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/Makefile: Fix inclusion of the qos dependency files
Date: Mon, 27 Jan 2020 15:02:45 +0100
Message-Id: <20200127140245.20065-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: hhQV-4QGM2WUdlfDj0Ydag-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qos dependency files can be found under tests/qtest/libqos and
not under tests/qtest/qos.

Fixes: 1cf4323ecd0 ("Move the libqos files under tests/qtest/")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index c6827ce8c2..4ee68ca7dd 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -917,6 +917,6 @@ all: $(QEMU_IOTESTS_HELPERS-y)
=20
 -include $(wildcard tests/*.d)
 -include $(wildcard tests/qtest/*.d)
--include $(wildcard tests/qtest/qos/*.d)
+-include $(wildcard tests/qtest/libqos/*.d)
=20
 endif
--=20
2.18.1


