Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ADA6AD710
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZQL9-00070U-0t; Tue, 07 Mar 2023 00:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZQL6-00070E-F0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZQL4-0001jv-Qi
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678168697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0VhC4Ugz4t2GOFo0oXHGmkOJFS9wDroOAy2ZS0gO3jw=;
 b=FNmBEBqcL3PT1bGhVKxMn9SJqg3HQoaEezXEkweag+OBg5gJ4zX8Q0wU5Snfq5uThO7fht
 v7NoxJ8TwAYuDxB2ue1+IdbF9eBhSb5u6/Lr1gu2dn5sJ3CHWeYxP0MZi+vmnsaTg8q7Mf
 vc+E5XmbhwCzj7QOBcF/roq+SGagDuQ=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-FiGQJe9NODmxievrzBHN3A-1; Tue, 07 Mar 2023 00:58:14 -0500
X-MC-Unique: FiGQJe9NODmxievrzBHN3A-1
Received: by mail-vs1-f69.google.com with SMTP id
 e28-20020a056102225c00b0041225db8896so4341947vsb.14
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 21:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678168694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0VhC4Ugz4t2GOFo0oXHGmkOJFS9wDroOAy2ZS0gO3jw=;
 b=7PikPdcGfr/7nbp3WziXKm7bIgCexzP6JpM0Zz6t5UWWWxfJyX8v4ywSWeXYI0n2tl
 xQcIR5CKXgHLZErGaiDfZiFHXJ4eVHRL7jCo8QQvUe+5QrpWXDIJPGtKefDIz/7l4nGs
 m/GO5pqz9+jHuDUIis0nqxVzARgkHeFGKR6Mcdgrjhxrg9ebvcekD2AEKDGBdrJlrhN9
 XySIAxPYjocbZ7F1WFr/NpmjYwP0/z870hlX+ZjqvcL2LpCjl7Y0dXKVF9N1v6Zg0LRx
 vLNiwvRliABo6Lu6Z7VVjkZaTeaAuj6CEA+fTf29P7rLhZC3iBmXZbjgX3VVkb/T0Sgn
 rQIA==
X-Gm-Message-State: AO0yUKXvEgRcxalaxdr6bCjU2VUiklrSPpi30LMTLgpcAjbh4H0lcPrb
 cXv6MPR3VGfYp4ZLMn5+r0G7eJismky5Ou7TCTZQKysuOk46dEoszA0lxyGkS69+bzfyqA0Fn64
 02OjFwu/83EnUlsmG56f6CFrp/POOBak=
X-Received: by 2002:a67:e04d:0:b0:421:edef:20d3 with SMTP id
 n13-20020a67e04d000000b00421edef20d3mr1329018vsl.7.1678168694023; 
 Mon, 06 Mar 2023 21:58:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/PeKEvQe/g5uA+dfAevmivRLbUsQfqJXHH5v31TbLRxA8QMGhgbeHKm7ZIBvjdyP5H6S+tHM6mdSbyPRwEFPw=
X-Received: by 2002:a67:e04d:0:b0:421:edef:20d3 with SMTP id
 n13-20020a67e04d000000b00421edef20d3mr1329005vsl.7.1678168693793; Mon, 06 Mar
 2023 21:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
 <4714e0f2-ccfb-1e9a-149e-aceefef62a9d@redhat.com>
 <e101b894-c722-8def-f591-20fada45795c@redhat.com>
 <48cdc7ae-8e7c-6b6d-76d1-96228ac597c2@eik.bme.hu>
In-Reply-To: <48cdc7ae-8e7c-6b6d-76d1-96228ac597c2@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 7 Mar 2023 06:58:01 +0100
Message-ID: <CABgObfZLuVgG8pPcF1o517z0wSZTk5SmV8Enn=PC8QmOEVou8w@mail.gmail.com>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ddfd7705f6491880"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000ddfd7705f6491880
Content-Type: text/plain; charset="UTF-8"

Il mar 7 mar 2023, 01:06 BALATON Zoltan <balaton@eik.bme.hu> ha scritto:

> I'm not sure I follow what you mean so I'd need a patch to see then I can
> test it with the clients I run on pegasos2.


Do you have a spec, or pointer to the morphos kernel sources, to figure out
how the hardware works?

Paolo


> Regards,
> BALATON Zoltan

--000000000000ddfd7705f6491880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 7 mar 2023, 01:06 BALATON Zoltan &lt;<a href=3D=
"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; ha scritto:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">I&#39;m not sure I follow what you mean so =
I&#39;d need a patch to see then I can <br>
test it with the clients I run on pegasos2.</blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Do you have a spec, or pointer to th=
e morphos kernel sources, to figure out how the hardware works?</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
Regards,<br>
BALATON Zoltan</blockquote></div></div></div>

--000000000000ddfd7705f6491880--


