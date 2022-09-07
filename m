Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198625B0FD6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 00:32:05 +0200 (CEST)
Received: from localhost ([::1]:60564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oW3aV-0004MC-Cg
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 18:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oW3X6-0001cm-OZ
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 18:28:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oW3X4-00068P-Sk
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 18:28:32 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287MCAJ7031577
 for <qemu-devel@nongnu.org>; Wed, 7 Sep 2022 22:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7MWhhaQNO69jq0gPgYUr7DP2VPU4RF+2UxBWEk8snNQ=;
 b=aOF23n/wcWL6MQcFjQSPYEG8xttlmqhF768YGfCX3vpYkppBl6peGSYTVnXnAZ2TdnnD
 vqaX1MZyRDm66HvnMM9Eij76YNgLkPM+WU2ak6WYiLQqUw+/UuAM4YeYrSJvl7KadA8S
 I7wiuhq48QiD1atQs/hVl+/I3+jYJYFJyZ+XvvyLtcHlouGqGMGyzhdr/F7qzh7pbIqs
 hkqvcWuMjvyJejmQciNXDkCI0cxUbLJ5n4rgDd130UFZowq7UJiIOM5GRDTBu/gKpFuK
 eDP6loDZDs6EGXUIY6PgTRun6AkbmZpAUotVXoKo1bKPRqYEbcKYxpWWxxnHG4hbsF29 EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jf3vqrcbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 22:28:27 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 287MSQbA008048
 for <qemu-devel@nongnu.org>; Wed, 7 Sep 2022 22:28:26 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jf3vqrcb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 22:28:26 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 287MLTSa023394;
 Wed, 7 Sep 2022 22:28:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3jbxja3keb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 22:28:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 287MSOa33080798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Sep 2022 22:28:24 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E028AC05B;
 Wed,  7 Sep 2022 22:28:24 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 778FCAC059;
 Wed,  7 Sep 2022 22:28:24 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Sep 2022 22:28:24 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 0/2] tpm_emulator: Signal swtpm to again lock storage
Date: Wed,  7 Sep 2022 18:28:19 -0400
Message-Id: <20220907222821.1285082-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8YbkyjjRxcmJsGfgwxlrGdGNf7Y6sSXV
X-Proofpoint-ORIG-GUID: agHeGcodGjFuvmYJkn5IC-FuCOjrptzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Swtpm has been extended to release the lock on the storage where its state
is written to upon migration of the last one of its state blobs. Signal
swtpm to again lock the storage upon migration fallback. An explicit signal
helps swtpm to lock the storage earlier because otherwise it would have
to wait for the next TPM command from the VM.

Releasing the lock on the storage is necessary for setups where the storage
holding the TPM state is shared between hosts.

Regards,
   Stefan

Stefan Berger (2):
  tpm_emulator: Use latest tpm_ioctl.h from swtpm project
  tpm_emulator: Have swtpm relock storage upon migration fall-back

 backends/tpm/tpm_emulator.c | 60 ++++++++++++++++++++++-
 backends/tpm/tpm_ioctl.h    | 96 +++++++++++++++++++++++++++++--------
 backends/tpm/trace-events   |  2 +
 3 files changed, 137 insertions(+), 21 deletions(-)

-- 
2.37.2


