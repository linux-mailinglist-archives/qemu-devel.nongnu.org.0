Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1132F09F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:04:51 +0100 (CET)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDsg-0007er-SX
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkC-0006rq-1F
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDjz-00079h-L5
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhbelqwQmlZpgy8qvloipsQdOEZFNllHURq2RU7LLt8=;
 b=AtiR84QMmkf++vNIH3WLmvOQXWqALJ9LQzh4LyeZlHG5jkws12EtLR44hP0MA6Ev+P1dJj
 st3ZoALWY+gUDeZdWgl2S4dBDR8kvmUDLgPc/9Jls0toWzwvZYKdLfhXN0s6Brs0voPOYn
 OiLtkmRldufPeYu8iwYybgQGksEfBxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-XMun1wSWPXy-BsGYUJx_6g-1; Fri, 05 Mar 2021 11:55:46 -0500
X-MC-Unique: XMun1wSWPXy-BsGYUJx_6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D03800426;
 Fri,  5 Mar 2021 16:55:18 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 475A660BF3;
 Fri,  5 Mar 2021 16:55:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/31] storage-daemon: include current command line option in
 the errors
Date: Fri,  5 Mar 2021 17:54:31 +0100
Message-Id: <20210305165454.356840-9-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

Use the location management facilities that the emulator uses, so that
the current command line option appears in the error message.

Before:

  $ storage-daemon/qemu-storage-daemon --nbd key..=
  qemu-storage-daemon: Invalid parameter 'key..'

After:

  $ storage-daemon/qemu-storage-daemon --nbd key..=
  qemu-storage-daemon: --nbd key..=: Invalid parameter 'key..'

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210301152844.291799-3-pbonzini@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index b7e1b90fb1..78ddf619d4 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -152,6 +152,20 @@ static void init_qmp_commands(void)
                          qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG);
 }
 
+static int getopt_set_loc(int argc, char **argv, const char *optstring,
+                          const struct option *longopts)
+{
+    int c, save_index;
+
+    optarg = NULL;
+    save_index = optind;
+    c = getopt_long(argc, argv, optstring, longopts, NULL);
+    if (optarg) {
+        loc_set_cmdline(argv, save_index, MAX(1, optind - save_index));
+    }
+    return c;
+}
+
 static void process_options(int argc, char *argv[])
 {
     int c;
@@ -174,7 +188,7 @@ static void process_options(int argc, char *argv[])
      * they are given on the command lines. This means that things must be
      * defined first before they can be referenced in another option.
      */
-    while ((c = getopt_long(argc, argv, "-hT:V", long_options, NULL)) != -1) {
+    while ((c = getopt_set_loc(argc, argv, "-hT:V", long_options)) != -1) {
         switch (c) {
         case '?':
             exit(EXIT_FAILURE);
@@ -276,12 +290,13 @@ static void process_options(int argc, char *argv[])
                 break;
             }
         case 1:
-            error_report("Unexpected argument: %s", optarg);
+            error_report("Unexpected argument");
             exit(EXIT_FAILURE);
         default:
             g_assert_not_reached();
         }
     }
+    loc_set_none();
 }
 
 int main(int argc, char *argv[])
-- 
2.29.2


