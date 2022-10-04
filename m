Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF65F402E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:46:23 +0200 (CEST)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofeVJ-0004VY-R6
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHh-0005KA-Oh
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHe-00052H-P6
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664875933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DoHxUBovNXkqvqDwUAVYmiKYeFGt5kDexnYw1EqIa7w=;
 b=MWvxaTA/C5CsWI3oHOolu6LgGSP17RMrQnYnzJC+FbDgPq/8Ga5vA9k14Krl55TYSA+t+o
 E4miPwA8tMcBNOPZU0TNly6h4aEl1fDzSkpdPRKgdwJ51bwsNxYR+RD9uaPJNKtLrXRExL
 uBDVxoITGZF7PvPyX+yKxM+HDQn8KOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-w4UwOrvVML2DwXH3ev7vrg-1; Tue, 04 Oct 2022 05:32:12 -0400
X-MC-Unique: w4UwOrvVML2DwXH3ev7vrg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10655185A79C;
 Tue,  4 Oct 2022 09:32:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11C9F492B04;
 Tue,  4 Oct 2022 09:32:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/4] meson: enforce a minimum Linux kernel headers version >=
 4.18
Date: Tue,  4 Oct 2022 10:32:05 +0100
Message-Id: <20221004093206.652431-4-berrange@redhat.com>
In-Reply-To: <20221004093206.652431-1-berrange@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Various areas of QEMU have a dependency on Linux kernel header
definitions. This falls under the scope of our supported platforms
matrix, but historically we've not checked for a minimum kernel
headers version. This has made it unclear when we can drop support
for older kernel headers.

  * Alpine 3.14: 5.10
  * CentOS 8: 4.18
  * CentOS 9: 5.14
  * Debian 10: 4.19
  * Debian 11: 5.10
  * Fedora 35: 5.19
  * Fedora 36: 5.19
  * OpenSUSE 15.3: 5.3.0
  * Ubuntu 20.04: 5.4
  * Ubuntu 22.04: 5.15

The above ignores the 3rd version digit since distros update their
packages periodically and such updates don't generally affect public
APIs to the extent that it matters for our build time check.

Overall, we can set the baseline to 4.18 currently.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meson.build b/meson.build
index 8dc661363f..ea434767ac 100644
--- a/meson.build
+++ b/meson.build
@@ -248,6 +248,18 @@ if targetos == 'linux'
   add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
                         '-isystem', 'linux-headers',
                         language: ['c', 'cpp'])
+
+  if not cc.compiles('''
+    #include <linux/version.h>
+    int main(void) {
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 18, 0)
+#error "QEMU requires Linux kernel headers version >= 4.18.0"
+#endif
+      return 0;
+    }''')
+  error('QEMU requires Linux kernel headers version >= 4.18.0')
+endif
+
 endif
 
 add_project_arguments('-iquote', '.',
-- 
2.37.3


