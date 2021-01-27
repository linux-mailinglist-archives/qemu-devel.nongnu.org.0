Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A36304E5A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 02:13:31 +0100 (CET)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ZOk-0004eD-Tk
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 20:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1l4ZLN-0003gw-K1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 20:10:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1l4ZLL-0000zJ-Rl
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 20:10:01 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10R11J58140040
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 20:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MIeGQWsHmZ7qNxtKbZuPwFFPcFMSi+dEBXH838upEpQ=;
 b=Zn3/JBkhORoMk5hQqikHCqEJLil6CSSCMq0+AJDMYZEesPvXrrwkbMxxtZNU4s5d/DAA
 kcp/CKD8h+AYbqoTjy0GNHuz7xcT2ofqilm0OB3Lo1eHWjdauqSgizVlxurJBVknBpQ1
 GKwnkygFbTaUNQcGVW+jPGwMT45cp8px1OQO/Axeej3So3gF7tgiu3nXVEadklekQi4S
 SyGTVM8NZe3pLfKIE3grwxfeZTek3HGGyapm/1nsL8U9QoxhgiVTT2oWDQJal0CNLq1J
 vhwQ6+1r6PsKctbR5yq7pFapJxrBjCXEi/f00FUnT6IqMGn/MYLNujFGPl1QKAnEiNip Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36apmr3kth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 20:09:56 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10R11cWA141086
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 20:09:56 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36apmr3ktc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 20:09:56 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10R11krB011600;
 Wed, 27 Jan 2021 01:09:55 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 36a0t2j7hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 01:09:55 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10R19sdj26149316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 01:09:54 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD8D26A04F;
 Wed, 27 Jan 2021 01:09:54 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FAEF6A047;
 Wed, 27 Jan 2021 01:09:54 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.13.166])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 01:09:53 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] tests/acceptance/boot_linux: Switch to Fedora 32
Date: Tue, 26 Jan 2021 20:09:46 -0500
Message-Id: <20210127010946.17370-2-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127010946.17370-1-dbuono@linux.vnet.ibm.com>
References: <20210127010946.17370-1-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_11:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=929 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101270000
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, dbuono@linux.vnet.ibm.com,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some acceptance test require a full VM image.
The tests were using Fedora 31, which is now EOL.
Probably as a consequence, the Avocado framework is not
able to download such images anymore.

Switch to Fedora 32, which is still supported.

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
---
 tests/acceptance/boot_linux.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 1da4a53d6a..b954f95f0b 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -48,7 +48,7 @@ class BootLinuxBase(Test):
             image_arch = 'ppc64le'
         try:
             boot = vmimage.get(
-                'fedora', arch=image_arch, version='31',
+                'fedora', arch=image_arch, version='32',
                 checksum=self.chksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
@@ -111,7 +111,7 @@ class BootLinuxX8664(BootLinux):
     :avocado: tags=arch:x86_64
     """
 
-    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
+    chksum = '423a4ce32fa32c50c11e3d3ff392db97a762533b81bef9d00599de518a7469c8'
 
     def test_pc_i440fx_tcg(self):
         """
@@ -160,8 +160,7 @@ class BootLinuxAarch64(BootLinux):
     :avocado: tags=machine:virt
     :avocado: tags=machine:gic-version=2
     """
-
-    chksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
+    chksum = 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967'
 
     def add_common_args(self):
         self.vm.add_args('-bios',
@@ -217,7 +216,7 @@ class BootLinuxPPC64(BootLinux):
     :avocado: tags=arch:ppc64
     """
 
-    chksum = '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'
+    chksum = 'dd989a078d641713c55720ba3e4320b204ade6954e2bfe4570c8058dc36e2e5d'
 
     def test_pseries_tcg(self):
         """
@@ -235,7 +234,7 @@ class BootLinuxS390X(BootLinux):
     :avocado: tags=arch:s390x
     """
 
-    chksum = '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'
+    chksum = '93e49b98fa016797a6864a95cbb7beaec86ffd61dbcd42a951158ae732dae1ec'
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390_ccw_virtio_tcg(self):
-- 
2.30.0


