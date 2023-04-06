Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3E6D9E0B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 18:57:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkSuV-0004GJ-HQ; Thu, 06 Apr 2023 12:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkSuT-0004FW-Aa
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:56:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pkSuQ-0000YX-0T
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:56:29 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336GhdlN008397; Thu, 6 Apr 2023 16:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=cWm2DVdiGycSq3yBhOLKPQZ65meQJjq6d5A+Z86PLig=;
 b=SL/rea5b9iUYLaJ1q8RVeSQwYfwpd60OprrpqsybZSLproN6C8DS0dvG6MCUZ5Kp4uvi
 /wUxN0Tw6VH3ryMF/TggkKOza/c9m5kj8yujwM8c9ITn5ZpBsFvhhvs6s/P6aWfyvo1l
 /5RC1+qRIbrJoGmsDuXY+4BA3t5pxhEDmw/mAc3Oluf8W4yu/q1lwpowwmgC2c5iGPiZ
 Pijgbphe4/RnQQur59d/qg6hGw6hTveZEx2b6mGP3Fwiq55u1Dxf76kZZFt3Ky9JFa7y
 5xOBXkFk3ZygtlCSYhVxLguDMyiyqOkYpS/aD8SAk4TIDBqZ1x6lbG1eeos+92l7LGes RA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3psajp1nxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 16:56:24 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 336FQsdx023796;
 Thu, 6 Apr 2023 16:56:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3ppc88knvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 16:56:23 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336GuMqi31326958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 16:56:22 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 164E258045;
 Thu,  6 Apr 2023 16:56:22 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9829B58050;
 Thu,  6 Apr 2023 16:56:21 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 16:56:21 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 0/1] Fix use-after-free errors in util/error.c
Date: Thu,  6 Apr 2023 12:56:14 -0400
Message-Id: <20230406165615.4102782-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wYBPEwWEiOXTJRhnFQXPcxxg7OSHOyAX
X-Proofpoint-GUID: wYBPEwWEiOXTJRhnFQXPcxxg7OSHOyAX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_09,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=571 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
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

Hello!

   This PR fixes use-after-free errors in util/error.c as reported by Coverity.

Regards,
   Stefan


The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:

  Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)

are available in the Git repository at:

  https://github.com/stefanberger/qemu-tpm.git tags/pull_error_handle_fix_use_after_free.v1

for you to fetch changes up to cc40b8b8448de351f0d15412f20d428712b2e207:

  util/error: Fix use-after-free errors reported by Coverity (2023-04-06 12:38:42 -0400)

----------------------------------------------------------------
Stefan Berger (1):
      util/error: Fix use-after-free errors reported by Coverity

 util/error.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.39.1


