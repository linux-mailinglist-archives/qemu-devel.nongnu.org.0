Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE26F32CAA7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 04:01:09 +0100 (CET)
Received: from localhost ([::1]:48524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHeEe-0004WB-9v
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 22:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lHeDN-00044p-EP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:59:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30542
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lHeDL-0002Fz-R6
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:59:49 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1242XMP1093813
 for <qemu-devel@nongnu.org>; Wed, 3 Mar 2021 21:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=egdU4wsQKB9imTGoYchmRWi/SH/HYGhtdjY/GCDQ/Mc=;
 b=DeXnDRUDinME1zS+nSCRJn1BVH13pYP3oV2QKQ4YNI4zqPcPDe1JDpMm9XpUhdXMt2TB
 +gjy12mddFKu+ZOis94nKbM3VhHOpUVbL+f8ig2GRAWRhcMM4RKKXCff2Mx/64crodlu
 qF4MwL8c768AIoG848Bnrhg+Bqx69rensltTOKjftZMz5/eYJDPpA85a3UZLI0flAIkO
 8xWQVyNvhyeg8rSbLgpAMW1VPd7mFWD6qyunCD04f7AX0f+11JwK0X106yvprztg7Q9t
 CKcReRR4fxjKut3adzB5/Dy+fNJEwX+9hpxkSr+Lt2Ptfv8nd8RVNp2eeCt3aTRDdX38 Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 372met3qa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 21:59:44 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1242e2kZ118912
 for <qemu-devel@nongnu.org>; Wed, 3 Mar 2021 21:59:43 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 372met3q9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 21:59:43 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1242mHHg026670;
 Thu, 4 Mar 2021 02:59:43 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 3711dx494g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 02:59:43 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1242xgf038011166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Mar 2021 02:59:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30B5B6A05A;
 Thu,  4 Mar 2021 02:59:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC2EC6A054;
 Thu,  4 Mar 2021 02:59:41 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  4 Mar 2021 02:59:41 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Stop if cfi is enabled with system slirp
Date: Wed,  3 Mar 2021 21:59:38 -0500
Message-Id: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_07:2021-03-03,
 2021-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 mlxlogscore=986 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040008
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
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For CFI, we need to compile slirp as a static library together with qemu.
This is because we register slirp functions as callbacks for QEMU Timers.
When using a system-wide shared libslirp, the type information for the
callback is missing and the timer call produces a false positive with CFI.

With this patch, meson will stop if CFI is enabled with system-wide slirp

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
---
 meson.build | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meson.build b/meson.build
index f3db83e974..e1ec5020ac 100644
--- a/meson.build
+++ b/meson.build
@@ -1569,6 +1569,18 @@ if have_system
   endif
 endif
 
+# For CFI, we need to compile slirp as a static library together with qemu.
+# This is because we register slirp functions as callbacks for QEMU Timers.
+# When using a system-wide shared libslirp, the type information for the
+# callback is missing and the timer call produces a false positive with CFI.
+#
+# Now that slirp_opt has been defined, check if the selected slirp is compatible
+# with control-flow integrity.
+if get_option('cfi') and slirp_opt == 'system'
+  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
+         + ' Please configure with --enable-slirp=git')
+endif
+
 fdt = not_found
 fdt_opt = get_option('fdt')
 if have_system
-- 
2.30.0


