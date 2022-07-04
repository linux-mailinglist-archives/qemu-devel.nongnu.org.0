Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AF2565E85
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 22:34:01 +0200 (CEST)
Received: from localhost ([::1]:43452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Slc-0007Un-L3
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 16:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o8Sjv-0005nQ-S9
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:32:17 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o8Sju-0005cq-HW
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:32:15 -0400
Received: by mail-pl1-x630.google.com with SMTP id m14so9368655plg.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 13:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DjTU9J6HqhDjpjoeL9b9wbJVoo8URmneKuFBJmASSj0=;
 b=aSDgEmXfKWr3xNRCMCFUc8cVLRjC3fUNNq8l+aBgPn2AMMsKh0moxz9i7Yq7FHcLBw
 mW2+bSbMEYRZ6Ga8FiVA90kPidGIlbqn4vsL38hFPX8xddLk7z9qD8nYYpoypeFdCnTQ
 hUDTPvjdy7IzIZtLtoYm6euWjLFoE5BCN0jZvQI6LouSOCpyIaHpStHKvSGbD0lt1oaB
 4iVepxhBbnNucD0CcjpRHZz4bICgwGFQfsDwCu3Ad9fuB2KWXU752RwRs15gcZSnYQrL
 hPYPnlPE15h98gMaxE7aajy+sjyJPwpg4rIfqk7ZDM7Zot12tUbZrJ63jAavhncoWarh
 aZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DjTU9J6HqhDjpjoeL9b9wbJVoo8URmneKuFBJmASSj0=;
 b=N+Ey04yqrf53fNFyt839nqPw0NQxheGZVeJzqZ2snB+MvwtKkIO5kdFumu+3jg1rht
 UeFiyIuYXN4dVJjvS4c31xgSbtT5bsTXAW/ry2Dj1cJexES29u+CP+FfMY8MFg1jrBpa
 hodqov7xbM4jDXHKgZ6doD8kguWrO55nHBPFw6LsVqmWBvDWYN5Jb9rDMu5/70+2iRLt
 yjgQwUKkWaDzquo0prBlnGhY/Dkhys/pDMgl8DODc6MtjzwKCJRxBOz93rbXka2+zeGo
 JHqw25Lr9Ya3Nc2NfrYIMqpzDkgqTzfMO3pu9nscffcI7DMM8oNU9IF3exdTAvqyvXV8
 jb1g==
X-Gm-Message-State: AJIora8dRkMB7kp/AvEmIk3EcroDcIrHni4vgEEU3iX42M5+dFTH4ZST
 md7iA3yoXa8XthZ9zu5NwE4=
X-Google-Smtp-Source: AGRyM1tsbevw96MUkj3aiss/yM4T0WVvhMb0qNbx2MH7YgB/Jexlu0DOziE50CwfKSU3iZ/lgUwvMQ==
X-Received: by 2002:a17:90a:408f:b0:1e3:23a:2370 with SMTP id
 l15-20020a17090a408f00b001e3023a2370mr37114242pjg.84.1656966730402; 
 Mon, 04 Jul 2022 13:32:10 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a6558cb000000b00408b89e4282sm20835943pgu.47.2022.07.04.13.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:32:10 -0700 (PDT)
Date: Tue, 5 Jul 2022 05:32:08 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>
Subject: Re: [PATCH v2 06/11] hw/openrisc: Initialize timer time at startupi
Message-ID: <YsNOSHPwAEunATgW@antec>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-7-shorne@gmail.com>
 <60e84190-a60f-0ed0-8755-61d5087fdf9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60e84190-a60f-0ed0-8755-61d5087fdf9a@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jul 04, 2022 at 03:33:26PM +0530, Richard Henderson wrote:
> On 7/4/22 02:58, Stafford Horne wrote:
> > The last_clk time was initialized at zero, this means when we calculate
> > the first delta we will calculate 0 vs current time which could cause
> > unnecessary hops.
> > 
> > Initialize last_clk to the qemu clock on initialization.
> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >   hw/openrisc/cputimer.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
> > index 93268815d8..4dbba3a3d4 100644
> > --- a/hw/openrisc/cputimer.c
> > +++ b/hw/openrisc/cputimer.c
> > @@ -140,6 +140,7 @@ void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
> >       if (or1k_timer == NULL) {
> >           or1k_timer = g_new0(OR1KTimerState, 1);
> > +        or1k_timer->last_clk = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> >           vmstate_register(NULL, 0, &vmstate_or1k_timer, or1k_timer);
> >       }
> >   }
> 
> Init doesn't seem right.  Should be in reset?

Good point, I think reset would be better.

