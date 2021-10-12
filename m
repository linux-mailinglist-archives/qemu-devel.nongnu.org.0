Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76840429DE8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:43:38 +0200 (CEST)
Received: from localhost ([::1]:58940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maBVh-00017G-IV
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maBSA-0007qr-C8
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:39:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maBS8-0001bS-Q8
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634020795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sg0ZUIe2qujzGohFbDm5tFYCs8RdfXL+QYfcG1lJnYs=;
 b=C7iOR/G1ZLopjtayfLFeHas3vlRW41MlY7+4jm9tJF2KYGWXzMjVPaQei5INqzxNTGZ8/m
 SYgg/zcAEIHs14RzLF6Ky8vmCz3+7NZhnhKRxPT+SMrYDNY4x4FTuzkCA8GL4B1NAmC1gz
 v4Rr/WK4CQTLq8Iee8ps+8OyGtIZc3A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-IVIYliaxOg27WaQTsAcYqA-1; Tue, 12 Oct 2021 02:39:54 -0400
X-MC-Unique: IVIYliaxOg27WaQTsAcYqA-1
Received: by mail-ed1-f71.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso17958578edf.7
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 23:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sg0ZUIe2qujzGohFbDm5tFYCs8RdfXL+QYfcG1lJnYs=;
 b=3wzUmLr8NxzZLxxE42az+A+GFU+z6/5CncSTp3XKkquRTt59DXPf0zzx5oEflpB/Nk
 7Cv8rdYo0rIJ2ew5S9uq3ODRwuGW8I7WNRrnHdkyIj5t5GZyZl4DjKPUH7qTGkXoAfsw
 azZ87G8kuD5vMwoIRTWK7hdb8V2sogbwv98lL72PsBDchg6om90NrWqLAxyY7zt1hP81
 3VedV1NKBQH/tRZIKBSetX980eAm5iP3ZaKqZ5v1o7x7fWc58lltBAzFYSfP1mXykVlz
 4GW5Tw+kNBbDL3mgvLdfE2yAfDvRIPgiyZVjgYhlANNx889cSOVrwlewW8MiIFIahEyn
 qGJQ==
X-Gm-Message-State: AOAM5332fohoHFLWwhEc6Hz0P1AVtIl2QPfVrbuy2NsB/b0P794Ki8tz
 Y79JD+OOo2QysKY/Wwm/i0hxoAnkiTvs+gaLjYZhG2n9DZhxaqYdlBc4a9E/wC7LbhQMOaJH7eF
 neg+tSglMBN8l4B8=
X-Received: by 2002:a05:6402:354a:: with SMTP id
 f10mr44808294edd.365.1634020793489; 
 Mon, 11 Oct 2021 23:39:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC7a6VNJZz7CYeROUEptCLvCQGT96U6UpFJeXtNJ3Vwv2Qwv5zglTy5y61FhwXhu3bT2vttg==
X-Received: by 2002:a05:6402:354a:: with SMTP id
 f10mr44808263edd.365.1634020793172; 
 Mon, 11 Oct 2021 23:39:53 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id n23sm5328248edw.75.2021.10.11.23.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 23:39:52 -0700 (PDT)
Date: Tue, 12 Oct 2021 08:39:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2 1/2] numa: Set default distance map if needed
Message-ID: <20211012063951.iopcrftqtw67exln@gator.home>
References: <20211012063603.166255-1-gshan@redhat.com>
 <20211012063603.166255-2-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012063603.166255-2-gshan@redhat.com>
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 02:36:02PM +0800, Gavin Shan wrote:
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
> are 10 and 20 separately. However, this is going to change the
> hardware description of the guest in this particular scenario.
> It's fine as the guest should be tolerant to ignore the distance
> map completely or parse it properly by following the device-tree
> specification.
> 
> This introduces an extra parameter to the exiting function
> complete_init_numa_distance() to generate the default distance
> map when no node pair distances are provided by user.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/core/numa.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


