Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96502516B5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 12:40:07 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAWN5-0003gc-0D
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 06:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWM2-0002OB-C3
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 06:39:02 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38892
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWM0-0007Ku-Nv
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 06:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598351939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arnG0ivEP7v5x89slX1na5RDOaxnf6UbNLXqzU+IsTE=;
 b=RaW1sgEDHf89o1+HMO9hku9aHH5PNxYwF4vbbst273LsRHqPF6/nMMfpDs0CSe+CCPu+Gm
 4XBXmYM5ifzbb40DIolEZHMU+urEBvs5rWyC7vq9trK9jWIopmacYZ14lKmD+9/maglzg3
 h1WJbOUWj/liUeI/civKDmXP7PtqMYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-dR8VrAxVNMmMYngqpsOuFA-1; Tue, 25 Aug 2020 06:38:57 -0400
X-MC-Unique: dR8VrAxVNMmMYngqpsOuFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC07F1DE08;
 Tue, 25 Aug 2020 10:38:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-231.ams2.redhat.com
 [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53CC85C1CF;
 Tue, 25 Aug 2020 10:38:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] nbd: skip SIGTERM handler if NBD device support is not
 built
Date: Tue, 25 Aug 2020 11:38:49 +0100
Message-Id: <20200825103850.119911-3-berrange@redhat.com>
In-Reply-To: <20200825103850.119911-1-berrange@redhat.com>
References: <20200825103850.119911-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The termsig_handler function is used by the client thread handling the
host NBD device connection to do a graceful shutdown. IOW, if we have
disabled NBD device support at compile time, we don't need the SIGTERM
handler. This fixes a build issue for Windows.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-nbd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index b102874f0f..dc6ef089af 100644
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
2.26.2


