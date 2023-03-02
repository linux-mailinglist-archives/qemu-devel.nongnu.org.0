Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC46A7DA1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:25:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfAW-0006GB-TK; Thu, 02 Mar 2023 04:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAU-0006D9-Jl
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAS-0002yP-9b
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:06 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3228H3x6006058; Thu, 2 Mar 2023 09:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=qo1VwkjR68qBBsUBQa8D9owj3/4FGPIf0hHVYHTZI14=;
 b=bop7RO6OjZtAzXKRDXiH/jKEPIKBt2kzxD44odoaDcV9DzcVuVNkBp3g0vtEbULf3NWV
 qc41LSHlEvXeceI105l61IUVX2nNc+uILdnW5hLPDSKPLk2G43lE2jmXCBfmomyODpTo
 8KhsCX/1rMrNUIyxrAzQQZwecH4n1A02YkoF23GxYBCAqWS72wq6rBRmZgt++w+zpsDQ
 6uWDL0FClset4L0s0N3VV4dIwUvqHmdAcKQiKr+/8eWCgh+iTJoNRu+0e+uYTJayCEjR
 ZC5npEPbbE4mgwCrO1HOBokT1FMlQgnWPmqaT5or8V1WJlfQt/6SHMMZLvDZstUDZgJT Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2r5essq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:23:57 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3228Iu1o014957;
 Thu, 2 Mar 2023 09:23:57 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2r5esspp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:23:57 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3227li5Y017420;
 Thu, 2 Mar 2023 09:23:56 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3nybchtwfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:23:55 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3229NrQF27656718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 09:23:53 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C152658043;
 Thu,  2 Mar 2023 09:23:53 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5574A58061;
 Thu,  2 Mar 2023 09:23:52 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 09:23:52 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Mario Smarduch <mario.smarduch@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: [RFC PATCH v3 0/4] i386/sev: Support measured direct kernel boot on
 SNP
Date: Thu,  2 Mar 2023 09:23:43 +0000
Message-Id: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -qv8kOBAZ6A6xXttQdx9ue5fiZkxhPMb
X-Proofpoint-ORIG-GUID: XSAPj5w3TlFJADE0CDDfc0wGG80Fb_EN
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_04,2023-03-02_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=757
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020078
Received-SPF: pass client-ip=148.163.156.1;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

(This RFC patch series is based on AMD's RFC upmv10-snpv3 tree [1].  So
far that RFC tree was not submitted for review in qemu-devel.)


In order to enable measured direct kernel boot on SNP, QEMU needs to
fill the hashes page when kernel-hashes=on.  This relies on several
changes to the SNP metadata published by OVMF (See [2] for proposed
OVMF patches).

Patch 1 pulls the 'kernel-hashes' property from the SEV guest settings
to the common settings to make it available for both SEV and SNP.

Patch 2 and 3 refactor the code in target/i386/sev.c to allow easier
change in patch 4.

Patch 4 adds the hashes table for SNP guests (or validates the page as a
zero page if kernel-hashes=off).

This patch series is also available at [3].


[1] https://github.com/mdroth/qemu/commits/upmv10-snpv3
[2] https://edk2.groups.io/g/devel/message/100625
[3] https://github.com/confidential-containers-demo/qemu/tree/snp-kernel-hashes-v3

v3:
* Separate refactoring to their own patches.
* Use a new SNP metadata entry which indicates kernel hashes page;
  during pre-validation, either encrypt the page with the kernel hashes
  or mark it as zero (thanks Tom).

v2: https://lore.kernel.org/qemu-devel/20230216084913.2148508-1-dovmurik@linux.ibm.com/
v2 changes:
* Rebase on top of upmv10-snpv3 which includes kernel-hashes.

v1: https://lore.kernel.org/qemu-devel/20220329064038.96006-1-dovmurik%40linux.ibm.com/

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>
Cc: Mario Smarduch <mario.smarduch@amd.com>
Cc: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>

Dov Murik (4):
  qapi, i386: Move kernel-hashes to SevCommonProperties
  i386/sev: Extract build_kernel_loader_hashes
  i386/sev: Reorder struct declarations
  i386/sev: Allow measured direct kernel boot on SNP

 qapi/qom.json        |  12 +--
 include/hw/i386/pc.h |   2 +
 target/i386/sev.c    | 238 +++++++++++++++++++++++++------------------
 3 files changed, 146 insertions(+), 106 deletions(-)

-- 
2.25.1


