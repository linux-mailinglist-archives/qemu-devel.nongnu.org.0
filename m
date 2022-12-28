Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B56586EB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 22:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAdg0-0008Vp-0B; Wed, 28 Dec 2022 16:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pAdfj-0008UT-SZ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 16:09:13 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pAdfh-0000Od-Qy
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 16:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672261745; bh=9BG473KybrobDnzboX5JF2vXe+iImFNiJL80L+UASSY=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Je4tPV3mf65LvY1hHh+Od/hSHh7AGi9djnN82g97XvdfQ2s1oYDpJv9qBV5cZ94p3
 +tFUKdLfkZf+6VJ7LCTE98v8ubZMQXpz220f0NU1cAwsBeW4h1pEcNU4BEH2mNmBV8
 3MGQCpL/mdCMKVliGm/7+iWZ9GAWDXJBo+x2ZYxcpSIXBvxrjKaCekhL7LaOJvyBit
 rLf4TCy6IFoIs549Ni2T7qcoNaeWPnjktaWLM/iR4mQajAYsmU02QE3mensVaejhim
 cEsoufaIqM1Q22nJyzyjuWJppCJ3rGRZ6NipVLpBZqzifL2lCPlRDoX6bvhipksRis
 HOdysMQmMMfAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.184.137]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1p2MCJ1dha-009SYb; Wed, 28
 Dec 2022 22:09:05 +0100
Date: Wed, 28 Dec 2022 22:09:03 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v3] linux-user: Fix /proc/cpuinfo output for sparc and hppa
Message-ID: <Y6ywbxuxqQ/cGPJW@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:4355QtgTjd7lg55hR8G5A28q0jh/P0RAXRwylopQwRyTfbN6wIS
 GUWLevAzKDXN+XJOtIPM42xK0dhMqJJaml+Cr6vesm/qvrzfuib7g0AcsPQrOyF/yD992w0
 wNXpjz/ERrRFev/C8sZL8a4AZC0FdCTfWpO2fZoYtYFPgal5pVsqdD9DcElaw7EifNs8DSV
 2vuElt1+AzgZg6dF2RRDA==
UI-OutboundReport: notjunk:1;M01:P0:186Vk3xkCXw=;5jOhVHc5S62M81TzfEVGahzUUa9
 6BXoaP4N/rXK0yhCGPgYGmUKv0pcwt5v6N4rMUQ5fKYAhszqe8QCENQUKpNQoD75efHXDPFWL
 Eqy2wr06skVZqu5pu8hP2m20gplRLzzlzjC8MzFSDmUlc/+Lkmp1CpgdT7upgELcXzEQjMgrV
 8XN8JM5w9CVFHlzDt+D5UXEhMGUppLps7QKcJwuB74o+M/G4OaAKRF87uwvrDWIWuDNvftn2v
 f/TTxhFh8e0J/YWgdqTn3tunOVqnhHEUOJrZ12bUmmI3PhlCJASuWPnLxljITdHXayZQLP1HN
 qPReLWq5uiKhbLwQndmF0J8oJzD4/4nazLXOUtckqisgQBoLDkoHiSJL3ksHbsPrksBT1Fs0d
 xJIWWRn4w1+YpQTXtnGWp+o+i1kdTfMxJMH9SOE6AWJB5TS9TiU3hlXvGt6mvXtsykrxdxtEr
 LAPwLJfLIZKz+BwqLsp0tkZ1z8TuBhyWaQChinibTUl0NpV6F5hY5FBp1x0YgJed5uhW9Pz2v
 6AyVPyfEfdnIghPNcxi26ZfibDsmmJBvvfaN26GKC5CIv7dd+FMHr9ZfKWG4CpQ8IjZ51g9RU
 qSuSAQl1VQpVBg7cYw/dXrlU2S92MDsnrP2ilm7G+uUkYwRPgaDgrj7eZtwAaByyvwZ9Ofvl/
 Z3kwFiXmd6WCt2+PQGagmIpdCmEpsg1ZMKgW0qMRVS5Ez7mzCnsK1PEXOytKiDzRFswLnGCyW
 m6dyk/y/uI+2KOr//Jv8441oy2wQCW0pnFrWavy3h1UBPlXRvRMmF0fMwkLN28RH7dMs5OwT7
 CuxuqqSrFzE+Eic8GVCO1YuDbvMetopy90joef9u8LUjCTtawl5aDbMiGVbPDMZavwPJRmLde
 L3uf5Pe7Xq22Cq3BB/fw6q2FWKAjv3M9Be5/ddRmG824LbT0rbDUnYkVVFJ8kSUGLB6uNwPCo
 o/pktiDnBzLHW20LDM+hGjZd75k=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The sparc and hppa architectures provide an own output for the emulated
/proc/cpuinfo file.

Some userspace applications count (even if that's not the recommended
way) the number of lines which start with "processor:" and assume that
this number then reflects the number of online CPUs. Since those 3
architectures don't provide any such line, applications may assume "0"
CPUs.  One such issue can be seen in debian bug report:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024653

Avoid such issues by adding a "processor:" line for each of the online
CPUs.

Signed-off-by: Helge Deller <deller@gmx.de>

---
v3:
- add trailing newline at end of /proc/cpuinfo file (needed by procps)

v2:
- drop m68k part (based on feedback from Laurent Vivier <laurent@vivier.eu>)
- change commit message


diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index afb24fd0b9..5ec11a3683 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8310,7 +8310,13 @@ static int open_net_route(CPUArchState *cpu_env, int fd)
 #if defined(TARGET_SPARC)
 static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
-    dprintf(fd, "type\t\t: sun4u\n");
+    int i, num_cpus;
+
+    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "processor\t: %d\n", i);
+        dprintf(fd, "type\t\t: sun4u\n\n");
+    }
     return 0;
 }
 #endif
@@ -8318,11 +8324,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 #if defined(TARGET_HPPA)
 static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
-    dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
-    dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
-    dprintf(fd, "capabilities\t: os32\n");
-    dprintf(fd, "model\t\t: 9000/778/B160L\n");
-    dprintf(fd, "model name\t: Merlin L2 160 QEMU (9000/778/B160L)\n");
+    int i, num_cpus;
+
+    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "processor\t: %d\n", i);
+        dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
+        dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
+        dprintf(fd, "capabilities\t: os32\n");
+        dprintf(fd, "model\t\t: 9000/778/B160L - "
+                    "Merlin L2 160 QEMU (9000/778/B160L)\n\n");
+    }
     return 0;
 }
 #endif

