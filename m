Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C68158FC32
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:29:00 +0200 (CEST)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7J5-0005nm-BE
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73J-00049a-6W; Thu, 11 Aug 2022 08:12:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73H-0008LH-8u; Thu, 11 Aug 2022 08:12:40 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6qbC015200;
 Thu, 11 Aug 2022 12:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=0TSZuoePc21oFwB497994yjPgmekiMtNb5jR+/WEKH0=;
 b=TDCmdoOXoL+iy961nRehWyWzXA4CsePhZIk7QxWwF7kV4xMp5qEH4nkaink6BYkt/Bsm
 bIWoCPry0D9gInrcOIQpC4g4kHhTF3yszChRL6ekHt7qCWSVGKw0rMWM7hoq1YtpXzlt
 ul/oE0XiwdbX5j2ODYAPWK/eBuem2bNZK8YmrpTtAmDtMlIAOECm4nLmfysJdEF82Oz8
 CAWqKNbrmTu5sf4F3qJGDKvbcD+gh+7LE8FpNriESXbS29Rh6zo4wWuCxNhft6Ka6D3x
 /GH5GFn7uNVfsxxBa5eqiU78a8ZCUg57EphFsvGqhYaKr+aP7xLlIH2DCe7pjwsrc/LQ oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw14a8uxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:04 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7Tee022885;
 Thu, 11 Aug 2022 12:12:04 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw14a8uw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC6YoK025363;
 Thu, 11 Aug 2022 12:12:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3huww2j0fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCBwSA20840958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:11:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40AA3AE056;
 Thu, 11 Aug 2022 12:11:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C8D9AE045;
 Thu, 11 Aug 2022 12:11:57 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:11:56 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 00/18] dump: Add arch section and s390x PV dump
Date: Thu, 11 Aug 2022 12:10:53 +0000
Message-Id: <20220811121111.9878-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cfZgDhxzl9bhMnJH_6lFMu_ulF77Rhji
X-Proofpoint-GUID: IK-LKlIssxM8e0fquTNcIS4l2tlkHqDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=984 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110037
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

Additionally I've added cleanup patches beforehand which clean up the
GuestPhysBlock usage.

v5:
	* Added a patch that moves the DumpState typedef and replaces
          the opaque pointers with properly typed ones
	* Removed the ELF header allocation since the codes has
          changed in a way that it's not needed anymore
	* Changed naming of dump_get_memblock_*() to dump_filter_memblock_*()
	* Removed various inline functions
	* Added a re-work of the filter variables

v4:
	* Moved the ELF note type introduction to the header sync
	* Split the iteration re-work into more patches
	* Added missing Rev-bys
	* Moved the introduction of section_offset to the patch where it's first used
	* Removed the buffer from prepare_elf_section_hdr_zero()
	* Removed buff argument from prepare_elf_section_hdr_zero()
	* Renamed some of the pv functions


Janosch Frank (18):
  dump: Replace opaque DumpState pointer with a typed one
  dump: Rename write_elf_loads to write_elf_phdr_loads
  dump: Refactor dump_iterate and introduce dump_filter_memblock_*()
  dump: Rework get_start_block
  dump: Rework filter area variables
  dump: Rework dump_calculate_size function
  dump: Split elf header functions into prepare and write
  dump: Rename write_elf*_phdr_note to prepare_elf*_phdr_note
  dump: Use a buffer for ELF section data and headers
  dump: Reorder struct DumpState
  dump: Swap segment and section header locations
  dump/dump: Add section string table support
  dump/dump: Add arch section support
  DRAFT: linux header sync
  s390x: Add protected dump cap
  s390x: Introduce PV query interface
  s390x: Add KVM PV dump interface
  s390x: pv: Add dump support

 dump/dump.c                      | 541 +++++++++++++++++++++----------
 hw/s390x/pv.c                    | 112 +++++++
 hw/s390x/s390-virtio-ccw.c       |   6 +
 include/elf.h                    |   2 +
 include/hw/core/sysemu-cpu-ops.h |   8 +-
 include/hw/s390x/pv.h            |  18 +
 include/qemu/typedefs.h          |   1 +
 include/sysemu/dump-arch.h       |   3 +
 include/sysemu/dump.h            |  36 +-
 linux-headers/linux/kvm.h        |  54 +++
 target/arm/arch_dump.c           |   6 +-
 target/arm/cpu.h                 |   4 +-
 target/i386/arch_dump.c          |  30 +-
 target/i386/cpu.h                |   8 +-
 target/ppc/arch_dump.c           |  18 +-
 target/ppc/cpu.h                 |   4 +-
 target/riscv/arch_dump.c         |   6 +-
 target/riscv/cpu.h               |   4 +-
 target/s390x/arch_dump.c         | 250 ++++++++++++--
 target/s390x/kvm/kvm.c           |   7 +
 target/s390x/kvm/kvm_s390x.h     |   1 +
 target/s390x/s390x-internal.h    |   2 +-
 22 files changed, 858 insertions(+), 263 deletions(-)

-- 
2.34.1


