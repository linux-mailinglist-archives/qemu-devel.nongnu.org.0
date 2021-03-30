Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8F34F3FD
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 00:07:38 +0200 (CEST)
Received: from localhost ([::1]:36478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRMWP-0002lm-5L
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 18:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1lRMUa-0001LS-M3
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 18:05:44 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1lRMUV-0006kg-IK
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 18:05:42 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f17so6869677plr.0
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 15:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AY0TKFHvGc1+zJIqOyeyHTlkIMtKpayeWUTIbV5He00=;
 b=Ode73LWEIIeu2XSgBCXHLolqlgBxQCNMTT4GOzooG9C77A6uX5+Svb9GIouIK8XHeY
 Tlf8OUDajoNWhEQrt2lP06jz/ptZLL5rpPuc1+0KyQZNPWCH2jWhq4Dy9PlCZ8bMUnEN
 kTyAs8GfD+KcUpiQ8yELYhbCqs3SlOssfhy7jgNrEQm8HhptVC2xrDzLuM5ojewRPZxP
 hRsCa8fzLmiAnDjHYh2MSgY9Lw/GHTfsl7WGRiNHhVVGLL0brMpbLG4mA4Mwoatzkagg
 JJd+tyzgsfWcBx8TGJi9d6UnPBpMr6N5viyBHArs0aDK6ThT8ZSYxGAH01dn6XEIa7i5
 L0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AY0TKFHvGc1+zJIqOyeyHTlkIMtKpayeWUTIbV5He00=;
 b=jOt992PsI4oNGmC0dvxSxfcjvNd4xuYsJSRX7iM61cSk4l0WEXnj9hFJ+HLKive4Pj
 vehOWMBQVq5AamXIO/QmgGg4Cn4CkTe9adOh5k2p6ATOzVTeJqLUGCmBSgZO7YjI4OVQ
 ITd26WZicdEou/4AkXTBv4vY5plLEARavrozq/TO2ZRjA4b+S/oKuZqxgOHLPKPJq1YU
 tBbS+xwKGA3tGSApihTuQ/raulFYm9s6FC4+w7xuPxarn1j8V6Oj8NdGC7umLaLpJ6zA
 UbkvRGr0ks1vgrpis7YuDo7BlMBcWEqvE7Pa+LgFyUysOv49c23095ixMHw68byZVusF
 zf6w==
X-Gm-Message-State: AOAM531cdNkMgS7Adv5PO4rbHiwaQJs5PbipDcMBpiV3dU6K5QPn25pZ
 R4tT1xgzOTUJprKiL0h9dRk=
X-Google-Smtp-Source: ABdhPJzIVWgcVt3xbzs6GQWiZkhQ9c6cUgjz40JutfqrzzPbA/rYvDqTbJ36r3/7obTGm2JlhM/OhA==
X-Received: by 2002:a17:90a:2e0d:: with SMTP id
 q13mr397995pjd.225.1617141936153; 
 Tue, 30 Mar 2021 15:05:36 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 mz11sm118737pjb.6.2021.03.30.15.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:05:35 -0700 (PDT)
Date: Wed, 31 Mar 2021 07:05:32 +0900
From: Stafford Horne <shorne@gmail.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] target/openrisc: fix icount handling for timer
 instructions
Message-ID: <20210330220532.GC1171117@lianli.shorne-pla.net>
References: <161700376169.1135890.8707223959310729949.stgit@pasha-ThinkPad-X280>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161700376169.1135890.8707223959310729949.stgit@pasha-ThinkPad-X280>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62a.google.com
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

Hi Pavel,

Thanks for the patch.

On Mon, Mar 29, 2021 at 10:42:41AM +0300, Pavel Dovgalyuk wrote:
> This patch adds icount handling to mfspr/mtspr instructions
> that may deal with hardware timers.
> 
> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> ---
>  target/openrisc/translate.c |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
> index c6dce879f1..a9c81f8bd5 100644
> --- a/target/openrisc/translate.c
> +++ b/target/openrisc/translate.c
> @@ -884,6 +884,18 @@ static bool trans_l_mfspr(DisasContext *dc, arg_l_mfspr *a)
>          gen_illegal_exception(dc);
>      } else {
>          TCGv spr = tcg_temp_new();
> +
> +        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +            if (dc->delayed_branch) {
> +                tcg_gen_mov_tl(cpu_pc, jmp_pc);
> +                tcg_gen_discard_tl(jmp_pc);
> +            } else {
> +                tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
> +            }
> +            dc->base.is_jmp = DISAS_EXIT;
> +        }

I don't know alot about how the icount works.  But I read this document to help
understand this patch.

https://qemu.readthedocs.io/en/latest/devel/tcg-icount.html

Could you explain why we need to exit the tb on mfspr?  This may just be reading
a timer value, but I am not sure why we need it?

>          tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
>          gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
>          tcg_temp_free(spr);
> @@ -898,6 +910,9 @@ static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
>      } else {
>          TCGv spr;
>  
> +        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +        }

Here and above, why do we need to call gen_io_start()?  This seems to need to be
called before io operations.

This may all be OK, but could you help explain the theory of operation?  Also,
have you tested this?

-Stafford

