Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243815064C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 13:42:56 +0100 (CET)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyb43-0003AF-Iv
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 07:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iyazj-0004B0-U4
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iyazi-0005uV-33
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59265
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iyazh-0005uA-Vx
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580733505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIemPolUT38Is5SWfiN804eHYytqt4bZltyZqQFpz30=;
 b=gjpHx7RJcNuHTRL+Oe3ENzAiBfs4Ajp3qXF5WYTXo0rIhVl7cnsRDmgTdPd4mlgYqi0FF2
 9yVD1zVQIzjrj8AH1E3Oh0vEmKO0WBvacLtvWPMkv3Uedqqfgs1R53p3vbhoqDxXvQKlOv
 i9yd3cNQGLNfZFuk8M6WIwg/9RzizL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-wJl7HVPKNaegpp5YFVfJBw-1; Mon, 03 Feb 2020 07:38:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E248107ACC4;
 Mon,  3 Feb 2020 12:38:22 +0000 (UTC)
Received: from thuth.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AEA2196B1;
 Mon,  3 Feb 2020 12:38:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/13] tests/Makefile: Fix inclusion of the qos dependency files
Date: Mon,  3 Feb 2020 13:38:02 +0100
Message-Id: <20200203123811.8651-5-thuth@redhat.com>
In-Reply-To: <20200203123811.8651-1-thuth@redhat.com>
References: <20200203123811.8651-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wJl7HVPKNaegpp5YFVfJBw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qos dependency files can be found under tests/qtest/libqos and
not under tests/qtest/qos.

Fixes: 1cf4323ecd0 ("Move the libqos files under tests/qtest/")
Message-Id: <20200127140245.20065-1-thuth@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index fe63fec5f1..2f1cafed72 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -919,6 +919,6 @@ all: $(QEMU_IOTESTS_HELPERS-y)
=20
 -include $(wildcard tests/*.d)
 -include $(wildcard tests/qtest/*.d)
--include $(wildcard tests/qtest/qos/*.d)
+-include $(wildcard tests/qtest/libqos/*.d)
=20
 endif
--=20
2.18.1


