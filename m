Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F7EF2A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 05:22:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLJM0-00027t-O2
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 23:22:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yangchuanlong@huawei.com>) id 1hLJL5-0001pB-85
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 23:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yangchuanlong@huawei.com>) id 1hLJL4-0007iS-D4
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 23:21:51 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42388 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <yangchuanlong@huawei.com>)
	id 1hLJL4-0007eg-0u
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 23:21:50 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id BE80D3CC4C492BA067D2
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 11:16:12 +0800 (CST)
Received: from localhost.huawei.com (10.143.28.114) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.439.0; Tue, 30 Apr 2019 11:16:06 +0800
From: Yang Chuanlong <yangchuanlong@huawei.com>
To: <qemu-devel@nongnu.org>, <gengdongjiu@huawei.com>
Date: Tue, 30 Apr 2019 11:12:38 +0800
Message-ID: <20190430031238.40499-1-yangchuanlong@huawei.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.114]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-devel] [PATCH v1] target/arm/arm-powerctl: mask the cpuid
 with affinity bits when get cpu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the cpuid passed from the device tree may still contain
non-affinity fields, which will cause arm_set_cpu_on failure.
Therefore, we mask the cpuid with affinity fields here to
improve qemu compatibility.

Signed-off-by: Yang Chuanlong <yangchuanlong@huawei.com>
---
 target/arm/arm-powerctl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index f77a950db6..ef9fec0b4d 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -31,7 +31,13 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
 {
     CPUState *cpu;
=20
-    DPRINTF("cpu %" PRId64 "\n", id);
+#ifdef TARGET_AARCH64
+    id &=3D ARM64_AFFINITY_MASK;
+#else
+    id &=3D ARM32_AFFINITY_MASK;
+#endif
+
+    DPRINTF("cpu %" PRId64 " after mask affinity\n", id);
=20
     CPU_FOREACH(cpu) {
         ARMCPU *armcpu =3D ARM_CPU(cpu);
--=20
2.21.0


