Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D73854CC1B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:03:34 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UYP-0001Jq-Dg
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOC-0006ON-7q
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOA-00011K-EI
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:59 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE7fd8002108;
 Wed, 15 Jun 2022 14:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=1Q1OaXrRnzhNw022Ip2BRaKyW3Kz9Y+ZwhEGKiRXevU=;
 b=lYDCm9+ZXdpMV49TWQ45KIjeUgpJCoibR755msO+/yeSLTRbLubHf10JlO7CLZENN3Md
 zIQEAfQ2VeXTaVRRaKU3vKN18zM5VQHjjK/Wbj8yfddGVIvSCr0ILPIgXQun+3xpvCVx
 9tJxe5Y75Rkx0/0cfpLvKS4YWE6Ri4kllZeDcUrKU6Z0e2EX9Ne1v0otsnOMfs8YNvZy
 USQcKieSFs9OqlUglxSSKkiMLuM/k6zSMBmMcVs1gZBgIQGnUTUoInIznOEPo4Fywg1b
 TIXLb9atEibqkKRGl7N+ed1nhbmQlK5hIr6VvboAkJD4URwfThpqsoM3/NlV3p1dGZZ3 og== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrshy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:45 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ79q023097; Wed, 15 Jun 2022 14:52:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vppg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:44 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSN9018501;
 Wed, 15 Jun 2022 14:52:43 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-14; Wed, 15 Jun 2022 14:52:43 +0000
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
Subject: [PATCH V8 13/39] oslib: qemu_clear_cloexec
Date: Wed, 15 Jun 2022 07:52:00 -0700
Message-Id: <1655304746-102776-14-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: cXJL-FWt6oBP4rkwi9fV771zRDQyJNi-
X-Proofpoint-GUID: cXJL-FWt6oBP4rkwi9fV771zRDQyJNi-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Define qemu_clear_cloexec, analogous to qemu_set_cloexec.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qemu/osdep.h | 1 +
 util/oslib-posix.c   | 9 +++++++++
 util/oslib-win32.c   | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c..e916f3b 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -548,6 +548,7 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     G_GNUC_WARN_UNUSED_RESULT;
 
 void qemu_set_cloexec(int fd);
+void qemu_clear_cloexec(int fd);
 
 /* Return a dynamically allocated directory path that is appropriate for storing
  * local state.
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 7a34c16..421e987 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -261,6 +261,15 @@ void qemu_set_cloexec(int fd)
     assert(f != -1);
 }
 
+void qemu_clear_cloexec(int fd)
+{
+    int f;
+    f = fcntl(fd, F_GETFD);
+    assert(f != -1);
+    f = fcntl(fd, F_SETFD, f & ~FD_CLOEXEC);
+    assert(f != -1);
+}
+
 char *
 qemu_get_local_state_dir(void)
 {
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 5723d3e..5bed148 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -226,6 +226,10 @@ void qemu_set_cloexec(int fd)
 {
 }
 
+void qemu_clear_cloexec(int fd)
+{
+}
+
 int qemu_get_thread_id(void)
 {
     return GetCurrentThreadId();
-- 
1.8.3.1


