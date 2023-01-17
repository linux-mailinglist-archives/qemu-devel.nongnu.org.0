Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5CA66DD3A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:10:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkmt-0007ek-8W; Tue, 17 Jan 2023 07:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pHkmT-0007dZ-RK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:09:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pHkmP-0003cP-9Z
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:09:31 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HB0Yom032427; Tue, 17 Jan 2023 12:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=m57YLkptXrEb6Nddoh+rpT2RfwR8Ko/Wxrnozk/5S+U=;
 b=aMlbWm0K30/bmMhdnVb+0LJf9yeYw3Ukz9EfUGr/0Rre6lIn9Tvybgfyz4knBz6XF/Xz
 FMbdQr3gjQupJ8VCqx+nRm/ikKjGjcrFoX/j/LLRSI4gG+7XzjkX4ksfp2R9tvuNAuCM
 m6xKLvxAUbrQ8SrsyUxoNSGmZ8kXwllRY5HBC5utqpuDRpp0IcwyXJhwfohcdfo86Acy
 u7yGsfMCKi19zfZpX0CckZFqaSPiZPFQyJKzfvgfLjYcvue4TnCSOdYiUq/vYRtvbgEV
 ATy7lvW86S2HCKa4XBAHGn7I8QTeWHSD8CN/LSFZCNxCg4ZboFPlSn+AdyGT7pwWcCpR HQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5egnr5df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:09:21 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30HB1IUY005711;
 Tue, 17 Jan 2023 12:09:20 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3n3m17cprx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:09:20 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30HC9IDW40304976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 12:09:18 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC9D158066;
 Tue, 17 Jan 2023 12:09:18 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CE8B58059;
 Tue, 17 Jan 2023 12:09:18 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 12:09:18 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL v1 0/2] Merge tpm 2023/01/17 v1
Date: Tue, 17 Jan 2023 07:09:13 -0500
Message-Id: <20230117120915.2362119-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QKY4vRvPgmvjqYomHucopO6iIIJcU7s0
X-Proofpoint-ORIG-GUID: QKY4vRvPgmvjqYomHucopO6iIIJcU7s0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxlogscore=780 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170100
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Hello,

 this PR addresses issues where QEMU may hang during test runs.

Regards,
   Stefan

The following changes since commit fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:

  tests/qtest/qom-test: Do not print tested properties by default (2023-01-16 15:00:57 +0000)

are available in the Git repository at:

  https://github.com/stefanberger/qemu-tpm.git pull-tpm-2023-01-17-1

for you to fetch changes up to 255b00b4def7bac1fd313adca931426f4eb10b05:

  tests/qtest/tpm-emu: Avoid hangs using abort handlers closing channels (2023-01-16 17:19:52 -0500)


Stefan Berger (2):
  tests/qtest: Poll on waitpid() for a while before sending SIGKILL
  tests/qtest/tpm-emu: Avoid hangs using abort handlers closing channels

 tests/qtest/libqtest.c | 20 +++++++++++++++++++-
 tests/qtest/tpm-emu.c  | 10 ++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.39.0


