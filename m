Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174353B8C8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:08:42 +0200 (CEST)
Received: from localhost ([::1]:37576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjd3-0006fk-60
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTR-0000Sp-4z
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:45 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTO-0001D6-Bj
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:44 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MEV7U-1nzTYI0gVG-00FxJC; Thu, 02
 Jun 2022 13:58:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/19] target/m68k: Enable halt insn for 68060
Date: Thu,  2 Jun 2022 13:58:20 +0200
Message-Id: <20220602115837.2013918-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WE+vm4POpxuT/AcqBQKdjScVPfqJyL364Er30eYxC4Qpp7IR1CA
 Rvy07CYmmu/y9AscIw+u4e+d/2LIqRIkQuS+6eiovgH6gp/C000/Ebu5WA8ZaUfBNNunoNl
 lxsA3JFpe0qfnNPFMGeX5zYBqGmRbWk5zUj5fRndH586b3q44jVRWtMm7QgjaZVR6gZb2Ph
 WBbYiDGs9fJwtDsfIOf0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZjoRdlo9Ows=:rWADOVKFsyfZL2DR+/zrVf
 FzS1DSOXwsnrPz7hMRmjiFt5kxMKDgKFL28zoii8fL9hlZ+MfMy3J0spY3MPm1fyLfy58aYjf
 V+Il55MqC4Y2kd5pNKVuwq9k1i+WJIgtrxFIChZAaAP61Hi+2fvwHx04pRJ2MVR44osPkvbgP
 ILq/QBwWoWG95RwvK86u5DFaUbwPpPqN0/f3nKad/4oxW1lIyV1zHcttTlQzpztz2j7Rqcqn2
 sJWtZi+afK0bigvUSe54MjhgTNYwx3OuRstrbRAdbJ6TJgzsukEm1Ma+V0DF4LPmejWN2x3On
 H6z3vDcamPqn0ibJ8sUAh8Z5Af4Y+2et4ggPhvmeWcGb/xIid0bwDbXGFCJXpYhA5C/T/9D2H
 anwW5jenZ7ISWIU7ixODizruXdbDsj0dk7TFhAzygCt7qL6nAQdwUr3hZ0TF64AgRi97a5dVv
 r7V4Li5fAE88INBYQsNUPXwncbUUz00IVCXkloJGE43hbn7apPHUh7VUUhjAXeUtRds/BfbNY
 XFSaxRB7SUp0SczwTWMgHwd/sdPP1r91NXthz9u6QzuOWF34TLiPX6EfWeuyI0PjzjVQ+KnXm
 TYrWa9uG7BCo6tJsR8sXamGEXHz4VRi8TEuS1I553ct9R/KXdPpwGcMytZEGAqGe9+cL7P5gU
 bQ6gbgO0ih9C3oTduov/GTAu3gK/Xveo+ZleTWvI8XR4853MbV/mfJKzLDpNR+b3g+BSokUc/
 p85sbqSfLn6kmkXLDgbUNJY9yM6LN7KwHKlCgQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220430170225.326447-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 4026572ed83a..e4efd988d2db 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6003,6 +6003,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(tas,       4ac0, ffc0, M68000);
 #if defined(CONFIG_SOFTMMU)
     INSN(halt,      4ac8, ffff, CF_ISA_A);
+    INSN(halt,      4ac8, ffff, M68060);
 #endif
     INSN(pulse,     4acc, ffff, CF_ISA_A);
     BASE(illegal,   4afc, ffff);
-- 
2.36.1


