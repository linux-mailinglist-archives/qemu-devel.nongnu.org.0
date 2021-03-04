Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469F32CAB5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 04:10:55 +0100 (CET)
Received: from localhost ([::1]:51308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHeO6-0006Je-1U
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 22:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lHeNC-0005sS-6O
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 22:09:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59320
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lHeN9-0005Is-B3
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 22:09:57 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12434fbv194180
 for <qemu-devel@nongnu.org>; Wed, 3 Mar 2021 22:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CiphDrl02xkoAvQM++uvOpRcPV7RCPdf7PHpbNtZmzI=;
 b=TBxVpWGQHtlaOvCfijXHR+k2Pa7UzTsCsL4rEs/JABTulXlZVjKCKQFy4RXwHayo1PxU
 PU0fI/VBfS0NwFR5Lz9v8LqkeyQ+L+5S19TEnupDgy8lbVSfW1JKyAp57+WuA++4aWIq
 awUkGZFjuk5rCphiHUiOxF8VS/Rb5a0wMdWhOJpXKX33e6C3kvSHdRFYlPJDUWFm+jpq
 kbkvyTtxP+gaa/SRp9QlcO1euaiAuM3Zx0Qq8ciyvcEjfnS6ph3JmqcGUXZjuru6F1Ya
 2FeUAHrDmuV8eoJPc5XvGalQ/CCpuFvPUTZy0R06fr7HFsfqLtYGUZ9gThoBBTqdB/fR eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 372ng2jrbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 22:09:53 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12435wrt002957
 for <qemu-devel@nongnu.org>; Wed, 3 Mar 2021 22:09:53 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 372ng2jrb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 22:09:53 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 12438Hlt021891;
 Thu, 4 Mar 2021 03:09:53 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3720r0jbr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 03:09:53 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12439p7N35717522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Mar 2021 03:09:51 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A8FB6A057;
 Thu,  4 Mar 2021 03:09:51 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 222E96A047;
 Thu,  4 Mar 2021 03:09:51 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  4 Mar 2021 03:09:50 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] gitlab-ci.yml: Add jobs to test CFI
Date: Wed,  3 Mar 2021 22:09:46 -0500
Message-Id: <20210304030948.9367-1-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_01:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040010
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a few months now QEMU has had options to enable compiler-based
control-flow integrity if built with clang.

While this feature has a low maintenance, It's probably still better to
add tests to the CI environment to check that an update doesn't break it.

The patchset allow gitlab testing of:
* --enable-cfi: forward-edge cfi (function pointers)
* --enable-safe-stack: backward-edge cfi (return pointers)
As an added benefit, this also inherently tests LTO. 

The first patch allows a custom selection for linker parallelism.
Currently, make parallelism at build time is based on the number
of cpus available.
This doesn't work well with LTO at linking, because the linker has to
load in memory all the intermediate object files for optimization.
If the gitlab runner happens to run two linking processes at the same
time, the job will fail with an out-of-memory error,
The patch leverages the ability to maintain high parallelism at
compile time, but limit the number of linkers executed in parallel.

The second patch introduces the ci/cd jobs in the gitlab pipeline.
To maintain a limited number of short jobs, Daniel suggested to only
test targets where KVM is available. This restricted the jobs to
x86_64, ppc64, aarch64 and s390x. To keep the jobs under 1 hour, I
created three chains of build -> check -> acceptance jobs, divided by
architecture vendor (Intel, ARM, IBM).

For build, we have to select --enable-slirp=git, because CFI needs a
statically linked version of slirp, with CFI information. More info on
this can be found in a comment in .gitlab-ci.yml, or on a patch for
mason currently in ML:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg787636.html

Test runs of the full pipeline are here (cfi-ci-v3 branch):
https://gitlab.com/dbuono/qemu/-/pipelines/264484574

v3:
- Restricted the targets to x86_64, ppc64, aarch64 and s390x, under
  suggestion from Daniel.

v2:
- More details in the code about the issue of using system-wide slirp
- Use meson to only limit linker parallelism instead of forcing no
  parallelism on the whole compilation process.

Daniele Buono (2):
  gitlab-ci.yml: Allow custom # of parallel linkers
  gitlab-ci.yml: Add jobs to test CFI flags

 .gitlab-ci.yml | 123 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

-- 
2.30.0


