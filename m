Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C872F6B765B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:43:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbga4-0001yh-Aw; Mon, 13 Mar 2023 07:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pbga1-0001yU-Ld
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:43:05 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pbgZz-0003Ht-Eh
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:43:05 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MvsN5-1qQlMb1JEV-00su2X; Mon, 13 Mar 2023 12:42:58 +0100
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Yalan Zhang <yalzhang@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH] qapi: net: fix -set parameter with modern style
Date: Mon, 13 Mar 2023 12:42:55 +0100
Message-Id: <20230313114255.1206609-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hsJ7sSE7i1jYn6d+HP918ASBvVZfd97Qn8QA493djIawrIJRAss
 pQaYRUN3Qg/bRBOoU+B6JqizmG+aZnIVQtt5blpJXuQ3S/oLjSj5e9lUe9SbqKOAvC/hoBo
 NCSe3vV9SHFjwStTUtAPUJreCd1W1vW4+7lYq/AxC4O5LLHkk2OTCEziv6O8Yp4q0IWK1Jy
 usw+u36DvcVfeyPdGarVA==
UI-OutboundReport: notjunk:1;M01:P0:fke//6gB/PM=;Hn/s+S8oWr+wHN1UyHlJ8kivz7G
 mBekFze2EcDhQe1QLzVGXjhRM5rmYMW+sJO9d4+PS/u37JI12qyKErtXa3ZoARFtYw6EaDgtf
 iO/ImWbBqVRPTHDidNXvq1pCLmVegdBVmhcSh5KFl2yD+gbIUusmAmWq9IXwmKXOH3tBhlsok
 UZmZ8Xd9F7d9ozrzMavjVQ6MPjEZ8Q1mpON8vfGZ8P0rUENqwtFHAeT9I/efI77nTrN6pX/V1
 rD3Yy1aAyfDSavPafZkNoWSLRw3zkkI+LY/bCdQiyLcT8OQvpMM5l9OmMORNTya0TS/uWc9+i
 TPgWa7wIa4sCmvPuSVw3NMao5GAGmTI9W5PFHS2te5qZ4p3kxmsjghVAB/93lG7kq3R3Gnxub
 ggzCCmNzGsctQBjHrUmSzBviplnkz0ESK66mukw4YaT9RwYvJgwVKt470EVN3mwT3FPRxcO+0
 UQX8lo0cj4YqzHFCbZsf+xDLEzRIAPS52rX68KwUg58eWYtKKwKo+RJB1IUa7l16SneNLCETz
 3/rNCG5zfhAzglbzOTlHDS8vPDv51aYh3dnvvmx67cuT3pwjEYZ7/dlyHkQm/eNkpjglpGvc5
 pBXiWEheJXVgE5iMGX1z3HL5m67jjLbXeFjRIlssVSGvcSQ8ECVQSUt/BsNuvn39yMa1m4JJL
 jGRcStZEv3qk77Vzmt4qiyFZbbSXATtHTdPMLuJdDQ==
Received-SPF: permerror client-ip=212.227.126.134;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With netdev modern style, parameters cannot be found using
qemu_find_opts_err() and then qemu_set_option() cannot find
them to update them with the new option.

To fix that, update the code to manage the modern style by
searching the parameter in nd_queue, and update the entry
using visit_type_Netdev_members().

Fixes: f3eedcddba36 ("qapi: net: introduce a way to bypass qemu_opts_parse_noisily()")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/net/net.h |  2 ++
 net/net.c         | 35 +++++++++++++++++++++++++++++++++++
 softmmu/vl.c      |  8 ++++++++
 3 files changed, 45 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 1448d00afbc6..be42ba96ee3d 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -246,6 +246,8 @@ extern const char *host_net_devices[];
 extern NetClientStateList net_clients;
 bool netdev_is_modern(const char *optarg);
 void netdev_parse_modern(const char *optarg);
+Netdev *netdev_find_modern(const char *id);
+void netdev_set_modern(Netdev *net, const char *arg, Error **errp);
 void net_client_parse(QemuOptsList *opts_list, const char *str);
 void show_netdevs(void);
 void net_init_clients(void);
diff --git a/net/net.c b/net/net.c
index 6492ad530e21..9c384187255b 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1624,6 +1624,41 @@ out:
     return ret;
 }
 
+Netdev *netdev_find_modern(const char *id)
+{
+    NetdevQueueEntry *e;
+
+    QSIMPLEQ_FOREACH(e, &nd_queue, entry) {
+        if (strcmp(id, e->nd->id) == 0) {
+            return e->nd;
+        }
+    }
+    return NULL;
+}
+
+void netdev_set_modern(Netdev *net, const char *arg, Error **errp)
+{
+    Visitor *v;
+    char *id = net->id;
+    char *opts = g_strdup_printf("type=%s,id=%s,%s",
+                                 NetClientDriver_lookup.array[net->type],
+                                 id, arg);
+
+    v = qobject_input_visitor_new_str(opts, NULL, errp);
+    if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
+        goto out;
+    }
+    if (visit_type_Netdev_members(v, net, errp)) {
+        g_free(id); /* re-allocated in visit_type_Netdev_members() */
+        visit_check_struct(v, errp);
+        visit_end_struct(v, NULL);
+    }
+
+out:
+    visit_free(v);
+    g_free(opts);
+}
+
 static void netdev_init_modern(void)
 {
     while (!QSIMPLEQ_EMPTY(&nd_queue)) {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3340f63c3764..c063857867e2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2162,6 +2162,14 @@ static void qemu_set_option(const char *str, Error **errp)
     if (!is_qemuopts_group(group)) {
         error_setg(errp, "-set is not supported with %s", group);
     } else {
+        if (strcmp(group, "netdev") == 0) {
+            Netdev *net = netdev_find_modern(id);
+            if (net) {
+                netdev_set_modern(net, str + strlen(group) + strlen(id) + 2,
+                                  errp);
+                return;
+            }
+        }
         list = qemu_find_opts_err(group, errp);
         if (list) {
             opts = qemu_opts_find(list, id);
-- 
2.39.2


