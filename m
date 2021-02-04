Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24D30FD42
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:51:11 +0100 (CET)
Received: from localhost ([::1]:50812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kek-0005nD-MV
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l7kV8-0003LD-Eu
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:41:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l7kV5-0006XN-0k
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:41:14 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114JZWBT047541; Thu, 4 Feb 2021 14:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EyMUtAnR+754LGsn4ff2xN2ShGV0cZeWERjWRJBcNhc=;
 b=oTluc6Vb9TL1DjMgdqFIVm4n5V01mjiHF6MG3C8ghijfqT+i1JyVnT2hYD1Kd05Zoqrb
 NtX2GwFJfRKIeKbC0S7oxeY7+4n/v4E1YPpcpNqz06FAbj/rWBOO80x9wJ4xfXa2iGDq
 5W7nimIvSSwoKYou4ESzrjpTPrQ27ZUXuSTl/oBKJoZiHRb+P6eK1VX04CrhuzJ0CtM8
 xLFOlM11ZS/Zw6eX1y+s/50mNFs9C5TfE+ynkskVhQd0k8AQo4uMsNkyJkxRlAbaW0L6
 RRuKq9MZOQXkHqwHzEugV8zC2Ra8Qqflg+5Kj9aeJhGs7YmtyO1V1nLKCi+kMo+ad+lw 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gn5tbkn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 14:41:08 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114JZaF4047888;
 Thu, 4 Feb 2021 14:41:08 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gn5tbkmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 14:41:08 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114Jc8xu019431;
 Thu, 4 Feb 2021 19:41:07 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 36f3kvs1mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 19:41:07 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114Jf3SL26870166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 19:41:04 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA42D6A04D;
 Thu,  4 Feb 2021 19:41:03 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 762066A047;
 Thu,  4 Feb 2021 19:41:01 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.153.205])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 19:41:01 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
Date: Thu,  4 Feb 2021 11:39:39 -0800
Message-Id: <20210204193939.16617-3-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204193939.16617-1-jejb@linux.ibm.com>
References: <20210204193939.16617-1-jejb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_10:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040114
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jejb@linux.ibm.com, jon.grimm@amd.com, tobin@ibm.com,
 frankeh@us.ibm.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 dovmurik@linux.vnet.ibm.com, Dov.Murik1@il.ibm.com, pbonzini@redhat.com,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the gpa isn't specified, it's value is extracted from the OVMF
properties table located below the reset vector (and if this doesn't
exist, an error is returned).  OVMF has defined the GUID for the SEV
secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format of
the <data> is: <base>|<size> where both are uint32_t.  We extract
<base> and use it as the gpa for the injection.

Note: it is expected that the injected secret will also be GUID
described but since qemu can't interpret it, the format is left
undefined here.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>

---

v2: fix line length warning, add more comments about sev area
v2: remove misleading comment
---
 qapi/misc-target.json |  2 +-
 target/i386/monitor.c | 23 ++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 06ef8757f0..0c7491cd82 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -216,7 +216,7 @@
 #
 ##
 { 'command': 'sev-inject-launch-secret',
-  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa': 'uint64' },
+  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
   'if': 'defined(TARGET_I386)' }
 
 ##
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 1bc91442b1..5994408bee 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -34,6 +34,7 @@
 #include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
+#include "hw/i386/pc.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -730,9 +731,29 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
     return sev_get_capabilities(errp);
 }
 
+#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
+struct sev_secret_area {
+    uint32_t base;
+    uint32_t size;
+};
+
 void qmp_sev_inject_launch_secret(const char *packet_hdr,
-                                  const char *secret, uint64_t gpa,
+                                  const char *secret,
+                                  bool has_gpa, uint64_t gpa,
                                   Error **errp)
 {
+    if (!has_gpa) {
+        uint8_t *data;
+        struct sev_secret_area *area;
+
+        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
+            error_setg(errp, "SEV: no secret area found in OVMF,"
+                       " gpa must be specified.");
+            return;
+        }
+        area = (struct sev_secret_area *)data;
+        gpa = area->base;
+    }
+
     sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
 }
-- 
2.26.2


