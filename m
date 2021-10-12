Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44C42A519
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:08:32 +0200 (CEST)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maHWB-00071j-BU
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maHTM-0004aV-8G
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maHTH-0007s9-Gt
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634043930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U97xBi/cOvgiO1EGumQBHYbeHwpC/pJ7evrzNNJsrMw=;
 b=bp6lEna1vPiJklQg+UMVi/rumdnulsRu5rQ/VeAXc7IYfJWgJsVpgdEO9C7GvjnXs7Vwgn
 8YKwjNmyDbHk3FbekHCGqqh2EDgtMur7YM5UlUJki/1de/U65EhKikDbVQ4HgU8i2JjzUu
 ABlZX4pQ8nyUzWJaA0E1ksXak7QSC1c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-MDTU431bOu6yFeNYrqFuWQ-1; Tue, 12 Oct 2021 09:05:28 -0400
X-MC-Unique: MDTU431bOu6yFeNYrqFuWQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso15694232wrb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U97xBi/cOvgiO1EGumQBHYbeHwpC/pJ7evrzNNJsrMw=;
 b=jYUVgJIYq4huW72tueeCxLKakzdiV56CadzlaU3RlbNeBL/hgBy11F9g6BL2inHo+t
 2hBt36mujEjfeizmj+3rnlt8vXpECzlRrjusLrVHl17oVxqfblYbUt1kvgynjC0y19Tj
 Tz82nbNxUuxmQbRV+E+pzFT2YCgcDoglxfFMOQbR+nlanHrngzHodAARnyXKP8F+I3ce
 E37PZfc4Q+JUemdkCUmX0mzsThfbQrkAdG9J0IjFKmwuKH/F8ueib2iNCxq+thoPlBq4
 +S4cnpay9ZVXmWVZ+C4/4YvARVp4qfqBhtJhS6dZ7MdnAy1z9vboxCWc2bZl+cEOEfEf
 4XVw==
X-Gm-Message-State: AOAM532pNGPXG/M6wloTSvKycJYibAOzN0uCFQM4gvNszuipC4hZ3EJR
 yNB/U1JCGyUDyrr7w2qUCl64CZVlsgtjIaw5GJNuobYh9VfbtjaYbjy3VfaLuK70QmKQRV4DvW5
 TAcsOMev3EindrU8=
X-Received: by 2002:a1c:a302:: with SMTP id m2mr5381744wme.111.1634043927692; 
 Tue, 12 Oct 2021 06:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQHfx+dl8W3Ci31OmCQXu1luYQaY8oYE0axfAELKgJg6YEvQdlS9H/cC0oX2AQrtVPL6KQCA==
X-Received: by 2002:a1c:a302:: with SMTP id m2mr5381685wme.111.1634043927344; 
 Tue, 12 Oct 2021 06:05:27 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id w5sm10648462wra.87.2021.10.12.06.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:05:26 -0700 (PDT)
Date: Tue, 12 Oct 2021 15:05:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012130525.ubzeatio4kntidqj@gator>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
 <20211012114802.u3og3lmei35qacpx@gator>
 <20211012143430.17b7ca99@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012143430.17b7ca99@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 02:34:30PM +0200, Igor Mammedov wrote:
> On Tue, 12 Oct 2021 13:48:02 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Tue, Oct 12, 2021 at 09:31:55PM +1100, Gavin Shan wrote:
> > > Hi Igor,
> > > 
> > > On 10/12/21 8:40 PM, Igor Mammedov wrote:  
> > > > On Wed,  6 Oct 2021 18:22:08 +0800
> > > > Gavin Shan <gshan@redhat.com> wrote:
> > > >   
> > > > > The following option is used to specify the distance map. It's
> > > > > possible the option isn't provided by user. In this case, the
> > > > > distance map isn't populated and exposed to platform. On the
> > > > > other hand, the empty NUMA node, where no memory resides, is
> > > > > allowed on ARM64 virt platform. For these empty NUMA nodes,
> > > > > their corresponding device-tree nodes aren't populated, but
> > > > > their NUMA IDs should be included in the "/distance-map"
> > > > > device-tree node, so that kernel can probe them properly if
> > > > > device-tree is used.
> > > > > 
> > > > >    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > > 
> > > > > So when user doesn't specify distance map, we need to generate
> > > > > the default distance map, where the local and remote distances
> > > > > are 10 and 20 separately. This adds an extra parameter to the
> > > > > exiting complete_init_numa_distance() to generate the default
> > > > > distance map for this case.
> > > > > 
> > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>  
> > > > 
> > > > 
> > > > how about error-ing out if distance map is required but
> > > > not provided by user explicitly and asking user to fix
> > > > command line?
> > > > 
> > > > Reasoning behind this that defaults are hard to maintain
> > > > and will require compat hacks and being raod blocks down
> > > > the road.
> > > > Approach I was taking with generic NUMA code, is deprecating
> > > > defaults and replacing them with sanity checks, which bail
> > > > out on incorrect configuration and ask user to correct command line.
> > > > Hence I dislike approach taken in this patch.
> > > > 
> > > > If you really wish to provide default, push it out of
> > > > generic code into ARM specific one
> > > > (then I won't oppose it that much (I think PPC does
> > > > some magic like this))
> > > > Also behavior seems to be ARM specific so generic
> > > > NUMA code isn't a place for it anyways
> > > >   
> > > 
> > > Thanks for your comments.
> > > 
> > > Yep, Lets move the logic into hw/arm/virt in v3 because I think simply
> > > error-ing out will block the existing configuration where the distance
> > > map isn't provided by user. After moving the logic to hw/arm/virt,
> > > this patch is consistent with PATCH[02/02] and the specific platform
> > > is affected only.  
> > 
> > Please don't move anything NUMA DT generic to hw/arm/virt. If the spec
> > isn't arch-specific, then the modeling shouldn't be either.
> 
> 
> > If you want to error-out for all configs missing the distance map, then
> > you'll need compat code.
> 
> > If you only want to error-out for configs that
> > have empty NUMA nodes and are missing a distance map, then you don't
> > need compat code, because those configs never worked before anyway.
> 
> I think memory-less configs without distance map worked for x86 just fine.

Ah, yes, we should make the condition for erroring-out be

 have-memoryless-nodes && !have-distance-map && generate-DT

ACPI only architectures, x86, don't need to care about this.

> 
> After looking at this thread all over again it seems to me that using
> distance map as a source of numa ids is a mistake.

You'll have to discuss that with Rob Herring, as that was his proposal.
He'll expect a counterproposal though, which we don't have...

Thanks,
drew


