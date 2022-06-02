Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F153B8E2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:19:56 +0200 (CEST)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjnu-0007S1-UU
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTV-0000en-FU
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:49 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTT-0001Ep-QI
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:49 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MO9vD-1o86Fo35UP-00Oa2j; Thu, 02
 Jun 2022 13:58:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/19] target/m68k: Implement TRAPV
Date: Thu,  2 Jun 2022 13:58:32 +0200
Message-Id: <20220602115837.2013918-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1OPeGsv3Q5yuq+In3e8gfptCQoLv/GmfjNIQCmz4hie6xw4gZDY
 EXACP5F9AujWU7Ef63iPaQ2n5auMQTaOHbeFk6CwyMj+W/zVG8vSV11APLv3IiPa9bV/qWC
 /ttCEIXXPeyE/KVigcGmOi4R2l5Nk88+ecw9/gUHNny1zBwP/0E1Qcdb5NM8OaVl0+p/NsP
 /ruNFD83OmQuRJf3tAh+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AurgsR2fp/8=:7Liw5zF12r9MeX8q0RI3JY
 8uNIQ8z3D1iZ0OOx+XRWn0coPGhcnncwLINpBMqHVUj5hY/34CcYi5jzrys+rbj4G8KNAp2ev
 cduA69YRg47T6PMm1jc5flomfAL5o71KrU4mqcaDm9sn5USqWf3sN1Nr87YH+nP5YiOfW5kus
 +3wtaPsORpgiMJkWTg2Il3eYk9Dh7rNxt2mM/ZFOmlo/OnPZrDhJ5AXplpjuNo5CHJE6ZK8l9
 HpRdsiwNLOn3YAilsC4vGPyAlOxsptowenLCqSzZS6iydwvQ3Y3geshkVBAAoDoFoDpsOa81i
 9Sw5XAetiIvUx0519QNge8fwUSF6i7RPonCdL4IR0+6cMSIuQapQ+DkISFRp7IMZ2yZ5JSaox
 tOaPmCklpcbnPmMMnM+T2+nZfE/VQqHk1H/GjAe161YRIideqJOIy4cxV4S5vvNqWIjAs2foF
 AhBR4KzJf+vLh4xMMjueNI61tFHoXt3onqX47GXGMlQ3w4qgxnIRfk4uL+U2MQVrsOkehHIzl
 tU6h7jHE0BIGkRj4K2yAmJj8cPAKS/roSzln04vV0PoOWJx8XlijPQuurhcekd7uTy7tPzNXs
 BfB41BqeWB3msRbjGqFNHAsw27nmwhZmyOxpov1NoTFMeQQaR6ayEcKuGhIbTVxD7xa5QrXeP
 TXcGGsrmA3P+Z1vkac/VOHtNvyxzeWxEpTU3deoG3li5hoGjPLqWFSktrVHc3gxuQ417/7tdj
 tqkaTNkQ/kAWHWOeNUf0D2FXN/99l9HCJqLmbQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 8b2157c31f54..0dfddaa05628 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4910,6 +4910,14 @@ DISAS_INSN(trapcc)
     do_trapcc(s, &c);
 }
 
+DISAS_INSN(trapv)
+{
+    DisasCompare c;
+
+    gen_cc_cond(&c, s, 9); /* V set */
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6074,6 +6082,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(trapv,     4e76, ffff, M68000);
     INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
-- 
2.36.1


