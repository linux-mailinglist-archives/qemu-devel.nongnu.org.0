Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106EF5817BC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:44:02 +0200 (CEST)
Received: from localhost ([::1]:47444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNf6-0002R3-42
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9x-00037P-Jk
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9v-0006Bn-M8
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:49 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3Y7016266;
 Tue, 26 Jul 2022 16:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=KqUPut4P3GrI4rQG1Qzle999jooTQlmLWG7MmXouCMI=;
 b=k4ogjDZ6XegMPNnXbbd3/vDn3he94SFrvbdFbQS/+40wbb1/n2IKLHZk/7bBhL1H3bNL
 2Fh+1CnLXh0eK3pB2ZPhluQQdYWp4fzyLzxfLjLUmrfC/Vujc5ifmA+J/ZlwLzBdjgt3
 syNnswBNjJBj//q0aB/JqCsd7+PAGr7+aaBgid+eNglLakwhW2BkpT/TvwfE4W7KYR/i
 uWnU9OkaiUVyOGxkF41m2jzlgJC0RW891tVrd97jgemaRv2MQb7grmENzu2jG/O1dij/
 sGD/KiKevh9NiR8Bwh/jvLqre5OIYW7L5VRrnmehNYRJT9tiXb8WCKpWAjDod2zq9E6O Ug== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:26 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEvo84006379; Tue, 26 Jul 2022 16:11:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq28j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:25 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uT5023334;
 Tue, 26 Jul 2022 16:11:25 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-29; Tue, 26 Jul 2022 16:11:25 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 28/46] hostmem-epc: cpr support
Date: Tue, 26 Jul 2022 09:10:25 -0700
Message-Id: <1658851843-236870-29-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: L89OKDV4GNA-4VdTSwCQ2_d3Tc25wx0C
X-Proofpoint-ORIG-GUID: L89OKDV4GNA-4VdTSwCQ2_d3Tc25wx0C
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Preserve memory-backend-epc memory objects during cpr.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/hostmem-epc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 037292d..c6b1fe4 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -16,32 +16,34 @@
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
 #include "hw/i386/hostmem-epc.h"
+#include "migration/cpr-state.h"
 
 static void
 sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     uint32_t ram_flags;
-    char *name;
-    int fd;
+    g_autofree char *name = object_get_canonical_path(OBJECT(backend));
+    int fd = cpr_find_fd(name, 0);
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
         return;
     }
 
-    fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
     if (fd < 0) {
-        error_setg_errno(errp, errno,
-                         "failed to open /dev/sgx_vepc to alloc SGX EPC");
-        return;
+        fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
+        if (fd < 0) {
+            error_setg_errno(errp, errno,
+                            "failed to open /dev/sgx_vepc to alloc SGX EPC");
+            return;
+        }
+        cpr_save_fd(name, 0, fd);
     }
 
-    name = object_get_canonical_path(OBJECT(backend));
     ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED;
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
                                    name, backend->size, ram_flags,
                                    fd, 0, errp);
-    g_free(name);
 }
 
 static void sgx_epc_backend_instance_init(Object *obj)
-- 
1.8.3.1


