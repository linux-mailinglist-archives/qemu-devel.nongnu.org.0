Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E985F67EF5A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 21:12:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLV3t-0000of-B1; Fri, 27 Jan 2023 15:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLV3o-0000o0-F4
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:10:59 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLV3m-0007Lk-Km
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674850251; bh=eJyZY0jJQb/QMBKi4mkPQr4MzAAQhV0XMiC2SlnZFIQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XVEPkT9TDuAZkdZGgZd4g6u+XtlujmG2vMFiMSHETw8jW53GYEUo5fCxvWotb/6pU
 76ixre7P4nBd1bd8QVkPgqnJ3UrfxFIzcdAE/ogNhKHIBslqH+anOtE1kxA+9QrXuE
 iNlY5GsI8xitK/GXzHRLi51pLNvl+5sEP20lRCWfRRKVkmufagfZtJfwtaiOisclok
 0nOYKnCDwqRe8ycELMz65vMda28JMUhybqsA5EZZsvGo59exR+X4cQDyly9mU0IqIR
 KwqYWEM7yeVBqk6p3AvgFER4HFUiwAg8NMVc+xZTpeNMO3Xsbe0vI2yjdk8UUwq5Fd
 q07qWtD5Ga5Rw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.191.252]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zBb-1oa7573fpD-0153wI; Fri, 27
 Jan 2023 21:10:50 +0100
Date: Fri, 27 Jan 2023 21:10:49 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4] linux-user: Fix /proc/cpuinfo output for hppa
Message-ID: <Y9QvyRSq1I1k5/JW@p100>
References: <Y6ywbxuxqQ/cGPJW@p100>
 <b645585a-1093-fb97-60a1-5acc40b17271@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b645585a-1093-fb97-60a1-5acc40b17271@vivier.eu>
X-Provags-ID: V03:K1:lIWdW3pkwyiBLI13VYuVIAuzCIjCETGyKWV0dCENcgqYTcZYJqR
 ghkK7Hx3tOWuzc5lSM63JYzizMy+8puYlupDgOT5wISBXTbaD+f0U/qrIen61UyjZ6tgCjq
 BpfKqWpTPEjqi6Uw3S+0l9478wfRW4DlZXa/s2Y6gOg56sCxUGfQBeHIV220nty/eW2C2CP
 3VlN8iCnLFqjGZJiniakQ==
UI-OutboundReport: notjunk:1;M01:P0:51SLzfkSo2M=;EwySZTHJKlhak3Ndh2Km1ZIGuCu
 BPeQ27VJU2lfmHI0dbYA51tY0VrIfW0nwqcCt9AmwIRwwbO0RByxj0ltiR8k+e7mQunTZ646G
 RcRFUYZ2pJzZi/TqHzykye0qDAHYujeKSaWsow2hf4UAjv5LvgtEstRteuNQWfP6/riA/fhm4
 1MCfREu0rvasg4ZJmZKx2jYOcmppXrSinBVIbMNelSJ3HFOY8vTI4P9DZvhkb8eaE1Wf4Gm46
 4UDi5+UmZITB3AP00NhTYqFCfuAaWZnv5bZL4qq0DkkFnHQPbdKVP17JypygoOZdCSMAwFChq
 tcSLy2FbrVjyPsOBatXWZmqaPhL9I6K42kfFDh75OwpnyILYqGZwWWs9Zv9jpBZ8drWJVKhzC
 0kaWqZkiIIMi4gK3hHLV8lVlxMFTHpnU2UExs3RWdTLh3PhlmTj80z8rafbSWLl/Avcxmv5Vy
 5PVYMp7Hnf86jnqfn/we1Am3TtEl2zR9MLGCwxYFmMQDP3HiUdO5zKQCocRPpt/ISCJkwbL/m
 mJt9HLLPkiN0YpZSB95QlXD0ixeoUHM9dacrPW7lB8hlA1HmnWJM1FSStVmA0nyqZMLSJeE72
 POPtzGr66Qwf13SUqPrw2s+Fi46YkJ/F80k/HFoHNVX3XP4BpalA+TKjHsqYh7FO9cJUq7Uyg
 SfOtcUaHJ7+0Y3zrGnfM/TaF8wg/b7WHT0o4R5plRMWDu1c1fkXQEsps9CshRpHKgjlnTMLA5
 UMDrkxN4cafM3nw+xSLnG0BGkUGrtiJV8A92oDR711uCfSLgrv90IIqrjxQp+NUQr5BQF5IZw
 WhZhon8w4UA7tyI2AmRU/5YKmW/5gJBiADrVclY/fGiDHhhBYYudDr9NoTHAy8rCWUP03rzWq
 U3Mt1m27eCuwoFh8PK8YJFEPZNJONMUDr7Mm0tL90L0zDjYk034WyrV1FvhhU8RZ6+dz73KQ6
 iPnWrkMA08beR//f3hNKxyrLhmo=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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

The hppa architectures provides an own output for the emulated
/proc/cpuinfo file.

Some userspace applications count (even if that's not the recommended
way) the number of lines which start with "processor:" and assume that
this number then reflects the number of online CPUs. Since those 3
architectures don't provide any such line, applications may assume "0"
CPUs.  One such issue can be seen in debian bug report:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1024653

Avoid such issues by adding a "processor:" line for each of the online
CPUs.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
=2D--
v4:
- Drop sparc changes

v3:
- add trailing newline at end of /proc/cpuinfo file (needed by procps)

v2:
- drop m68k part (based on feedback from Laurent Vivier <laurent@vivier.eu=
>)
- change commit message


diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index afb24fd0b9..5fa2ae6c8a 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8318,11 +8318,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, int=
 fd)
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
+    num_cpus =3D sysconf(_SC_NPROCESSORS_ONLN);
+    for (i =3D 0; i < num_cpus; i++) {
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

