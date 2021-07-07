Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C013F3BE2A3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 07:37:08 +0200 (CEST)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m10F9-0005dI-BZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 01:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1m10EJ-0004qq-GH; Wed, 07 Jul 2021 01:36:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63178
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1m10EH-0008Gu-KE; Wed, 07 Jul 2021 01:36:15 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1675XHf1111547; Wed, 7 Jul 2021 01:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9+FCpnGMUJoIm/lOUxvI4t1xXG1RmHO62s5kKN4BEs4=;
 b=LDONy13I1dj96XodQBlGXubgWDSs2xTWIpK9eA3jg55MqCVKEXZ5gCu5Mc3zrJT25eXu
 U5dB8LPh8PT2EqLLw7jqb/W2cqvIG9ypDMT/DTntpFboxQ86R7ocvXYwiidTXEogzEW8
 E15mpMIV9vluNSeFMtUFvIEN54MxOJh8Mn8cwxaYselQL/Ejkybja6k9lj1wT+nQw0+x
 YSOhre8URKpK2+FJMyuDGUIRz+YXhbYlV7iBNt80aPzNYXU3Golf2tkXIMzXQQ4jc0Od
 VtHAPXwImDlwGMTPjsQIkWPszm10UtbGLQnjQ0biIo9bzC8MFuIUUptTOgyAwDaTElRi oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39mbkeq7xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 01:36:09 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1675XKF7111638;
 Wed, 7 Jul 2021 01:36:08 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39mbkeq7xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 01:36:08 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1675Xtvj031267;
 Wed, 7 Jul 2021 05:36:08 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 39jhpyhwq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 05:36:08 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1675a53s46465470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Jul 2021 05:36:05 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28D946E05B;
 Wed,  7 Jul 2021 05:36:05 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE4116E050;
 Wed,  7 Jul 2021 05:36:02 +0000 (GMT)
Received: from ceph-oro.sl.cloud9.ibm.com (unknown [9.148.245.63])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  7 Jul 2021 05:36:02 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] block/raw-format: implement .bdrv_get_specific_info handler
Date: Wed,  7 Jul 2021 08:35:43 +0300
Message-Id: <20210707053543.2521677-1-oro@il.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RLbp7zVR5hZbAehCMCAeKPb6cULOuNWh
X-Proofpoint-ORIG-GUID: ERqFB8vMNu_zwFZQeamv553rNRMi2u2L
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_01:2021-07-06,
 2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=695 phishscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070029
Received-SPF: pass client-ip=148.163.158.5; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 dannyh@il.ibm.com, oro@il.ibm.com, idryomov@gmail.com, to.my.trociny@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the raw format, allow exposing specific info by the underlying storage.
In particular, this will enable RBD images using the raw format to indicate
a LUKS2 encrypted image in the output of qemu-img info.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
---
 block/raw-format.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 7717578ed6..f6e70e2356 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -369,6 +369,12 @@ static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     return bdrv_get_info(bs->file->bs, bdi);
 }
 
+static ImageInfoSpecific *raw_get_specific_info(BlockDriverState *bs,
+                                                Error **errp)
+{
+    return bdrv_get_specific_info(bs->file->bs, errp);
+}
+
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     if (bs->probed) {
@@ -603,6 +609,7 @@ BlockDriver bdrv_raw = {
     .has_variable_length  = true,
     .bdrv_measure         = &raw_measure,
     .bdrv_get_info        = &raw_get_info,
+    .bdrv_get_specific_info = &raw_get_specific_info,
     .bdrv_refresh_limits  = &raw_refresh_limits,
     .bdrv_probe_blocksizes = &raw_probe_blocksizes,
     .bdrv_probe_geometry  = &raw_probe_geometry,
-- 
2.27.0


