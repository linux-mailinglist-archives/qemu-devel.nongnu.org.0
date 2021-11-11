Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5CB44D4B7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:07:48 +0100 (CET)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6zj-0005aF-LB
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6tV-0001Jo-8t
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:01:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6tM-0000ae-DD
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:01:21 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB8cKvD021757; 
 Thu, 11 Nov 2021 10:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=juCtZv6durrToJXIMiwg4WZvHTeu6HTRLZlWOXI1H3o=;
 b=dihsFyEwOjgnFBjr7pDIUWaC8FQksXhK/OueQophjk/RrP0F0TG7bcAsJ/7X5w4nFmwb
 4pPbXmi3Rrf8YRzJFp2u/fvSl73fbBazcS3mx5x8QXTrt3gpcLNNi7tc3FnlE0aRA3Kj
 1KJZAyHH3Zz4exMEfBqK4/eWLJ7IIS4qoJ2+4tA3uIVEMXe6bfj4JgxEWrsq2Kpwx4IN
 +A4lsILm9MrjFfDHew6uU7KoY75k3hwDuByPhDBB32jAmSl+S5a6uxLNK+pFCFi+sjoq
 o1oqBigJ1igyj+VCYCqOhdGJTUFvOOzulps3airke6YqKwzT+u51xyMftc71XvKVCzUy 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8wbp5fje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:04 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ABA0YSX010537;
 Thu, 11 Nov 2021 10:01:03 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8wbp5fhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:03 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9uuWk030865;
 Thu, 11 Nov 2021 10:01:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3c5hbcxbea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:02 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ABA10xR11141416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:01:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56274BE10C;
 Thu, 11 Nov 2021 10:00:59 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B526BE087;
 Thu, 11 Nov 2021 10:00:58 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Nov 2021 10:00:58 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] SEV: add kernel-hashes=on for measured -kernel launch
Date: Thu, 11 Nov 2021 10:00:42 +0000
Message-Id: <20211111100048.3299424-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SwLq5gOrotVBbjnQCa5frcNqZ-0bK0cx
X-Proofpoint-GUID: wgzYDJ4vfOsvPY1HcMKJko7ht-mCgBtL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110056
Received-SPF: pass client-ip=148.163.156.1;
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
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tom Lendacky and Brijesh Singh reported two issues with launching SEV
guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
OVMF images are used.

To fix these issues, these series "hides" the whole kernel hashes
additions behind a kernel-hashes=on option (with default value of
"off").  This allows existing scenarios to work without change, and
explicitly forces kernel hashes additions for guests that require that.

Patch 1 introduces a new boolean option "kernel-hashes" on the sev-guest
object, and patch 2 causes QEMU to add kernel hashes only if its
explicitly set to "on".  This will mitigate both experienced issues
because the default of the new setting is off, and therefore is backward
compatible with older OVMF images (which don't have a designated hashes
table area) or with guests that don't wish to measure the kernel/initrd.

Patch 3 fixes the wording on the error message displayed when no hashes
table is found in the guest firmware.

Patch 4 detects incorrect address and length of the guest firmware
hashes table area and fails the boot.

Patch 5 is a refactoring of parts of the same function
sev_add_kernel_loader_hashes() to calculate all padding sizes at
compile-time.  Patch 6 also changes the same function and replaces the
call to qemu_map_ram_ptr() with address_space_map() to allow for error
detection.  Patches 5-6 are not required to fix the issues above, but
are suggested as an improvement (no functional change intended).

To enable addition of kernel/initrd/cmdline hashes into the SEV guest at
launch time, specify:

    qemu-system-x86_64 ... -object sev-guest,...,kernel-hashes=on


[1] https://lore.kernel.org/qemu-devel/3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com/
[2] https://lore.kernel.org/qemu-devel/001dd81a-282d-c307-a657-e228480d4af3@amd.com/


Changes in v3:
 - Patch 1/6: Add "(since 6.2)" in the documentation of the
   kernel-hashes option (thanks Markus)
 - Patch 3/6: Change error string use "kernel" instead of "-kernel"
   (thanks Daniel)

v2: https://lore.kernel.org/qemu-devel/20211108134840.2757206-1-dovmurik@linux.ibm.com/
Changes in v2:
 - Instead of trying to figure out whether to add hashes or not,
   explicity declare an option (kernel-hashes=on) for that.  When that
   option is turned on, fail if the hashes cannot be added.
 - Rephrase error message when no hashes table GUID is found.
 - Replace qemu_map_ram_ptr with address_space_map

v1: https://lore.kernel.org/qemu-devel/20211101102136.1706421-1-dovmurik@linux.ibm.com/


Dov Murik (6):
  qapi/qom,target/i386: sev-guest: Introduce kernel-hashes=on|off option
  target/i386/sev: Add kernel hashes only if sev-guest.kernel-hashes=on
  target/i386/sev: Rephrase error message when no hashes table in guest
    firmware
  target/i386/sev: Fail when invalid hashes table area detected
  target/i386/sev: Perform padding calculations at compile-time
  target/i386/sev: Replace qemu_map_ram_ptr with address_space_map

 qapi/qom.json     |  7 ++++-
 target/i386/sev.c | 77 +++++++++++++++++++++++++++++++++++++++--------
 qemu-options.hx   |  6 +++-
 3 files changed, 75 insertions(+), 15 deletions(-)


base-commit: af531756d25541a1b3b3d9a14e72e7fedd941a2e
-- 
2.25.1


Dov Murik (6):
  qapi/qom,target/i386: sev-guest: Introduce kernel-hashes=on|off option
  target/i386/sev: Add kernel hashes only if sev-guest.kernel-hashes=on
  target/i386/sev: Rephrase error message when no hashes table in guest
    firmware
  target/i386/sev: Fail when invalid hashes table area detected
  target/i386/sev: Perform padding calculations at compile-time
  target/i386/sev: Replace qemu_map_ram_ptr with address_space_map

 qapi/qom.json     |  7 ++++-
 target/i386/sev.c | 77 +++++++++++++++++++++++++++++++++++++++--------
 qemu-options.hx   |  6 +++-
 3 files changed, 75 insertions(+), 15 deletions(-)


base-commit: af531756d25541a1b3b3d9a14e72e7fedd941a2e
-- 
2.25.1


