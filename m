Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74A2DB87A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 02:39:13 +0100 (CET)
Received: from localhost ([::1]:52210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpLmZ-0002IH-VT
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 20:39:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpLkq-0001aW-23; Tue, 15 Dec 2020 20:37:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpLkn-0006Sd-Qh; Tue, 15 Dec 2020 20:37:23 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG1WBeo045017; Tue, 15 Dec 2020 20:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=Ju8x660/pKrGPXJZVq2CIK5klTp/EslBZp0m8fL3YJE=;
 b=LD1XF8y5xQLb+29QPk+5NFCzfV9MU/ZRV9wSgHVbH1YOpGOiANgyl6qmtOxNdr5rHYD1
 JH21tEhwbwDoBBttDaseiJvxDLwNFrRRvX3H+GpKzRTTqBK70Pm5ihgbxJdvSO380vRH
 Uwz/oe0tBce3fXtZDdZQnEa/KvT/MIi8OBlioGIK8hWVsuJW+b/tJtuccrEa7hCGMwXx
 R1B7TevtCfJ2+QyEA/4DvvVxD7UWQxrIXWULplMOSlk2mMYPNfm97RREU8+LY5sz5/Kp
 X1jzKglsZN6rG/tDm6u7pRyxKeNv7b4BTYizNtugI7iM3kDClm8IxFkz56tBv4xnc5H9 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35f547wa81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 20:37:14 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG1WUmt045856;
 Tue, 15 Dec 2020 20:37:14 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35f547wa7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 20:37:13 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG1S1x2006806;
 Wed, 16 Dec 2020 01:37:12 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 35cng9c1x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 01:37:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG1bChF28180880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 01:37:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51208AE062;
 Wed, 16 Dec 2020 01:37:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1031AE05C;
 Wed, 16 Dec 2020 01:37:08 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.201.212])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 01:37:08 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH] configure: Fail when specified cross compiler cannot be found
Date: Tue, 15 Dec 2020 22:36:46 -0300
Message-Id: <20201216013646.40799-1-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_13:2020-12-15,
 2020-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160002
Received-SPF: pass client-ip=148.163.156.1; envelope-from=gromero@linux.ibm.com;
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
Cc: gustavo.romero@protonmail.com, gromero@linux.ibm.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently if the cross compiler passed to 'configure' (--cross-cc-<arch>) does
not exist no error happens and only later when the TCG tests are run they fail
because the cross compiler is not set correctly.

This commit changes that behavior and make 'configure' fail if the specified
cross compiler cannot be found, displaying an error similar to the following:

$ ../configure --target-list=ppc64-softmmu --cross-cc-ppc64=nonexisting_gcc
Specified cross-compiler 'nonexisting_gcc' not found!

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 configure              | 2 +-
 tests/tcg/configure.sh | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index cb21108d34..c0389f5839 100755
--- a/configure
+++ b/configure
@@ -6854,7 +6854,7 @@ done
   export $i
 done
 export target_list source_path use_containers
-$source_path/tests/tcg/configure.sh)
+$source_path/tests/tcg/configure.sh) || exit 1
 
 # temporary config to build submodules
 for rom in seabios; do
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index e1b70e25f2..6c89d75c38 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -212,8 +212,10 @@ for target in $target_list; do
 
     eval "target_compiler=\${cross_cc_$i}"
     if ! has $target_compiler; then
-      continue
+      echo "Specified cross-compiler '$target_compiler' not found!"
+      exit 1
     fi
+
     write_c_skeleton
     if ! do_compiler "$target_compiler" $target_compiler_cflags -o $TMPE $TMPC -static ; then
       # For host systems we might get away with building without -static
-- 
2.17.1


