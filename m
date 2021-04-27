Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E236C226
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:51:56 +0200 (CEST)
Received: from localhost ([::1]:54154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKNn-0002Zw-PY
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKLW-0001NX-1b
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKLT-000716-7E
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619516970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbf9k7NkgiykNbk+F3gqu3dl8GaLgDnz+fFA86m0Zpw=;
 b=RwxJ9/TSUFxH+tRH56ecU1Nl3T5YqVQPRv2MQJgmxFQeyM3NGtv0Soyi2stfem2qR3nO3u
 4dPOx65CaKEnEQGRP8/7PNsDpxAyQ4pe9genkPPnR3iQnjOQYxyYz4UofNK0Elk0jfIW9/
 EstMjmt2k5/YbekEgxoNnPcfa0LgoLM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-Kxn3Ct8AMJOuxJakCPB6Ew-1; Tue, 27 Apr 2021 05:49:28 -0400
X-MC-Unique: Kxn3Ct8AMJOuxJakCPB6Ew-1
Received: by mail-ed1-f70.google.com with SMTP id
 f1-20020a0564021941b02903850806bb32so18660153edz.9
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dbf9k7NkgiykNbk+F3gqu3dl8GaLgDnz+fFA86m0Zpw=;
 b=ilQ3IBfpBFVKnAxp+LVJ5s+AuHqwk6doMvx2mBnwbntrkG4tRUOgDoTX15WSG0O7fN
 NCxGaCYWXx28p2f/UBLUwA6TUykoBSBoCjE2XHctQx7Zv/nSsB7TgFtfA48Bl0HZJtB+
 8FrrwgoTudK4XOx0WOL37FHY7Z1fyUelNoMftme94mC3dzQVpc5K2EmBOLDgG9hTxvW0
 gzuK2vO2AB3GGC15hJiKY9/OgFPhDeI/pUIX/pfJz6l8AB9V3W3QCIPTm0Z81A9hMp5f
 l4kGEfdECV6K3zKQLKst+2zHHwrxySFYvoWMzZ4IJw4ogcVcJZOtvBmHWDesY0Nkku6Y
 vKAg==
X-Gm-Message-State: AOAM531oM8C6pjfjUSTd3wfzvCZMFklsZXHzfSI9KQUWW7wp/4CLCyVL
 WehNnNFQhsemKkpT0c7dGfrCVQ4WDBlrt24GmZiOC3K3+QrdSj3q9FkidMWCf/GcKK96uzOZRgo
 v7mCUl8ATYFbCsm4=
X-Received: by 2002:a17:906:fa18:: with SMTP id
 lo24mr22348677ejb.125.1619516967133; 
 Tue, 27 Apr 2021 02:49:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw//9Ki0tsFp/gos9gGn/oTsCUC5Y1NB57uMv/QA5hs2MTx86zSy190QNNGwWWPHzIqVr3utg==
X-Received: by 2002:a17:906:fa18:: with SMTP id
 lo24mr22348659ejb.125.1619516966950; 
 Tue, 27 Apr 2021 02:49:26 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j7sm1987322edv.40.2021.04.27.02.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:49:26 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:49:24 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RESEND v2 5/6] target/arm/cpu: Enable 'el2' to work with
 host/max cpu
Message-ID: <20210427094924.pgivurjrgtzovcwa@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
 <20210427092423.q3ktw4kkd5xhapad@gator.home>
 <CAFEAcA9+VpFp70rwZ5rWEQX9TxPH558jCiSU6Z=qPnUfieSukA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9+VpFp70rwZ5rWEQX9TxPH558jCiSU6Z=qPnUfieSukA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 10:38:00AM +0100, Peter Maydell wrote:
> On Tue, 27 Apr 2021 at 10:24, Andrew Jones <drjones@redhat.com> wrote:
> > I feel like there are way too many ways to track this feature now. If I
> > didn't lose count we have
> >
> >  1) cpu->has_el2
> >  2) cpu->env & ARM_FEATURE_EL2
> >  3) (for mach-virt) vms->virt
> >  4) possibly (and probably should) some ID register bits
> >
> > I realize the first three are already in use for TCG, but I'm guessing
> > we'll want to clean those up. What's the plan going forward? I presume
> > it'll be (4), but maybe something like (1) and/or (3) will stick around
> > for convenience. I'm pretty sure we want to avoid (2).
> 
> For new features added we want to use ID register bits. However,
> a lot of older pre-existing features are keyed off ARM_FEATURE_FOO
> flag bits. Trying to convert an ARM_FEATURE flag to use ID registers
> isn't necessarily 100% trivial (for instance, the ARM_FEATURE flag
> is always checkable regardless of AArch64 vs AArch32, but the ID
> register checks often need to be split up into separate ones checking
> the AArch32 or the AArch64 ID register value). So we aren't really
> doing conversion of existing flags. (I did a few which were easy
> because there were only a handful of checks of them.) As a side note,
> some features really can't be checked in ID registers, like
> ARM_FEATURE_V8_1M, so env->features is not going to go away completely.
> 
> The only use of cpu->has_foo should be for the QOM property -- the
> arm_cpu_realizefn() should look at it and then either clear the
> ARM_FEATURE flag or update the ID register bits depending on
> which one the feature is using.
> 
> vms->virt is for the board code (and controls more things than
> just whether the CPU itself has EL2).
>

Thanks for the summary, Peter. For this series, do you recommend
attempting to convert from ARM_FEATURE_EL2 to feature bits first? Or keep
the ARM_FEATURE flag? Also, while I agree we can't use vms->virt for the
same purposes as the CPU feature (however that's tracked), do you agree
vms->virt should be true when the CPU feature is enabled?

Thanks,
drew


