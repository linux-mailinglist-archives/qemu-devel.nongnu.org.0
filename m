Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BBD17ECE3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 00:54:09 +0100 (CET)
Received: from localhost ([::1]:51541 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBSDo-0006hE-Ci
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 19:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liran.alon@oracle.com>) id 1jBSCR-0005OB-Gj
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:52:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1jBSCQ-0006fO-Fk
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:52:43 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:47606)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1jBSCQ-0006eJ-7o
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:52:42 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 029NqePh147313;
 Mon, 9 Mar 2020 23:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=4fT4sH3CM+0bfjxe/9m0bbXFNx4zOlz71rDmJ+Z877k=;
 b=GQ8Y8jr0q3pT54JGOJc4Pgk7gkfXKs84ZVCpToZb+yWFtiFUvk6dR5KWGi1QDFnMJTGd
 2pW7SfLFFtpbhF2Xrzm+VmRlp5zYelZ6z2CTa9JFq7GytmJk6a3UwZ4lDp/Pf34aGe2N
 niITPjW20M5SCgdOYxOgtlWyKZPjcIYslVFFgrB3vQqwZN7kh0X5ij4P04XYzDOKcPkD
 1+AIb9i1DvUJLhf32poV3vczOj/oLK9TLCj0m/O89fDzuImBSXZwJ4RIUv3MeTSDeMRs
 Ha1edmXf59OEVCkJshE+87FwGWc3lEn3lFqotVSVhojsgMFoU9lIcHPnx+kGDcuRv903 qA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2ym31ua65q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Mar 2020 23:52:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 029NqF8D102211;
 Mon, 9 Mar 2020 23:52:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2ymun81d99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Mar 2020 23:52:39 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 029NqdiQ008501;
 Mon, 9 Mar 2020 23:52:39 GMT
Received: from spark.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Mar 2020 16:52:38 -0700
From: Liran Alon <liran.alon@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/14] hw/i386/vmport: Add support for CMD_GET_VCPU_INFO
Date: Tue, 10 Mar 2020 01:54:07 +0200
Message-Id: <20200309235411.76587-11-liran.alon@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309235411.76587-1-liran.alon@oracle.com>
References: <20200309235411.76587-1-liran.alon@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9555
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=1 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9555
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=1
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003090144
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
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
Cc: ehabkost@redhat.com, mst@redhat.com, Liran Alon <liran.alon@oracle.com>,
 Nikita Leshenko <nikita.leshchenko@oracle.com>, pbonzini@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command currently returns that it is unimplemented by setting
the reserved-bit in it's return value.

Following patches will return various useful vCPU information
to guest.

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
---
 hw/i386/vmport.c     | 13 +++++++++++++
 include/hw/i386/pc.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 26231fc9d718..b33ef9c01d65 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -42,6 +42,13 @@ typedef enum {
    VMX_TYPE_WORKSTATION_ENTERPRISE /* Deprecated type used for ACE 1.x */
 } VMX_Type;
 
+/* vCPU features reported by CMD_GET_VCPU_INFO */
+#define VCPU_INFO_SLC64_BIT             0
+#define VCPU_INFO_SYNC_VTSCS_BIT        1
+#define VCPU_INFO_HV_REPLAY_OK_BIT      2
+#define VCPU_INFO_LEGACY_X2APIC_BIT     3
+#define VCPU_INFO_RESERVED_BIT          31
+
 #define VMPORT(obj) OBJECT_CHECK(VMPortState, (obj), TYPE_VMPORT)
 
 typedef struct VMPortState {
@@ -173,6 +180,11 @@ static uint32_t vmport_cmd_time_full(void *opaque, uint32_t addr)
     return VMPORT_MAGIC;
 }
 
+static uint32_t vmport_cmd_get_vcpu_info(void *opaque, uint32_t addr)
+{
+    return (1 << VCPU_INFO_RESERVED_BIT);
+}
+
 /* vmmouse helpers */
 void vmmouse_get_data(uint32_t *data)
 {
@@ -219,6 +231,7 @@ static void vmport_realizefn(DeviceState *dev, Error **errp)
     vmport_register(VMPORT_CMD_GETRAMSIZE, vmport_cmd_ram_size, NULL);
     vmport_register(VMPORT_CMD_GETTIME, vmport_cmd_time, NULL);
     vmport_register(VMPORT_CMD_GETTIMEFULL, vmport_cmd_time_full, NULL);
+    vmport_register(VMPORT_CMD_GET_VCPU_INFO, vmport_cmd_get_vcpu_info, NULL);
 }
 
 static Property vmport_properties[] = {
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 14d321e3cbbe..e880ca39ee3b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -147,6 +147,7 @@ typedef enum {
     VMPORT_CMD_VMMOUSE_STATUS   = 40,
     VMPORT_CMD_VMMOUSE_COMMAND  = 41,
     VMPORT_CMD_GETTIMEFULL      = 46,
+    VMPORT_CMD_GET_VCPU_INFO    = 68,
     VMPORT_ENTRIES
 } VMPortCommand;
 
-- 
2.20.1


