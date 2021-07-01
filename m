Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6933B8D6D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 07:30:49 +0200 (CEST)
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lypHk-0005WO-O8
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 01:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lypF0-0001zA-36
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:27:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lypEy-00022C-3O
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:27:57 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16152nQY047849; Thu, 1 Jul 2021 01:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=RP1xlAU9XIGaWsOa6nUVIY95luCE0fXRfNAyuhhIaPQ=;
 b=Uv4rMB0p+/4K9QlBYiooRCAWT5RTNfxxPuEKIiB0QD3Gxmws5dBTPkthPO+WzyRV9uVg
 qyhUtri+z6HNAqmLnwnWzodbXgNYA3MiwWdKG6etbjYCxgCXfWtNIqBWm2NoubCy4erb
 sovz9LgKGl3I+kYQpq/5rnHKJHa8wnM0Trl7mWsK3TAywW05nLRMsYsf4zBMXpHNig9g
 Hc0JuLSH33ty1aRV9D71YhaZ6Av16mutj8tqApotw2rG91tP9eqQmCDH+HRX0incFdQd
 fhbZ1ptbYHhgS5vSI1478wMCPgC08hJCw1Xtc2bXWriPdLbhY4BFfrHStbnPGzms6LEC dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h5wdt6rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:27:52 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1615OW9J180792;
 Thu, 1 Jul 2021 01:27:52 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h5wdt6r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:27:52 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1615LZU0010803;
 Thu, 1 Jul 2021 05:27:50 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 39duvdmg4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 05:27:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1615RoV739649678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 05:27:50 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73794AE011;
 Thu,  1 Jul 2021 05:27:50 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EFE6AE012;
 Thu,  1 Jul 2021 05:27:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 05:27:50 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] hw/i386/pc: Document pc_system_ovmf_table_find
Date: Thu,  1 Jul 2021 05:27:49 +0000
Message-Id: <20210701052749.934744-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701052749.934744-1-dovmurik@linux.ibm.com>
References: <20210701052749.934744-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xIDObqIQZ-zhhPry3PIOFnf6EKQMJGLl
X-Proofpoint-GUID: dF7dl3Iqm_5odKA66LtHnRK32BBjescJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010034
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

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/pc_sysfw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index e353f2a4e9..6ddce92a86 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -179,6 +179,17 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
     ovmf_table += tot_len;
 }
 
+/**
+ * pc_system_ovmf_table_find - Find the data associated with an entry in OVMF's
+ * reset vector GUIDed table.
+ *
+ * @entry: GUID string of the entry to lookup
+ * @data: Filled with a pointer to the entry's value (if not NULL)
+ * @data_len: Filled with the length of the entry's value (if not NULL). Pass
+ *            NULL here if the length of data is known.
+ *
+ * Return: true if the entry was found in the OVMF table; false otherwise.
+ */
 bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len)
 {
-- 
2.25.1


