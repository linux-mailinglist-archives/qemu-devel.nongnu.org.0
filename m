Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2CF266500
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 18:50:22 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGmFh-0001RK-LT
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 12:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kGmEi-0000Gg-BH; Fri, 11 Sep 2020 12:49:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26202
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kGmEe-0003Ow-LD; Fri, 11 Sep 2020 12:49:20 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08BGVQms115448; Fri, 11 Sep 2020 12:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=p7IeXUiFLkbs016O9ou/uNq2HX6PVYnf3cfqX6Yhmsc=;
 b=aGRX8v+dQybybhlDYkpOl/JfUPIgRKT9CLuFUvzbb7VW0pKWIfZDi23dqCH6Ny/a/LR1
 ar/reSCeqow1CDU38aEEP6ZFYZeW2b39FCOeR8Uqh7ZHqUagG5U+NhSOPzYxqL+LBhGZ
 z/wBktUJ/yy3ohyXYV8NhZA6AM4joyYCPe4z5EIaLi3weRB12bbYbCElnSeQXntXA2gY
 vv9jzFwkaaqyFHyjn5a4mexjKcMtuxc3Te89+5TpU7NCVi9M+GuESSt0jHCTmw6a0vK4
 zCXQENZcWSduramtFLt1jeJN9a5GCfA0Ud/tepT/s224jUZFXumRkp4GeBObxI3pyAnk 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33gabr5phy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 12:49:14 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08BGVe58116590;
 Fri, 11 Sep 2020 12:49:14 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33gabr5phc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 12:49:13 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08BGlFZf022924;
 Fri, 11 Sep 2020 16:49:13 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 33cebvdj78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 16:49:13 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08BGn6bn61669742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Sep 2020 16:49:06 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB48B6A04D;
 Fri, 11 Sep 2020 16:49:11 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB51B6A047;
 Fri, 11 Sep 2020 16:49:10 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.91.207])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Sep 2020 16:49:10 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: alex.williamson@redhat.com, cohuck@redhat.com
Subject: [PATCH 0/3] s390x/pci: Accomodate vfio DMA limiting
Date: Fri, 11 Sep 2020 12:49:04 -0400
Message-Id: <1599842947-4051-1-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_08:2020-09-10,
 2020-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110131
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 09:50:13
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 schnelle@linux.ibm.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kernel commit 492855939bdb added a limit to the number of outstanding DMA
requests for a type1 vfio container.  However, lazy unmapping in s390 can in
quite a large number of outstanding DMA requests to build up prior to being
purged, potentially the entire guest DMA space.  This results in unexpected
'VFIO_MAP_DMA failed: No space left on device' conditions seen in QEMU.

This patchset adds support to qemu to retrieve the DMA limit information
added to VFIO_IOMMU_GET_INFO.  The patches are separated into vfio hits
which add support for reading in VFIO_IOMU_GET_INFO capability chains and
getting the per-container dma_limit, and s390 hits to track DMA usage on
a per-container basis.

Associated kernel patch:
https://marc.info/?l=kvm&m=159984267812181&w=2

Matthew Rosato (3):
  vfio: Get DMA limit information
  s390x/pci: Honor DMA limits set by vfio
  vfio: Create shared routine for scanning info capabilities

 hw/s390x/s390-pci-bus.c       | 56 ++++++++++++++++++++++++---
 hw/s390x/s390-pci-bus.h       |  9 +++++
 hw/s390x/s390-pci-inst.c      | 29 +++++++++++---
 hw/s390x/s390-pci-inst.h      |  3 ++
 hw/vfio/common.c              | 89 ++++++++++++++++++++++++++++++++++---------
 include/hw/vfio/vfio-common.h |  1 +
 6 files changed, 159 insertions(+), 28 deletions(-)

-- 
1.8.3.1


