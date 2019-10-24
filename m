Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB442E2CFE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 11:16:10 +0200 (CEST)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNZE1-0001rY-E2
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 05:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1iNZ85-0004mf-8B
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:10:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1iNZ83-0003hw-2f
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:10:01 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60008)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1iNZ82-0003hA-RE
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:09:59 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9O94MJ0094923;
 Thu, 24 Oct 2019 09:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2019-08-05;
 bh=MYE2nymoKiYp0sfsojEY79ZLbOlWj9NB3Uyfu9k9dmo=;
 b=pK+ITB7eGsWu9p+XkGy6Cm5tuxfXN+E4m7yuyIv5H58DNHifbqeZvjrXz3JT6EYC7h7l
 SgEms5ONW7yD14gamtFsSvASPo46+aRvropatkAEidUuLlUC0FuwQXzwbW96Xz4tqcpU
 ld7CqGhWKKStiytgxVvjZmettrKjoVd6vBUqOP/jflgGWsrJvnT6F5ZfiWqCCZCs/+L7
 c60KDnO6PdjzwwmeVKNDZD9rNdfZSPjL+de9NdAOS12RP5iCGGJjgBEw0P338TbmJRZ0
 WVrUpgCYdKgeI0q3UeGapGdM1OjaFV4cxtxk0Xs2OSnM5x5lF4RuNv6Aq4SWRzxJtuly fQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2vqu4r24jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 09:09:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9O98Mf3047167;
 Thu, 24 Oct 2019 09:09:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vu0fnu5xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 09:09:50 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9O99lZp008747;
 Thu, 24 Oct 2019 09:09:47 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Oct 2019 02:09:47 -0700
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 PATCH 02/49] multi-process: util: Add qemu_thread_cancel() to
 cancel running thread
Date: Thu, 24 Oct 2019 05:08:43 -0400
Message-Id: <e821aa9bccb49bf68c94e3d49b105c420dde9981.1571905346.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1571905346.git.jag.raman@oracle.com>
References: <cover.1571905346.git.jag.raman@oracle.com>
In-Reply-To: <cover.1571905346.git.jag.raman@oracle.com>
References: <cover.1571905346.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910240089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
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

qemu_thread_cancel() added to destroy a given running thread.
This will be needed in the following patches.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/qemu/thread.h    |  1 +
 util/qemu-thread-posix.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 047db03..fe7fa5a 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -175,6 +175,7 @@ void qemu_thread_create(QemuThread *thread, const char *name,
                         void *(*start_routine)(void *),
                         void *arg, int mode);
 void *qemu_thread_join(QemuThread *thread);
+void qemu_thread_cancel(QemuThread *thread);
 void qemu_thread_get_self(QemuThread *thread);
 bool qemu_thread_is_self(QemuThread *thread);
 void qemu_thread_exit(void *retval);
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 838980a..2fd85ed 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -590,3 +590,13 @@ void *qemu_thread_join(QemuThread *thread)
     }
     return ret;
 }
+
+void qemu_thread_cancel(QemuThread *thread)
+{
+    int err;
+
+    err = pthread_cancel(thread->thread);
+    if (err) {
+        error_exit(err, __func__);
+    }
+}
-- 
1.8.3.1


