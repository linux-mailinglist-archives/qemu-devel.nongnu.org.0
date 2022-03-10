Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4264D501F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:22:03 +0100 (CET)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMUE-00047C-Qq
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:22:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMR8-0002Aq-P6
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMR4-0003Zd-Nt
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5N+ypWR28fOuZs48xWZjrvWy1P1WPlDvMHQasYd180=;
 b=dQewme46dLn2D3agp055XKtYg5kmtVs79Z+fQdJHBP47TTSkoCFsf+4falTCzOdz5JKfHI
 uySUAC5McJ1Dvsi2RR3wlZ0oIjehOS/yV2Yg2N2ryY2T1Si7AjcaPc20DaiF4H02TeabR+
 U6O5FxMBlQ6f3+av3bAZXdk+Nitzkq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-m6VbgcSyMuWLqR2hO3ECTA-1; Thu, 10 Mar 2022 12:18:40 -0500
X-MC-Unique: m6VbgcSyMuWLqR2hO3ECTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E365D1006AA7
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:18:39 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5BB8101E692;
 Thu, 10 Mar 2022 17:18:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/18] tests: fix encoding of IP addresses in x509 certs
Date: Thu, 10 Mar 2022 17:18:04 +0000
Message-Id: <20220310171821.3724080-2-berrange@redhat.com>
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to encode just the address bytes, not the whole struct sockaddr
data. Add a test case to validate that we're matching on SAN IP
addresses correctly.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/crypto-tls-x509-helpers.c | 16 +++++++++++++---
 tests/unit/test-crypto-tlssession.c  | 11 +++++++++--
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/tests/unit/crypto-tls-x509-helpers.c b/tests/unit/crypto-tls-x509-helpers.c
index fc609b3fd4..e9937f60d8 100644
--- a/tests/unit/crypto-tls-x509-helpers.c
+++ b/tests/unit/crypto-tls-x509-helpers.c
@@ -168,9 +168,19 @@ test_tls_get_ipaddr(const char *addrstr,
     hints.ai_flags = AI_NUMERICHOST;
     g_assert(getaddrinfo(addrstr, NULL, &hints, &res) == 0);
 
-    *datalen = res->ai_addrlen;
-    *data = g_new(char, *datalen);
-    memcpy(*data, res->ai_addr, *datalen);
+    if (res->ai_family == AF_INET) {
+        struct sockaddr_in *in = (struct sockaddr_in *)res->ai_addr;
+        *datalen = sizeof(in->sin_addr);
+        *data = g_new(char, *datalen);
+        memcpy(*data, &in->sin_addr, *datalen);
+    } else if (res->ai_family == AF_INET6) {
+        struct sockaddr_in6 *in = (struct sockaddr_in6 *)res->ai_addr;
+        *datalen = sizeof(in->sin6_addr);
+        *data = g_new(char, *datalen);
+        memcpy(*data, &in->sin6_addr, *datalen);
+    } else {
+        g_assert_not_reached();
+    }
     freeaddrinfo(res);
 }
 
diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
index 5f0da9192c..a6935d8497 100644
--- a/tests/unit/test-crypto-tlssession.c
+++ b/tests/unit/test-crypto-tlssession.c
@@ -512,12 +512,19 @@ int main(int argc, char **argv)
                   false, true, "wiki.qemu.org", NULL);
 
     TEST_SESS_REG(altname4, cacertreq.filename,
+                  servercertalt1req.filename, clientcertreq.filename,
+                  false, false, "192.168.122.1", NULL);
+    TEST_SESS_REG(altname5, cacertreq.filename,
+                  servercertalt1req.filename, clientcertreq.filename,
+                  false, false, "fec0::dead:beaf", NULL);
+
+    TEST_SESS_REG(altname6, cacertreq.filename,
                   servercertalt2req.filename, clientcertreq.filename,
                   false, true, "qemu.org", NULL);
-    TEST_SESS_REG(altname5, cacertreq.filename,
+    TEST_SESS_REG(altname7, cacertreq.filename,
                   servercertalt2req.filename, clientcertreq.filename,
                   false, false, "www.qemu.org", NULL);
-    TEST_SESS_REG(altname6, cacertreq.filename,
+    TEST_SESS_REG(altname8, cacertreq.filename,
                   servercertalt2req.filename, clientcertreq.filename,
                   false, false, "wiki.qemu.org", NULL);
 
-- 
2.34.1


