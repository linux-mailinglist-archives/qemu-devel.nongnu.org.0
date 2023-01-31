Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFEE6833A6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 18:20:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuHW-00032t-TG; Tue, 31 Jan 2023 12:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMuHL-00030z-7v
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 12:18:44 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pMuHI-0008Bn-Ow
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 12:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675185518; bh=e3x1GXtu8A0UNA/+tMaHIZV539L7jsM32F4GEzWbAlM=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Foc3cREN0dnbjEvMthDYCIHJoKvRpYW/DukDGHhXkKIkrej1wI0v8qMc+BShV/UBd
 dRwUoAhA/rSgIJ2wOPzaWDOIyhLrnoYXX7mwPoHEFAfffUaKayibjR+zb0Uv/WAZ/X
 oIC2z+Dz0c0b6vurJFwtm/kyklwN5DvzUaLzemfdu1NP1TtQMECaZ8O3chbH579SUw
 Q/eeRC+g1vUgU11GA8S7j/z1TB8WZtq4jQqowI/ZqTBqht71X95oNVCMX3VEEfquJB
 HFFbdaC1ZzPTcPNgC8uogv/aefVp/EtocUQAdn5QfQhLT46w4LD0bhQ7EqHCNzI310
 qwS2rI3Y33NKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.177.115]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1ogf0q1SAI-011VeD; Tue, 31
 Jan 2023 18:18:38 +0100
Date: Tue, 31 Jan 2023 18:18:36 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Provide print_raw_param64() for 64-bit values
Message-ID: <Y9lNbFNyRSUhhrHa@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:vFxMAgemN3CrbqSSJc02Xw9TcOk2t2rvnd1zwwRfRTWVWn8qp5I
 UICz3iVeWzmY67T9NYDDxT3n5r2TdJ8gdcEPHztSSLx9PSneMjrmvaHZCVSqLemOiaIJXFZ
 TcF7k8L3qbwZODucYdXEC28OxdZJOFQz7uu5tcB4Ds4kJJ1DrRk1gTWJy/rCBaC0xLWkqi1
 LG16dSm72udGiAjgkeXhA==
UI-OutboundReport: notjunk:1;M01:P0:VdJ0gky+vzU=;FZB024qGhpzepmLH3m0YAJmkmRQ
 05HBU0+0JTWdQ3yauPqusqx1IGYixuQoB1/WLkFf45+FW/NOEBjXepGAu943NyouwgljqrQPo
 rjdtYkRHU99Qag0NsIcyWqYh59UBZkPgsOBIXxYOzh6WU3pSPS/srd6D1BbJ29m6NDV3aai22
 bXBpHe6w0h15ENwR+hSPqfH5DsDp1dAATpAkUJSyv4qI/lgJ3a5ic+Nx8wTHPffpwJ7+CELNz
 IdLO2ketjiEB164yW/msirAZTxDflUuOc80dCg+JOMeBBjb8QV5TEtZ4mpvMyXNmqmmJllXZe
 /JySj/B1VtR/fLSYTnS0ySvl28qEVohAHvI9uOMEdRi7/EhsvjC2aKHFp5jA+0CPpBG9Mr0/N
 sPHARIHzC65jb0cnHYnY7VCXbNCAtqB/JKK2XQzsUcUlrGeWTzBCM5qqHZzJEwvwuxG9DL0Of
 EU6+8vSoaIz1N6I8s8LHf9JWtmd1DwKCymry8tyBYzXic7S3DiS+yjJxPGC3iD8ZntpFysxYB
 EpiMpiREf3Q+hMBI4SKBm0pCn1EVy6UMvv5nKoTcbrNwsuR0E2OvDrqLvaZElAJhmY/+52hiV
 PU/lWMvfcNaIZfnjShmkbV9ACApsjgUYyauvl1aLnaEpj0vOkA7/O4xtOIzS1jfm2hVSAN4yG
 z95UymkK1R554c/88VPRAAR95dfp7Uh5y4MXvqsewlyLRcVTLdZKB2yu696NUtv9iBnk50Fod
 kEXneMx0Jli2Sk1BK7bDgxeQXsj8kOk9POG2YVlePTYv35hLPmnKtTQtSh5gqLUpz0XuzZDpg
 9vrBdnQ+Zx/qq0L3cvHyi4M1Wz9k4r48cadsxFB5F3QHBiLoGdcLHCe9FgotfbN3qPcbd3QMM
 lrg+8oFkN9UrNDRM2ma2El+jf+8l4DkUJBlkLyh6eihbLPXarUX1cBpr4dAJG6NVtx4s1chcZ
 b4luYg==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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

Add a new function print_raw_param64() to print 64-bit values in the
same way as print_raw_param(). This prevents that qemu_log() is used to
work around the problem that print_raw_param() can only print 32-bit
values when compiled for 32-bit targets.

Additionally convert the existing 64-bit users in print_timespec64(),
print_rlimit64() and print_preadwrite64() over to this new function and
drop some unneccessary spaces.

Suggested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/linux-user/strace.c b/linux-user/strace.c
index 379536f5c9..35d22be027 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -81,6 +81,7 @@ UNUSED static void print_syscall_epilogue(const struct s=
yscallname *);
 UNUSED static void print_string(abi_long, int);
 UNUSED static void print_buf(abi_long addr, abi_long len, int last);
 UNUSED static void print_raw_param(const char *, abi_long, int);
+UNUSED static void print_raw_param64(const char *, long long, int last);
 UNUSED static void print_timeval(abi_ulong, int);
 UNUSED static void print_timespec(abi_ulong, int);
 UNUSED static void print_timespec64(abi_ulong, int);
@@ -1615,6 +1616,19 @@ print_raw_param(const char *fmt, abi_long param, in=
t last)
     qemu_log(format, param);
 }

+/*
+ * Same as print_raw_param() but prints out raw 64-bit parameter.
+ */
+static void
+print_raw_param64(const char *fmt, long long param, int last)
+{
+    char format[64];
+
+    (void) snprintf(format, sizeof (format), "%s%s", fmt, get_comma(last)=
);
+    qemu_log(format, param);
+}
+
+
 static void
 print_pointer(abi_long p, int last)
 {
@@ -1691,10 +1705,8 @@ print_timespec64(abi_ulong ts_addr, int last)
             print_pointer(ts_addr, last);
             return;
         }
-        qemu_log("{tv_sec =3D %lld"
-                 ",tv_nsec =3D %lld}%s",
-                 (long long)tswap64(ts->tv_sec), (long long)tswap64(ts->t=
v_nsec),
-                 get_comma(last));
+        print_raw_param64("{tv_sec=3D%" PRId64, tswap64(ts->tv_sec), 0);
+        print_raw_param64("tv_nsec=3D%" PRId64 "}", tswap64(ts->tv_nsec),=
 last);
         unlock_user(ts, ts_addr, 0);
     } else {
         qemu_log("NULL%s", get_comma(last));
@@ -3814,10 +3826,9 @@ print_rlimit64(abi_ulong rlim_addr, int last)
             print_pointer(rlim_addr, last);
             return;
         }
-        qemu_log("{rlim_cur =3D %lld, rlim_max =3D %lld}%s",
-                 (long long)tswap64(rl->rlim_cur),
-                 (long long)tswap64(rl->rlim_max),
-                 get_comma(last));
+        print_raw_param64("{rlim_cur=3D%" PRId64, tswap64(rl->rlim_cur), =
0);
+        print_raw_param64("rlim_max=3D%" PRId64 "}", tswap64(rl->rlim_max=
),
+                            last);
         unlock_user(rl, rlim_addr, 0);
     } else {
         qemu_log("NULL%s", get_comma(last));
@@ -3838,7 +3849,7 @@ print_preadwrite64(CPUArchState *cpu_env, const stru=
ct syscallname *name,
     print_raw_param("%d", arg0, 0);
     print_pointer(arg1, 0);
     print_raw_param("%d", arg2, 0);
-    qemu_log("%lld", (long long)target_offset64(arg3, arg4));
+    print_raw_param64("%" PRId64, target_offset64(arg3, arg4), 1);
     print_syscall_epilogue(name);
 }
 #endif

