Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAD32227C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 00:03:17 +0100 (CET)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEKEV-00042W-Jh
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 18:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEKCh-00030G-92
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 18:01:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lEKCb-0006rt-Lw
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 18:01:23 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MMXrZT045954; Mon, 22 Feb 2021 18:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u2PqGWjIM49rxeP2JsyXgEWCmR3XgiDKa4VG2EDFNk8=;
 b=my/DjO6z+RyUwOjSUewdW1q9n30OMW176AbLKV8O2B04o2RQm1ioL5ix+x4gKzruB/8N
 12CB99vGcAzLuas6OYal/hSFZ+ic7pheZ8WYlVagWRW7GfoHeKHV6miYNad0k8hUlp47
 Zw8SBMw7o42EirhL7jcgLHU4V32HQ1IQ/nnbNi15x7VwFovEDoEebpuVyWIIA9NdPI2H
 uiQP59ZunZEs/8ornotws6MhvOVpx02DiEk2dLOWd3gLFf8l2Ii3ZX57clyRgCGTS1au
 i3LG2uR8BZlmJdth9K2nbbXYbIuIpRJY+8fSSRmNuEdwa48NRLsngcKMq5fg69HjPUc5 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkfs4kqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 18:01:14 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11MMswDi149552;
 Mon, 22 Feb 2021 18:01:14 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkfs4kpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 18:01:14 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MMw3NU029135;
 Mon, 22 Feb 2021 23:01:13 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 36tt28tdyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 23:01:13 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MN1ClC23134602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 23:01:12 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 544476A051;
 Mon, 22 Feb 2021 23:01:12 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B23FF6A054;
 Mon, 22 Feb 2021 23:01:11 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.163.12.145])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Feb 2021 23:01:11 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] gitlab-ci.yml: Allow custom make parallelism
Date: Mon, 22 Feb 2021 18:01:04 -0500
Message-Id: <20210222230106.7030-2-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_07:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=877 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220194
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, make parallelism at build time is defined as #cpus+1.
Some build jobs may need (or benefit from) a different number.

An example is builds with LTO where, because of the huge demand
of memory at link time, gitlab runners fails if two linkers are
run concurrently

This patch retains the default value of #cpus+1 but allows setting
the "JOBS" variable to a different number when applying the template

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8b6d495288..5c198f05d4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -17,7 +17,7 @@ include:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
-    - JOBS=$(expr $(nproc) + 1)
+    - JOBS=${JOBS:-$(expr $(nproc) + 1)}
   script:
     - mkdir build
     - cd build
-- 
2.30.0


