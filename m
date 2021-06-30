Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E13B7D0B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 07:47:58 +0200 (CEST)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyT4n-0004bF-CH
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 01:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyT3W-0002dU-GX
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 01:46:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyT3R-0002Xq-Si
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 01:46:38 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15U5Y9lp166835; Wed, 30 Jun 2021 01:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=dDePpOUCA5CWVEMR0ePccoGLr+2Da6MG95bk3tyC2Fs=;
 b=qo03uga3gBFRqKyaacRmn5mgh6ei35dzPz/mpnBNdL1slf01/4tCDxHu3NkmrQ0i3Hso
 yt2epCaGgmyng06qPRaZqkXp54TkSr6qP5iMmXVXG7Z4xKXyC8fj8lg9KAwow1baudYL
 1j1MbFPRT3xf6o4+yywzftoikFiV3WwEeeSoXk2yUM/vSD34tpwiI3EkixkzOZMmbOw8
 MG8xR9yfGacxfnCzXgi4T9WW2xAsMWr04ju7hPjbqe8ysaEA6odfQdFmSyutYKZrXaI2
 OUK6d/TB4W3EmTQyFdqTmuS0ZV+7xd0MAiID7CGHMFVOoxlYRf66WMVc9w/osRPnN9XY 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ghdp9upd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 01:46:30 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15U5YdQV167986;
 Wed, 30 Jun 2021 01:46:30 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ghdp9up2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 01:46:29 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15U5bVb3014913;
 Wed, 30 Jun 2021 05:46:28 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 39duvce1ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 05:46:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15U5kRTY13107474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 05:46:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91723C605F;
 Wed, 30 Jun 2021 05:46:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFF8AC6067;
 Wed, 30 Jun 2021 05:46:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 05:46:26 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
Date: Wed, 30 Jun 2021 05:46:24 +0000
Message-Id: <20210630054625.3424178-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
References: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qMqSgWD12GhqTlfSEOMbkvKy2qSEVeCi
X-Proofpoint-GUID: UtOXn3LTq6Da6wJFvde3hapmhwyLMUFF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_01:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300034
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

Add assertion in pc_system_ovmf_table_find that verifies that the flash
was indeed previously parsed (looking for the OVMF table) by
pc_system_parse_ovmf_flash.

Now pc_system_ovmf_table_find distinguishes between "no one called
pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
and "the flash was parsed but no OVMF table was found, or it is invalid"
(which will return false).

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 hw/i386/pc_sysfw.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 6ce37a2b05..9eac36b830 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -126,6 +126,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
 
 #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
 
+static bool ovmf_flash_parsed = false;
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


