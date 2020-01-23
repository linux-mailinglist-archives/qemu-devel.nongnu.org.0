Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C2146E27
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 17:16:43 +0100 (CET)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuf9u-0004J8-7U
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 11:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iuctw-0000dz-5E
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:52:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iuctv-0000gf-0c
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:52:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38865
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iuctu-0000g4-U6
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579787522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdJ666D4ydfuLy4ZZ2nFXzl8hR3J4CpdJaKV4OmG/Ok=;
 b=KN7tCV7COqaMBqdszP08YfsbzuDOs9KJS1e8GN5bz8zkqcQCkPKikvXTAAsNKc5/0XWNYo
 p0O6dLQSQcDH9F+BY2pItZalYTbx1R6HaFL4GCGstXWhkhA7lklV6ObS6nkM55n2dgqzrq
 ARh4xy+iTsDKrcp/aoQB42khsW03v5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-aNQnZBdrOuusfQ1iA7llRQ-1; Thu, 23 Jan 2020 08:52:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 608558C272A
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 13:52:00 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B88208882F;
 Thu, 23 Jan 2020 13:51:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/59] object: add extra sanity checks
Date: Thu, 23 Jan 2020 14:50:21 +0100
Message-Id: <1579787449-27599-32-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1579787449-27599-1-git-send-email-pbonzini@redhat.com>
References: <1579787449-27599-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: aNQnZBdrOuusfQ1iA7llRQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Type system checked that children class_size >=3D parent class_size, but
not instances. Fix that.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200110153039.1379601-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qom/object.c b/qom/object.c
index 90155fa..dcb6863 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -307,6 +307,7 @@ static void type_initialize(TypeImpl *ti)
         int i;
=20
         g_assert(parent->class_size <=3D ti->class_size);
+        g_assert(parent->instance_size <=3D ti->instance_size);
         memcpy(ti->class, parent->class, parent->class_size);
         ti->class->interfaces =3D NULL;
         ti->class->properties =3D g_hash_table_new_full(
--=20
1.8.3.1



