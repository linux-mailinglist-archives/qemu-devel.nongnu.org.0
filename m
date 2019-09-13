Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A0B1BCD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 12:55:52 +0200 (CEST)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8jF1-0007Sk-Rj
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 06:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i8jBm-0003cQ-Fv
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i8jBl-0005zu-HL
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:52:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53978)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i8jBh-0005wB-Hk; Fri, 13 Sep 2019 06:52:25 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8E6D21DA4;
 Fri, 13 Sep 2019 10:52:23 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E953600CE;
 Fri, 13 Sep 2019 10:52:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Sep 2019 12:52:05 +0200
Message-Id: <20190913105205.7581-3-philmd@redhat.com>
In-Reply-To: <20190913105205.7581-1-philmd@redhat.com>
References: <20190913105205.7581-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 13 Sep 2019 10:52:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] trace: Forbid event format ending with
 newline character
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Event format ending with newlines confuse the trace reports.
Forbid them.

Add a check to refuse new format added with trailing newline:

  $ make
  [...]
    GEN     hw/misc/trace.h
  Traceback (most recent call last):
    File "scripts/tracetool.py", line 152, in <module>
      main(sys.argv)
    File "scripts/tracetool.py", line 143, in main
      events.extend(tracetool.read_events(fh, arg))
    File "scripts/tracetool/__init__.py", line 367, in read_events
      event =3D Event.build(line)
    File "scripts/tracetool/__init__.py", line 281, in build
      raise ValueError("Event format can not end with a newline character=
")
  ValueError: Error at hw/misc/trace-events:121: Event format can not end=
 with a newline character

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 docs/devel/tracing.txt        | 2 ++
 scripts/tracetool/__init__.py | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/docs/devel/tracing.txt b/docs/devel/tracing.txt
index 76e492a489..8231bbf5d1 100644
--- a/docs/devel/tracing.txt
+++ b/docs/devel/tracing.txt
@@ -112,6 +112,8 @@ Trace events should use types as follows:
 Format strings should reflect the types defined in the trace event.  Tak=
e
 special care to use PRId64 and PRIu64 for int64_t and uint64_t types,
 respectively.  This ensures portability between 32- and 64-bit platforms=
.
+Format strings must not end with a newline character.  It is the respons=
ibility
+of backends to adapt line ending for proper logging.
=20
 Each event declaration will start with the event name, then its argument=
s,
 finally a format string for pretty-printing. For example:
diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.p=
y
index 6fca674936..57df74e67c 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -277,6 +277,9 @@ class Event(object):
         if fmt.find("%m") !=3D -1 or fmt_trans.find("%m") !=3D -1:
             raise ValueError("Event format '%m' is forbidden, pass the e=
rror "
                              "as an explicit trace argument")
+        if fmt.endswith("\\n\""):
+            raise ValueError("Event format must not end with a newline "
+                             "character")
=20
         if len(fmt_trans) > 0:
             fmt =3D [fmt_trans, fmt]
--=20
2.20.1


