Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B31402941
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:54:01 +0200 (CEST)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNabw-0001Yq-M4
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa9j-0007S5-HD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa9a-0008Hi-M5
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGt+B4w/EtTevt91wzwwGAAD7XdUTOF5gSRxxJjaZWs=;
 b=SoSE/6job9rnT0Hlmh+eMk7lz4t78KkRYiQo9rs9AEAWMfp1OgKQ7Dfz/ApiEnfuQzDNfu
 Hj6oWo8DV0Ok6j3Lo0TqSaV+yDpj4U4ACFfNxlwSZRZ1zyFpHeTwBe0/Q5mgdb/rZRgKbc
 4t9/Th7XOngmASwqbTkuDnBjzRN10EA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-hHf4MAIyNg-O-71yyivfYg-1; Tue, 07 Sep 2021 08:24:40 -0400
X-MC-Unique: hHf4MAIyNg-O-71yyivfYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBF641006C85
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:24:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95D4860657;
 Tue,  7 Sep 2021 12:24:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 22/32] qga: build qapi-cabi binary (ABI from C)
Date: Tue,  7 Sep 2021 16:19:33 +0400
Message-Id: <20210907121943.3498701-23-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Build a binary to dump the QAPI ABI (from C code). Ex:

$ qga/qapi-cabi
GuestAgentCommandInfo struct: sizeof=16
 name member: sizeof=8 offset=0
 enabled member: sizeof=1 offset=8
 success_response member: sizeof=1 offset=9
...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/qapi-cabi.c |  9 +++++++++
 qga/meson.build | 12 ++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 qga/qapi-cabi.c

diff --git a/qga/qapi-cabi.c b/qga/qapi-cabi.c
new file mode 100644
index 0000000000..0704e70869
--- /dev/null
+++ b/qga/qapi-cabi.c
@@ -0,0 +1,9 @@
+#include "qemu/osdep.h"
+
+#include "qga-qapi-types.h"
+
+int main(int argc, const char *argv[])
+{
+    qapi_cabi();
+    return 0;
+}
diff --git a/qga/meson.build b/qga/meson.build
index cfb1fbc085..1b050d8c53 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -21,6 +21,18 @@ qga_qapi_files = custom_target('QGA QAPI files',
                                command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@' ],
                                depend_files: qapi_gen_depends)
 
+i = 0
+srcs = [files('qapi-cabi.c')]
+foreach output: qga_qapi_outputs
+  if output.startswith('qga-qapi-types') or output.startswith('qga-qapi-visit')
+    srcs += qga_qapi_files[i]
+  endif
+  i += 1
+endforeach
+qga_qapi_cabi = executable('qapi-cabi', srcs,
+                           dependencies: [qemuutil],
+                           c_args: ['-DQAPI_CABI'])
+
 qga_ss = ss.source_set()
 qga_ss.add(qga_qapi_files.to_list())
 qga_ss.add(files(
-- 
2.33.0.113.g6c40894d24


