Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783740F442
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:39:06 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9Oj-0005db-KQ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mR9C4-0002pT-6c
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mR9C2-00008v-8t
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631867156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMMBQv9kRxnLhnGPs+90UmbzzZpBGkLA/okFjmmYOVw=;
 b=eqf0iOaycBdXws9LwJbPeKqXAkhNN1vh28b8PgXb5OqOX9sqDOk/uoyLBWr03qewl71w+o
 wPKRQkjIXKZMIe0IlMAoxpDiAQScyE/BsqBFq2vyKjU+V5BAS/vMiKwqagpouIl18LT8rF
 aWVxkzpgRhQ0HbrIVttt1SEfYZgbFyc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-coFZMsUiPByEO7zv3LjgBA-1; Fri, 17 Sep 2021 04:25:55 -0400
X-MC-Unique: coFZMsUiPByEO7zv3LjgBA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso8280898edi.1
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 01:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMMBQv9kRxnLhnGPs+90UmbzzZpBGkLA/okFjmmYOVw=;
 b=FUoFtIEzm2GZQXihMxfYMLKnzsRW4V5r2E/qvBTOHTdV3WNdeZtKNcu9SFHT91jV4a
 NOh0bfquqUUGge+X0EatrEwYeSK/zRnvhn/5angMGi+F/WENUYzVl1MTDhmblS6Gavh1
 Lft5NxPFQmfV+xBckfbhpveFiIYsSTP+XSNkoWZ52789hGVU5te2LiZ8GEqdQJRWqIG7
 UsG+Uwj0eo0OEKleJQ+G9XGgw8N36FyIz35hPY4Nbn8ymV3C+AaJ11o0DPJ+oES3mF6C
 U4TIOE5LLpsze5Nyj4C5PnDXQy2+GdmhoSRQeNO67f1UHUHpHUSVnu7OfVNiD6iB5DaT
 0AUA==
X-Gm-Message-State: AOAM531ViK9nhrGVbVI5sMb5xHksMUOFi32zwUKlY705FOJWXaYT+bpg
 Vphbu4TIY8rlkcJNsP3PmTNhn4FucxVPy+LPMPXmlCLmvE180RPFnlgAtncNc/DElsXS4kcnRlP
 SnDNHUW5QBzrMaPo=
X-Received: by 2002:a17:907:7755:: with SMTP id
 kx21mr10798526ejc.463.1631867154302; 
 Fri, 17 Sep 2021 01:25:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLII4omstTUZf6UKYsE6HwcBWdVAb3DrJj75ULA3hoXa9EhUVTvepzgSbZEap79ZCxESW3iA==
X-Received: by 2002:a17:907:7755:: with SMTP id
 kx21mr10798504ejc.463.1631867154013; 
 Fri, 17 Sep 2021 01:25:54 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j2sm2407633edt.0.2021.09.17.01.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 01:25:53 -0700 (PDT)
Date: Fri, 17 Sep 2021 10:25:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 7/7] spapr_numa.c: handle auto NUMA node with no
 distance info
Message-ID: <20210917102552.7ce1cbcb@redhat.com>
In-Reply-To: <20210916013004.272059-8-danielhb413@gmail.com>
References: <20210916013004.272059-1-danielhb413@gmail.com>
 <20210916013004.272059-8-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sep 2021 22:30:04 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> numa_complete_configuration() in hw/core/numa.c always adds a NUMA node
> for the pSeries machine if none was specified, but without node distance
> information for the single node created.

distance is optional feature, hence generic auto create magic doesn't
do anything with it (it does bare minimum for memhotplug to work).
I'd like to drop auto-generated node altogether and ask user to explicitly
provide needed -numa options (now with deprecation it's possible) if it's required.

> This added node is also not
> accounted for in numa_state->num_nodes, which returns zero.

that's probably a bug, parse_numa_node() should always increments on success,
can you check why it doesn't happen in your case?

> NUMA FORM1 affinity code didn't rely on numa_state information to do its
> job, but FORM2 does. As is now, this is the result of a pSeries guest
> with NUMA FORM2 affinity when no NUMA nodes is specified:
> 
> $ numactl -H available: 1 nodes (0) node 0 cpus: 0 node 0 size: 16222 MB
> node 0 free: 15681 MB No distance information available.
> 
> This can be amended in spapr_numa_FORM2_write_rtas_tables(). We're
> always expecting at least one NUMA node, and we're going to enforce that
> the local distance (the distance to the node to itself) is always 10.
> This allows for the proper creation of the NUMA distance tables, fixing
> the output of 'numactl -H' in the guest:
> 
> $ numactl -H available: 1 nodes (0) node 0 cpus: 0 node 0 size: 16222 MB
> node 0 free: 15685 MB node distances: node   0
>   0:  10
> 
> CC: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> 
> Igor,
> 
> CCing you as a FYI. I wasn't sure whether there is a reason for
> numa_complete_configuration() not adding distance info an update 'num_nodes'
> for the auto-generated NUMA node, I decided to handle this case in
> pseries side instead.
> 
> 
> 
>  hw/ppc/spapr_numa.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 659513b405..d8caf5f6bd 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -499,7 +499,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>  {
>      MachineState *ms = MACHINE(spapr);
>      NodeInfo *numa_info = ms->numa_state->nodes;
> -    int nb_numa_nodes = ms->numa_state->num_nodes;
> +    int nb_numa_nodes = ms->numa_state->num_nodes ?: 1;
>      int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
>      g_autofree uint32_t *lookup_index_table = NULL;
>      g_autofree uint32_t *distance_table = NULL;
> @@ -539,6 +539,17 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>  
>      for (src = 0; src < nb_numa_nodes; src++) {
>          for (dst = 0; dst < nb_numa_nodes; dst++) {
> +            /*
> +             * We need to be explicit with the local distance
> +             * value to cover the case where the user didn't added any
> +             * NUMA nodes, but QEMU adds the default NUMA node without
> +             * adding the numa_info to retrieve the info from.
> +             */
> +            if (src == dst) {
> +                node_distances[i++] = 10;
> +                continue;
> +            }
> +
>              node_distances[i++] = numa_info[src].distance[dst];
>          }
>      }


