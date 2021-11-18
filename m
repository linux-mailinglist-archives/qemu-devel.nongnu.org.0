Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1B455E63
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:39:44 +0100 (CET)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mniZj-0002VW-Gv
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:39:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mniWP-0004qc-IM
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mniWN-0004mq-T2
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637246175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RLvn5axLfKncylepktKIonBhDChuf9AdJ2wVIfSEnAM=;
 b=a1z81l5+CJg8Ovfnf9Pm/D6rEZSt6O1HPtbzL6WXHc6EdEN33okbDGv763zPsewr2XLlJS
 vswDStlghRXxihYzKy5qxCpnoUNmUxobHFlVCG4zlIGieMkTkCQBBuIsrMNnWEWXiJL6hY
 o6V+P/xuDa3Jpx5zqyww9x3bTPqGp7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-7KSAYSxrMKeCjGVMI_ByUg-1; Thu, 18 Nov 2021 09:36:13 -0500
X-MC-Unique: 7KSAYSxrMKeCjGVMI_ByUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 000851B2C981;
 Thu, 18 Nov 2021 14:36:12 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D7C179B3;
 Thu, 18 Nov 2021 14:36:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] block: print the server key type and fingerprint on
 failure
Date: Thu, 18 Nov 2021 14:35:47 +0000
Message-Id: <20211118143547.2045554-4-berrange@redhat.com>
In-Reply-To: <20211118143547.2045554-1-berrange@redhat.com>
References: <20211118143547.2045554-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When validating the server key fingerprint fails, it is difficult for
the user to know what they got wrong. The fingerprint accepted by QEMU
is received in a different format than openssh displays. There can also
be keys for multiple different ciphers in known_hosts. It may not be
obvious which cipher QEMU will use and whether it will be the same
as openssh. Address this by printing the server key type and its
corresponding fingerprint in the format QEMU accepts.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/ssh.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/block/ssh.c b/block/ssh.c
index fcc0ab765a..967a2b971e 100644
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
2.31.1


