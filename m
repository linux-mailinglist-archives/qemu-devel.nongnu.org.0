Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6EF2A34E1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 21:08:20 +0100 (CET)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZg7n-0007CP-SM
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 15:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZfxR-0003Sy-R3
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 14:57:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZfxN-0002J5-Cm
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 14:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604347052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pF86Yc0J9ZIwLKCrD3/np6G0cyJSDkDFvK23bLbLoAo=;
 b=YRvAAnswzi9mz1xDG2ZpoxQZ5yJ5SQ8IaqR7yzDVeBpjTaW3XBaLt0fL38CSLXMI4AXnLI
 foyrdi7zktefCIpLlOLqXzDPgnyoD1aZqLWdPhi4QlAn/F4xFAhwrsiwloBvxldm+h5zKU
 0/QMpVstpr85d6h73xsEMYAVgCnX90s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-hJukeewAPx2jaYoydNiCaw-1; Mon, 02 Nov 2020 14:57:29 -0500
X-MC-Unique: hJukeewAPx2jaYoydNiCaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65A671006C9F;
 Mon,  2 Nov 2020 19:57:28 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-142.ams2.redhat.com
 [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C68801002C18;
 Mon,  2 Nov 2020 19:57:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com, philmd@redhat.com,
 zhangjiachen.jaycee@bytedance.com, mreitz@redhat.com
Subject: [PULL 08/12] meson.build: Check for statx()
Date: Mon,  2 Nov 2020 19:56:53 +0000
Message-Id: <20201102195657.219501-9-dgilbert@redhat.com>
In-Reply-To: <20201102195657.219501-1-dgilbert@redhat.com>
References: <20201102195657.219501-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Check whether the glibc provides statx() and if so, define CONFIG_STATX.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201102161859.156603-4-mreitz@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 meson.build | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meson.build b/meson.build
index 47e32e1fcb..39ac5cf6d8 100644
--- a/meson.build
+++ b/meson.build
@@ -736,6 +736,21 @@ if not has_malloc_trim and get_option('malloc_trim').enabled()
   endif
 endif
 
+# Check whether the glibc provides statx()
+
+statx_test = '''
+  #ifndef _GNU_SOURCE
+  #define _GNU_SOURCE
+  #endif
+  #include <sys/stat.h>
+  int main(void) {
+    struct statx statxbuf;
+    statx(0, "", 0, STATX_BASIC_STATS, &statxbuf);
+    return 0;
+  }'''
+
+has_statx = cc.links(statx_test)
+
 #################
 # config-host.h #
 #################
@@ -768,6 +783,7 @@ config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
 config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
+config_host_data.set('CONFIG_STATX', has_statx)
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
-- 
2.28.0


