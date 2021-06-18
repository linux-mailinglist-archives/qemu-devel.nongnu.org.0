Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9666D3AC2A4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 06:56:53 +0200 (CEST)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6Ym-0006HS-1x
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 00:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6WK-0003RD-PZ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6WH-0003TE-PB
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPUwOMaFMUh5eVDQPE9lx5VShQQ3ydFde10iSZQRwDg=;
 b=Ho665vjzKw7zHiL6+fQqUdhANXE6Ue3wyxLY9sGvp35xpi+M7RaCDrh1APBepjSXDnjVui
 uP49BptKT6Q3c+Kk138V+Vl4RAZ/zJS3SnwtgXpXng04UgD0XiCdn7LsWn9HxaND0D0WSl
 NZnvQt7ix5AXxzHLmQG2nezOVQy+mD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-9LO1q8FzOJC28fs1UN6fjQ-1; Fri, 18 Jun 2021 00:54:15 -0400
X-MC-Unique: 9LO1q8FzOJC28fs1UN6fjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF70DFC9D;
 Fri, 18 Jun 2021 04:54:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78F6C5D9CC;
 Fri, 18 Jun 2021 04:53:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F318E1800D7B; Fri, 18 Jun 2021 06:53:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/24] modules: add modinfo macros
Date: Fri, 18 Jun 2021 06:53:30 +0200
Message-Id: <20210618045353.2510174-2-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add macros for module info annotations.

Instead of having that module meta-data stored in lists in util/module.c
place directly in the module source code.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/qemu/module.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 944d403cbd15..81ef086da023 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -73,4 +73,29 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 
+/*
+ * module info annotation macros
+ *
+ * scripts/modinfo-collect.py will collect module info,
+ * using the preprocessor and -DQEMU_MODINFO
+ */
+#ifdef QEMU_MODINFO
+# define modinfo(kind, value) \
+    MODINFO_START kind value MODINFO_END
+#else
+# define modinfo(kind, value)
+#endif
+
+/* module implements QOM type <name> */
+#define module_obj(name) modinfo(obj, name)
+
+/* module has a dependency on <name> */
+#define module_dep(name) modinfo(dep, name)
+
+/* module is for target architecture <name> */
+#define module_arch(name) modinfo(arch, name)
+
+/* module registers QemuOpts <name> */
+#define module_opts(name) modinfo(opts, name)
+
 #endif
-- 
2.31.1


