Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878142D480E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:38:15 +0100 (CET)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3Pq-0005Um-Gp
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1kn3El-00071O-JR
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:26:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1kn3Ea-0001os-5y
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:26:44 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9H2iVl032871; Wed, 9 Dec 2020 12:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0UZ7VGw4ka4vY3zraTbPVKA4xZEYP+kZ9qaXIgytQtU=;
 b=QEf9l0PSr9S1jkt18SmpdDa8ZhtVtvPkfKMW7HnMQ1J8XjBwmWiqxP6YfwzgUGbqNY+R
 HAJs57Gi8EhQXhE2isYLGjleE9P8dnEYvz3/5hxffcSmUhgr1lPHpwShDdCdkimqTKrP
 OebTTxxau9Mmoess2xhCLxV2x3k95mf+Vy/4FB9sYC/W+NGl2S89bcZMVpIzSon/3Cps
 GnsX2KHr1dLxuIPqPucg6iWDQt0R39LrQNrXJSGZ9CSnPqr3nwzBDBzVtlNRJ4N0aai8
 Y/QOCK4mLADlKJmJspgkAGJdMnyEHQmVORhD3ryk95JfjGLrBRldECZmEKE+e1SL4uaX 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avffb78x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:26:34 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9H35mB034634;
 Wed, 9 Dec 2020 12:26:33 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avffb78q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:26:33 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HH8Uu012825;
 Wed, 9 Dec 2020 17:26:32 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3581u9shbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:26:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9HQUq027984184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:26:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88B2128058;
 Wed,  9 Dec 2020 17:26:30 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C693128059;
 Wed,  9 Dec 2020 17:26:28 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.183.17])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:26:28 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] sev: update sev-inject-launch-secret to make gpa optional
Date: Wed,  9 Dec 2020 09:23:34 -0800
Message-Id: <20201209172334.14100-4-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209172334.14100-1-jejb@linux.ibm.com>
References: <20201209172334.14100-1-jejb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=1 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 qapi/misc-target.json |  2 +-
 target/i386/monitor.c | 22 +++++++++++++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4486a543ae..1ee4e62f85 100644
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
index 1bc91442b1..a99e3dd2b3 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -34,6 +34,7 @@
 #include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
+#include "hw/i386/pc.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -730,9 +731,28 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
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
+            error_setg(errp, "SEV: no secret area found in OVMF, gpa must be specified.");
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


