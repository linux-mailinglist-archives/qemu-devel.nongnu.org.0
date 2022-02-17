Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE754B9FD1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:11:26 +0100 (CET)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfd7-0005dl-53
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:11:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ7-0003Wp-Kp
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ5-000150-O1
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gp5FUrYZXN2GWeFvDF8zAYCfrrI4Da5sf9J+T8I8ldg=;
 b=XkK6Q5WqGJxPI6nxT4CrBhXLZj60kS8vXsIyKinRvrGSHydszF3a6nnbGaifTSv0ekIRSo
 y334Qrz+AYJi+yK9LGyCtVSH+bDbIGizIzJj2oHQl1gyeLTd4EZkwWXtdK2EOUfri86dw2
 EfyInp+fes0HICAnUPwvpJ1Dpse+Q7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-dWYxxMikNya4fqxpe8eHxw-1; Thu, 17 Feb 2022 06:57:54 -0500
X-MC-Unique: dWYxxMikNya4fqxpe8eHxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DA9A1006AA3;
 Thu, 17 Feb 2022 11:57:53 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 325D5108648D;
 Thu, 17 Feb 2022 11:57:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] seccomp: block setns, unshare and execveat syscalls
Date: Thu, 17 Feb 2022 11:57:21 +0000
Message-Id: <20220217115723.1782616-9-berrange@redhat.com>
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

setns/unshare are used to change namespaces which is not something QEMU
needs to be able todo.

execveat is a new variant of execve so should be blocked just like
execve already is.

Acked-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/qemu-seccomp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index a7bb5c350f..deaf8a4ef5 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -248,6 +248,11 @@ static const struct QemuSeccompSyscall denylist[] = {
     { SCMP_SYS(clone3),                 QEMU_SECCOMP_SET_SPAWN,
       0, NULL, SCMP_ACT_ERRNO(ENOSYS) },
 #endif
+#ifdef __SNR_execveat
+    { SCMP_SYS(execveat),               QEMU_SECCOMP_SET_SPAWN },
+#endif
+    { SCMP_SYS(setns),                  QEMU_SECCOMP_SET_SPAWN },
+    { SCMP_SYS(unshare),                QEMU_SECCOMP_SET_SPAWN },
     /* resource control */
     { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL,
       0, NULL, SCMP_ACT_ERRNO(EPERM) },
-- 
2.34.1


