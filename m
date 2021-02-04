Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3130FD21
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:44:42 +0100 (CET)
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kYU-0007at-1M
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l7kU1-0002DL-T5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:40:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1l7kTz-0005wq-82
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:40:05 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114JX0OY147246; Thu, 4 Feb 2021 14:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=TS4uYXQp5mnraRmKxW5supvyzwwkGFfVyH9o4YITqP8=;
 b=nSs4oeH7izvxsxfeZtfhqPpPQDbBj4n+ZliVd4kmqP9fq/U7qCjCpF/AginMS4uMtSsZ
 jPTwF3yJYQapKkEVkTAKVf2nF9fAu2VLXYGGmevMiRaDMfn5gnYIq2KyWEvqO7lxHogs
 N0u3wzY9sNNI1T+adpZ1ugMYtSAt8kQOAzYFpuQLv1BIOeDUjbtjHskAchkSo58d+KMI
 rStGO2gFNVyfOpnVuNHUlNllcGsAz5R0yzgosFePMlf5LTv7gzmRNsWtei+0GVy5rnwe
 e6qHlD0T9yQfImRE4I1t9xbKLG1g8FDHToo+fAFATkgLzCVwuHiAXQoMEbJ1z09vvyQt vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gp0mac36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 14:39:58 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114JXhtO153819;
 Thu, 4 Feb 2021 14:39:58 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gp0mac2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 14:39:58 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114Jc83P019412;
 Thu, 4 Feb 2021 19:39:57 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 36f3kvs1c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 19:39:57 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114Jdrum24117732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 19:39:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 649B86A04F;
 Thu,  4 Feb 2021 19:39:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9B426A051;
 Thu,  4 Feb 2021 19:39:50 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.153.205])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 19:39:50 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] sev: enable secret injection to a self described area
 in OVMF
Date: Thu,  4 Feb 2021 11:39:37 -0800
Message-Id: <20210204193939.16617-1-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_10:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=987 bulkscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102040114
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

v3: add bounds checking and remove misleading comment

v2: fix build issues and update comments.  Also drop the first patch
    which is now merged upstream

The two patches introduce a parser for the optional OVMF description
table which is placed just below the reset vector (the format of the
table is described in the patch itself) and also adds a hook to pull
out the description of the SEV secret area location and use it in
place of the sev-inject-launch-secret gpa.

James

---

James Bottomley (2):
  pc: add parser for OVMF reset block
  sev: update sev-inject-launch-secret to make gpa optional

 hw/i386/pc_sysfw.c    | 112 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h  |   4 ++
 qapi/misc-target.json |   2 +-
 target/i386/monitor.c |  23 ++++++++-
 4 files changed, 139 insertions(+), 2 deletions(-)

-- 
2.26.2


