Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F274A2953E8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 23:12:49 +0200 (CEST)
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVLPd-00050p-16
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 17:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLB3-0005ju-0M
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLAx-0006hE-Cq
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603313854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KB3v8ZGUPVDT5YIRiKIKLRFaZ18xMqBQEX9ptXmwuA=;
 b=fI5NPR1iMf2Hiu6jZT6bsPdZ4eh61+vVuZfNf5/J3kUhr71DUxeb8WfisxF8LklHgcYoK3
 WJqTlND1Pqo+xcwtXEfGWz7Ncg6H20z4ZLpgr5KNZbt6PUuhD8MyGitm4cX7BiSzkyD78P
 J+eIjKs4mWyLL/KHEWDlFMKJH2P9A6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-mPyNkLK0Pt66FxCnPbG-Pw-1; Wed, 21 Oct 2020 16:57:32 -0400
X-MC-Unique: mPyNkLK0Pt66FxCnPbG-Pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59B06835B8E
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 20:57:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C98FD6EF66;
 Wed, 21 Oct 2020 20:57:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/22] vl: create "-net nic -net user" default earlier
Date: Wed, 21 Oct 2020 16:57:10 -0400
Message-Id: <20201021205716.2359430-17-pbonzini@redhat.com>
In-Reply-To: <20201021205716.2359430-1-pbonzini@redhat.com>
References: <20201021205716.2359430-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 22:12:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jsnow@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create it together with other default backends, even though the processing is
done later.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 122bf1821b..8577667b8f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4235,6 +4235,14 @@ void qemu_init(int argc, char **argv, char **envp)
             monitor_parse("vc:80Cx24C", "readline", false);
     }
 
+    if (default_net) {
+        QemuOptsList *net = qemu_find_opts("net");
+        qemu_opts_set(net, NULL, "type", "nic", &error_abort);
+#ifdef CONFIG_SLIRP
+        qemu_opts_set(net, NULL, "type", "user", &error_abort);
+#endif
+    }
+
 #if defined(CONFIG_VNC)
     if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
         display_remote++;
@@ -4370,14 +4378,6 @@ void qemu_init(int argc, char **argv, char **envp)
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
     }
 
-    if (default_net) {
-        QemuOptsList *net = qemu_find_opts("net");
-        qemu_opts_set(net, NULL, "type", "nic", &error_abort);
-#ifdef CONFIG_SLIRP
-        qemu_opts_set(net, NULL, "type", "user", &error_abort);
-#endif
-    }
-
     if (net_init_clients(&err) < 0) {
         error_report_err(err);
         exit(1);
-- 
2.26.2



