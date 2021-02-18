Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886A031E450
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:24:56 +0100 (CET)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYzv-0002Z2-Kg
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCYyc-0001vf-C5; Wed, 17 Feb 2021 21:23:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCYya-00060Q-DP; Wed, 17 Feb 2021 21:23:34 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11I20j10089317; Wed, 17 Feb 2021 21:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nxlp/CX+XA+It7wGJ+ouC/k2BGPcK1XYoJzp0ATVVcQ=;
 b=gmHyAZze3zhoejUK0vZTMeh4gp7MdNHjvZOnR0Xe1pJSeKNFqpB3zohlxP63DydJ30Ii
 tTzh+r/ig1rXH/VJx8jZcSUzjK6rgEy9fMUNGHHM8l7AcxsMmhNC7VuOsegplrxBccRx
 8cjdoktQtlz7XOBMah2uLrzOKRgY5f97/sJuvI/qR91tvpliUbnpIiPxBBS8tzuYOGm7
 xKxqgE2cYzCY19QnzYYTl+5S8qaYVC1dFNLNUKZNIYSogoi7hqRi6rcLUpdaQ4Gnt+bx
 M0rr8E0bpemyMPmb7XlqABrN5np2OFVoJbzYhsvSGua/KnXYE7CyjmcQuuoT41GIN07d 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36seg1h7j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 21:23:26 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11I20oap089894;
 Wed, 17 Feb 2021 21:23:25 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36seg1h7hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 21:23:25 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11I2M74O008772;
 Thu, 18 Feb 2021 02:23:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 36p6d8a6gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 02:23:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11I2NKpt38273346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 02:23:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64E27A4051;
 Thu, 18 Feb 2021 02:23:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7851A404D;
 Thu, 18 Feb 2021 02:23:19 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Feb 2021 02:23:19 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Date: Thu, 18 Feb 2021 03:22:27 +0100
Message-Id: <20210218022227.979741-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_21:2021-02-16,
 2021-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1011 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180009
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the virtio-gpu-ccw device depends on the hw-display-virtio-gpu
module, which provides the type virtio-gpu-device, packaging the
hw-display-virtio-gpu module as a separate package that may or may not
be installed along with the qemu package leads to problems. Namely if
the hw-display-virtio-gpu is absent, qemu continues to advertise
virtio-gpu-ccw, but it aborts not only when one attempts using
virtio-gpu-ccw, but also when libvirtd's capability probing tries
to instantiate the type to introspect it.

Let us thus introduce a module named hw-s390x-virtio-gpu-ccw that
is going to provide the virtio-gpu-ccw device. The hw-s390x prefix
was chosen because it is not a portable device.

With virtio-gpu-ccw built as a module, the correct way to package a
modularized qemu is to require that hw-display-virtio-gpu must be
installed whenever the module hw-s390x-virtio-gpu-ccw.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---
 hw/s390x/meson.build | 17 ++++++++++++++++-
 util/module.c        |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 2a7818d94b..153b1309fb 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -34,7 +34,6 @@ virtio_ss.add(files('virtio-ccw.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ccw-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-ccw-blk.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-ccw-crypto.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: files('virtio-ccw-gpu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-ccw-input.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
@@ -46,3 +45,19 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'
 s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
 
 hw_arch += {'s390x': s390x_ss}
+
+if target.startswith('s390x')
+  hw_s390x_modules = {}
+
+  hw_s390x_modules_c_args = ['-DNEED_CPU_H',
+	      '-DCONFIG_TARGET="@0@-config-target.h"'.format(target)]
+  hw_s390x_modules_inc = [include_directories('../../target' / config_target['TARGET_BASE_ARCH'])]
+  hw_s390x_modules_dependencies = declare_dependency(
+	       include_directories: hw_s390x_modules_inc, compile_args: hw_s390x_modules_c_args)
+
+  virtio_gpu_ccw_ss = ss.source_set()
+  virtio_gpu_ccw_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: [files('virtio-ccw-gpu.c'), pixman, hw_s390x_modules_dependencies])
+  hw_s390x_modules += {'virtio-gpu-ccw': virtio_gpu_ccw_ss}
+
+  modules += {'hw-s390x': hw_s390x_modules}
+endif
diff --git a/util/module.c b/util/module.c
index c65060c167..cbe89fede6 100644
--- a/util/module.c
+++ b/util/module.c
@@ -304,6 +304,7 @@ static struct {
     { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
+    { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
     { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
     { "virtio-vga",            "hw-", "display-virtio-vga"    },
     { "vhost-user-vga",        "hw-", "display-virtio-vga"    },

base-commit: 1af5629673bb5c1592d993f9fb6119a62845f576
-- 
2.25.1


