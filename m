Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A86AE33C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:49:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYcH-0008AO-EJ; Tue, 07 Mar 2023 09:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pZYcB-00082w-EE
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:32 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pZYc8-0002dC-Et
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:31 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327DbTcB020732; Tue, 7 Mar 2023 14:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=QfcfBZe/jR1rfUmT2FTegDmzeFJf3d+RRUMfYVhNGtI=;
 b=VA38gEsAkIrP0pDZrOPu2ASY/EarFhLiFAUgv6R5UJ+NHH/D5n43Fgym+sqeguwXSwsN
 /Ww1kUlHBgCV2BNFVn4MTnqVMEhLvVrY6+4Ty1A38ju5Vl4yWXRd+O7eNHICpz74bfLv
 lKrHIaWoQHLdT5xm/R8EyCq6+Lc6bFBLBcuDEtEP/Vn4/h/lZavq7F1ejg9ENaKS5omj
 t5DIH19Y8RSsuYp5zAgEtK/P96NACrXDymhXXyEfEQTS2p7981Ea1TRIYSuUZdK2Ldr+
 nK6Djb+Hi/Ayv8YfNeOHinlPeIOs5AJmt5WD6vRCgZ+nADiORa2q7YoeXRewboBXCAJv ZQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p417er88a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 14:48:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 327EmMti006439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Mar 2023 14:48:22 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 7 Mar 2023 06:48:20 -0800
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <bcain@quicinc.com>, <dgilbert@redhat.com>,
 <ling1.xu@intel.com>, <zhou.zhao@intel.com>, <jun.i.jin@intel.com>
Subject: [PATCH 0/2] migration/xbzrle: fix two avx512 runtime issues
Date: Tue, 7 Mar 2023 11:48:07 -0300
Message-ID: <cover.1678199971.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 45XrhgUvJuz-Oo4s7gs0l2rImv0BfjHt
X-Proofpoint-GUID: 45XrhgUvJuz-Oo4s7gs0l2rImv0BfjHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_08,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=585 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303070132
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Matheus Tavares Bernardino (2):
  migration/xbzrle: use ctz64 to avoid undefined result
  migration/xbzrle: fix out-of-bounds write with axv512

 migration/xbzrle.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.1


