Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04282592E5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 17:18:49 +0200 (CEST)
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD83c-0006s1-PI
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 11:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1kD7m2-00036V-6K
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:00:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1kD7lw-0002OG-15
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:00:37 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 081EWfZV068395
 for <qemu-devel@nongnu.org>; Tue, 1 Sep 2020 11:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JMdlm/IFFF44VzhHViyoUd8R/KXtjNIXetPvglq5B8k=;
 b=BHY9MFvamAhPSxPCdWmJw/4Dwey+IvdEJtyA2zXsNxAHEFV/LZxe1boyZcaA9+C4HJQI
 quoy/LfQOQRJVOKqLwMTge8qBPfJ/uiOX+PyzU5wIO0GKghLFeAeouoA7vjDXRNus1Ol
 F+7EvcK1MAN0T+DAfl1kfQZ9AXHC3hhLl9vj+9V4HQUpX1hBUC8F/WKE+f8jdi6jWD/M
 v05wmQvgPMQ+HqIEmAtrQL8itLJJmbGHvJLyjbYcDeZEe9NsabVgLssrzheEXKHgjVTc
 lteoqWcSncrqLKXO3HgTieSF502rZN2CQzZn9Bq8CQ1Ta836IIIqhGDP9VS8EpN67yqk vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339nc5qdxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 11:00:28 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 081EWlRn068823
 for <qemu-devel@nongnu.org>; Tue, 1 Sep 2020 11:00:28 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339nc5qdvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 11:00:28 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 081ExEAP029194;
 Tue, 1 Sep 2020 15:00:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 337e9gujfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 15:00:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 081EwqCm52429216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 14:58:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 428584C070;
 Tue,  1 Sep 2020 15:00:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE6CF4C098;
 Tue,  1 Sep 2020 15:00:21 +0000 (GMT)
Received: from marcibm.ibmuc.com (unknown [9.145.15.189])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 15:00:21 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] Enable virtio-fs on s390x
Date: Tue,  1 Sep 2020 17:00:17 +0200
Message-Id: <20200901150019.29229-1-mhartmay@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_08:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010122
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mhartmay@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 09:02:31
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series is about enabling virtio-fs on s390x. For that we need
 + some shim code (first patch), and we need
 + libvhost-user to deal with virtio endiannes for non-legacy virtio
   devices as mandated by the spec.

How to use?

For general instructions how to use virtio-fs (on x86) please have a
look at https://virtio-fs.gitlab.io/howto-qemu.html. Most of the
instructions can also be applied on s390x.

In short:

1. Install self-compiled QEMU with this patch series applied
2. Prepare host and guest kernel so they support virtio-fs

Start virtiofsd on the host

 $ virtiofsd -f --socket-path=/tmp/vhostqemu -o source=/tmp/shared

Now you can start QEMU in a separate shell on the host:

 $ qemu-system-s390x -machine type=s390-ccw-virtio,accel=kvm,memory-backend=mem \
   -object memory-backend-file,id=mem,size=2G,mem-path=/dev/shm/virtiofs,share=on,prealloc=on,prealloc-threads=1 \
   -chardev socket,id=char0,path=/tmp/vhostqemu -device vhost-user-fs-ccw,queue-size=1024,chardev=char0,tag=myfs \
   -drive if=virtio,file=disk.qcow2 \
   -m 2G -smp 2 -nographic

Log into the guest and mount it

 $ mount -t virtiofs myfs /mnt

Changelog:
 v1 -> v2:
 - rebased
 - patch 1:
   + changed to Meson build. I kept the r-b from Conny since this
     change seems to be straightforward to me.
 - patch 2:
   + added r-b from Michael
   + added comment from Conny
 RFC v2 -> v1:
 - patch 1:
  + Added `force_revision_1 = true` (Conny)
  + I didn't add the r-b from Stefan Hajnoczi as I've added the
    changes suggested by Conny
 - squashed patches 2 and 3:
  + removed assertion in performance critical code path (Stefan)
  + dropped all dead code (Stefan)
  + removed libvhost-access.h

 RFC v1 -> RFC v2:
  + rebased
  + drop patch "libvhost-user: print invalid address on vu_panic" as it's not related to this series
  + drop patch "[RFC 4/4] HACK: Hard-code the libvhost-user.o-cflags for s390x"
  + patch "virtio: add vhost-user-fs-ccw device": replace qdev_set_parent_bus and object_property_set_bool by qdev_realize
  + patch "libvhost-user: handle endianness as mandated by the spec":
    Drop support for legacy virtio devices
  + add patch to fence legacy virtio devices

Halil Pasic (1):
  virtio: add vhost-user-fs-ccw device

Marc Hartmayer (1):
  libvhost-user: handle endianness as mandated by the spec

 contrib/libvhost-user/libvhost-user.c | 77 +++++++++++++++------------
 hw/s390x/meson.build                  |  1 +
 hw/s390x/vhost-user-fs-ccw.c          | 75 ++++++++++++++++++++++++++
 3 files changed, 119 insertions(+), 34 deletions(-)
 create mode 100644 hw/s390x/vhost-user-fs-ccw.c

-- 
2.25.4


