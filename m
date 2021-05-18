Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E138719F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:09:15 +0200 (CEST)
Received: from localhost ([::1]:54334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisuo-0007LD-IW
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKp-0007eO-9u
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:03 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKj-00079s-18
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:02 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N4eOd-1lIrRH3X1z-011mCv; Tue, 18
 May 2021 07:31:53 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 38/59] linux-user/s390x: Fix sigcontext sregs value
Date: Tue, 18 May 2021 07:31:10 +0200
Message-Id: <20210518053131.87212-39-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K2cnqivSXpqMREgWAmXvvGKJ5rlVPDroJhh3o7GNj8qZM7Vq7Ga
 Em7WhoLtChjTUXQ9T/CeR/7jgNJcdfkzfXmrWp1KbNWWzLFr3DoNj+FRlqMjvS2uj/BsH5E
 Vy12KqojlJkdsXTUGcjpzGdu5GNZYECwYcqwZvKqUPifx27ICjqBcyxecdasSNnK5uz4HQP
 z+B1Ei5HfISb15hlb4ATg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+s3L3Ny9Xxo=:b4r0zBPkUl5vHVVdUZC7td
 WDB+Nsip9FQusy+Nev3oZ3xgyRRaoLh3L3Xl413Au1pDt610vZPFLXNgJW1c7pvm97Q4oRWZp
 07/ZG31wIW1CDVPC2p3GTYX4rfttZaZs0JZW1ZOWXvrfpPhNGt7HXAzfg/ICfEDmSOcTvNrVX
 c72q6V5BlnJ/0j7zK1TR5lgU3mzqdklr5EiE248SA2X8DUECHn08NBzIsn4GLVAcfPPZ8ZkJs
 S0epN/gzIFWyMC6/SwnDcJLKnNDDNo8PffWbznuvQilUgKSeDOZ2YT/ftJbjz9+GLJnoI7Vgt
 JNKNKy9t4+eBctrtYEBFRxYzfL867kqGDJffeEjDSSDjnVNH29mw45J6ktqQuSqxm2rf7QQwl
 tRApTv/z+IMkMZDA0XAD0x2b0HEfvKQRSmeyOxOhjimmOB2byxEiI0wP3ZcdznM+dXfytQDUD
 E4xsCl5+FXKgcfQ25YUcXMqbYXgK4PdYJNU5T9czgoOrzwEWml889NyrMxwgwNmfjah4rvDJl
 0c7L+/IaMSLvlbXsbXm0uc=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Using the host address of &frame->sregs is incorrect.
We need the guest address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index dcc6f7bc0274..f8515dd3329b 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -142,7 +142,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     save_sigregs(env, &frame->sregs);
 
-    __put_user((abi_ulong)(unsigned long)&frame->sregs, &frame->sc.sregs);
+    __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-- 
2.31.1


