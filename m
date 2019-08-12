Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390F8AB69
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 01:47:26 +0200 (CEST)
Received: from localhost ([::1]:48784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxK29-0000zK-PJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 19:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hxK1L-0000ZA-P6
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 19:46:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hxK1K-0000WY-6H
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 19:46:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56242)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hxK1K-0000WC-1S
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 19:46:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 15E7A3086262;
 Mon, 12 Aug 2019 23:46:33 +0000 (UTC)
Received: from localhost (ovpn-121-66.rdu2.redhat.com [10.10.121.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C532721E9;
 Mon, 12 Aug 2019 23:46:32 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Aug 2019 20:46:30 -0300
Message-Id: <20190812234630.22814-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 12 Aug 2019 23:46:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] HACKING: Document 'struct' keyword usage
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes we use the 'struct' keyword in headers to help us
reduce dependencies between header files.  Document that
practice.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Use paragraphs written by Paolo Bonzini at
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg586214.html
* Fix typos spotted by Thomas Huth
---
 HACKING | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/HACKING b/HACKING
index 0fc3e0fc04..035276e668 100644
--- a/HACKING
+++ b/HACKING
@@ -100,7 +100,19 @@ pointer, you're guaranteed that it is used to modify=
 the storage
 it points to, or it is aliased to another pointer that is.
=20
 2.3. Typedefs
-Typedefs are used to eliminate the redundant 'struct' keyword.
+
+Typedefs are used to eliminate the redundant 'struct' keyword, since typ=
e
+names have a different style than other identifiers ("CamelCase" versus
+"snake_case").  Each struct should have a CamelCase name and a
+corresponding typedef.
+
+Since certain C compilers choke on duplicated typedefs, you should avoid
+them and declare a typedef only in one header file.  For common types,
+you can use "include/qemu/typedefs.h" for example.  However, as a matter
+of convenience it is also perfectly fine to use forward struct
+definitions instead of typedefs in headers and function prototypes; this
+avoids problems with duplicated typedefs and reduces the need to include
+headers from other headers.
=20
 2.4. Reserved namespaces in C and POSIX
 Underscore capital, double underscore, and underscore 't' suffixes shoul=
d be
--=20
2.21.0


