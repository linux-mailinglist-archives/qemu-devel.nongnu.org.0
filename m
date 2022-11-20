Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F5C631351
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 11:30:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owhZO-0004yy-Me; Sun, 20 Nov 2022 05:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1owhZH-0004y9-9l; Sun, 20 Nov 2022 05:28:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1owhZE-0000Cq-Re; Sun, 20 Nov 2022 05:28:54 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AK6VGGB026004; Sun, 20 Nov 2022 10:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hUEXF5N3yooRM3jpFOsRKISF2qiNoC5b+ratozJuaZE=;
 b=EjhDiMACaSe7d21FJIgXiEpoZ/26jPNxxWjeMLKbgNtgDlvRNB/21+GUl9/0r4yWuujJ
 6X6q5XXpmTdSBlzhROsTTdrjCk4g/1nAFp3+AYvA/atNX5EvmNmnyshZjzIS6ghR6Lrw
 p2AI4xHasguLl2Auec6MaZvcpa6yNZiuFVUcQHP7L0mYJ+gxjVoHXrNIZIzX4kv2w5MO
 6StsKRx9qqLSjHgNU5oSO+IdqjeUuskxacpkBandFSEWSYsOShkDn0y9d91viWGMa5fF
 rJCycbQcxp4jRpcVlRKV/R2Rip7uiRRPIV/xzAJOlVOz5ZNv5V1kqRTZXSWT07q5tEg3 fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky9a1fuue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:47 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AKASkhc011868;
 Sun, 20 Nov 2022 10:28:46 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky9a1fuua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:46 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AKAL28L019974;
 Sun, 20 Nov 2022 10:28:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3kxps8y2b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Nov 2022 10:28:46 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AKASm9O6685362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Nov 2022 10:28:48 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92E1B58055;
 Sun, 20 Nov 2022 10:28:43 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCB2B58059;
 Sun, 20 Nov 2022 10:28:42 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 20 Nov 2022 10:28:42 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, oro@il.ibm.com, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: [PATCH v4 0/3] block/rbd: Add support for layered encryption
Date: Sun, 20 Nov 2022 04:28:33 -0600
Message-Id: <20221120102836.3174090-1-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Nog5WpK5dpIAlLcxY3WriF6q7kRgf5B0
X-Proofpoint-GUID: RPLRJylxOmiMGJPW7dVLnUnuUSSyNftG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_07,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=760 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200086
Received-SPF: pass client-ip=148.163.158.5; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v4: split to multiple commits
    add support for more than just luks-any in layered encryption
    nit fixes
v3: further nit fixes suggested by @idryomov
v2: nit fixes suggested by @idryomov


Or Ozeri (3):
  block/rbd: encryption nit fixes
  block/rbd: Add luks-any encryption opening option
  block/rbd: Add support for layered encryption

 block/rbd.c          | 204 +++++++++++++++++++++++++++++++++++++++----
 qapi/block-core.json |  35 +++++++-
 2 files changed, 221 insertions(+), 18 deletions(-)

-- 
2.25.1


