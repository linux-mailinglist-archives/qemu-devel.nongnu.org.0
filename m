Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9225D588EFE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:58:33 +0200 (CEST)
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJFpQ-00070Q-Kj
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJFnJ-0001iz-MP
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:56:21 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:53027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJFnH-0005qt-R7
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:56:21 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N1feo-1nHPlv32nQ-011waR; Wed, 03
 Aug 2022 16:56:15 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/3] linux-user/flatload.c: Fix setting of image_info::end_code
Date: Wed,  3 Aug 2022 16:56:11 +0200
Message-Id: <20220803145613.428167-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803145613.428167-1-laurent@vivier.eu>
References: <20220803145613.428167-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Lr7n808hpcUaD00oh3QJaa0FHLrEXBFu0/qYupJX/lfoENFSvsG
 FW1lGgVsNtKs94qQcsef596rHW0tldUQU30gMTpS9qxtmyEaLrIiAsAkk1sR5XKLGMePLP1
 MzWq+Svd23P7Dn61JthcPMxSf0RK35MbNomZJQ0bKYtHVY1fxNUphilHAhjwVqEDS7licPu
 qFq997PMeuQbnrqZHCzfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:99P32HVzIpU=:dTTA2QnvRzKMiJap/8bxX2
 YzUxrO93D2S6b/r61jSh5qj/AhNkyEQpbmxPGQMe2TwrKegPFwIDcqx72JwA/fvyEEvv3LK3j
 LViSjZ2IcJd5071rbO+vVzEohscEUm+5sWWmX1Iry/t5LtlWokj4X0K0a6cX53uE5I3WMttPX
 MkmfcbR58Sw1m5LRtlKWhC+UOtFNRo9cQr32j/eB//zUBULnqExCuBfa/1KvEur7xq6IgkgdN
 r8q2gx7ZKh3ALBIZDGqzhjD1FIySxgregcGrV7NXi/D9q/9lWdrHuK0clPf2S5MYPEXk2X2Wx
 DnKYQMKZfi8/Y602DzGzdYA2gMsgRP3kyegM1WsOdKYPmyaBsYi222rvvVZDmbblgh8Y8ATtk
 GoCqxgMaxPN06STgAAs1TeQ8Nw3B0lgxooPEP+07fD9E4H1wvxaqebbHTjJiR8g6xfL8Nnt95
 rfAT4UjG7sPDhkhmFYb+gQmhJu8/0HtGPATOC1XIY5QRwG+efpN/vhOO5r4UNt+kyB7YmLMok
 V6xT4T6GosY5RY5WsF+CXUzvxiO8fhPQ0gjD9EXCRKqy9KpeBogrDXnXldtk986iKdBj/gCmw
 yw+e7kwZXORC0zMXtJ+trup0Fm9PQYvn1Y1daEB5zvNWoydBUUTbRE6M6WrtnXWndrHIiQ6sw
 CiG3Jpt2coqP6J7gkUviYhALJPXCfBmt9Fj3PB0irX6qjok4WpA61ZFfKJgD/w5eiZ0BmqE9B
 N60ntL5lsB3GYyUdvz55wSgmvgmKZs/aJRHQ+Q==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Peter Maydell <peter.maydell@linaro.org>

The flatload loader sets the end_code field in the image_info struct
incorrectly, due to a typo.

This is a very long-standing bug (dating all the way back to when
the bFLT loader was added in 2006), but has gone unnoticed because
(a) most people don't use bFLT binaries
(b) we don't actually do anything with the end_code field, except
    print it in debugging traces and pass it to TCG plugins

Fix the typo.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1119
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220728151406.2262862-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/flatload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index e4c2f89a2267..e99570ca182b 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -808,7 +808,7 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
 
     /* Stash our initial stack pointer into the mm structure */
     info->start_code = libinfo[0].start_code;
-    info->end_code = libinfo[0].start_code = libinfo[0].text_len;
+    info->end_code = libinfo[0].start_code + libinfo[0].text_len;
     info->start_data = libinfo[0].start_data;
     info->end_data = libinfo[0].end_data;
     info->start_brk = libinfo[0].start_brk;
-- 
2.37.1


