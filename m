Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4206AE339
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:49:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYcG-00087F-Lf; Tue, 07 Mar 2023 09:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pZYcB-00082x-PR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:32 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pZYc8-0002dS-GB
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:48:31 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327DZ3pg017427; Tue, 7 Mar 2023 14:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Lx/VMofsjBbfIzxtevFtX6eHP8kNJ3gUTIveQ5BcPmQ=;
 b=WKaDGs2vN5KFfKdlcc36FyWdRE+sO9iJ77udZRPiQk3Kx5/uiwf+0Cj7EzE2dR7FEAN1
 gpitNnhnew8CLiXkkkQklhyl68WADWd5dOXBgASx55fYhbyyknqXNXzJwveN1Ta+p7m/
 QopVSwkS/YQYKCbC9a0tqLjCjzY8lElG1SFTWME2feuKUq3yFQAzg/sb7fBNZ/H+9Zhp
 tJq0Xr5CUTjF4g6Q2wr9a2NCgzczTCC5tPOZWcLwRtg9LkPu4lHPKR8DzWasAhEhah6t
 hRGRlq3zDuvkftA84j5CAEyFCJLy3dzPK63x3JRnanMAr3dk1vVRjxZoIpf2qMfNSBRw zg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p41878c5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 14:48:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 327EmPaT006902
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Mar 2023 14:48:25 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 7 Mar 2023 06:48:22 -0800
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <quintela@redhat.com>, <bcain@quicinc.com>, <dgilbert@redhat.com>,
 <ling1.xu@intel.com>, <zhou.zhao@intel.com>, <jun.i.jin@intel.com>
Subject: [PATCH 1/2] migration/xbzrle: use ctz64 to avoid undefined result
Date: Tue, 7 Mar 2023 11:48:08 -0300
Message-ID: <a3b0054bd1ab8b3d741c02a6cbda30cae0a70d5d.1678199971.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1678199971.git.quic_mathbern@quicinc.com>
References: <cover.1678199971.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MlHGXDBDwG4MlXl4WpBSQQJe620JPljX
X-Proofpoint-ORIG-GUID: MlHGXDBDwG4MlXl4WpBSQQJe620JPljX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_08,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=849 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070132
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
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

__builtin_ctzll() produces undefined results when the argument is 0.
This can be seen through test-xbzrle, which produces the following
warning:

../migration/xbzrle.c:265: runtime error: passing zero to ctz(), which is not a valid argument

Replace __builtin_ctzll() with our ctz64() wrapper which properly
handles 0.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 migration/xbzrle.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/xbzrle.c b/migration/xbzrle.c
index 05366e86c0..21b92d4eae 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -12,6 +12,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "qemu/host-utils.h"
 #include "xbzrle.h"
 
 /*
@@ -233,7 +234,7 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
                     break;
                 }
                 never_same = false;
-                num = __builtin_ctzll(~comp);
+                num = ctz64(~comp);
                 num = (num < bytes_to_check) ? num : bytes_to_check;
                 zrun_len += num;
                 bytes_to_check -= num;
@@ -262,7 +263,7 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
                 nzrun_len += 64;
                 break;
             }
-            num = __builtin_ctzll(comp);
+            num = ctz64(comp);
             num = (num < bytes_to_check) ? num : bytes_to_check;
             nzrun_len += num;
             bytes_to_check -= num;
-- 
2.39.1


