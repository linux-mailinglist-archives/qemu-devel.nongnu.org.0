Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5BE4F1453
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 14:05:01 +0200 (CEST)
Received: from localhost ([::1]:57350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbLS7-0002W3-Sw
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 08:04:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nbLQg-0001Wz-5Y
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 08:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nbLQb-0002Im-6m
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 08:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649073803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYh0ZCQabxEewuaJGpqXzDYGhcd5FkfM22Q4Uw4AyGc=;
 b=OWGjJuBTBLrX3oNEnTMapowEeyNWAGoQend2EYWYImSggxnxQKIuqg/dwv1WTFc+uxlZfY
 xVaUf5Zy10bAbbWATxUgioG/gxD9bvDb8ROIGvBhRKxU/SsLf86ahaTXS7rt50pL+/qnzQ
 d1aQXwQwhGIQu37hJNuEvukCuNRv+Xs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-hSVYUKHeNrSGttGmjc6z_A-1; Mon, 04 Apr 2022 08:03:22 -0400
X-MC-Unique: hSVYUKHeNrSGttGmjc6z_A-1
Received: by mail-ej1-f70.google.com with SMTP id
 sg13-20020a170907a40d00b006e7e8234ae2so1279470ejc.2
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 05:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYh0ZCQabxEewuaJGpqXzDYGhcd5FkfM22Q4Uw4AyGc=;
 b=dL5hpz+dL1LpM+xMI1nbnONW3y9Vhx1w3LxzV5blqEZtu70kYp1abotqLJ9P6jIwMN
 lq3oNNwltozP/gBCGkU1cO5k4oIDvCeq8s4ectWWWzokF5Qjy7dHiAMVhLJChJGyOsCR
 VuWNudThQs68PrzYUuS/5tzLAIsdExejAUkKPr7mvUylri1WBhAphm05M7liPUfjxiKq
 DayNHGrH9viFViQKPJzqclA3IHtMHIb6fxkLaYZYGLk1j6UvuZ+obUAsqUvib3Ph2Uka
 lx8ahpXLzOjJLv4iandAoazo6C0FnJkj8675UPLXGS5hAKCz9TpJazrfNjTrseIaW/bu
 azdQ==
X-Gm-Message-State: AOAM530XGX7EDcpCBBNS5xjCboyrJzef4d3HNTyTN4Yo9f+Nz/UV6KhC
 ZcEDgu7rPkBZCwiblxazjXTjUw2STUgXKSOBvUxbml1KKWqkexz8UdIclMEbkuD8bqyk6dxNzDJ
 g4EOo7xmv0xZfMC4=
X-Received: by 2002:a05:6402:2816:b0:419:2a8e:6d3e with SMTP id
 h22-20020a056402281600b004192a8e6d3emr32236164ede.47.1649073800811; 
 Mon, 04 Apr 2022 05:03:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg6OE9U8NvZtqlpgR41e1weJ1AZ9gFHx3g/McrrVGFolFkE+r9NST4OcsZ/sGRMuRn5cypSw==
X-Received: by 2002:a05:6402:2816:b0:419:2a8e:6d3e with SMTP id
 h22-20020a056402281600b004192a8e6d3emr32236121ede.47.1649073800459; 
 Mon, 04 Apr 2022 05:03:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 lj20-20020a170906f9d400b006e7f1e1f4a0sm1158595ejb.60.2022.04.04.05.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 05:03:19 -0700 (PDT)
Date: Mon, 4 Apr 2022 14:03:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220404140318.5afd6c58@redhat.com>
In-Reply-To: <17bd5453-ef36-6bbc-3913-d806e0ed7a38@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <YkquyMTJqq+jFvm0@redhat.com>
 <17bd5453-ef36-6bbc-3913-d806e0ed7a38@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, zhenyzha@redhat.com,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Apr 2022 18:48:00 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Daniel,
>=20
> On 4/4/22 4:39 PM, Daniel P. Berrang=C3=A9 wrote:
> > On Sun, Apr 03, 2022 at 10:59:51PM +0800, Gavin Shan wrote: =20
> >> Currently, the SMP configuration isn't considered when the CPU
> >> topology is populated. In this case, it's impossible to provide
> >> the default CPU-to-NUMA mapping or association based on the socket
> >> ID of the given CPU.
> >>
> >> This takes account of SMP configuration when the CPU topology
> >> is populated. The die ID for the given CPU isn't assigned since
> >> it's not supported on arm/virt machine yet.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   hw/arm/virt.c | 16 +++++++++++++++-
> >>   1 file changed, 15 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index d2e5ecd234..3174526730 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_ar=
ch_ids(MachineState *ms)
> >>       int n;
> >>       unsigned int max_cpus =3D ms->smp.max_cpus;
> >>       VirtMachineState *vms =3D VIRT_MACHINE(ms);
> >> +    MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> >>  =20
> >>       if (ms->possible_cpus) {
> >>           assert(ms->possible_cpus->len =3D=3D max_cpus);
> >> @@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_cpu_a=
rch_ids(MachineState *ms)
> >>           ms->possible_cpus->cpus[n].type =3D ms->cpu_type;
> >>           ms->possible_cpus->cpus[n].arch_id =3D
> >>               virt_cpu_mp_affinity(vms, n);
> >> +
> >> +        assert(!mc->smp_props.dies_supported);
> >> +        ms->possible_cpus->cpus[n].props.has_socket_id =3D true;
> >> +        ms->possible_cpus->cpus[n].props.socket_id =3D
> >> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads)=
) %
> >> +            ms->smp.sockets;
> >> +        ms->possible_cpus->cpus[n].props.has_cluster_id =3D true;
> >> +        ms->possible_cpus->cpus[n].props.cluster_id =3D
> >> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.cluster=
s;
> >> +        ms->possible_cpus->cpus[n].props.has_core_id =3D true;
> >> +        ms->possible_cpus->cpus[n].props.core_id =3D
> >> +            (n / ms->smp.threads) % ms->smp.cores;
> >>           ms->possible_cpus->cpus[n].props.has_thread_id =3D true;
> >> -        ms->possible_cpus->cpus[n].props.thread_id =3D n;
> >> +        ms->possible_cpus->cpus[n].props.thread_id =3D
> >> +            n % ms->smp.threads; =20
> >=20
> > Does this need to be conditionalized d behind a machine property, so th=
at
> > we don't change behaviour of existing machine type versions ?
> >  =20
>=20
> I think we probably needn't to do that because the default NUMA node
> for the given CPU is returned based on the socket ID in next patch.
> The socket ID is calculated in this patch. Otherwise, we will see
> CPU topology broken warnings in Linux guest. I think we need to fix
> this issue for all machine type versions.

Agreed.
Also guest-wise it's ACPI only change, which is 'firmware' part of QEMU,
and by default we don't to version those changes unless we a pressed
into it (i.e the same policy that goes for bundled firmware)

> Thanks,
> Gavin
>=20


