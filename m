Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58C3143DF4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:23:56 +0100 (CET)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittVb-000819-DA
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsfn-0001kW-Gw
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsfj-000463-GW
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57720
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsfj-00045M-BP
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cd7MHlODkbFLPZaBRZM3VhImlj/yWK2Gg6eQIEyLu+Q=;
 b=HiFPREHv4sF46wUWGkff0Uwcf0e+genBzwkj8EOdTuysriSZlL5ORIkqI74ANiuYeMBy2A
 I4XmceGfdLS9wBlRUvx46S9piwXMpfUcIssSNNAWm3pMJP18EJQyy2iS0aC0M1x6HrR+Wm
 wlYjtjrn97uF19rtLQZDJFmWjxhUy2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-U1iEdNRTPCG_XduZzJxA5g-1; Tue, 21 Jan 2020 07:30:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AE6B93980;
 Tue, 21 Jan 2020 12:30:14 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B806660BE0;
 Tue, 21 Jan 2020 12:30:09 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 062/109] virtiofsd: Add timestamp to the log with
 FUSE_LOG_DEBUG level
Date: Tue, 21 Jan 2020 12:23:46 +0000
Message-Id: <20200121122433.50803-63-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: U1iEdNRTPCG_XduZzJxA5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

virtiofsd has some threads, so we see a lot of logs with debug option.
It would be useful for debugging if we can see the timestamp.

Add nano second timestamp, which got by get_clock(), to the log with
FUSE_LOG_DEBUG level if the syslog option isn't set.

The log is like as:

  ]# ./virtiofsd -d -o vhost_user_socket=3D/tmp/vhostqemu0 -o source=3D/tmp=
/share0 -o cache=3Dauto
  ...
  [5365943125463727] [ID: 00000002] fv_queue_thread: Start for queue 0 kick=
_fd 9
  [5365943125568644] [ID: 00000002] fv_queue_thread: Waiting for Queue 0 ev=
ent
  [5365943125573561] [ID: 00000002] fv_queue_thread: Got queue event on Que=
ue 0

Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
---
 tools/virtiofsd/passthrough_ll.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 991de69334..a7fb34ac0c 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -35,6 +35,8 @@
  * \include passthrough_ll.c
  */
=20
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
 #include "fuse_virtio.h"
 #include "fuse_log.h"
 #include "fuse_lowlevel.h"
@@ -2275,7 +2277,13 @@ static void log_func(enum fuse_log_level level, cons=
t char *fmt, va_list ap)
     }
=20
     if (current_log_level =3D=3D FUSE_LOG_DEBUG) {
-        localfmt =3D g_strdup_printf("[ID: %08ld] %s", syscall(__NR_gettid=
), fmt);
+        if (!use_syslog) {
+            localfmt =3D g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
+                                       get_clock(), syscall(__NR_gettid), =
fmt);
+        } else {
+            localfmt =3D g_strdup_printf("[ID: %08ld] %s", syscall(__NR_ge=
ttid),
+                                       fmt);
+        }
         fmt =3D localfmt;
     }
=20
--=20
2.24.1


