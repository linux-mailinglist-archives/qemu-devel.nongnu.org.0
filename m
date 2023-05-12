Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333AD7006AE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:24:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrN-00062Y-IR; Fri, 12 May 2023 07:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrL-000624-RZ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:51 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrJ-0002PL-HO
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:51 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MC0HF-1q3BUs21kL-00CPEi; Fri, 12
 May 2023 13:22:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 8/9] linux-user: Fix mips fp64 executables loading
Date: Fri, 12 May 2023 13:22:37 +0200
Message-Id: <20230512112238.85272-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Abi2VJYAiPvO3Bo9u7tHPh5g20oYvFmbE5FUTROq+OcAgFhHJkZ
 VyUG98nMXyuN58stbpVJ5ZmEm1CajB/Ob/BcehDeuPH4ypBNHODVRbunpU6gwF+ZA/oMsQ7
 s+Dnpwlz4HH+0PFFvg73eBP5fJGoqRBHiQ8k3R5dkIEkZmQG20xIuxcDPwk3VFYRN3sprgm
 8lNiE8/bAxI2ZplE2IIxQ==
UI-OutboundReport: notjunk:1;M01:P0:/jssH677x9E=;MYVKNXsCnQfF9ebryN5Sld2Va9A
 YQN3OKLRtSLPZ4dtaSrTo2C1kwFV5DZ2875FhFacRPxYjoYOu3f+Hl7ypy2FqEcnERGcePXie
 Fq2frxKFjLeGzlMpwuLWDO7Ql+KNpF8186LPDoDZBCtomQg+6g2NJcJ/8P7JLJfU+yqKQmCuD
 KzmMPA/VlOkg0KvquvGMrzK2GFvDkQifH7v5bh0inxlhesdmxo+1M6dDhQaZFov5M4geyYTmL
 N3rFxcKlUyhQLj6zZBN+BbzhTOFPxiCD2gGAspUFaUJUHqDFnTnviuhUPNgthflIs26m2tXCA
 ZXuOKtJNUlqP75I7P6ZL7hoinvaJthLUux4HZTKm+f1uyjK1G/eI4XDFjad9/s6PB14RnqchF
 L9ZJOGebDxixuvNJBH2jKxUS7bmbSW5KZAhgs7dFC3rZxzL14LyjH+MS0g7mCqshLOI6xxRmn
 wjf+H6BFDsihqCAWwaWTqFKmtMEjadcN2GrbDv2cZDLf9ObsWMBn1becuEa+wLsOPJQy9MvM4
 hWRYxcF3sBnIEr2oPAgPrjxKCtvKAgPVBVKEAmisux5dcrJ8jz4WENDaAhNRmCf9SO8dAn2+O
 mnk1hMPplC6FphS7fB+mKP2vT81qEeMsZbB5eFndiNGkIwjSXiLPyZ2wqUE/7T5S4v/oDQ9Z5
 wp5z6N0hKdkyHU4wzoHxtZDJMe7Om67pD1vJpf1M1Q==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>

If a program requires fr1, we should set the FR bit of CP0 control status
register and add F64 hardware flag. The corresponding `else if` branch
statement is copied from the linux kernel sources (see `arch_check_elf` function
in linux/arch/mips/kernel/elf.c).

Signed-off-by: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/cpu_loop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index d5c1c7941d34..8735e58bada0 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -290,7 +290,10 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
             env->CP0_Status |= (1 << CP0St_FR);
             env->hflags |= MIPS_HFLAG_F64;
         }
-    } else  if (!prog_req.fre && !prog_req.frdefault &&
+    } else if (prog_req.fr1) {
+        env->CP0_Status |= (1 << CP0St_FR);
+        env->hflags |= MIPS_HFLAG_F64;
+    } else if (!prog_req.fre && !prog_req.frdefault &&
           !prog_req.fr1 && !prog_req.single && !prog_req.soft) {
         fprintf(stderr, "qemu: Can't find a matching FPU mode\n");
         exit(1);
-- 
2.40.1


