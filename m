Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EB43261B9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 12:04:47 +0100 (CET)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFavO-0002NB-21
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 06:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFau1-0001lG-Ow
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:03:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFaty-0005L8-0P
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614337396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c95UZzOO+bd7RHRebXBGDm3oNT/sRfsB6wbRQIVjT+4=;
 b=MDSP2hvm4429YJCqxvR22d5g/OYR10aKRD9V+paDyfJ7KsPa0OTEYXhRuKdFZTxfj5S3NZ
 nYaY4+xmnHqfi/vlnfaczDMcCZ66kJ3vzKUuRUEZ2ACjS7I+Px86fgoim67avkYxb8WLsE
 9Igi1gSZqWMaNRGQvaJYawuAVycYjaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-MHxAMlqbMxiUdteqK0fVrg-1; Fri, 26 Feb 2021 06:03:14 -0500
X-MC-Unique: MHxAMlqbMxiUdteqK0fVrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E2A480196C;
 Fri, 26 Feb 2021 11:03:13 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC1AA5D9D2;
 Fri, 26 Feb 2021 11:03:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] storage-daemon: include current command line option in the
 errors
Date: Fri, 26 Feb 2021 06:03:12 -0500
Message-Id: <20210226110312.157645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the location management facilities that the emulator uses, so that
the current command line option appears in the error message.

Before:

  $ storage-daemon/qemu-storage-daemon --nbd key..=
  qemu-storage-daemon: Invalid parameter 'key..'

After:

  $ storage-daemon/qemu-storage-daemon --nbd key..=
  qemu-storage-daemon: --nbd key..=: Invalid parameter 'key..'

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 9021a46b3a..a8f8d83f6f 100644
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
-    while ((c = getopt_long(argc, argv, "hT:V", long_options, NULL)) != -1) {
+    while ((c = getopt_set_loc(argc, argv, "hT:V", long_options)) != -1) {
         switch (c) {
         case '?':
             exit(EXIT_FAILURE);
@@ -283,6 +297,7 @@ static void process_options(int argc, char *argv[])
         error_report("Unexpected argument: %s", argv[optind]);
         exit(EXIT_FAILURE);
     }
+    loc_set_none();
 }
 
 int main(int argc, char *argv[])
-- 
2.26.2


