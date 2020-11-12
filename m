Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CAF2B0C60
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:11:15 +0100 (CET)
Received: from localhost ([::1]:50032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdH3y-00062b-Qp
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGt6-0001JO-JX
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGt3-0000nY-9F
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l6yCkydgfIDA8tx/k5dlAWhfUPdQSZs1lMGYS3SF75c=;
 b=gky3EOksrKa8l5tQJBu6+Yh1U79DOT0RNlvvGeNMtbCAeC79TQYlIBOIcTgR5/e0LsOQgE
 VB3pFIFG22yfrA7m5l9pjap/fxDulvdGK0HR7Z2Xfh5L4543l/NVA0psITWbFwAd0Zg/4U
 voLyZE8sQOSqOnGP2mZoaMr6v5XGP1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-tMxNVmDDMvGEMtQdtB5qPA-1; Thu, 12 Nov 2020 12:59:45 -0500
X-MC-Unique: tMxNVmDDMvGEMtQdtB5qPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98FE280475A
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:44 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F57E1002C13;
 Thu, 12 Nov 2020 17:59:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/13] char: Remove qemu_chr_parse_opts()
Date: Thu, 12 Nov 2020 18:59:04 +0100
Message-Id: <20201112175905.404472-13-kwolf@redhat.com>
In-Reply-To: <20201112175905.404472-1-kwolf@redhat.com>
References: <20201112175905.404472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
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
Cc: kwolf@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is unused now, remove it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/chardev/char.h | 10 ----------
 chardev/char.c         | 37 -------------------------------------
 2 files changed, 47 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index 5cd46207f6..761c521bd8 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -146,16 +146,6 @@ void qemu_chr_translate_legacy_options(QDict *args);
  */
 void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend);
 
-/**
- * qemu_chr_parse_opts:
- *
- * Parse the options to the ChardevBackend struct.
- *
- * Returns: a new backend or NULL on error
- */
-ChardevBackend *qemu_chr_parse_opts(QemuOpts *opts,
-                                    Error **errp);
-
 /**
  * qemu_chr_new:
  * @label: the name of the backend
diff --git a/chardev/char.c b/chardev/char.c
index 4a444a0353..c3cfd473b4 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -610,43 +610,6 @@ static const char *chardev_alias_translate(const char *name)
     return name;
 }
 
-ChardevBackend *qemu_chr_parse_opts(QemuOpts *opts, Error **errp)
-{
-    Error *local_err = NULL;
-    const ChardevClass *cc;
-    ChardevBackend *backend = NULL;
-    const char *name = chardev_alias_translate(qemu_opt_get(opts, "backend"));
-
-    if (name == NULL) {
-        error_setg(errp, "chardev: \"%s\" missing backend",
-                   qemu_opts_id(opts));
-        return NULL;
-    }
-
-    cc = char_get_class(name, errp);
-    if (cc == NULL) {
-        return NULL;
-    }
-
-    backend = g_new0(ChardevBackend, 1);
-    backend->type = CHARDEV_BACKEND_KIND_NULL;
-
-    if (cc->parse) {
-        cc->parse(opts, backend, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            qapi_free_ChardevBackend(backend);
-            return NULL;
-        }
-    } else {
-        ChardevCommon *ccom = g_new0(ChardevCommon, 1);
-        qemu_chr_parse_common(opts, ccom);
-        backend->u.null.data = ccom; /* Any ChardevCommon member would work */
-    }
-
-    return backend;
-}
-
 void qemu_chr_print_types(void)
 {
     g_autoptr(GString) str = g_string_new("");
-- 
2.28.0


