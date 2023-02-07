Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B880868E086
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:50:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPT1t-0003Ze-R7; Tue, 07 Feb 2023 13:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT1X-0003Cu-9i
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:49:04 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT1T-00018F-Hk
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:48:59 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317GnsNk000470; Tue, 7 Feb 2023 18:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=8kQV//D0AsiIsXw9OFlLUDAzn44/NXkBgcyOICDURX0=;
 b=2PBkKpZCZ79Cv4rGETZrTmW0S9UDfnKCRdFzYlDpu70vaZLFJW7AuVFq3EqRYTRdIjLT
 4GSFzVX88M+/Nv24vchF7RJOJCKAJwhHZEnqa/1Q3YKHx9rHrdbHpEKkawrnh5XN+9cu
 fS78ExgRlGMLwnDK/kyv4SSbHUDS/vg2J+5yOxNf7sTS/PE+gPRCeTLzzW98vxE9QvcM
 GC8E0aNU6DboadCSwmT+W/r4EyKMxUCpLCuoI4ddxfbLZVYFdK7SEBOJOd3CYTrBtnwk
 ZSzTQhqJk4mWGBMpHBRJOZC1UoJadH1600Ksy01bBPC1L8ns9+VDh6xJV2i1z5zXXaT1 tw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdy16d67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:48:50 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317I1mqP028708; Tue, 7 Feb 2023 18:48:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtd3ree-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:48:49 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317Im35S033516;
 Tue, 7 Feb 2023 18:48:48 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdtd3rdm-1; Tue, 07 Feb 2023 18:48:48 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2 0/4] string list functions
Date: Tue,  7 Feb 2023 10:48:43 -0800
Message-Id: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=904
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070167
X-Proofpoint-GUID: Sb7SjhJIO4xiBvQ4sqT7jpK1crLx7xNe
X-Proofpoint-ORIG-GUID: Sb7SjhJIO4xiBvQ4sqT7jpK1crLx7xNe
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

Add some handy string list functions, for general use now, and for
eventual use in the cpr/live update patches.

Steve Sistare (4):
  qapi: strList_from_string
  qapi: QAPI_LIST_LENGTH
  qapi: strv_from_strList
  qapi: strList unit tests

 include/monitor/hmp.h     |  1 -
 include/qapi/util.h       | 28 ++++++++++++++++
 monitor/hmp-cmds.c        | 19 -----------
 net/net-hmp-cmds.c        |  2 +-
 qapi/qapi-util.c          | 37 ++++++++++++++++++++++
 stats/stats-hmp-cmds.c    |  2 +-
 tests/unit/meson.build    |  1 +
 tests/unit/test-strlist.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 149 insertions(+), 22 deletions(-)
 create mode 100644 tests/unit/test-strlist.c

-- 
1.8.3.1


