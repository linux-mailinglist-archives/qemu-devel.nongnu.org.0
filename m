Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE85F4F0F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 16:15:03 +0100 (CET)
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT5yY-0000Lb-4D
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 10:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iT5qB-0007O2-09
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:06:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iT5qA-0006jT-1H
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:06:22 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47117
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iT5q9-0006j1-Tj
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573225581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTE5AxWhHFArGW+tZpivPFPM3d7d8XOs49LHe2Qq4Fk=;
 b=Zbua80ZVjo98chTLG2HFbjCz1CzZmxhqRDL5Hkzo7LVEuHYL2kWJlPJO0LtRavkAacHBLo
 e9KCzMZkcPSq8gnedllgVaPztZRoLLrPtPjgJbOGQbPwesVj+K5ciHOK5QG7wkjDWam+f7
 XZbRWV3lqIecAzsUNpNHFZt32UZ1tu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-p0XitW--PeaYvSuDLBzJ1g-1; Fri, 08 Nov 2019 10:06:20 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FE31800C72
 for <qemu-devel@nongnu.org>; Fri,  8 Nov 2019 15:06:19 +0000 (UTC)
Received: from localhost (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BFB860BE2;
 Fri,  8 Nov 2019 15:06:12 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 21/25] screendump: use qemu_unlink()
Date: Fri,  8 Nov 2019 19:01:19 +0400
Message-Id: <20191108150123.12213-22-marcandre.lureau@redhat.com>
In-Reply-To: <20191108150123.12213-1-marcandre.lureau@redhat.com>
References: <20191108150123.12213-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: p0XitW--PeaYvSuDLBzJ1g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 armbru@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't attempt to remove /dev/fdset files.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
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
2.24.0


