Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1205A2BB8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:51:41 +0200 (CEST)
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbcS-0004MW-1F
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oRbXC-0006px-36
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:46:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oRbX9-0002dP-7L
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:46:13 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27QEtF1r006634
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 15:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yt+0aKJoxk0ShwJQdaTBjYJyRwFd70dWPJsm1l6RKEc=;
 b=j+DdBZPot7H2rHQ90Zg9/lhjPMShVK+DutcdsW/VlAfNILUvlwqcxLnTl9bFPOkC461F
 jxYxwTopa3CE8kueXJ9s6D1IeVu95gggVZX1Nwh/hFuTZPwx4rgxUVdU6rS5scmuEDpB
 lMbD9ucj6HweVjGDvpGVtlFLbwUspviBaFzBKJ1M+AP6prXAFEhNkvwD7srsLxf6AZIg
 ln4hj2P/5lHexGs6PpKwcLhtGAbw79I6LbK4dWQNx7D9neWSuF3ZCkww30qacayR3zIK
 3zq4VhK/YlDJLkm1F6Cn1LA3qLx6KCKF9VJwDZW2tGF9YvQaqo5WEo0ntSfyaQEabvpd aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j70c39k5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 15:46:08 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27QEubA2010769
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 15:46:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j70c39k54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 15:46:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27QFJwQf008331;
 Fri, 26 Aug 2022 15:46:07 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3j2q8a8ny9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Aug 2022 15:46:07 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27QFk6jT52429304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 15:46:06 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE65D136055;
 Fri, 26 Aug 2022 15:46:05 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A418213604F;
 Fri, 26 Aug 2022 15:46:05 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Aug 2022 15:46:05 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 0/2] tpm_emulator: Signal swtpm to re-lock storage
Date: Fri, 26 Aug 2022 11:46:00 -0400
Message-Id: <20220826154602.362516-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kMc7i6mvz2juzAnF_Fa5tegFjPNMGPCz
X-Proofpoint-GUID: Y-tw9qRz6ER1eRZ_vWxoED8NRm79swqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_08,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=942 phishscore=0 mlxscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208260063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Swtpm is being extended to release the lock on the storage where its state
is written to upon migration of the last one of its state blobs. Signal
swtpm to re-lock the storage upon migration fallback. An explicit signal
helps swtpm to re-lock the storage earlier because otherwise it would have
to wait for the next TPM command from the VM.

Releasing the lock on the storage is necessary for setups where the storage
holding the TPM state is shared between hosts.

Regards,
   Stefan

Stefan Berger (2):
  tpm_emulator: Use latest tpm_ioctl.h from swtpm project
  tpm_emulator: Have swtpm relock storage upon migration fall-back

 backends/tpm/tpm_emulator.c | 59 ++++++++++++++++++++++-
 backends/tpm/tpm_ioctl.h    | 96 +++++++++++++++++++++++++++++--------
 backends/tpm/trace-events   |  2 +
 3 files changed, 136 insertions(+), 21 deletions(-)

-- 
2.37.2


