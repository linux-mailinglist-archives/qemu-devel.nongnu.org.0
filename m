Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF77B1627E4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:16:20 +0100 (CET)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43fe-0007SZ-MZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j43Xt-0007Kd-Tr
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j43Xs-0001X6-ES
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:17 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37007
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j43Xs-0001Wn-9k
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582034895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nq5Ghq+1ptFFpuiHxhPrR5D2/0vAX4PKfEmBqocvW4=;
 b=hPvd5g4sgzjDLYyMWgdUdex12dVzvlbY4zKMtUIDSI9byY6k1aqS1G4/RJmPcMIFIjiPni
 pf0A4xRxo0J7vDypfEgKSGdSfs14rb0u2iC8M7xTbdLt+Py5Pia7cMwXNsKPBanZOenT3F
 DvtmBw75fUtK9bre2/mTi0A5b9L7yYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-5zsB8HTMO9G0N5D3jII8_g-1; Tue, 18 Feb 2020 09:08:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D8A3800D55;
 Tue, 18 Feb 2020 14:08:10 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 872F619E9C;
 Tue, 18 Feb 2020 14:08:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/36] commit: Expose on-error option in QMP
Date: Tue, 18 Feb 2020 15:07:00 +0100
Message-Id: <20200218140722.23876-15-kwolf@redhat.com>
In-Reply-To: <20200218140722.23876-1-kwolf@redhat.com>
References: <20200218140722.23876-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 5zsB8HTMO9G0N5D3jII8_g-1
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the error handling in the common block job is fixed, we can
expose the on-error option in QMP instead of hard-coding it as 'report'
in qmp_block_commit().

This fulfills the promise that the old comment in that function made,
even if a bit later than expected: "This will be part of the QMP
command, if/when the BlockdevOnError change for blkmirror makes it in".

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200214200812.28180-7-kwolf@redhat.com>
Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 4 ++++
 blockdev.c           | 8 ++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1c32158d11..37d7ea7295 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1658,6 +1658,9 @@
 #
 # @speed: the maximum speed, in bytes per second
 #
+# @on-error: the action to take on an error. 'ignore' means that the reque=
st
+#            should be retried. (default: report; Since: 5.0)
+#
 # @filter-node-name: the node name that should be assigned to the
 #                    filter driver that the commit job inserts into the gr=
aph
 #                    above @top. If this option is not given, a node name =
is
@@ -1694,6 +1697,7 @@
   'data': { '*job-id': 'str', 'device': 'str', '*base-node': 'str',
             '*base': 'str', '*top-node': 'str', '*top': 'str',
             '*backing-file': 'str', '*speed': 'int',
+            '*on-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
=20
diff --git a/blockdev.c b/blockdev.c
index c6a727cca9..374189a426 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3471,6 +3471,7 @@ void qmp_block_commit(bool has_job_id, const char *jo=
b_id, const char *device,
                       bool has_top, const char *top,
                       bool has_backing_file, const char *backing_file,
                       bool has_speed, int64_t speed,
+                      bool has_on_error, BlockdevOnError on_error,
                       bool has_filter_node_name, const char *filter_node_n=
ame,
                       bool has_auto_finalize, bool auto_finalize,
                       bool has_auto_dismiss, bool auto_dismiss,
@@ -3481,15 +3482,14 @@ void qmp_block_commit(bool has_job_id, const char *=
job_id, const char *device,
     BlockDriverState *base_bs, *top_bs;
     AioContext *aio_context;
     Error *local_err =3D NULL;
-    /* This will be part of the QMP command, if/when the
-     * BlockdevOnError change for blkmirror makes it in
-     */
-    BlockdevOnError on_error =3D BLOCKDEV_ON_ERROR_REPORT;
     int job_flags =3D JOB_DEFAULT;
=20
     if (!has_speed) {
         speed =3D 0;
     }
+    if (!has_on_error) {
+        on_error =3D BLOCKDEV_ON_ERROR_REPORT;
+    }
     if (!has_filter_node_name) {
         filter_node_name =3D NULL;
     }
--=20
2.20.1


