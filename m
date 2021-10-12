Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990CD42A15C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:46:41 +0200 (CEST)
Received: from localhost ([::1]:42788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEMq-0007FI-Ig
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maEGo-0001LG-GZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maEGk-00080I-Da
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634031620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eur7foO9ZVc+5zHIOm5JzUjGGP4dZ6TFlrChc26XriE=;
 b=JEXJ4VXSdJ1YuajV1rd1HkwxLlKtp8MF81rzzeetrE0az21RpoZXlPSNrzudoaSCbprPxe
 AK3WexCTnUbvuPaC/11XQC86GJ95g7QOweFJHl/lXAJpaN2snrTIDOCAJwxtcdfNeL+2Z6
 3JldZDYcK7mgy5EZW8Vu03jbiIO35g8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-Hfk_fKK-MzW0N3JLg94vPg-1; Tue, 12 Oct 2021 05:40:19 -0400
X-MC-Unique: Hfk_fKK-MzW0N3JLg94vPg-1
Received: by mail-ed1-f72.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so18421533edb.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 02:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eur7foO9ZVc+5zHIOm5JzUjGGP4dZ6TFlrChc26XriE=;
 b=V3zfM6K3Em9eC8U4JnTvrb6p4KnwEr+LNtUhjwmF1zI79NBMAmSlnOGdjPpjQV8pf8
 cP6CJfJqAhAP0dFkwiyPH0vndYS8BbXQD8OTYAzD8+UOFLcz4dixsS+7hmHIUleElsmy
 ibIa3ad4Lj7wuxC7SpcYjWMOQv15py7hSDu6ZkCl8lf4ck+3bP5LswEx8YAoYLf7Uqgl
 BlIEwFeRaCgM0Lx6LIJ7dVZSKWdlJi8jtV53aUO08Wi56dw2h/BEmtzFUqzbtBOxYevu
 hTNytYmnmpOSFbI3dyE2PUG7JtKCeuf5ZIhE8OPOWvQgbWpF4/9U3Pa3E3oOU0cxBNhr
 hzsA==
X-Gm-Message-State: AOAM532pxZY1CTghH44eGKzMMa8WEeMm2Gzdmk9sm29HdM+DTYzaF4NC
 OK70bDl9Hfczf/GaR2xWMj8OFXjFDdqAh/wzntXbgBL/2CSuD2idQHi7CWPwMg8+KNbiDLmcRL1
 V0+m4EDiPEeMuJLU=
X-Received: by 2002:a17:906:5482:: with SMTP id
 r2mr30635525ejo.348.1634031618578; 
 Tue, 12 Oct 2021 02:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH/KYvSGxgDrAdreKiROFxymIZru7ZbOS113IXBfb3iCcOerurjH9kgF/01k5c8L8XyUU55Q==
X-Received: by 2002:a17:906:5482:: with SMTP id
 r2mr30635492ejo.348.1634031618306; 
 Tue, 12 Oct 2021 02:40:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id w6sm1315886edt.12.2021.10.12.02.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 02:40:17 -0700 (PDT)
Date: Tue, 12 Oct 2021 11:40:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012114016.6f4a0c10@redhat.com>
In-Reply-To: <20211006102209.6989-2-gshan@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  6 Oct 2021 18:22:08 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The following option is used to specify the distance map. It's
> possible the option isn't provided by user. In this case, the
> distance map isn't populated and exposed to platform. On the
> other hand, the empty NUMA node, where no memory resides, is
> allowed on ARM64 virt platform. For these empty NUMA nodes,
> their corresponding device-tree nodes aren't populated, but
> their NUMA IDs should be included in the "/distance-map"
> device-tree node, so that kernel can probe them properly if
> device-tree is used.
> 
>   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> 
> So when user doesn't specify distance map, we need to generate
> the default distance map, where the local and remote distances
> are 10 and 20 separately. This adds an extra parameter to the
> exiting complete_init_numa_distance() to generate the default
> distance map for this case.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>


how about error-ing out if distance map is required but
not provided by user explicitly and asking user to fix
command line?

Reasoning behind this that defaults are hard to maintain
and will require compat hacks and being raod blocks down
the road.
Approach I was taking with generic NUMA code, is deprecating
defaults and replacing them with sanity checks, which bail
out on incorrect configuration and ask user to correct command line.
Hence I dislike approach taken in this patch.

If you really wish to provide default, push it out of
generic code into ARM specific one
(then I won't oppose it that much (I think PPC does
some magic like this))
Also behavior seems to be ARM specific so generic
NUMA code isn't a place for it anyways

> ---
>  hw/core/numa.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 510d096a88..fdb3a4aeca 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
>      }
>  }
>  
> -static void complete_init_numa_distance(MachineState *ms)
> +static void complete_init_numa_distance(MachineState *ms, bool is_default)
>  {
>      int src, dst;
>      NodeInfo *numa_info = ms->numa_state->nodes;
> @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
>              if (numa_info[src].distance[dst] == 0) {
>                  if (src == dst) {
>                      numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
> +                } else if (is_default) {
> +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
>                  } else {
>                      numa_info[src].distance[dst] = numa_info[dst].distance[src];
>                  }
> @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
>           * A->B != distance B->A, then that means the distance table is
>           * asymmetric. In this case, the distances for both directions
>           * of all node pairs are required.
> +         *
> +         * The default node pair distances, which are 10 and 20 for the
> +         * local and remote nodes separatly, are provided if user doesn't
> +         * specify any node pair distances.
>           */
>          if (ms->numa_state->have_numa_distance) {
>              /* Validate enough NUMA distance information was provided. */
>              validate_numa_distance(ms);
>  
>              /* Validation succeeded, now fill in any missing distances. */
> -            complete_init_numa_distance(ms);
> +            complete_init_numa_distance(ms, false);
> +        } else {
> +            complete_init_numa_distance(ms, true);
> +            ms->numa_state->have_numa_distance = true;
>          }
>      }
>  }


