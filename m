Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF416467966
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:29:42 +0100 (CET)
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9ZF-00087D-9t
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:29:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9Wx-0005uy-Mi; Fri, 03 Dec 2021 09:27:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29202
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9Wv-0004pL-Ov; Fri, 03 Dec 2021 09:27:19 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3EGF5H021236; 
 Fri, 3 Dec 2021 14:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QthznYybzXB5Cvz8R7EVgO38xXlem+qWr7WakLbAo8s=;
 b=bjHiXKVuTiXys07DrXv0+5EvHuQ1oY21FM+83GwA5vKljVGjawjetEZJ0AY7Zcn+hlDv
 01KnRyFUWqksA0gbHtlTwvPOLho5Y/jCeGBiXPD2guSBVS0CPU1ROrQRQGnX2E1X81x0
 ghm/7+QprobHBGyN2DEYJ4J4Hg+/u0T3sJPQmA2KjsW8z3Z0zuyyCAMnVV9HGnIhpTq0
 35g9FnhyUmKFWNMqF0q3l8jKvmxcXH6fprGnk1hYAiQfwSC4G/SpdrTh45dxeJMAhdiA
 23auaj1IzN9fswvbi1MvVFnvsXMnIjRBMklFK2xV3GvnkOeEihfcrNCdh0771PzlvEkN 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqmuu88kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:15 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3EGiDn022916;
 Fri, 3 Dec 2021 14:27:15 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqmuu88ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:15 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3EMxgR011630;
 Fri, 3 Dec 2021 14:27:14 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3ckcaee00r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:14 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3ERCbh47579636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 14:27:12 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B5AB6E059;
 Fri,  3 Dec 2021 14:27:12 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 494986E053;
 Fri,  3 Dec 2021 14:27:11 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.96.25])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 14:27:11 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] s390x/pci: some small fixes
Date: Fri,  3 Dec 2021 09:27:02 -0500
Message-Id: <20211203142706.427279-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FdWGAdfe5WrP69IeK1HA79BFzPY_nUeO
X-Proofpoint-GUID: ncrk6MQAMRacejVSSMkUB2v7M3NXOdzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_07,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=723 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030088
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Changes for v3:
- Actually fix patch 4 this time (Pierre)

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


