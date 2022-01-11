Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB03D48B89A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:25:21 +0100 (CET)
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Nho-0000AE-Sr
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:25:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCe-00088M-1g
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:08 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:49479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCb-0008IL-Rb
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:07 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MirfG-1mSYnb3b4W-00etze; Tue, 11
 Jan 2022 20:53:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] linux-user: Implement capability prctls
Date: Tue, 11 Jan 2022 20:52:47 +0100
Message-Id: <20220111195247.1737641-31-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X65KyYpmgvTzNs05peiuXT3UJPO51Dun7bUw3kYCzuStBpYY57I
 7KrA2FLRg10RMPrSPVZA/cYSDcxZPg75YenFXBr//MUNBKsZa8QI+kPPjLNoH51fb8QqO9+
 6adNyJCtfpGZpDWHri0ALQpXxhNwx+MbBhEKFPkRtGcPSxK2Lr27aI+Ggjvo1UxOoH0bdbZ
 JOR9RBAWI6+vQDhbx13/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ixT0RA+x9a4=:25YiJ8Dra7/1ufTsPwiaDh
 3Pvu0WuenYw8vfpIHGwVmmG/STdFrJQHfbAv6nyVPBzl3pQH+zJTFs2KX5kprNHk0sqfzrPMZ
 SgguvZM4EhI54BvaYpROP1GkaUC/RTFrvJGF50jHaeHhrDqqXGzGcT5/nUGsf2NNKU9n1bovP
 /4vFnkMIwnD9iWVrv3yV5ciIKBWUUStQZVDp1LUiVCRtHcIUNo64aGPAoh2qRSKRm8lUYW0Fa
 TFsCBDEzw6FjOyBZHE9qJwYsDRqcPR1T1IhWR10cso//m8xrSuGDeW3Px6Q2zjLUTn6pn09LO
 eADKYq6DH21axlQ30eZe3b0+hB+XXWnTf2brPjrKU9vfnf3pd5ixDfEiPK8VshbB2DAZe690V
 uZwYpRy9HzgA4y72LLRE0X769qK2ZYlerYVJp6JlDP3q7zcnHnLOasIt9WfWGkUSxdTZBoHsN
 mnyphN8W19N3fBtVtP9sIsFro54gi30rBoeAR70bbBeZvOQ61sG7gbw/ZC333fxOz4q1nzzy+
 a89llI1EMDXMh5uX/0cCeUvwuJMYr7nltssGV444qP2BD8EnDnE2icRU0LlApmXlfAMOb0Tgm
 r1usbD68TV4G5hIt9ZUlBXdX2M/eHr0l/vf7KQLAgpWafL3N8rkbJxL/zpXmgp+jQLMtv5LaZ
 CJVMZSM9e3uFAtzMMmVhh6qlmK74PZF6V4T3pEtbT+FZ9OIBd631CncDx0x/mstGylss=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This is PR_CAPBSET_READ, PR_CAPBSET_DROP and the "legacy"
PR_CAP_AMBIENT PR_GET_SECUREBITS, PR_SET_SECUREBITS.

All of these arguments are integer values only, and do not
require mapping of values between host and guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220106225738.103012-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f9ae6328b53b..5950222a77e0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6504,10 +6504,15 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_UNALIGN:
         return do_prctl_set_unalign(env, arg2);
 
+    case PR_CAP_AMBIENT:
+    case PR_CAPBSET_READ:
+    case PR_CAPBSET_DROP:
     case PR_GET_DUMPABLE:
     case PR_SET_DUMPABLE:
     case PR_GET_KEEPCAPS:
     case PR_SET_KEEPCAPS:
+    case PR_GET_SECUREBITS:
+    case PR_SET_SECUREBITS:
     case PR_GET_TIMING:
     case PR_SET_TIMING:
     case PR_GET_TIMERSLACK:
-- 
2.33.1


