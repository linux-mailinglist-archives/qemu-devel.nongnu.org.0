Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B1F4EAF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 15:47:59 +0100 (CET)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT5YM-0005vo-Sw
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 09:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iT5Rl-0007DD-9V
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:41:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iT5Rk-0000LE-05
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:41:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47868
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iT5Rj-0000KD-Sl
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 09:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573224067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/RURPPC+PX0XGwf6Gei0vsDMgKrYkulMKMaEFtT6vg=;
 b=WqkDksbAE1CqEqmdDFhAixrkmxDA3NRkYTrl+avlolsU8xPeD3gOgeEgh3MfJrNChIVDzC
 c0/C34cdRDfNZQkIc+jiqL9IjdLnGK/ZerNmAMP2ZhXHobvEMQaii4LIZ94zxiU3hZSy0S
 FDAYLghF/qTlAeJreV5tilIYq7f65Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-pJpqMIJ6PxKoNyqqQNIBtQ-1; Fri, 08 Nov 2019 09:41:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51B3A800A1A;
 Fri,  8 Nov 2019 14:41:03 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46E395D6AE;
 Fri,  8 Nov 2019 14:40:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eric Blake <eblake@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] trace: Forbid dynamic field width in event format
Date: Fri,  8 Nov 2019 15:40:42 +0100
Message-Id: <20191108144042.30245-4-philmd@redhat.com>
In-Reply-To: <20191108144042.30245-1-philmd@redhat.com>
References: <20191108144042.30245-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: pJpqMIJ6PxKoNyqqQNIBtQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since not all trace backends support dynamic field width in
format (dtrace via stap does not), forbid them.

Add a check to refuse field width in new formats:

  $ make
  [...]
    GEN     hw/block/trace.h
  Traceback (most recent call last):
    File "scripts/tracetool.py", line 152, in <module>
      main(sys.argv)
    File "scripts/tracetool.py", line 143, in main
      events.extend(tracetool.read_events(fh, arg))
    File "scripts/tracetool/__init__.py", line 371, in read_events
      event =3D Event.build(line)
    File "scripts/tracetool/__init__.py", line 285, in build
      raise ValueError("Event format must not contain field width '%*'")
  ValueError: Error at hw/block/trace-events:11: Event format must not cont=
ain field width '%*'

Reported-by: Eric Blake <eblake@redhat.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 scripts/tracetool/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 44c118bc2a..e239be602b 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -206,6 +206,7 @@ class Event(object):
                       "\s*"
                       "(?:(?:(?P<fmt_trans>\".+),)?\s*(?P<fmt>\".+))?"
                       "\s*")
+    _DFWRE =3D re.compile(".*(%0?\*).*")
=20
     _VALID_PROPS =3D set(["disable", "tcg", "tcg-trans", "tcg-exec", "vcpu=
"])
=20
@@ -280,6 +281,8 @@ class Event(object):
         if fmt.endswith(r'\n"'):
             raise ValueError("Event format must not end with a newline "
                              "character")
+        if Event._DFWRE.match(fmt):
+            raise ValueError("Event format must not contain field width '%=
*'")
=20
         if len(fmt_trans) > 0:
             fmt =3D [fmt_trans, fmt]
--=20
2.21.0


