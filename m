Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8160D630
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 23:33:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onRVC-00014r-Ql; Tue, 25 Oct 2022 17:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1onRVB-00014b-3B
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:30:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1onRV9-00082A-Jj
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:30:24 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PKU6Kf013312;
 Tue, 25 Oct 2022 21:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=U4XXwL+4El0uNLquVrPnFzT5UjrrtXYfx6hKQWRlfb8=;
 b=CWa7iH8o03FsLvCSrTGHyC0/j3FYUYREelkIdwOiApMYVVtTO0vEbzv6YSF6tlYD2Wxk
 c3/EPXePXA+iyurqstGfaCu0bKc2BsR+NVikWWsca6QQRT1fhjdyMnmJUl/HIm7Ol4eb
 kChkvIkZ875iPUBVMquChLeVmFZgKpwlVrLC37hgalAnX3jz+8HyMST404T8jZOCJir6
 OU3hmjtSP28PX5OwhhAWkPBLpkXUq8IcESs9b55mCx9JVxgixetcW09Liw/UhWarIm/F
 tdFLOIAWvcYK+JKFz5rP7ufzI6p4ocRS7oeYLQ9juzCtLCqTf0NBX9ZKCUj5VKJTG7hX PQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3keea7uka7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 21:30:21 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29PLKffb026325;
 Tue, 25 Oct 2022 21:30:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3kdugatw8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 21:30:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29PLP3IM38732066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 21:25:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2EBC11C04A;
 Tue, 25 Oct 2022 21:30:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B189311C050;
 Tue, 25 Oct 2022 21:30:16 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Oct 2022 21:30:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/1] Re: target/s390x: Use Int128 for return from CLST
Date: Tue, 25 Oct 2022 23:30:07 +0200
Message-Id: <20221025213008.2209006-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021073006.2398819-4-richard.henderson@linaro.org>
References: <20221021073006.2398819-4-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G_f3vaDZ-LXaurK8oh8yYZOiK9cHMCtn
X-Proofpoint-GUID: G_f3vaDZ-LXaurK8oh8yYZOiK9cHMCtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_13,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=763
 mlxscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250117
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I wanted to make sure that the pair elements were not mixed up and
wrote a small test. Feel free to add it to the series.

Ilya Leoshkevich (1):
  tests/tcg/s390x: Add clst.c

 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/clst.c          | 82 +++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 tests/tcg/s390x/clst.c

-- 
2.37.2


