Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7D94B9F82
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:01:17 +0100 (CET)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfTI-000665-5m
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:01:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPp-00036Y-20
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPn-00011n-E6
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrVpYs8lGzNh+QkC+LzegzMdgsdDAN4YMxzKWVHaI34=;
 b=Q9t606AYtTxJ11JbBo3zAYXCUyNauViPJvrJw3eSlVDXSvxL377ZETjpLD4x52IY2MZT6z
 7CCOYtluuY/zHdBxkrOQOpgHNU89X6qkwjGJHdVh5gs7O8qBMISP4cxFR2OseU/pBZVEpx
 bIbw+Xnt/n5WUOVrgvbEbHVEnBh5Khg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-_h_zCT_6PCaS4vOdPN5Dvw-1; Thu, 17 Feb 2022 06:57:37 -0500
X-MC-Unique: _h_zCT_6PCaS4vOdPN5Dvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A054F1F2DB;
 Thu, 17 Feb 2022 11:57:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE18B108648F;
 Thu, 17 Feb 2022 11:57:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] block: print the server key type and fingerprint on
 failure
Date: Thu, 17 Feb 2022 11:57:16 +0000
Message-Id: <20220217115723.1782616-4-berrange@redhat.com>
In-Reply-To: <20220217115723.1782616-1-berrange@redhat.com>
References: <20220217115723.1782616-1-berrange@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When validating the server key fingerprint fails, it is difficult for
the user to know what they got wrong. The fingerprint accepted by QEMU
is received in a different format than OpenSSH displays. There can also
be keys for multiple different ciphers in known_hosts. It may not be
obvious which cipher QEMU will use and whether it will be the same
as OpenSSH. Address this by printing the server key type and its
corresponding fingerprint in the format QEMU accepts.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/ssh.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/block/ssh.c b/block/ssh.c
index ac01301409..a64db146db 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -386,14 +386,28 @@ static int compare_fingerprint(const unsigned char *fingerprint, size_t len,
     return *host_key_check - '\0';
 }
 
+static char *format_fingerprint(const unsigned char *fingerprint, size_t len)
+{
+    static const char *hex = "0123456789abcdef";
+    char *ret = g_new0(char, (len * 2) + 1);
+    for (size_t i = 0; i < len; i++) {
+        ret[i * 2] = hex[((fingerprint[i] >> 4) & 0xf)];
+        ret[(i * 2) + 1] = hex[(fingerprint[i] & 0xf)];
+    }
+    ret[len * 2] = '\0';
+    return ret;
+}
+
 static int
 check_host_key_hash(BDRVSSHState *s, const char *hash,
-                    enum ssh_publickey_hash_type type, Error **errp)
+                    enum ssh_publickey_hash_type type, const char *typestr,
+                    Error **errp)
 {
     int r;
     ssh_key pubkey;
     unsigned char *server_hash;
     size_t server_hash_len;
+    const char *keytype;
 
     r = ssh_get_server_publickey(s->session, &pubkey);
     if (r != SSH_OK) {
@@ -401,6 +415,8 @@ check_host_key_hash(BDRVSSHState *s, const char *hash,
         return -EINVAL;
     }
 
+    keytype = ssh_key_type_to_char(ssh_key_type(pubkey));
+
     r = ssh_get_publickey_hash(pubkey, type, &server_hash, &server_hash_len);
     ssh_key_free(pubkey);
     if (r != 0) {
@@ -410,12 +426,16 @@ check_host_key_hash(BDRVSSHState *s, const char *hash,
     }
 
     r = compare_fingerprint(server_hash, server_hash_len, hash);
-    ssh_clean_pubkey_hash(&server_hash);
     if (r != 0) {
-        error_setg(errp, "remote host key does not match host_key_check '%s'",
-                   hash);
+        g_autofree char *server_fp = format_fingerprint(server_hash,
+                                                        server_hash_len);
+        error_setg(errp, "remote host %s key fingerprint '%s:%s' "
+                   "does not match host_key_check '%s:%s'",
+                   keytype, typestr, server_fp, typestr, hash);
+        ssh_clean_pubkey_hash(&server_hash);
         return -EPERM;
     }
+    ssh_clean_pubkey_hash(&server_hash);
 
     return 0;
 }
@@ -436,13 +456,16 @@ static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error **errp)
     case SSH_HOST_KEY_CHECK_MODE_HASH:
         if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_MD5) {
             return check_host_key_hash(s, hkc->u.hash.hash,
-                                       SSH_PUBLICKEY_HASH_MD5, errp);
+                                       SSH_PUBLICKEY_HASH_MD5, "md5",
+                                       errp);
         } else if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_SHA1) {
             return check_host_key_hash(s, hkc->u.hash.hash,
-                                       SSH_PUBLICKEY_HASH_SHA1, errp);
+                                       SSH_PUBLICKEY_HASH_SHA1, "sha1",
+                                       errp);
         } else if (hkc->u.hash.type == SSH_HOST_KEY_CHECK_HASH_TYPE_SHA256) {
             return check_host_key_hash(s, hkc->u.hash.hash,
-                                       SSH_PUBLICKEY_HASH_SHA256, errp);
+                                       SSH_PUBLICKEY_HASH_SHA256, "sha256",
+                                       errp);
         }
         g_assert_not_reached();
         break;
-- 
2.34.1


