Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DDE681E72
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMd0e-0004Xg-8z; Mon, 30 Jan 2023 17:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pMd0b-0004XP-KM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:52:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pMd0Z-0001dZ-Lx
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:52:17 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UMdHvo011161; Mon, 30 Jan 2023 22:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0Q54aQgdmhIvgR2VYqM2acxsOIKkn7rWEMtf+RmMPRo=;
 b=ZzwH6uvzBDMGs3aahxlARAMQgn/n0kWk7ay1mwQ6toFID9D8S3oN/h6jZNhyYof2TLlm
 +yiPpO4zgxs2+E2el2sPakoZeKaVzWQuisjfv+0jY/MdPvsV5Nn4Iw9QK5SDwCp6JjjD
 eIpOpsJj5akLC08pgMCrTzZv4BAFf1PgOaoZtwq3EVwxwf76uWpgdNKiQ+jT8S16AswK
 v7Pm+7t42f2Q8TfvVM2k6ov5YA9BiVVHzhginB6mrKkeRyAsIdCbkkRmhIeP6deHcIIb
 Vk1I6Wm+b705zKTv3SywN7oDkPsN8yb7ISw+TTzsFeFLzjfKwuE9doirnKLnqD89Frs7 Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nepfn8kr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 22:52:12 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UMfpKF017968;
 Mon, 30 Jan 2023 22:52:12 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nepfn8kq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 22:52:12 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UK43u4020044;
 Mon, 30 Jan 2023 22:52:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ncvughyv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 22:52:09 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30UMq6f734472366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Jan 2023 22:52:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F06ED20043;
 Mon, 30 Jan 2023 22:52:05 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E88D20040;
 Mon, 30 Jan 2023 22:52:05 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.23.4])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 30 Jan 2023 22:52:05 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] meson: Add missing libdw knobs
Date: Mon, 30 Jan 2023 23:52:04 +0100
Message-Id: <20230130225204.1763364-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z666dHhNFJpNZBAWV3hVWxp18M-87ACc
X-Proofpoint-ORIG-GUID: BOCt7_wfsJbgO2xzLheXWZ2siINAsrWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300206
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
---
 meson.build                   | 11 +++++++----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 6d3b6656297..ade489a3b20 100644
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


