Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4691106781
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 09:07:09 +0100 (CET)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY3y8-0000x1-J6
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 03:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iY3s5-0002yO-6I
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 03:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iY3rz-00007r-UW
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 03:00:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23452
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iY3rz-00007E-P6
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 03:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574409646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCU61u+GqUXLUmT+QA2tuhXLyqlWLyB7Zmg1NU+CZRk=;
 b=dZJ43e6UvxZBejdNdW9FaTXnUB72+BWlSWW2hksN17xyY1A6KfrLlVwOb3xWxQs0QordsV
 uSeeaxXjlTC+8iKlmWjg3MNZPfjRxIE3UwNhmCbwGRL0uAzySu5ImguVbFbpuVNxKupzOj
 xUkW8aC8vsEO01NjnlyQGE0oaxjMKjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-_QR7sY5NOaap47YNikMrUw-1; Fri, 22 Nov 2019 03:00:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70195DC23;
 Fri, 22 Nov 2019 08:00:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 190C976FE5;
 Fri, 22 Nov 2019 08:00:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F43511366CC; Fri, 22 Nov 2019 09:00:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] util/cutils: Fix incorrect integer->float conversion
 caught by clang
Date: Fri, 22 Nov 2019 09:00:39 +0100
Message-Id: <20191122080039.12771-3-armbru@redhat.com>
In-Reply-To: <20191122080039.12771-1-armbru@redhat.com>
References: <20191122080039.12771-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _QR7sY5NOaap47YNikMrUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Fangrui Song <i@maskray.me>, richard.henderson@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fangrui Song <i@maskray.me>

Clang does not like do_strtosz()'s code to guard against overflow:

    qemu/util/cutils.c:245:23: error: implicit conversion from 'unsigned lo=
ng' to 'double' changes value from 18446744073709550592 to 1844674407370955=
1616 [-Werror,-Wimplicit-int-float-conversion]

The warning will be enabled by default in clang 10. It is not
available for clang <=3D 9.

val * mul >=3D 0xfffffffffffffc00 is indeed wrong.  0xfffffffffffffc00
is not representable exactly as double.  It's half-way between the
representable values 0xfffffffffffff800 and 0x10000000000000000.
Which one we get is implementation-defined.  Bad.

We want val * mul > (the largest uint64_t exactly representable as
double).  That's 0xfffffffffffff800.  Write it as nextafter(0x1p64, 0)
with a suitable comment.

Signed-off-by: Fangrui Song <i@maskray.me>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Patch split, commit message improved]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/cutils.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index fd591cadf0..77acadc70a 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -239,10 +239,12 @@ static int do_strtosz(const char *nptr, const char **=
end,
         goto out;
     }
     /*
-     * Values >=3D 0xfffffffffffffc00 overflow uint64_t after their trip
-     * through double (53 bits of precision).
+     * Values near UINT64_MAX overflow to 2**64 when converting to double
+     * precision.  Compare against the maximum representable double precis=
ion
+     * value below 2**64, computed as "the next value after 2**64 (0x1p64)=
 in
+     * the direction of 0".
      */
-    if ((val * mul >=3D 0xfffffffffffffc00) || val < 0) {
+    if ((val * mul > nextafter(0x1p64, 0)) || val < 0) {
         retval =3D -ERANGE;
         goto out;
     }
--=20
2.21.0


