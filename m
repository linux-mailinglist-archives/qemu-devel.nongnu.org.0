Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED59423D5F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:59:55 +0200 (CEST)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY5aU-0007SV-FE
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY5ZR-0006Ze-T9
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY5XU-0007mW-P0
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633521407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hlDcCTOKOHqELQG0J9ELx1bzgh5+4e7b57/RbQy+ZIk=;
 b=Ut7Ck/VV6l7ebvtqsn0vsp+4lSk1FzhCPDCFDOiSzfoJGs3RR7cImKtZLWDFBvqxAzhDD3
 X0jnMxgV6hBO2MerndnNwwXsEk3jSgzuMsu86VIdXjVVF41v/rUXtGXyTBjgBgQJ09EwJQ
 8CHOdji7V0vImHH3hUxRhT+Bis9wyOk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-bnGfEAR2PDmriwt-y22MAw-1; Wed, 06 Oct 2021 07:56:46 -0400
X-MC-Unique: bnGfEAR2PDmriwt-y22MAw-1
Received: by mail-ed1-f69.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso2392957edt.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 04:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hlDcCTOKOHqELQG0J9ELx1bzgh5+4e7b57/RbQy+ZIk=;
 b=Uy0U1tsHGsnqtFz50sVYKIWL4JjvE5J82YDNHsqMMBw7LLIvjAm6gHz4ogL9Co1rGr
 Lo4pA4ukomSXDOFq1Gas4PllEy9Zldr2g8PutKNFK4QE9yLR/8m0WQlkrB4+xAXBN2wq
 M47vnQWco3pDC7+/F66HDEeSo/igbLmjSMPFsUe2ejWWUR9kcI2B+9xHIzblnuJGqv0A
 XssbSHGMkLohypMoD0UAc6s/SfFa1n0NtABuAszQpAljHGazXKSuJMtjyruveTQDjCE4
 JO5ILn+9R24KS+SSeuFNV7GocsuF2/lERQZujavmSxAoJtjBrDsZEOyHnbp5JT3KEv/w
 D6eA==
X-Gm-Message-State: AOAM531tCYrSt1NblHYXx6iCBN9BaPJaXT7n0p07iNjxNSI+bigRhbVR
 +Hy3AlxIqfwceVXDXhCfQEMbWfADcyQ/5xjmsTcltHH1b9O4uFMrTn7lR+zzDYMLG7D1xeb6QAr
 lKi/0u4ZEJg6ksxI=
X-Received: by 2002:a17:906:3192:: with SMTP id
 18mr31645997ejy.246.1633521405433; 
 Wed, 06 Oct 2021 04:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL+iDoZ82r/GI0RzMcDDPJNrgvi03m31af7tW5cf9WgYE9YrRfRSkTymWmuHD6ah4yIoZvQQ==
X-Received: by 2002:a17:906:3192:: with SMTP id
 18mr31645971ejy.246.1633521405190; 
 Wed, 06 Oct 2021 04:56:45 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id l16sm8749479eje.67.2021.10.06.04.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 04:56:44 -0700 (PDT)
Date: Wed, 6 Oct 2021 13:56:43 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211006115643.p5b2qcoi4eagluqc@gator.home>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211006103529.25vjtmkmijmomq4u@gator.home>
 <688560f5-19a4-7a08-41ec-132266f76725@redhat.com>
MIME-Version: 1.0
In-Reply-To: <688560f5-19a4-7a08-41ec-132266f76725@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 10:03:25PM +1100, Gavin Shan wrote:
> Hi Drew,
> 
> On 10/6/21 9:35 PM, Andrew Jones wrote:
> > On Wed, Oct 06, 2021 at 06:22:08PM +0800, Gavin Shan wrote:
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
> > > -- 
> > > 2.23.0
> > > 
> > 
> > With this patch we'll always generate a distance map when there's a numa
> > config now. Is there any reason a user would not want to do that? I.e.
> > should we still give the user the choice of presenting a distance map?
> > Also, does the addition of a distance map in DTs for compat machine types
> > matter?
> > 
> > Otherwise patch looks good to me.
> > 
> 
> Users needn't specify the distance map when the default one in kernel,
> whose distances are 10 and 20 for local and remote nodes in linux for
> all architectures and machines, is used. The following option is still
> usable to specify the distance map.
> 
>   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> 
> When the empty NUMA nodes are concerned, the distance map is mandatory
> because their NUMA IDs are identified from there. So we always generate
> the distance map as this patch does :)
>

Yup, I knew all that already :-) I'm asking if we want to ensure the user
can still control whether or not this distance map is generated at all. If
a user doesn't want empty numa nodes or a distance map, then, with this
patch, they cannot avoid the map's generation. That configurability
question also relates to machine compatibility. Do we want to start
generating this distance map on old, numa configured machine types? This
patch will do that too.

But, it might be OK to just start generating this new DT node for all numa
configured machine types and not allow the user to opt out. I do know that
we allow hardware descriptions to be changed without compat code.  Also, a
disable-auto-distance-map option may be considered useless and therefore
not worth maintaining. The conservative in me says it's worth debating
these things first though.

(Note, empty numa nodes have never worked with QEMU, so it's OK to start
 erroring out when empty numa nodes and a disable-auto-distance-map option
 are given together.)

Thanks,
drew


