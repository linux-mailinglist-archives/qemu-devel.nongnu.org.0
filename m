Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33E4BF284
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 08:23:09 +0100 (CET)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMPVs-0002iO-2L
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 02:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMPSE-0000O5-7J
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:19:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMPSB-0002GR-7h
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:19:21 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21M6BnE4002466; 
 Tue, 22 Feb 2022 07:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=y7j9OqDKNtpf48x1+ELEKuZNTfJGJ6jjmIQahVV9VsA=;
 b=EWxGT/4Ju1kWyOY6vgCLuBDB6NL4BMyZwZjvT8Dop3vGRagKrPRq29cFe3h/HmOY6fzi
 S9NNnaMipAA8vXr11xOev1yrOOQ8vhlXM4jWPPw58FylOa8vxZoxSb9Ch68tHR3fYUIz
 DPgRr3DfILp9N+fAWVYrHnXqAfS2fYRI+eE95QvuUOigWht0xarPKIKy/ZFRXAoBdS82
 S9Fqor9OGV5Me7bb1Bx1iWus7hWLzh5BGzSC8FtOdg7KCGWFLTEFRo1T8vlvb10CU2FJ
 ezEhiYXn6St+jZzs0dfCL9VGDlnTsy/ayy55slOe9QzoplFPZngEC9jDdYUvM5WRzogA hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ectbfhbgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 07:19:13 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21M6ub94006746;
 Tue, 22 Feb 2022 07:19:12 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ectbfhbgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 07:19:12 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21M7DKII019906;
 Tue, 22 Feb 2022 07:19:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3ear6adcdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 07:19:11 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21M7JAnB31392054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 07:19:10 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 309AE112074;
 Tue, 22 Feb 2022 07:19:10 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04BDB112061;
 Tue, 22 Feb 2022 07:19:10 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 22 Feb 2022 07:19:09 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] hw/i386: Improve bounds checking in OVMF table parsing
Date: Tue, 22 Feb 2022 07:19:05 +0000
Message-Id: <20220222071906.2632426-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222071906.2632426-1-dovmurik@linux.ibm.com>
References: <20220222071906.2632426-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p_wL316xMkPKVLHkH25o3GWAQEB0nlB7
X-Proofpoint-GUID: 1d_HLhyjiemkx0svS2TycnPN3s3tQ5bN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_02,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202220040
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When pc_system_parse_ovmf_flash() parses the optional GUIDed table in
the end of the OVMF flash memory area, the table length field is checked
for sizes that are too small, but doesn't error on sizes that are too
big (bigger than the flash content itself).

Add a check for maximal size of the OVMF table, and add an error report
in case the size is invalid.  In such a case, an error like this will be
displayed during launch:

    qemu-system-x86_64: OVMF table has invalid size 4047

and the table parsing is skipped.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 hw/i386/pc_sysfw_ovmf.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
index f4dd92c588..df15c9737b 100644
--- a/hw/i386/pc_sysfw_ovmf.c
+++ b/hw/i386/pc_sysfw_ovmf.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/i386/pc.h"
 #include "cpu.h"
 
@@ -66,7 +67,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
     ptr -= sizeof(uint16_t);
     tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
 
-    if (tot_len <= 0) {
+    if (tot_len < 0 || tot_len > (ptr - flash_ptr)) {
+        error_report("OVMF table has invalid size %d", tot_len);
+        return;
+    }
+
+    if (tot_len == 0) {
+        /* no entries in the OVMF table */
         return;
     }
 
-- 
2.25.1


