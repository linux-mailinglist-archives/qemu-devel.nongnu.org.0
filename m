Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C316B53F1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvt-0008J2-0l; Fri, 10 Mar 2023 17:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvk-0008Cj-3C
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:40 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvi-00031r-EC
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N1PLB-1qXDKd1EBH-012oL2; Fri, 10
 Mar 2023 23:09:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 16/28] linux-user/sparc: Use TT_TRAP for flush windows
Date: Fri, 10 Mar 2023 23:09:15 +0100
Message-Id: <20230310220927.326606-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3osgtKUSUE42GHakZ8Boh8BAVEX/rtvPKEe1eY0917jIuWA4uHj
 R65dZrqQR/7c7w66SR0utsCOPurnt2TQh4bUVDecxuQDAxR1wxXLDBGIgeqkXKNrReRtBPM
 qbMtL0g3TAx/ZrR8ovxNwXQM8ZOfoEkrOmabhbVkkgdQejUWZbITkO4IALqwkUIXTsUjBCx
 ZGkE+nGyRnc7ZO51msdCg==
UI-OutboundReport: notjunk:1;M01:P0:3bvzu7Ljdl4=;DeIoEthcNAO7UbFpNjB7U730qEn
 H7MR6iNdmASDXuGVEaT4pHWlZ+gdZibCdtF6CVQ6vtpRfhyhfkMKMpwD8bP80MWtXGkEjZQl3
 wNRHCjvm7Zt7QNp54g5SLoajlX3PEzrXhPMZt+I7Cb0vz8+PFPLxpC6rC98ihDq7y4vLTZ40J
 vRI8Yrc5/JsSci8Tmc9QR2Odf0ZVCHy5iWrWCWWbepE5SzA1GIwNur2+EeDEwfTDEctzEKbOM
 5FyP0iZ/R0b9kaXRJIUHAeF1LilAE2t3ThhTBmeUZKYneWJh16Ptv4xzVx/VFwQPEX32nz10B
 /RDeviqdRBMmN+BNKcqKsv8zMjSrd3VcvirpKSD49DzePneiCcXRB5qtY+c99Qj0PnnHXBj6B
 QiQf505DWccPV5tTsvaOn1fG/mxJUEcMvr/TZZj55NdPpxUtwasbkFZtHDlLJl9xxBzFNkIuL
 kObx2vgWIpEEk9ZhlcP55yE/639dBQ2SlU/xtlwDEPnvOiz0BvXF8Ij6ljwiD3RLZ7laHDIzr
 jIBdS9H+OhFyavz7hZE14sV/sNNB4/FuuW1CHxsqq8NdMiON42RpWT/3of2zwxyF9OduXD3bM
 5rxYo4uG9mLqaBeGC+Jn36lzDOWxeikf2f1eYZI2BRkBHNKLAKI6gPs2/RnjUtV2UWYUYtxyF
 bTzbf8V3dHMSJTPcEdxz/5F52WkaaVal+JvzXmjZqg==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

The v9 and pre-v9 code can be unified with this macro.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230216054516.1267305-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 051a292ce520..e1d08ff2045c 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -196,15 +196,14 @@ void cpu_loop (CPUSPARCState *env)
             env->pc = env->npc;
             env->npc = env->npc + 4;
             break;
-        case 0x83: /* flush windows */
-#ifdef TARGET_ABI32
-        case 0x103:
-#endif
+
+        case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
             env->pc = env->npc;
             env->npc = env->npc + 4;
             break;
+
 #ifndef TARGET_SPARC64
         case TT_WIN_OVF: /* window overflow */
             save_window(env);
-- 
2.39.2


