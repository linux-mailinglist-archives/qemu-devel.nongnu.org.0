Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E28423B95
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:37:01 +0200 (CEST)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4IG-0008MA-8O
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY4H1-0007SI-5Q
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY4Gx-0005pK-Tv
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633516538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y5pqJzdkARgwv4cohbzyy4bCihjtZ11rk8/kzWU/ujk=;
 b=LvaoblZdt8XM60FBTrdKYqsbkyCnucTtp5qJGJ20o57YG3dxjcf3jrA7b7n9/DeKcbZ0//
 vcn/eamcuFxnhSNvux4DyZPo0iZfyoudZNHswp5NiQgDQGXt5jrMRnIw9TRhg7CvH4csPU
 PN9ODFtscGlu2bgk0NVwiOdqWWb/ORo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-RfccopuDNjy8zD4UfY_xJg-1; Wed, 06 Oct 2021 06:35:37 -0400
X-MC-Unique: RfccopuDNjy8zD4UfY_xJg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso2227036edf.7
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 03:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y5pqJzdkARgwv4cohbzyy4bCihjtZ11rk8/kzWU/ujk=;
 b=QhroJTLYR2Zj+X3rKtHvpL230waDyEMrLAC2oSmp3Xvb20hXZZE2uhGaKor6kz3C2f
 vKfmRJcsFvmcBm9EU7uUOM5H6C6/KSEEYU3qjBKHuDMSIsBhJQl6J3+LJFeujzfmY/qf
 vYKnZiGlID5839J563sAAuQzgnB52Ona43UKxdtxqiZMMEvQn+FO09aSL+IuK904Z/oO
 9jBMelhn6HqVIJ3ldjb/qT9IZIOuUAJX/EXgt37LAQ2negeSbUP4sCDuy8F1qRtxI4v7
 AMh9G4/IlYf5LB0Lq/7oP4hXeA1aB8PY4iOdUMhokoxMQAWTS2gYAJHKmnht1S0VIQ5s
 yWGA==
X-Gm-Message-State: AOAM533/bhQDA4VOjOK+qK77l9ZM9/CsJN9vlEaei2SpnJS1ylI29Y0B
 1FbVOXBg1DNG/tQRLoM4Ji23txtW0UCqEfuvkM1VUoTiKGQ4th8u01VHogVyTSevxZlHzbNrsXI
 wg1QAW2CU6yOmp/k=
X-Received: by 2002:a17:907:110b:: with SMTP id
 qu11mr30456071ejb.380.1633516536521; 
 Wed, 06 Oct 2021 03:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzof/rNGZP6XzznWIQdPhrpICR+K1+Atxms6DXYGW/VghKIwmDwD27sjQcWmgJtWgXPOn40xQ==
X-Received: by 2002:a17:907:110b:: with SMTP id
 qu11mr30456037ejb.380.1633516536273; 
 Wed, 06 Oct 2021 03:35:36 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id a14sm514979eds.84.2021.10.06.03.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 03:35:35 -0700 (PDT)
Date: Wed, 6 Oct 2021 12:35:29 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211006103529.25vjtmkmijmomq4u@gator.home>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006102209.6989-2-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 06:22:08PM +0800, Gavin Shan wrote:
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
> -- 
> 2.23.0
>

With this patch we'll always generate a distance map when there's a numa
config now. Is there any reason a user would not want to do that? I.e.
should we still give the user the choice of presenting a distance map?
Also, does the addition of a distance map in DTs for compat machine types
matter?

Otherwise patch looks good to me.

Thanks,
drew


