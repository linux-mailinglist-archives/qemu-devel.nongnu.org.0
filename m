Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926B3D23D1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:50:46 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YA1-00043s-9B
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6Y7B-0001z0-QE
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6Y78-0001Kw-Hm
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626958065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFD7mamgYUWAAXhOta43u+kLLwXP7siJJQRD0zlv2lE=;
 b=KJcZxPM0NenBDZ7L/s2sW0G77TbBH8AqaLWslI+Prvn7o8WhZlVWCbw4FkdA25k8xoXZ4Y
 Rqb+3GpTZcX4AUVAvLyqG6UEfAozvtk5VpQvMk+9GMarLlOoc41WCVPw+2lV8aRAJs5EDO
 URZ3TAKvZfMpEpRlIOjztWkGR6AUnXo=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-TYNI9Kp9MAqK_yMdbh-GUQ-1; Thu, 22 Jul 2021 08:47:44 -0400
X-MC-Unique: TYNI9Kp9MAqK_yMdbh-GUQ-1
Received: by mail-io1-f71.google.com with SMTP id
 k2-20020a5d8b020000b029050b6f9cfe31so3933297ion.11
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 05:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bFD7mamgYUWAAXhOta43u+kLLwXP7siJJQRD0zlv2lE=;
 b=TgM1xhbhzuLVKGA2x1oVVJMMNfWgZEzpKCb6lNDpChrIC4B0UxHHGf+Or8PuhIc+Jf
 gY8fA6H37aT6J8iq/gFu8SLcuS8VPOYz3J4NBo8SLGUFm9Q19MFRQiUcYEyWfEKLgb65
 AMBRGV1o/5dfHecTMhaUkpckaOHwfX7fDRwkY3xMmPuujYX8hWDBG0CSyULcmJ+J4HCn
 d/iIo9R1KqLE0f+GHLF4RG+tmmFr6h+fdB4okZFWuaVPMKRlZXLR00AXnAGzbrt/SI6u
 Y92nC3ANUYtZ+R5IBrLfXvnJ/LsX8adGzxfQG8JbgRo+WfjvRvxJBYArxxSBBSVwTl75
 K9cg==
X-Gm-Message-State: AOAM533fDQySqZS/a7Xmu/Udrv/5LKYKnFde+iuJksR9NuLRM6isBdLK
 rnQeMPRMFY/N64O1rAK2J+QyINEQkfeHXoqlvs4C6XlC39fiXVnnRcQTDqZGcDpc2KxHjBxroCn
 5whZPHXH5xSrjTno=
X-Received: by 2002:a92:c24c:: with SMTP id k12mr27777134ilo.28.1626958063648; 
 Thu, 22 Jul 2021 05:47:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDOOkAx+K2C4zWBaI+QBHhBu6dWtFG8LLoqAJuk7W94g/mw0tvpIwcKtyYFPnrB0S8qxy6sQ==
X-Received: by 2002:a92:c24c:: with SMTP id k12mr27777106ilo.28.1626958063372; 
 Thu, 22 Jul 2021 05:47:43 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id 204sm16092628ioc.50.2021.07.22.05.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 05:47:42 -0700 (PDT)
Date: Thu, 22 Jul 2021 14:47:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 05/11] machine: Improve the error reporting of
 smp parsing
Message-ID: <20210722124740.bjukv2odxe4m4o5c@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-6-wangyanan55@huawei.com>
 <20210719165337.goazi5iwmmtz5jpg@gator>
 <f235161b-09cc-269b-9adf-c02f03e427e2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f235161b-09cc-269b-9adf-c02f03e427e2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 04:10:32PM +0800, wangyanan (Y) wrote:
> On 2021/7/20 0:53, Andrew Jones wrote:
> > On Mon, Jul 19, 2021 at 11:20:37AM +0800, Yanan Wang wrote:
> > > We totally have two requirements for a valid SMP configuration:
> > s/totally//
> > 
> > > the sum of "sockets * dies * cores * threads" must represent all
> > the product
> > 
> > > the possible cpus, i.e., max_cpus, and must include the initial
> > > present cpus, i.e., smp_cpus.
> > > 
> > > We only need to ensure "sockets * dies * cores * threads == maxcpus"
> > > at first and then ensure "sockets * dies * cores * threads >= cpus".
> > Or, "maxcpus >= cpus"
> > 
> > > With a reasonable order of the sanity-check, we can simplify the
> > > error reporting code.
> > > 
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/core/machine.c | 25 ++++++++++---------------
> > >   1 file changed, 10 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index 668f0a1553..8b4d07d3fc 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -788,21 +788,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > >       cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
> > >       maxcpus = maxcpus > 0 ? maxcpus : cpus;
> > > -    if (sockets * dies * cores * threads < cpus) {
> > > -        g_autofree char *dies_msg = g_strdup_printf(
> > > -            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> > > -        error_setg(errp, "cpu topology: "
> > > -                   "sockets (%u)%s * cores (%u) * threads (%u) < "
> > > -                   "smp_cpus (%u)",
> > > -                   sockets, dies_msg, cores, threads, cpus);
> > > -        return;
> > > -    }
> > > -
> > > -    if (maxcpus < cpus) {
> > > -        error_setg(errp, "maxcpus must be equal to or greater than smp");
> > > -        return;
> > > -    }
> > This may be redundant when determining a valid config, but by checking it
> > separately we can provide a more useful error message.
> Yes, this message is more useful. Can we also report the exact values of the
> parameters within this error message ?

sure

> How about the following:
> 
> if (sockets * cores * threads != maxcpus) {
>     error_setg("product of the topology must be equal to maxcpus"
>                "sockets (%u) * cores (%u) * threads (%u)"
>                "!= maxcpus (%u)",
>                sockets, cores, threads, maxcpus);
> return;
> }
> 
> if (maxcpus < cpus) {
>     error_setg("maxcpus must be equal to or greater than smp:"
>                "sockets (%u) * cores (%u) * threads (%u)"
>                "== maxcpus (%u) < smp_cpus (%u)",
>                sockets, cores, threads, maxcpus, cpus);
> return;
> }

OK by me

Thanks,
drew

> 
> Thanks,
> Yanan
> .
> > > -
> > >       if (sockets * dies * cores * threads != maxcpus) {
> > >           g_autofree char *dies_msg = g_strdup_printf(
> > >               mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> > > @@ -814,6 +799,16 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> > >           return;
> > >       }
> > > +    if (sockets * dies * cores * threads < cpus) {
> > > +        g_autofree char *dies_msg = g_strdup_printf(
> > > +            mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> > > +        error_setg(errp, "Invalid CPU topology: "
> > > +                   "sockets (%u)%s * cores (%u) * threads (%u) < "
> > > +                   "smp_cpus (%u)",
> > > +                   sockets, dies_msg, cores, threads, cpus);
> > > +        return;
> > > +    }
> > > +
> > >       ms->smp.cpus = cpus;
> > >       ms->smp.sockets = sockets;
> > >       ms->smp.dies = dies;
> > > -- 
> > > 2.19.1
> > > 
> > I'm not sure we need this patch.
> > 
> > Thanks,
> > drew
> > 
> > .
> 


