Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA1D12E5F7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 13:02:11 +0100 (CET)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imzB4-0000ui-Pn
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 07:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47707)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1imz5v-0003Jd-3L
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:56:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1imz5u-0007mP-3I
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:56:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25364
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1imz5t-0007mI-VQ
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577966209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uy7YsceqeObUlt59EYv1aZgf34yb/zm3rnX0WXuRV7M=;
 b=T8XKDhna+V0czpb49ApP1rzxwduJBP38peOUdEQoVIkqOr+9VRJztjk/6rzThpZcuR9S+4
 7DssChM7D2RT6iDqCx9mWLxqoSjlO3eR9MYsqLSyVDBjiEgrchSbP4Dv8nI+7S1cg+fBVy
 q3mLsKz9P4k964v25NOvlUKmkZ1jT/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-i6Or8Zp_OlaCia1WHfKM0g-1; Thu, 02 Jan 2020 06:56:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5C89800D53
 for <qemu-devel@nongnu.org>; Thu,  2 Jan 2020 11:56:46 +0000 (UTC)
Received: from localhost (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C5B060BFB;
 Thu,  2 Jan 2020 11:56:39 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] screendump: use qemu_unlink()
Date: Thu,  2 Jan 2020 15:54:59 +0400
Message-Id: <20200102115459.854103-8-marcandre.lureau@redhat.com>
In-Reply-To: <20200102115459.854103-1-marcandre.lureau@redhat.com>
References: <20200102115459.854103-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: i6Or8Zp_OlaCia1WHfKM0g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't attempt to remove /dev/fdset files.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 ui/console.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/console.c b/ui/console.c
index 587edf4ed4..e6ac462aa0 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -381,7 +381,7 @@ void qmp_screendump(const char *filename, bool has_devi=
ce, const char *device,
     }
=20
     if (!ppm_save(fd, surface, errp)) {
-        unlink(filename);
+        qemu_unlink(filename);
     }
 }
=20
--=20
2.24.0.308.g228f53135a


