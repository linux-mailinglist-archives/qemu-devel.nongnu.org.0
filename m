Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B459C6915EB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 01:53:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQHeL-0003b7-3b; Thu, 09 Feb 2023 19:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pQHeI-0003aS-Ko
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:52:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pQHeG-00061V-Gz
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:52:22 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31A0jEOV002472; Fri, 10 Feb 2023 00:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GrRJNwGtX0JuHbn5172HWYEo636pa5vMBketGaRKt9w=;
 b=koN8EgyrPkeSaYCCXd/0URAQOT3m7QjBXkrJNYOHg8pgd1cBFmYKpAc/cf04xDRryjZm
 W2DPYtfEt6ktJuKHZTtKpXuM3XhxGaQUpgkrIRWtLdvrxFMfiKGfBNj77jkf3s09A0M6
 6HC1Mt/4DGH5KWz67Tuh3N+k+pUlQNwSNneTjkl2zOYoLD1fBYr1SuFlTzNb1HEIcYCm
 sbR0diqnLcwP6P69NZjZc//jS8kgUQN2H6HLCd1QsdktUi7HwG032MQNk6cxl/R7lFq5
 Za30uu06g1PTb5NuZLf94vkhLk3Ovff0diAv/CdfX7m4zsXqeiKekBWnzxHsHuDYUKJv Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnbnn83er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 00:52:17 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A0l17l015487;
 Fri, 10 Feb 2023 00:52:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnbnn83e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 00:52:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319D6H3V001883;
 Fri, 10 Feb 2023 00:52:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06pt9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 00:52:14 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31A0qA0f29819356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Feb 2023 00:52:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAF3720040;
 Fri, 10 Feb 2023 00:52:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4991E20043;
 Fri, 10 Feb 2023 00:52:10 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.74.186])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Feb 2023 00:52:10 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 1/2] meson: Add missing libdw knobs
Date: Fri, 10 Feb 2023 01:52:07 +0100
Message-Id: <20230210005208.438142-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 63g9LHAWqkiXtYJ4noNAy0jZKv2TwFAg
X-Proofpoint-ORIG-GUID: fd1h22RW4Dq3OrT97EIz3TfKHi0nz9K_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_17,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100002
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add the missing meson infrastructure bits for the new libdw
dependency. Model them after the existing capstone knobs.

Fixes: 7c10cb38ccb8 ("accel/tcg: Add debuginfo support")
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 meson.build                   | 11 +++++++----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 4ba3bf34317..87bc720f912 100644
--- a/meson.build
+++ b/meson.build
@@ -1649,10 +1649,13 @@ if libbpf.found() and not cc.links('''
 endif
 
 # libdw
-libdw = dependency('libdw',
-                   method: 'pkg-config',
-                   kwargs: static_kwargs,
-                   required: false)
+libdw = not_found
+if not get_option('libdw').auto() or have_system or have_user
+    libdw = dependency('libdw',
+                       method: 'pkg-config',
+                       kwargs: static_kwargs,
+                       required: get_option('libdw'))
+endif
 
 #################
 # config-host.h #
diff --git a/meson_options.txt b/meson_options.txt
index 559a571b6b6..082ce437ba5 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -129,6 +129,8 @@ option('gio', type : 'feature', value : 'auto',
        description: 'use libgio for D-Bus support')
 option('glusterfs', type : 'feature', value : 'auto',
        description: 'Glusterfs block device driver')
+option('libdw', type : 'feature', value : 'auto',
+       description: 'debuginfo support')
 option('libiscsi', type : 'feature', value : 'auto',
        description: 'libiscsi userspace initiator')
 option('libnfs', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0f71e92dcba..e5a8897b639 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -108,6 +108,7 @@ meson_options_help() {
   printf "%s\n" '  kvm             KVM acceleration support'
   printf "%s\n" '  l2tpv3          l2tpv3 network backend support'
   printf "%s\n" '  libdaxctl       libdaxctl support'
+  printf "%s\n" '  libdw           debuginfo support'
   printf "%s\n" '  libiscsi        libiscsi userspace initiator'
   printf "%s\n" '  libnfs          libnfs block device driver'
   printf "%s\n" '  libpmem         libpmem support'
@@ -308,6 +309,8 @@ _meson_option_parse() {
     --disable-l2tpv3) printf "%s" -Dl2tpv3=disabled ;;
     --enable-libdaxctl) printf "%s" -Dlibdaxctl=enabled ;;
     --disable-libdaxctl) printf "%s" -Dlibdaxctl=disabled ;;
+    --enable-libdw) printf "%s" -Dlibdw=enabled ;;
+    --disable-libdw) printf "%s" -Dlibdw=disabled ;;
     --libdir=*) quote_sh "-Dlibdir=$2" ;;
     --libexecdir=*) quote_sh "-Dlibexecdir=$2" ;;
     --enable-libiscsi) printf "%s" -Dlibiscsi=enabled ;;
-- 
2.39.1


