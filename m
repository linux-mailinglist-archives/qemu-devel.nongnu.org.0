Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE544419C8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:23:52 +0100 (CET)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUTo-00022J-1L
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhUS0-0007QG-8F
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:22:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39896
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhURy-000876-3d
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:21:59 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A18Nf03030995; 
 Mon, 1 Nov 2021 10:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=y6n0WGn4ZF5V2R+ZxaBrdA931iH++NlCLN7bx2O39k4=;
 b=bsafIoH1DChrB+8UC9mStxvJuWoi/qVZAfjy1HJcRe7jq/75gCcl34DZZru36qxJgoc5
 79t7e/V2oIl5umWRuYdsRN8aBJsd9scJ/JP9ddGEvj7q9y1rINQdbB2bSPSVnrryzzzO
 kOZZnGlD7AERsR766RVnu8AwH+0NFWIkQw84Sg+0wUUAx0Sv5dRlZd9phLH45olAvHTZ
 IZKK3u2ZVxIffGec2IqlsTGJvanF445QhoLaVjbFZ9bxR0Wid3YaRn2/ivjHoEujpUib
 OBJQbnDYGAKWJX43u9cSHefi1o/ANBTL2XTCNxgto/FPP/UxKR8xXb4mogf16rQLAfPV /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c2cpg1wje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 10:21:54 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A1AKFvp016145;
 Mon, 1 Nov 2021 10:21:53 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c2cpg1wj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 10:21:53 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A1AJ8pl026011;
 Mon, 1 Nov 2021 10:21:52 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3c0wpa8rx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 10:21:52 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A1ALo9Y22086258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Nov 2021 10:21:50 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFEAE6A054;
 Mon,  1 Nov 2021 10:21:50 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 156536A04D;
 Mon,  1 Nov 2021 10:21:49 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  1 Nov 2021 10:21:49 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] SEV: fixes for -kernel launch with incompatible OVMF
Date: Mon,  1 Nov 2021 10:21:33 +0000
Message-Id: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9IaIvNG3g2rpOcLV0W5u7XLcMgt5qD0v
X-Proofpoint-GUID: 2YUUOSNuz6wkVmmBtVJGfMvARkLtcFlF
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_04,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111010058
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tom Lendacky and Brijesh Singh reported two issues with launching SEV
guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
OVMF images are used.

The fixes in patches 1 and 2 allow such guests to boot by skipping the
kernel/initrd/cmdline hashes addition to the initial guest memory (and
warning the user).

Patch 3 is a refactoring of parts of the same function
sev_add_kernel_loader_hashes() to calculate all padding sizes at
compile-time.  This patch is not required to fix the issues above, but
is suggested as an improvement (no functional change intended).

Note that launch measurement security is not harmed by these fixes: a
Guest Owner that wants to use measured Linux boot with -kernel, must use
(and measure) an OVMF image that designates a proper hashes table area,
and that verifies those hashes when loading the binaries from QEMU via
fw_cfg.

The old OVMFs which don't publish the hashes table GUID or don't reserve
a valid area for it in MEMFD cannot support these hashes verification in
any case (for measured boot with -kernel).


[1] https://lore.kernel.org/qemu-devel/3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com/
[2] https://lore.kernel.org/qemu-devel/001dd81a-282d-c307-a657-e228480d4af3@amd.com/

Dov Murik (3):
  sev/i386: Allow launching with -kernel if no OVMF hashes table found
  sev/i386: Warn if using -kernel with invalid OVMF hashes table area
  sev/i386: Perform padding calculations at compile-time

 target/i386/sev.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)


base-commit: af531756d25541a1b3b3d9a14e72e7fedd941a2e
-- 
2.25.1


