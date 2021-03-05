Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D2032F128
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:28:02 +0100 (CET)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEF7-00036k-6j
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkY-0007PY-93
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007EG-9w
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vpflH6yvCbbjvYemxj6XwuA+ujoiicVqSNFqQCZjGg=;
 b=YVUja3VyoPHYbtojdJ9gHRW4Y7vJbxNzlgwQO2lS6vgz3E5NBTVe6NQyD48TJMVPjzE2yq
 47KpWbTo8ZyoGI/1O+pkcbTfsRdSNEPECKu9jYFOLWEj07kDu1iGvZ+P1e5Mx35i7fB+82
 xD6U0FNlIKbadRY8R+Dp5VyKAgxL7pU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-1oAdDyxwP963jQYcIxnndA-1; Fri, 05 Mar 2021 11:55:56 -0500
X-MC-Unique: 1oAdDyxwP963jQYcIxnndA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA20218C0267;
 Fri,  5 Mar 2021 16:55:16 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD20760BF3;
 Fri,  5 Mar 2021 16:55:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/31] storage-daemon: report unexpected arguments on the fly
Date: Fri,  5 Mar 2021 17:54:30 +0100
Message-Id: <20210305165454.356840-8-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

If the first character of optstring is '-', then each nonoption argv
element is handled as if it were the argument of an option with character
code 1.  This removes the reordering of the argv array, and enables usage
of loc_set_cmdline to provide better error messages.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210301152844.291799-2-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 9021a46b3a..b7e1b90fb1 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -174,7 +174,7 @@ static void process_options(int argc, char *argv[])
      * they are given on the command lines. This means that things must be
      * defined first before they can be referenced in another option.
      */
-    while ((c = getopt_long(argc, argv, "hT:V", long_options, NULL)) != -1) {
+    while ((c = getopt_long(argc, argv, "-hT:V", long_options, NULL)) != -1) {
         switch (c) {
         case '?':
             exit(EXIT_FAILURE);
@@ -275,14 +275,13 @@ static void process_options(int argc, char *argv[])
                 qobject_unref(args);
                 break;
             }
+        case 1:
+            error_report("Unexpected argument: %s", optarg);
+            exit(EXIT_FAILURE);
         default:
             g_assert_not_reached();
         }
     }
-    if (optind != argc) {
-        error_report("Unexpected argument: %s", argv[optind]);
-        exit(EXIT_FAILURE);
-    }
 }
 
 int main(int argc, char *argv[])
-- 
2.29.2


