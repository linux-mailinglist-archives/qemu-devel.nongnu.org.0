Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66BA57774B
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 18:24:02 +0200 (CEST)
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oD73p-0002NX-8G
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 12:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oD71r-0000a0-2D
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 12:21:59 -0400
Received: from mout.gmx.net ([212.227.17.21]:46835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oD71p-0003eV-6E
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 12:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658074915;
 bh=6YV3vGBvLV3x0bekgojdAWHlkhp1JYAUarp1jAdZ9Uo=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=NaAqU46VvNocMh2ydMuRwXPdCEwB40uyJL0u5u2QY4J1VrrPwaWB06MIcJIAkoIzz
 NTuRbGwgnaUnttF+nn3r4OPdhvds/YOF9S3lJ8pd9U9LFrd7egr2eEgCW82LLUCTku
 iGt+auN81jwYdUSmr2yDwSCma0FDhiEqg0po3fVc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.150.104]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1oOuKG158l-00Bs5Y; Sun, 17
 Jul 2022 18:21:55 +0200
Date: Sun, 17 Jul 2022 18:21:53 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Use target abi_int type for pipefd[1] in pipe()
Message-ID: <YtQ3Id6z8slpVr7r@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:8COsCBVn/rvoJq06Iifow7T3Lk26XJt3d7LNb/7SQ4YknRDiIYK
 K3pZrVfoKjZfcOwzSqKw9DaOibPei8kN/E5QvgdKq+ANsjcMhumN4TrX1jNf3mSoOFNGLGP
 5VTCDrrXE1BBFStSZ0hF+VFjWJAsuWipnP11n/W0wibFOBVeWelDD1NLycQZnBqxklkS3JQ
 Ce/lhoc20RwEi3k/U64BQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XoudZfwdlFc=:POwaaxJ3J2PIxMgUEdE6TE
 PE6CGgPDy7echSKqZnlRUVjc98A0EdCxPE4rMeRzQPt6ZVOHfSXyFPrsMGNKYe9i9JB5Q8HHE
 N9qntl+XiobsZdC7h7C5wH7xVgC7dVZ8NUp0VeN0WflhEdlEukvOUqzy4SPyr3C0RqVOPBiPU
 lTlTd3A3bG7j72McpOhtODXytGpZfINoKbdwQCxSydQx0WrqxI2UkqT16QtMpn+4TFlGn6rqd
 8mmNEqQoratQ64ZCcW2JRsq9L8ZG9nC09XasPG+yVksECVrqyHp+1bG/sKwg7fBLPyiQZFeo2
 YPQ6eAm1HOQxrt7i5Aby6xPalVzQoOAweqVHciAt0umP78ytpoQeE6netAkOQlXW1V4/ITLC4
 EGmzwBk9b0fYn7X35+puRefDdZ3JSKKR9TT6aC3el9qRARxvFOH7F5CNMYOUdYJiToSoOxmNn
 lM7Zxeckq2VZ1UwtP0PRXRAjb3JbwdjgLMRf6YCNZ9A+gw7bp+ZiPPPF0pQwU5UR0/uCX9L6D
 TDUvP9c3QGA+drWAe9zkVR57ptBkaDPmagcx9hOGOPnST3tqE5XkEoTYggoOtAleR65FWv81I
 1RrYM6uJNlLs0H5YbYmCEiUqd5405jr5UfsejQxr9KxQsUgJQV/yVOaJbULA9kQaZmnUQO2gP
 cQ+jPkWRXZ9DsG/NaX3IcH8GNn7rRAllAH6VexFipLM+xhse5I1mK2T7583PsX7BLTA7eV85J
 uP0dLxWtQN5IHpDQGZz5EMMTOl5PYnWjXYowglLQxNOgngg3+5pejdb4pNhjwGds1cnqtmKHU
 XBSiGKv3H/sRn1VA/N1m8NlZLC7JxPXmu/MS6ZR+qm/jPbZ1mx4Ql8zkvcUayp21pOc7ozfUw
 Xq/H3WRh2TO183dRfegs4PCAcoOcJwDuMMdd+vhr23eTyG0O9RvTcJIM0XcufLsyggBFhWhI4
 KQFN2pWFrUt16vULHtXd2Lw8VtgZqQULWMeHrBkiwR1NlFLXiq0Rca1MDWRDnGAgJHnk3yE0g
 OwN68gCEsj19dICo2ecnBto7coA9iovy/dFwbZvmBJEiyf1mBrVpcApt3NILwFyEmjSu6V1dM
 iEkRC4WYxrGuaGGH40oLaBkDUZDuq/8e1j7ozqmDEJG+4XFQkXnIic7oQ==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When writing back the fd[1] pipe file handle to emulated userspace
memory, use sizeof(abi_int) as offset insted of the hosts's int type.
There is no functional change in this patch.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 991b85e6b4..1e6e814871 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1624,7 +1624,7 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi_u=
long pipedes,
     }

     if (put_user_s32(host_pipe[0], pipedes)
-        || put_user_s32(host_pipe[1], pipedes + sizeof(host_pipe[0])))
+        || put_user_s32(host_pipe[1], pipedes + sizeof(abi_int)))
         return -TARGET_EFAULT;
     return get_errno(ret);
 }

