Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E683C54CBED
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:55:01 +0200 (CEST)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UQ8-0000c2-Sr
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO5-00064C-Kj
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO2-0000yy-9A
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:53 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FEE6kK002105;
 Wed, 15 Jun 2022 14:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=0hwhAnCTAsnyp97yEcjJRHIWRLmHxXmp9NPtfA8gELQ=;
 b=OPq28qa+1bjmw1bauON3Ql0heif7FphvxM/5g7UXGhymjNUMaVekyMK+mjwvxeC4yTbm
 hb4kdcr0RGZizcu2Kq93nV2Y2Rcb78sTfvh7Zm4qYi9itLE0k0GAZQwfVRj3KmBegw5l
 rSQAChsYIfQKBjekfuG9wDQ5kgcXil/XIJgZPkKfHpB6GNWaCuxsG4f8Oe2L1aBMET8W
 bFN3af2yKtoTl7vJxWaqHESY+iIJxMr4jTzHPyf6Ztg0bdB472qseN8T/fAKDVc6vFD6
 Bz4FayZciClCLKWsbMyl8Xj9yPfQ9wJjxT3Q1UYt/XXHJltvCvZAz8rgqBZsSHnKoC5V /w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrsh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:32 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7dv023149; Wed, 15 Jun 2022 14:52:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:31 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSMl018501;
 Wed, 15 Jun 2022 14:52:30 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-3; Wed, 15 Jun 2022 14:52:30 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 02/39] migration: qemu file wrappers
Date: Wed, 15 Jun 2022 07:51:49 -0700
Message-Id: <1655304746-102776-3-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: Q-ebxbjF2OLyrkSZvAqNoFt0NR5eX9gI
X-Proofpoint-GUID: Q-ebxbjF2OLyrkSZvAqNoFt0NR5eX9gI
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
files and file descriptors.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
 migration/qemu-file-channel.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index bb5a575..cc5aebc 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -27,8 +27,10 @@
 #include "qemu-file.h"
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
+#include "io/channel-file.h"
 #include "qemu/iov.h"
 #include "qemu/yank.h"
+#include "qapi/error.h"
 #include "yank_functions.h"
 
 
@@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
     object_ref(OBJECT(ioc));
     return qemu_fopen_ops(ioc, &channel_output_ops, true);
 }
+
+QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
+                          const char *name, Error **errp)
+{
+    g_autoptr(QIOChannelFile) fioc = NULL;
+    QIOChannel *ioc;
+    QEMUFile *f;
+
+    if (flags & O_RDWR) {
+        error_setg(errp, "qemu_fopen_file %s: O_RDWR not supported", path);
+        return NULL;
+    }
+
+    fioc = qio_channel_file_new_path(path, flags, mode, errp);
+    if (!fioc) {
+        return NULL;
+    }
+
+    ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    return f;
+}
+
+QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name)
+{
+    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
+    QIOChannel *ioc = QIO_CHANNEL(fioc);
+    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
+                             qemu_fopen_channel_input(ioc);
+    qio_channel_set_name(ioc, name);
+    return f;
+}
diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
index 0028a09..75fd0ad 100644
--- a/migration/qemu-file-channel.h
+++ b/migration/qemu-file-channel.h
@@ -29,4 +29,10 @@
 
 QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
 QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
+
+QEMUFile *qemu_fopen_file(const char *path, int flags, int mode,
+                         const char *name, Error **errp);
+
+QEMUFile *qemu_fopen_fd(int fd, bool writable, const char *name);
+
 #endif
-- 
1.8.3.1


