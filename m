Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB671988AC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 02:08:44 +0200 (CEST)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ4SR-0005Qe-Bs
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 20:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jJ4Kg-0003qp-R4
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:00:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jJ4Kd-0008Fs-OY
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:00:41 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:55298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jJ4Kd-0008AO-KJ
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585612837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZyvpERIoujjJ9L/KQG/Eaw1sI4QTdZYhttYMFD8oBPI=;
 b=c9ba4PEcSjU4RvQIH0t60bYVJZnBv+mx13Y/bUYovDwagr19ockVnYK9ySdZwPV1z1xRmF
 WidDnJDpsL55SBTZ2yawIRcQLAN7P5cdwsEs+mxrXJF2poLR5wN7ALCdpbFMpveDt0GVZL
 zjNa4L65Ch1q0QweSm0KjgsU2MCbEn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-mp0pKwlRMo2ZGoR8obb7xA-1; Mon, 30 Mar 2020 20:00:35 -0400
X-MC-Unique: mp0pKwlRMo2ZGoR8obb7xA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4BB3801E53;
 Tue, 31 Mar 2020 00:00:34 +0000 (UTC)
Received: from probe.redhat.com (ovpn-113-210.rdu2.redhat.com [10.10.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D18E100EBB6;
 Tue, 31 Mar 2020 00:00:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 04/14] iotests: replace mutable list default args
Date: Mon, 30 Mar 2020 20:00:04 -0400
Message-Id: <20200331000014.11581-5-jsnow@redhat.com>
In-Reply-To: <20200331000014.11581-1-jsnow@redhat.com>
References: <20200331000014.11581-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's bad hygiene: if we modify this list, it will be modified across all
invocations.

(Remaining bad usages are fixed in a subsequent patch which changes the
function signature anyway.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 4d848339a5..51f84475d9 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -139,7 +139,7 @@ def qemu_img_log(*args):
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
@@ -353,7 +353,7 @@ def _filter(_key, value):
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
@@ -569,7 +569,7 @@ def get_qmp_events_filtered(self, wait=3D60.0):
             result.append(filter_qmp_event(ev))
         return result
=20
-    def qmp_log(self, cmd, filters=3D[], indent=3DNone, **kwargs):
+    def qmp_log(self, cmd, filters=3D(), indent=3DNone, **kwargs):
         full_cmd =3D OrderedDict((
             ("execute", cmd),
             ("arguments", ordered_qmp(kwargs))
@@ -973,7 +973,7 @@ def case_notrun(reason):
     open('%s/%s.casenotrun' % (output_dir, seq), 'a').write(
         '    [case not run] ' + reason + '\n')
=20
-def verify_image_format(supported_fmts=3D[], unsupported_fmts=3D[]):
+def verify_image_format(supported_fmts=3D(), unsupported_fmts=3D()):
     assert not (supported_fmts and unsupported_fmts)
=20
     if 'generic' in supported_fmts and \
@@ -987,7 +987,7 @@ def verify_image_format(supported_fmts=3D[], unsupporte=
d_fmts=3D[]):
     if not_sup or (imgfmt in unsupported_fmts):
         notrun('not suitable for this image format: %s' % imgfmt)
=20
-def verify_protocol(supported=3D[], unsupported=3D[]):
+def verify_protocol(supported=3D(), unsupported=3D()):
     assert not (supported and unsupported)
=20
     if 'generic' in supported:
@@ -1006,11 +1006,11 @@ def verify_platform(supported=3DNone, unsupported=
=3DNone):
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
@@ -1050,7 +1050,7 @@ def supported_formats(read_only=3DFalse):
=20
     return supported_formats.formats[read_only]
=20
-def skip_if_unsupported(required_formats=3D[], read_only=3DFalse):
+def skip_if_unsupported(required_formats=3D(), read_only=3DFalse):
     '''Skip Test Decorator
        Runs the test if all the required formats are whitelisted'''
     def skip_test_decorator(func):
@@ -1101,11 +1101,11 @@ def execute_unittest(output, verbosity, debug):
             sys.stderr.write(out)
=20
 def execute_test(test_function=3DNone,
-                 supported_fmts=3D[],
+                 supported_fmts=3D(),
                  supported_platforms=3DNone,
-                 supported_cache_modes=3D[], supported_aio_modes=3D{},
-                 unsupported_fmts=3D[], supported_protocols=3D[],
-                 unsupported_protocols=3D[]):
+                 supported_cache_modes=3D(), supported_aio_modes=3D(),
+                 unsupported_fmts=3D(), supported_protocols=3D(),
+                 unsupported_protocols=3D()):
     """Run either unittest or script-style tests."""
=20
     # We are using TEST_DIR and QEMU_DEFAULT_MACHINE as proxies to
--=20
2.21.1


