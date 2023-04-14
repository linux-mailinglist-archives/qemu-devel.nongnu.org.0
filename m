Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A696E2B86
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 23:08:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnQdV-0005Jx-9o; Fri, 14 Apr 2023 17:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1pnQdP-0005JN-V1
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 17:07:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1pnQdL-00016l-6W
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 17:07:07 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EL4LaO028322; Fri, 14 Apr 2023 21:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wP0WutXKPMxYwK8684ZsMRXQX8JRKoyjaCJGuTF3IzU=;
 b=VINBMe6+nh1ao1eHrAaIdtuI/voDPAoVTAOSgorv09QfkxSffzdxakAQZTfZiGL/mKIU
 4o/zVJJU+nc3iLPE7B0kDZcpod1coKTBZlpu2z9q+5dvGfH3Ote4Nviy9lTd9Mi0NAwi
 00XCvYUR0DI0MRD1SUzrj+rwAE3OApq+6XM9UXqcpkpduNymfK72z1Yo3gQKvhUDE1K5
 dLLWd7s3ZPoJGqglnob3N4oalR9uE7KUQdOO+kQTt2yN+JxQubFnh7Bq3czvh2lfVXg/
 HoYTINxkYYvnQk/vVeu1XC9t1lhhRkdQucFFbY4YW6PwS3KIvoF1LsbRJr8VbKikeSg2 nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pydwx12kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 21:06:58 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33EL4arC030847;
 Fri, 14 Apr 2023 21:06:58 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pydwx12jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 21:06:58 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33E2nBxL031609;
 Fri, 14 Apr 2023 21:06:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pu0mkk8sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 21:06:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33EL6rZW46727460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Apr 2023 21:06:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27DD620043;
 Fri, 14 Apr 2023 21:06:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA18520040;
 Fri, 14 Apr 2023 21:06:49 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.108.50])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
 Fri, 14 Apr 2023 21:06:49 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 02:36:48 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 1/2] travis.yml: Add missing clang-10 package to the 'Clang
 (disable-tcg)' job
Date: Sat, 15 Apr 2023 02:36:44 +0530
Message-Id: <20230414210645.820204-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Til8HHfh75jQagAe2kma_yZ6Hq5QiNpa
X-Proofpoint-ORIG-GUID: NtGqGrtDFVMAysTBHUvrX4KUeESkqrDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_13,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 clxscore=1011 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304140185
Received-SPF: pass client-ip=148.163.156.1; envelope-from=vaibhav@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit 74a1b256d775("configure: Bump minimum Clang version to 10.0") qemu
needs Clang version 10.0 as the minimum version to build qemu with
Clang. However 'focal' ships by default with Clang version 7.0.0 which causes an
error while executing the 'Clang (disable-tcg)' travis job of the form below:

<snip>
$clang --version

clang version 7.0.0 (tags/RELEASE_700/final)

<snip>
 ERROR: You need at least GCC v7.4 or Clang v10.0 (or XCode Clang v12.0)

 # QEMU configure log Fri 14 Apr 2023 03:48:22 PM UTC

 # Configured with: '../configure' '--disable-docs' '--disable-tools'
 '--disable-containers' '--disable-tcg' '--enable-kvm' '--disable-tools'
 '--enable-fdt=system' '--host-cc=clang' '--cxx=clang++'

Fix this by adding 'clang-10' to the 'apt_packages' section of the "[s390x]
Clang (disable-tcg)" job and updating the compiler to 'clang-10'.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 .travis.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index cf088ba4cf..11894eb810 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -243,7 +243,7 @@ jobs:
     - name: "[s390x] Clang (disable-tcg)"
       arch: s390x
       dist: focal
-      compiler: clang
+      compiler: clang-10
       addons:
         apt_packages:
           - libaio-dev
@@ -269,6 +269,7 @@ jobs:
           - libvdeplug-dev
           - libvte-2.91-dev
           - ninja-build
+          - clang-10
       env:
         - TEST_CMD="make check-unit"
         - CONFIG="--disable-containers --disable-tcg --enable-kvm --disable-tools
-- 
2.39.2


