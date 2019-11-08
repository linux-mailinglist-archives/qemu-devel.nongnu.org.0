Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE7F4F3E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 16:18:29 +0100 (CET)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT61r-0003EH-L8
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 10:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iT5pR-0006Cg-LH
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:05:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iT5pQ-0005xT-Me
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:05:37 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41901
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iT5pQ-0005wD-Iq
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573225536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i/jhfPVbaw9zN74ATSitQu5mKIuSj4RbYiPEOhbuIgk=;
 b=h4QBm4PQ4oHnHvWWjC3E1hdOuRJPur98hg8b6i8H1SN++V9nkmNzHFdxujwWsPCUJvdsup
 8eKnMgSWress1GaNC9w4hTW01oONjEEWmkdVUseFkCya2yZRfOIIm2up6qHSUorOjvrzTm
 +dKIfUCStIz/pSDMgXYAnVatE4/6Up4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-2x3jsTa_OLCb6WVECiCvHQ-1; Fri, 08 Nov 2019 10:05:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F268A107ACC4
 for <qemu-devel@nongnu.org>; Fri,  8 Nov 2019 15:05:33 +0000 (UTC)
Received: from localhost (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E1B66084E;
 Fri,  8 Nov 2019 15:05:26 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/25] object: add g_autoptr support
Date: Fri,  8 Nov 2019 19:01:16 +0400
Message-Id: <20191108150123.12213-19-marcandre.lureau@redhat.com>
In-Reply-To: <20191108150123.12213-1-marcandre.lureau@redhat.com>
References: <20191108150123.12213-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 2x3jsTa_OLCb6WVECiCvHQ-1
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

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qom/object.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index 128d00c77f..f96a44be64 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1747,4 +1747,7 @@ Object *container_get(Object *root, const char *path)=
;
  * Returns the instance_size of the given @typename.
  */
 size_t object_type_get_instance_size(const char *typename);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(Object, object_unref)
+
 #endif
--=20
2.24.0


