Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BE4276E1E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 12:04:21 +0200 (CEST)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLO6u-0007Nk-39
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 06:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTs-0001HQ-8h
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTn-000664-Ke
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPwMOZku7UBRQhHSdhV1lO2uk4iu6y/xIf7/rYHqH0c=;
 b=X3Us8ewsH8Um9sGBecEB+6lEjrGR8kIWxFQY8/2AB5BpWHGxs88LrSjIyNnWB4vMKyxUp/
 CpwzgBRJPQSIzn7DDw2UiT4MvhksPurCsT/lNnRavw8Paxoh/hFCIB7ctFHZMJLCt1doaO
 oPjuPR8slo3Ol+qmNwTwBMn32Dr9Iwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-ArvbciFSM9iElJerc6OHUQ-1; Thu, 24 Sep 2020 05:23:53 -0400
X-MC-Unique: ArvbciFSM9iElJerc6OHUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42890100746C
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:23:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C63E60C15
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:23:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 48/92] qemu-bridge-helper: relocate path to default ACL
Date: Thu, 24 Sep 2020 05:22:30 -0400
Message-Id: <20200924092314.1722645-49-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-bridge-helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
index 88b26747fc..a26e1663f0 100644
--- a/qemu-bridge-helper.c
+++ b/qemu-bridge-helper.c
@@ -40,6 +40,7 @@
 #endif
 
 #include "qemu/queue.h"
+#include "qemu/cutils.h"
 
 #include "net/tap-linux.h"
 
@@ -245,6 +246,7 @@ int main(int argc, char **argv)
     ACLList acl_list;
     int access_allowed, access_denied;
     int ret = EXIT_SUCCESS;
+    g_autofree char *acl_file = NULL;
 
 #ifdef CONFIG_LIBCAP_NG
     /* if we're run from an suid binary, immediately drop privileges preserving
@@ -257,6 +259,8 @@ int main(int argc, char **argv)
     }
 #endif
 
+    qemu_init_exec_dir(argv[0]);
+
     /* parse arguments */
     for (index = 1; index < argc; index++) {
         if (strcmp(argv[index], "--use-vnet") == 0) {
@@ -282,9 +286,10 @@ int main(int argc, char **argv)
 
     /* parse default acl file */
     QSIMPLEQ_INIT(&acl_list);
-    if (parse_acl_file(DEFAULT_ACL_FILE, &acl_list) == -1) {
+    acl_file = get_relocated_path(DEFAULT_ACL_FILE);
+    if (parse_acl_file(acl_file, &acl_list) == -1) {
         fprintf(stderr, "failed to parse default acl file `%s'\n",
-                DEFAULT_ACL_FILE);
+                acl_file);
         ret = EXIT_FAILURE;
         goto cleanup;
     }
-- 
2.26.2



