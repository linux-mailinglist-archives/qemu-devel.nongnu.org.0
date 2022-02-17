Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC14B9FE5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:14:55 +0100 (CET)
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfgU-0002mT-Tr
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:14:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ5-0003We-2o
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ3-00014O-Jj
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5xzULTw/BnZuyWDZekuY5rxxT1b6x68WwqvWTCUq1Y=;
 b=ccjEsarihqABC8DruOw1o4foE6cAnHml6XqlwX+uexeZlwM6EiRtjlCW/oTV7PNuzn9Adi
 7XdsPL/0+Ph0nHWqR39NDnyBaPQt7/Meg/Eym4+pRM7fHmJXvGuHb8Lly79kibETb7hamC
 TwlOxc7zKJqIuCfgb0MGYeZTWjyEMMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-zZZy6drJOViJN77M7Nrx5A-1; Thu, 17 Feb 2022 06:57:51 -0500
X-MC-Unique: zZZy6drJOViJN77M7Nrx5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0CB81091DA0;
 Thu, 17 Feb 2022 11:57:50 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF8E3108648D;
 Thu, 17 Feb 2022 11:57:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] seccomp: block use of clone3 syscall
Date: Thu, 17 Feb 2022 11:57:20 +0000
Message-Id: <20220217115723.1782616-8-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modern glibc will use clone3 instead of clone, when it detects that it
is available. We need to compare flags in order to decide whether to
allow clone (thread create vs process fork), but in clone3 the flags
are hidden inside a struct. Seccomp can't currently match on data inside
a struct, so our only option is to block clone3 entirely. If we use
ENOSYS to block it, then glibc transparently falls back to clone.

This may need to be revisited if Linux adds a new architecture in
future and only provides clone3, without clone.

Acked-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/qemu-seccomp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 57139cc9ce..a7bb5c350f 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -244,6 +244,10 @@ static const struct QemuSeccompSyscall denylist[] = {
     RULE_CLONE_FLAG(CLONE_NEWPID),
     RULE_CLONE_FLAG(CLONE_NEWNET),
     RULE_CLONE_FLAG(CLONE_IO),
+#ifdef __SNR_clone3
+    { SCMP_SYS(clone3),                 QEMU_SECCOMP_SET_SPAWN,
+      0, NULL, SCMP_ACT_ERRNO(ENOSYS) },
+#endif
     /* resource control */
     { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL,
       0, NULL, SCMP_ACT_ERRNO(EPERM) },
-- 
2.34.1


