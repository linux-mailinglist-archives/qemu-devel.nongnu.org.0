Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A5164AEBF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 05:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4xJu-0003yI-Hl; Mon, 12 Dec 2022 23:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4xJs-0003xl-5y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 23:55:08 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4xJq-0004SY-8G
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 23:55:07 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso11164126fac.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 20:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=qK5LyuABxDo5qztUJ6zqraEUrXmOjHHVdr5d2wca9v4=;
 b=HtaIBmEpulfHHA+abiY8I9QQSFmHw8xZew4cbQAlNqti5gga41bMWihkgxv8ByoA2O
 CyDX6mXUjYI76VCo/GVm5rpPfUDw91GLPoBULSylLu7pRQG56HeY5eZjuy2XxgnYY3a4
 qsjLExRaG3SG+Ul8BPQ5aLLAbgGwZQ/PeBBNcbTHIJXjPookCmL2hO7/gXh6HBSwGuxN
 tvuyc+ypA+Bvy5wqla5mZ5SxqKzKGtDLHU7PkZKYZMUeq37v8hUKV0rVPLecfX20kHCD
 ej7hZEUOoaoQT4/PuXkw6kGhmbESfhFL/pyAXl9Z07kXfBFSSPFPq1eQtrhI9P72le57
 pl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qK5LyuABxDo5qztUJ6zqraEUrXmOjHHVdr5d2wca9v4=;
 b=cupdQJYU5cOqoJZwLC0G+T5fEhpMtBN6H3ElKJoqBVvvL4LM9xtNq3l5Z90zg+8I0B
 odmTWYIctsX3ofiLQgw3O6mK+LyFia/H9LyuvvBLjjSABXKnTL4a7SadjXMTCdVaCDvS
 xRno03BrhbxiAQ7ec57Dfk1g21VjBdnSulTb6gcF++Rl1RGnowFsdWHrYldDu8M6Uofk
 nYm3g+pTglgy8srhRF2on8nJ3f9kSaLsAepC53nqvahx4byp8iJNdK7Nh7rPa+SdcZlH
 s7YGFgOtTssIi2QWHNjwxeL1HMRVFHc7wHIfts0AikR0wSFVkL/LRCZn98jukkRFb8hW
 otYQ==
X-Gm-Message-State: ANoB5pnCXHjJGG4Ry57a3U+eGCllqwV82i3Vl+0rfPIvJAguh89EOsvK
 XqVwYLYKzAKtMbNKmkHf7pQ=
X-Google-Smtp-Source: AA0mqf78zLlfNlm0wwOIYN6BtsZ/ekW87yRTu7ELKYKmrgjdM+6QWNp0iAFXhONrhKdxff+7Vzau+w==
X-Received: by 2002:a05:6870:f698:b0:13b:ad3a:f7c9 with SMTP id
 el24-20020a056870f69800b0013bad3af7c9mr12528292oab.28.1670907303148; 
 Mon, 12 Dec 2022 20:55:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 eq37-20020a056870a92500b0010d7242b623sm930372oab.21.2022.12.12.20.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 20:55:02 -0800 (PST)
Date: Mon, 12 Dec 2022 20:55:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, balaton@eik.bme.hu
Subject: Re: [PATCH v2] target/sh4: Fix TB_FLAG_UNALIGN
Message-ID: <20221213045501.GA2456699@roeck-us.net>
References: <20220901101509.145758-1-richard.henderson@linaro.org>
 <20221210152744.GA2275483@roeck-us.net>
 <20221212011345.GA2235238@roeck-us.net>
 <375e840f-a823-b1e8-3d3c-3b1b4298188e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <375e840f-a823-b1e8-3d3c-3b1b4298188e@linaro.org>
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x2e.google.com
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

On Mon, Dec 12, 2022 at 08:30:42AM -0600, Richard Henderson wrote:
> On 12/11/22 19:13, Guenter Roeck wrote:
> > On Sat, Dec 10, 2022 at 07:27:46AM -0800, Guenter Roeck wrote:
> > > Hi,
> > > 
> > > On Thu, Sep 01, 2022 at 11:15:09AM +0100, Richard Henderson wrote:
> > > > The value previously chosen overlaps GUSA_MASK.
> > > > 
> > > > Rename all DELAY_SLOT_* and GUSA_* defines to emphasize
> > > > that they are included in TB_FLAGs.  Add aliases for the
> > > > FPSCR and SR bits that are included in TB_FLAGS, so that
> > > > we don't accidentally reassign those bits.
> > > > 
> > > > Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
> > > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > 
> > > I noticed that my sh4 emulations crash randomly with qemu v7.2-rc4.
> > > This happens with all Linux kernel versions. Testing shows that this
> > > patch is responsible. Reverting it fixes the problem.
> > > 
> > 
> > The patch below fixes the problem for me.
> 
> Thanks for the investigation.
> 
> 
> > +++ b/target/sh4/cpu.c
> > @@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
> >       SuperHCPU *cpu = SUPERH_CPU(cs);
> >       cpu->env.pc = tb_pc(tb);
> > -    cpu->env.flags = tb->flags;
> > +    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
> 
> Only this hunk should be necessary.
> 

Confirmed.

Do you plan to send a formal patch, or do you want me to do it ?

Thanks,
Guenter

