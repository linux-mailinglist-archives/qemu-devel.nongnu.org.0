Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C7A383CBA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:53:22 +0200 (CEST)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiMj-0002kp-5x
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm2-0006w9-CH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:26 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:46229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004Xa-CN
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:26 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MmQUL-1l0oNG30Rl-00iRwu; Mon, 17
 May 2021 20:14:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 49/59] linux-user: Fix erroneous conversion in copy_file_range
Date: Mon, 17 May 2021 20:14:14 +0200
Message-Id: <20210517181424.8093-50-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mVTFTHGDlUPsF6CihP/7tlyY4CTYiue3wJdZmw9GLEJlfLdI4mo
 W4Aw1Pyl16SAQ5PSr76zmRIj6MGHi6VrSZ31Tx2dGAHlZRtPkK220aVaJ1vtEOblga58j/L
 +PkUJDRMn/XwU5Eqc4ApRPxxRN2buRuelLsZa0/5ITIYDtei/EZjofQWDFUsa/GZMDrq8Qb
 lUF7L/Apozkjpz/p9TrEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:medkN2J/PrI=:G3Yb3c/PnQ2f0lra72AKfN
 /lbuY3zK3aUb/ibOxQLMK/KstztuaCxwRIHMpP4Nh0VOcudWpeTasEmPpDAXj06KVokkmRRXT
 PmPrsaAI/+lmDPQnLhgs1onwmf9+LpE31TkM0MGJilS4WO6agsr8e2ThJ5Wa2NtH17y8zcYEI
 SIVIeOVjkQl8LVp9JTVhqZ/K3vkqX3Niqv6ItmPy/GxED6kEBpRg230fyJZRsfZJoqEuHRW0F
 zUkURKnI4GQLcqJEFkXIxgDR4rxiavTwHJwWn5raMnsBfU2qwRYu9Wg4Lauiy2B5Q6NJsfw7L
 WMc9sVEf6k2KJVE7sejmkpyjwh1lm05NmaZB1+LqgvDKdxhSPJznGuPuGSZqG101NJJJFiXI6
 ZjVRlbCck3aEA4RHqZx3nBpwcdZxs+LZhmFxJNHhKH72zKUmwqy+yXL70+Dr8PPQoPYdmmKIa
 60HELIgwC7jsuu8gHZT30mJnANHRqOZanKxFjIw7e6+5IsCsgMSPyaYpNbMeW564n11JlNa4w
 yYXwXqs5B0ZB2VMkeWennU=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Giuseppe Musacchio <thatlemon@gmail.com>

The implicit cast from abi_long to size_t may introduce an intermediate
unwanted sign-extension of the value for 32bit targets running on 64bit
hosts.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210503174159.54302-3-thatlemon@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4d52b2cfe36d..e05870c33884 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -13244,8 +13244,9 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 }
                 poutoff = &outoff;
             }
+            /* Do not sign-extend the count parameter. */
             ret = get_errno(safe_copy_file_range(arg1, pinoff, arg3, poutoff,
-                                                 arg5, arg6));
+                                                 (abi_ulong)arg5, arg6));
             if (!is_error(ret) && ret > 0) {
                 if (arg2) {
                     if (put_user_u64(inoff, arg2)) {
-- 
2.31.1


