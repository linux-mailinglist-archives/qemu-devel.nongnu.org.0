Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E37919C96C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 21:08:39 +0200 (CEST)
Received: from localhost ([::1]:46306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK5Cc-00048V-Jt
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 15:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jK5Aw-0002P3-Rl
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 15:06:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jK5Av-0000Hh-TL
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 15:06:50 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45739
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jK5Av-0000H7-PY
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 15:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585854409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDM3glSSSSp/hmegWVLuNV4TSCzdkttW5HQPD+qQA8E=;
 b=XEB4KeJnpbtCnw0dDvOYZ6iXF50TGw4yROmMoIM/ochnHv586NKOMNv47AjAdGjTzi3qKL
 IsP/njQWJ/OAGymeYW7lkb113kgys0MerVnmIblX5DhkDkXKX+/uqdJd0dkW5+WopUVkSw
 O9QascE7FS0IVrLpF1lB5ypoICcDgRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-QELR6jvKOu6H1-bjkBzAqw-1; Thu, 02 Apr 2020 15:06:47 -0400
X-MC-Unique: QELR6jvKOu6H1-bjkBzAqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 637DD107ACC4
 for <qemu-devel@nongnu.org>; Thu,  2 Apr 2020 19:06:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 795FD50BEE;
 Thu,  2 Apr 2020 19:06:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] softmmu: fix crash with invalid -M memory-backend=
Date: Thu,  2 Apr 2020 15:06:29 -0400
Message-Id: <20200402190640.1693-5-pbonzini@redhat.com>
In-Reply-To: <20200402190640.1693-1-pbonzini@redhat.com>
References: <20200402190640.1693-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Fixes: fe64d06afc1c5d895f220c268cfe4d5f1e65d44e ("vl.c: ensure that
ram_size matches size of machine.memory-backend")
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200309145155.168942-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index a331fb5321..796a77e234 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4298,6 +4298,11 @@ void qemu_init(int argc, char **argv, char **envp)
=20
         backend =3D object_resolve_path_type(current_machine->ram_memdev_i=
d,
                                            TYPE_MEMORY_BACKEND, NULL);
+        if (!backend) {
+            error_report("Memory backend '%s' not found",
+                         current_machine->ram_memdev_id);
+            exit(EXIT_FAILURE);
+        }
         backend_size =3D object_property_get_uint(backend, "size",  &error=
_abort);
         if (have_custom_ram_size && backend_size !=3D ram_size) {
                 error_report("Size specified by -m option must match size =
of "
--=20
2.18.2



