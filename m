Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED06D596D06
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 12:53:53 +0200 (CEST)
Received: from localhost ([::1]:41568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOGgK-0007ii-IX
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 06:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGbM-00055i-Tk
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 06:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGbJ-0005Tk-JF
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 06:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660733320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ka6eN+zZp+uULy3Na9f6mELLQgXO6Giwmvcqvu1LoBw=;
 b=RJxAEDNwpmIJ32u7Z4ekeQmtz6TEVaLxSleyJMDXz4JQNqbnXYFwX2OpE4W566VqhYGjXP
 1ROWwwaov/sSHnLiMTD3aDslr4JqefQp2lhkYHj90fneG9xRRad7mncM3wnxyy5e2p/Pnv
 5ep4lQXL33+rsRp57IfL+uQpX/Lgux8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-PO1FB-ndPIOPP1PQ41zGJA-1; Wed, 17 Aug 2022 06:48:39 -0400
X-MC-Unique: PO1FB-ndPIOPP1PQ41zGJA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m4-20020a7bce04000000b003a386063752so400121wmc.1
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 03:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ka6eN+zZp+uULy3Na9f6mELLQgXO6Giwmvcqvu1LoBw=;
 b=DPSLjH5ZiFdiLDRStzVKzPB8Jtngy7+K6vdkH0Mr6gHTlEzfIJ762FMLiLm/x/hXNU
 +tQ8Zr2pPmY07dm2TNUmn0O2c7vlRhGHVrtAH/P9FZRDqt0YeIXfigrNc61uY8eEGXOO
 vzNfjSKFnDxb5zbNYMMjleqcA/VDxWVEdxeTT8cnKlV6+VY71n0qdireHLp65nMjlGKF
 EDawoWVEtflVyRPVh8t2LSJ6W0q59Gile000k0G+5rpYfsc/dtolswX5PMWVBTd/HljZ
 NAXPti20R2owGapHMCFM0iGP5ZkzFX9MMH9JESYLpl7AZ0R3KzJG3iiS7hCwrTuSUE71
 dw2A==
X-Gm-Message-State: ACgBeo01Mrj0faUTvqQy1nLfXXbSPlXoUPsn0/A/VeQ1++NXTL7VQl3q
 nI43msfZ91UvIEbl80Z7/hN3GkX0RIiJmXfCheS6H4KuT9qJrx78IKJvNZkJhjUwfjWgtR6HKTG
 sJf23kofm+qny3lc=
X-Received: by 2002:a5d:6f1b:0:b0:225:1b56:63 with SMTP id
 ay27-20020a5d6f1b000000b002251b560063mr3607900wrb.661.1660733318322; 
 Wed, 17 Aug 2022 03:48:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ZqVJhloqmx4VCvifDd7HmD8Hw3nAbzwsI2z64S2vHV5LFr8GJOGWd0HLGcMaEuGU7AxNgoQ==
X-Received: by 2002:a5d:6f1b:0:b0:225:1b56:63 with SMTP id
 ay27-20020a5d6f1b000000b002251b560063mr3607891wrb.661.1660733318121; 
 Wed, 17 Aug 2022 03:48:38 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 j11-20020adfe50b000000b00224f67bfc95sm11381901wrm.62.2022.08.17.03.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 03:48:37 -0700 (PDT)
Date: Wed, 17 Aug 2022 06:48:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 2/2] pci: Sanity check mask argument to pci_set_*_by_mask()
Message-ID: <20220817064800-mutt-send-email-mst@kernel.org>
References: <20220726163206.1780707-1-peter.maydell@linaro.org>
 <20220726163206.1780707-3-peter.maydell@linaro.org>
 <219fb09f-c46a-4dda-9ab7-ebb0772c17f5@linaro.org>
 <CAFEAcA8GF8MLrp+9yqmPYJCfkVdUtc+-A7J+zn-gfvb06v-+Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8GF8MLrp+9yqmPYJCfkVdUtc+-A7J+zn-gfvb06v-+Yw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 27, 2022 at 11:26:15AM +0100, Peter Maydell wrote:
> On Tue, 26 Jul 2022 at 23:30, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 7/26/22 09:32, Peter Maydell wrote:
> > > Coverity complains that in functions like pci_set_word_by_mask()
> > > we might end up shifting by more than 31 bits. This is true,
> > > but only if the caller passes in a zero mask. Help Coverity out
> > > by asserting that the mask argument is valid.
> > >
> > > Fixes: CID 1487168
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > > Note that only 1 of these 4 functions is used, and that only
> > > in 2 places in the codebase. In both cases the mask argument
> > > is a compile-time constant.
> > > ---
> > >   include/hw/pci/pci.h | 20 ++++++++++++++++----
> > >   1 file changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > index c79144bc5ef..0392b947b8b 100644
> > > --- a/include/hw/pci/pci.h
> > > +++ b/include/hw/pci/pci.h
> > > @@ -688,7 +688,10 @@ static inline void
> > >   pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
> > >   {
> > >       uint8_t val = pci_get_byte(config);
> > > -    uint8_t rval = reg << ctz32(mask);
> > > +    uint8_t rval;
> > > +
> > > +    assert(mask & 0xff);
> >
> > Why the and, especially considering the uint8_t type?
> 
> Oops, yes. I think I was mixing up prototypes and thought the
> mask was passed as a 32-bit value in both these functions.
> 
> -- PMM

Did you intend to send v2 of this without the &?

-- 
MST


