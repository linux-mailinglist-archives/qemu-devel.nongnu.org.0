Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0568E019
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSlD-0007o7-2H; Tue, 07 Feb 2023 13:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pPSl7-0007ng-Ce
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:32:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pPSl5-0006KO-QR
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675794719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFEiYFjzIxxOFdXcOzSQH6+Xf2h1vhtJC8YuYIKPlqQ=;
 b=hm09txh6dqCLk/kSn5/gVbyH2hDgQdFAg0GjwfSVQlMTipSuChfByy3XlIQcSo+z/jijtu
 TgTfdKfjz8N7mUBZYBi+n7HCytjLHqcu+sq2obfa92WCLcJzsIqjgWJj7eCYHPZGpbuV6/
 eXM5MmSlxpobLZx9oV0yEZcwhIb1oZw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-3F9xOabfPcad8wY5zhOzzg-1; Tue, 07 Feb 2023 13:31:57 -0500
X-MC-Unique: 3F9xOabfPcad8wY5zhOzzg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v5-20020adf8b45000000b002bde0366b11so2316009wra.7
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFEiYFjzIxxOFdXcOzSQH6+Xf2h1vhtJC8YuYIKPlqQ=;
 b=VKm4CZiENVolM8iNgpY0H1wBq0LrJr/6pDTH37huLAN9zURvFhg8S1Z5eRTBwx/2Uo
 u2v+LobdVn2cMVt91K/HzXoZoCBnJmevwvvh+yRstYm+r72j6xEfsU/EKHeLyGwktBfs
 GlMwGm25cykFaOYqAitHsWTnoD4HIP1huKxbBUy7+06RukUAV9MAQfuyrOksXpht2neQ
 uU3r1vVEDKBmxxy662JjT6Bq444YVQGDDTUap8z1Mh8A4Y7cEJ5auEKYOFpS6F1LtfIM
 vVAT1f/foDhuClPYLI1iGBPgTjSlKGkv9UX3A0VB/QCFVwH4b0TfkGrmSQBEjo92FKdz
 4gjQ==
X-Gm-Message-State: AO0yUKVC161uEkgqAvNtU+Oz2ryoPnyJeZJzBOeMoTEMa4RtKoHzlSvX
 EjatKiDq88g41ylCCv3qjutrbiHvMGyZ0lg4H+YdLaOCu++NGR5BoIfN2ASgfRr5Ry5xtHEKOmz
 b2fSRb8IZWI+qIPc=
X-Received: by 2002:adf:f108:0:b0:2bf:adfa:b4af with SMTP id
 r8-20020adff108000000b002bfadfab4afmr3328257wro.34.1675794716530; 
 Tue, 07 Feb 2023 10:31:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+dIlD7QagTWJFBAwaCEVjM337rkDvjq9YjqUhJGZbWwhHAHTUpvkee3acb1yGhG4gFPQMzmw==
X-Received: by 2002:adf:f108:0:b0:2bf:adfa:b4af with SMTP id
 r8-20020adff108000000b002bfadfab4afmr3328247wro.34.1675794716351; 
 Tue, 07 Feb 2023 10:31:56 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfe585000000b002c3e3ee7d1asm7243429wrm.79.2023.02.07.10.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 10:31:55 -0800 (PST)
Date: Tue, 7 Feb 2023 18:31:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, mst@redhat.com, thuth@redhat.com,
 david.daney@fungible.com
Subject: Re: [PATCH] virtio-rng-pci: fix transitional migration compat for
 vectors
Message-ID: <Y+KZGc7LvIAqdZqN@work-vm>
References: <20230207174944.138255-1-dgilbert@redhat.com>
 <659136d2-206b-0146-086a-09388c96ce45@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <659136d2-206b-0146-086a-09388c96ce45@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> On 7/2/23 18:49, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > In bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a I fixed the virito-rng-pci
> 
> Typo "virtio-rng-pci".

I've made that typo SO many times...

> > migration compatibility, but it was discovered that we also need to fix
> > the other aliases of the device for the transitional cases.
> > 
> > Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
> > bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >   hw/core/machine.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index b5cd42cd8c..4627b274d9 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -49,6 +49,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
> >   GlobalProperty hw_compat_7_1[] = {
> >       { "virtio-device", "queue_reset", "false" },
> >       { "virtio-rng-pci", "vectors", "0" },
> > +    { "virtio-rng-pci-transitional", "vectors", "0" },
> > +    { "virtio-rng-pci-non-transitional", "vectors", "0" },
> 
> Ouch :(
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

Dave

> 
> >   };
> >   const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


