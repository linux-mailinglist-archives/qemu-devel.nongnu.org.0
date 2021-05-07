Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAB0376590
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:51:08 +0200 (CEST)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezwh-0002zz-J5
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbY-0000q2-3L
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:16 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:50000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbR-0001Uk-03
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:15 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CDvBm148756;
 Fri, 7 May 2021 12:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=W9D93a69StMSST57/REUvy0BnsSr4UFvr3IDEErpitU=;
 b=uGN+PwWD1YVr4p5XreXV1OsA+4GqYRMWGJz8gPtv0wZGHxWArZywd+qdju4xv9ZbU6SU
 wi5R1M+1P6v0mUIDghJz049wKGwRSvcCpFNJ+ItDE5a0JiSlDGJpxG4Hwo2zLKK1ehQt
 0vneU8K24HykwiTp4wxFrIHW9vnjEVKDve6E6+GV7V1NGh+jYKb+SqnnAZ863Q6jj2Pf
 apPQUpUWn50zhay7KmezJpMSrImTUf4CNFGwApEAzjVd5HGVSqj0YPAihbXvaKV5qjVy
 Of4AbeUuHLWlzXHIEP3idIfXWBf8Snroe2TbfA4ty/tyWsUyQvXK02W101t1yutpfaIp UA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 38csrd9ewr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CGOMw173596;
 Fri, 7 May 2021 12:29:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38csrtb6ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:05 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CT5DB028264;
 Fri, 7 May 2021 12:29:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 38csrtb69x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:05 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CT4eK019320;
 Fri, 7 May 2021 12:29:04 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:29:04 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 17/22] chardev: cpr for simple devices
Date: Fri,  7 May 2021 05:25:15 -0700
Message-Id: <1620390320-301716-18-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: pat0bwK6ypowFk_MEK-KAl9Hx7N6057i
X-Proofpoint-GUID: pat0bwK6ypowFk_MEK-KAl9Hx7N6057i
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
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

Set QEMU_CHAR_FEATURE_CPR for devices that trivially support cpr.
char-stdio is slightly less trivial.  Allow the gdb server by
closing it on exec.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-mux.c     | 1 +
 chardev/char-null.c    | 1 +
 chardev/char-serial.c  | 1 +
 chardev/char-stdio.c   | 8 ++++++++
 gdbstub.c              | 1 +
 include/chardev/char.h | 1 +
 migration/cpr.c        | 1 +
 7 files changed, 14 insertions(+)

diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 72beef2..af74eaf 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -337,6 +337,7 @@ static void qemu_chr_open_mux(Chardev *chr,
      */
     *be_opened = muxes_opened;
     qemu_chr_fe_init(&d->chr, drv, errp);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
diff --git a/chardev/char-null.c b/chardev/char-null.c
index 1c6a290..02acaff 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -32,6 +32,7 @@ static void null_chr_open(Chardev *chr,
                           Error **errp)
 {
     *be_opened = false;
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void char_null_class_init(ObjectClass *oc, void *data)
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 7c3d84a..b585085 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -274,6 +274,7 @@ static void qmp_chardev_open_serial(Chardev *chr,
     qemu_set_nonblock(fd);
     tty_serial_init(fd, 115200, 'N', 8, 1);
 
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     qemu_chr_open_fd(chr, fd, fd);
 }
 #endif /* __linux__ || __sun__ */
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 403da30..9410c16 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -114,9 +114,17 @@ static void qemu_chr_open_stdio(Chardev *chr,
 
     stdio_allow_signal = !opts->has_signal || opts->signal;
     qemu_chr_set_echo_stdio(chr, false);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 #endif
 
+void qemu_term_exit(void)
+{
+#ifndef _WIN32
+    term_exit();
+#endif
+}
+
 static void qemu_chr_parse_stdio(QemuOpts *opts, ChardevBackend *backend,
                                  Error **errp)
 {
diff --git a/gdbstub.c b/gdbstub.c
index 054665e..fdbf531 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3540,6 +3540,7 @@ int gdbserver_start(const char *device)
         mon_chr = gdbserver_state.mon_chr;
         reset_gdbserver_state();
     }
+    mon_chr->close_on_cpr = true;
 
     create_processes(&gdbserver_state);
 
diff --git a/include/chardev/char.h b/include/chardev/char.h
index e488ad1..96e5570 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -295,5 +295,6 @@ void resume_mux_open(void);
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
 bool qemu_chr_cpr_capable(Error **errp);
+void qemu_term_exit(void);
 
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 8dfd5f1..a65a671 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -140,6 +140,7 @@ void cprsave(const char *file, CprMode mode, Error **errp)
         }
         walkenv(FD_PREFIX, preserve_fd, 0);
         vhost_dev_reset_all();
+        qemu_term_exit();
         setenv("QEMU_START_FREEZE", "", 1);
         qemu_system_exec_request();
     }
-- 
1.8.3.1


