Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEBC68AB1F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5v-0005H5-PT; Sat, 04 Feb 2023 11:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5s-0005Cg-2D
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5q-0006yB-Hl
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:47 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJEpp-1p4L8J1ZeN-00Kfzg; Sat, 04
 Feb 2023 17:08:44 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 19/22] linux-user: Show 4th argument of rt_sigprocmask() in
 strace
Date: Sat,  4 Feb 2023 17:08:27 +0100
Message-Id: <20230204160830.193093-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tOI2mju7NIAhX6hl2kuEotCFKSmkVA/JtAdz85PuDtJNEEc8IJU
 ceZVUAB3cyMvDBQmyMrWOQADUzNNiWSYyzd9mb4CYthc/2DWeApAg+yZ6NoUOMVl979W4jI
 ZDks3/DNBs0EnGfhNkmW3SzPsR+ylU0HQY1zfm9g/3CaH9Mh9Esp+k5ShfiBemGmsbCvL4a
 DMY9/sX7m+X2eCtmJZgRQ==
UI-OutboundReport: notjunk:1;M01:P0:nTAo7mFKjY4=;osCQhXIfTQjjTq0IkowqAcSDCM8
 7X/dMwcWYqnOI2VRyXGkMapp6uaeoNcx4PRU+6uPuIt0taZvQkKOO76ojh+YbsVnrIBxKZNYK
 G9ITC4HJ8sgYN98gevOYD9aKwTSwrkfVxv2HxqPr1vBgOs4WzMjwn8rlFIIlr0jsSRA+eFjNx
 luCiHPFfUOUhirNcC3E+5YzH9gw61pbaLaUGA1U9dPhXuhsqo1nJtANaTI2aaJn2Qaeyc2MtE
 lI+hD9z79FaIE/CWvQXpA2SvDj17M8PjP5hfnh+YKeTiFqulACqvo8prktCeaXTfLgPU2UMFY
 w/+CV6zNA8QpWWWYhYCjEDxTxE9h7uiTeOZUuVvUe+Sm9rX5rIoheoYs8KkvPKMmUnxYbmmCi
 r8Qe3zhuQcqgPAPvj6cajEbYJlypJPpTiMdgFzIq+de/YHcojlBlPixpZ10R9bCLsyK9vYr+E
 gxrUPcB12FLvaueCOvzPW+JEg5h7so5vchGSDVQzneSSgaoPEV5SodbCbLByMz9IrFceDagbS
 kN50fMaLvWU46nppwU+5Pwn2rRhd26htX4eGE55XPzBD6Ih0IXOEdpO0iR4RcUKoSmaT2Z8uY
 MQn0zJQMA+WR740mzSC6eabTgNFfyKqBYSg19vMNuIAgUMqwT11tM9Lf1a607wJ02qVGRFKnU
 0q2zraBOxWShJU5xtkiZkezlV6uQNETOBVPfBpGyvQ==
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

From: Helge Deller <deller@gmx.de>

Add output for the missing 4th parameter (size_t sigsetsize).

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <Y9hCxdvdM1o+/iHC@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index f38227ba5db5..340010661c4f 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3224,7 +3224,8 @@ print_rt_sigprocmask(CPUArchState *cpu_env, const struct syscallname *name,
     }
     qemu_log("%s,", how);
     print_pointer(arg1, 0);
-    print_pointer(arg2, 1);
+    print_pointer(arg2, 0);
+    print_raw_param("%u", arg3, 1);
     print_syscall_epilogue(name);
 }
 #endif
-- 
2.39.1


