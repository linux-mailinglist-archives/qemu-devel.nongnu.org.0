Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E2132ABD3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:51:09 +0100 (CET)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHBz2-00039m-MJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwb-0001N9-TZ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12584
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwZ-00084w-A8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:37 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KhIrW191148; Tue, 2 Mar 2021 15:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VV2EcsYRdA7SCtuLO6OLWS5cJN2YfMieO7hR66jJjcA=;
 b=s2bdZwhCVRK/jHFFbkAvEz5D6E212OxVoy0OL77vCFEP1CK6+qh9hc6Q3YglN9CdXr/h
 2KYbbYbPO/8n6ZqJ8ju6GvYN62de1MCIDOfgKq2xRGEoDKn/LSJSZQHMLzvcQKsjQ4W8
 8chLjmBB6F3fIaz/yDwlhNOQUPLmtwbHJikj8AuNzzAf+1EydMy/PGUr7LxNaGuAZln+
 JthVu0y6WqMF0g4XSsrIvZ76WPrzBhwg5OISQIPSRPhuiCyLnK/CRqFo9rL620xioB/N
 ouqDB4xw7xi1VVCxjTHTTJCsXMZIohQ+2C2Z55f2tqkbM80PhvqwqsOWKbzvEbMQm1UI vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vn7r7te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:31 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KhM5h191662;
 Tue, 2 Mar 2021 15:48:30 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vn7r7sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:30 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KX2aI018077;
 Tue, 2 Mar 2021 20:48:30 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3711dwtf6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:30 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmT9g20709818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36B092806D;
 Tue,  2 Mar 2021 20:48:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01D992805A;
 Tue,  2 Mar 2021 20:48:29 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:28 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/26] hw/boards: Add aux flag to CPUArchId
Date: Tue,  2 Mar 2021 15:48:00 -0500
Message-Id: <20210302204822.81901-5-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aux flag indicates whether a vcpu is auxiliary.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 include/hw/boards.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 7ee5c73510..4458b359c3 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -51,6 +51,7 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
  * @type - QOM class name of possible @cpu object
  * @props - CPU object properties, initialized by board
  * #vcpus_count - number of threads provided by @cpu object
+ * @aux - is this CPU auxiliary
  */
 typedef struct CPUArchId {
     uint64_t arch_id;
@@ -58,6 +59,7 @@ typedef struct CPUArchId {
     CpuInstanceProperties props;
     Object *cpu;
     const char *type;
+    bool aux;
 } CPUArchId;
 
 /**
-- 
2.20.1


