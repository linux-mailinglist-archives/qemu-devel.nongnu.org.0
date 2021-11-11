Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F089844D4AC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:06:02 +0100 (CET)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6y2-0007o0-3k
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6tR-0001Fc-RB
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:01:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48922
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6tM-0000aw-D9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:01:17 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9IR0k020793; 
 Thu, 11 Nov 2021 10:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Tvb2MEsd8wWeIaW+DgNkTQ+0QynuIGKwBBs/tlDOeAY=;
 b=NyxzouEONFiunQuF/W7g9LFOeivir5fsXlRh/pzEg/xhHdPhN65ScLffOnF2yPa8unkW
 aynEY+iA8fl5q2EsbcniT94kNqK1I+HXuU8FuWeU+ntAAsKULLl+9hhqy28meoHL7LV+
 LycOqkzn59ZfmOvUqLAUODYo93pcSoydGIscKJdSbicC1y0zwCU8Ptjuif2Hxp9wz2it
 tBFAyZs/gbN2xuKedJj+IiKa14/XY//e1MJGVAUqv87nbSTRhfsWqiOw0E6a+kQiIP0j
 aEgsWiRokSinpnLGtCtpXiLtBUELJK0eoXry4NkbNF1Yb/x/773kWMnCydtlFj8lO+oN 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c90e80ysy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:09 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AB9wTvs018835;
 Thu, 11 Nov 2021 10:01:09 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c90e80ysh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:08 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9v59K021176;
 Thu, 11 Nov 2021 10:01:08 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3c5hbcpfpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ABA16in17432868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:01:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1C03BE06D;
 Thu, 11 Nov 2021 10:01:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9718FBE09D;
 Thu, 11 Nov 2021 10:01:05 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Nov 2021 10:01:05 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] target/i386/sev: Replace qemu_map_ram_ptr with
 address_space_map
Date: Thu, 11 Nov 2021 10:00:48 +0000
Message-Id: <20211111100048.3299424-7-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111100048.3299424-1-dovmurik@linux.ibm.com>
References: <20211111100048.3299424-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dHhpNJIxL0hWGHfOqE9FVvyxq7RMNnVQ
X-Proofpoint-ORIG-GUID: ULar37qCHO3p2mfNKLfkLu9mdeNtcseu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110056
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use address_space_map/unmap and check for errors.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Brijesh Singh <brijesh.singh@amd.com>
---
 target/i386/sev.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 4fd258a570..c21f526bf2 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -37,6 +37,7 @@
 #include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/i386/pc.h"
+#include "exec/address-spaces.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
@@ -1232,6 +1233,9 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     uint8_t kernel_hash[HASH_SIZE];
     uint8_t *hashp;
     size_t hash_len = HASH_SIZE;
+    hwaddr mapped_len = sizeof(*padded_ht);
+    MemTxAttrs attrs = { 0 };
+    bool ret = true;
 
     /*
      * Only add the kernel hashes if the sev-guest configuration explicitly
@@ -1292,7 +1296,11 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
      * Populate the hashes table in the guest's memory at the OVMF-designated
      * area for the SEV hashes table
      */
-    padded_ht = qemu_map_ram_ptr(NULL, area->base);
+    padded_ht = address_space_map(&address_space_memory, area->base, &mapped_len, true, attrs);
+    if (!padded_ht || mapped_len != sizeof(*padded_ht)) {
+        error_setg(errp, "SEV: cannot map hashes table guest memory area");
+        return false;
+    }
     ht = &padded_ht->ht;
 
     ht->guid = sev_hash_table_header_guid;
@@ -1314,10 +1322,12 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     memset(padded_ht->padding, 0, sizeof(padded_ht->padding));
 
     if (sev_encrypt_flash((uint8_t *)padded_ht, sizeof(*padded_ht), errp) < 0) {
-        return false;
+        ret = false;
     }
 
-    return true;
+    address_space_unmap(&address_space_memory, padded_ht, mapped_len, true, mapped_len);
+
+    return ret;
 }
 
 static void
-- 
2.25.1


