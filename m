Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173FA392139
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:01:48 +0200 (CEST)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzit-0006zP-4P
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf5-0004Hf-4z
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:51 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf2-0006YO-Nr
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:50 -0400
Received: from quad ([82.142.6.50]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MirX2-1lFypC2gvk-00ew7a; Wed, 26
 May 2021 21:57:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] target/m68k: call gen_raise_exception() directly if
 single-stepping in gen_jmp_tb()
Date: Wed, 26 May 2021 21:57:42 +0200
Message-Id: <20210526195744.227346-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526195744.227346-1-laurent@vivier.eu>
References: <20210526195744.227346-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ce0uu3ip48g5g++iuQO9lvrI2s5usCEKvIvvKINYXiSAH8B1jEl
 2j5xd7ln0qSM8L3wUPEsSlGRlrtP+65ya4hsm2b/8yBWIbUX/Qnv9OTVP0fLXJx5iPDQuba
 Ld3YmjIx6uWx5wcbs3LALrpZWqdYrQH+t6UZiGFcdY4e/7tbbasbBNXAR56HG2hbRpVTj2r
 1dV/j5BfPo10OmXnkFO2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VM7QzHX22OU=:A5vRlDd5XbNFwaVQkyxEwr
 3miXnVRHZ/wqYHc3v1w/SiI4j42IPnWPccm1/z3n54gmp99oIc52+SXnR7cmUnklbz96Jpj1a
 m3a9SsD1EF8fqsvymqWsGCxjxSB4uLAeXI3lbJtEZn92KeJoBzPT1yXzjEOUYlleg6/ytEvpM
 iwpFiCkvGMLTf8+ln4rOMH6TOzTl1EUnMV7h3CkhHN4l0hw0JrIIhTIDIvHMFGUXyGv+oQ68p
 4OV12qthwhY/hJfiO/xCb8eGQXxsONXiTjwEGPpzXtPSPKcNYYyxJqfeAkLgv4M+znKG4Uwb1
 3iIUr3Ti+kX7N5BEO/TUqjSyvc/qxvUklaCY+lYeOKZqPIjCqnxXzksHEDjOr67wtudqlGYTY
 4E7iADGbVuO4ZL3qvHdR62347RB9smpEGkWFoZkvdJHjRUER/SjE9lh0/GhnCXAMbOdZ1mC4E
 hpm6o3V99DFuBJbRYd8/fLXTcPNEWEopLjtBlSauEXCgq/VV0fwzF86SOTIqA77Am+cEyaW1n
 Hc5lphirc87T1d+lDQXxZ0=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

In order to consolidate the single-step exception handling into a single
helper, change gen_jmp_tb() so that it calls gen_raise_exception() directly
instead of gen_exception(). This ensures that all single-step exceptions are
now handled directly by gen_raise_exception().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210519142917.16693-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c774f2e8f0fc..f14ecab5a502 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1518,7 +1518,9 @@ static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
     if (unlikely(is_singlestepping(s))) {
-        gen_exception(s, dest, EXCP_DEBUG);
+        update_cc_op(s);
+        tcg_gen_movi_i32(QREG_PC, dest);
+        gen_raise_exception(EXCP_DEBUG);
     } else if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
-- 
2.31.1


