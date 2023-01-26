Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9E267CB4F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 13:53:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL1kO-0001xD-T8; Thu, 26 Jan 2023 07:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL1kF-0001sT-R7
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:52:50 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL1kA-00006x-9h
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:52:46 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MBE3k-1pWXoD44Le-00CjcE; Thu, 26
 Jan 2023 13:52:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] m68k: fix 'bkpt' instruction in softmmu mode
Date: Thu, 26 Jan 2023 13:52:34 +0100
Message-Id: <20230126125234.3186042-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3+zB/cqYLIznoZjkOG8e0ZZRUnhis5b3nviAwodoiOrHI5p/Lcj
 UbX9OoPJUdNybSrh+YAPUubFqSm6chLcs6N9OO+hdYsFekVNtR/QToFGDiMHs+3/L1R9PB4
 hSnxPa1Y7YJXSIQiot51PCQ5jYEs/tS6e/EzHx05B9XkvMh8hA3H46FPHC0PR5ygyNL0GfB
 gR9Oj0W6u8tXtgYn+sqhQ==
UI-OutboundReport: notjunk:1;M01:P0:RsEO8Jk6YNY=;zG/V42vG0YkbPJzao7ujFBTgmSR
 rk6NKzhra+ktSqmQ1dpFsuTaQ9SQqaLaAvVNfFca16rGQ1ybLyZmfJUgXZJjw1Ra8TCAvUV9I
 1NpzmHLYaQ4MMfmLwttbgyF46Nh1a+Uagg9su3Mhiy5JHyLnwDX6id6Q6HYImZnmvYncP+fib
 77yznylb0vgDxBAgfQnPAM6SCcIutv9tphJOgo6UuBfnq0n3GubGFmIYhnRROQ4YxSJPXZ0xP
 Y1L0HZBZfGUGrlAGbn8cLFueVm/swz4F/ebkJxfT7EoNLuldt3m7KngdUpO6T+URmGOSCD6TT
 NgxPGb/UyXj6jon5li6SDsdI5zca8NWxfnpmFh8zzgAatY4qQqk54rlwGPqxcsLU8mU/lhCAM
 R7fXjThF5e3o7FBrfT7km/ki60NB0GtEvlRQg6pmOhJrBXON9FKKdBIe0Vcb+s0NCuSINqsom
 87uAn3ysJ1/w6t+IYyBkcPFbaOvyt+8ZlE5i7Kqo5CM6tJZ1XF1cU88Yg5CxZcvxlAgcGiEiU
 mp6fzjS/Zwd9vyWp2NnIXtK5qNolZm55VKUQlocAGo/jH3Ciydi9ydvL4FBAjQkcY40NLlstX
 FyS2xdY+0qGQbNI4B0jL1B04UUOhPXoF6c85S9TuzSkA/dKQY/rtDTnhAyHnEogkBTvzO8Xyj
 ATJssrZGVDWhAxtxgYUdZ9bIPs0LukT9qedsYustcg==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

In linux-user mode, 'bkpt' generates an EXP_DEBUG exception to allow
QEMU gdb server to intercept and manage the operation with an external
debugger.

In softmmu mode, the instruction must generate an illegal instruction
exception as it is on real hardware to be managed by the kernel.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/146
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 18418312b14b..31178c3b1d17 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2774,7 +2774,11 @@ DISAS_INSN(swap)
 
 DISAS_INSN(bkpt)
 {
+#if defined(CONFIG_SOFTMMU)
+    gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
+#else
     gen_exception(s, s->base.pc_next, EXCP_DEBUG);
+#endif
 }
 
 DISAS_INSN(pea)
-- 
2.38.1


