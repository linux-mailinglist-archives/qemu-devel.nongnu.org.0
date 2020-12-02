Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60F52CB755
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:38:16 +0100 (CET)
Received: from localhost ([::1]:33106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNeR-0003CT-Ql
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCt-0003Pj-7z
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCO-0003kW-VQ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVlkX2RNZ4VTfnS/EgqivsechNfR7j1XHKWeN48kAXM=;
 b=ShaYbsIz+hW2t+0yLjmfRultcUCXNoE+b8z3cpeqvS6TFDJ5aW7RhTsKPDA3LrUXaw5wjd
 oC/IYzBkRwoHPPULlyJvJfeDnKCB77BU97+xJqyI30aSHxHaT0UKejSMW9O1k3Vl0cbL+K
 qSExXuD4F0l2yIjr8d0aSE3P/2hl9yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-32Nerja2NvO7hHE_NyMFUg-1; Wed, 02 Dec 2020 03:09:13 -0500
X-MC-Unique: 32Nerja2NvO7hHE_NyMFUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 199C35708C
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D19C910023AE
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 062/113] vl: create "-net nic -net user" default earlier
Date: Wed,  2 Dec 2020 03:07:58 -0500
Message-Id: <20201202080849.4125477-63-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Create it together with other default backends, even though the processing is
done later.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5571f9ff75..a4b87ae742 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4253,6 +4253,14 @@ void qemu_init(int argc, char **argv, char **envp)
             monitor_parse("vc:80Cx24C", "readline", false);
     }
 
+    if (default_net) {
+        QemuOptsList *net = qemu_find_opts("net");
+        qemu_opts_parse(net, "nic", true, &error_abort);
+#ifdef CONFIG_SLIRP
+        qemu_opts_parse(net, "user", true, &error_abort);
+#endif
+    }
+
 #if defined(CONFIG_VNC)
     if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
         display_remote++;
@@ -4388,14 +4396,6 @@ void qemu_init(int argc, char **argv, char **envp)
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
     }
 
-    if (default_net) {
-        QemuOptsList *net = qemu_find_opts("net");
-        qemu_opts_parse(net, "nic", true, &error_abort);
-#ifdef CONFIG_SLIRP
-        qemu_opts_parse(net, "user", true, &error_abort);
-#endif
-    }
-
     if (net_init_clients(&err) < 0) {
         error_report_err(err);
         exit(1);
-- 
2.26.2



