Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9950A1FCF7B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 16:26:09 +0200 (CEST)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlZ0y-00063Y-LS
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 10:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1jlYyF-0001lw-G9
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:23:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10912
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1jlYyD-0005MN-5P
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:23:19 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05HE6RoE135375
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 10:23:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31q6hdrja6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 10:23:16 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05HE6aPI137502
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 10:23:15 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31q6hdrj9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 10:23:15 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05HEFN4S018547;
 Wed, 17 Jun 2020 14:23:15 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 31q6bd3xe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 14:23:15 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05HENCAH7275066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jun 2020 14:23:12 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29B967805E;
 Wed, 17 Jun 2020 14:23:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BE337805C;
 Wed, 17 Jun 2020 14:23:13 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Jun 2020 14:23:13 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/8] tpm: Guard irq related ops in case interrupts are
 disabled
Date: Wed, 17 Jun 2020 10:23:04 -0400
Message-Id: <20200617142305.1198672-8-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200617142305.1198672-1-stefanb@linux.vnet.ibm.com>
References: <20200617142305.1198672-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-17_04:2020-06-17,
 2020-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 cotscore=-2147483648 malwarescore=0
 suspectscore=1 clxscore=1015 lowpriorityscore=0 mlxlogscore=959
 spamscore=0 impostorscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006170105
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 10:23:10
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, eric.auger@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 mkedzier@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check for irq_num having the value of TPM_IRQ_DISABLED before calling any
IRQ related functions or allowing the user to try to enable interrupts.
Explicitly allow the value of TPM_IRQ_DISABLED in irq_num.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Message-id: 20200616205721.1191408-8-stefanb@linux.vnet.ibm.com
---
 hw/tpm/tpm_tis_common.c | 12 +++++++++++-
 hw/tpm/tpm_tis_isa.c    |  6 ++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
index 0f42696f1f..13b233309e 100644
--- a/hw/tpm/tpm_tis_common.c
+++ b/hw/tpm/tpm_tis_common.c
@@ -359,7 +359,11 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
         val = s->loc[locty].inte;
         break;
     case TPM_TIS_REG_INT_VECTOR:
-        val = s->irq_num;
+        if (s->irq_num != TPM_IRQ_DISABLED) {
+            val = s->irq_num;
+        } else {
+            val = 0;
+        }
         break;
     case TPM_TIS_REG_INT_STATUS:
         val = s->loc[locty].ints;
@@ -591,6 +595,9 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
         if (s->active_locty != locty) {
             break;
         }
+        if (s->irq_num == TPM_IRQ_DISABLED) {
+            val &= ~TPM_TIS_INT_ENABLED;
+        }
 
         s->loc[locty].inte &= mask;
         s->loc[locty].inte |= (val & (TPM_TIS_INT_ENABLED |
@@ -601,6 +608,9 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
         /* hard wired -- ignore */
         break;
     case TPM_TIS_REG_INT_STATUS:
+        if (s->irq_num == TPM_IRQ_DISABLED) {
+            break;
+        }
         /* clearing of interrupt flags */
         if (((val & TPM_TIS_INTERRUPTS_SUPPORTED)) &&
             (s->loc[locty].ints & TPM_TIS_INTERRUPTS_SUPPORTED)) {
diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 27222a9a49..d72f733ead 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -127,13 +127,15 @@ static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
         error_setg(errp, "'tpmdev' property is required");
         return;
     }
-    if (s->irq_num > 15) {
+    if (s->irq_num > 15 && s->irq_num != TPM_IRQ_DISABLED) {
         error_setg(errp, "IRQ %d is outside valid range of 0 to 15",
                    s->irq_num);
         return;
     }
 
-    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
+    if (s->irq_num != TPM_IRQ_DISABLED) {
+        isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
+    }
 
     memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
                                 TPM_TIS_ADDR_BASE, &s->mmio);
-- 
2.24.1


