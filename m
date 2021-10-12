Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE342A130
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:33:44 +0200 (CEST)
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEAJ-0007ei-IN
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maDX4-0001lr-9Q
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maDX1-0004nd-JF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634028787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzoJzu8b+3oONIIaNP2U+v01qtn63ZrC9SGmnn0HdgE=;
 b=RNwu8pXuClBTpKzrN5AqqAAlX+Mi6Y55Usqx0wRQdi9yFT9Mohf0t+IfkRmSQuX8ZtPsbp
 iWPRGMYdQfVwKc0EyRmHYEao/LEEUtY6p7BFLGHsbdWvEzLU+YgVQSWsBDddHYMLrGy07+
 qSqhamiRRgonQQoJNd4wL4XiViqHN6Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-iTrDeX-wPpyt9srEoXJQ3w-1; Tue, 12 Oct 2021 04:53:03 -0400
X-MC-Unique: iTrDeX-wPpyt9srEoXJQ3w-1
Received: by mail-ed1-f71.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso18261557edf.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 01:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/H4Gs3COdVYAoGAcbWgKAfHqQvctZyCdwA+TUgd0iWY=;
 b=TIQeYMzzpQgr9RDL3Sel3vvwBMfF7zQ3eUHR6JdnjmWwUer602kSTPUt1eI9uAuqLn
 I1isdKYZtzR+QsJI0t0tRCEqMco/iAN9yttkW+FLQAHqUbKscsCqfWPPE0Lt66K40odv
 vM/sSIURQ5aJiHZpQlISbQk93BezQuEVqesqeW8BHASh10x3jkLlX3RsYBt5wHvYcg7L
 whOgntR4sMK+CoOBkCJefNZ9n+uqA15rbbQngwFYzjXPAAhqePTQjAAFnrdUtFD7jMvi
 UOuLiWf/IZ2hOmQaX57Bg+3jUcQ2sGwHNh/jZ8Jj9jsQf3YV1kB9ul0Ieoz0ielV7zYL
 lejw==
X-Gm-Message-State: AOAM530EQYnf/+mVDOd/uGIyop98vI8QbBEBw9NXyX+Kp4a/MqZVjsJH
 AjbpoTH3nC5arabG+/cdTlP9jQyclnUnZh5TA0phTi97EnMGiOzsyzYQjQegSG5sGMhxvukO+EU
 08EiBoQKP4VFzHSM=
X-Received: by 2002:a17:906:16d0:: with SMTP id
 t16mr31043474ejd.199.1634028782414; 
 Tue, 12 Oct 2021 01:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEabdSeQw3nH3OBiBudDHX7YVo8WluZgtyMMGED89M22YfmZBHDAnFAOidHVLXdzcVjSvpOg==
X-Received: by 2002:a17:906:16d0:: with SMTP id
 t16mr31043440ejd.199.1634028782119; 
 Tue, 12 Oct 2021 01:53:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id yz9sm4602172ejb.51.2021.10.12.01.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 01:53:01 -0700 (PDT)
Date: Tue, 12 Oct 2021 10:53:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
Message-ID: <20211012105300.1ef25440@redhat.com>
In-Reply-To: <845d3d5f-f9e9-d59d-c868-5a9825eb7fba@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
 <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
 <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
 <845d3d5f-f9e9-d59d-c868-5a9825eb7fba@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Oct 2021 08:50:25 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 12.10.21 00:17, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 10/11/21 23:21, Richard Henderson wrote: =20
> >> On 10/11/21 10:45 AM, David Hildenbrand wrote: =20
> >>>  =C2=A0 /**
> >>>  =C2=A0=C2=A0 * memory_region_is_mapped: returns true if #MemoryRegio=
n is mapped
> >>> - * into any address space.
> >>> + * into another #MemoryRegion directly. Will return false if the
> >>> + * #MemoryRegion is mapped indirectly via an alias. =20
> >>
> >> Hmm.=C2=A0 I guess.=C2=A0 It kinda sorta sounds like a bug, but I don'=
t know the
> >> interface well enough to tell. =20
> >=20
> > I tend to agree there is a generic issue with aliases, see:
> >=20
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg732527.html
> > then
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg799622.html
> > "memory: Directly dispatch alias accesses on origin memory region"
> >=20
> > The API description looks OK to me, I'd rather change the
> > implementation... Maybe we need a MR_ALIAS_FOREACH() macro?
> >  =20
>=20
> The API description regarding "address spaces" is certainly not
> correct.
>=20
> The question is if we care about aliases for
> memory_region_is_mapped() for aliases. Anything that relies on ->containe=
r
> is problematic when the target region is mapped via aliases -- see the co=
ver
> letter.
>=20
> Before sending this patch, I had
>=20
> commit 71d15e90d513327c90d346ef73865d2db749fbba
> Author: David Hildenbrand <david@redhat.com>
> Date:   Thu Oct 7 11:25:18 2021 +0200
>=20
>      memory: make memory_region_is_mapped() succeed when mapped via an al=
ias
>     =20
>      memory_region_is_mapped() currently does not return "true" when a me=
mory
>      region is mapped via an alias. Let's fix that by adding a
>      "mapped_via_alias" counter to memory regions and updating it accordi=
ngly
>      when an alias gets (un)mapped.

this needs a clarification,
is memory_region_is_mapped() used on aliased memory region or on alias?


>      I am not aware of actual issues, this is rather a cleanup.
>     =20
>      Signed-off-by: David Hildenbrand <david@redhat.com>
>=20
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 75b4f600e3..93d0190202 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -728,6 +728,7 @@ struct MemoryRegion {
>       const MemoryRegionOps *ops;
>       void *opaque;
>       MemoryRegion *container;
> +    int mapped_via_alias; /* Mapped via an alias, container might be NUL=
L */
>       Int128 size;
>       hwaddr addr;
>       void (*destructor)(MemoryRegion *mr);
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 3bcfc3899b..1168a00819 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2535,8 +2535,13 @@ static void memory_region_add_subregion_common(Mem=
oryRegion *mr,
>                                                  hwaddr offset,
>                                                  MemoryRegion *subregion)
>   {
> +    MemoryRegion *alias;
> +
>       assert(!subregion->container);
>       subregion->container =3D mr;
> +    for (alias =3D subregion->alias; alias; alias =3D alias->alias) {
> +       alias->mapped_via_alias++;

it it necessary to update mapped_via_alias for intermediate aliases?
Why not just update on counter only on leaf (aliased region)?

> +    }
>       subregion->addr =3D offset;
>       memory_region_update_container_subregions(subregion);
>   }
> @@ -2561,9 +2566,14 @@ void memory_region_add_subregion_overlap(MemoryReg=
ion *mr,
>   void memory_region_del_subregion(MemoryRegion *mr,
>                                    MemoryRegion *subregion)
>   {
> +    MemoryRegion *alias;
> +
>       memory_region_transaction_begin();
>       assert(subregion->container =3D=3D mr);
>       subregion->container =3D NULL;
> +    for (alias =3D subregion->alias; alias; alias =3D alias->alias) {
> +       alias->mapped_via_alias--;
> +    }
>       QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
>       memory_region_unref(subregion);
>       memory_region_update_pending |=3D mr->enabled && subregion->enabled=
;
> @@ -2660,7 +2670,7 @@ static FlatRange *flatview_lookup(FlatView *view, A=
ddrRange addr)


>   bool memory_region_is_mapped(MemoryRegion *mr)
>   {
> -    return mr->container ? true : false;
> +    return !!mr->container || mr->mapped_via_alias;
>   }
>  =20
>   /* Same as memory_region_find, but it does not add a reference to the
>=20
>=20
>=20
> But then, I do wonder if we should even care.



