Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A14130A7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:18:17 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSbuq-0004WH-ND
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSbt7-0002qN-7x
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:16:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSbt5-000602-Bi
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632215786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwDpI17DH3P3i3Cr8gw05EiZygcA7dQVITsrkZtlR/A=;
 b=FnH4vSBCmf7Z65emWvLh4Mjo3z/PBoQN96M26IOJNPMDS5JoRs1/JFEeOFwpOooLPjKbvB
 laFQMgaFHYuHmsn176RxzLc1o6ZQD85dmxbypzP87DU272YnrqqXh2OXKeXG0U1jTifV2d
 pcujYYom+VZ5X+0mOu2WxtMiBrUszQ8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-EB7eN8HfNOS1dcJX02bxnA-1; Tue, 21 Sep 2021 05:16:25 -0400
X-MC-Unique: EB7eN8HfNOS1dcJX02bxnA-1
Received: by mail-ed1-f71.google.com with SMTP id
 2-20020a508e02000000b003d871759f5dso4550026edw.10
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XwDpI17DH3P3i3Cr8gw05EiZygcA7dQVITsrkZtlR/A=;
 b=jg582FLbymUA99KiA7aVoZQH0G6W6pbE0Llx5urNmWiLoXHo95G7Yz3cddXo2Ia7jx
 KcpZO6nGiwoXu3/OVVDubpGWc8e8A/gLgPTGPOMd300CMr5grR9TAy/vBP5rhcN4JQBU
 WXxuGAY7DvpKuSk3/HbgW1v+/gVM9cSkXeyVJx6Za8CnxoubgxbHDKX52Gv6HXzxhgvh
 AWgUO7N3Xh9XDWwCvaID+ZEL0H1m1tMeaPH2PBrMlb9KYrgFxPhg8pLsPb2Hxn1DzF0L
 OQSKXF3x9g/SwMdsNJs8sb6e47EtonleoMzIOiZOmM8Mig6PK3A4d8xeH7tBH1ddx4JJ
 2Qfw==
X-Gm-Message-State: AOAM530c0gcFjhHpAHhCpQsF6or8+NNT/dA6ocGuuMSwRADN1dt+PkNe
 9ho2Y1yRO5zL+IDp/EBx7qDSoKvDHCv/UEufbhusoXqOp7D23iqJOAf+ZfQ9LhBRoByXMdm4NSM
 18HhZJ5nNINeCRs0=
X-Received: by 2002:a17:906:dbcb:: with SMTP id
 yc11mr33950681ejb.111.1632215784125; 
 Tue, 21 Sep 2021 02:16:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4DZgGR9HZ/MyWGvmFfnSOjJIbyhCNmWE1sFU0dRO5ei9Ue/F8tkPaRd86sDbZoLoWUP3NtA==
X-Received: by 2002:a17:906:dbcb:: with SMTP id
 yc11mr33950669ejb.111.1632215784003; 
 Tue, 21 Sep 2021 02:16:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id w13sm8789698ede.24.2021.09.21.02.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 02:16:23 -0700 (PDT)
Date: Tue, 21 Sep 2021 11:16:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 7/7] spapr_numa.c: handle auto NUMA node with no
 distance info
Message-ID: <20210921111622.7d024cbf@redhat.com>
In-Reply-To: <20210917212802.424481-8-danielhb413@gmail.com>
References: <20210917212802.424481-1-danielhb413@gmail.com>
 <20210917212802.424481-8-danielhb413@gmail.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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

On Fri, 17 Sep 2021 18:28:02 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> numa_complete_configuration() in hw/core/numa.c always adds a NUMA node
> for the pSeries machine if none was specified, but without node distance
> information for the single node created.
> 
> NUMA FORM1 affinity code didn't rely on numa_state information to do its
> job, but FORM2 does. As is now, this is the result of a pSeries guest
> with NUMA FORM2 affinity when no NUMA nodes is specified:
> 
> $ numactl -H
> available: 1 nodes (0)
> node 0 cpus: 0
> node 0 size: 16222 MB
> node 0 free: 15681 MB
> No distance information available.
> 
> This can be amended in spapr_numa_FORM2_write_rtas_tables(). We're
> enforcing that the local distance (the distance to the node to itself) is
> always 10. This allows for the proper creation of the NUMA distance tables,
> fixing the output of 'numactl -H' in the guest:
> 
> $ numactl -H
> available: 1 nodes (0)
> node 0 cpus: 0
> node 0 size: 16222 MB
> node 0 free: 15685 MB
> node distances:
> node   0
>   0:  10
> 
> CC: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/ppc/spapr_numa.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 659513b405..0cead2e7f5 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -539,6 +539,17 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>  
>      for (src = 0; src < nb_numa_nodes; src++) {
>          for (dst = 0; dst < nb_numa_nodes; dst++) {
> +            /*
> +             * We need to be explicit with the local distance
> +             * value to cover the case where the user didn't added any
> +             * NUMA nodes, but QEMU adds the default NUMA node without
> +             * adding the numa_info to retrieve distance info from.
> +             */
> +            if (src == dst) {
> +                node_distances[i++] = 10;
> +                continue;
> +            }
> +
>              node_distances[i++] = numa_info[src].distance[dst];
>          }
>      }


