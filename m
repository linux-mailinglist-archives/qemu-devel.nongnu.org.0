Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FD533D3DA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:30:16 +0100 (CET)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8pz-0006bX-1Q
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lM8nD-0004VH-C4; Tue, 16 Mar 2021 08:27:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lM8nB-0007TR-0x; Tue, 16 Mar 2021 08:27:23 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GC3pIj067834; Tue, 16 Mar 2021 08:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AcImj2OmZjDTFJ3JTUMT0/JAfum/Lw+sAOy2CBntRDo=;
 b=Zp/U43aIbcOhJdLfscFQjxkudF0/a8WHiIt/pLgPcj6dAAlkAA/GPE5u89qfkiOjTvbY
 er6UGwnqLrKs7pqjpL6qKspXLzkQ0nPdpJnz1QkkKl8t2VnK2Kr57pr4IpaT4lpexHCr
 8E21aY0u+JW4c62sIflKarLwy2+jp154D0v1TuzhCNWYXblBeJbDEnxwwqa0gVMtDF9N
 04oF9GBnFzuSz0wHiBWvsnkkrlWO8ZX/O+5Mm/XHhblypvtF5z1+rgDmfS+HVWva+Nw9
 4F7RyKa8LnQRlkCrQiDmjHwZHJUAmzfBzPrYtow2SaBmCwnbiY8yoYL4w79HJBkChsxD OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37arhwqqu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 08:27:06 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12GC4JJe071214;
 Tue, 16 Mar 2021 08:27:05 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37arhwqqth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 08:27:05 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12GCQsvY016005;
 Tue, 16 Mar 2021 12:27:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 378n18ju1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 12:27:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12GCR0Uv39518468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 12:27:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29C43A4040;
 Tue, 16 Mar 2021 12:27:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7042CA4055;
 Tue, 16 Mar 2021 12:26:59 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Mar 2021 12:26:59 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] hw/s390x: modularize virtio-gpu-ccw
Date: Tue, 16 Mar 2021 13:26:48 +0100
Message-Id: <20210316122648.3372459-3-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316122648.3372459-1-pasic@linux.ibm.com>
References: <20210316122648.3372459-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
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

The definition S390_ADAPTER_SUPPRESSIBLE was moved to "cpu.h", per
suggestion of Thomas Huth. From interface design perspective, IMHO, not
a good thing as it belongs to the public interface of
css_register_io_adapters(). We did this because CONFIG_KVM requeires
NEED_CPU_H and Thomas, and other commenters did not like the
consequences of that.

Moving the interrupt related declarations to s390_flic.h was suggested
by Cornelia Huck.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---
 hw/s390x/meson.build         | 7 +++++++
 include/hw/s390x/css.h       | 7 -------
 include/hw/s390x/s390_flic.h | 3 +++
 target/s390x/cpu.h           | 9 ++++++---
 util/module.c                | 1 +
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 0cee605f0a..ad2941f7ca 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -47,3 +47,10 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'
 s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
 
 hw_arch += {'s390x': s390x_ss}
+
+hw_s390x_modules = {}
+virtio_gpu_ccw_ss = ss.source_set()
+virtio_gpu_ccw_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: [files('virtio-ccw-gpu.c'), pixman])
+hw_s390x_modules += {'virtio-gpu-ccw': virtio_gpu_ccw_ss}
+modules += {'hw-s390x': hw_s390x_modules}
+modules_restricted += {'hw-s390x-virtio-gpu-ccw': ['s390x-softmmu']}
diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index 7901ab276c..bba7593d2e 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -12,7 +12,6 @@
 #ifndef CSS_H
 #define CSS_H
 
-#include "cpu.h"
 #include "hw/s390x/adapter.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/ioinst.h"
@@ -233,12 +232,6 @@ uint32_t css_get_adapter_id(CssIoAdapterType type, uint8_t isc);
 void css_register_io_adapters(CssIoAdapterType type, bool swap, bool maskable,
                               uint8_t flags, Error **errp);
 
-#ifndef CONFIG_KVM
-#define S390_ADAPTER_SUPPRESSIBLE 0x01
-#else
-#define S390_ADAPTER_SUPPRESSIBLE KVM_S390_ADAPTER_SUPPRESSIBLE
-#endif
-
 #ifndef CONFIG_USER_ONLY
 SubchDev *css_find_subch(uint8_t m, uint8_t cssid, uint8_t ssid,
                          uint16_t schid);
diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
index e91b15d2d6..3907a13d07 100644
--- a/include/hw/s390x/s390_flic.h
+++ b/include/hw/s390x/s390_flic.h
@@ -134,6 +134,9 @@ void s390_flic_init(void);
 S390FLICState *s390_get_flic(void);
 QEMUS390FLICState *s390_get_qemu_flic(S390FLICState *fs);
 S390FLICStateClass *s390_get_flic_class(S390FLICState *fs);
+void s390_crw_mchk(void);
+void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
+                       uint32_t io_int_parm, uint32_t io_int_word);
 bool ais_needed(void *opaque);
 
 #endif /* HW_S390_FLIC_H */
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 60d434d5ed..b434b905c0 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -40,6 +40,12 @@
 
 #define S390_MAX_CPUS 248
 
+#ifndef CONFIG_KVM
+#define S390_ADAPTER_SUPPRESSIBLE 0x01
+#else
+#define S390_ADAPTER_SUPPRESSIBLE KVM_S390_ADAPTER_SUPPRESSIBLE
+#endif
+
 typedef struct PSW {
     uint64_t mask;
     uint64_t addr;
@@ -806,9 +812,6 @@ int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);
 
 
 /* interrupt.c */
-void s390_crw_mchk(void);
-void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
-                       uint32_t io_int_parm, uint32_t io_int_word);
 #define RA_IGNORED                  0
 void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintptr_t ra);
 /* service interrupts are floating therefore we must not pass an cpustate */
diff --git a/util/module.c b/util/module.c
index 26fc893d98..5638202357 100644
--- a/util/module.c
+++ b/util/module.c
@@ -313,6 +313,7 @@ static struct {
     { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
     { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
+    { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
     { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
     { "virtio-vga",            "hw-", "display-virtio-vga"    },
     { "vhost-user-vga",        "hw-", "display-virtio-vga"    },
-- 
2.25.1


