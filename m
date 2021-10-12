Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8041242A39F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:49:43 +0200 (CEST)
Received: from localhost ([::1]:47144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGHu-00059L-JS
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maGGS-0002Nu-Su
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maGGP-0003XJ-0g
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634039287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Exulh0BZ7ftQ6sAKFo2a03IFh1VGpMK4LM1wvX940A=;
 b=TseZezmsvChzQaJ755pZEEtCyl4OD/ptWXE2Y7NMFn/k5QZncMDsLkrSJfVHZQXPJk+NFZ
 WZCjmC6sgc5wHaFVOXPV0RCQJSLV2s0mj2HLyZb9zhTOdB+dXFMon+G7C41saR2VT8+eYI
 gNP6z6daEYH25t4j/7JxNkGTqtQea3c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-py0B4UtaOVGafbS1ycZaJA-1; Tue, 12 Oct 2021 07:48:06 -0400
X-MC-Unique: py0B4UtaOVGafbS1ycZaJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso15546735wrc.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5Exulh0BZ7ftQ6sAKFo2a03IFh1VGpMK4LM1wvX940A=;
 b=R9imsi0dJt8sxfxJ23LG/ly0VU9vt55IyVFUcvBiLO2hMjqEJIU0yiIJAIbhJ+o0uz
 eYxFdK81/Za9oRCO3axZa69bghqyHj0AmdOZ5W1Y+rkwLfXtFJ3LhhYAJIHQR2CoWRBL
 NeY4UnIbIfIDuLihYvnttMlH5d5KC2njm0rHsuI6Ky3mtD2mXrYvij5yvKj/XXng/8lh
 z/0EUC/O0XKGgm3gSh6MK7uM4mNEcfceHtQ2aGQKRCPgdUnerWUlreIiIsDl5fJCJYMw
 eszGbun2ykojpnaxdlIqJAyQpLoOIBeOYKr9KuevyjpBcoeQRWain0FX0gW3vqxweN1U
 OTIw==
X-Gm-Message-State: AOAM531+DYwrlA1Kg4AK4CdTUodNe6NwuntO40ipy6PA7Mp3HrTr5quj
 wDrB7GcljTa1z8JLSZyl78e6F8zXtilAWdxN5qNCii0r8WneOjWz5Q9i5XMtW7MXVcN4yKrPRay
 lLfoiGLQmgzwcLmQ=
X-Received: by 2002:adf:a292:: with SMTP id s18mr31211350wra.42.1634039284940; 
 Tue, 12 Oct 2021 04:48:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz78Elu0P3ocUL2X2CUzUe7pC77HNTvXtjzIIpd9yoqlueF3x5+Yu9VZKdc/dRueoT84M9yHQ==
X-Received: by 2002:adf:a292:: with SMTP id s18mr31211325wra.42.1634039284693; 
 Tue, 12 Oct 2021 04:48:04 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id t18sm10698169wrm.81.2021.10.12.04.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:48:04 -0700 (PDT)
Date: Tue, 12 Oct 2021 13:48:02 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012114802.u3og3lmei35qacpx@gator>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
MIME-Version: 1.0
In-Reply-To: <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 09:31:55PM +1100, Gavin Shan wrote:
> Hi Igor,
> 
> On 10/12/21 8:40 PM, Igor Mammedov wrote:
> > On Wed,  6 Oct 2021 18:22:08 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> > 
> > > The following option is used to specify the distance map. It's
> > > possible the option isn't provided by user. In this case, the
> > > distance map isn't populated and exposed to platform. On the
> > > other hand, the empty NUMA node, where no memory resides, is
> > > allowed on ARM64 virt platform. For these empty NUMA nodes,
> > > their corresponding device-tree nodes aren't populated, but
> > > their NUMA IDs should be included in the "/distance-map"
> > > device-tree node, so that kernel can probe them properly if
> > > device-tree is used.
> > > 
> > >    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > 
> > > So when user doesn't specify distance map, we need to generate
> > > the default distance map, where the local and remote distances
> > > are 10 and 20 separately. This adds an extra parameter to the
> > > exiting complete_init_numa_distance() to generate the default
> > > distance map for this case.
> > > 
> > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > 
> > 
> > how about error-ing out if distance map is required but
> > not provided by user explicitly and asking user to fix
> > command line?
> > 
> > Reasoning behind this that defaults are hard to maintain
> > and will require compat hacks and being raod blocks down
> > the road.
> > Approach I was taking with generic NUMA code, is deprecating
> > defaults and replacing them with sanity checks, which bail
> > out on incorrect configuration and ask user to correct command line.
> > Hence I dislike approach taken in this patch.
> > 
> > If you really wish to provide default, push it out of
> > generic code into ARM specific one
> > (then I won't oppose it that much (I think PPC does
> > some magic like this))
> > Also behavior seems to be ARM specific so generic
> > NUMA code isn't a place for it anyways
> > 
> 
> Thanks for your comments.
> 
> Yep, Lets move the logic into hw/arm/virt in v3 because I think simply
> error-ing out will block the existing configuration where the distance
> map isn't provided by user. After moving the logic to hw/arm/virt,
> this patch is consistent with PATCH[02/02] and the specific platform
> is affected only.

Please don't move anything NUMA DT generic to hw/arm/virt. If the spec
isn't arch-specific, then the modeling shouldn't be either.

If you want to error-out for all configs missing the distance map, then
you'll need compat code. If you only want to error-out for configs that
have empty NUMA nodes and are missing a distance map, then you don't
need compat code, because those configs never worked before anyway.

Thanks,
drew

> 
> 
> > > ---
> > >   hw/core/numa.c | 13 +++++++++++--
> > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > index 510d096a88..fdb3a4aeca 100644
> > > --- a/hw/core/numa.c
> > > +++ b/hw/core/numa.c
> > > @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
> > >       }
> > >   }
> > > -static void complete_init_numa_distance(MachineState *ms)
> > > +static void complete_init_numa_distance(MachineState *ms, bool is_default)
> > >   {
> > >       int src, dst;
> > >       NodeInfo *numa_info = ms->numa_state->nodes;
> > > @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
> > >               if (numa_info[src].distance[dst] == 0) {
> > >                   if (src == dst) {
> > >                       numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
> > > +                } else if (is_default) {
> > > +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
> > >                   } else {
> > >                       numa_info[src].distance[dst] = numa_info[dst].distance[src];
> > >                   }
> > > @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
> > >            * A->B != distance B->A, then that means the distance table is
> > >            * asymmetric. In this case, the distances for both directions
> > >            * of all node pairs are required.
> > > +         *
> > > +         * The default node pair distances, which are 10 and 20 for the
> > > +         * local and remote nodes separatly, are provided if user doesn't
> > > +         * specify any node pair distances.
> > >            */
> > >           if (ms->numa_state->have_numa_distance) {
> > >               /* Validate enough NUMA distance information was provided. */
> > >               validate_numa_distance(ms);
> > >               /* Validation succeeded, now fill in any missing distances. */
> > > -            complete_init_numa_distance(ms);
> > > +            complete_init_numa_distance(ms, false);
> > > +        } else {
> > > +            complete_init_numa_distance(ms, true);
> > > +            ms->numa_state->have_numa_distance = true;
> > >           }
> > >       }
> > >   }
> > 
> 
> Thanks,
> Gavin
> 


