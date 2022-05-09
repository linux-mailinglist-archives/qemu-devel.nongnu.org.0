Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B35200C0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 17:10:59 +0200 (CEST)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no52I-0001JC-Mb
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 11:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no4up-00017c-QC
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no4uo-0002m3-6Q
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652108593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXa43/wuUmBmfE15wlsNpmHjei0+PR+2nwLY/5VcxYg=;
 b=DEtg/UhlnJjxQQzUM+zpD2Gk0rhcOcYO/HrZEAvkm2RQHhgC/TbGPeQihRUv/YUfm17Zjh
 eG24VPrmEQK5zUUkp37Z3jVC1YkN4bF/lK594HGGGnfoEwtsTPXo1avrRhEt73SOguTs9R
 CbkxesyEAaEGgx4ytwN7Y0T1j3miJzg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-KIdcBlWjPniiuuMahqh5MQ-1; Mon, 09 May 2022 11:03:01 -0400
X-MC-Unique: KIdcBlWjPniiuuMahqh5MQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B96B93C62B70
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 15:03:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.193.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A95A5C07F43;
 Mon,  9 May 2022 15:02:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 01/16] tests: fix encoding of IP addresses in x509 certs
Date: Mon,  9 May 2022 16:02:38 +0100
Message-Id: <20220509150253.218715-2-dgilbert@redhat.com>
In-Reply-To: <20220509150253.218715-1-dgilbert@redhat.com>
References: <20220509150253.218715-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

We need to encode just the address bytes, not the whole struct sockaddr
data. Add a test case to validate that we're matching on SAN IP
addresses correctly.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220426160048.812266-2-berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
index a266dc32da..f222959d36 100644
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
2.36.0


