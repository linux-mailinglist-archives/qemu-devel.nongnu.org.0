Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137B417ECF0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 00:57:53 +0100 (CET)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBSHQ-0004Rr-4r
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 19:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liran.alon@oracle.com>) id 1jBSCB-00051w-VP
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1jBSCA-0006L5-R1
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:52:27 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1jBSCA-0006KI-Hj
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 19:52:26 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 029NqOmT028674;
 Mon, 9 Mar 2020 23:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=YuoeCKeVFtn8DTMNE+e1YDELpF+RzZuG2WO4G1108RM=;
 b=fb41a+uFJ0+QePvX3ABo3UrV+YIj2DnbtDVFyEAaaMfP5B65DF2KiN+2dFdmmv5xac3l
 PPGk0tGaEvOsCrpMiVcRJn8S1IqxauV6kJVp5JEYxl30xmScafVmY/9O4UQ8pMVtAc0g
 TlSneTA9elQYjVzLqqdnGaOtvNIRnqqrdW+uzwUCHDTo3OQR2d4sKHWA8dbYy5CDSj9s
 q7aelaorgBBqR8FSNhUEE2FhaFESVC06XVSJnboNen2vwsOyp8xbmTvKdZC0gnTOcmBv
 BBc5+X3Zerv779bSQQx5Mvsgm99PrZo28SxlqrVOi9VIvQbTBKoIRZQ+tDPb/IkxBLAz eA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2ym3jqj5m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Mar 2020 23:52:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 029Nq1GR101651;
 Mon, 9 Mar 2020 23:52:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2ymun81cca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Mar 2020 23:52:24 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 029NqNqq027293;
 Mon, 9 Mar 2020 23:52:23 GMT
Received: from spark.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 09 Mar 2020 16:52:23 -0700
From: Liran Alon <liran.alon@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/14] hw/i386/vmport: Report VMX type in CMD_GETVERSION
Date: Tue, 10 Mar 2020 01:54:02 +0200
Message-Id: <20200309235411.76587-6-liran.alon@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=1 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003090144
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
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

As can be seen from VmCheck_GetVersion() in open-vm-tools code,
CMD_GETVERSION should return VMX type in ECX register.

Default is to fake host as VMware ESX server. But user can control
this value by "-global vmport.vmx-type=X".

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
---
 hw/i386/vmport.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index a2c8ff4b59cf..c03f57f2f636 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -36,6 +36,15 @@
 #define VMPORT_ENTRIES 0x2c
 #define VMPORT_MAGIC   0x564D5868
 
+typedef enum {
+   VMX_TYPE_UNSET = 0,
+   VMX_TYPE_EXPRESS,    /* Deprecated type used for VMware Express */
+   VMX_TYPE_SCALABLE_SERVER,    /* VMware ESX server */
+   VMX_TYPE_WGS,        /* Deprecated type used for VMware Server */
+   VMX_TYPE_WORKSTATION,
+   VMX_TYPE_WORKSTATION_ENTERPRISE /* Deprecated type used for ACE 1.x */
+} VMX_Type;
+
 #define VMPORT(obj) OBJECT_CHECK(VMPortState, (obj), TYPE_VMPORT)
 
 typedef struct VMPortState {
@@ -46,6 +55,7 @@ typedef struct VMPortState {
     void *opaque[VMPORT_ENTRIES];
 
     uint32_t vmx_version;
+    uint8_t vmx_type;
 } VMPortState;
 
 static VMPortState *port_state;
@@ -114,6 +124,7 @@ static uint32_t vmport_cmd_get_version(void *opaque, uint32_t addr)
     X86CPU *cpu = X86_CPU(current_cpu);
 
     cpu->env.regs[R_EBX] = VMPORT_MAGIC;
+    cpu->env.regs[R_ECX] = port_state->vmx_type;
     return port_state->vmx_version;
 }
 
@@ -173,6 +184,8 @@ static void vmport_realizefn(DeviceState *dev, Error **errp)
 static Property vmport_properties[] = {
     /* Default value taken from open-vm-tools code VERSION_MAGIC definition */
     DEFINE_PROP_UINT32("vmx-version", VMPortState, vmx_version, 6),
+    DEFINE_PROP_UINT8("vmx-type", VMPortState, vmx_type,
+                      VMX_TYPE_SCALABLE_SERVER),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1


