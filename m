Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0764A5725
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 07:21:15 +0100 (CET)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEmXR-0008Cw-NE
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 01:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nEmVD-0007G9-ON; Tue, 01 Feb 2022 01:18:55 -0500
Received: from [2607:f8b0:4864:20::633] (port=36453
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nEmVB-0005Hr-Py; Tue, 01 Feb 2022 01:18:55 -0500
Received: by mail-pl1-x633.google.com with SMTP id b15so14591927plg.3;
 Mon, 31 Jan 2022 22:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=XyO3QZw99zIdBAojUr7GOidj/Uy/PVeSQsocJkS55lA=;
 b=CFfSB3U0nGDdT2pHVya6V3kbs+HUXEaXSOTPN4JfrIxS7BYjeIiA4vdEcn4ljlwb0Q
 MTjzKc4IDgbAenzcV7EwxIxLirVRHiC577A1QcStRBI9X0trFYdBynl2zjT+5UrcFASF
 utROPVw9S22br7UlNeldlpCB9gzPgzl2ItRYhy7+IjOWIxY2AoLE1YuyLds8+3xPUIVh
 uozDmsVCViIAh9a87AcnCodgmSbW3l6T4HZnDl8ot4oYXBeMGKqT+8Xaj3LdvYLr7YDk
 hNFqVKh2f/VW/htvHgNImCiT1OG5dVh9DNRU/ayJDLgZICUAlQhYRg2w1qPqZqZOJ64G
 ZbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XyO3QZw99zIdBAojUr7GOidj/Uy/PVeSQsocJkS55lA=;
 b=BsTVGT4ZOVREBRyH4uE9An4fLVa9RM/JA+QOgan8XNMyJsuE5m2ZBrjcomThl653vu
 9BX61U8UDwULSysHjMkZdLpBDRw0Heat0HEFV++xYOg5Gm/uZHlk0bNzkd77JhH/W4jf
 QnSUx1ewY9mrkN9GegwgHHRjZ/ObViiXS22u9vO0OKXWtoKhBusj8MgbY/b99Wch6b0N
 wyOll3V3yEo7xfuzuxjiMzrYr/Y7p3S+vL9vR34uotBi7LWhhDSu7J0gGakTdUuvxEJi
 5eeWKK2o2jiHsallypCT5fBTufxrY7Z9SooGrA1kUA4V6ZItgzQRuj84Wd7B2wrTooSG
 hi4Q==
X-Gm-Message-State: AOAM532cdNMQX8L6OIt6R0mve93fOdKy9TcrSnwXtX9Piw4xNL1OqEO0
 +cSRjOpHQTjOcOjd49QwUSI=
X-Google-Smtp-Source: ABdhPJxhfWFk4h6JJM+ezMdWFNmtzBZlBNDUBozFprgmAKzgF6zvjP+YK0lFkMRUN1kg066Q/7McZA==
X-Received: by 2002:a17:90b:146:: with SMTP id
 em6mr612470pjb.214.1643696332122; 
 Mon, 31 Jan 2022 22:18:52 -0800 (PST)
Received: from localhost ([203.111.178.100])
 by smtp.gmail.com with ESMTPSA id l191sm28313227pga.65.2022.01.31.22.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 22:18:51 -0800 (PST)
Date: Tue, 01 Feb 2022 16:18:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
References: <20220129065007.103681-1-npiggin@gmail.com>
 <21b0c97c-3963-518c-e910-eb8264fe74a9@gmail.com>
In-Reply-To: <21b0c97c-3963-518c-e910-eb8264fe74a9@gmail.com>
MIME-Version: 1.0
Message-Id: <1643695373.1vu1v2pdey.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Daniel Henrique Barboza's message of February 1, 2022 5:10 am=
:
>=20
>=20
> On 1/29/22 03:50, Nicholas Piggin wrote:
>> The behaviour of the Address Translation Mode on Interrupt resource is
>> not consistently supported by all CPU versions or all KVM versions.  In
>> particular KVM HV only supports mode 0 on POWER7 processors, and does
>> not support mode 2 on any processors. KVM PR only supports mode 0. TCG
>> can support all modes (0,2,3).
>>=20
>> This leads to inconsistencies in guest behaviour and could cause
>> problems migrating guests.
>>=20
>> This was not too noticable for Linux guests for a long time because the
>> kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
>> advisory (KVM would not always honor it either) and it kept both sets of
>> interrupt vectors around.
>>=20
>> Recent Linux guests depend on the AIL mode working as defined by the ISA
>> to support the SCV facility interrupt. If AIL mode 3 can not be provided=
,
>> then Linux must be given an error so it can disable the SCV facility.
>=20
> Is this the scenario where migration failures can occur? I don't understa=
nd
> what are the migration problems you cited that were possible to happen.

Maybe I'm overly concerned and nothing would practically use it (beyond=20
testing which we could just hack around). I was thinking of if we=20
implemented AIL=3D2 in KVM HV, or AIL=3D3 in PR.

>=20
>>=20
>> Add the ail-modes capability which is a bitmap of the supported values
>> for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
>> a new KVM CAP that exports the same thing, and provide defaults for PR
>> and HV KVM that predate the cap.
>=20
> Why add a new machine cap in this case? Isn't something that the KVM capa=
bility
> should be able to handle by itself, where we always assume that we should=
 have
> the best AIL value possible?
>=20
> Besides, the way it is coded here, we're adding an user-visible capabilit=
y that
> mimics the exact behavior we want from h_set_mode_resource_addr_trans_mod=
e(),
> meaning that only bits 0,1,2 and 3 of cap-ail-modes can be set, but:
>=20
> - bit 0 must always be set
> - bit 1 must always be cleared
> - if kvm_enabled():
>     * bit 2 must always be cleared
>     * bit 3 can be cleared or not depending on kvmppc_has_cap_ail_3(), wh=
ich translates
> to not allowed if running with KVM_PR and allowing it if it we're running=
 with Power8
> and newer
>=20
> i.e. bit 0 is always set, bit 1 is always cleared, bit 2 can be set or no=
t for TCG but
> always cleared for KVM, and bit 3 can be set depending on the circunstanc=
es.
>=20
> Note that this would allow an user to set this guest in a Power9/10 machi=
ne:
>=20
> -machine pseries,accel=3Dkvm,cap-ail-modes=3D1
>=20
> And the guest will end up having degraded performance because AIL=3D3 is =
being disabled.
>=20
> If we want to avoid this and force AIL=3D3 to be used in this case, then =
this capability
> would be used just to set or clear AIL=3D2 when running with TCG.

I was thinking how it could be more flexible with maybe possibly future=20
AIL modes and things we don't foresee. In theory AIL=3D0 could go away
(although unlikely in practice).

> I believe the chunks in which we check for kvm_pr and allow only AIL=3D0 =
are improvements
> of h_set_mode_resource_addr_trans_mode(), but other than that I'm afraid =
that exposing
> this cap to users is a bit overkill.

That said, maybe you are right and it's overkill until a real need comes=20
up.

I will split and submit the KVM cap part of it, at least.

Thanks,
Nick

