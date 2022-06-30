Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1C561ADE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 15:01:51 +0200 (CEST)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6tno-0004FJ-RK
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 09:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6tiv-0001Yw-CK
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6tiZ-00054k-2e
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656593781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3AONNMCIu4RyMmINzL3/XjUkZNjRHyD9krY0c9po158=;
 b=PxWK+pbeqAILHIeDg3rnt2XHmd0iua5jcZxkIGkjQTJ/dW39lqOYDztjsuNEV/cRRCpATY
 Hhwv2PCik2EafRtZj3sX7DBM+vAp5Y/hLbnBV8QwbcDoi/+pYPbCV5XMiuZaRzpaGxXRX4
 jiNeJniZvbrhXgLRiCw2EB0N8J96XNg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-ZjYVewCbOw2SvPSlGjttOg-1; Thu, 30 Jun 2022 08:56:20 -0400
X-MC-Unique: ZjYVewCbOw2SvPSlGjttOg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z13-20020a056402274d00b004357fcdd51fso14229965edd.17
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 05:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3AONNMCIu4RyMmINzL3/XjUkZNjRHyD9krY0c9po158=;
 b=jBvlgULmsalr7i8cZ+qdYTBvEPyvkuVEVfOjyXaF8TLHa3JJiPJcdn2VELYpeeoE2g
 fEso9iJfKFB48NkzTvOkc0jKX9iYVhu7FVJXdhLRJwcsXxS0u5Qth9uWn7G8KGaxp/T+
 xI71VlDBvm9Xr7KfbrqrQagnM12tuKmXHALRYYYZqve4or214CqGG1Ycd3aL0wOvjnm8
 UdceVNr18SFFhZ8Z4Qer2O2GyUaT5QQ/l7g3ygaB+bR1Tj2xP1gJ+VlWeslMcBsrihx8
 alt6ZGSrShIonmoIkyPJnCRpVArZkGVRrD5VtZT1LM/2gTEcDSLmiqEiA9WKNZC0Fc2R
 6TAA==
X-Gm-Message-State: AJIora+IH9M3OWF4xIXLl2kHX3yrcuyocJ4hbmzRmR5Gbad3e/AtZ8w8
 21oZGMg0y/m2FLNFHlMwAdOV2Ru/oXoJrD4aLgGwS+CO4yCusvTEzMIIwkVjOAAAkXMdHFUygzL
 9FlsWui7/PuE+vRY=
X-Received: by 2002:a17:906:1910:b0:722:f998:50f9 with SMTP id
 a16-20020a170906191000b00722f99850f9mr9045486eje.106.1656593778687; 
 Thu, 30 Jun 2022 05:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tALXqdBmCmyUwgKL8YbB2pyZiD8ug9CHqpvf4NWSkL9aLCOJB6Q88Eg7g1FseJCX8XEXoaTQ==
X-Received: by 2002:a17:906:1910:b0:722:f998:50f9 with SMTP id
 a16-20020a170906191000b00722f99850f9mr9045474eje.106.1656593778541; 
 Thu, 30 Jun 2022 05:56:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a170906078200b006fe89cafc42sm9175304ejc.172.2022.06.30.05.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:56:18 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:56:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Yanan Wang <wangyanan55@huawei.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, mst@redhat.com
Subject: Re: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220630145616.3c070af4@redhat.com>
In-Reply-To: <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
 <20220630142347.22485226@redhat.com>
 <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 30 Jun 2022 14:40:13 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> Le 30/06/2022 =C3=A0 14:23, Igor Mammedov a =C3=A9crit=C2=A0:
> > On Thu, 30 Jun 2022 09:36:47 +0200
> > Brice Goglin <Brice.Goglin@inria.fr> wrote:
> > =20
> >> Allow -numa without initiator value when hmat=3Don so that we may
> >> build more complex topologies, e.g. NUMA nodes whose best initiators
> >> are not just another single node.
> >> =20
> > patches looks fine code-wise,
> > however something wrong with them, i.e. 'git am' doesn't like them
> > nor ./scripts/checkpatch (which one should use before sending patches).
> >
> > I've checked it's not my mail server/client issue(or whatever)
> > that corrupts them (ones downloaded from patchew are broken as well) =20
>=20
>=20
> I don't know what's going on. These 4 patches are in=20
> https://github.com/bgoglin/qemu/commits/hmat-noinitiator (rebased on=20
> master 10mn ago).

I'm not sure if we take patches from directly from git-forges,
I guess it's upto maintainers.

CCing Michael,
 since these should go through his tree

>=20
> Do whatever you want with them. I am not allowed to spend more time on th=
is.
>=20
> Brice
>=20
>=20
>=20


