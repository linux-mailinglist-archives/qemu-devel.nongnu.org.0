Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7DD698F05
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:49:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZxK-0004GB-8Y; Thu, 16 Feb 2023 03:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSZxI-0004G0-1L
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:49:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSZxF-0005fv-HL
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:49:27 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31G8kiuB013046; Thu, 16 Feb 2023 08:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=DjO41fZTL22SOyefHYH9dyO7ruUt6lz8ocw9PsK6HbM=;
 b=ALmp3AkwGpp6uxFV4BGz1wWobUcrQlNRvi+dCVGT99S+HM2gQ8QWhuAX8NSNBZDa6FO4
 ahDuO9Ibs7sidA+TDex1TQs/eytfr8CTeMwDNk66PeHwGa5U/DuZd/sNUk7nWHNZGDGb
 djNuMwPZWEZQiT2B4GkRJ2BCW2yp1lzAvNL/gtw/o/QX2qNI7ZrVb6wulFgYlhJvgi96
 FrPUbzElmUGoiQy4IdkDlTWqUryIr4JRDZSUPCoZIQfYewcWC21EnIhf6MsQTvtx4NHn
 /X7KIdE+o4xNbuuUdP3n7LoelKMTzRBVtgj2MaCeqehIIaaiNsrRUKfyzpqw99WXFiTF mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsh92g12d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:21 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31G8nLfc020236;
 Thu, 16 Feb 2023 08:49:21 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsh92g124-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:21 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G7viVN021594;
 Thu, 16 Feb 2023 08:49:20 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3np2n7hn5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:20 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31G8nJ9v6685324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Feb 2023 08:49:19 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBF315805E;
 Thu, 16 Feb 2023 08:49:18 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90E8658058;
 Thu, 16 Feb 2023 08:49:17 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Feb 2023 08:49:17 +0000 (GMT)
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
Subject: [RFC PATCH v2 0/2] i386/sev: Support measured direct kernel boot on
 SNP
Date: Thu, 16 Feb 2023 08:49:11 +0000
Message-Id: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4-WpPQ6AkAfOegg3-Y-aAIL-5SO9Bm2_
X-Proofpoint-GUID: ZR51a8HZWPR38Z5KrItADAl8OdAZyI-N
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_06,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 mlxlogscore=587
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160070
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This RFC patch series is based on AMD's RFC upmv10-snpv3 tree [1].


In order to enable measured direct kernel boot on SNP, QEMU needs to
fill the hashes page when kernel-hashes=on.  This relies on several
changes to the SNP metadata published by OVMF (See [2] for proposed
OVMF patches).

Patch 1 pulls the 'kernel-hashes' property from the SEV guest settings
to the common settings to make it available for both SEV and SNP.

Patch 2 adds the hashes table for SNP guests (or validates the page as a
zero page if kernel-hashes=off).

This patch series is also available at [3].


[1] https://github.com/mdroth/qemu/commits/upmv10-snpv3
[2] https://edk2.groups.io/g/devel/message/100286
[3] https://github.com/confidential-containers-demo/qemu/tree/snp-kernel-hashes-v2

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

Dov Murik (2):
  qapi, i386: Move kernel-hashes to SevCommonProperties
  i386/sev: Allow measured direct kernel boot on SNP

 qapi/qom.json     | 12 +++---
 target/i386/sev.c | 95 +++++++++++++++++++++++++++++------------------
 2 files changed, 65 insertions(+), 42 deletions(-)

-- 
2.25.1


