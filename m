Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F402549C4BB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 08:50:40 +0100 (CET)
Received: from localhost ([::1]:43120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCd4c-000329-90
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 02:50:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCcwH-0008UF-CB
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCcwD-0002XX-BD
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643182912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h8TX9lWvMUa/9+p2TzMHAMy1MtuPsfO8IzjYSVB8cfg=;
 b=ag6+6qiZns35LZ5C3d1ZlvlVbLdDYBoCxucqKEK2dFOyPmzynHaB+NjOyHKLDtomPYCjdS
 NetytWXXJTYn5UD+HzrWvsTGqPASpTfuEdpW38m/PPreI6ibOp1Pzvr8He8GZwr2P83lMb
 HOGjhqF6cME6HSYIit4ci37JHb9NDvs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-9eHDzVLNOIeE-7cSsNLJaQ-1; Wed, 26 Jan 2022 02:41:48 -0500
X-MC-Unique: 9eHDzVLNOIeE-7cSsNLJaQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 el8-20020a056402360800b00403bbdcef64so16283008edb.14
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 23:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h8TX9lWvMUa/9+p2TzMHAMy1MtuPsfO8IzjYSVB8cfg=;
 b=pa1g0NtIXrfvukDl/c6jdRKSkzemD9OFHsKBwYKKCIdofzAaO0P1fA/+WPCLzOhKF4
 gfCqfuvZC9hxN4gtqoFE1DDILmuQik+eZi7zZepLKC7ZC1mTvpOwt5t5ib4Zf8MX+/Gz
 JmembacTEynVdy0IlFCBNk3kun3CyPzyAAS7qpt+h+4B0f1s9aLL45QQZ0xrAtBmHLow
 Syz0x461HswXNLi3Tc5kMr7Qa8iofpTs8RdPrFx0gTLfHWqiENyOsLhHtJl88+wjS7Wq
 MYjS9fturAk1tjfqIM3INOR+dF2L9mtAiFH5XWLBgvhUdVEit9WQl5nvIFwvr9uI3kaz
 o1Yg==
X-Gm-Message-State: AOAM532cNsnPU2O8dcLz+6is0EGchMaQKpq1oZQkxB2u0Onb6hEqqOTO
 qqsltAABBvX1cnopCbbIKL+pxZictHLVLZXkJIntLO869YxApuSscvTxOWm1zX3/8SRSDYYDdyV
 ywInVQCozX+TdBK4=
X-Received: by 2002:a17:907:2daa:: with SMTP id
 gt42mr18654493ejc.704.1643182907352; 
 Tue, 25 Jan 2022 23:41:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysYd7dbGdXEceT4D+yVJWMUytobFLQl2DSWVokjIytMwZWPezM8MvEBY0JbD1/ijZrvckDEQ==
X-Received: by 2002:a17:907:2daa:: with SMTP id
 gt42mr18654471ejc.704.1643182907130; 
 Tue, 25 Jan 2022 23:41:47 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id n25sm5677730ejx.92.2022.01.25.23.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 23:41:46 -0800 (PST)
Date: Wed, 26 Jan 2022 08:41:44 +0100
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220126074144.hq2vvnex6ajg4pe7@gator>
References: <20220126052410.36380-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220126052410.36380-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


CCing Igor.

Thanks,
drew

On Wed, Jan 26, 2022 at 01:24:10PM +0800, Gavin Shan wrote:
> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
> when it isn't provided explicitly. However, the CPU topology isn't fully
> considered in the default association and it causes CPU topology broken
> warnings on booting Linux guest.
> 
> For example, the following warning messages are observed when the Linux guest
> is booted with the following command lines.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=host               \
>   -cpu host                                               \
>   -smp 6,sockets=2,cores=3,threads=1                      \
>   -m 1024M,slots=16,maxmem=64G                            \
>   -object memory-backend-ram,id=mem0,size=128M            \
>   -object memory-backend-ram,id=mem1,size=128M            \
>   -object memory-backend-ram,id=mem2,size=128M            \
>   -object memory-backend-ram,id=mem3,size=128M            \
>   -object memory-backend-ram,id=mem4,size=128M            \
>   -object memory-backend-ram,id=mem4,size=384M            \
>   -numa node,nodeid=0,memdev=mem0                         \
>   -numa node,nodeid=1,memdev=mem1                         \
>   -numa node,nodeid=2,memdev=mem2                         \
>   -numa node,nodeid=3,memdev=mem3                         \
>   -numa node,nodeid=4,memdev=mem4                         \
>   -numa node,nodeid=5,memdev=mem5
>          :
>   alternatives: patching kernel code
>   BUG: arch topology borken
>   the CLS domain not a subset of the MC domain
>   <the above error log repeats>
>   BUG: arch topology borken
>   the DIE domain not a subset of the NODE domain
> 
> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
> are associated with NODE#0 to NODE#5 separately. That's incorrect because
> CPU#0/1/2 should be associated with same NUMA node because they're seated
> in same socket.
> 
> This fixes the issue by considering the socket when default CPU-to-NUMA
> is given. With this applied, no more CPU topology broken warnings are seen
> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but there are
> no CPUs associated with NODE#2/3/4/5.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 141350bf21..b4a95522d3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  
>  static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>  {
> -    return idx % ms->numa_state->num_nodes;
> +    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>  }
>  
>  static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> -- 
> 2.23.0
> 


