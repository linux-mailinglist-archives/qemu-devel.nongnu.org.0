Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A53B8721
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:34:37 +0200 (CEST)
Received: from localhost ([::1]:58504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydAa-0005JM-7w
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lycic-0006aH-GC
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lycia-0000OY-Jk
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625069138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Cdk/U+nPryMOmvQXXr5gOCPaWPOIn8SVkCuVEy9ZaH8=;
 b=Hp3HhTz0oG3mQ332FI8h/MAslYWRQSFEw/nLFihUbtBZGFZ0DlTgRC1usRLlGDaixzzXlU
 UqKektDgAttOLwqjZf66rtf0mhLhhzOSW5zdb8vrrJYITr8BH99oUwb2wVnzvaj11daODU
 9OB1TPewQ1/eZxf0IBEMcGHKAXPTlMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-xrSiYxRDNHyNZ-G0O2CmXQ-1; Wed, 30 Jun 2021 12:05:35 -0400
X-MC-Unique: xrSiYxRDNHyNZ-G0O2CmXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E70F1100C663
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 16:05:34 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-116.ams2.redhat.com
 [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A63F60843;
 Wed, 30 Jun 2021 16:05:28 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] seccomp: don't block getters for resource control syscalls
Date: Wed, 30 Jun 2021 17:05:26 +0100
Message-Id: <20210630160526.977225-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Florian Weimer <fweimer@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent GLibC calls sched_getaffinity in code paths related to malloc and
when QEMU blocks access, it sends it off into a bad codepath resulting
in stack exhaustion[1]. The GLibC bug is being fixed[2], but none the
less, GLibC has valid reasons to want to use sched_getaffinity.

It is not unreasonable for code to want to run many resource syscalls
for information gathering, so it is a bit too harsh for QEMU to block
them.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1975693
[2] https://sourceware.org/pipermail/libc-alpha/2021-June/128271.html
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 softmmu/qemu-seccomp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 9c29d9cf00..f50026778c 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -97,17 +97,11 @@ static const struct QemuSeccompSyscall denylist[] = {
     { SCMP_SYS(vfork),                  QEMU_SECCOMP_SET_SPAWN },
     { SCMP_SYS(execve),                 QEMU_SECCOMP_SET_SPAWN },
     /* resource control */
-    { SCMP_SYS(getpriority),            QEMU_SECCOMP_SET_RESOURCECTL },
     { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL },
     { SCMP_SYS(sched_setparam),         QEMU_SECCOMP_SET_RESOURCECTL },
-    { SCMP_SYS(sched_getparam),         QEMU_SECCOMP_SET_RESOURCECTL },
     { SCMP_SYS(sched_setscheduler),     QEMU_SECCOMP_SET_RESOURCECTL,
       ARRAY_SIZE(sched_setscheduler_arg), sched_setscheduler_arg },
-    { SCMP_SYS(sched_getscheduler),     QEMU_SECCOMP_SET_RESOURCECTL },
     { SCMP_SYS(sched_setaffinity),      QEMU_SECCOMP_SET_RESOURCECTL },
-    { SCMP_SYS(sched_getaffinity),      QEMU_SECCOMP_SET_RESOURCECTL },
-    { SCMP_SYS(sched_get_priority_max), QEMU_SECCOMP_SET_RESOURCECTL },
-    { SCMP_SYS(sched_get_priority_min), QEMU_SECCOMP_SET_RESOURCECTL },
 };
 
 static inline __attribute__((unused)) int
-- 
2.31.1


