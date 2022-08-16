Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B4595467
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:03:19 +0200 (CEST)
Received: from localhost ([::1]:41136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrXh-0003Az-2F
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oNrSy-0006pF-FH
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:58:24 -0400
Received: from mout.gmx.net ([212.227.17.22]:38953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oNrSw-00081Z-IX
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1660636696;
 bh=gYB4tfK4sDeQ493Ds37fCgT75bc/wAEDph8KifAoA3I=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Hrut3FKNG6dBSPre2/pV+79Xx5qKF9+Oo8GTGND0G6nJ8pxwapyECCO0DT3yXWSLJ
 e6x8N4WMw3U/PYndPoFwBd+PB+jvQ8MrWHa4fvrgJ5acob6deumD8i8V0FYrPS0QWC
 xi9zVoGYz9/C57l8+GNJ8m/j0aXddp0XahT760vA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.188.167]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1nzKSX1Knp-00Ob7H; Tue, 16
 Aug 2022 09:58:16 +0200
Date: Tue, 16 Aug 2022 09:58:14 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] target/hppa: Fix proberi instruction emulation for linux-user
Message-ID: <YvtOFsyXzI/9646O@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:7aeteNK2lZXJd8ab53LcmDqu1YUp/VrqpErl2kQK3NsJ0yv9lNm
 PZl2ukD2JU17GsUApi807zYfX0uQvL5Xlk+80asUoSvtq+bSyFxtUXm8aOXibPIo55gHiOZ
 urZb/GS552SigTjkkemZoYM+T9BamyTYdoAuYvuiQCxyyUPAAqw3RAYD6BH/ubO6b3XdlYT
 cqiWXdnUDGDmU2+53epPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:thqbzlIIGOg=:dXgNfGHKQp0NsaYC+egkmx
 ZxM3jFE/uCByLSzPhpoAY6ShaMpfI7k8uNnd81ohK1eaysfgEBWG8bFV6dofJF2A9bSmSqdpT
 E1gnrE1O8Pryni9wrj/5Ga2BtksFG7LZKmrqJLzmaNN8+hXgvY6S+aXnaEHz8flYxtbHaTut7
 /uxDsoYiGU7einmAI5Z+I25UOju/oYyrmWjhiZWJYsvi+5e8mnn/Z5ATpu42p622oYO6HM06J
 RYoeUgb9mjCBh04D5RdJT9ItQrkCMG6SiVbaivepc79qBAoLMpIitXbkJhg02Qeh1bgkhQITA
 xTS3YI8rtqF1jdk4tKAhXqOh5mRembTU7sp17wVJXaOI+rDtf2nbm5QB15P1WmS6ApTTox191
 W/TPhJYPMjARYfM8R6NwFRKdTMdTJnk+q4uD+67S5D1Zl31AwhVB+WWF9/Sahow1HSXttfbE3
 gfP5Ot92riiXO9c2L5x0spQxOwyEq19LehAjfWfWU+22GLpUxcgfM4lNLG2TqPeOcB18ugsl6
 AMFR0sfUMSCHPtkI0lDoTUv9509NzcX1G5/xiBLjXnsSVNSwgL6Txui/1UdeD8GUIOTEQmHgh
 gu3SC4q2eWz4pQflPoJZ4N8gn4fU0fWbIDCKWU/KBtlVOITzvtFzyHWBgvieT8V2kjD0L1rAX
 +/KxQ9K4A3jaV3iVnqhqKQzMi2TlQzHe34UsqkFIKl7nIgeQp7VgcW36aqmyBSx4fvE6ipNim
 nT6+FxCm4J+NdN/DfBxjAycR0wsuKhYk1nU0oXRL3J0VwCXsp78zzCQH0TIEj2R5+qAZd5Rhe
 DATls9b+EYjlTerZmTTp2QSSoanr70aUAiYLp7IqXDJ3aSQt1atAe0eolq1G0kB3UxZPpbWmZ
 jcNWj9cVVXo3QqhAjvBujP1sJ8m6mhcmdr1sF/dm1qvwbt6l83BbSd8kZ1cYCCCpYhF2EemSi
 AuBrkdfAc7GArF+TpLnzYqGgmGS9WXYpLQcCqOdBwdfNkXAUMdmedg86OWaw0bfYRYMuEm8vf
 yyeq+ZhTUtb8cdKeAJpeIjOs9p8rmiGGl4f48nzQz+dyKAc8QmSKhK2ij2XP5tBtyIHMrwnG9
 4FKOf6Orug0OEudDTX1isSL9z16ROHzdIZu2v6f7LNjB7E4zEYjGheOKQ==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The proberi assembler instruction checks the read/write access rights
for the page of a given address and shall return a value of 1 if the
test succeeds and a value of 0 on failure in the target register.

But when run in linux-user mode, qemu currently simply returns the
return code of page_check_range() which returns 0 on success and -1 on
failure, which is the opposite of what proberi should return.

Fix it by checking the return code of page_check_range() and return the
expected return value.

The easiest way to reproduce the issue is by running
"/lib/ld.so.1 --version" in a chroot which fails without this patch.
At startup of ld.so the __canonicalize_funcptr_for_compare() function is
used to resolve the function address out of a function descriptor, which
fails because proberi (due to the wrong return code) seems to indicate
that the given address isn't accessible.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index cd304f051e..fbd80e4248 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -170,7 +170,7 @@ target_ureg HELPER(probe)(CPUHPPAState *env, target_ulong addr,
                           uint32_t level, uint32_t want)
 {
 #ifdef CONFIG_USER_ONLY
-    return page_check_range(addr, 1, want);
+    return (page_check_range(addr, 1, want) == 0) ? 1 : 0;
 #else
     int prot, excp;
     hwaddr phys;

