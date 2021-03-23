Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7990E34631D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:41:12 +0100 (CET)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOj9b-0001ZF-GQ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj5C-0004dW-MT
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj52-00031X-T2
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616513788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJ9OfVOUw9TcSAS9h9oFSdZNfXMydVHso/BGYO5/2gc=;
 b=Ps0pny9ojmwlqmXchPu3aHgSpb9SvQlC/09caxt4ox6yTZH8bEkV7/EtD0d332M+yi/l+Y
 HiGPi5YtPqmmK4Rw2j018g+JKqY14TiT8liymNuBawLrExtGb6AXWuSuHiuUMgNGkw+Ej7
 BI3+FXJG2daWYHM4botInp+iizXJNhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365--ftAeABzMXGr1xBVGWE0-w-1; Tue, 23 Mar 2021 11:36:23 -0400
X-MC-Unique: -ftAeABzMXGr1xBVGWE0-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8072814339;
 Tue, 23 Mar 2021 15:36:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F0BE60918;
 Tue, 23 Mar 2021 15:36:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 00563180039E; Tue, 23 Mar 2021 16:36:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] vnc: support reload x509 certificates for vnc
Date: Tue, 23 Mar 2021 16:36:13 +0100
Message-Id: <20210323153616.873822-3-kraxel@redhat.com>
In-Reply-To: <20210323153616.873822-1-kraxel@redhat.com>
References: <20210323153616.873822-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Zihao Chang <changzihao1@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zihao Chang <changzihao1@huawei.com>

This patch add vnc_display_reload_certs() to support
update x509 certificates.

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210316075845.1476-3-changzihao1@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h |  1 +
 ui/vnc.c             | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index c960b7066ccd..2714038a0fae 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -476,6 +476,7 @@ int vnc_display_password(const char *id, const char *password);
 int vnc_display_pw_expire(const char *id, time_t expires);
 void vnc_parse(const char *str);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
+bool vnc_display_reload_certs(const char *id,  Error **errp);
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/ui/vnc.c b/ui/vnc.c
index e0fac2136ea3..456db47d713d 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -585,6 +585,34 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
     return prev;
 }
 
+bool vnc_display_reload_certs(const char *id, Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(id);
+    QCryptoTLSCredsClass *creds = NULL;
+
+    if (!vd) {
+        error_setg(errp, "Can not find vnc display");
+        return false;
+    }
+
+    if (!vd->tlscreds) {
+        error_setg(errp, "vnc tls is not enable");
+        return false;
+    }
+
+    creds = QCRYPTO_TLS_CREDS_GET_CLASS(OBJECT(vd->tlscreds));
+    if (creds->reload == NULL) {
+        error_setg(errp, "%s doesn't support to reload TLS credential",
+                   object_get_typename(OBJECT(vd->tlscreds)));
+        return false;
+    }
+    if (!creds->reload(vd->tlscreds, errp)) {
+        return false;
+    }
+
+    return true;
+}
+
 /* TODO
    1) Get the queue working for IO.
    2) there is some weirdness when using the -S option (the screen is grey
-- 
2.30.2


