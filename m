Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDF536C6E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 12:56:49 +0200 (CEST)
Received: from localhost ([::1]:45526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuu7j-00086B-Np
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 06:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nuu3M-0006qO-Qc
 for qemu-devel@nongnu.org; Sat, 28 May 2022 06:52:19 -0400
Received: from mout.gmx.net ([212.227.17.21]:36065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nuu3K-0000uC-MS
 for qemu-devel@nongnu.org; Sat, 28 May 2022 06:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653735132;
 bh=9ngQfUt7+LwIvJC4AlKuswMrm7cNR3H9KLSk97x4oUg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=KVs1+5CIWxXLBII+xZe3v/uobLWxKFsKfJLv9bBWlpVcUbNBtZ2k18tYa8lvagK5s
 dp4qBk1c1yr8AHvwDzwEIe/q2WtCTOOY14XL9yid+1iNOdEVLhboocEOKjnjKDZB7v
 OxzbNDnMP37XyoUWK70aJYX1TX2BdsngdLWl7RsM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.176.6]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1Obb-1noKMi3UAV-012rdZ; Sat, 28
 May 2022 12:52:11 +0200
Date: Sat, 28 May 2022 12:52:10 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3] linux-user: Adjust child_tidptr on set_tid_address()
 syscall
Message-ID: <YpH+2sw1PCRqx/te@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:0OkQFkOVtob3FKSi+cq578RmsnhPS95U98/8A8gSt3BZYQe3GIx
 UXMEil1YSYvHdmTukZA8jy3k9rMK91V6W2zOPREZrYD9F2wPuIRgY3/NLem31IMsfHgmPlq
 DBuwbrAMnh4HQZ2/onF+jy3eCdnB+SYMRd/3YtN2ZLo/Oaw0MR3PjTHmZaHPsRk0ET61O5M
 5NGCPBxp2dZroZ2KLoixg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fV0xQ26g068=:XSo1xetejhlQbu91Wq5ER+
 Wzbl3CajD/78mwWwMJBZQfPrVL/oCb8o/KcxneqXwaVFvC9PohaBRRwbH7AxWg4y9ZM7AzlJ2
 NsB9/rsy7ESvblH2feInn0us5O0opOAWDeN1gaBtZNsjEGuJOC3Alp58+mzhu+3RHhiCM83bv
 0/0ohloFeudEyeVkzF7sBptvRuaLAuDdklxJ9qeoN9pKqdY7LgjVUiPKWsjDYNfJkMCjiifrS
 ogZasI1loz8PmLIp6lGuIbByLtomKeH35fEHEa2I3EAb8pzIRQoIbXX+ekCPcbKVRsLakJbTq
 p78gAt450jI7fWJ/cvPnAPa9DMRM6nco6kJ6DpnGq+W+jBY0BYBbuS7gAZTXyPiDrY1anu2Vd
 d0pT/Z4hsrOTp2bsLCKd844QmvduJbNb2dgrDQdvNO75ONqewIze0h9rKmki7udiF/rCfQrAW
 DcC7/nKmb5YSwLxMYuE2QmSfWTMEqmL93pWRixPsFBL0YmA73zsAZXWORM4+YNiC01nr9J5Qc
 zIGadvp3rZznc2CdRlzmpCjjlq+7jkYBlnQU01+XDBp5Dv3nq8XMy0OvGQmGNMEOQt6PMkdk5
 y9wl1fE7LBIbMSRNdbgEn2OtcEsq2HBreKC2X5yE5MT6FCPQBLfXnBukkYzeQ8UpswUEsk9HH
 nuMsQohoENNInmGssyp8MSa9mT8pwuTT9f17vdA5w3gkRPmuudveefZsWBTCjDiBGPsVvqZl3
 OHAT+sdroL07vOUxB7IreuPIKv2T0sgNvco2NMRLRKD02qcCGeyqQI9x5CewHU7LFmmceGG6r
 kbLrdlMQawUQRANxyPX+J6bQ+HIipdaGWzqo1SVkSVwAZRf1XxOW7rJiInPYQrYKxgwwuTs4w
 BXUlrvS9aJRHcrn49XzY2eamhbRas2jy6Q2kwZypzO3nDgymAYp0Ju/jvd6RQ+swgT0zKPuf+
 RqTPu5QHBCA+vkPijHyD5DHragh0h8bITMDD9061oZViRHN90CJRPk46EzmSo99rdO8ogRu25
 Gd2XJmJKJtRZNKU4DWKlzmYOmWEzxKwJq4KTJkZ+d3Ugty76zSZ/tr3HiHIE4f46m1xek3BA/
 hqBkVtsTQjiFFOuu5OQK7BAU7OJgsUwQADsup8Fv3LmbL+xFthe40iCTA==
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

Keep track of the new child tidptr given by a set_tid_address() syscall.

Do not call the host set_tid_address() syscall because we are emulating
the behaviour of writing to child_tidptr in the exit() path.

Signed-off-by: Helge Deller<deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

=2D-
v3:
- Respin of the patch because the v2 version was mungled in-between the
  mail of the v1 version. Now it's possible to get correct patch with b4
- Rephrased commit message
- Added Richard's Reviewed-by
v2:
- was mungled in v1 mail thread

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..1166e9f014 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -320,9 +320,6 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
 #ifdef __NR_exit_group
 _syscall1(int,exit_group,int,error_code)
 #endif
-#if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
-_syscall1(int,set_tid_address,int *,tidptr)
-#endif
 #if defined(__NR_futex)
 _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
@@ -12200,9 +12197,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env=
, int num, abi_long arg1,
     }
 #endif

-#if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
+#if defined(TARGET_NR_set_tid_address)
     case TARGET_NR_set_tid_address:
-        return get_errno(set_tid_address((int *)g2h(cpu, arg1)));
+    {
+        TaskState *ts =3D cpu->opaque;
+        ts->child_tidptr =3D arg1;
+        /* do not call host set_tid_address() syscall, instead return tid=
() */
+        return get_errno(sys_gettid());
+    }
 #endif

     case TARGET_NR_tkill:

