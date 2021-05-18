Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84663871AF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:15:51 +0200 (CEST)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lit1D-0005Dx-0l
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKr-0007n3-KK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:05 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:50985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007AO-2f
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:05 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MS1G7-1lt1bF3Cgd-00TWmj; Tue, 18
 May 2021 07:31:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 42/59] linux-user/s390x: Set psw.mask properly for the signal
 handler
Date: Tue, 18 May 2021 07:31:14 +0200
Message-Id: <20210518053131.87212-43-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qa/fa58/7CVeW+epwnsmG7QifkNJtcfhsspWlN1R1wbYIPDIs+a
 Qs7EOKsmJoryGsQW/MZoDA7usZ6cCnQTcXCIfPZ0D3tktQvOQ8FjmZdKndR9vff9WvOyJ7S
 L6krUKM00TGuc60ZCnqEibQjQ2gUCHq7/ajjVYI0FMbfkwiVCO7ZuOtDqMhrFll2D9M1nEB
 IcCK5p5FezP3q6Gbph91g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FZGATEnyljY=:GUkpQOmk1lODYOzcGh/+Tn
 SjVMLUHVTdk/ZCDhuGyz2J+F9KBfEUXKfV5Dkps+6HQxTGZfTCxjkuAI0pw4NHRA1ZUC0X6GU
 xs85xbI3m+9OqnvhzpfCDAHfCkwy/iaKZFhqsFxScMGyKOu1mrLdkFsMFhVLyOxErOW/zL8D4
 Omsv0zglZXDF0U5jcA4d2afsSdAVwg5WsDOZhDfx9VHX4Tqj4WLOvKBuJ4EPuWJRHebkDk0HH
 CGI4/WpmtI+oiUS2QP40f8YBkfrEkBVFWRij09f808c/1PZYsOxl0IsbYbh8yrL+uf7b8Cyed
 X9QzYsGGgjfw6vVavJ8WPuIraYi7Sxo1/f5VZN6blRo/5si8cQVa6s++29ss2ndwNXDUusFmT
 Z7BrAeq3Dr9AyDN4emi7rc0RiRT4VaBvbQE8onT1NmpgcR4MrRHRaRp2+o67N2H0DzPlkEl2h
 vOM5zU12hP4aMN3K57OqSfPBDTSxXKmokmRG++xTYiPyMZOCGugzTbcDeu9WBH1rR1AO8NZq0
 WWWk29Vg2zbnsFivkhiY9M=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Note that PSW_ADDR_{64,32} are called PSW_MASK_{EA,BA}
in the kernel source.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-11-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 64a9eab09770..17f617c65581 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -162,6 +162,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
+    /* Force default amode and default user address space control. */
+    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
+                  | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
@@ -215,6 +218,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
+    /* Force default amode and default user address space control. */
+    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
+                  | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
-- 
2.31.1


