Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E6F15564E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 12:04:32 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j01R0-00065b-O1
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 06:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j01Po-0005WZ-V2
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j01Po-000869-1R
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:03:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54998
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j01Pn-000860-Se
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581073395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mqWybM8Iuen1mTi2efA/ZOh6zXpQGOQ/ZBqfKEIS7iI=;
 b=DIzxCqkzeGNJXwjoxHvMT+g75B4QZwCasSezgZh2dh2G8Ll1L9/S4631u9mjwDPAf8Mcx2
 U7q83t/e36XuytHHUMFUTfnxFqECgMHZGE15HGXuM4RmlTaFDBZL9xbwo+i9a6Gy1pGJDQ
 Vr8gYhj3XQvg9O0D7QbL+GccEL1cWHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-IAeEhJVINTiP0roittwfrg-1; Fri, 07 Feb 2020 06:03:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 258F21800D42;
 Fri,  7 Feb 2020 11:03:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DF1E1001B09;
 Fri,  7 Feb 2020 11:03:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: Abort if multiple machines are registered as default
Date: Fri,  7 Feb 2020 12:02:59 +0100
Message-Id: <20200207110259.12544-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: IAeEhJVINTiP0roittwfrg-1
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It would be confusing to have multiple default machines.
Abort if this ever occurs.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 vl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/vl.c b/vl.c
index 7dcb0879c4..da828188eb 100644
--- a/vl.c
+++ b/vl.c
@@ -2354,6 +2354,8 @@ static MachineClass *machine_parse(const char *name, =
GSList *machines)
     GSList *el;
=20
     if (is_help_option(name)) {
+        int default_count =3D 0;
+
         printf("Supported machines are:\n");
         machines =3D g_slist_sort(machines, machine_class_cmp);
         for (el =3D machines; el; el =3D el->next) {
@@ -2364,6 +2366,11 @@ static MachineClass *machine_parse(const char *name,=
 GSList *machines)
             printf("%-20s %s%s%s\n", mc->name, mc->desc,
                    mc->is_default ? " (default)" : "",
                    mc->deprecation_reason ? " (deprecated)" : "");
+            default_count +=3D !!mc->is_default;
+        }
+        if (default_count > 1) {
+            error_printf("Multiple default machines available\n");
+            abort();
         }
         exit(0);
     }
--=20
2.21.1


