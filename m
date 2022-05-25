Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA072533AF8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:52:17 +0200 (CEST)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntoci-0006L3-F2
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRz-0005nE-Aa
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:11 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:51231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRx-0002Ff-9m
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:11 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mv2l4-1ncQ5W2lTE-00qxKu; Wed, 25
 May 2022 12:41:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 6/8] linux-user/s390x: Fix unwinding from signal handlers
Date: Wed, 25 May 2022 12:40:55 +0200
Message-Id: <20220525104057.543354-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
References: <20220525104057.543354-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zlaMkugIeztHuXgK+DK4TY9xoeK/gHxUPt/ojG/yQIHlrt15CRf
 o2ehMOJA3yplLB0VKotSZsHXmLjYmIN0gf0236NZfnIHSk6kyZJzIm9rdqCSWItBkzpHVms
 DmRm4OK3jz98ezh4boxaq58pIWh2GPDPSQ2jvpP29x1syvURxxZ5dCrACzIUo9w9ysPqGVO
 wloyJyjwdO/b1SO0WjkLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NbzMt8CTH2Y=:bUg4K1pQgJvb7etBKuhg5R
 UyGX0B0ZWjcotFyYwWNNRz9yQjEczTkjMNz91o+F25eFEsJwuAEIHkDhUTItXESGh+oSZb5s1
 /BoDATpnAA/zUNWdhbmBa3CTTgU3qn6bd4WB+NF7ogUgz1n+YDhJGPzQyocolcI/i1huCv0e2
 O53ZViAY1EUcRaf91txyN8mJj7kZ+w7xJlasmB1E9ZQkJtfROZ8UHzD4sA39HRVn2lsF7RGft
 03ZwBCdntjlWA9gTU5NBuupKZMxxgy14mKXsGCfvMMd0RAjJdcT9AQaCjA7FbEw6KD48+2gzR
 t4gWbR+YbH1aNBIqfFScSTeZi+ufJZ13rmlNBhiL8S6t2bMQFRkWJnfOLj8azkpwHgdAFgMRT
 YYUQH4vHjaL+82CUcAUy4KVRW/zgczYCgVOHrl/fuxhREQqSW+hzg3njjVqiNbcs8xGHBHEsh
 zydaaZVsOJ4sHfVNrhrNjZf6612NgrMmjFDsZv+waatRLwsgps4D2NjHP2PvtjmPfei/F023e
 i51thk72RHRxH2NE4PhWhuG6T79wERjUyW9UzOodD0aNI28LgydABWlu+fE55Flx/wPUWZwLy
 Vn2uo89SNPcfe5s5N3JgpczpjCwDsKagsHY/Cc2yU3W6eFG1lLhLHGLD+Qo0AeD5XRGDvCd5A
 DACD763T6wPWOc4sCJGZPNjlSfnpxp5CI4uTjM0nsN8SHgDAjiPRo4r6SozRP3kP2hNH3nNUC
 hFSZZ5WuhMtLHw+u+JpUbZLjBu0Wt7Cw1PyZng==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Commit 31330e6cecfd ("linux-user/s390x: Implement setup_sigtramp")
removed an unused field from rt_sigframe, disturbing offsets of other
fields and breaking unwinding from signal handlers (e.g. libgcc's
s390_fallback_frame() relies on this struct having a specific layout).
Restore the field and add a comment.

Reported-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Fixes: 31330e6cecfd ("linux-user/s390x: Implement setup_sigtramp")
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220503225157.1696774-2-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index f47713e04a07..4979c4b01791 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -84,6 +84,11 @@ struct target_ucontext {
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
+    /*
+     * This field is no longer initialized by the kernel, but it's still a part
+     * of the ABI.
+     */
+    uint16_t svc_insn;
     struct target_siginfo info;
     struct target_ucontext uc;
 } rt_sigframe;
-- 
2.36.1


