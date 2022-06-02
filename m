Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D553B8FC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:29:48 +0200 (CEST)
Received: from localhost ([::1]:39264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjxT-0002Wf-55
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTd-0000zR-F3
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:57 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTb-0001Gw-OQ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:57 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mlf8e-1nWiJT1Jp4-00iiXq; Thu, 02
 Jun 2022 13:58:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 13/19] target/m68k: Implement TPF in terms of TRAPcc
Date: Thu,  2 Jun 2022 13:58:31 +0200
Message-Id: <20220602115837.2013918-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:n9uj/wcEOptFifWOopaitigEcrv3wKxG0k5e3c8PoRgIJhpSjKx
 TzO30MOpWbjXPC8O/F+h5frH/s92hgOaDP3YNc27nEZaR33DcET6AIMDWtmXqSj9j0ZF7MZ
 iG2jjojczvYvhN5okE2u/PNy0ji7cfpspT9RHl5cJQeSESgxOnAIPzm7WpOsSZdjZR67Dpb
 VFhnQvgllBm77UoZ1GcGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3QQB8RgD9bY=:vbDiedLU2LZaHr5HUfjxzx
 aOHizySFZE/zHVM93dyQ4igU0imauPH4MT5M0FbiNhbZMQV81m6z36rIdmQgtIUVrXblLYaFT
 KHcwVGAnRU57a5x5Jan0EXo0v4uWng6wlqb6+xoTJiDnK3zgmsXWGNXNw2rOWxpV7MUFF2hZD
 mBT1yYqdMv9TnEwcpjp1ydwb86gLmdZiwBniKoa6fcyX21KRB6bZRVPOfgzJEPaCRSD/3c9T4
 sRerqegodwRaYa48o9pqvcqFl2qLf73ezCbdAfs4g0bZINKrcp1w1SLub976ywG57pdod3BSB
 vnnQtJsW0Pki+74/rJVAw67jHfh9sKhOxpDofDA0uRmBvkGlBAJH8PUyl4/eUYkORQoYgw7Ih
 OtXQ/d+XA32QIMgWkg9W+0A426F5WkU5YTL7gNnbfCgcfpucGuXuITOlAABHyp3ssid/dRYmX
 WVD1d71eFWS+UpyTERENVUoeCVnW/Ix7VeVEX2KmKuNYxDNnhHBJVh0IdAavuhZrKKTDrBCEH
 EWV1+0eji3dyJVjdpgBD66ouUUmvaak5vP24MMJ/NS/jfr5b/kvtybhcHjwdCiLNDGIWzpLHW
 1RZrtmkxzHjdHWNL/k8RbsdrpBm1LOLhB8c2uSyI62f/CJ6K5Auv17jSwufm3xLLP9FLYS+ul
 3flOzmF48kBOqE8bcdcQT1Tn4fsv9/k6sJ1VZ5GV6qphP1dD5CpdZ/evnR3qDKLgjHbnt9gTD
 MWJG6y9EWtngHmapCqWr65ZOHMUZRgKrnIjQSg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

TPF stands for "trap false", and is a long-form nop for ColdFire.
Re-use the immediate consumption code from trapcc; the insn will
already expand to a nop because of the TCG_COND_NEVER test
within do_trapcc.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-12-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index e9aa96d7684b..8b2157c31f54 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -3075,22 +3075,6 @@ DISAS_INSN(addsubq)
     tcg_temp_free(dest);
 }
 
-DISAS_INSN(tpf)
-{
-    switch (insn & 7) {
-    case 2: /* One extension word.  */
-        s->pc += 2;
-        break;
-    case 3: /* Two extension words.  */
-        s->pc += 4;
-        break;
-    case 4: /* No extension words.  */
-        break;
-    default:
-        disas_undef(env, s, insn);
-    }
-}
-
 DISAS_INSN(branch)
 {
     int32_t offset;
@@ -6100,7 +6084,8 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(dbcc,      50c8, f0f8, M68000);
     INSN(trapcc,    50fa, f0fe, TRAPCC);   /* opmode 010, 011 */
     INSN(trapcc,    50fc, f0ff, TRAPCC);   /* opmode 100 */
-    INSN(tpf,       51f8, fff8, CF_ISA_A);
+    INSN(trapcc,    51fa, fffe, CF_ISA_A); /* TPF (trapf) opmode 010, 011 */
+    INSN(trapcc,    51fc, ffff, CF_ISA_A); /* TPF (trapf) opmode 100 */
 
     /* Branch instructions.  */
     BASE(branch,    6000, f000);
-- 
2.36.1


