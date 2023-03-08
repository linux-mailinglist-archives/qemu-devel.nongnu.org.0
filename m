Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C036E6B094C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:34:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtre-00020l-Lo; Wed, 08 Mar 2023 08:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr5-0001kj-6q
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:19 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr2-00067e-Oz
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:18 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M6VNX-1pcNlJ17X7-006v4Z; Wed, 08
 Mar 2023 14:29:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 20/28] linux-user/sparc: Handle division by zero traps
Date: Wed,  8 Mar 2023 14:28:49 +0100
Message-Id: <20230308132857.161793-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jx1dbuJkZcVQm+wcO1oYS1zmFQF0plfgeovlw/wxXRh+LqtIiRK
 92mEEnGmv7EiJ6e4DFVebex56auYdZHh37yg4iomlx7ETkq1FeKeI2pf31mmMiZT5B16UsE
 X4akwDl4rU2BwQLThUJ3/rO5OS77lRbv+NOOpOboFrJC9+X8X4jSv9O/67GlO1BwGxHpSTR
 45Q/Vqo3qHgS4k/RQ407g==
UI-OutboundReport: notjunk:1;M01:P0:UOBA8DhajhQ=;nTlcw1TbnJvITwKeuoHlkmM1ZIk
 FYsL8QvJi3d29MukFcwKiNCfHh/P3hKnITbu3Md7b1QVJZ0H/iNQWMM/5Q/X8kGksi1bjVQjd
 Woc9XLgXvG8oVbVz8ChKMppDpsQMVJVRcMsLjKLIPpwJb2G7EXbz8b8spay7npN2MKkNbjX9G
 4xSi3mZWiiGDHWKgaHdavAVTXZeEYQIoXYE32j6r6InEn2BSGWW0Hnz2sEzL/iJZidUP7kO1V
 Ld50oTnjWQ9v3dg+PCgr0lHDA708y8myBJubyEZ9F3MymIfmCxd9S7d+IGUQB76hnpVjUZRtp
 iirzFYFMVen7OFs7Qkg19eNVMkW/LyPwYCYlPziz4+yiSg0qy/+y01s6AXc7fY2hdT6WL+K2B
 cV/kfkLk3Aqbram2S4dvK220jvoHCBbs0panfiJ0IhAbs0OtcIW721QgAeFp3r5zJTx5eCQRa
 L2xCf0tnCYJlsunQZpCsawpp8nw+58y9HL3E1UT2DjsvQLqbiPj26Xubyx6+e0sE8JqMfzYV/
 KvaKthX0QhhfzqTJtcDaBZepKqbG7ffLFvrOvel/jCIeP/tydAj45DcF3xycAgInyZKwmW1qh
 nZ20vaq1BptPg1bPrRk76zru/7oYAF09K2ELiT8oe0ptC0np+ZABBQOcn6YU8+tD0r1EsgReF
 6Rk1Rv8/UEnnNHBbjexkyKb6bCiNb9WovjVQmYJiXw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

In addition to the hw trap vector, there is a software trap
assigned for older sparc without hw division instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index c14eaea16370..e04c84286769 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -211,6 +211,11 @@ void cpu_loop (CPUSPARCState *env)
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
 
+        case TT_TRAP + 0x02: /* div0 */
+        case TT_DIV_ZERO:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            break;
+
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
-- 
2.39.2


