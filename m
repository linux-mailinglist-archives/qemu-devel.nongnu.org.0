Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C516E3B8D68
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 07:29:01 +0200 (CEST)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lypG0-0003Ki-R8
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 01:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lypEz-0001z2-NZ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:27:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lypEw-00020g-EN
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:27:57 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16153L9n062311; Thu, 1 Jul 2021 01:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=yMi64ekK7403QWBU7sUcmJctS3tJ8cMJ0kT/ZqQc3XU=;
 b=I6AViQ6H3wjz59z3dVoEhzZFF2lDyzGlFGCRi1gZ4hAc6MIpvQPG22M2/Yhhi6EAJg0I
 myyRvFQDxe25e4BDxgHxYgJTg4K1CQzB/72o37vEmxA02nIUtHSJM6CntLnJjhu/zPag
 GwUcN4x+TNfL/yQus4HnKgCDN6FjroXes9chzVU7mtT0FCsCSOgPhrCbPdj0hv8H27hr
 X29V8pvZpQBwI2aGNlr33NyM1V4bRBmISNqX8uFIYVcDsenuujROOTp/PsnyBK7yFhIN
 1E9GK8UGZz9cTKn0FRYfH0q/rwTm2DbH/cIizMDCo4FilCzlLjs21pgO3D6OctmgE3vG 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gwhuxj9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:27:51 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1615DpD4100257;
 Thu, 1 Jul 2021 01:27:51 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gwhuxj92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:27:51 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1615Mcd8009813;
 Thu, 1 Jul 2021 05:27:50 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 39ek00x3eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 05:27:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1615RoxX39977336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 05:27:50 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 383B8AE016;
 Thu,  1 Jul 2021 05:27:50 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E93DAE014;
 Thu,  1 Jul 2021 05:27:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 05:27:50 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
Date: Thu,  1 Jul 2021 05:27:48 +0000
Message-Id: <20210701052749.934744-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701052749.934744-1-dovmurik@linux.ibm.com>
References: <20210701052749.934744-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 876QfoxnLkTxUw86YgLnP5-5cqw2MrfB
X-Proofpoint-GUID: cSN8-LdzR1b8uHUWtpl4_hDotNHsataS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010034
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add assertion in pc_system_ovmf_table_find that verifies that the flash
was indeed previously parsed (looking for the OVMF table) by
pc_system_parse_ovmf_flash.

Now pc_system_ovmf_table_find distinguishes between "no one called
pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
and "the flash was parsed but no OVMF table was found, or it is invalid"
(which will return false).

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 hw/i386/pc_sysfw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 6ce37a2b05..e353f2a4e9 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -126,6 +126,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
 
 #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
 
+static bool ovmf_flash_parsed;
 static uint8_t *ovmf_table;
 static int ovmf_table_len;
 
@@ -136,10 +137,12 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
     int tot_len;
 
     /* should only be called once */
-    if (ovmf_table) {
+    if (ovmf_flash_parsed) {
         return;
     }
 
+    ovmf_flash_parsed = true;
+
     if (flash_size < TARGET_PAGE_SIZE) {
         return;
     }
@@ -183,6 +186,8 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
     int tot_len = ovmf_table_len;
     QemuUUID entry_guid;
 
+    assert(ovmf_flash_parsed);
+
     if (qemu_uuid_parse(entry, &entry_guid) < 0) {
         return false;
     }
-- 
2.25.1


