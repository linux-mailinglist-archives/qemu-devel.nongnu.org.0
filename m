Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B13B7D0C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 07:47:58 +0200 (CEST)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyT4n-0004Y0-EU
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 01:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyT3T-0002d4-N6
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 01:46:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyT3R-0002YU-II
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 01:46:35 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15U5Wlk1162868; Wed, 30 Jun 2021 01:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=6byZ7BJiyAcUu2bKywj05Fxscef09SQjlZFWMEm9dgE=;
 b=MSeQW84cuz1bo8GF0elVw3eCWV/I/XbxTvv98OagopFZsfeOwk/OvrITW3+peGgpf8R9
 hYsPoFIWYFjUHLytCawo3XEr6Srx+2kXGwKabAUCx3Z7XP97g/mf+PSM02wdkpaME3r1
 x8V5zKEZErCydpzwOMf3eHQKxtYGUg6KKSzO/ri2xUEoVToH6zFvEGzHPYm8m/Gp6TQd
 qTWKuiTnY6b3xDC1iKquuTWjV/Z6YbdRHgHaSTrw+A23Kxg9bomDhVfA8dD4wp8HpBv7
 ehM5uOV96ursWVQladgxwHOKb0f/OSE7A3sIPm7rEwspdxB89Rk2KSRfV9Rr9AUmXu3U kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ghu6s82g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 01:46:30 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15U5Y4Av166009;
 Wed, 30 Jun 2021 01:46:30 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ghu6s829-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 01:46:30 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15U5cX0O019242;
 Wed, 30 Jun 2021 05:46:29 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 39ejyyqns3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 05:46:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15U5kSrw33751300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 05:46:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88F4CC6059;
 Wed, 30 Jun 2021 05:46:28 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD692C6061;
 Wed, 30 Jun 2021 05:46:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 05:46:27 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/i386/pc: Document pc_system_ovmf_table_find
Date: Wed, 30 Jun 2021 05:46:25 +0000
Message-Id: <20210630054625.3424178-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
References: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rPdjw0-TsdUtpKbKqQ3Z7BNLUwEUgvDY
X-Proofpoint-ORIG-GUID: YO3TxbNef4V559hclwUFR2xxRByS_UaZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_01:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300034
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

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/pc_sysfw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 9eac36b830..d02f1b2361 100644
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


