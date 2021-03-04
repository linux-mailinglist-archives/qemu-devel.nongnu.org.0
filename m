Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E532D682
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:26:25 +0100 (CET)
Received: from localhost ([::1]:47938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHprs-0003nW-OQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHpqq-0002ea-5Q
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:25:21 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHpqm-0007H4-KH
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:25:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id k66so10092040wmf.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ut2SA0p9uR1qJAjAx9Z1dx1mv5c1+44ZOBhw6veCFwY=;
 b=FZKhfJknxVm1swdVCbrW0MmBd4/VyP7QiX8ejcoo7kuxezenhLjubfaJzbboQbrMkI
 kHOqUB/c1FIcf5OpqT8ZEZL3qAppEYPdiwD3kICWj44oJqW8T6jAUcBJpUh8JgGXn8QE
 76a+23aDW76K3vN1OInKTSonysZe0k21wMP5ErStRKgzxaLMd/VdZQPU5q9vbNQQ62QV
 KOZpovyMIi7VLCQbdNwMxHS/C1/urVr+LYQ0QJBmvdzayOoPIKLhKiRLxf1WyETNMlqK
 MKkfl3DoATaOaTkQflQKgETKFKdSReHGl2C5VaoW4EwZxOKeEFX2v1MijHlcc9beCkDF
 NiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ut2SA0p9uR1qJAjAx9Z1dx1mv5c1+44ZOBhw6veCFwY=;
 b=pW8dqUlh24NqXRGEjNxtcQqtn8npT8FiYG0Yr5DQV230JD24rOeRnR68CxcOMdqFN+
 eEMsBh770L0XNDgkNoWby5EhSXWwej1QrJ2HmGhp6l2R2m0pquDLtZapzHyOIjM9nSsP
 kTJMC4LFeDtjoE/m+UKGhb8SoFARJISkXYi4UzOxt5mvwsISEmSCq5RQGBv8F8fapdMt
 QxPMOUVIXA529j5EeKfS1gNQVLZq6JzDKUGUHO7kcjwPBFxVMdDfLtB9RfriEANAacEl
 Wgddd0AQV9fndrF96NlhR1BuDWVMKA5LXBJN6X5+rDOw8EAKruHHAlHBsVidNw/mBiN/
 KIDQ==
X-Gm-Message-State: AOAM531kyEL+dDiKXPQoFufSlb7OOXYEAQCQVSGzWTkgfN3GDGvOA+4d
 2tWtpJP6tPtjs0QnQUk4IQl2VQ==
X-Google-Smtp-Source: ABdhPJzrJdhVVcrid5gZyjpy8J7AQlU8fu34xchx0/ymR8U7wt8EDtqb0iVkqx064kkfMCB7qIs++w==
X-Received: by 2002:a1c:a958:: with SMTP id s85mr4682189wme.4.1614871514387;
 Thu, 04 Mar 2021 07:25:14 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id v7sm3850384wme.47.2021.03.04.07.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 07:25:14 -0800 (PST)
Date: Thu, 4 Mar 2021 15:25:12 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
Message-ID: <20210304152512.GJ1664@vanye>
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
 <20210304135304.GI1664@vanye>
 <CAFEAcA8OsnjfyZUEVB=mmwftVnF2-bBv4da-_gqjaetoBiK3dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8OsnjfyZUEVB=mmwftVnF2-bBv4da-_gqjaetoBiK3dQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 15:14:36 +0000, Peter Maydell wrote:
> On Thu, 4 Mar 2021 at 13:53, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > On Wed, Mar 03, 2021 at 18:06:46 +0000, Peter Maydell wrote:
> > > On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> > > > It would be good if we could get 6.0 closer to SBSA compliance.
> > >
> > > How far away are we at the moment ?
> > >
> > > > Would it be worth the effort to make this controllable per cpu model?
> > >
> > > I don't have a strong opinion on whether we should, but if we do then the
> > > right way to implement that would be to have the PMCR reset value
> > > as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
> > > reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
> > > it is; and then instead of using a PMCR_NUM_COUNTERS value,
> > > extract the PMCR.N field when needed. The hardest part would be
> > > going through all the CPU TRMs to find out the correct reset value.
> >
> > That makes sense.
> >
> > I guess we could also phase the transition by using the default value
> > if zero?
> 
> I tend to prefer to avoid that kind of transitional thing, because
> as a project we have a tendency to never complete transitions. The
> PMU stuff only applies to the v7 and v8 cores, and we don't implement
> that many of them, so it's better to just make the effort to find out
> the correct PMCR reset value for them and be done with it.

Understood.

I'll throw this on my never-shrinking pile of things I hope to get
around to at some point.

/
    Leif

