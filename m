Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E254CC4A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:13:44 +0200 (CEST)
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UiE-0001uo-UW
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOd-0007RE-BY
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOb-00016O-3G
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:27 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FDrshj015214;
 Wed, 15 Jun 2022 14:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=j2GOVjMrbXSH/xbYYYoczi6lJUabCkJpmttuDx/IZFc=;
 b=byHlzhV4U5xVYSZ9Bqt/gIwzpBwQHhGPkhXIoj0xp09nMnn4spTBSHw0/eRmzt1PM8+l
 QQq+Eg2Ws0FTuwqocXyMw094qpPOB+4NgVHFay0n0WLDZ+UnpO7LpZxFPlIbBPIkYYka
 oenktY4sZO8sWdrlLGtSY7p1f5vpv79D5p8x9G8UmFV5i47mAa5yV0Qc1QllgIrTkeqk
 YXxaCPoXswUvUXuVOSX5mr7BA+aXkOh2cLouxaQ9/Iqsm0+h/snDYl0YlUAr42is0tJE
 /lLhV5DSxMJV7NfL4wgawsCVnKiCedl/1XjCQn3zNfQpKSAQ2iMaDox2PjjfJaDX7NBV oA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0gvfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:10 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ72Z023081; Wed, 15 Jun 2022 14:53:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vq5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:09 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNn018501;
 Wed, 15 Jun 2022 14:53:08 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-34; Wed, 15 Jun 2022 14:53:08 +0000
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
Subject: [PATCH V8 33/39] chardev: cpr framework
Date: Wed, 15 Jun 2022 07:52:20 -0700
Message-Id: <1655304746-102776-34-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: zaYXxthhcOXDhmVT-PCgAJe43A46Te35
X-Proofpoint-ORIG-GUID: zaYXxthhcOXDhmVT-PCgAJe43A46Te35
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Add QEMU_CHAR_FEATURE_CPR for devices that support cpr by preserving an
open descriptor across exec.  Add the chardev reopen-on-cpr option for
devices that should be closed on cpr and reopened after exec.

Enable cpr for a chardev if it has QEMU_CHAR_FEATURE_CPR and reopen-on-cpr
is false.  Allow cpr-save if either QEMU_CHAR_FEATURE_CPR or reopen-on-cpr
is true for all chardevs in the configuration.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char.c         | 49 +++++++++++++++++++++++++++++++++++++++++++++----
 include/chardev/char.h |  5 +++++
 qapi/char.json         |  7 ++++++-
 qemu-options.hx        | 26 ++++++++++++++++++++++----
 4 files changed, 78 insertions(+), 9 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 0169d8d..ef3f196 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -36,9 +36,11 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "migration/cpr.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
 #include "qemu/yank.h"
+#include "sysemu/sysemu.h"
 
 #include "chardev-internal.h"
 
@@ -236,26 +238,55 @@ int qemu_chr_add_client(Chardev *s, int fd)
 static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
                            bool *be_opened, Error **errp)
 {
+    ERRP_GUARD();
+    g_autofree char *fdname = NULL;
+
     ChardevClass *cc = CHARDEV_GET_CLASS(chr);
     /* Any ChardevCommon member would work */
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
+    bool has_logfile = (common && common->has_logfile);
+    bool has_feature_cpr;
 
-    if (common && common->has_logfile) {
+    if (has_logfile) {
         int flags = O_WRONLY;
+        fdname = g_strdup_printf("%s_log", chr->label);
         if (common->has_logappend &&
             common->logappend) {
             flags |= O_APPEND;
         } else {
             flags |= O_TRUNC;
         }
-        chr->logfd = qemu_create(common->logfile, flags, 0666, errp);
+        chr->logfd = cpr_find_fd(fdname, 0);
+        if (chr->logfd < 0) {
+            chr->logfd = qemu_create(common->logfile, flags, 0666, errp);
+        }
         if (chr->logfd < 0) {
             return;
         }
     }
 
+    chr->reopen_on_cpr = (common && common->reopen_on_cpr);
+
     if (cc->open) {
         cc->open(chr, backend, be_opened, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
+    /* Evaluate this after the open method sets the feature */
+    has_feature_cpr = qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    chr->cpr_enabled = !chr->reopen_on_cpr && has_feature_cpr;
+
+    if (!chr->reopen_on_cpr && !has_feature_cpr) {
+        chr->cpr_blocker = NULL;
+        error_setg(&chr->cpr_blocker,
+                "chardev %s -> %s does not allow cpr. See reopen-on-cpr.",
+                chr->label, chr->filename);
+        cpr_add_blocker(&chr->cpr_blocker, errp, CPR_MODE_RESTART, 0);
+
+    } else if (chr->cpr_enabled && has_logfile) {
+        cpr_resave_fd(fdname, 0, chr->logfd, errp);
     }
 }
 
@@ -297,11 +328,16 @@ static void char_finalize(Object *obj)
     if (chr->be) {
         chr->be->chr = NULL;
     }
-    g_free(chr->filename);
-    g_free(chr->label);
     if (chr->logfd != -1) {
+        g_autofree char *fdname = g_strdup_printf("%s_log", chr->label);
+        if (chr->cpr_enabled) {
+            cpr_delete_fd(fdname, 0);
+        }
         close(chr->logfd);
     }
+    cpr_del_blocker(&chr->cpr_blocker);
+    g_free(chr->filename);
+    g_free(chr->label);
     qemu_mutex_destroy(&chr->chr_write_lock);
 }
 
@@ -501,6 +537,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
 
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
+
+    backend->reopen_on_cpr = qemu_opt_get_bool(opts, "reopen-on-cpr", false);
 }
 
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
@@ -942,6 +980,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "abstract",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "reopen-on-cpr",
+            .type = QEMU_OPT_BOOL,
 #endif
         },
         { /* end of list */ }
diff --git a/include/chardev/char.h b/include/chardev/char.h
index a319b5f..bbf2560 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -50,6 +50,8 @@ typedef enum {
     /* Whether the gcontext can be changed after calling
      * qemu_chr_be_update_read_handlers() */
     QEMU_CHAR_FEATURE_GCONTEXT,
+    /* Whether the device supports cpr */
+    QEMU_CHAR_FEATURE_CPR,
 
     QEMU_CHAR_FEATURE_LAST,
 } ChardevFeature;
@@ -67,6 +69,9 @@ struct Chardev {
     int be_open;
     /* used to coordinate the chardev-change special-case: */
     bool handover_yank_instance;
+    bool reopen_on_cpr;
+    bool cpr_enabled;
+    Error *cpr_blocker;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
diff --git a/qapi/char.json b/qapi/char.json
index 923dc50..0c3558e 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -204,12 +204,17 @@
 # @logfile: The name of a logfile to save output
 # @logappend: true to append instead of truncate
 #             (default to false to truncate)
+# @reopen-on-cpr: if true, close device's fd on cpr-save and reopen it after
+#                 cpr-exec. Set this to allow CPR on a device that does not
+#                 support QEMU_CHAR_FEATURE_CPR. defaults to false.
+#                 since 7.1.
 #
 # Since: 2.6
 ##
 { 'struct': 'ChardevCommon',
   'data': { '*logfile': 'str',
-            '*logappend': 'bool' } }
+            '*logappend': 'bool',
+            '*reopen-on-cpr': 'bool' } }
 
 ##
 # @ChardevFile:
diff --git a/qemu-options.hx b/qemu-options.hx
index 1b49360..2f4bb2b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3291,43 +3291,57 @@ DEFHEADING(Character device options:)
 
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
-    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off][,reopen-on-cpr=on|off]\n"
     "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off]\n"
     "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
+    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID][,reopen-on-cpr=on|off] (tcp)\n"
     "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
-    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
+    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off][,reopen-on-cpr=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
     "         [,localport=localport][,ipv4=on|off][,ipv6=on|off][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off]\n"
+    "         [,logfile=PATH][,logappend=on|off][,reopen-on-cpr=on|off]\n"
     "-chardev msmouse,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
     "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #ifdef _WIN32
     "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
 #else
     "-chardev pty,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev stdio,id=id[,mux=on|off][,signal=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #ifdef CONFIG_BRLAPI
     "-chardev braille,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
         || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev tty,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
     "-chardev parallel,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev parport,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(CONFIG_SPICE)
     "-chardev spicevmc,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev spiceport,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
     , QEMU_ARCH_ALL
 )
@@ -3402,6 +3416,10 @@ The general form of a character device option is:
     ``logappend`` option controls whether the log file will be truncated
     or appended to when opened.
 
+    Every backend supports the ``reopen-on-cpr`` option.  If on, the
+    devices's descriptor is closed during cpr-save, and reopened after exec.
+    This is useful for devices that do not support cpr.
+
 The available backends are:
 
 ``-chardev null,id=id``
-- 
1.8.3.1


