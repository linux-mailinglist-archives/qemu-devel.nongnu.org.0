Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02961350071
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 14:35:34 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRa4K-0005AI-GT
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 08:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1lRa2f-0004KY-UP
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:33:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1lRa2d-0003vo-Rh
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 08:33:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so1079380pjb.4
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 05:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OGMT9azHA2QCA/gYcf5BbgPBfd9TJ5BlM0zo2Higg3o=;
 b=uO8oTMn7v8QpjrswPcDDGxrGfL59AV5HIzc3PGROI13w2WWxfQp2hYON9YgeZpKcT8
 tWnRDoUUPJJtvaoAcpeNcwADN+CnrMPrgHGmkeg982hvmf7Gt0dSHQ2mSJ/pqICpczhY
 Mu6ceNrsXinOFYvuTomB1HE0If2QNvGwyp0iUrtx+WRzn9GSsHHwqKvIdMqOkMdBVy+M
 G+wmhiZoEEKpOceQxPrVyYA1sS3iGQMwyQLmqvtQWwJFKnc8LPZXy0aqVDmxQs1eoqg2
 OsVYYOX+UE0waKEdE48YQAvgGGW+jdV/JN6cOGThMiIKRz4hFl1Xydm9rRS5xqafw9qe
 544A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OGMT9azHA2QCA/gYcf5BbgPBfd9TJ5BlM0zo2Higg3o=;
 b=guyEdyachxzKIIPjqyQrIPcN8wsNLvHJ+igSmGU9lvAR8ywROZ6ooeBpLi3NBbRSuw
 gmom63ZR0t8R1QqUw6r+OOBGSxb+gjeEhZNjEZE4KQfYLMQFft3prljgcBbKvm0AgOWo
 GWH+i1Wc8DvSEZIube94krf4y6p1K59bDtaaMAm/uN+Mpk+cPwzyQ7tdUZWIUcs8tpXM
 DTHmmzAyAF7hjMZ7xKTvfY4UxI33MF5pnp4yEUJlCVU2zgY70bSNVA/RWRE7wVZ8/OdZ
 17TFcLtgu5fD6qXBSuYF90ehPYNwHpGMwP8PIx3qFtB6WKIX6ELgz5oXEUzm6vM05qTv
 Z7ng==
X-Gm-Message-State: AOAM530s+6NeDbvwgWQpqPQ6ft5MJEu/xvyUfzAK9LOY8c+u/Xc4UajR
 XOYtSbEk/ka+6mMHpSdLJjw=
X-Google-Smtp-Source: ABdhPJzOfN2ziIG4K06jfj27FdlyPAS0PDFM+yK7ajrDZiVuBgTqLf9Yl+lq0Y8AvcwMwQpfsE9BaQ==
X-Received: by 2002:a17:90a:488a:: with SMTP id
 b10mr3297436pjh.2.1617194026239; 
 Wed, 31 Mar 2021 05:33:46 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 g18sm2206256pfb.178.2021.03.31.05.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 05:33:45 -0700 (PDT)
Date: Wed, 31 Mar 2021 21:33:42 +0900
From: Stafford Horne <shorne@gmail.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] target/openrisc: fix icount handling for timer
 instructions
Message-ID: <20210331123342.GG1171117@lianli.shorne-pla.net>
References: <161700376169.1135890.8707223959310729949.stgit@pasha-ThinkPad-X280>
 <20210330220532.GC1171117@lianli.shorne-pla.net>
 <532799f9-e9ed-1e7a-713e-0ff436721f82@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <532799f9-e9ed-1e7a-713e-0ff436721f82@ispras.ru>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, proljc@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 31, 2021 at 10:27:21AM +0300, Pavel Dovgalyuk wrote:
> On 31.03.2021 01:05, Stafford Horne wrote:
> > Hi Pavel,
> > 
> > Thanks for the patch.
> > 
> > On Mon, Mar 29, 2021 at 10:42:41AM +0300, Pavel Dovgalyuk wrote:
> > > This patch adds icount handling to mfspr/mtspr instructions
> > > that may deal with hardware timers.
> > > 
> > > Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> > > ---
> > >   target/openrisc/translate.c |   15 +++++++++++++++
> > >   1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
> > > index c6dce879f1..a9c81f8bd5 100644
> > > --- a/target/openrisc/translate.c
> > > +++ b/target/openrisc/translate.c
> > > @@ -884,6 +884,18 @@ static bool trans_l_mfspr(DisasContext *dc, arg_l_mfspr *a)
> > >           gen_illegal_exception(dc);
> > >       } else {
> > >           TCGv spr = tcg_temp_new();
> > > +
> > > +        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> > > +            gen_io_start();
> > > +            if (dc->delayed_branch) {
> > > +                tcg_gen_mov_tl(cpu_pc, jmp_pc);
> > > +                tcg_gen_discard_tl(jmp_pc);
> > > +            } else {
> > > +                tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
> > > +            }
> > > +            dc->base.is_jmp = DISAS_EXIT;
> > > +        }
> > 
> > I don't know alot about how the icount works.  But I read this document to help
> > understand this patch.
> > 
> > https://qemu.readthedocs.io/en/latest/devel/tcg-icount.html
> > 
> > Could you explain why we need to exit the tb on mfspr?  This may just be reading
> > a timer value, but I am not sure why we need it?
> 
> Because virtual clock in icount mode is correct only at the end of the
> block.
> Allowing virtual clock reads in other places will make execution
> non-deterministic, because icount is updated to the value, which it gets
> after the block ends.

OK, got it.

> > 
> > >           tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
> > >           gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
> > >           tcg_temp_free(spr);
> > > @@ -898,6 +910,9 @@ static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
> > >       } else {
> > >           TCGv spr;
> > > +        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> > > +            gen_io_start();
> > > +        }
> > 
> > Here and above, why do we need to call gen_io_start()?  This seems to need to be
> > called before io operations.
> 
> gen_io_start allows reading icount for the instruction.
> It is needed to prevent invalid reads in the middle of the block.
> 
> > 
> > This may all be OK, but could you help explain the theory of operation?  Also,
> > have you tested this?
> 
> I have record/replay tests for openrisc, but I can't submit them without
> this patch, because they will fail.

OK.

Acked-by: Stafford Horne <shorne@gmail.com>

I am not currently maintaining an openrisc queue, but I could start one.  Do you
have another way to submit this upstream?

-Stafford

