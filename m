Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A356625F9BA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:44:20 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFZL-0003NQ-P8
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF3H-0004FJ-6b
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30273
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF3F-0008Kd-Gl
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gu2+fEkZoe3SztRlC7hIrBBXfG+bklV/udjHuyNUgOc=;
 b=LHpTMUC19li7NdkdeuVCNlpjrye0ubz2Q6xzCdD5lv7DQ5D+vGMRKrMp15fffRFH5XIouW
 q0r416A9KOGe1InJVX4N//3E6Q8XaNoQB1cfBgQxXR7i1lqSlPrewnKJAROP0mVumQTdH7
 eUFdajAkwEfb7vFE1ITs51VAnDL8zBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-uSQrLGEgM5iX5FyR8mjDlg-1; Mon, 07 Sep 2020 07:11:04 -0400
X-MC-Unique: uSQrLGEgM5iX5FyR8mjDlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B273418B9EC1;
 Mon,  7 Sep 2020 11:11:03 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B18749CBA;
 Mon,  7 Sep 2020 11:11:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 61/64] file-win32: Fix "locking" option
Date: Mon,  7 Sep 2020 13:09:33 +0200
Message-Id: <20200907110936.261684-62-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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

The intended behaviour was that locking=off/auto work and have no
effect (to remain compatible with file-posix), whereas locking=on would
return an error. Unfortunately, the code forgot to remove "locking" from
the options QDict, so any attempt to use the option would fail.

Replace the option parsing code for "locking" with something that is
part of the raw_runtime_opts QemuOptsList (so it is properly removed
from the QDict) and looks more like file-posix.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200907092739.9988-1-kwolf@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-win32.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/block/file-win32.c b/block/file-win32.c
index ab69bd811a..e2900c3a51 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -299,6 +299,11 @@ static QemuOptsList raw_runtime_opts = {
             .type = QEMU_OPT_STRING,
             .help = "host AIO implementation (threads, native)",
         },
+        {
+            .name = "locking",
+            .type = QEMU_OPT_STRING,
+            .help = "file locking mode (on/off/auto, default: auto)",
+        },
         { /* end of list */ }
     },
 };
@@ -333,6 +338,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
     Error *local_err = NULL;
     const char *filename;
     bool use_aio;
+    OnOffAuto locking;
     int ret;
 
     s->type = FTYPE_FILE;
@@ -343,10 +349,24 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    if (qdict_get_try_bool(options, "locking", false)) {
+    locking = qapi_enum_parse(&OnOffAuto_lookup,
+                              qemu_opt_get(opts, "locking"),
+                              ON_OFF_AUTO_AUTO, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        ret = -EINVAL;
+        goto fail;
+    }
+    switch (locking) {
+    case ON_OFF_AUTO_ON:
         error_setg(errp, "locking=on is not supported on Windows");
         ret = -EINVAL;
         goto fail;
+    case ON_OFF_AUTO_OFF:
+    case ON_OFF_AUTO_AUTO:
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     filename = qemu_opt_get(opts, "filename");
-- 
2.25.4


