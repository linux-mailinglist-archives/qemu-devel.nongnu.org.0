Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BCF482F49
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 10:18:28 +0100 (CET)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4JU2-0006bj-Qc
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 04:18:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1n4JQB-0004uL-6h
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 04:14:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36686
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1n4JQ8-00030d-JM
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 04:14:26 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2037jMQG028829; 
 Mon, 3 Jan 2022 09:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=M/s/8JVL8wwI2CbPJrudQ8fUUuzkd2slULhkvb+QZpk=;
 b=X2mENvjdz+W+oR1lQy8ptEC2VY3sVGs/BwOUDo/yFAMjhwp205ZH07wFI8Vzsk5Flu28
 rPNrJ9cYNUYoN2sx/ylUhkWyVcYe3scrivxvdxvNJiDo3UN5D5kdHxi+tJ1GtPTy4EuB
 iv2NSXEZWKZFmKl1+7x4L0T9giuC7lFu+76hnWSYlCRgJEwzp3INpkZmvF8LaWyGXlpQ
 iinEdBKr+Utv4Hq47B0Z5HvPi0dsIGXpitQbXz3r94e7ilgIHkou499A4OLvQH3Us5y9
 592zPoJubOCN/AoR7CtPIHpm0yzgXteM3ICpY0mkLqrplXF0hhnTpNdZdd59dwCJgfY4 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dbrpxnpmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 09:14:16 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20380sLw025071;
 Mon, 3 Jan 2022 09:14:16 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dbrpxnpm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 09:14:16 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2039E5lE002609;
 Mon, 3 Jan 2022 09:14:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 3daek9y904-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 09:14:15 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2039EEhl3932688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 09:14:14 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A5B1AC05F;
 Mon,  3 Jan 2022 09:14:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42F64AC065;
 Mon,  3 Jan 2022 09:14:12 +0000 (GMT)
Received: from DOVMURIK-QI20.localdomain (unknown [9.160.161.139])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 09:14:12 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] [RESEND] docs: Add spec of OVMF GUIDed table for SEV guests
Date: Mon,  3 Jan 2022 11:14:13 +0200
Message-Id: <20220103091413.2869-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j0xlBfFxuCsLIqah2Cx00BA8LKWoVYRY
X-Proofpoint-ORIG-GUID: wNprVF3HhyVOrF7_pZz6f0Mwr1H68WkP
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_03,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201030061
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add docs/specs/sev-guest-firmware.rst which describes the GUIDed table
in the end of OVMF's image which is parsed by QEMU, and currently used
to describe some values for SEV and SEV-ES guests.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 docs/specs/index.rst              |   1 +
 docs/specs/sev-guest-firmware.rst | 125 ++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 docs/specs/sev-guest-firmware.rst

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index ecc43896bb..2a35700fb3 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -18,3 +18,4 @@ guest hardware that is specific to QEMU.
    acpi_mem_hotplug
    acpi_pci_hotplug
    acpi_nvdimm
+   sev-guest-firmware
diff --git a/docs/specs/sev-guest-firmware.rst b/docs/specs/sev-guest-firmware.rst
new file mode 100644
index 0000000000..3f7f082df5
--- /dev/null
+++ b/docs/specs/sev-guest-firmware.rst
@@ -0,0 +1,125 @@
+====================================================
+QEMU/Guest Firmware Interface for AMD SEV and SEV-ES
+====================================================
+
+Overview
+========
+
+The guest firmware image (OVMF) may contain some configuration entries
+which are used by QEMU before the guest launches.  These are listed in a
+GUIDed table at a known location in the firmware image.  QEMU parses
+this table when it loads the firmware image into memory, and then QEMU
+reads individual entries when their values are needed.
+
+Though nothing in the table structure is SEV-specific, currently all the
+entries in the table are related to SEV and SEV-ES features.
+
+
+Table parsing in QEMU
+---------------------
+
+The table is parsed from the footer: first the presence of the table
+footer GUID (96b582de-1fb2-45f7-baea-a366c55a082d) at 0xffffffd0 is
+verified.  If that is found, two bytes at 0xffffffce are the entire
+table length.
+
+Then the table is scanned backwards looking for the specific entry GUID.
+
+QEMU files related to parsing and scanning the OVMF table:
+ - ``hw/i386/pc_sysfw_ovmf.c``
+
+The edk2 firmware code that constructs this structure is in the
+`OVMF Reset Vector file`_.
+
+
+Table memory layout
+-------------------
+
++------------+--------+-----------------------------------------+
+|    GPA     | Length |               Description               |
++============+========+=========================================+
+| 0xffffff80 | 4      | Zero padding                            |
++------------+--------+-----------------------------------------+
+| 0xffffff84 | 4      | SEV hashes table base address           |
++------------+--------+-----------------------------------------+
+| 0xffffff88 | 4      | SEV hashes table size (=0x400)          |
++------------+--------+-----------------------------------------+
+| 0xffffff8c | 2      | SEV hashes table entry length (=0x1a)   |
++------------+--------+-----------------------------------------+
+| 0xffffff8e | 16     | SEV hashes table GUID:                  |
+|            |        | 7255371f-3a3b-4b04-927b-1da6efa8d454    |
++------------+--------+-----------------------------------------+
+| 0xffffff9e | 4      | SEV secret block base address           |
++------------+--------+-----------------------------------------+
+| 0xffffffa2 | 4      | SEV secret block size (=0xc00)          |
++------------+--------+-----------------------------------------+
+| 0xffffffa6 | 2      | SEV secret block entry length (=0x1a)   |
++------------+--------+-----------------------------------------+
+| 0xffffffa8 | 16     | SEV secret block GUID:                  |
+|            |        | 4c2eb361-7d9b-4cc3-8081-127c90d3d294    |
++------------+--------+-----------------------------------------+
+| 0xffffffb8 | 4      | SEV-ES AP reset RIP                     |
++------------+--------+-----------------------------------------+
+| 0xffffffbc | 2      | SEV-ES reset block entry length (=0x16) |
++------------+--------+-----------------------------------------+
+| 0xffffffbe | 16     | SEV-ES reset block entry GUID:          |
+|            |        | 00f771de-1a7e-4fcb-890e-68c77e2fb44e    |
++------------+--------+-----------------------------------------+
+| 0xffffffce | 2      | Length of entire table including table  |
+|            |        | footer GUID and length (=0x72)          |
++------------+--------+-----------------------------------------+
+| 0xffffffd0 | 16     | OVMF GUIDed table footer GUID:          |
+|            |        | 96b582de-1fb2-45f7-baea-a366c55a082d    |
++------------+--------+-----------------------------------------+
+| 0xffffffe0 | 8      | Application processor entry point code  |
++------------+--------+-----------------------------------------+
+| 0xffffffe8 | 8      | "\0\0\0\0VTF\0"                         |
++------------+--------+-----------------------------------------+
+| 0xfffffff0 | 16     | Reset vector code                       |
++------------+--------+-----------------------------------------+
+
+
+Table entries description
+=========================
+
+SEV-ES reset block
+------------------
+
+Entry GUID: 00f771de-1a7e-4fcb-890e-68c77e2fb44e
+
+For the initial boot of an AP under SEV-ES, the "reset" RIP must be
+programmed to the RAM area defined by this entry.  The entry's format
+is:
+
+* IP value [0:15]
+* CS segment base [31:16]
+
+A hypervisor reads the CS segment base and IP value.  The CS segment
+base value represents the high order 16-bits of the CS segment base, so
+the hypervisor must left shift the value of the CS segment base by 16
+bits to form the full CS segment base for the CS segment register. It
+would then program the EIP register with the IP value as read.
+
+
+SEV secret block
+----------------
+
+Entry GUID: 4c2eb361-7d9b-4cc3-8081-127c90d3d294
+
+This describes the guest RAM area where the hypervisor should inject the
+Guest Owner secret (using SEV_LAUNCH_SECRET).
+
+
+SEV hashes table
+----------------
+
+Entry GUID: 7255371f-3a3b-4b04-927b-1da6efa8d454
+
+This describes the guest RAM area where the hypervisor should install a
+table describing the hashes of certain firmware configuration device
+files that would otherwise be passed in unchecked.  The current use is
+for the kernel, initrd and command line values, but others may be added.
+
+
+.. _OVMF Reset Vector file:
+   https://github.com/tianocore/edk2/blob/master/OvmfPkg/ResetVector/Ia16/ResetVectorVtf0.asm
-- 
2.25.1


