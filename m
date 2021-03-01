Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA42E328276
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:30:07 +0100 (CET)
Received: from localhost ([::1]:40918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkUo-0007u9-NS
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGkTl-0006SF-37
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:29:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGkTi-0000XO-RV
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614612537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qkXf8TMx+G6u0C9BEMxvQXVvj0ZNJMk26x36FpIij8k=;
 b=NJeDb0Yzp9KuY9TWO9/bKSlivnQHs6aF/KyS2YcNBU+YHPJ8Vjz0shs4DJMDzWijGAB/GU
 jByUiEHvfYN/vxAb7NnhO5mORRe3qjWxpvnkQx1lt5QF6UqqqUgGUGqq6DnrM8zNkINM7Z
 +PC5lOZGBrMrYXPO2REh0MN9KAnAN5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-ImYnYpnUN-ikRCY4RECL9Q-1; Mon, 01 Mar 2021 10:28:47 -0500
X-MC-Unique: ImYnYpnUN-ikRCY4RECL9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 431DA50741;
 Mon,  1 Mar 2021 15:28:46 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF3D35C1D1;
 Mon,  1 Mar 2021 15:28:45 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] storage-daemon: report unexpected arguments on the fly
Date: Mon,  1 Mar 2021 10:28:43 -0500
Message-Id: <20210301152844.291799-2-pbonzini@redhat.com>
In-Reply-To: <20210301152844.291799-1-pbonzini@redhat.com>
References: <20210301152844.291799-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the first character of optstring is '-', then each nonoption argv
element is handled as if it were the argument of an option with character
code 1.  This removes the reordering of the argv array, and enables usage
of loc_set_cmdline to provide better error messages.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 9021a46b3a..9aa82e7d96 100644
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
2.26.2



