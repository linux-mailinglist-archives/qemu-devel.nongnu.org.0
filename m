Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E40E2CFD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 11:16:10 +0200 (CEST)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNZE1-0001uX-Dv
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 05:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1iNZ8e-0006DO-S2
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1iNZ8d-00048X-FN
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:10:36 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1iNZ8d-00047v-7G
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:10:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9O94MZF094876;
 Thu, 24 Oct 2019 09:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2019-08-05;
 bh=1wStxT5X5J/1NrtwJSHlRWHuesG/QCz1a0AXOom2gDI=;
 b=J++4Usoua3CXQ+NICrhgBgOw6umnGeLxR7+s7HhVEPx6GIdrISRue3TU0aTOQYK53oO5
 dKVxmNdSDjlSCZZ4ubpTjtzh3SNGbBU6mCa5sZUyhOG/hZ1A6aIFAUyG1STW23SHTK20
 SsO9Hh62LSLk7FV/t49xaNSY06Tf6I0hZ/uSBkLUJ8rSF3FEmIcoaL/stzsR0QMH5tEI
 opTztVN+MpTTY9OpSdldQ5Du2iA9VEl3+DTKjaBQmTrKrKDsLIrhnksVdYoGp7MPmDar
 bfMGIbGO9OVJUnKnTZEdJYasdj2Z+lSRIjoBPDSIIP8RWm6kZp/Quk+VO0dHOz3UmPuu Zg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2vqu4r24n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 09:10:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9O9826M093134;
 Thu, 24 Oct 2019 09:10:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2vtm244gg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 09:10:29 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9O9ARXc011763;
 Thu, 24 Oct 2019 09:10:27 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Oct 2019 02:10:26 -0700
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 PATCH 14/49] mutli-process: build remote command line args
Date: Thu, 24 Oct 2019 05:08:55 -0400
Message-Id: <8d1ffc03424e664000eb65186bef0362cd1a5fd6.1571905346.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1571905346.git.jag.raman@oracle.com>
References: <cover.1571905346.git.jag.raman@oracle.com>
In-Reply-To: <cover.1571905346.git.jag.raman@oracle.com>
References: <cover.1571905346.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910240089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910240089
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, john.g.johnson@oracle.com,
 kraxel@redhat.com, jag.raman@oracle.com, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 New patch in v3

 hw/proxy/qemu-proxy.c         | 80 +++++++++++++++++++++++++++++++++----------
 include/hw/proxy/qemu-proxy.h |  2 +-
 2 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/hw/proxy/qemu-proxy.c b/hw/proxy/qemu-proxy.c
index baba4da..ca7dd1a 100644
--- a/hw/proxy/qemu-proxy.c
+++ b/hw/proxy/qemu-proxy.c
@@ -45,47 +45,89 @@
 
 static void pci_proxy_dev_realize(PCIDevice *dev, Error **errp);
 
+static int add_argv(char *command_str, char **argv, int argc)
+{
+    int max_args = 64;
+
+    if (argc < max_args - 1) {
+        argv[argc++] = command_str;
+        argv[argc] = 0;
+    } else {
+        return 0;
+    }
+
+    return argc;
+}
+
+static int make_argv(char *command_str, char **argv, int argc)
+{
+    int max_args = 64;
+
+    char *p2 = strtok(command_str, " ");
+    while (p2 && argc < max_args - 1) {
+        argv[argc++] = p2;
+        p2 = strtok(0, " ");
+    }
+    argv[argc] = 0;
+
+    return argc;
+}
+
 int remote_spawn(PCIProxyDev *pdev, const char *command, Error **errp)
 {
-    char *args[3];
     pid_t rpid;
     int fd[2] = {-1, -1};
     Error *local_error = NULL;
+    char *argv[64];
+    int argc = 0, _argc;
+    char *sfd;
+    char *exec_dir;
+    int rc = -EINVAL;
 
     if (pdev->managed) {
         /* Child is forked by external program (such as libvirt). */
-        return -1;
+        return rc;
     }
 
     if (socketpair(AF_UNIX, SOCK_STREAM, 0, fd)) {
         error_setg(errp, "Unable to create unix socket.");
-        return -1;
+        return rc;
     }
+    exec_dir = g_strdup_printf("%s/%s", qemu_get_exec_dir(), "qemu-scsi-dev");
+    argc = add_argv(exec_dir, argv, argc);
+    sfd = g_strdup_printf("%d", fd[1]);
+    argc = add_argv(sfd, argv, argc);
+    _argc = argc;
+    argc = make_argv((char *)command, argv, argc);
+
     /* TODO: Restrict the forked process' permissions and capabilities. */
     rpid = qemu_fork(&local_error);
 
     if (rpid == -1) {
         error_setg(errp, "Unable to spawn emulation program.");
         close(fd[0]);
-        close(fd[1]);
-        return -1;
+        goto fail;
     }
 
     if (rpid == 0) {
         close(fd[0]);
-
-        args[0] = g_strdup(command);
-        args[1] = g_strdup_printf("%d", fd[1]);
-        args[2] = NULL;
-        execvp(args[0], (char *const *)args);
+        execvp(argv[0], (char *const *)argv);
         exit(1);
     }
     pdev->remote_pid = rpid;
-    pdev->rsocket = fd[0];
+    pdev->rsocket = fd[1];
+    pdev->socket = fd[0];
 
+    rc = 0;
+
+fail:
     close(fd[1]);
 
-    return 0;
+    for (int i = 0; i < _argc; i++) {
+        g_free(argv[i]);
+    }
+
+    return rc;
 }
 
 static int get_proxy_sock(PCIDevice *dev)
@@ -94,7 +136,7 @@ static int get_proxy_sock(PCIDevice *dev)
 
     pdev = PCI_PROXY_DEV(dev);
 
-    return pdev->rsocket;
+    return pdev->socket;
 }
 
 static void set_proxy_sock(PCIDevice *dev, int socket)
@@ -103,7 +145,7 @@ static void set_proxy_sock(PCIDevice *dev, int socket)
 
     pdev = PCI_PROXY_DEV(dev);
 
-    pdev->rsocket = socket;
+    pdev->socket = socket;
     pdev->managed = true;
 
 }
@@ -198,16 +240,16 @@ static void pci_proxy_dev_register_types(void)
 
 type_init(pci_proxy_dev_register_types)
 
-static void init_proxy(PCIDevice *dev, char *command, Error **errp)
+static void init_proxy(PCIDevice *dev, char *command, bool need_spawn, Error **errp)
 {
     PCIProxyDev *pdev = PCI_PROXY_DEV(dev);
     Error *local_error = NULL;
 
     if (!pdev->managed) {
-        if (command) {
-            remote_spawn(pdev, command, &local_error);
-        } else {
-            return;
+        if (need_spawn) {
+            if (!remote_spawn(pdev, command, &local_error)) {
+                return;
+            }
         }
     } else {
         pdev->remote_pid = atoi(pdev->rid);
diff --git a/include/hw/proxy/qemu-proxy.h b/include/hw/proxy/qemu-proxy.h
index 3648a77..f97b103 100644
--- a/include/hw/proxy/qemu-proxy.h
+++ b/include/hw/proxy/qemu-proxy.h
@@ -63,7 +63,7 @@ typedef struct PCIProxyDev {
 
     void (*set_remote_opts) (PCIDevice *dev, QDict *qdict, unsigned int cmd);
     void (*proxy_ready) (PCIDevice *dev);
-    void (*init_proxy) (PCIDevice *pdev, char *command, Error **errp);
+    void (*init_proxy) (PCIDevice *dev, char *command, bool need_spawn, Error **errp);
 
 } PCIProxyDev;
 
-- 
1.8.3.1


