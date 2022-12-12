Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5003764979F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 02:15:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4XOE-0003dO-PB; Sun, 11 Dec 2022 20:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4XOC-0003d0-PQ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 20:13:52 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4XOA-0000Cc-GV
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 20:13:52 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso6398877oth.5
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 17:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=lgsZv1M65lsaY6Ol4g9YztbC5aDAo8USWLt7N0/+F5c=;
 b=QZKeJ5b8qeNc0X1FRFl1Rt9PAPuRh67pdUo75XXa6fXqHdj7cP1U6GCsG5hDQygM1N
 mN1L51VAr59M9VDz7BCd8vMMxW29eF89VzhaGQpeTUfVQqH1GJ+g1m+5WaSJ1KPnEtwO
 53ECPW20DmBpFGHU0sdGe6xvYJhFm71lsVnqkPb2sCRsh4shZ6OKe75Ax1YyZwDRHhVS
 lc4HppgV8jEwzSIYDWINe+9L21xZNZClgS/EsqqTc+NtTRFDXe8TJvHTirAXXJaZDkfk
 FV4iMVBx1KeXM6SndKZkOUZulhQxjdungOw2iVpBdBI5g/pCyGLmwteJKlI+pijTwRbl
 Wg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgsZv1M65lsaY6Ol4g9YztbC5aDAo8USWLt7N0/+F5c=;
 b=wn5+mMob+10gCWKOSJaY3sMpJ1uSg53/um1jmlTeXK+PJUUTlPxMhS2+hgjJBnOems
 OWyZ3EI0gkZb8UOCQT0rKbFhpMUUdveGsffI//CH4doctPdpY0NRJfdQFmuIPvvqm+ao
 tiwnkcNyNBhUVLrzphwxl8EtFyEDerVYJ1mgvPhgoiFjBS0CIIvWQPy1HTszJSfVQ5DK
 lV18UEfHHsSoQFuA6sHjVAI0M8iCJewfIH0iAL1FmXS4RY04Xw3ASFSfEGetOb88vYNI
 Opcc5qhfMGNlAsQI1zzR/+c3wdtkippzJm9KseAzyMYZgKM0Ry+8PR0Rw+nXCMY0qq4x
 X4Cg==
X-Gm-Message-State: ANoB5pnYcZDSkXwY4dnSMAFJ+r3z4lDKB1BQb2LCbop4AsVh2Q8nCagz
 YcDmtdfOYx8ppW9ivXm/MUw=
X-Google-Smtp-Source: AA0mqf639iJZWvX2TwU1BPoOOBiFyZSwtzz0aL4aByQlWeFSX7vxF+dYeHA2b+MqsEGIrwHsV5q2XA==
X-Received: by 2002:a9d:6453:0:b0:66c:2d80:c833 with SMTP id
 m19-20020a9d6453000000b0066c2d80c833mr7943186otl.7.1670807627718; 
 Sun, 11 Dec 2022 17:13:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a0568301e3600b0066bb73cce68sm3470145otr.69.2022.12.11.17.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 17:13:47 -0800 (PST)
Date: Sun, 11 Dec 2022 17:13:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, balaton@eik.bme.hu
Subject: Re: [PATCH v2] target/sh4: Fix TB_FLAG_UNALIGN
Message-ID: <20221212011345.GA2235238@roeck-us.net>
References: <20220901101509.145758-1-richard.henderson@linaro.org>
 <20221210152744.GA2275483@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210152744.GA2275483@roeck-us.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sat, Dec 10, 2022 at 07:27:46AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Thu, Sep 01, 2022 at 11:15:09AM +0100, Richard Henderson wrote:
> > The value previously chosen overlaps GUSA_MASK.
> > 
> > Rename all DELAY_SLOT_* and GUSA_* defines to emphasize
> > that they are included in TB_FLAGs.  Add aliases for the
> > FPSCR and SR bits that are included in TB_FLAGS, so that
> > we don't accidentally reassign those bits.
> > 
> > Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I noticed that my sh4 emulations crash randomly with qemu v7.2-rc4.
> This happens with all Linux kernel versions. Testing shows that this
> patch is responsible. Reverting it fixes the problem.
> 

The patch below fixes the problem for me.

Guenter

---
From d488bcad383f360e522dbffe0d21f8ad39d33c61 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 11 Dec 2022 14:14:47 -0800
Subject: [PATCH] target/sh4: Fix unaligned handling

Commit ab419fd8a035 ("target/sh4: Fix TB_FLAG_UNALIGN") made a number
of changes which seemed unrelated to the problem being fixed. In addition
to updating updating masks, it eliminated various mask operations.
This results in a number of inexplicable crashes, often associated
with alleged unaligned operations.

Improve alignment with the original code. Reintroduce mask operations,
and undo an added '#ifdef CONFIG_USER_ONLY'.

While I have no real idea what I am doing, the resulting code no longer
crashes, so it must do some good.

Fixes: ab419fd8a035 ("target/sh4: Fix TB_FLAG_UNALIGN")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 linux-user/sh4/signal.c | 2 +-
 target/sh4/cpu.c        | 2 +-
 target/sh4/translate.c  | 2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index c4ba962708..2135e2b881 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -161,7 +161,7 @@ static void restore_sigcontext(CPUSH4State *regs, struct target_sigcontext *sc)
     __get_user(regs->fpul, &sc->sc_fpul);
 
     regs->tra = -1;         /* disable syscall checks */
-    regs->flags = 0;
+    regs->flags &= ~(TB_FLAG_DELAY_SLOT_MASK | TB_FLAG_GUSA_MASK);
 }
 
 void setup_frame(int sig, struct target_sigaction *ka,
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 453268392b..827cee25af 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
     cpu->env.pc = tb_pc(tb);
-    cpu->env.flags = tb->flags;
+    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
 static void superh_restore_state_to_opc(CPUState *cs,
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 7db3468b01..546c182463 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2270,7 +2270,6 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
                   (tbflags & (1 << SR_RB))) * 0x10;
     ctx->fbank = tbflags & FPSCR_FR ? 0x10 : 0;
 
-#ifdef CONFIG_USER_ONLY
     if (tbflags & TB_FLAG_GUSA_MASK) {
         /* In gUSA exclusive region. */
         uint32_t pc = ctx->base.pc_next;
@@ -2290,7 +2289,6 @@ static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
             return;
         }
     }
-#endif
 
     /* Since the ISA is fixed-width, we can bound by the number
        of instructions remaining on the page.  */
-- 
2.36.2


