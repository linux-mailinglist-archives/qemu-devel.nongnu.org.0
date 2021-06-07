Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2139E70A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:02:37 +0200 (CEST)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKWC-0004WM-Gg
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRS-0003fO-SR; Mon, 07 Jun 2021 14:57:42 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:36973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRR-0005mr-0L; Mon, 07 Jun 2021 14:57:42 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MoOIi-1l1qOo1rC4-00orki; Mon, 07
 Jun 2021 20:57:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] target/nios2: fix page-fit instruction count
Date: Mon,  7 Jun 2021 20:57:25 +0200
Message-Id: <20210607185730.346641-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Qti/glrBGreblZP2l7D4vt7BXufqSCEhA2CneSHO3YIK3wSgHJ7
 1hhvqbI0PdpLXR1CX7UMXCEoQPoICXGbR0wPVeXr+32+bU1SSzsIHyh7C+4xxReNbObIV4s
 Pu0Ff/OzGc/LAlixaaSH1513vp7Njthqa0LEnruNT9nniCSPLTguQXqTYTG8sL/HFN+yW/U
 ZtAz7MXolds2PYFUyZswg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X2IhJ3l9ZmU=:sIsIGbTeg6AI84OFu6nF9l
 sdO23cXN3Us5M4u9eNjuFj0C9wG/c9bukLXjqHXYpZ93vhSirM6EHX7rgZP2sSB2cRCCYZiW/
 XiVAW2S5qsybm8kWZdJXY85YIlnj4iEZSJgBfb9h1YFtg2fSXGWRlhdFDwZJVdqNAk5GuONrP
 Clc7ETsr9TXM6kEBUvwDh8HQfNnJozDaVGlzWUA2JC9nNQoDLpQ/ErKIwJBgeBQUTsVlyt5Ra
 /MVq5k42ZUcgfd1NnAU+R+s0pErGieFDcWvhJ/5v3d3G2/jmA2rBGwaBPwd77DnW5IdI9rxMJ
 5N66ZjWcrurAv+SW8R6v2bIfUKIRVDLLKSv2gDw5HMARwABmt5C0Dp+rvKqPBbMhxocuuI1LR
 YTXF32GyfAdb+YUm4p3Wvxx00J+K/8bt+gSAIwaIEgeJPc6bFqEI6Hv91ZLkwJbBCjb7LXQi8
 5HjM2nTNVe5TXuNTOxlKA+VvYOlmT0s2yfWjBh2F3zEYtnNatkHbejqU8a9deOjdAGu0n0TAZ
 SpIDlHIQGBC75R1dew+1uk=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch fixes calculation of number of the instructions
that fit the current page. It prevents creation of the translation
blocks that cross the page boundaries. It is required for deterministic
exception generation in icount mode.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <162072241046.823357.10485774346114851009.stgit@pasha-ThinkPad-X280>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/nios2/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 9824544eb37c..399f22d93862 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -829,7 +829,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     /* Set up instruction counts */
     num_insns = 0;
     if (max_insns > 1) {
-        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & TARGET_PAGE_MASK)) / 4;
+        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
         if (max_insns > page_insns) {
             max_insns = page_insns;
         }
-- 
2.31.1


