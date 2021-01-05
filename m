Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CC02EAFD1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:15:34 +0100 (CET)
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwozd-0004l5-CI
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotd-00042p-4F
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:21 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotZ-0003y3-Om
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:20 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105Ft1p4031258;
 Tue, 5 Jan 2021 16:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=c8mBw0gu1/LrVN6bi4UJWZk47E+K7j1BUvL6nRE5YrE=;
 b=RbKFUrcDL6TxEKu/iwqv9Mn8YaK8pUmZ4ydg5I3wgZIuv3pAqrvf8KxzitSB1OADiiCH
 K1aL6NIOViUboifyI9fTgHv6bCE6FO648tC2F54zOArR2PM0z4CY8Ic3P+2AD75d60Op
 hDwQxlK+mvplHWZr+hTamdMVOE1JHfcWLc/6hv8uyVKWwnVRmGxhqQhQpuqoIOAJT05k
 YJWWqX2D/1ZgormducbTHrGWAS9oXpal2h1uBLSZBifK9QjAyV2M4443pFogwWObg8gk
 d3fmzolUe+bRqTVHWX6JawxEjuODSE/8GnhmL6YtR2aO32qkL1BMwvw7UXSGEBBIb969 BA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35tgsksg48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuOFK029191;
 Tue, 5 Jan 2021 16:09:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35uxnsvb6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:13 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G9B5Z018387;
 Tue, 5 Jan 2021 16:09:11 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:11 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 14/22] chardev: cpr framework
Date: Tue,  5 Jan 2021 07:42:02 -0800
Message-Id: <1609861330-129855-15-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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

Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
Add the chardev close_on_cpr option for devices that can be closed on cpr
and reopened after exec.
cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr is set
for all chardevs in the configuration.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char.c         | 41 ++++++++++++++++++++++++++++++++++++++---
 include/chardev/char.h |  5 +++++
 migration/cpr.c        |  3 +++
 qapi/char.json         |  5 ++++-
 qemu-options.hx        | 26 ++++++++++++++++++++++++--
 5 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 77e7ec8..0be551f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -37,6 +37,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/env.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
 
@@ -226,6 +227,9 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     ChardevClass *cc = CHARDEV_GET_CLASS(chr);
     /* Any ChardevCommon member would work */
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
+    char fdname[40];
+
+    chr->close_on_cpr = (common && common->close_on_cpr);
 
     if (common && common->has_logfile) {
         int flags = O_WRONLY | O_CREAT;
@@ -235,7 +239,14 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
         } else {
             flags |= O_TRUNC;
         }
-        chr->logfd = qemu_open(common->logfile, flags, 0666);
+        snprintf(fdname, sizeof(fdname), "%s_log", chr->label);
+        chr->logfd = getenv_fd(fdname);
+        if (chr->logfd < 0) {
+            chr->logfd = qemu_open(common->logfile, flags, 0666);
+            if (!chr->close_on_cpr) {
+                setenv_fd(fdname, chr->logfd);
+            }
+        }
         if (chr->logfd < 0) {
             error_setg_errno(errp, errno,
                              "Unable to open logfile %s",
@@ -286,11 +297,12 @@ static void char_finalize(Object *obj)
     if (chr->be) {
         chr->be->chr = NULL;
     }
-    g_free(chr->filename);
-    g_free(chr->label);
     if (chr->logfd != -1) {
         close(chr->logfd);
+        unsetenv_fdv("%s_log", chr->label);
     }
+    g_free(chr->filename);
+    g_free(chr->label);
     qemu_mutex_destroy(&chr->chr_write_lock);
 }
 
@@ -490,6 +502,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
 
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
+
+    backend->close_on_cpr = qemu_opt_get_bool(opts, "close-on-cpr", false);
 }
 
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
@@ -922,6 +936,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "abstract",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "close-on-cpr",
+            .type = QEMU_OPT_BOOL,
         },
         { /* end of list */ }
     },
@@ -1163,6 +1180,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
     return source;
 }
 
+static int chr_cpr_capable(Object *obj, void *opaque)
+{
+    Chardev *chr = (Chardev *)obj;
+    Error **errp = opaque;
+
+    if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) || chr->close_on_cpr) {
+        return 0;
+    }
+    error_setg(errp, "error: chardev %s -> %s is not capable of cpr",
+               chr->label, chr->filename);
+    return 1;
+}
+
+bool qemu_chr_cpr_capable(Error **errp)
+{
+    return !object_child_foreach(get_chardevs_root(), chr_cpr_capable, errp);
+}
+
 void qemu_chr_cleanup(void)
 {
     object_unparent(get_chardevs_root());
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 00589a6..35d04e9 100644
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
@@ -65,6 +67,7 @@ struct Chardev {
     char *filename;
     int logfd;
     int be_open;
+    bool close_on_cpr;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -290,4 +293,6 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
 /* console.c */
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
+bool qemu_chr_cpr_capable(Error **errp);
+
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 13c5d7c..93f6800 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -131,6 +131,9 @@ void cprsave(const char *file, CprMode mode, Error **errp)
         no_shutdown = 0;
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     } else if (restart) {
+        if (!qemu_chr_cpr_capable(errp)) {
+            goto err;
+        }
         if (vfio_cprsave()) {
             goto err;
         }
diff --git a/qapi/char.json b/qapi/char.json
index 8aeedf9..7e0186c 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -204,12 +204,15 @@
 # @logfile: The name of a logfile to save output
 # @logappend: true to append instead of truncate
 #             (default to false to truncate)
+# @close-on-cpr: if true, close device's fd on cprsave. defaults to false.
+#                since 5.3.
 #
 # Since: 2.6
 ##
 { 'struct': 'ChardevCommon',
   'data': { '*logfile': 'str',
-            '*logappend': 'bool' } }
+            '*logappend': 'bool',
+            '*close-on-cpr': 'bool' } }
 
 ##
 # @ChardevFile:
diff --git a/qemu-options.hx b/qemu-options.hx
index 455b43b7..1ab5af5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2956,42 +2956,60 @@ DEFHEADING(Character device options:)
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
     "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4][,ipv6][,nodelay][,reconnect=seconds]\n"
     "         [,server][,nowait][,telnet][,websocket][,reconnect=seconds][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev socket,id=id,path=path[,server][,nowait][,telnet][,websocket][,reconnect=seconds]\n"
-    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
+    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off][,close-on-cpr=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
     "         [,localport=localport][,ipv4][,ipv6][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off]\n"
+    "         [,logfile=PATH][,logappend=on|off][,close-on-cpr=on|off]\n"
     "-chardev msmouse,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
     "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #ifdef _WIN32
     "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #else
     "-chardev pty,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev stdio,id=id[,mux=on|off][,signal=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
 #ifdef CONFIG_BRLAPI
     "-chardev braille,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
         || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev tty,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
     "-chardev parallel,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev parport,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
 #if defined(CONFIG_SPICE)
     "-chardev spicevmc,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev spiceport,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
     , QEMU_ARCH_ALL
 )
@@ -3064,6 +3082,10 @@ The general form of a character device option is:
     ``logappend`` option controls whether the log file will be truncated
     or appended to when opened.
 
+    Every backend supports the ``close-on-cpr`` option.  If on, the devices's
+    descriptor is closed during cprsave, and reopened after exec.  This is
+    useful for devices that do not support cpr.
+
 The available backends are:
 
 ``-chardev null,id=id``
-- 
1.8.3.1


