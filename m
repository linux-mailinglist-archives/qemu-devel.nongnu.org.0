Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359A2334A21
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:51:18 +0100 (CET)
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6jd-0001oA-6a
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dx-00039E-6X; Wed, 10 Mar 2021 16:45:25 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:45505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6ds-0004O8-NL; Wed, 10 Mar 2021 16:45:24 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6szR-1loDm03Cn9-018Mn1; Wed, 10 Mar 2021 22:45:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/22] net: Use id_generate() in the network subsystem, too
Date: Wed, 10 Mar 2021 22:44:50 +0100
Message-Id: <20210310214504.1183162-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2THXLhKTv2m2BgJoW55y68cAsSqRCnshR9rWcogj8cZ2QsejhEX
 Iv32xErGmZJbEer5eTgZdSJK0Zx9v9khG73QfLqJV22lIJl2U77xE7FIosYZ1k4Jyh4yNbU
 A0gfGg74oVX4BBY0f5h8G12+dqKBPE+GfLOofmH8vmVTqX5sckdEkt8OthXNsPk2aM3X9MM
 GVwu8x9jBULzAk18QIM6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A8bqMzIaJNg=:49zAExsW9SdlGi7Phb0tx5
 47PHl2JNLB74oFa2enEaQqdC9l/tuVLGOVaVtGKz2ME5g2vPfq6D6I2TfhzJtTe+qOvNOaCeS
 Kj67CXoAhOP1L9Sb1M7ZedV+VLdh08SFpcMXCRfV+cqpBRZ2zytAUehnLCdmL+0POIJV9/QM3
 QxnODoAoLX6mS/5xFTevQL55AFyH/eX7YVB/8b/0GXXiQMGs3aUNuaYFbJobvMqf07/VUH/NK
 ciP92vaZU1GskEDHuKyB0BN60/FHAl+tpQvjCYEmFqOjDx2RPJAf5rP/lWyG6pacjYcr1cgEq
 wApIEGhfoDAj7ziFXMZUNY4v5c8UdXoWVFUpnBamek91lwQIyM5fkHfkdUIDrLBqCy8n/talV
 Jvjz1gx3HFyJXpcGaq0oKle4xi47P6IIR3pHlVdE/sMYCH/yBKgJoDhHzLfag5napJ1Ja+82D
 RiNXG5/Fsw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We already got a global function called id_generate() to create unique
IDs within QEMU. Let's use it in the network subsytem, too, instead of
inventing our own ID scheme here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210215090225.1046239-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qemu/id.h | 1 +
 net/net.c         | 6 +++---
 util/id.c         | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/qemu/id.h b/include/qemu/id.h
index b55c406e69db..46b759b284f3 100644
--- a/include/qemu/id.h
+++ b/include/qemu/id.h
@@ -5,6 +5,7 @@ typedef enum IdSubSystems {
     ID_QDEV,
     ID_BLOCK,
     ID_CHR,
+    ID_NET,
     ID_MAX      /* last element, used as array size */
 } IdSubSystems;
 
diff --git a/net/net.c b/net/net.c
index fb7b7dcc2528..ca30df963d77 100644
--- a/net/net.c
+++ b/net/net.c
@@ -43,6 +43,7 @@
 #include "qemu/cutils.h"
 #include "qemu/config-file.h"
 #include "qemu/ctype.h"
+#include "qemu/id.h"
 #include "qemu/iov.h"
 #include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
@@ -1111,8 +1112,7 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
 
     /* Create an ID for -net if the user did not specify one */
     if (!is_netdev && !qemu_opts_id(opts)) {
-        static int idx;
-        qemu_opts_set_id(opts, g_strdup_printf("__org.qemu.net%i", idx++));
+        qemu_opts_set_id(opts, id_generate(ID_NET));
     }
 
     if (visit_type_Netdev(v, NULL, &object, errp)) {
@@ -1467,7 +1467,7 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
     /* Create an ID if the user did not specify one */
     nd_id = g_strdup(qemu_opts_id(opts));
     if (!nd_id) {
-        nd_id = g_strdup_printf("__org.qemu.nic%i", idx);
+        nd_id = id_generate(ID_NET);
         qemu_opts_set_id(opts, nd_id);
     }
 
diff --git a/util/id.c b/util/id.c
index 5addb4460ea0..ded41c5025e4 100644
--- a/util/id.c
+++ b/util/id.c
@@ -35,6 +35,7 @@ static const char *const id_subsys_str[ID_MAX] = {
     [ID_QDEV]  = "qdev",
     [ID_BLOCK] = "block",
     [ID_CHR] = "chr",
+    [ID_NET] = "net",
 };
 
 /*
-- 
2.29.2


