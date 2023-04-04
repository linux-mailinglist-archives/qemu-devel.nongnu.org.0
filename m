Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2176D682A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:02:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjj5I-0005zF-5X; Tue, 04 Apr 2023 12:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pjj4u-0005rd-Rk
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:00:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pjj4s-0000oD-8y
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:00:12 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334DuJoh029022; Tue, 4 Apr 2023 16:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=pto/KYePUpFgSjaMQTYWeeceEHJvC7OW/e8LlvZVyv4=;
 b=LdmAbZWxhfOcSngJgYXaDfWu6T7bfypH5Dz3vXGCEi2VE7aVhX1Vs+kIGzs80Z/ChvvT
 Kmrn8N+9nxxOhFr5mFrUI+F7QdQXyLiBCybzFk+hzuMDB4EtZ1/t90MrAOOeXSDrOf/T
 t6iD3LjRFAg5Xwo+Uzwmj4z+fTa4Khzy0Y1QUkv1v5kTEbApwrdnplCLo4dm8Y9+GthY
 DQPkzWBoKZU9lQj6yoZkJoZyOXVhjw7vVMYorU/zyw7eQnQ95gLurrG83a5xEE5sQ2Jb
 Xuus7v9guvu8FcMN7fYp/dcqUxgUHYjJ49/fp07LGWm2DO0B3LuI4YgkcwJBaKyAjQfU Sg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ppd5ue7ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Apr 2023 16:00:05 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 334F9L8f013934; Tue, 4 Apr 2023 16:00:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ppt3g2se9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Apr 2023 16:00:05 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 334G04Qn013629;
 Tue, 4 Apr 2023 16:00:04 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3ppt3g2sdt-1; Tue, 04 Apr 2023 16:00:04 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Cc: Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH] tap: fix net_init_tap() return code
Date: Tue,  4 Apr 2023 09:00:04 -0700
Message-Id: <1680624004-154390-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_08,2023-04-04_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304040148
X-Proofpoint-ORIG-GUID: iKVo3Xek4OPChNYzYCJ1oUe4jW8pNthR
X-Proofpoint-GUID: iKVo3Xek4OPChNYzYCJ1oUe4jW8pNthR
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When net_init_tap() succeeds for a multi-queue device, it returns a
non-zero ret=1 code to its caller, because of this code where ret becomes
1 when g_unix_set_fd_nonblocking succeeds.  Luckily, the only current call
site checks for negative, rather than non-zero.

    ret = g_unix_set_fd_nonblocking(fd, true, NULL);
    if (!ret) {
        ...
        goto free_fail;

Also, if g_unix_set_fd_nonblocking fails (though unlikely), ret=0 is returned,
and the caller will use a broken interface.

Fixes: a8208626ba89.. ("net: replace qemu_set_nonblock()")
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 net/tap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index 1bf085d..1f3e927 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -906,8 +906,8 @@ int net_init_tap(const Netdev *netdev, const char *name,
                 goto free_fail;
             }
 
-            ret = g_unix_set_fd_nonblocking(fd, true, NULL);
-            if (!ret) {
+            if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
+                ret = -1;
                 error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
                                  name, fd);
                 goto free_fail;
-- 
1.8.3.1


