Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BD4147BC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:23:13 +0200 (CEST)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0LI-0004N8-Op
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT0Fy-0002mG-TJ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT0Fu-00034b-2x
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632309456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tw/cgwzD45WQazQ9NZ96t4YX4tXxEnSWpn9NYgqn5P8=;
 b=Sc+RuiDEy0jZQirgMjAaXqKMaAE9iJ0RDPB0Cvue6/mAYL5LUVEtconYCXvszwRvL76aqi
 CC3iWdLbTixK9YUzicvdqUsEKC2g0KgKa07pQcpiPBHUdG02Z66Pum4bWwQEkaOQJdN1L2
 Am/5gbNVAICIvpmOgEQq/Kp2EkuDsGI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-vOqPyy9GOR2FSMYtupedDw-1; Wed, 22 Sep 2021 07:17:35 -0400
X-MC-Unique: vOqPyy9GOR2FSMYtupedDw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j16-20020adfa550000000b0016012acc443so1819107wrb.14
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 04:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tw/cgwzD45WQazQ9NZ96t4YX4tXxEnSWpn9NYgqn5P8=;
 b=unJQmHmOkgmcugXq+GhDz5LzxZFNZ7qnKhPU2QdBdN0KIdy2pI8StOJoITgQ+Tyu/l
 4cwwYRc+PfJwR7DRkEG4Cj+X5UIwS2ZD5svyr5GtVp5RTf8nCzo+Ks8geo4nY4Nmnmkr
 R63ws6XtzEzQbK24tXzJ7M5x4HklhX/ohRLyx8I7ixzwa391+9+IIjryuBV1hM6/hp/9
 xnVUlOCKBp3LQFCTX4iA1qGwkHX/yYN233LXCOmhmGJEjj9QDX0UrFcn04cwYfnZ5UNQ
 37PZsL73ZG+owta0+YdXSlE4f6Is/n5UagYNM97Ymw/y4hzZDwzOZYXWNT3oxp3x+ja6
 npmA==
X-Gm-Message-State: AOAM533a02zf733bfAxCySLGuYy0ZdgyGev9H2rbgNuoblVFWR1vMHPO
 2x+4Ur0lwtAZt+Mq/yoVqOP7eXvERajY4tu4ekNqU528nUhpyLss65auxkzeGywT05U3PpikuGa
 6+TBtVL9hF4En1Ok=
X-Received: by 2002:a5d:4b4f:: with SMTP id w15mr41280489wrs.175.1632309454293; 
 Wed, 22 Sep 2021 04:17:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk3uuWJLrrIcW/LQhI6/PYggJC1mvqgLlIOgBfZPSIjuS4qA4mQFvcBkqU1eSsrF4yGjraGw==
X-Received: by 2002:a5d:4b4f:: with SMTP id w15mr41280466wrs.175.1632309454009; 
 Wed, 22 Sep 2021 04:17:34 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g205sm1769482wmg.18.2021.09.22.04.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 04:17:33 -0700 (PDT)
Message-ID: <78cc89be-4e4b-c23a-e40a-b41865037008@redhat.com>
Date: Wed, 22 Sep 2021 13:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210921194347.52347-1-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210921194347.52347-1-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 21:43, Daniel Henrique Barboza wrote:
> This patch has a handful of modifications for the recent added
> FORM2 support:
> 
> - there is no particular reason for both 'lookup_index_table' and
> 'distance_table' to be allocated in the heap, since their sizes are
> known right at the start of the function. Use static allocation in
> them to spare a couple of g_new0() calls;
> 
> - to not allocate more than the necessary size in 'distance_table'. At
> this moment the array is oversized due to allocating uint32_t for all
> elements, when most of them fits in an uint8_t;
> 
> - create a NUMA_LOCAL_DISTANCE macro to avoid hardcoding the local
> distance value.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/spapr_numa.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 58d5dc7084..039a0439c6 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -19,6 +19,9 @@
>   /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>   #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
>   
> +/* Macro to avoid hardcoding the local distance value */
> +#define NUMA_LOCAL_DISTANCE         10
> +
>   /*
>    * Retrieves max_dist_ref_points of the current NUMA affinity.
>    */
> @@ -500,17 +503,21 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>       MachineState *ms = MACHINE(spapr);
>       NodeInfo *numa_info = ms->numa_state->nodes;
>       int nb_numa_nodes = ms->numa_state->num_nodes;
> +    /* Lookup index table has an extra uint32_t with its length */
> +    uint32_t lookup_index_table[nb_numa_nodes + 1];
>       int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
> -    g_autofree uint32_t *lookup_index_table = NULL;
> -    g_autofree uint32_t *distance_table = NULL;
> -    int src, dst, i, distance_table_size;
> -    uint8_t *node_distances;

This should have be of ptrdiff_t type.

> +    /*
> +     * Distance table is an uint8_t array with a leading uint32_t
> +     * containing its length.
> +     */
> +    uint8_t distance_table[distance_table_entries + 4];

The previous code seems better by using the heap, now we have
to worry about stack overflow...

> +    uint32_t *distance_table_length;

Please drop, ...

> +    int src, dst, i;
>   
>       /*
>        * ibm,numa-lookup-index-table: array with length and a
>        * list of NUMA ids present in the guest.
>        */
> -    lookup_index_table = g_new0(uint32_t, nb_numa_nodes + 1);
>       lookup_index_table[0] = cpu_to_be32(nb_numa_nodes);
>   
>       for (i = 0; i < nb_numa_nodes; i++) {
> @@ -518,8 +525,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>       }
>   
>       _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
> -                     lookup_index_table,
> -                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
> +                     lookup_index_table, sizeof(lookup_index_table)));
>   
>       /*
>        * ibm,numa-distance-table: contains all node distances. First
> @@ -531,11 +537,10 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>        * array because NUMA ids can be sparse (node 0 is the first,
>        * node 8 is the second ...).
>        */
> -    distance_table = g_new0(uint32_t, distance_table_entries + 1);
> -    distance_table[0] = cpu_to_be32(distance_table_entries);
> +    distance_table_length = (uint32_t *)distance_table;
> +    distance_table_length[0] = cpu_to_be32(distance_table_entries);

... and use instead:

        stl_be_p(distance_table, distance_table_entries);

> -    node_distances = (uint8_t *)&distance_table[1];
> -    i = 0;
> +    i = 4;
>   
>       for (src = 0; src < nb_numa_nodes; src++) {
>           for (dst = 0; dst < nb_numa_nodes; dst++) {
> @@ -546,18 +551,16 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>                * adding the numa_info to retrieve distance info from.
>                */
>               if (src == dst) {
> -                node_distances[i++] = 10;
> +                distance_table[i++] = NUMA_LOCAL_DISTANCE;
>                   continue;
>               }
>   
> -            node_distances[i++] = numa_info[src].distance[dst];
> +            distance_table[i++] = numa_info[src].distance[dst];
>           }
>       }
>   
> -    distance_table_size = distance_table_entries * sizeof(uint8_t) +
> -                          sizeof(uint32_t);
>       _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
> -                     distance_table, distance_table_size));
> +                     distance_table, sizeof(distance_table)));
>   }
>   
>   /*
> 


