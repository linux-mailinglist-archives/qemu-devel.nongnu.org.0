Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2D154E50
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:48:21 +0100 (CET)
Received: from localhost ([::1]:46762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izp0W-0006Xd-C8
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <farman@linux.ibm.com>) id 1izoxZ-0002tj-TK
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:45:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <farman@linux.ibm.com>) id 1izoxY-0007BG-Au
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:45:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <farman@linux.ibm.com>)
 id 1izoxY-00078I-2U
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:45:16 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 016LeMbj097844
 for <qemu-devel@nongnu.org>; Thu, 6 Feb 2020 16:45:15 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y0n7gm69f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 16:45:14 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <farman@linux.ibm.com>;
 Thu, 6 Feb 2020 21:45:12 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Feb 2020 21:45:11 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 016Lj96B59834468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 21:45:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65CBC11C04C;
 Thu,  6 Feb 2020 21:45:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52ACD11C05E;
 Thu,  6 Feb 2020 21:45:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  6 Feb 2020 21:45:09 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 0A1ACE026B; Thu,  6 Feb 2020 22:45:09 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH v2 0/7] s390x/vfio_ccw: Channel Path Handling [QEMU]
Date: Thu,  6 Feb 2020 22:45:02 +0100
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 20020621-0016-0000-0000-000002E464C7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020621-0017-0000-0000-000033474C4D
Message-Id: <20200206214509.16434-1-farman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_04:2020-02-06,
 2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=768 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002060158
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is a new pass at the channel-path handling code for vfio-ccw,
to take advantage of the corresponding kernel patches posted here:

https://lore.kernel.org/kvm/20200206213825.11444-1-farman@linux.ibm.com/

I did leave a couple things FIXMEs from v1 comments in here.
Thought it'd be best to just get this out with the kernel code, to
make sure things aren't too far in the weeds.

v1: https://lore.kernel.org/qemu-devel/20191115033437.37926-1-farman@linux.ibm.com/

Eric Farman (2):
  vfio-ccw: Refactor cleanup of regions
  vfio-ccw: Refactor ccw irq handler

Farhan Ali (5):
  vfio-ccw: Return IOINST_CC_NOT_OPERATIONAL for EIO
  linux-headers: update
  vfio-ccw: Add support for the schib region
  vfio-ccw: Add support for the crw region
  vfio-ccw: Add support for the CRW irq

 hw/s390x/css.c                         |  13 +-
 hw/s390x/s390-ccw.c                    |  28 ++++
 hw/vfio/ccw.c                          | 204 ++++++++++++++++++++++---
 include/hw/s390x/css.h                 |   3 +-
 include/hw/s390x/s390-ccw.h            |   1 +
 include/standard-headers/linux/input.h |   1 +
 linux-headers/asm-arm64/unistd.h       |   1 +
 linux-headers/linux/vfio.h             |   3 +
 linux-headers/linux/vfio_ccw.h         |  19 +++
 target/s390x/ioinst.c                  |   3 +-
 10 files changed, 250 insertions(+), 26 deletions(-)

-- 
2.17.1


