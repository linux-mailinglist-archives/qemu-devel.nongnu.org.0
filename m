Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5B9146244
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 08:06:47 +0100 (CET)
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuWZi-0004se-1j
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 02:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iuWYl-0004N9-L3
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iuWYj-0002lw-He
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:05:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32412
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iuWYj-0002lE-D5
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579763144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ho4EuNIwz+qMZz8j+k0hSslfeZ7b0IRZyFcFFkVc2Jk=;
 b=VWntzjpO5X/A930r/qpBP5+kv+ET/C3FJEAAL3M6vDdYJy8EQBlISdjXltSHSkWwmb1CQC
 zud2KdT0D9l2JUPav7cw+K2C0wCnPvZmhF6LKlryh3NPwKOCWOw08mkqC/t50dHXpSQivL
 00SvVvRGk0arOYFzU+w5Qs43gHdGX0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-eq38vSVwNI246i07EAgrHQ-1; Thu, 23 Jan 2020 02:05:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24A8E10054E3;
 Thu, 23 Jan 2020 07:05:41 +0000 (UTC)
Received: from thuth.com (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BD9C60BE0;
 Thu, 23 Jan 2020 07:05:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH] target/s390x/translate: Do not leak stack address in
 translate_one()
Date: Thu, 23 Jan 2020 08:05:33 +0100
Message-Id: <20200123070533.19699-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: eq38vSVwNI246i07EAgrHQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code in translate_one() leaks a stack address via "s->field" parameter:

 static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 {
     DisasJumpType ret =3D DISAS_NEXT;
     DisasFields f;
     [...]
     s->fields =3D &f;
     [...]
     return ret;
 }

It's currently harmless since the caller does not seem to use "fields"
anymore, but let's better play safe (and please static code analyzers)
by setting the fields back to NULL before returning.

Buglink: https://bugs.launchpad.net/qemu/+bug/1661815
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 4292bb0dd0..9122fb36da 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6435,6 +6435,8 @@ static DisasJumpType translate_one(CPUS390XState *env=
, DisasContext *s)
     }
 #endif
=20
+    s->fields =3D NULL;
+
     /* Advance to the next instruction.  */
     s->base.pc_next =3D s->pc_tmp;
     return ret;
--=20
2.18.1


