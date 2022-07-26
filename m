Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BD580FDB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:27:50 +0200 (CEST)
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGqz-0001Ew-SH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGmx-00047o-Gx; Tue, 26 Jul 2022 05:23:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGmv-0005XG-6P; Tue, 26 Jul 2022 05:23:39 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q9LMB4019799;
 Tue, 26 Jul 2022 09:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=jZ4QupvGOjRV2RhHYJ1X0SwqCK5AGE+yHdpj80rpq/g=;
 b=tAQkTYUo9AgZxqaIPqFSEmTzIBSZ4uYuZFmC41z/DA+Wag0e/RKB0wT8bVGFUYWOIXke
 ZKQfkThKniEvntFsB/sjbFL/yUFhV3okee0amkUWYlbkRI+AgxlbJuFVmu/Ekr139TR3
 gcVVrbEHQ3qwrB0ZKjiozSZ6LITpu9Zcsl2Exbo37sgzuBnwmWcq/oFqjOAaLI/6XVAj
 J9JcakWQnLoQm3gM57QfUGPLl4ezB+xgEauDTIo+DJAPABHJ+lCyR+DMDEJUACnnoqHv
 THjN62ly+MNB+Yld/X65yqIeqXQafOsjcEs4JJ+0W1H78Kddk9O+9xBjqBYIB5QPFy9v Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdjm81nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:34 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q9M4uL021953;
 Tue, 26 Jul 2022 09:23:34 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdjm81mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:34 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9LCKi017902;
 Tue, 26 Jul 2022 09:23:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6euj8j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26Q9NS3221037342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:23:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9014A4054;
 Tue, 26 Jul 2022 09:23:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6D7BA405B;
 Tue, 26 Jul 2022 09:23:27 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:27 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 00/17] dump: Add arch section and s390x PV dump
Date: Tue, 26 Jul 2022 09:22:31 +0000
Message-Id: <20220726092248.128336-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RUYmjqQl_HexYzNjMPtkPbPReuHH0TmC
X-Proofpoint-ORIG-GUID: XS9Foo8zYIWUVyXrqEy9HDlcr8io3rVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260033
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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

Previously this series was two separate series:
 * Arch section support
   Adds the possibility for arch code to add custom section data.

 * s390 PV dump support
   Adds PV dump data to the custom arch sections.

I've chosen to merge them so it's easier to understand why the arch
section support has been implement the way it is.

Additionally I've added cleanup patches beforehand which clean up the
GuestPhysBlock usage.

v4:
	* Moved the ELF note type introduction to the header sync
	* Split the iteration re-work into more patches
	* Added missing Rev-bys
	* Moved the introduction of section_offset to the patch where it's first used
	* Removed the buffer from prepare_elf_section_hdr_zero()
	* Removed buff argument from prepare_elf_section_hdr_zero()
	* Renamed some of the pv functions

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


Janosch Frank (17):
  dump: Rename write_elf_loads to write_elf_phdr_loads
  dump: Introduce GuestPhysBlock offset and length filter functions
  dump: Convert GuestPhysBlock iterators and use the filter functions
  dump: Rework get_start_block
  dump: Cleanup and annotate guest memory related DumpState struct
    members
  dump: Rework dump_calculate_size function
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

 dump/dump.c                  | 458 +++++++++++++++++++++++------------
 hw/s390x/pv.c                | 112 +++++++++
 hw/s390x/s390-virtio-ccw.c   |   5 +
 include/elf.h                |   2 +
 include/hw/s390x/pv.h        |  18 ++
 include/sysemu/dump-arch.h   |  27 +++
 include/sysemu/dump.h        |  37 ++-
 linux-headers/linux/kvm.h    |  54 +++++
 target/s390x/arch_dump.c     | 248 ++++++++++++++++---
 target/s390x/kvm/kvm.c       |   7 +
 target/s390x/kvm/kvm_s390x.h |   1 +
 11 files changed, 767 insertions(+), 202 deletions(-)

-- 
2.34.1


