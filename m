Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DC467779
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:34:16 +0100 (CET)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7lX-0000RM-Fz
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:34:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt7jz-0006sL-4u; Fri, 03 Dec 2021 07:32:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt7jx-0008N2-3j; Fri, 03 Dec 2021 07:32:38 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3BhNVG012956; 
 Fri, 3 Dec 2021 12:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KTsn9MO2BlnM9AZpGzAMk8h03L7wXPNkktcgoDltfLE=;
 b=WZzK08D0b15NmhfFPUXyxvXAJ/H0ghdW1hzsPvyH2yCndA4hU+kZ7C0jzYVUr/iWutRG
 beB2rLDMKXou5As3dPCHdqRY+sNWOZarQdrDz0f4qyolmAhf7Qr0clu89JuOrRL//XRK
 muINrdiuCEV2FVvXWc6bUqv65dAWnPvTQs9/M4PL9P+DQMBQ+VUUMHW1qwHxaQ9ePsxu
 IWAa4ZE3eeLWn2XL14Z69mpaxZizNdZrdO5ogmjwcIoY7x15GZZlUlEPjlPzsV3Xc8lu
 IW3oaihZa3eTf9h0LsAQ6iwc2Edqg6RkVvb3gIvy6z/ZNOCxewORmMtlXBwxzbENnnqA og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqgff3fpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:32:33 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3BctXJ030964;
 Fri, 3 Dec 2021 12:32:33 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqgff3fpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:32:32 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3CVmXE026873;
 Fri, 3 Dec 2021 12:32:31 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3ckcad3cbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:32:31 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3CWUsU55837020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 12:32:30 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39918124058;
 Fri,  3 Dec 2021 12:32:30 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3287B124055;
 Fri,  3 Dec 2021 12:32:27 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.96.25]) by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 12:32:26 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] s390x/pci: some small fixes
Date: Fri,  3 Dec 2021 07:32:17 -0500
Message-Id: <20211203123221.420101-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i9I26Vn0XO9vOodN64Pjos2UGmJWqkei
X-Proofpoint-ORIG-GUID: NCRI718O6w2CXCUlEqJKafkga6PyAK_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_06,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=743
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030078
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A collection of small fixes for s390x PCI (not urgent).  The first 3 are
fixes related to always using the host-provided CLP value when provided
vs a hard-coded value.  The last patch adds logic for QEMU to report a
proper DTSM clp response rather than just 0s (guest linux doesn't look
at this field today).

Changes for v2:
- Add review tags (thanks!)
- Fix patch 4 (copy into guest payload)
- Small change to commit message for patches 1 & 4 (Pierre)

Matthew Rosato (4):
  s390x/pci: use a reserved ID for the default PCI group
  s390x/pci: don't use hard-coded dma range in reg_ioat
  s390x/pci: use the passthrough measurement update interval
  s390x/pci: add supported DT information to clp response

 hw/s390x/s390-pci-bus.c         |  1 +
 hw/s390x/s390-pci-inst.c        | 15 +++++++++------
 hw/s390x/s390-pci-vfio.c        |  1 +
 include/hw/s390x/s390-pci-bus.h |  3 ++-
 include/hw/s390x/s390-pci-clp.h |  3 ++-
 5 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.27.0


