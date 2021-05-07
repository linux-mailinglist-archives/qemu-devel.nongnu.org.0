Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A833376570
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:47:40 +0200 (CEST)
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leztL-0007yb-EQ
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbZ-0000sD-0f
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:17 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:49996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbQ-0001UA-Pa
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:16 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CDcGZ148663;
 Fri, 7 May 2021 12:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=udyIHUkIBkYcTm208Cn0jkThzE9j/33KP3icVIEe804=;
 b=QLbu0G4Z/ZB/nNBbFRMOjt4wCDF/PqmCxezDVxbI23EFcgMwdyG1uMLvXJ3MpRN1zq3B
 JfB2fkeZGU6zO2JZ19T9vTUvAkdbq2Jok8XWNuSsHGlx1uHCOf4FZ6rssZxsFIs8iBym
 gFEZnPLLhV29lx1Q/QbVdSKCd+WQf2ZHr/WM6zocrHsJoN7HlZz+dkENFFgX7UCziXLP
 pKwS9nCezSd+FibIRyNDY7tb9a4SXLZyPV4cIb+S1fBROSPl4Dv7Nz8qRY0piPJpjquU
 AW6ma/B//GYkFHp6MWpdaySHbdtWfoNakk+Fm0d9j6JGm4+O9s8iBmU4eQd71s35Q1xa cA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 38csrd9ewp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CGQh9173728;
 Fri, 7 May 2021 12:29:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38csrtb69w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:04 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CKq51192424;
 Fri, 7 May 2021 12:29:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 38csrtb69e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:04 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CT3Xw019311;
 Fri, 7 May 2021 12:29:03 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:29:03 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 16/22] chardev: cpr framework
Date: Fri,  7 May 2021 05:25:14 -0700
Message-Id: <1620390320-301716-17-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: frjONlfxf3J8JVbLIGtihAbww31sx6b2
X-Proofpoint-GUID: frjONlfxf3J8JVbLIGtihAbww31sx6b2
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
 qemu-options.hx        | 26 ++++++++++++++++++++++----
 5 files changed, 72 insertions(+), 8 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 398f09d..596d4f9 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -37,6 +37,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/env.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
 #include "qemu/yank.h"
@@ -240,6 +241,9 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     ChardevClass *cc = CHARDEV_GET_CLASS(chr);
     /* Any ChardevCommon member would work */
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
+    char fdname[40];
+
+    chr->close_on_cpr = (common && common->close_on_cpr);
 
     if (common && common->has_logfile) {
         int flags = O_WRONLY | O_CREAT;
@@ -249,7 +253,14 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
         } else {
             flags |= O_TRUNC;
         }
-        chr->logfd = qemu_open_old(common->logfile, flags, 0666);
+        snprintf(fdname, sizeof(fdname), "%s_log", chr->label);
+        chr->logfd = getenv_fd(fdname);
+        if (chr->logfd < 0) {
+            chr->logfd = qemu_open_old(common->logfile, flags, 0666);
+            if (!chr->close_on_cpr) {
+                setenv_fd(fdname, chr->logfd);
+            }
+        }
         if (chr->logfd < 0) {
             error_setg_errno(errp, errno,
                              "Unable to open logfile %s",
@@ -301,11 +312,12 @@ static void char_finalize(Object *obj)
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
 
@@ -505,6 +517,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
 
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
+
+    backend->close_on_cpr = qemu_opt_get_bool(opts, "close-on-cpr", false);
 }
 
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
@@ -940,6 +954,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "abstract",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "close-on-cpr",
+            .type = QEMU_OPT_BOOL,
 #endif
         },
         { /* end of list */ }
@@ -1207,6 +1224,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
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
index 7c0444f..e488ad1 100644
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
@@ -67,6 +69,7 @@ struct Chardev {
     int be_open;
     /* used to coordinate the chardev-change special-case: */
     bool handover_yank_instance;
+    bool close_on_cpr;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -291,4 +294,6 @@ void resume_mux_open(void);
 /* console.c */
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
+bool qemu_chr_cpr_capable(Error **errp);
+
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 3cde26f..8dfd5f1 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -132,6 +132,9 @@ void cprsave(const char *file, CprMode mode, Error **errp)
         shutdown_action = SHUTDOWN_ACTION_POWEROFF;
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     } else if (restart) {
+        if (!qemu_chr_cpr_capable(errp)) {
+            goto err;
+        }
         if (vfio_cprsave(errp)) {
             goto err;
         }
diff --git a/qapi/char.json b/qapi/char.json
index 6413970..dea5dad 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -204,12 +204,15 @@
 # @logfile: The name of a logfile to save output
 # @logappend: true to append instead of truncate
 #             (default to false to truncate)
+# @close-on-cpr: if true, close device's fd on cprsave. defaults to false.
+#                since 6.0.
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
index 3392ac0..ef2d24a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3071,43 +3071,57 @@ DEFHEADING(Character device options:)
 
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
-    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off][,close-on-cpr=on|off]\n"
     "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
     "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
+    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID][,close-on-cpr=on|off] (tcp)\n"
     "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
-    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
+    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off][,close-on-cpr=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
     "         [,localport=localport][,ipv4=on|off][,ipv6=on|off][,mux=on|off]\n"
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
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
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
@@ -3182,6 +3196,10 @@ The general form of a character device option is:
     ``logappend`` option controls whether the log file will be truncated
     or appended to when opened.
 
+    Every backend supports the ``close-on-cpr`` option.  If on, the
+    devices's descriptor is closed during cprsave, and reopened after exec.
+    This is useful for devices that do not support cpr.
+
 The available backends are:
 
 ``-chardev null,id=id``
-- 
1.8.3.1


