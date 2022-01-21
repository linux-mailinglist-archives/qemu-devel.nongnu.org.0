Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728C74962A2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:11:35 +0100 (CET)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwVi-0004Fi-Aq
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:11:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nAwTO-0002Rp-Jt; Fri, 21 Jan 2022 11:09:10 -0500
Received: from [2607:f8b0:4864:20::32f] (port=44800
 helo=mail-ot1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nAwTK-0002jX-Le; Fri, 21 Jan 2022 11:09:07 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso12297618otb.11; 
 Fri, 21 Jan 2022 08:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zqyne8zdqEr0n/ti4W+SumFsBQyBcFS4DtQeHgKsI7k=;
 b=BaYYt/+lJQMxgpLNNG/5dDaVX+v5C3hfE71oOrBUnh7tuKMIAX865fvQrghOC41Ctr
 EbLTNueRZdJQQ1pn73p/Qoey+ySGesu42Nn1M6icrdLDv3nSgr+zPNBTvtMV/QYmVdH7
 rdId8mqFCEAfNjN6FsPh9XRJsf4z11h9sEK5wLn5VWd36rVNEihYcvYV4xZwnq9NgWdN
 bk8tbdLYkDrm1pv8MkDQ2c/rVIGAw6xcVexE/RRyPBvqbWVgFLEmRI4/pHynJdh8ZhLu
 ns8XCzE+UfYpRimeC0cmfTKGSo1DJ5oM7lX/aNv1zKDK5L0qgEQG6ayS/mxKr0pvw+t1
 mAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zqyne8zdqEr0n/ti4W+SumFsBQyBcFS4DtQeHgKsI7k=;
 b=JKqW/1Y1F1380abnCH05fyzY6BShaOgGjot2mH6wrZKXLbdcsRy3gTznoNyOEN+jG8
 G9Xb5OkNsTVgPwUOOzLYz1RTj3+evBtiSb4FxomVaqbOOr04WcLrj5pwKTjNs7wOUEHY
 uBAhGT1SkqcriwWCuhA9dk7ClF0rlZMAmBGJVkT2v74dmWE5zBbbxiviRStZVP/ooaoI
 SvqT2O3W/wdtxkGKM68A3Awb/1Rs3ZgyCEsOP4bPm4eErkE3ec7zSLVEcRIgvxuBTGez
 zakUaWw38WUK4qOJ4sxR2YAR4PuUhK6pvyl6QFgFYQS5DW37y18p/6amBy+tUeh8lmBP
 k9pw==
X-Gm-Message-State: AOAM532EayzKubL/o3uOMnUHkByQfO+ItFXUjF8Au/KrypGy106Md+VP
 CeSwYLxjlvLXyTe6h83F9ZpRIfQOHDA=
X-Google-Smtp-Source: ABdhPJzIqLfrVUeIThkh3cqRC8p5HRN0CkHpIOVh/+bVv307GyylhyftMsj2OjG6pXDstY72Tm0eaw==
X-Received: by 2002:a9d:7dc4:: with SMTP id k4mr3278556otn.284.1642781344449; 
 Fri, 21 Jan 2022 08:09:04 -0800 (PST)
Received: from rekt.ibmuc.com ([191.8.61.226])
 by smtp.gmail.com with ESMTPSA id d4sm1251023otq.44.2022.01.21.08.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 08:09:04 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] target/ppc: fix 'skip KVM' cond in cpu_interrupt_exittb()
Date: Fri, 21 Jan 2022 13:08:41 -0300
Message-Id: <20220121160841.9102-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_interrupt_exittb() was introduced by commit 044897ef4a22
("target/ppc: Fix system lockups caused by interrupt_request state
corruption") as a way to wrap cpu_interrupt() helper in BQL.

After that, commit 6d38666a8931 ("ppc: Ignore the CPU_INTERRUPT_EXITTB
interrupt with KVM") added a condition to skip this interrupt if we're
running with KVM.

Problem is that the change made by the above commit, testing for
!kvm_enabled() at the start of cpu_interrupt_exittb():

static inline void cpu_interrupt_exittb(CPUState *cs)
{
    if (!kvm_enabled()) {
        return;
    }
    (... do cpu_interrupt(cs, CPU_INTERRUPT_EXITTB) ...)

is doing the opposite of what it intended to do. This will return
immediately if not kvm_enabled(), i.e. it's a emulated CPU, and if
kvm_enabled() it will proceed to fire CPU_INTERRUPT_EXITTB.

Fix the 'skip KVM' condition so the function is a no-op when
kvm_enabled().

CC: Greg Kurz <groug@kaod.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/809
Fixes: 6d38666a8931 ("ppc: Ignore the CPU_INTERRUPT_EXITTB interrupt with KVM")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper_regs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 8671b7bb69..7dca585ddd 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -201,7 +201,11 @@ void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
 
 void cpu_interrupt_exittb(CPUState *cs)
 {
-    if (!kvm_enabled()) {
+    /*
+     * We don't need to worry about translation blocks
+     * when running with KVM.
+     */
+    if (kvm_enabled()) {
         return;
     }
 
-- 
2.34.1


