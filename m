Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721B4BE2C8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:55:57 +0100 (CET)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCui-0002ts-E3
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:55:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nMCtB-00029H-O2
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:54:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nMCt9-0004Lu-N8
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:54:21 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LFo5Bd007500; 
 Mon, 21 Feb 2022 17:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=NHzCyMpmKro/jSczjnl7YduIpklPrCNUNZsPtzWyarY=;
 b=KzxfTmZxY79G3D8Ms51w+9qyzVkomodVHQHKwWkXg7KMZ7uwBOZB02DOj/9QGotoQBsn
 x7GBqqH/3RhFE97Dv4PQ45zwXhCbVYrYl+RSzcVeuUDQ8EQ0GH+MZAYg6JgBYGLBIb1f
 Y7zH9BUnFj60eEAcLMDng1E18oI26KbWzTkzXWTtwhL6NXSBH7ZBDh06wQfX6GxIjCu1
 ovsrOQBZ+aAIjP+N8h+FGS0xYiD9lochmZIDpwo9Of4VXAgh7MJTfjmL+0KiPaZSmhL6
 OtbJrrF+ZDEsKg5CkTKJfUH4pj9hpUh6rLtuDqzGMaBmrqa8jrMF5Xjg06qQy/nP1kgy yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ebn09um50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 17:54:15 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21LHiHXE018008;
 Mon, 21 Feb 2022 17:54:14 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ebn09um4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 17:54:14 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LHr6gs009132;
 Mon, 21 Feb 2022 17:54:13 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3ear69bwx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 17:54:13 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21LHsC5v26804620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 17:54:12 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D10A2112062;
 Mon, 21 Feb 2022 17:54:12 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 662FF112063;
 Mon, 21 Feb 2022 17:54:11 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.62.223])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 21 Feb 2022 17:54:11 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] analyze-migration.py: Fix instance_id signedness
Date: Mon, 21 Feb 2022 14:53:57 -0300
Message-Id: <20220221175357.2103775-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 91UkqsSj6v4doq37GeeVLC9fiSP220e-
X-Proofpoint-GUID: 1Bq8T_OVwWkoXE2qqzlI2puUnMmIe0-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_08,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210103
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: eduardo@habkost.net, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The instance_id field is uint32_t in the migration code, however the
script currently handles it as a signed integer:

$ ./scripts/analyze-migration.py -f mig
 Traceback (most recent call last):
   File "./scripts/analyze-migration.py", line 605, in <module>
     dump.read(dump_memory = args.memory)
   File "./scripts/analyze-migration.py", line 539, in read
     classdesc = self.section_classes[section_key]
 KeyError: ('spapr_iommu', -2147483648)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 scripts/analyze-migration.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index b82a1b0c58..713f645eea 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -40,8 +40,8 @@ def __init__(self, filename):
     def read64(self):
         return int.from_bytes(self.file.read(8), byteorder='big', signed=True)
 
-    def read32(self):
-        return int.from_bytes(self.file.read(4), byteorder='big', signed=True)
+    def read32(self, signed=True):
+        return int.from_bytes(self.file.read(4), byteorder='big', signed=signed)
 
     def read16(self):
         return int.from_bytes(self.file.read(2), byteorder='big', signed=True)
@@ -533,7 +533,7 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
             elif section_type == self.QEMU_VM_SECTION_START or section_type == self.QEMU_VM_SECTION_FULL:
                 section_id = file.read32()
                 name = file.readstr()
-                instance_id = file.read32()
+                instance_id = file.read32(signed=False)
                 version_id = file.read32()
                 section_key = (name, instance_id)
                 classdesc = self.section_classes[section_key]
-- 
2.34.1


