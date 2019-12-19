Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021DB126841
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:36:45 +0100 (CET)
Received: from localhost ([::1]:45406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihzj9-0001Zu-NQ
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihzXs-0006Jp-Kr
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihzXr-0006Bh-1y
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:04 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46298
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihzXq-00067h-Jl
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576776302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fymX9kSg5/0X6TAVJP9vYJzlujDjgvG32GfWpTGgFls=;
 b=Ike3GOkayGxZJqpZh8Da1pB6d16c78AO0IMpJTqrSFzMdtiapuQX4CFyMcI54ohBDyqH97
 DUN759ObKIRRujQMYFWzyKoHnjmWgVmU7V1iBops1aLN3AqJtPHWMk4nGmkk9ft9U1adj/
 fvIMGlEOCUoleqUk2xl4HqSKBLxCIoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-YZ2_mGasOaiDjhmSmMJizA-1; Thu, 19 Dec 2019 12:24:58 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2EB7801E6C;
 Thu, 19 Dec 2019 17:24:57 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDBCE620C0;
 Thu, 19 Dec 2019 17:24:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/30] blockjob: Fix error message for negative speed
Date: Thu, 19 Dec 2019 18:24:18 +0100
Message-Id: <20191219172441.7289-8-kwolf@redhat.com>
In-Reply-To: <20191219172441.7289-1-kwolf@redhat.com>
References: <20191219172441.7289-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: YZ2_mGasOaiDjhmSmMJizA-1
X-Mimecast-Spam-Score: 0
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error message for a negative speed uses QERR_INVALID_PARAMETER,
which implies that the 'speed' option doesn't even exist:

    {"error": {"class": "GenericError", "desc": "Invalid parameter 'speed'"=
}}

Make it use QERR_INVALID_PARAMETER_VALUE instead:

    {"error": {"class": "GenericError", "desc": "Parameter 'speed' expects =
a non-negative value"}}

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 blockjob.c             | 3 ++-
 tests/qemu-iotests/030 | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index c6e20e2fcd..5d63b1e89d 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -261,7 +261,8 @@ void block_job_set_speed(BlockJob *job, int64_t speed, =
Error **errp)
         return;
     }
     if (speed < 0) {
-        error_setg(errp, QERR_INVALID_PARAMETER, "speed");
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "speed",
+                   "a non-negative value");
         return;
     }
=20
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index f3766f2a81..be35bde06f 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -943,7 +943,7 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
=20
         result =3D self.vm.qmp('block-stream', device=3D'drive0', speed=3D=
-1)
-        self.assert_qmp(result, 'error/desc', "Invalid parameter 'speed'")
+        self.assert_qmp(result, 'error/desc', "Parameter 'speed' expects a=
 non-negative value")
=20
         self.assert_no_active_block_jobs()
=20
@@ -952,7 +952,7 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
=20
         result =3D self.vm.qmp('block-job-set-speed', device=3D'drive0', s=
peed=3D-1)
-        self.assert_qmp(result, 'error/desc', "Invalid parameter 'speed'")
+        self.assert_qmp(result, 'error/desc', "Parameter 'speed' expects a=
 non-negative value")
=20
         self.cancel_and_wait(resume=3DTrue)
=20
--=20
2.20.1


