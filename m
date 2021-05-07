Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E696837657A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:49:02 +0200 (CEST)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezuf-00011m-Hj
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbW-0000mo-Sg
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:14 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbT-0001Wk-Te
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:14 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CEAsD096895;
 Fri, 7 May 2021 12:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=2hHfE6MEGogQzthqOH4vqs5xuVFIGzYUunqFpRHnOoY=;
 b=JQFmzg7vDUfJQtebpqiKUZ+JGMcjUw5FGcLHRjrsUzj8cr0Vx+br1Mm1/vKimYkVGRJW
 vJsaPbCcYl06YQZLR0KSU6yZcIHBd7lb958h67niIvLMQ1UIp0OqAUNNO2hMqirZYPHD
 CeokcHggXNKVg6Gq08wgTLGazL3KV5O5Bl/1JQsy/+bNzdu3Y1H88sJWc2V/ASGxP5cS
 29Ur55UZf5AMC5M9DWRojfVddVoVnb08k07NuS0mC3EsP/79P8MNOgBs9F9Y9LqIeW5R
 TBMEn8n5kTCXsIWkD45SRja7iR93Ga2zXrCXKZajRPvRQwZitifJ3ydLcCgWcSJWqAA3 jw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 38ctd89d1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFk5w168050;
 Fri, 7 May 2021 12:29:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38csrh1tdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:07 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CT6J1014797;
 Fri, 7 May 2021 12:29:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 38csrh1tbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:06 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CT5Yk017267;
 Fri, 7 May 2021 12:29:05 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:29:04 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 18/22] chardev: cpr for pty
Date: Fri,  7 May 2021 05:25:16 -0700
Message-Id: <1620390320-301716-19-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: pQkN0eIlm8dbRZYQcrHOUCR0KKiGDKA5
X-Proofpoint-ORIG-GUID: pQkN0eIlm8dbRZYQcrHOUCR0KKiGDKA5
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Save and restore pty descriptors across cprsave and cprload.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-pty.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a2d1e7c..c91151d 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -30,6 +30,7 @@
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qemu/env.h"
 #include "qemu/qemu-print.h"
 
 #include "chardev/char-io.h"
@@ -191,6 +192,7 @@ static void char_pty_finalize(Object *obj)
     Chardev *chr = CHARDEV(obj);
     PtyChardev *s = PTY_CHARDEV(obj);
 
+    unsetenv_fd(chr->label);
     pty_chr_state(chr, 0);
     object_unref(OBJECT(s->ioc));
     pty_chr_timer_cancel(s);
@@ -207,19 +209,28 @@ static void char_pty_open(Chardev *chr,
     char pty_name[PATH_MAX];
     char *name;
 
+    master_fd = getenv_fd(chr->label);
+    if (master_fd >= 0) {
+        chr->filename = g_strdup_printf("pty:unknown");
+        goto have_fd;
+    }
+
     master_fd = qemu_openpty_raw(&slave_fd, pty_name);
     if (master_fd < 0) {
         error_setg_errno(errp, errno, "Failed to create PTY");
         return;
     }
-
+    if (!chr->close_on_cpr) {
+        setenv_fd(chr->label, master_fd);
+    }
     close(slave_fd);
     qemu_set_nonblock(master_fd);
-
     chr->filename = g_strdup_printf("pty:%s", pty_name);
     qemu_printf("char device redirected to %s (label %s)\n",
                 pty_name, chr->label);
 
+have_fd:
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     s = PTY_CHARDEV(chr);
     s->ioc = QIO_CHANNEL(qio_channel_file_new_fd(master_fd));
     name = g_strdup_printf("chardev-pty-%s", chr->label);
-- 
1.8.3.1


