Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A811644E963
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:01:38 +0100 (CET)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlY3d-00038l-Oa
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:01:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0b-0000L6-Hv; Fri, 12 Nov 2021 09:58:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48176
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0Y-0005kE-QI; Fri, 12 Nov 2021 09:58:29 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ACEfEsf021400; 
 Fri, 12 Nov 2021 14:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JQeFMVaD6s2RpuiTGyeQT2YhwCE+unHut0t6RqQu0LY=;
 b=FAl2ntR/qPiMdd7e2JaRniUH0S0y7SGPn6yx9tCDW+YpWjoDu+B3yp0gQElOFtRScqwe
 GNmmpkNEp9M9XTy2Gklv+VbxJsxMzt07zlT6XFHSRVb6IAtkOzBJJbbzOV6CvsPeW77n
 S0Vq0am5M3CVsqlBAGepwMG3QDm4xtN9yYj68W+FNNux3o+lSW8JZjOzv16+Vsqb1vby
 ZSlyER4S4TMhxTKR4yYSu85y8WSry12nPk3vfqvCwyORlDtjNIvO/dHBm3/B43F0RWMI
 BShE3W+BNhtZ2TPMsklbhMDhgsIHGm435gA5gRNgWnn42WogV9fmOPicAobAdFTmtrA2 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9s7thn8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:16 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ACEhBVE025930;
 Fri, 12 Nov 2021 14:58:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9s7thn81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ACEqLsI018718;
 Fri, 12 Nov 2021 14:58:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3c5gykhexe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:13 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ACEwBHK56426804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Nov 2021 14:58:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7D11A4054;
 Fri, 12 Nov 2021 14:58:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FEA5A4069;
 Fri, 12 Nov 2021 14:58:10 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Nov 2021 14:58:10 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/5] virtio-ccw: use virtio_force_modern()
Date: Fri, 12 Nov 2021 15:57:46 +0100
Message-Id: <20211112145749.618157-3-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112145749.618157-1-pasic@linux.ibm.com>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vWP9w_Hdp6AUxaRroKybwTEObZNT-Oz4
X-Proofpoint-GUID: CQCK0Wq70FtnVGW_mGA-pkwy3G8goONS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111120083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fact that revision > 0 was negotiated implies that VIRTIO_VERSION_1
aka modern must be used. This negotiation is done before the obligatory
reset. Let us call virtio_force_modern() after the reset if revision > 0
was negotiated, so that the VIRTIO_VERSION_1 feature can be set, and
endianness starts working as it should for devices that comply to the
virtio spec.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---
 hw/s390x/virtio-ccw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 6a2df1c1e9..88fbe87942 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -266,6 +266,9 @@ static void virtio_ccw_reset_virtio(VirtioCcwDevice *dev, VirtIODevice *vdev)
         dev->summary_indicator = NULL;
     }
     ccw_dev->sch->thinint_active = false;
+    if (dev->revision > 0) {
+        virtio_force_modern(vdev);
+    }
 }
 
 static int virtio_ccw_handle_set_vq(SubchDev *sch, CCW1 ccw, bool check_len,
-- 
2.25.1


