Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD533DD67E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:09:08 +0200 (CEST)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXgp-0002fV-Ax
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXbF-0000jM-KU
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXbE-0000S3-Ae
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627909399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0gCLMAdEl7pQfQ6TSrm/lELvECOWIakWq73URsq4yQ=;
 b=W2rdo71bRo4UdfuIxIPshCJe+vzGZ7SlvccPZZgStA1zJgth4lBT67cP6bh+7jEWAD0U4o
 tz0u+ht9Ck4LB+AefkYViPcjp3nRt+o+pUNwNH+RN/A7LWRUXEY0y6O3wq2Hs9qYkgzEDF
 RUGW3X0F+26KYjWr+o4aMwzHN5JBlas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-LdsMNu_cOKiE885BtM-B_A-1; Mon, 02 Aug 2021 09:03:17 -0400
X-MC-Unique: LdsMNu_cOKiE885BtM-B_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5407734891
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 13:03:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F8AE5FC23;
 Mon,  2 Aug 2021 13:03:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] seccomp: block setns, unshare and execveat syscalls
Date: Mon,  2 Aug 2021 14:03:03 +0100
Message-Id: <20210802130303.3300108-6-berrange@redhat.com>
In-Reply-To: <20210802130303.3300108-1-berrange@redhat.com>
References: <20210802130303.3300108-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

setns/unshare are used to change namespaces which is not something QEMU
needs to be able todo.

execveat is a new variant of execve so should be blocked just like
execve already is.

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
2.31.1


