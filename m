Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F5D14AC1A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 23:35:32 +0100 (CET)
Received: from localhost ([::1]:51747 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwCyh-0001ZI-1t
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 17:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47161)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwCwo-0008SZ-R1
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:33:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwCwn-0002x4-PL
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:33:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwCwn-0002wX-MB
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 17:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580164413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otdJVMDrg+1C0Xq3VyzKNN57v5+jFNayKSkPc6ErlFc=;
 b=FCAdkGTev3C4Wmb8KNk40GUywXH/oJHOTyOvIZQoEZNarUwlOil2/FS61GYPgCW6DRLX7g
 zRCUJnCGsuMuusRvKGVLoQxErzCV3cbDsITBiSTlOCU6jG+e1LP9oTbIa2wWFxFkMCz98q
 zBJz1SyEEmotvWG/Derhd7H++/VK0hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-Ka7sJLaSOpKI4SzAP-m4CQ-1; Mon, 27 Jan 2020 17:33:31 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6479800D48
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 22:33:30 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B47443B7;
 Mon, 27 Jan 2020 22:33:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/19] migration-test: Use g_free() instead of free()
Date: Mon, 27 Jan 2020 23:33:03 +0100
Message-Id: <20200127223321.2742-2-quintela@redhat.com>
In-Reply-To: <20200127223321.2742-1-quintela@redhat.com>
References: <20200127223321.2742-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Ka7sJLaSOpKI4SzAP-m4CQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/qtest/migration-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 26e2e77289..b6a74a05ce 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1291,7 +1291,7 @@ static void test_multifd_tcp(void)
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
     test_migrate_end(from, to, true);
-    free(uri);
+    g_free(uri);
 }
=20
 int main(int argc, char **argv)
--=20
2.24.1


