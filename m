Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18E73C5EC6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:03:38 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xT7-0002kO-LN
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xQZ-0008Re-KM
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xQV-0005xY-Hq
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626102055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bMlmJZV+doWlRhm+9maCXSTotEiscMHns7reK54bBEQ=;
 b=Eep5QiHEmkdQgTsrdTbwUMEoeyB5F80nj+Lu7SVsySyMQqqBfZmfjkGa2wQFd2mbmENoCz
 enAGIDTg0iLZ1qRsyo3N/hTPgqAVfRCiL0YUDVGLVzyoCYxJv4hFKNwtrguFMT6sQXPVVr
 sZHsoxL6nPUbG6oKwdYy/2GquEPtKgo=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-h4KOBQcbNcCE2DYYXM9qjA-1; Mon, 12 Jul 2021 11:00:51 -0400
X-MC-Unique: h4KOBQcbNcCE2DYYXM9qjA-1
Received: by mail-io1-f70.google.com with SMTP id
 x21-20020a5d99150000b02904e00bb129f0so11970881iol.18
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bMlmJZV+doWlRhm+9maCXSTotEiscMHns7reK54bBEQ=;
 b=hhPey6Y9Xq6hKkRSOO5ZxXtw/sVwhEnAFck4rqqyCWcf85KUJRHD8qBbP0Bvqharws
 xe6WYV/nIrr/WrVcA8+WfhsqXOgqiawP1kWRm87UOwpFZSAVYCWG/RC5Rx1nacGZNd/m
 k5UJZgCZMrc8dtwnDQS/ZJRzO5owIiMc/Du9HN+bmB7OjbxXKz5mg3fJPS3eUDl6Hbqk
 4sU5HLAtGO208bV5/mZAyOYnlPdKdZPmcKI83dyvK1z/NBeuMc1juyQ+hrocRJf7BBmS
 mBaVKEFpSGK95CsSvsYpIZl10vS0PoIjn4dLSoVdgoYqCOmECDZswZ/0quPS2uLlQCl5
 bgzg==
X-Gm-Message-State: AOAM533QBo9rV7BPydFqh+JqZkpknFu+CERFLwjYRgDOIm3MSDdydt/M
 M1TFdpJdFPUuFodNwWo7CA0B1YwOk3X80QKyABV63doL+0um+BGUNVLkdI1aExU8lVDyJjH68PV
 0MlndE7gf+s30pTg=
X-Received: by 2002:a05:6602:737:: with SMTP id
 g23mr22432690iox.72.1626102051223; 
 Mon, 12 Jul 2021 08:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLZ9Gj29fAEOj28TaNQ7coCkW1HEF/W28J5LTWspsbOtn+ukaJY3smQZ2gyTwkTtVY71vUNg==
X-Received: by 2002:a05:6602:737:: with SMTP id
 g23mr22432671iox.72.1626102051087; 
 Mon, 12 Jul 2021 08:00:51 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id x16sm4546908ila.84.2021.07.12.08.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:00:50 -0700 (PDT)
Date: Mon, 12 Jul 2021 17:00:48 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 2/6] machine: Perform zero-check for the computed
 value of sockets
Message-ID: <20210712150048.mstqbseixgdxakkf@gator>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210702100739.13672-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 06:07:35PM +0800, Yanan Wang wrote:
> We currently perform zero-check (default the value to 1 if zeroed)
> for the computed values of cores/threads, to make sure they are at
> least 1. For consistency, we probably should also default sockets
> to 1 if the computed value is zero. Note that this won't affect
> any existing working cmdlines but will improve the error reporting
> of the invalid ones such as "-smp 8,maxcpus=9,cores=10,threads=1".

How does this help error checking? If the user input values that compute a
fractional (rounded down to zero with integer division) value, then we'll
catch that with the sockets*cores*threads == maxcpus test now, but we may
not catch that after this patch.

Thanks,
drew

> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 1 +
>  hw/i386/pc.c      | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f17bbe3275..1e194677cd 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -761,6 +761,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          } else {
>              maxcpus = maxcpus > 0 ? maxcpus : cpus;
>              sockets = maxcpus / (cores * threads);
> +            sockets = sockets > 0 ? sockets : 1;
>          }
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a9b22fdc01..a44511c937 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -729,6 +729,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>          } else {
>              maxcpus = maxcpus > 0 ? maxcpus : cpus;
>              sockets = maxcpus / (dies * cores * threads);
> +            sockets = sockets > 0 ? sockets : 1;
>          }
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> -- 
> 2.19.1
> 


