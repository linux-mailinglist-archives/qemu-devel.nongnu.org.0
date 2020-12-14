Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A342D9B68
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:50:05 +0100 (CET)
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koq6u-0000Fs-3j
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1koq40-000762-AC
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:47:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1koq3w-0008U0-AN
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:47:04 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BEFiQBZ061664; Mon, 14 Dec 2020 10:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MDxCRFssnB2yDNyrn+KvH0OWeLgOMqUlyyse9IdjgUY=;
 b=oYQ66+5Sutt7unNexqFJAVqabeim0xjJ98sdB98V+VqT1/NmLYUZzRqQT7iyqYpbnVbR
 C1ZmoHDYA4EoKPcvDTRP8GTe+tIIxbjUelxf+mdNoPA83hsjgQCzCAjjOP8bMgV0CrDC
 viOrts1XtA2ABfRTLpY5kUv71hkVApDla3uywVbLcWcGQ4t4MO82U1ixQuS1M/9mG139
 JEyzgt+kHylFw2ywxJJSsYA5xCDCJwtvh6lMCaihXehzhiIhCF/R3dNg6b4zGkZGN9/f
 M9a3OREa6JJS7y89M1uYPxFNW3OFZgwa1xut5InBwGBNDsMDl3fsEPO89IKa6Tj/+LE6 Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35eaxv836u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 10:46:57 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BEFjRnU067763;
 Mon, 14 Dec 2020 10:46:57 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35eaxv836a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 10:46:57 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BEFkk4Z012349;
 Mon, 14 Dec 2020 15:46:56 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 35cng95387-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Dec 2020 15:46:56 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BEFkq2930671268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 15:46:52 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30C41BE059;
 Mon, 14 Dec 2020 15:46:52 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51D40BE056;
 Mon, 14 Dec 2020 15:46:49 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.80.214.106])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Dec 2020 15:46:49 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
Date: Mon, 14 Dec 2020 07:44:29 -0800
Message-Id: <20201214154429.11023-3-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214154429.11023-1-jejb@linux.ibm.com>
References: <20201214154429.11023-1-jejb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-14_06:2020-12-11,
 2020-12-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140108
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

v2: fix line length warning, add more comments about sev area
---
 qapi/misc-target.json |  2 +-
 target/i386/monitor.c | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 2 deletions(-)

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
index 1bc91442b1..11bdb04155 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -34,6 +34,7 @@
 #include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qapi-commands-misc.h"
+#include "hw/i386/pc.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -730,9 +731,33 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
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
+        /*
+         * not checking length means that this area can't be versioned
+         * by length and would have to be replaced if updated
+         */
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


