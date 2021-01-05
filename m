Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF62EAFC1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:11:38 +0100 (CET)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwovm-0005qe-Qk
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotW-0003tj-0v
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:14 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:34386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotT-0003hM-Fj
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:13 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FsoaJ094338;
 Tue, 5 Jan 2021 16:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=YFQkhznQxjTO6NEXmhjeeH2hxbKGgW+p36KRJn05l4s=;
 b=yXJpb5ePb5kn0dnJTczy5k/YRxw2xrXIpe/PvbLL8ZHSn8BfwhkKPKOvMB+4DIIRpdXF
 tZZmX7nqMM6MQG652fBSso3pbbZ0uclAPjgt9a+HvqXKbCywwshLAihXzaMxhNkFbAta
 icr9DWCNfqLwHTbNcP4imVd4CHtvQE+gspZNeHmvoy/x3KQ5XYVXqbURrJuFC6RZcosT
 zPRtHeuBcXyT6Webzea7SqWqx1ch+gaZh6deQtQJpFBA9WW9mhN15xD5NaEd2aYZcJ+d
 0yAfN8sPshMyZeYzbKRlbia3A/+9zjdbJdDnAjf2OmXYWUK6ASIYlEH3J+77GDuwJGVp EQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35tebasjv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuRb4026639;
 Tue, 5 Jan 2021 16:09:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35v4rbjfa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:04 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G92ew018278;
 Tue, 5 Jan 2021 16:09:02 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:02 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 03/22] oslib: qemu_clr_cloexec
Date: Tue,  5 Jan 2021 07:41:51 -0800
Message-Id: <1609861330-129855-4-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
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

Define qemu_clr_cloexec, analogous to qemu_set_cloexec.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qemu/osdep.h | 1 +
 util/oslib-posix.c   | 9 +++++++++
 util/oslib-win32.c   | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 20872e7..d7d67f2 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -554,6 +554,7 @@ static inline void qemu_timersub(const struct timeval *val1,
 #endif
 
 void qemu_set_cloexec(int fd);
+void qemu_clr_cloexec(int fd);
 
 /* Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
  * instead of QEMU_VERSION, so setting hw_version on MachineClass
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index ad8001a..9e3b477 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -314,6 +314,15 @@ void qemu_set_cloexec(int fd)
     assert(f != -1);
 }
 
+void qemu_clr_cloexec(int fd)
+{
+    int f;
+    f = fcntl(fd, F_GETFD);
+    assert(f != -1);
+    f = fcntl(fd, F_SETFD, f & ~FD_CLOEXEC);
+    assert(f != -1);
+}
+
 /*
  * Creates a pipe with FD_CLOEXEC set on both file descriptors
  */
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index c654daf..42eb2cc 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -254,6 +254,10 @@ void qemu_set_cloexec(int fd)
 {
 }
 
+void qemu_clr_cloexec(int fd)
+{
+}
+
 /* Offset between 1/1/1601 and 1/1/1970 in 100 nanosec units */
 #define _W32_FT_OFFSET (116444736000000000ULL)
 
-- 
1.8.3.1


