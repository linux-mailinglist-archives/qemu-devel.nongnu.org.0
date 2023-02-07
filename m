Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610FB68E0D7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:04:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTFd-0007Nm-Ug; Tue, 07 Feb 2023 14:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTFb-0007Gr-Bp
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:03:31 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTFZ-0003nD-9F
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:03:30 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317IwuqK010601; Tue, 7 Feb 2023 19:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=mGrqoJp3rAahZewfOcAxfU1h42C/8QKDC9Wc19Ags8w=;
 b=B2COhRVDURx6/hgjFo1+gAxzjUtCHpMS/ZqT1pl05uMzwWK8EctKDX1UuC8SFFodvhxP
 tBxelqF8WV/KCSamCdGQ0ev2iggWNuXhp+sRhkkagQFl75YqfyP5bfHWmOAxMjXUXYEs
 3rrMlHoKHPLH/Q7oijOYwy7hPXhbMqwbZ4ekrnsPVdjSXwguTfzlJ+vI4vELFcr01yC0
 caC5Vl/klF5o87RHFCEujY2ZMeqRk/fiLuWHXlaq/ONUxOuIKPkSThXlFSuzO58GKeUp
 Cw5s8ieTs3WFQIuUv+GexCG5YLi1uOJoV9CsRYsoU249JuHosVmRhzyvDu7YlDqvfzuK SQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhf8a6bh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:03:27 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317I0q7b032631; Tue, 7 Feb 2023 19:03:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtccqtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:03:26 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317J3Q3A012292;
 Tue, 7 Feb 2023 19:03:26 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdtccqt0-1; Tue, 07 Feb 2023 19:03:25 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2] python/machine: QEMUMachine reopen_qmp_connection
Date: Tue,  7 Feb 2023 11:03:25 -0800
Message-Id: <1675796605-235646-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070170
X-Proofpoint-ORIG-GUID: C7cKpNuqFJENGTMBypz1Qa5tQxznXUkq
X-Proofpoint-GUID: C7cKpNuqFJENGTMBypz1Qa5tQxznXUkq
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

Provide reopen_qmp_connection() to reopen a closed monitor connection.
This will be needed by cpr, because qemu exec closes the monitor socket.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index ef94dcf..557209a 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -501,6 +501,16 @@ def _close_qmp_connection(self) -> None:
         finally:
             self._qmp_connection = None
 
+    def reopen_qmp_connection(self) -> None:
+        """Close and re-open the QMP connection."""
+        self._close_qmp_connection()
+        self._qmp_connection = QEMUMonitorProtocol(
+            self._monitor_address,
+            server=True,
+            nickname=self._name
+        )
+        self._qmp.accept(self._qmp_timer)
+
     def _early_cleanup(self) -> None:
         """
         Perform any cleanup that needs to happen before the VM exits.
-- 
1.8.3.1


