Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37C600974
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:56:09 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLuq-0004ef-OV
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLeu-0007sj-7K; Mon, 17 Oct 2022 04:39:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLes-0003dr-0P; Mon, 17 Oct 2022 04:39:39 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H80Wia025190;
 Mon, 17 Oct 2022 08:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=6NhzWStU2Ob/Q8H7/gKFGZ/JIzMDigwQKyxJGLN4g3s=;
 b=bzmHeBFkot9C2k2R0qZ3gbkLheJgZsYlASgXrE2lJ2UdvDEAuh/MW2aM1USvDOEt+rw3
 Bu0RSC43biCuvORAdLVB3XpTSejd4zXOoYfoF9FVN+npeA187Ptk1T654M5GaOx+KFjX
 ULXWJ+qU9ru1JYfgQDQbBczco69genaRLvlmGRI60xZv5qMnV9nVzANiov2aLfYhxLmb
 lw5vpHCXD937rTvZWbxpsW4eJsULcCztjRo7GLkt96Vw08jRO7ouVyPQ4GrpeNnqRnDm
 UM+bh6dkAhRmhrZeQjwii43lIJmLpf7HPFUm3TRK4Cf7CgmkDplTyqq0bjNhggxS9vUX sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86hk98h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:31 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H8ZteJ025048;
 Mon, 17 Oct 2022 08:39:30 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86hk98gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H8bOFN026454;
 Mon, 17 Oct 2022 08:39:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3k7mg92n4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29H8dP9j43581812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 08:39:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98A6BA405E;
 Mon, 17 Oct 2022 08:39:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F375A404D;
 Mon, 17 Oct 2022 08:39:24 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 08:39:24 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v6 00/10] dump: Add arch section and s390x PV dump
Date: Mon, 17 Oct 2022 08:38:12 +0000
Message-Id: <20221017083822.43118-1-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UMV2AcT67rFa4eT0ESU7fBVmqjkKpmt-
X-Proofpoint-ORIG-GUID: RIRaRKsEu7bmeAGHED3uoR5bg1XM_7ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=788 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170046
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

v6:
	* Rebase after parts of the series have been pulled
	* Put the section header move into its own patch
	* Added freeing of s->elf_section_hdrs
	* Added missing false fields in the note arrays in arch_dump.c

v5:
	* Added a patch that moves the DumpState typedef and replaces
          the opaque pointers with properly typed ones
	* Removed the ELF header allocation since the codes has
          changed in a way that it's not needed anymore
	* Changed naming of dump_get_memblock_*() to dump_filter_memblock_*()
	* Removed various inline functions
	* Added a re-work of the filter variables


Janosch Frank (10):
  dump: Use a buffer for ELF section data and headers
  dump: Write ELF section headers right after ELF header
  dump: Reorder struct DumpState
  dump: Reintroduce memory_offset and section_offset
  dump: Add architecture section and section string table support
  s390x: Add protected dump cap
  s390x: Introduce PV query interface
  RFC: elf.h changes
  s390x: Add KVM PV dump interface
  s390x: pv: Add dump support

 dump/dump.c                  | 290 +++++++++++++++++++++++++++--------
 hw/s390x/pv.c                | 112 ++++++++++++++
 hw/s390x/s390-virtio-ccw.c   |   6 +
 include/elf.h                |   2 +
 include/hw/s390x/pv.h        |  19 +++
 include/sysemu/dump-arch.h   |   3 +
 include/sysemu/dump.h        |  26 +++-
 target/s390x/arch_dump.c     | 262 +++++++++++++++++++++++++++----
 target/s390x/kvm/kvm.c       |   7 +
 target/s390x/kvm/kvm_s390x.h |   1 +
 10 files changed, 629 insertions(+), 99 deletions(-)

-- 
2.34.1


