Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A55C42A2D8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:08:25 +0200 (CEST)
Received: from localhost ([::1]:37868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFdw-0007Qz-HC
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maFAZ-0002cK-4X
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maFAW-0002U0-1O
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634035079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ftBK3kfeijq09zERjQyQcLPrGEb8bCRUz6Tj9RttzH0=;
 b=iMiHt1kSAGWSSKoJY32gWSvT/BWmyX/lcbRPpHbeFPy7mW8d8Dx0x2Q7EA5K90R1d7h44V
 T3sux6v//qEQ1N4XNKT+YJuFhMbgePelnrKKh67p1EnS2+/meMI0zyb5OmRGgQ57vutNpl
 6t7q9XCSOjsimKGvjUcaNlRZdz8cIgk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-fp5dHKEWNhGodailplFIVg-1; Tue, 12 Oct 2021 06:37:57 -0400
X-MC-Unique: fp5dHKEWNhGodailplFIVg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so18469921edj.21
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ftBK3kfeijq09zERjQyQcLPrGEb8bCRUz6Tj9RttzH0=;
 b=noI0zs0D6gOEIkF159uqGEyxkj6atLaD8K9c8wRfCRMHlNcWzrfLGPT+2rLy7ZLXNp
 TNa9hvnZfVVoOdUbgtyvzjCwBSqMl0/7c+WcBPFyC9C7f6SNAQX/FaAzBkg6wiW/HWx7
 04XpRKeC54slhCiPxhapt+1hvQo9p8kLjrl0466ngj6aa268yU0Sr2vkaYnulhdzz2Rf
 0r563VFBvtUIpjRdMI82IzdgxNaOWBaNRw0TEryxU/dK2gF04/nPKPubDoextGVtx/VS
 jdHI3PmEkBNbOcJ64bbkWcunLJ/Mtb8YzVFfSN0v+zRAOd3INtGzwzaHkA9aE+C7kXxI
 sFiA==
X-Gm-Message-State: AOAM533OwZVyLDe1TdFT2HHb3JJAyL26pqg31z6+zJswrPRSfv6MSYaf
 9nOz7+WaMkBfkukaatzZGoVRPLPRbKYRs+oe88iCp1Wbd54svVVHdteo825jyS16dKXhRQJ72JX
 s5tj+firliTYpes8=
X-Received: by 2002:a17:906:4d04:: with SMTP id
 r4mr32586640eju.252.1634035076611; 
 Tue, 12 Oct 2021 03:37:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN14L5gfVH2gaTT0Xk2ut2gZAmr6obbxJX3YjkMRZCjxhqDt3Qvsr+j4gLzAYeh0OoNactyw==
X-Received: by 2002:a17:906:4d04:: with SMTP id
 r4mr32586613eju.252.1634035076385; 
 Tue, 12 Oct 2021 03:37:56 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id w18sm5383441edc.4.2021.10.12.03.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 03:37:55 -0700 (PDT)
Date: Tue, 12 Oct 2021 12:37:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012103754.kbyd3du26rpsi3ie@gator.home>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012114016.6f4a0c10@redhat.com>
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 11:40:16AM +0200, Igor Mammedov wrote:
> On Wed,  6 Oct 2021 18:22:08 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
> > The following option is used to specify the distance map. It's
> > possible the option isn't provided by user. In this case, the
> > distance map isn't populated and exposed to platform. On the
> > other hand, the empty NUMA node, where no memory resides, is
> > allowed on ARM64 virt platform. For these empty NUMA nodes,
> > their corresponding device-tree nodes aren't populated, but
> > their NUMA IDs should be included in the "/distance-map"
> > device-tree node, so that kernel can probe them properly if
> > device-tree is used.
> > 
> >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > 
> > So when user doesn't specify distance map, we need to generate
> > the default distance map, where the local and remote distances
> > are 10 and 20 separately. This adds an extra parameter to the
> > exiting complete_init_numa_distance() to generate the default
> > distance map for this case.
> > 
> > Signed-off-by: Gavin Shan <gshan@redhat.com>
> 
> 
> how about error-ing out if distance map is required but
> not provided by user explicitly and asking user to fix
> command line?
> 
> Reasoning behind this that defaults are hard to maintain
> and will require compat hacks and being raod blocks down
> the road.
> Approach I was taking with generic NUMA code, is deprecating
> defaults and replacing them with sanity checks, which bail
> out on incorrect configuration and ask user to correct command line.
> Hence I dislike approach taken in this patch.
> 
> If you really wish to provide default, push it out of
> generic code into ARM specific one
> (then I won't oppose it that much (I think PPC does
> some magic like this))
> Also behavior seems to be ARM specific so generic
> NUMA code isn't a place for it anyways

The distance-map DT node and the default 10/20 distance-map values
aren't arch-specific. RISCV is using it too.

I'm on the fence with this. I see erroring-out to require users
to provide explicit command lines as a good thing, but I also
see it as potentially an unnecessary burden for those that want
the default map anyway. The optional nature of the distance-map
node and the specification of the default map is here [1]

[1] Linux source: Documentation/devicetree/bindings/numa.txt

So, my r-b stands for this patch, but I also wouldn't complain
about respinning it to error out instead. I would complain about
moving the logic to Arm specific code, though, since RISCV would
then need to duplicate it.

Thanks,
drew

> 
> > ---
> >  hw/core/numa.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > index 510d096a88..fdb3a4aeca 100644
> > --- a/hw/core/numa.c
> > +++ b/hw/core/numa.c
> > @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
> >      }
> >  }
> >  
> > -static void complete_init_numa_distance(MachineState *ms)
> > +static void complete_init_numa_distance(MachineState *ms, bool is_default)
> >  {
> >      int src, dst;
> >      NodeInfo *numa_info = ms->numa_state->nodes;
> > @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
> >              if (numa_info[src].distance[dst] == 0) {
> >                  if (src == dst) {
> >                      numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
> > +                } else if (is_default) {
> > +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
> >                  } else {
> >                      numa_info[src].distance[dst] = numa_info[dst].distance[src];
> >                  }
> > @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
> >           * A->B != distance B->A, then that means the distance table is
> >           * asymmetric. In this case, the distances for both directions
> >           * of all node pairs are required.
> > +         *
> > +         * The default node pair distances, which are 10 and 20 for the
> > +         * local and remote nodes separatly, are provided if user doesn't
> > +         * specify any node pair distances.
> >           */
> >          if (ms->numa_state->have_numa_distance) {
> >              /* Validate enough NUMA distance information was provided. */
> >              validate_numa_distance(ms);
> >  
> >              /* Validation succeeded, now fill in any missing distances. */
> > -            complete_init_numa_distance(ms);
> > +            complete_init_numa_distance(ms, false);
> > +        } else {
> > +            complete_init_numa_distance(ms, true);
> > +            ms->numa_state->have_numa_distance = true;
> >          }
> >      }
> >  }
> 


