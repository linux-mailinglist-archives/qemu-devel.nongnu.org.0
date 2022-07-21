Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A24257CB87
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:10:34 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVwn-00080f-71
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEVtN-0002pf-JP
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEVtD-0003r5-Jf
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658408806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WnK/4p0Ro5hlN9DaxkWJw8a3woULwFCRfG9LrA6nAGU=;
 b=ea6E3X18+w98vSPLFTgKf1rgPeVfTBLIXs7EZXkMlSiFrsbIyWRniDGG/hz2mLte8XnB9S
 zxIyGMG3PZ1FrFFI4sCjmKumln8B3VEEcoq7cu5Yfv2DzTFZQIL+kJnapjOgXWxhFB71e6
 xt7VRZLHLpsC4p7yTJrKgBLwpqRUOe8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-r_ozgV0ZMmiSm4Kn_BDYQA-1; Thu, 21 Jul 2022 09:06:44 -0400
X-MC-Unique: r_ozgV0ZMmiSm4Kn_BDYQA-1
Received: by mail-wr1-f72.google.com with SMTP id
 n7-20020adf8b07000000b0021e577a8784so290983wra.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 06:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WnK/4p0Ro5hlN9DaxkWJw8a3woULwFCRfG9LrA6nAGU=;
 b=gKrMayTNUlaGwsBdjFGcJC6AVL9oES+Dhs7fb/i5snqR+yWaOg5kwLZ9ptlnkMk1IS
 Po8STm/fjQWuNOnvauL3FWrl9rfcz3ryq4ElTYKy0hBOo0pWANzeECWS8mwNWar5rZru
 8sV8qbhNkxFtor35yR+7/Y82dIbuxs7cgpcy4VyUGN01Gc/BGE9nSmSZtUSNl30Tp0R9
 xRjUIE9N4ip332R1PWKHNfIxAYavMtdKgYssag3gZDpFVX8AoS2wGm/eYECT3P0AKwzP
 NwuMfukgD/0MtNBloUjcKvDMtkXM0Ct2qjwEErDQftEu58AzqsTbb4ksquHkSKoOof6z
 6Huw==
X-Gm-Message-State: AJIora/gz+xFPJAhibylMlGSkKGV5S3sOLHcq8DYaLdeIQHi5fJ/Gfyq
 5B1JJLMdTjkiBmKviY3vfye1ka26DrsfRA+22RHGSlbeWQT0Se+BP+Yt2A8076GYM7KKr8UeK9+
 rI6ZYQ2IhwyMl6Js=
X-Received: by 2002:a05:600c:3c83:b0:39c:9039:852c with SMTP id
 bg3-20020a05600c3c8300b0039c9039852cmr8293271wmb.187.1658408803551; 
 Thu, 21 Jul 2022 06:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEDFEHoMlhOc3LpcV4G+CMIgMW6hgrW+XCcX2SrQ3nR5pLNkIIL/fOjW8OcPx+dvmSbARWcQ==
X-Received: by 2002:a05:600c:3c83:b0:39c:9039:852c with SMTP id
 bg3-20020a05600c3c8300b0039c9039852cmr8293232wmb.187.1658408803031; 
 Thu, 21 Jul 2022 06:06:43 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c001200b003a31169a7f4sm5462425wmc.12.2022.07.21.06.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 06:06:42 -0700 (PDT)
Date: Thu, 21 Jul 2022 14:06:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/2] migration: Define BLK_MIG_BLOCK_SIZE as unsigned
 long long
Message-ID: <YtlPYPgjK3Uhcx4/@work-vm>
References: <20220721115207.729615-1-peter.maydell@linaro.org>
 <20220721115207.729615-3-peter.maydell@linaro.org>
 <YtlBeDapF2xxtqbJ@work-vm>
 <CAFEAcA9ooYEjhNYg5mWLDjHhq32_rYsWFrf7X+L8OLBJYiiM0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9ooYEjhNYg5mWLDjHhq32_rYsWFrf7X+L8OLBJYiiM0w@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 21 Jul 2022 at 13:07, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > When we use BLK_MIG_BLOCK_SIZE in expressions like
> > > block_mig_state.submitted * BLK_MIG_BLOCK_SIZE, this multiplication
> > > is done as 32 bits, because both operands are 32 bits.  Coverity
> > > complains about possible overflows because we then accumulate that
> > > into a 64 bit variable.
> > >
> > > Define BLK_MIG_BLOCK_SIZE as unsigned long long using the ULL suffix.
> > > The only two current uses of it with this problem are both in
> > > block_save_pending(), so we could just cast to uint64_t there, but
> > > using the ULL suffix is simpler and ensures that we don't
> > > accidentally introduce new variants of the same issue in future.
> > >
> > > Resolves: Coverity CID 1487136, 1487175
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > > I haven't tried to analyse the code to see if the multiplications
> > > could ever actually end up overflowing, but I would assume
> > > probably not.
> > >
> > >  migration/block.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/migration/block.c b/migration/block.c
> > > index 9e5aae58982..3577c815a94 100644
> > > --- a/migration/block.c
> > > +++ b/migration/block.c
> > > @@ -28,7 +28,7 @@
> > >  #include "sysemu/block-backend.h"
> > >  #include "trace.h"
> > >
> > > -#define BLK_MIG_BLOCK_SIZE           (1 << 20)
> > > +#define BLK_MIG_BLOCK_SIZE           (1ULL << 20)
> >
> > Is it a problem that this is passed to bdrv_create_dirty_bitmap that
> > takes a uint32_t ?
> 
> Shouldn't be -- the constant value still fits within 32 bits.

Hmm OK, lets keep an eye out for build problems on any odd combos

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


