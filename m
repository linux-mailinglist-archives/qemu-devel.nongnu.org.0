Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C4A25B630
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 23:55:49 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDajM-00018Q-89
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 17:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kDahq-0007ug-Kk
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 17:54:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kDahn-0002aV-UA
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 17:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599083648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pb71fkE0tUwfPUi4tgmAfYpIsBy8o2zxmXVpC6K95eQ=;
 b=P6Ufbs+JG9IFss3MkM5Td9s1Ik0Gxaxqg4ByuhFwLVah6YE8oEGASmf4hVwxlbPlk/ZkME
 njzreRxm6SPARbuCAgAvqS/jxGc42GbZJ0mWnbRnSStmdrhMpSoTL5uW58hTEWcJLPUorg
 rhF85cvDYJ9bqTJEAWrJyQCdw0Bf3+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-VfXys_E5NzaPf6N2GeFHpw-1; Wed, 02 Sep 2020 17:54:06 -0400
X-MC-Unique: VfXys_E5NzaPf6N2GeFHpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 427E3802B6E;
 Wed,  2 Sep 2020 21:54:05 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-128.phx2.redhat.com [10.3.113.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAD1276E01;
 Wed,  2 Sep 2020 21:54:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] nbd: skip SIGTERM handler if NBD device support is not
 built
Date: Wed,  2 Sep 2020 16:53:59 -0500
Message-Id: <20200902215400.2673028-6-eblake@redhat.com>
In-Reply-To: <20200902215400.2673028-1-eblake@redhat.com>
References: <20200902215400.2673028-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 17:54:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The termsig_handler function is used by the client thread handling the
host NBD device connection to do a graceful shutdown. IOW, if we have
disabled NBD device support at compile time, we don't need the SIGTERM
handler. This fixes a build issue for Windows.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200825103850.119911-3-berrange@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-nbd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index b102874f0f46..dc6ef089afd5 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -155,12 +155,13 @@ QEMU_COPYRIGHT "\n"
     , name);
 }

+#if HAVE_NBD_DEVICE
 static void termsig_handler(int signum)
 {
     atomic_cmpxchg(&state, RUNNING, TERMINATE);
     qemu_notify_event();
 }
-
+#endif /* HAVE_NBD_DEVICE */

 static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
                                 const char *hostname)
@@ -587,6 +588,7 @@ int main(int argc, char **argv)
     unsigned socket_activation;
     const char *pid_file_name = NULL;

+#if HAVE_NBD_DEVICE
     /* The client thread uses SIGTERM to interrupt the server.  A signal
      * handler ensures that "qemu-nbd -v -c" exits with a nice status code.
      */
@@ -594,6 +596,7 @@ int main(int argc, char **argv)
     memset(&sa_sigterm, 0, sizeof(sa_sigterm));
     sa_sigterm.sa_handler = termsig_handler;
     sigaction(SIGTERM, &sa_sigterm, NULL);
+#endif /* HAVE_NBD_DEVICE */

 #ifdef CONFIG_POSIX
     signal(SIGPIPE, SIG_IGN);
-- 
2.28.0


