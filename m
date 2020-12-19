Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D3F2DEE68
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:07:59 +0100 (CET)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqa5e-0003ju-3K
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtr-0004on-Lc
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtl-0007Go-A8
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/d3mzP8nvBbMA3ku1d3EdmHDICO8fDbwDwYwndxAmlI=;
 b=iB3JprR4b+pP68gF0cWPzdh6EQ3xtFUSPGeyaW3QHPpVoNJ6q3ZI02P2ZZpcUvNZKkNz2w
 55uPTjeSRz/1MFDaoLgDHF/TuCUOhWai2oZi9wbXfNk6+ABFq1NOUh8s/f0yHe9I68QLra
 j0M3bUZvENmws7VNpUAx4bUCj38tjKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127--slwTxFWN3WNIEPIS3RKhg-1; Sat, 19 Dec 2020 05:55:38 -0500
X-MC-Unique: -slwTxFWN3WNIEPIS3RKhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9D8051E2;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD90671D53;
 Sat, 19 Dec 2020 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0BC311268A1; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] Revert "qstring: add qstring_free()"
Date: Sat, 19 Dec 2020 11:55:18 +0100
Message-Id: <20201219105532.1734134-20-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 164c374b75f87c6765a705c4418ab7005a2d356f.

A free function for a reference-counted object is in bad taste.
Fortunately, this one is now also unused.  Drop it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-7-armbru@redhat.com>
---
 include/qapi/qmp/qstring.h |  1 -
 qobject/qstring.c          | 27 +++++----------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
index ae7698d6c7..ae5b4b44d2 100644
--- a/include/qapi/qmp/qstring.h
+++ b/include/qapi/qmp/qstring.h
@@ -34,7 +34,6 @@ void qstring_append_int(QString *qstring, int64_t value);
 void qstring_append(QString *qstring, const char *str);
 void qstring_append_chr(QString *qstring, int c);
 bool qstring_is_equal(const QObject *x, const QObject *y);
-char *qstring_free(QString *qstring, bool return_str);
 void qstring_destroy_obj(QObject *obj);
 
 #endif /* QSTRING_H */
diff --git a/qobject/qstring.c b/qobject/qstring.c
index af7c18ca73..c1891beda0 100644
--- a/qobject/qstring.c
+++ b/qobject/qstring.c
@@ -168,33 +168,16 @@ bool qstring_is_equal(const QObject *x, const QObject *y)
                    qobject_to(QString, y)->string);
 }
 
-/**
- * qstring_free(): Free the memory allocated by a QString object
- *
- * Return: if @return_str, return the underlying string, to be
- * g_free(), otherwise NULL is returned.
- */
-char *qstring_free(QString *qstring, bool return_str)
-{
-    char *rv = NULL;
-
-    if (return_str) {
-        rv = qstring->string;
-    } else {
-        g_free(qstring->string);
-    }
-
-    g_free(qstring);
-
-    return rv;
-}
-
 /**
  * qstring_destroy_obj(): Free all memory allocated by a QString
  * object
  */
 void qstring_destroy_obj(QObject *obj)
 {
+    QString *qs;
+
     assert(obj != NULL);
-    qstring_free(qobject_to(QString, obj), FALSE);
+    qs = qobject_to(QString, obj);
+    g_free(qs->string);
+    g_free(qs);
 }
-- 
2.26.2


