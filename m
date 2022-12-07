Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66067645564
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 09:25:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2pii-0003cM-Ju; Wed, 07 Dec 2022 03:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p2piT-0003bo-Ge
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:23:50 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p2piR-0005GY-MD
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:23:45 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B788BTn008425
 for <qemu-devel@nongnu.org>; Wed, 7 Dec 2022 08:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=4SiHQwb8OXgABYBF3qVdkQOmf3Tkt97Bln2wFocbnZE=;
 b=F1kUUUhdEuv9Fnlv/WhX0EGzliujuOFqExR4QbPxSHpd6fpWDW3udZ7VcIszoJw1g40x
 HumSUEUzt09ER21dsEzXgVgkhaCwU5yXxu88XK8txIw7+ZKFVpGky0dTNFJ7t59JWBbh
 GTNS0XRcSNoF/vcaxnHQxrhcu0QR8t9Aueb/UvlwUxfaD1fdJylpCVKjBcZnSpftrAzC
 y5UJx6CdcLeYLaDu8ssz3gSZTp9/NMHjEfifbNTLoQ0dkRiJnCF97kKMnEem/93qSKrW
 nJAYUEjwc1/FU3wXtp5qfyjuna+ihqwMHVbpTeAhWAOsqosfBZp7vofDc2KJZj2Jcsm8 tQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3macsys6yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 08:23:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B78NbG5020790
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 7 Dec 2022 08:23:37 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 7 Dec 2022 00:23:35 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, <bcain@quicinc.com>, <quic_mathbern@quicinc.com>
CC: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [PATCH] configure: Fix check-tcg not executing any tests
Date: Wed, 7 Dec 2022 13:53:09 +0530
Message-ID: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sXkksAAs1RRiM0arhU5g6z_fv8zAmpXh
X-Proofpoint-ORIG-GUID: sXkksAAs1RRiM0arhU5g6z_fv8zAmpXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 clxscore=1011 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070069
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

After configuring with --target-list=hexagon-linux-user
running `make check-tcg` just prints the following:

```
make: Nothing to be done for 'check-tcg'
```

In the probe_target_compiler function, the 'break'
command is used incorrectly. There are no lexically
enclosing loops associated with that break command which
is an unspecfied behaviour in the POSIX standard.

The dash shell implementation aborts the currently executing
loop, in this case, causing the rest of the logic for the loop
in line 2490 to be skipped, which means no Makefiles are
generated for the tcg target tests.

Fixes: c3b570b5a9a24d25 (configure: don't enable
cross compilers unless in target_list)

Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 26c7bc5154..7a804fb657 100755
--- a/configure
+++ b/configure
@@ -1881,9 +1881,7 @@ probe_target_compiler() {
   # We shall skip configuring the target compiler if the user didn't
   # bother enabling an appropriate guest. This avoids building
   # extraneous firmware images and tests.
-  if test "${target_list#*$1}" != "$1"; then
-      break;
-  else
+  if test "${target_list#*$1}" = "$1"; then
       return 1
   fi
 
-- 
2.17.1


