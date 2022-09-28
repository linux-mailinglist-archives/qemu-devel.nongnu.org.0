Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315835EDA5F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:48:43 +0200 (CEST)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUcM-0001r8-2E
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE4-00085y-Hc
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:28 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:54657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE1-00089H-BL
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:27 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8QJq-1oZ4VE0ZZA-004T2F; Wed, 28
 Sep 2022 10:15:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Jameson Nash <vtjnash@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/38] linux-user: fix readlinkat handling with magic exe
 symlink
Date: Wed, 28 Sep 2022 10:14:41 +0200
Message-Id: <20220928081517.734954-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dKIcFdxvcq8+kkyyuZxnYokDGGDmh9Fl8qSNLx43uBQuAaavcZP
 cmA30rrindKYENiBa3xlhcWR0rco314nS8M37XJ67Bmu6TFXdadZSxCmHGkpUcZgmI5OFkM
 F0rmD3B8SaWqidmZUc0XvuPooZXpD2TyxASXUTXTDWaKFSPS7YRLmWtodieHhHPSRnhWSNg
 s4Rok00VSQWny/ejxVcVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:euF2N9/6ybc=:rdWjt5tBdJCNSCQ/cDzDmA
 ST+EYqHtwMZSL7MDz1cUdjw2VDO8gDkzvxLuZHZKVHCx875w7cuGsdV+XKlVqE1GEA12+rl38
 jJ61Eno9+fnfn2DFxrAKCG1g2eGtJZkVv9XnCpC6+KFF+tutns59m5Tf6mM1CGPEFiyWmoT9t
 g/UjxCq/XJoeoblDk9f9s167OmayWj1cEgBo0MttkbYTxJESW2Hmawe1+xgv7RN2FTp35IL2M
 RL1UlcenwB8AA+gO2tRgX9UaNPVKUV25MFp1AZ20soLLTKgvKxxakoGI60I5S1Me+2Oe0jkff
 9BqivrNFeTxT4nvrfgVHpdjN9jFhTWDPI7nsQbUpv9O8MxrHQb24UUgVmbN7vld090pElu2zC
 Lc1T8TDMgaa4c+5ZMIV25NczyJgZptXuBa0x38/YUwaOXcAeadiZx+JrmbCK8LWjjJ7chHFxf
 GU2VHJbN2Cu6lJ9jMrrXx8Z/oSX9oBDa4Btf2Pxx9hyMF/am6xTHVmhju/f6QorUvvEO0XimL
 iz6al9aW9HjFAHS4tehPIgwKCNai/LPMTAb5+w+W9xXa+M59dpuF24cTctj7iu4mb93WkRO6z
 9ivqR1ARAo4olzhenYFY2rOYiZaMuonEpMog/1hv/IwIR7umgfu+9yrTHIHmvSVAwEozTFARX
 5nwq7QM0JP7/CN5NMEckb8CzM2sTBwHoQ4jWknUCZJ/ce4A7LV483e7C8HdZguKfnonCiHKJO
 oRdZKXf3JA/dqclR/EG6TyTSxpPbIZv6regdO9Uk/X5Y3C5WQxTjzVAGNx2is667092HIhn67
 jxuCccw
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jameson Nash <vtjnash@gmail.com>

Exactly the same as f17f4989fa193fa8279474c5462289a3cfe69aea before was
for readlink. I suppose this was simply missed at the time.

Signed-off-by: Jameson Nash <vtjnash@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220808190727.875155-1-vtjnash@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f4091212027c..abf82bab2a18 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9912,11 +9912,22 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
             if (!p || !p2) {
                 ret = -TARGET_EFAULT;
+            } else if (!arg4) {
+                /* Short circuit this for the magic exe check. */
+                ret = -TARGET_EINVAL;
             } else if (is_proc_myself((const char *)p, "exe")) {
                 char real[PATH_MAX], *temp;
                 temp = realpath(exec_path, real);
-                ret = temp == NULL ? get_errno(-1) : strlen(real) ;
-                snprintf((char *)p2, arg4, "%s", real);
+                /* Return value is # of bytes that we wrote to the buffer. */
+                if (temp == NULL) {
+                    ret = get_errno(-1);
+                } else {
+                    /* Don't worry about sign mismatch as earlier mapping
+                     * logic would have thrown a bad address error. */
+                    ret = MIN(strlen(real), arg4);
+                    /* We cannot NUL terminate the string. */
+                    memcpy(p2, real, ret);
+                }
             } else {
                 ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
             }
-- 
2.37.3


