Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A892B42D0F2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 05:28:30 +0200 (CEST)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1marPx-0005yw-Qn
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 23:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1marOl-00058Z-4N; Wed, 13 Oct 2021 23:27:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1marOg-0005ET-Ny; Wed, 13 Oct 2021 23:27:14 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DNhSaV022334; 
 Wed, 13 Oct 2021 23:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=AZLK+SUbY2De1p0UcwXySlqLdUc/r8edTqmarUn1vUE=;
 b=XfuqwrhHycf6j1GcmRrwzIYFwPsvgy8pWV9lIqBGsmV81JGaY547vkNSv8VVdSeNDjpT
 xDKqXS2EqYgYQmT1DbWdqrbNyIYBvQmT2IX6ROVPTmkSQ7oDvg/FqrE69Orfk7ubf9fY
 T9+5Br2sihSYR7xUI+N3lzpfKVc9Eb4XTIkpz/wrhVa8bvV92fYyRttSy8SWcvk/cApL
 PER4/Sd9R716RiVi5KaGB7EAsu4+G/DMy2Vdn1w3SdQW5L4Rir1AKIAk/J4iY7ELF+/z
 466lTcq1pvlOKbhK9o6ZYwjhHv6DQtLrOPvne3WXUFiPTyIsfRI9PBtCYELH1yjxUaXB ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bns3ftf9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 23:27:08 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19E3R8Dl018484;
 Wed, 13 Oct 2021 23:27:08 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bns3ftf9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 23:27:08 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19E3DeX7012017;
 Thu, 14 Oct 2021 03:27:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 3bk2qbq1pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 03:27:07 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19E3R79N28180806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 03:27:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27C7B112061;
 Thu, 14 Oct 2021 03:27:07 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10C86112064;
 Thu, 14 Oct 2021 03:27:07 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 14 Oct 2021 03:27:06 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v2] docs/specs/tpm: Clarify command line parameters for
 network migration
Date: Wed, 13 Oct 2021 23:27:00 -0400
Message-Id: <20211014032700.3864022-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Il_EUMrWkZrMZ-hzW_FpShlnjS5akc8D
X-Proofpoint-ORIG-GUID: jCPD2WabwJKgc8yjNYK_syv3b2_wd2T2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_01,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110140019
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarify the command line parameters for swtpm migration across the network
for the case of shared storage and non-shared storage.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 docs/specs/tpm.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 3be190343a..956f2c13dc 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -482,7 +482,8 @@ VM migration across the network:
  - QEMU command line parameters should be identical apart from the
    '-incoming' option on the destination side
 
- - swtpm command line parameters should be identical
+ - swtpm command line parameters can be identical if storage is not
+   shared and should be different for shared storage
 
 VM Snapshotting:
  - QEMU command line parameters should be identical
-- 
2.31.1


