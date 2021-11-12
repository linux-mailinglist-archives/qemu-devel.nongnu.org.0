Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAE644E961
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:01:28 +0100 (CET)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlY3S-0002su-Ew
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:01:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0Q-0000BY-7I; Fri, 12 Nov 2021 09:58:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63990
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1mlY0O-0005jk-Hm; Fri, 12 Nov 2021 09:58:17 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ACCmEAA012710; 
 Fri, 12 Nov 2021 14:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2va5n/0kfY9ejvkzijyyeNweWfFYFTod80uEq44Q3jo=;
 b=PbWQZqIY1pjp3R4jHuAaUTh3K3Ft/1r8/BPYAqoazA05OzcMngGkQ2hOi9RsxaBlwrgi
 vjo8Otu9ft3Xg1d/+x7riRfaG0aSAq99doZmx7yoNnmlNtpWOETzMNq3B9NhNFX4gGgx
 8/jWZ7UwhqH2La3qCupPCVGRIDi44ZyLVzivTRfRbojkLosaUtTYGagF/iykftFsO04Q
 z2uKzJtsH2M+ZUFRO3bc6fr+1CdrqjaddLFn17YPs2XMBKTizBcdf7NCuie/pv3xtKDR
 azco+JS5s4I+srQCN1fQOQi6JfqqXQJoBDjrDtVHYNaohyAjvCicWD+4eU8jlH3xHUbb 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9rkk2w99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:13 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ACEu9Mi027545;
 Fri, 12 Nov 2021 14:58:12 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c9rkk2w8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ACErKtq026387;
 Fri, 12 Nov 2021 14:58:11 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3c5hbb9b3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 14:58:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ACEw7Ri64356702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Nov 2021 14:58:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9006A4060;
 Fri, 12 Nov 2021 14:58:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EDA8A405C;
 Fri, 12 Nov 2021 14:58:07 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Nov 2021 14:58:07 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/5] virtio: early detect 'modern' virtio
Date: Fri, 12 Nov 2021 15:57:44 +0100
Message-Id: <20211112145749.618157-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SX8i4Xnk_N2AmCqEv4sCDR02wWgbP3kc
X-Proofpoint-ORIG-GUID: 82hJN4jSfNd_0eKYxy7zikt-V6ZK9wMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111120083
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

This is an early RFC for a transport specific early detecton of
modern virtio, which is most relevant for transitional devices on big
endian platforms, when drivers access the config space before
FEATURES_OK is set.

The most important part that is missing here is fixing all the problems
that arise in the situation described in the previous paragraph, when
the config is managed by a vhost device (and thus outside QEMU. This
series tackles this problem only for virtio_net+vhost as an example. If
this approach is deemed good, we need to do something very similar for
every single affected device.

This series was only lightly tested. The vhost stuff is entirely
untested, unfortunately I don't have a working setup where this
handling would be needed (because the config space is handled in the
device). DPDK is not supported on s390x so at the moment I can't test
DPDK based setups. 

v1 -> v2:

* add callback
* tweak feature manipulation
* add generic handling for vhost that needs to be called by devices
* add handling for virtio

Halil Pasic (5):
  virtio: introduce virtio_force_modern()
  virtio-ccw: use virtio_force_modern()
  virtio-pci: use virtio_force_modern()
  vhost: push features to backend on force_modern
  virtio-net: handle force_modern for vhost

 hw/net/virtio-net.c        | 20 ++++++++++++++++++++
 hw/s390x/virtio-ccw.c      |  3 +++
 hw/virtio/vhost.c          | 17 +++++++++++++++++
 hw/virtio/virtio-pci.c     |  1 +
 hw/virtio/virtio.c         | 13 +++++++++++++
 include/hw/virtio/vhost.h  |  2 ++
 include/hw/virtio/virtio.h |  2 ++
 7 files changed, 58 insertions(+)


base-commit: 2c3e83f92d93fbab071b8a96b8ab769b01902475
-- 
2.25.1


