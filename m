Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D543F248
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 00:05:55 +0200 (CEST)
Received: from localhost ([::1]:56544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDWz-0000f4-Ic
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 18:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mgDS4-0005ZR-1Z; Thu, 28 Oct 2021 18:00:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30862
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mgDRv-0007Wb-SV; Thu, 28 Oct 2021 18:00:47 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SJwwRR022717; 
 Thu, 28 Oct 2021 22:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=FpvGrAGMOgTguEmmt89raQyiIKcn037e2C5uTubaGMg=;
 b=EjrOWD50f4yGJye4XEBKWq9rSZijkmJUOv3Tyzyq/rGVoSbF4HSQHxYOYx6/8e1BfHbd
 FtxopPf+MNFHcRHds572U29EYufO6MhxeOY2eWJC1iJoEDKUt/ySC3j0CGANA5uHPdUh
 E3n2BqBi/6fYdp6Cmnd5+PPXVUzkTOwYv4AMgcuUZ94g7NL4Q/DrWqVI7659MySlh4JF
 zH549kNBOdDNG2iHznGAp312cVPeLH5Rmla5Jrwh8fwPJ611ToQ8jqRqwB8BL4XG1YEt
 20XbYqcMuMD2mLDDVQChaGX7kcHgoH2XbS3S1wT54LeTFsifk/dQV8yLbsrKW8gOUh6m rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c02dwjhpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 22:00:34 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19SM0XZD016329;
 Thu, 28 Oct 2021 22:00:33 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c02dwjhp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 22:00:33 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19SLwjHT004641;
 Thu, 28 Oct 2021 22:00:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3bx4etn2td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 22:00:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19SM0RUU64029064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 22:00:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3BCEA406F;
 Thu, 28 Oct 2021 22:00:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B9E4A4066;
 Thu, 28 Oct 2021 22:00:26 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Oct 2021 22:00:26 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v1 0/3]  virtio: early detect 'modern' virtio
Date: Fri, 29 Oct 2021 00:00:14 +0200
Message-Id: <20211028220017.930806-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Qebxi26NHgz8HDNUC_Zk1uOqYCwnMC9_
X-Proofpoint-ORIG-GUID: J6VOJltWYAvZ3o35HaOxAeLShqIhriVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280112
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an early RFC for a transport specific early detecton of
modern virtio, which is most relevant for transitional devices on big
endian platforms, when drivers access the config space before
FEATURES_OK is set.

The most important part that is missing here is fixing the problems that
arrise in the situation described in the previous paragraph, when the
config is managed by a vhost device (and thus outside QEMU).

This series was only lightly tested. 

Halil Pasic (3):
  virtio: introduce virtio_force_modern()
  virtio-ccw: use virtio_force_modern
  virtio-pci: use virtio_force_modern()

 hw/s390x/virtio-ccw.c      |  3 +++
 hw/virtio/virtio-pci.c     |  1 +
 hw/virtio/virtio.c         | 12 ++++++++++++
 include/hw/virtio/virtio.h |  1 +
 4 files changed, 17 insertions(+)


base-commit: 2c3e83f92d93fbab071b8a96b8ab769b01902475
-- 
2.25.1


