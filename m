Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DA2DE10B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:32:55 +0100 (CET)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD4A-0006eF-H8
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvw-00033J-6P
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:24 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:56911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvq-00074M-8c
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:23 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWzXj-1kbD9w2Qjx-00XMWj; Fri, 18 Dec 2020 11:24:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/14] linux-user: Add support for MIPS Loongson 2F/3A
Date: Fri, 18 Dec 2020 11:24:00 +0100
Message-Id: <20201218102407.597566-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EjvWeq5wtv2u7gwt+VE/tzeCrjRn7we95o/YGLSe5rf1J00oeg6
 PUL3EgZ5rwx8bt8CEUMU/27wf8Ot/17B1t9W+DYKysNb9YY+zzgxpupigFqpIgJEh/Dvs+h
 kChbWppufCfaOcQQ1/bjXrWVnxIyAKkKO2R8VSfVPeFkJcFRafNfBe/YOmuyntA6CtYPE9Z
 MH88yHNmHmDnszN+jZy+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5NmNh1MMsYE=:C78dy8bjOhAxav9f9QPo95
 CK4hTYfTHhtTD3Ff/okMtFwsrvfgupxQKsupwuww3H1LRDNMiWPg32luk9uJVIu9k/9QqDcRb
 JAmla34Dt6I3pmT7vEENhLp1oduNC3fl32yZ11xAeZz9y8xsxXw5wLoEdPV1SsoBJpBuDyLEY
 fuwJu7enWjIoSMVEkoX6grYylTsstWECrhQ3+xB89+exmC9gXjbcd3cL64V2vrlcAznpCiESb
 /Hso18ebr9U92ted0NGLFgaakVSqU3H+euheErQTbxmAoX61COUrnjhQXhJzqDtbkJgazboa7
 0wpdsjPQnyNNFHgFNH14zwh4QBewyFon3Zikg4U3w6E/0AQHJhTqd+KDERgnHUZQHb+q05ySh
 PUQMdk0+GEWw3Vhn1KQ3xi19JSYX/OW71+dLOHCfpWQiuxLtQARWthX9mcDZm
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Userland ELF binaries using Loongson SIMD instructions have the
HWCAP_LOONGSON_MMI bit set [1].
Binaries compiled for Loongson 3A [2] have the HWCAP_LOONGSON_EXT
bit set for the LQ / SQ instructions.

[1] commit 8e2d5831e4b ("target/mips: Legalize Loongson insn flags")
[2] commit af868995e1b ("target/mips: Add Loongson-3 CPU definition")

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214003215.344522-7-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0836e72b5ac3..a64050713f28 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1024,6 +1024,8 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, CP0C0_AR_LENGTH,
                         2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
+    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
 
     return hwcaps;
 }
-- 
2.29.2


