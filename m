Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C42057CBD6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:26:15 +0200 (CEST)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEWBu-0005xi-FG
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9R-0000C6-IN; Thu, 21 Jul 2022 09:23:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9P-0006Vf-Js; Thu, 21 Jul 2022 09:23:37 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDEbeB011754;
 Thu, 21 Jul 2022 13:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=j12IZhww5MWp9rKwfpeJPkmRN2wsMwHtOmX3mGYB3LI=;
 b=LlbLqx4fdGYfRvZDJ3FYkkDReuH9GWQkwx6QYhLgTc8jvCE68wVAAfe6voGtbMx7UY//
 oIEwl6GiS6vRlE9wCShSqOx7VEm9pDemRMnMokv8BEJ1+9m8Njqh7q3kfSMyKeUY63gL
 WRX4gFJoscjlImjo3xcOoIKM4FH6k2vlKIGrJVJbmhmdhl0Ski+EMidRqLC7dQl0Rzz0
 DcUVbggQ2l3aqXHpSRP8Avj20wbOzX/WM4Tg7BHZ5rb3bqHCpqw7KTJhTsyNMvkiYfYb
 jp8KAqVd6V1an7gMlbHTbkGczp36LyYmJn9eOwMKvlBi2Z730mwef4ELdbpthk6yFjXq Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf71fstp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:33 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LDEjmg012823;
 Thu, 21 Jul 2022 13:23:33 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf71fstnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:32 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LD7Y6J009751;
 Thu, 21 Jul 2022 13:23:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3hbmy8napb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LDNRG217563912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 13:23:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 116C54C040;
 Thu, 21 Jul 2022 13:23:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 004BB4C044;
 Thu, 21 Jul 2022 13:23:26 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 13:23:25 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Subject: [PATCH v3 00/14] dump: Add arch section and s390x PV dump
Date: Thu, 21 Jul 2022 13:22:42 +0000
Message-Id: <20220721132256.2171-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z0waXZpuK3IuCQxzhHQprij_9y-OjwYN
X-Proofpoint-GUID: fAzwyBvWMdMEcpofHXdokHKKBgtOkK2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_16,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=934 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207210053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
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

Previously this series was two separate series:
 * Arch section support
   Adds the possibility for arch code to add custom section data.

 * s390 PV dump support
   Adds PV dump data to the custom arch sections.

I've chosen to merge them so it's easier to understand why the arch
section support has been implement the way it is.

Additionally I've added a cleanup patch beforehand which cleans up the
GuestPhysBlock usage.

v3:
	* I forgot to reserve the new ELF note so I'm currently
          discussing its name and over which tree it will be pulled
          with the kernel devs
	* Split code into "dump: Rename write_elf_loads to write_elf_phdr_loads"
	* Refined a lot of the commit messages
	* Split the string table patch into two: the swap of the
          section/segment and the string table support
	* Renamed write_elf_section_hdr_zero() to prepare_elf_section_hdr_zero()
	* Removed rogue code from "dump/dump: Add arch section support"

v2:
	* Added "dump: Cleanup memblock usage"
	* Fixed whitespace problems and review comments
	* Added missing *errp check in dump_end


Janosch Frank (14):
  dump: Introduce GuestPhysBlock offset and length filter functions
  dump: Rename write_elf_loads to write_elf_phdr_loads
  dump: Convert GuestPhysBlock iterators and use the filter functions
  dump: Allocate header
  dump: Split write of section headers and data and add a prepare step
  dump: Reorder struct DumpState
  dump: Swap segment and section header locations
  dump/dump: Add section string table support
  dump/dump: Add arch section support
  linux header sync
  s390x: Add protected dump cap
  s390x: Introduce PV query interface
  s390x: Add KVM PV dump interface
  s390x: pv: Add dump support

 dump/dump.c                  | 432 ++++++++++++++++++++++-------------
 hw/s390x/pv.c                | 112 +++++++++
 hw/s390x/s390-virtio-ccw.c   |   5 +
 include/elf.h                |   1 +
 include/hw/s390x/pv.h        |  18 ++
 include/sysemu/dump-arch.h   |  27 +++
 include/sysemu/dump.h        |  69 +++++-
 linux-headers/linux/kvm.h    |  54 +++++
 target/s390x/arch_dump.c     | 248 +++++++++++++++++---
 target/s390x/kvm/kvm.c       |   7 +
 target/s390x/kvm/kvm_s390x.h |   1 +
 11 files changed, 767 insertions(+), 207 deletions(-)

-- 
2.34.1


