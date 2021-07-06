Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD13BD70A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 14:49:03 +0200 (CEST)
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0kVZ-00049R-JQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 08:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0kTP-0001x1-6R
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 08:46:47 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:46982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0kTN-0008JS-5m
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 08:46:46 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id g15so7244779qvi.13
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZvSYb+hW9K3pqMvjXjMIprxKCR8cZoFIlSVsBdwFqw=;
 b=vP/OHT0gak9SPVmxnS9mFkodJg5csXm7GwDsryxX0JNFfYyGGx6tMl40+bo5ZUQxwt
 mWrAP/+XT1qiQdii67bnTpOOYmlB2xLfpsouZFmDBL7ybRnzMFBqLCOR10J+AzJ17+G9
 UlOGBG37MxINtBFoskE2DbmEp+of7oC7epczfhv/3GvxUuSfRgsXocN5fezycXLYficQ
 l2W+z3WZhGTowu7dM6BawiaYcqoQV8RYGmEgoTaNPSSjgIkMXbwirDO9q7WQTBJfjCsp
 w02l5Pc3xNIeWuytwh2RPzPs1JbTNuVJO2MzQlgZrx/mSadFTmRhsBk604BzrJjYvp2q
 ABrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZvSYb+hW9K3pqMvjXjMIprxKCR8cZoFIlSVsBdwFqw=;
 b=O/SwQsqVhzSTwl3JEsM2R2OocyvIOrvNgkmIEGdMkSMX95tOghGgJpHu7RUbw4ORVC
 eRqhMVdjfnTiJRo9uvfU4lHZhDmUiLWePrsRGCZ7zESVEKf+dst+66JAG0AXvrkwCWsZ
 isTGBkfkalYbqbmWchXgY8I886fROIfS/+9qy01RSBeGQ2hPQEe4O/gPVl39kBDpQKhE
 LdnAgnocPz3m/77IB3zqzIV+u6p9DYEbRlbatcnZFyXepLfki+HfoNWBjig0pJLjZuKi
 UMjwzkXPyor9bnKq8AkzxAdcZxI+T/StmRheJGr3mcr/e36ShRIXlA6O8Csl6s6+3Gb7
 w6Lg==
X-Gm-Message-State: AOAM530nOUqXCwtJC3t0lTeQJnnDdKdU6P52MUWzQfBtjVaVvYiuU4FO
 /ASpkVrEwmU5jaozSosmL58y/w==
X-Google-Smtp-Source: ABdhPJwsddpHFYR5oDW41ROGdEL3D34F3aQEOZAi7gsiHUdOfgz445ajROxqjlihMpKIAbtr4yaREQ==
X-Received: by 2002:a0c:d7c4:: with SMTP id g4mr17587887qvj.23.1625575604018; 
 Tue, 06 Jul 2021 05:46:44 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id l190sm4909548qkc.120.2021.07.06.05.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 05:46:43 -0700 (PDT)
Message-ID: <781518f186454dc31c97b34c088f89577fbb66ab.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 06 Jul 2021 08:46:42 -0400
In-Reply-To: <CAFEAcA-xC_v2z=QaD=_dkFWx2Hr+UFd0h_YTtSi6MNPhk6-Sbg@mail.gmail.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
 <CAFEAcA-xC_v2z=QaD=_dkFWx2Hr+UFd0h_YTtSi6MNPhk6-Sbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-07-06 at 10:19 +0100, Peter Maydell wrote:
> On Tue, 6 Jul 2021 at 04:25, <shashi.mallela@linaro.org> wrote:
> > On Mon, 2021-07-05 at 20:47 -0400, shashi.mallela@linaro.org wrote:
> > > On Mon, 2021-07-05 at 15:54 +0100, Peter Maydell wrote:
> > > > I missed this the first time around, but I don't think this is
> > > > right.
> > > > Different CPUs could have different GICR_PROPBASER values, so
> > > > checking
> > > > against just one of them is wrong. The pseudocode only tests
> > > > LPIOutOfRange()
> > > > which is documented as testing "larger than GICD_TYPER.IDbits
> > > > or
> > > > not
> > > > in
> > > > the LPI range and not 1023". So I don't think we should be
> > > > looking
> > > > at the GICR_PROPBASER field here.
> > > > 
> > > > More generally, "s->gicv3->cpu->something" is usually going to
> > > > be
> > > > wrong, because it is implicitly looking at CPU 0; often either
> > > > there
> > > > should be something else telling is which CPU to use (as in
> > > > &s->gicv3->cpu[rdbase] where the CTE told us which
> > > > redistributor),
> > > > or we might need to operate on all CPUs/redistributors. The
> > > > only
> > > > exception is where we can guarantee that all the CPUs are the
> > > > same
> > > > (eg when looking at GICR_TYPER.PLPIS.)
> > Please ignore my last comment.
> > 
> > To address this scenario,i think the feasible option would be to
> > call
> > get_cte() to get the rdbase corresponding to icid value passed to
> > mapti
> > command.Since each icid is mapped to a rdbase(by virtue of calling
> > MAPC
> > command),if the collection table has a valid mapping for this icid
> > we
> > continue processing this MAPTI command using &s->gicv3->cpu[rdbase]
> > applicable propbaser value to validate idbits, else return without
> > further processing.
> 
> But the pseudocode for MAPTI does not say anywhere that we should
> be checking the pIntID against any CPU's GICR_PROPBASER field.
> It is checked only by the checks in LPIOutOfRange(), which tests:
>  * is it larger than permitted by GICD_TYPER.IDbits
>  * is it not in the LPI range and not 1023
> 
> Checking whether the intID is too big and would cause us to index
> off the end of the redistributor's configuration table should be done
> later, only when the ITS actually sends the interrupt to a particular
> redistributor, I think.
> 
> (You can't rely on the guest having done the MAPC before the MAPTI;
> and in any case the guest could choose to do a MAPC to a different
> redistributor after it's done the MAPTI.)
> 
> thanks
> -- PMM
We already have the "intID too big check" in place within the
redistributor processing when ITS sends the interrupt trigger.
"the LPI range and not 1023" is also handled in this function,but for
validating "is it larger than permitted by GICD_TYPER.IDbits",the
source of GICD_TYPER.IDbits is GICR_PROPBASER because we pick up min of
GICR_PROPBASER.IDbits and GICD_TYPER.IDBits.

If we are to not use gicr_propbaser,then are we good to just accept the
intID value here since we are validating the same during interrupt
processing?



