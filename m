Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F032C0D11
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:18:22 +0100 (CET)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCfd-00065y-Hj
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcE-00030F-V4
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcC-0007kS-TB
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EId/j+vRbcgqB9EuGzhzDaIodExfiY0lp6Om2qfpMVw=;
 b=PAxzuxU2prVuIHW8YuqHpc5EXI8feLuJD9frVkwa6/k27y86vWrpbXOrJXqr/6fgg+oL1Y
 gKJAswcY17QteG2rIYEP+bgTLbDFmjb/llL+4ccpzRQnoR9Vuv1OOnBcWlm3CHBcVxiSkG
 kTKvxNx9fSn+CBhPMvHBrLhv3z5Dvoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Jhqf9RR7PsCPYI9YkwX5jQ-1; Mon, 23 Nov 2020 09:14:42 -0500
X-MC-Unique: Jhqf9RR7PsCPYI9YkwX5jQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D77E3100B71F
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ACBE5D6D3;
 Mon, 23 Nov 2020 14:14:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/36] vl: preconfig and loadvm are mutually exclusive
Date: Mon, 23 Nov 2020 09:14:07 -0500
Message-Id: <20201123141435.2726558-9-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like -incoming.  Later we will add support for "-incoming defer
-preconfig", because there are cases (Xen, block layer) that want
to look at RUNSTATE_INMIGRATE.  -loadvm will remain mutually exclusive
with preconfig; the plan is to just do loadvm in the monitor, since
the user is already going to interact with it for preconfiguration.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6699c23a16..acea4286e9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -124,6 +124,7 @@ static const char *mem_path;
 static const char *boot_order;
 static const char *boot_once;
 static const char *incoming;
+static const char *loadvm;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
 const char* keyboard_layout = NULL;
@@ -2890,6 +2891,11 @@ static void qemu_validate_options(void)
           }
     }
 
+    if (loadvm && !preconfig_exit_requested) {
+        error_report("'preconfig' and 'loadvm' options are "
+                     "mutually exclusive");
+        exit(EXIT_FAILURE);
+    }
     if (incoming && !preconfig_exit_requested) {
         error_report("'preconfig' and 'incoming' options are "
                      "mutually exclusive");
@@ -3172,7 +3178,6 @@ void qemu_init(int argc, char **argv, char **envp)
     QemuOptsList *olist;
     int optind;
     const char *optarg;
-    const char *loadvm = NULL;
     MachineClass *machine_class;
     const char *vga_model = NULL;
     bool userconfig = true;
-- 
2.26.2



