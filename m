Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E164BE79
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cnc-0001Lw-1w; Tue, 13 Dec 2022 16:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p5CnX-0001Ij-Ds
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:47 -0500
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p5CnV-0003Tm-Ck
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670966802; bh=QO0ytBQ1yaqy15iQUZUn7ClhliQei5W0pj/wxwhG5zk=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=YUJKUZgXyWytYt1WfLbLjjquYH7+2nr1zSahpULiNgvCriInGbjUMPk3xRFfPZGDZ
 oenr5DJ/MdEQM0AOAq3cVszH9MnlnRKGGndGXEKPcwEvZt1uN4Pq13aXuQ2xU1pDhy
 yDLHlf/VoxNhw3gc8B5u3ssdxLNAw3Tl3XXD3RC8hXblj1kIoTqDgtl7KsLLWq7u6Y
 n71f7eFQkDdXCZAu45y3nw4Wyf/++ag/58Ivct/1uI6ZFxQ884QOY6X+0qXirYjKVW
 2DuwemCcLKrcZv5rEZeLyQA3NtwfKNhLHAX44A1LY0InV0BBDtikLSYcC/rc+y7rnq
 1Jqi4bO3wr+FQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.135.201]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNh1-1oRCPd14ZT-00hzUt; Tue, 13
 Dec 2022 22:26:42 +0100
Date: Tue, 13 Dec 2022 22:26:40 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Fix /proc/cpuinfo output for sparc and hppa
Message-ID: <Y5juEOgG2Jnad1j9@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:BThMxmbYOGwH4WcKnvoFTW6deDRmu7js2WdjSdzqyc3npY0ZyJv
 mpOA/jyZsNASKAIZ6hAF4PxpDorBuVFpZ/7P0W8TWEkBTYooq2XCpiPFtlik0fRfBkNHVq4
 rTfAW68ARn7CwFKVC9oGz9Oo+DqrvqH2qfbiOAnltYNdMDvygJpFh5xuUHMp7vTZUQg8sSf
 0MwalQ4/6Eaq9qcfEmOSg==
UI-OutboundReport: notjunk:1;M01:P0:jv7fk8hleqg=;NM/Z/eK8FfN8tzghbYB/vP3+Nah
 P46Gan4ieciPY0pBBL8Y8AEsX3SWQ9H9xH3z7BRAotCj0Q6jBd9StQnb2Pp2q4hNkL+FVEEvm
 AAoMwLLszBYap5VSwThsQSUl+NrNr3wBMZmTJEZRRWrQWR8hUwR/Fnb8VWgjwjEwYNQdTQotu
 WswqVu6PAKuaJ+Kl3CLDAxoXMNy2/lns8n7iRT6LfGXUaVk7zfs/9oTfRrw9PXDJH3HaUSDod
 HF6/0NU8ZeLXzWVG2z+gkgVncBz1SPDouBQP5NB17whypl96gMJkGHGEoBNKhK1xE5fVEw9MU
 a5EKU7PeUJ3KDGZIb3bTS3EKI7KiqbG0x657xWcxSKjPAnEnsEgejvGSGd+Oz2y7v34fXG1gI
 myqoZtREFJABuBijS4u7JLWrkXzW02P2cAtbkxXJtAvJ6hFs2NQPAj5gRn/KZgnomzIj1vvHk
 kDdT6Gk2z+ZCrClS5TkGR3TCUQ4jbyk5Y83eFCSNwSGJmooq1V7pSDHjFnpVlvMy/v0QVwvBW
 FH04AFP0TE6WKTOZvcs2YnXRQLx1ySBbeg/Sfp5xKX2X2JlW3Z8ly3LRErTdo7QdXn3sJMh8J
 RCF+fHpjOLJBNISzG5t7iz0e0NylNhAizEDKKQi2OM2lkoMLAFWlBvdyP9yWPZHhH3Rzn1Qpu
 jBn/W3bGvx2y6pquD3Bb6uDHHhHGiVn6gf1HeN+KdDvYtwFVEzQt+psPjQ+yECFfgIA5zL4gh
 OAxLGzyJyrlLfMK6/KsbTYHtOilGOTC1jqlD5WbiZbazy4jFWvfr7q3aRAaas/jbmRSoZ1Mmn
 gjl3XpF+FN3zXO6edVcYH8gJ15GvN6uY3uEaGHnovb5BoVKwVOFT4CV6iukxY4feoHWstMxsd
 dD8aXkUQqlhqjxG2xZXom7+8AjuLIKM6WjWtwoSV7esE4iThsoTDCsq2skK8++eEta1lpfhFa
 n4zb7tPXqnx4kgHXhvNC2A2TmaE=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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
v2:
- drop m68k part (based on feedback from Laurent Vivier <laurent@vivier.eu>)
- change commit message


diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9e2c0a18fc..d58e9b8d10 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8299,7 +8299,13 @@ static int open_net_route(CPUArchState *cpu_env, int fd)
 #if defined(TARGET_SPARC)
 static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
-    dprintf(fd, "type\t\t: sun4u\n");
+    int i, num_cpus;
+
+    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "%sprocessor\t: %d\n", (i > 0) ? "\n":"", i);
+        dprintf(fd, "type\t\t: sun4u\n");
+    }
     return 0;
 }
 #endif
@@ -8307,11 +8313,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
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
+        dprintf(fd, "%sprocessor\t: %d\n", (i > 0) ? "\n":"", i);
+        dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
+        dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
+        dprintf(fd, "capabilities\t: os32\n");
+        dprintf(fd, "model\t\t: 9000/778/B160L - "
+                    "Merlin L2 160 QEMU (9000/778/B160L)\n");
+    }
     return 0;
 }
 #endif

