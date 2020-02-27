Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6E170CFD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 01:09:23 +0100 (CET)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j76jy-00016P-Hu
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 19:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1j76hW-0004nR-W0
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:06:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1j76hV-0005o6-Ku
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:06:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21134
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1j76hV-0005mW-G0
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 19:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582762009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAWhedyGRj9dcXay2ibOcrLSLi59SGh1Ywce0Ex++Hw=;
 b=cPLuFQGlnGFlFKiFVVx0a5W8gW4XPm8LaKAVUntO5sgJSQrpttut56Zs3Xz8l8qqHWuObG
 bdWynG9B3q3ZiOyjhvmsOG4kwEkkf4sVmAt6gOb26H5ZSaQe76JvEmTI9r0NrYDisEi7/v
 ixg5/dsHAfZCGONH3kkpPR3iZyX2H2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-6J1aXl8YOY6PmHKB16nkYw-1; Wed, 26 Feb 2020 19:06:47 -0500
X-MC-Unique: 6J1aXl8YOY6PmHKB16nkYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DCF718FF660;
 Thu, 27 Feb 2020 00:06:46 +0000 (UTC)
Received: from probe.redhat.com (ovpn-123-58.rdu2.redhat.com [10.10.123.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4E37390;
 Thu, 27 Feb 2020 00:06:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/9] iotests: replace mutable list default args
Date: Wed, 26 Feb 2020 19:06:33 -0500
Message-Id: <20200227000639.9644-4-jsnow@redhat.com>
In-Reply-To: <20200227000639.9644-1-jsnow@redhat.com>
References: <20200227000639.9644-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's bad hygiene: if we modify this list, it will be modified across all
invocations.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index fdcf8a940c..9eb96561b6 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -136,7 +136,7 @@ def qemu_img_log(*args):
     log(result, filters=3D[filter_testfiles])
     return result
=20
-def img_info_log(filename, filter_path=3DNone, imgopts=3DFalse, extra_args=
=3D[]):
+def img_info_log(filename, filter_path=3DNone, imgopts=3DFalse, extra_args=
=3D()):
     args =3D ['info']
     if imgopts:
         args.append('--image-opts')
@@ -351,7 +351,7 @@ def _filter(_key, value):
         return value
     return filter_qmp(qmsg, _filter)
=20
-def log(msg, filters=3D[], indent=3DNone):
+def log(msg, filters=3D(), indent=3DNone):
     '''Logs either a string message or a JSON serializable message (like Q=
MP).
     If indent is provided, JSON serializable messages are pretty-printed.'=
''
     for flt in filters:
@@ -566,7 +566,7 @@ def get_qmp_events_filtered(self, wait=3D60.0):
             result.append(filter_qmp_event(ev))
         return result
=20
-    def qmp_log(self, cmd, filters=3D[], indent=3DNone, **kwargs):
+    def qmp_log(self, cmd, filters=3D(), indent=3DNone, **kwargs):
         full_cmd =3D OrderedDict((
             ("execute", cmd),
             ("arguments", ordered_qmp(kwargs))
@@ -968,7 +968,7 @@ def case_notrun(reason):
     open('%s/%s.casenotrun' % (output_dir, seq), 'a').write(
         '    [case not run] ' + reason + '\n')
=20
-def verify_image_format(supported_fmts=3D[], unsupported_fmts=3D[]):
+def verify_image_format(supported_fmts=3D(), unsupported_fmts=3D()):
     assert not (supported_fmts and unsupported_fmts)
=20
     if 'generic' in supported_fmts and \
@@ -982,7 +982,7 @@ def verify_image_format(supported_fmts=3D[], unsupporte=
d_fmts=3D[]):
     if not_sup or (imgfmt in unsupported_fmts):
         notrun('not suitable for this image format: %s' % imgfmt)
=20
-def verify_protocol(supported=3D[], unsupported=3D[]):
+def verify_protocol(supported=3D(), unsupported=3D()):
     assert not (supported and unsupported)
=20
     if 'generic' in supported:
@@ -1000,11 +1000,11 @@ def verify_platform(supported=3D(), unsupported=3D(=
)):
         if not any((sys.platform.startswith(x) for x in supported)):
             notrun('not suitable for this OS: %s' % sys.platform)
=20
-def verify_cache_mode(supported_cache_modes=3D[]):
+def verify_cache_mode(supported_cache_modes=3D()):
     if supported_cache_modes and (cachemode not in supported_cache_modes):
         notrun('not suitable for this cache mode: %s' % cachemode)
=20
-def verify_aio_mode(supported_aio_modes=3D[]):
+def verify_aio_mode(supported_aio_modes=3D()):
     if supported_aio_modes and (aiomode not in supported_aio_modes):
         notrun('not suitable for this aio mode: %s' % aiomode)
=20
@@ -1044,7 +1044,7 @@ def supported_formats(read_only=3DFalse):
=20
     return supported_formats.formats[read_only]
=20
-def skip_if_unsupported(required_formats=3D[], read_only=3DFalse):
+def skip_if_unsupported(required_formats=3D(), read_only=3DFalse):
     '''Skip Test Decorator
        Runs the test if all the required formats are whitelisted'''
     def skip_test_decorator(func):
--=20
2.21.1


