Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79972183703
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 18:12:13 +0100 (CET)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCRNU-00044n-Hw
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 13:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liran.alon@oracle.com>) id 1jCR4t-0003F1-8f
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:53:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1jCR4s-0000lF-48
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:52:59 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:57374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1jCR4r-0000jo-Rh
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:52:58 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CGn2tM012151;
 Thu, 12 Mar 2020 16:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=Y+AY//QouXfzkzXtnLSpmoaWfhuFvUxajyqaQlBHLSI=;
 b=sgwPEeXugmA/pZdS3CeRGfLpXczhrz2r3OaeCjL/jrr7e5se1ldzJ7p8O57UswXjKC8k
 RnrNecJohfS1+YGvuvRhFjA/s0mbL9nXW89fhncObuNtoChYpt1aOEzoJtz1ErTqiNIU
 gWd43DOvGsk4MHZWxUbvU2+fPDPl+cyHn5f+WFNoKBUS0ojRtUyoF2RCWE8FakLHXnes
 xd5gXj07F5Qtt3SnuNT5OvTqf6G35ZGNaUMFTAUFOG1QE0r1edH8WA1waPDla7IqlVUu
 BRpgSkdvw33Z47/o0FTaSYntfM5LrF/Ovv0oxwGxAG8WqGSq5pYJGj6LumhvQwn2XUkT QA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2ym31utt40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 16:52:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CGoF2I054117;
 Thu, 12 Mar 2020 16:52:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2yqgvdb0xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 16:52:54 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02CGqrZP030580;
 Thu, 12 Mar 2020 16:52:53 GMT
Received: from spark.ravello.local (/213.57.127.2)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Mar 2020 09:52:53 -0700
From: Liran Alon <liran.alon@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/16] hw/i386/vmport: Add support for CMD_GET_VCPU_INFO
Date: Thu, 12 Mar 2020 18:54:27 +0200
Message-Id: <20200312165431.82118-13-liran.alon@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312165431.82118-1-liran.alon@oracle.com>
References: <20200312165431.82118-1-liran.alon@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9558
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=1 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9558
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=1
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120085
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
 hw/i386/vmport.c         | 14 ++++++++++++++
 include/hw/i386/vmport.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 7e57eda4b526..2ce78aaf7b4c 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -55,6 +55,13 @@
 #define VMPORT_COMPAT_CMDS_V2                   \
     (1 << VMPORT_COMPAT_CMDS_V2_BIT)
 
+/* vCPU features reported by CMD_GET_VCPU_INFO */
+#define VCPU_INFO_SLC64_BIT             0
+#define VCPU_INFO_SYNC_VTSCS_BIT        1
+#define VCPU_INFO_HV_REPLAY_OK_BIT      2
+#define VCPU_INFO_LEGACY_X2APIC_BIT     3
+#define VCPU_INFO_RESERVED_BIT          31
+
 #define VMPORT(obj) OBJECT_CHECK(VMPortState, (obj), TYPE_VMPORT)
 
 typedef struct VMPortState {
@@ -199,6 +206,11 @@ static uint32_t vmport_cmd_time_full(void *opaque, uint32_t addr)
     return VMPORT_MAGIC;
 }
 
+static uint32_t vmport_cmd_get_vcpu_info(void *opaque, uint32_t addr)
+{
+    return 1 << VCPU_INFO_RESERVED_BIT;
+}
+
 /* vmmouse helpers */
 void vmmouse_get_data(uint32_t *data)
 {
@@ -247,6 +259,8 @@ static void vmport_realizefn(DeviceState *dev, Error **errp)
         vmport_register(VMPORT_CMD_GETBIOSUUID, vmport_cmd_get_bios_uuid, NULL);
         vmport_register(VMPORT_CMD_GETTIME, vmport_cmd_time, NULL);
         vmport_register(VMPORT_CMD_GETTIMEFULL, vmport_cmd_time_full, NULL);
+        vmport_register(VMPORT_CMD_GET_VCPU_INFO, vmport_cmd_get_vcpu_info,
+                        NULL);
     }
 }
 
diff --git a/include/hw/i386/vmport.h b/include/hw/i386/vmport.h
index 5d19963ed417..34cc050b1ffa 100644
--- a/include/hw/i386/vmport.h
+++ b/include/hw/i386/vmport.h
@@ -13,6 +13,7 @@ typedef enum {
     VMPORT_CMD_VMMOUSE_STATUS   = 40,
     VMPORT_CMD_VMMOUSE_COMMAND  = 41,
     VMPORT_CMD_GETTIMEFULL      = 46,
+    VMPORT_CMD_GET_VCPU_INFO    = 68,
     VMPORT_ENTRIES
 } VMPortCommand;
 
-- 
2.20.1


