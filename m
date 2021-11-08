Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C34480A6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 14:56:26 +0100 (CET)
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk58L-0008I2-Ca
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 08:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk51I-0007d1-LI
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:49:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16558
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk512-0004TP-9I
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:49:05 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8CWkqF019776; 
 Mon, 8 Nov 2021 13:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=qAgUfVC/7mWvn/wftq6cRmBdCQ+Pvxb9hFtmRcheHAo=;
 b=JJS8myLcriwGHFyJ6D+hbeGJXuD2BuDYOAqJik9WN44hPkgolIXER5zR8apR2vtjfevB
 DsRnRKYBN8BCmJhytUGazaDdz2IgDbEFAASuilGGZwMEH7qPNw8CZDbhdInMOKMdtn32
 1/UAIKbMbJPWrCBAQOEJuhHt0XWYFC5bKnYh5aw3ankIFv6IbK9lMk45rL/QLN1Pg/Ze
 fA6l2L5hRSFS1tzaFWpJuYxWVv/c5ketOuCdcL/V1ktcTTC7UM8ux2g4xAcnmKblp8rF
 FWBTWcLr4IfzSbkyDVkA4cvFSum1XxzBzFrzSrdVs5lAxUErHRIQciiZRmi6o0LILXa3 +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c6rs5sea6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:48 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8Dcx5Q010088;
 Mon, 8 Nov 2021 13:48:47 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c6rs5se9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:47 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8Dl0oa023045;
 Mon, 8 Nov 2021 13:48:46 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3c5hb9vjjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:46 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8DmkTi48759048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 13:48:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C5DC124053;
 Mon,  8 Nov 2021 13:48:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6EE7124055;
 Mon,  8 Nov 2021 13:48:45 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 13:48:45 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] SEV: add kernel-hashes=on for measured -kernel launch
Date: Mon,  8 Nov 2021 13:48:34 +0000
Message-Id: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w8qAgb4RqeRgpQn0lpcFxLvHojdjVW2Q
X-Proofpoint-ORIG-GUID: ADYn5fqDc9ntHuh097Kk1vPU-lporRqh
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111080084
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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


