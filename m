Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7F3CE65D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:54:56 +0200 (CEST)
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WXf-0000zA-L5
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WWX-0007Vi-0L
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:53:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WWV-0006IT-0q
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626713622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p/hUNlHDQiO6q3KRC78vaBfwDAU7RFyDWCEFlWaZo90=;
 b=HNCuni39nyaL/ZTyl+yzYwkDvr5z2PqDEfT4ZNXtSTf11CpjMVUJdl192I+nj2nkFDoZnX
 PVegRj6OxBwewDhL8iYgUsg+xYtN6drH+9dfhOItDiJRsr6prLPel5jvjp5S45PKn1XQFm
 6PqLds1Fy+pAG9hFyrG29VU15rgEtkE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-96EaJ1l-OgqvZ_jl9KyRWw-1; Mon, 19 Jul 2021 12:53:40 -0400
X-MC-Unique: 96EaJ1l-OgqvZ_jl9KyRWw-1
Received: by mail-io1-f69.google.com with SMTP id
 v2-20020a5d94020000b02905058dc6c376so13008100ion.6
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 09:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p/hUNlHDQiO6q3KRC78vaBfwDAU7RFyDWCEFlWaZo90=;
 b=ToSVOTVctUu6ImXF/XMApHVLE2+3yPE3WRi05Wj3Cbx0loJAwzvblEIEt2shXYveFD
 OXUWBt2ZPU8zZRxVNPt9tSf6xBbFl5EdKOJC+R1eDQ3FdxaVQ9xD+cMp3mLsEAs3onQe
 zKyrR8ZO7Atv5jIGRKmpKq/dpxqkGk0Av9fZG5C2YjyvAVLFmJ2QKj+4Qm0iH1iDdGax
 Zaf9FXYo9yZDEerq7Suc5bNbFRYLdzIN1MtbbxymKEBhJD0V0T/ZK2FE2oIiODRZUJvk
 Xx+QiOVCEUthqjunHJewrLFnmYUKSwbq7Un8u4YaZko8VY/CKt6idVp45SI0XpJJP8CR
 Uv9w==
X-Gm-Message-State: AOAM532i8SnoqlN2UTLj3CM5Opc2MTFYhgHJtaMe5cdHZLCCrV9kHV14
 7r2rmwbL8p51wQFafY6BuSb5d8Fo862SQwN5dLcTjNBMyOBNMkS8pq4Ce2YiB6mBKUc13VyBNzd
 oDmQpQDYqXJfqtQs=
X-Received: by 2002:a05:6e02:c30:: with SMTP id
 q16mr14326894ilg.75.1626713620174; 
 Mon, 19 Jul 2021 09:53:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWVXrRXS3rau9FijfCFq3/5ZyKOh3x+0PA6frUyJrbtGSLBQJOeRufSlbQo9d6ssueFqCLEw==
X-Received: by 2002:a05:6e02:c30:: with SMTP id
 q16mr14326866ilg.75.1626713619884; 
 Mon, 19 Jul 2021 09:53:39 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id c16sm10401695ilo.72.2021.07.19.09.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 09:53:39 -0700 (PDT)
Date: Mon, 19 Jul 2021 18:53:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 05/11] machine: Improve the error reporting of
 smp parsing
Message-ID: <20210719165337.goazi5iwmmtz5jpg@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-6-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 11:20:37AM +0800, Yanan Wang wrote:
> We totally have two requirements for a valid SMP configuration:

s/totally//

> the sum of "sockets * dies * cores * threads" must represent all

the product

> the possible cpus, i.e., max_cpus, and must include the initial
> present cpus, i.e., smp_cpus.
> 
> We only need to ensure "sockets * dies * cores * threads == maxcpus"
> at first and then ensure "sockets * dies * cores * threads >= cpus".

Or, "maxcpus >= cpus"

> With a reasonable order of the sanity-check, we can simplify the
> error reporting code.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 668f0a1553..8b4d07d3fc 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -788,21 +788,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
>      maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -    if (sockets * dies * cores * threads < cpus) {
> -        g_autofree char *dies_msg = g_strdup_printf(
> -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> -        error_setg(errp, "cpu topology: "
> -                   "sockets (%u)%s * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> -                   sockets, dies_msg, cores, threads, cpus);
> -        return;
> -    }
> -
> -    if (maxcpus < cpus) {
> -        error_setg(errp, "maxcpus must be equal to or greater than smp");
> -        return;
> -    }

This may be redundant when determining a valid config, but by checking it
separately we can provide a more useful error message.

> -
>      if (sockets * dies * cores * threads != maxcpus) {
>          g_autofree char *dies_msg = g_strdup_printf(
>              mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> @@ -814,6 +799,16 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> +    if (sockets * dies * cores * threads < cpus) {
> +        g_autofree char *dies_msg = g_strdup_printf(
> +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
> +                   "smp_cpus (%u)",
> +                   sockets, dies_msg, cores, threads, cpus);
> +        return;
> +    }
> +
>      ms->smp.cpus = cpus;
>      ms->smp.sockets = sockets;
>      ms->smp.dies = dies;
> -- 
> 2.19.1
>

I'm not sure we need this patch.

Thanks,
drew 


