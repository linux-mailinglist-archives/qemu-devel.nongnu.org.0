Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E173F4C48
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:23:54 +0200 (CEST)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIArh-0003vo-3X
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl1-0006kG-S6
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAky-0000v3-7D
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:16:59 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NEE97L002853; Mon, 23 Aug 2021 10:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aHGICwWj8IRaXvb82rKRdwHvjUlCjM8CBobklKtLPa4=;
 b=KY+MSw8ecW4SodXR/bI10R9Kd4xAO2UcFYTLzo98/2vbpTg+zVgWTjN/b7a+Gue1jYeY
 I/+BEIunEk8TWLBBURl+1XO490M/Pa3Izmr8QiRhjAowwIPb8crzoPZNgqWJ3IFGZtnU
 vWvSwFaBknrEH0lSkj10RtM+/ac4vYB37D6SMSppBwf2wlNUk9eRDaYZBS7XwN8Jtxck
 XSUa2eaFCIfW74GnNnitLnWB7jnYnfkOzab0K5xUPOdmWYEgrOb/11u4Xb0kOgqEVcVN
 +epjcoBMDawKVnanIt5+29JTCCpOSPHLTGYuBHEsYiJyd3z62gshii5yV8O9ruUzOgyu RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3amd8m02pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:51 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NEENWj003285;
 Mon, 23 Aug 2021 10:16:50 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3amd8m02p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:50 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDH26031979;
 Mon, 23 Aug 2021 14:16:49 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3ajs4ax6ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:16:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGmnT44433896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22C19112065;
 Mon, 23 Aug 2021 14:16:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3FB2112061;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/12] migration: Skip ROM, non-RAM,
 and vga.vram memory region during RAM migration
Date: Mon, 23 Aug 2021 10:16:30 -0400
Message-Id: <20210823141636.65975-7-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823141636.65975-1-dovmurik@linux.ibm.com>
References: <20210823141636.65975-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: buiYW3XJDhPqLt12N0Gz-IrnQX-E0F8y
X-Proofpoint-ORIG-GUID: KhsVE4bsTRjpmeBE2aLt_mveV86BiumE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=998 spamscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108230098
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Steve Rutherford <srutherford@google.com>,
 James Bottomley <jejb@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migrating these memory region hangs the in-guest migration handler.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 migration/ram.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 2d5889f795..f0df6780fb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2086,7 +2086,9 @@ static bool encrypted_test_list(RAMState *rs, RAMBlock *block,
     unsigned long gfn;
 
     /* ROM devices contains the unencrypted data */
-    if (memory_region_is_rom(block->mr)) {
+    if (memory_region_is_rom(block->mr) ||
+        memory_region_is_romd(block->mr) ||
+        !memory_region_is_ram(block->mr)) {
         return false;
     }
 
@@ -2098,6 +2100,10 @@ static bool encrypted_test_list(RAMState *rs, RAMBlock *block,
         return false;
     }
 
+    if (!strcmp(memory_region_name(block->mr), "vga.vram")) {
+        return false;
+    }
+
     /*
      * Translate page in ram_addr_t address space to GPA address
      * space using memory region.
-- 
2.20.1


