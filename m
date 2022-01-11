Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71048B827
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:17:58 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Naf-0005lO-Gh
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCe-0008A5-GX
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:08 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:52787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCb-0008I9-QG
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:08 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mt6x5-1mDuEQ1u3t-00tVw7; Tue, 11
 Jan 2022 20:53:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] linux-user: Implement PR_SET_PDEATHSIG
Date: Tue, 11 Jan 2022 20:52:46 +0100
Message-Id: <20220111195247.1737641-30-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g6DNtmrPiZ3wq/lx4Yv706OwXC+B7mgsMpHtj0fAsxDQ9gxEksZ
 49HdrcsYBjINef/UEjiiFi4XvhkHr3kGecjTcsWfKccxtsFxBpyIgjvmnjWCQMJ8C/X+bYS
 cMBejhz8YTj9F6XS2Cv4Gsp5m0eGNJU9yLxSa+pJuDR1NyOmQABT1sZdG6NNBs7WYVSP19I
 M/SSp4FiN5vwBK3EGw2Pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VvQyIopO+X8=:hIr0zplx5Zuu+53+mCIh+M
 5rZ466HD8pTIrVwORHd6glDGrPjHOw/XUi2Sw25LhcrWEov2vRrMuIJ8eHB3rP6YfPXHsw7QO
 HbWr5oDPfiUDDNIbOXRH6VG1P2HvspvBS1aldvs4mr/znpa+sRSvD1aRo572T+npiCelZFIa/
 1PORfNdKGyD3Hz9aMkkCAIrjUOpfK5dvr9thB2DzGQaK/diec0gNTVCwS+ELcp0byvZP4pOyc
 I9aTsAG8cBkLm5/NFBRNAM2I6HPWHfSRZ2UWUhO99dM1aYbTYKgojGmLn8MNoE2b/HHfBfDi7
 IT7Xf2vAIGT30a/QOVUU2Kirg6XoHxMdnaqYxb4Zr42bFwR6jwtn3nITMBtlfOuQGzCgXg9QE
 8gOXmG4H2Mna5dxNiODNiAyHzbd31NuZ3piGazYm01jeKi11AaPasi9xAslNv16WAqbF32VFG
 585nPMezRf6CirWSCYdkKUp8UeiEZwIV5b5HKN2u2VRO+mntokIKF3LARIkS2sUeMh6Pnpa5f
 WpLXEoXw99Qw55gZKWVy1wcZFrFX+bsYT0WmqjzU4nzWTs/7TMAFK/Sx7jHreeAURz4fEAfrj
 7x6iRawabPRDmLCCYWk92oXXc0VqSyxaVeVXzsFHvRx9mJIhOJPn8vH9BG+4Dt6pz0XNfQxSy
 llkuNXO7hKWUioN5bMBlYpIWTBbfp0GsEfmqa8mwQxcXHQ2T1VO4I78CCLZ6GuPA3tfc=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220106225738.103012-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b17cfe31c8b4..f9ae6328b53b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6450,6 +6450,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             }
             return ret;
         }
+    case PR_SET_PDEATHSIG:
+        return get_errno(prctl(PR_SET_PDEATHSIG, target_to_host_signal(arg2),
+                               arg3, arg4, arg5));
     case PR_GET_NAME:
         {
             void *name = lock_user(VERIFY_WRITE, arg2, 16, 1);
-- 
2.33.1


