Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378D3B0524
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:48:18 +0200 (CEST)
Received: from localhost ([::1]:47134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfpB-00008z-EF
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvflT-00052t-GW
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:44:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58812
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvflP-00070f-7V
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:44:27 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MChlUC152825; Tue, 22 Jun 2021 08:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=IeDl1j/IO0r3FRTd3CwuRxxKPWFUh6/eHH92hmoGG7Q=;
 b=Qxn9ydORcpxXb3ntvf3lDlZ3oLnW7njR4i/OumbUmxRyrAiHYhTN0QAS4vpRkGFtcbMo
 fJTpQIHLxPxwFR6cSjqHVrmn0awqXMwdLiZo/tGMFy238xt9yQ/+efsk7Ur/mAFGadpN
 H0r8k//HsHPD9A3hqDY9htaScgAB4DdlDjyNibfG9AxCwk6L9Ru90MXUd0lrXPwT1Vb0
 I7AZh/xE2/UtCTehRhX1gjdw1a2jV/5/xkj5e1VROKWDrqHGKWAHdYxGoyyhN3hLvKxB
 VMe+F1gCUXkGNvRJ1ZweJgAHFu4yXJi3EDmw4IQm3E+SUQGayo7tXVYblD6ChoYBcHVV Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39bg4er0ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 08:44:20 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15MCiK9N155186;
 Tue, 22 Jun 2021 08:44:20 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39bg4er0rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 08:44:20 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MCgTIv014633;
 Tue, 22 Jun 2021 12:44:19 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3998797n2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 12:44:19 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MCiJEr32047604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 12:44:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 777EB112061;
 Tue, 22 Jun 2021 12:44:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4672D112062;
 Tue, 22 Jun 2021 12:44:19 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 12:44:19 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/pc: Document pc_system_ovmf_table_find
Date: Tue, 22 Jun 2021 12:44:19 +0000
Message-Id: <20210622124419.3008278-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zXf4WHuFeRkP_yjwzO1PpFV4cCGctvgL
X-Proofpoint-ORIG-GUID: R0i4uDJDB7S9ZEdH3LhMdhxx8pHC9OHN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_06:2021-06-21,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220079
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 hw/i386/pc_sysfw.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 6ce37a2b05..e8d20cb83f 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -176,6 +176,20 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
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
+ * Note that this function must be called after the OVMF table was found and
+ * copied by pc_system_parse_ovmf_flash().
+ *
+ * Return: true if the entry was found in the OVMF table; false otherwise.
+ */
 bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len)
 {
-- 
2.25.1


