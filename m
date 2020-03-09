Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7433917E2C8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 15:55:00 +0100 (CET)
Received: from localhost ([::1]:44258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBJo3-0003Ln-Ix
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 10:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57814)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1jBJlD-00004q-KY
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:52:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1jBJlC-0001lt-OL
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:52:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40561
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1jBJlC-0001lg-LC
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583765522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pYKdxrjryGt0WdprCsuBcyDM5EOm1nNMBB46yKsk50Y=;
 b=A+9iYWIPzgB+zCL/jgP9NJOtIDeCDL9kOJTPP8yN0+8I+N6l31efh7QGposObq2BBNrE4J
 VtQOPlfdhIpRQ39OtUhVSOSyIg5WfstxmQ9e0+TIck4FBQKf/daeKSe3Uy4MSY419hzU5C
 rJterEkK4lSfAZJx9pTznklE6BNh4Tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-Ad80-xYrMJyVm34lQwIfnA-1; Mon, 09 Mar 2020 10:52:00 -0400
X-MC-Unique: Ad80-xYrMJyVm34lQwIfnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1A91DB75
 for <qemu-devel@nongnu.org>; Mon,  9 Mar 2020 14:51:59 +0000 (UTC)
Received: from localhost (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF9BE2718F;
 Mon,  9 Mar 2020 14:51:56 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu: fix crash with invalid -M memory-backend=
Date: Mon,  9 Mar 2020 15:51:55 +0100
Message-Id: <20200309145155.168942-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: imammedo@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: fe64d06afc1c5d895f220c268cfe4d5f1e65d44e ("vl.c: ensure that
ram_size matches size of machine.memory-backend")
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 softmmu/vl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5549f4b619..38e9c404f2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4287,6 +4287,11 @@ void qemu_init(int argc, char **argv, char **envp)
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
2.25.0.rc2.1.g09a9a1a997


