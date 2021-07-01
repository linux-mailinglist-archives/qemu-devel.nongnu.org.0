Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5403B93D0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:18:47 +0200 (CEST)
Received: from localhost ([::1]:59590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyySk-00027v-Ej
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyyQm-0001Fp-WB
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:16:45 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:30343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyyQk-0002ZC-58
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625152599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sDoPDdWSka9i+BwTgQI/vGF9vyL4N8Gf98IU3HLAqLI=;
 b=AzBSP/IZ53N7JDxgc2ZR4Q5Tz+EY5xg8owKXw4n5n0YxaQAl9ZQBmCuRY6wimE5hP1bcmA
 qAqPhVXcb4twE56Zjj69ru+Xe5Gp7mO8QhuIO6TOJ5EWCcIrilUGAbCWFirY+iYorpDLpK
 E41d+qocX4+KC0+36X3XYWKH4k60xeU=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-6IstaAhZOxuY0fLLBG6b8w-1; Thu, 01 Jul 2021 17:16:38 +0200
X-MC-Unique: 6IstaAhZOxuY0fLLBG6b8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OV8FvJq8EvfTl6vJTNFDMETAHH98e6w8Vs/JfQbW0xLAudcJ0qqM1UJx+5CkWF7fMxPncwnOPDXZEpI251936fxhmJ4L+cHMNJMT0LpvN/on5grzdM7bBsg7oIpiDlzujEXTWdt8zEd4aMUsWBv/Du2RBKgnKdUb9xoFaI8tOWqIYvDErCPhx8SDjwfEUMh4c8eBE1cKX7eMOtxi4mAUvD31R1WBFdY+OaGq91ZQhZGow5OBa/lAE5UAEuhtN9TFKfNSIC46ONakPf+AYMlDJ9Bzz+9jtrvLFoJc5MeJH94iXuI7eSU1KUsFXeA2PYUnQs/XQSptuZcJ06sEE9N8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDoPDdWSka9i+BwTgQI/vGF9vyL4N8Gf98IU3HLAqLI=;
 b=iJ/7/TOEIbHWiM9mx03h3h2CkcadGiEWFkam6ru6eFYVxCyDx5XP8Z+QkL65ttUmzERd09PHYSmYqYh5Uj0YhTeTLB35WQaB01Wv1sYA48ypTFqdYkUnEnPDIQ0kfR1yDSAyPSq4rmOxL2FEmgG+73kafm1dinTzDoZOw2BGThCG1Qo4N7Kz6elBKKR+0mP9bC5glcbg9thyBZqxMIlAAOI94msFtQNlkEuzYP4pQRBi97RcaDxBq7BRD1PGi4mo0LZnO+Pt0CFMInO6HXFR6oQEEdFTiiNQJgBewtSMQ1XSyzo0I79MSav6fVKIPtjMlSMPbPn1l98gExTLQ/b53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5568.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 15:16:36 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 15:16:36 +0000
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>,
 =?iso-8859-1?Q?Jos=E9_Ricardo_Ziviani?= <jose.ziviani@suse.com>, David
 Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC v6 04/13] hw/s390x: tod: make explicit checks for
 accelerators when initializing
Thread-Topic: [RFC v6 04/13] hw/s390x: tod: make explicit checks for
 accelerators when initializing
Thread-Index: AQHXbPHYdXwBRMwkRkyeFM2eOQNdUKst7vkAgABMXeQ=
Date: Thu, 1 Jul 2021 15:16:36 +0000
Message-ID: <VI1PR0402MB3744E90DB88F4E5B2805D5A5A0009@VI1PR0402MB3744.eurprd04.prod.outlook.com>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-5-acho@suse.com>,
 <50d5a101-3c71-5393-fae4-641b56651a06@redhat.com>
In-Reply-To: <50d5a101-3c71-5393-fae4-641b56651a06@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.23.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d054ff37-c8f0-4280-b92a-08d93ca337ed
x-ms-traffictypediagnostic: VI1PR04MB5568:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5568BD9B988F7981905B8657A0009@VI1PR04MB5568.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TxomkkACHFYY3xAXUp+9kDxYyIMKnJMOTShsk6/noaNW7qQAxli6Kr1vYmwFEP5TZptbLOHCjZM9PcEpkGE4OZ2gNxRrCWSPb0oWnUNq7BKsRudCZDDUmn1nSazqzFtQ/XEf0TZdOOV+Idvcfp081ILEqzfGG7VyXFsguW2xpEnO4R6iMgF65YItD8kUMC6Shqz2IJZBqtO6o+CPhrp+9czhBmQHcGNjkqxOwyykPAEeyunCx8r3XVoeVoMS9tQ0+asAwp5iBIjpUBSp2hqdgUpH1y9zldGTDGsiQJxUwjVebv6cGm0ZsKKVKv2sPhjhVOBSjWrxuf3vZ8XY/pgr85VW0m4vt7PG+KKYpW/aBGnqcvRcVD0/Rdy5Ea80dqUl6Fu+qIDw0pmYMyuuDkp/t8fGe4ijNL9bQzuBxxz1kWuNFaaNl8Ok8BGcXU8AF4z3DJVeajDfbpcp1JW1PnK0rj629XcItsJ7Rmm1FsXQEdcyAf0dA1/34ybb6O01s6kOYMapNJ1WsI6mbInO3kM8NmE2q5WNzslwrfIWD4FkPBTKzOpebwkD3wHFEvmPfp0GGMNeiVWRHCApa7h5/RAq4gTe4Vfx06ZK4GTS1WJRVdCsi1H2lXd9O685TQS8bM9IxFFyZMgXBDw6rQE3sINRzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(5660300002)(53546011)(4326008)(9686003)(71200400001)(55016002)(86362001)(110136005)(7696005)(54906003)(52536014)(26005)(8676002)(33656002)(498600001)(8936002)(66476007)(19627405001)(122000001)(83380400001)(38100700002)(186003)(2906002)(91956017)(64756008)(66556008)(66446008)(66946007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OICp+i/KsfPLwjassR+oTsrCltKkP1wGCwwBpSJAEf5nUSQ2nlZwAARY8X?=
 =?iso-8859-1?Q?NofCUbDR05QwOUolwzi/ILPkLWoSNo+mtLBq1QJ8Q53lHjHyiP3GSjI+eU?=
 =?iso-8859-1?Q?nfxLLiw1y0txTnUwRNFXzvwRP767Odu2/zlHvmYeAtOu7NheuGhIqGamrO?=
 =?iso-8859-1?Q?nTv1aI3vJQnMa7BZkPHkZ/iG+s+ZaWrd2XyS9O2fkPBARoHeCP90x2xsnQ?=
 =?iso-8859-1?Q?3vnXTabQPFwp7OYyPrNnxlYn6httV8gnbVKKi+nq3ZyRszGuzIYZ5s54aK?=
 =?iso-8859-1?Q?jZr28Y6Tu99sDNzemwRiDQopfA/Gx5wckvZOtm5neNtv3zoKDAybuwW9FZ?=
 =?iso-8859-1?Q?5VcxR9skUSPE4eRui4qF1Pe/aLuWLhdD/uxV2nWviZ9HPfdPYCkZokpRy7?=
 =?iso-8859-1?Q?n4mWv21AO+ifS6qbEzUzQF6Eoixqf8b3bNbwBiMmKhLhOApicnST/RTbLX?=
 =?iso-8859-1?Q?Upc0wEVU6ncTpN82cxxc0qY2Isvqm12W1yIyc86vDzWTdTcNWrfcxRotEg?=
 =?iso-8859-1?Q?hjfitKmAAJ7IrNL9vRWxPj0PssOL9o+HmzqRIwIvIarter0jLkqKSRvxwg?=
 =?iso-8859-1?Q?kAOboFBftbecCqjAddq0K/ACX2lQtk5M4pdZqJw8w81y8Oz5UM5fMGoj7s?=
 =?iso-8859-1?Q?KOu3JdIXBzxaHEBbXQrsoBUg8ryoPQ/pfKJCcaR2Lp9PpAMxLq1OEJewzn?=
 =?iso-8859-1?Q?iaeTooq1Hx5jZ+AWoE7GB96z1x+w25cak7IxBTRugKm+Cy2+cLCIjeY0PA?=
 =?iso-8859-1?Q?lombU1fdU4mRtexr8M9QvFwr5iMkdWKrOPgtF7f17psyAsFCnEcNcEXwQC?=
 =?iso-8859-1?Q?LmSLOnWlUPlmwhbNS+m164hEe5ZGltQeTZjVZcaRVIXTGJwDUPoos/5gtU?=
 =?iso-8859-1?Q?8REzJjxF5qiQmnjxedc3mziGA+OIDeZAQoYDuPrbpUtrLsUNeXBLWE2XIT?=
 =?iso-8859-1?Q?rvrirFsegOMRBZSu23IIv58mXh0nzTtjvubSRhSjvJPD8CkD8xpcfCZtTz?=
 =?iso-8859-1?Q?iV25OcZACGyL/7kNUegiNuKdQLwa9iROqKDTwy0Ad5e6ZdaEQjTFFOZ0bj?=
 =?iso-8859-1?Q?CnGKoV4zBH2NOXBotiNHh/gue/03ErjAmhfiDIsWcT3AtXA9kyWz6OsCVn?=
 =?iso-8859-1?Q?6tQ+o+rbPHLSXoOOiQwz21AT+z7ltx2Bu2sm20YL3rEaGDiYpEK/VXMur4?=
 =?iso-8859-1?Q?dTEK7kV/fn6fuUK4e/KXaeBKoLzUnndpfSjsWYpepenPR5DwdEm74fpRqg?=
 =?iso-8859-1?Q?OvaXIwpsv18bvLhEDNBO2jbUCA9F+bQngzA+K2wmshg1fQAGIDRuYBKU3N?=
 =?iso-8859-1?Q?Kork/qn8ceBJ4v9G13GsqV26iO1NKqjkchJwq0PQ50uUcmg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0402MB3744E90DB88F4E5B2805D5A5A0009VI1PR0402MB3744_"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d054ff37-c8f0-4280-b92a-08d93ca337ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 15:16:36.4258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZE/N4/re7MQWvVKZkTCQumM8mk16WH4DexhVOxTXBPnTaqsdWXOQhKpnWNcP0tx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5568
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Al Cho <ACho@suse.com>
From:  Al Cho via <qemu-devel@nongnu.org>

--_000_VI1PR0402MB3744E90DB88F4E5B2805D5A5A0009VI1PR0402MB3744_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ok, will swap 03 and 04 in next version.

Thanks,
            AL
________________________________
From: Thomas Huth <thuth@redhat.com>
Sent: Thursday, July 1, 2021 6:32 PM
To: Al Cho <ACho@suse.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; =
qemu-s390x@nongnu.org <qemu-s390x@nongnu.org>
Cc: Claudio Fontana <Claudio.Fontana@suse.com>; Jos=E9 Ricardo Ziviani <jos=
e.ziviani@suse.com>; Claudio Fontana <cfontana@suse.de>; David Hildenbrand =
<david@redhat.com>; Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC v6 04/13] hw/s390x: tod: make explicit checks for acceler=
ators when initializing

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> replace general "else" with specific checks for each possible accelerator=
.
>
> Handle qtest as a NOP, and error out for an unknown accelerator used in
> combination with tod.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>   hw/s390x/tod.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
> index 3c2979175e..fd5a36bf24 100644
> --- a/hw/s390x/tod.c
> +++ b/hw/s390x/tod.c
> @@ -14,6 +14,8 @@
>   #include "qemu/error-report.h"
>   #include "qemu/module.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/tcg.h"
> +#include "sysemu/qtest.h"
>   #include "migration/qemu-file-types.h"
>   #include "migration/register.h"
>
> @@ -23,8 +25,13 @@ void s390_init_tod(void)
>
>       if (kvm_enabled()) {
>           obj =3D object_new(TYPE_KVM_S390_TOD);
> -    } else {
> +    } else if (tcg_enabled()) {
>           obj =3D object_new(TYPE_QEMU_S390_TOD);
> +    } else if (qtest_enabled()) {
> +        return;
> +    } else {
> +        error_report("current accelerator not handled in s390_init_tod!"=
);
> +        abort();
>       }
>       object_property_add_child(qdev_get_machine(), TYPE_S390_TOD, obj);
>       object_unref(obj);
>

I think it might be better to swap the order of patch 03 and 04, to avoid
that the qtests might break during bisecting later.

For this patch itself:
Reviewed-by: Thomas Huth <thuth@redhat.com>


--_000_VI1PR0402MB3744E90DB88F4E5B2805D5A5A0009VI1PR0402MB3744_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
ok, will swap 03 and 04 in next version.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AL<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Thomas Huth &lt;thuth=
@redhat.com&gt;<br>
<b>Sent:</b> Thursday, July 1, 2021 6:32 PM<br>
<b>To:</b> Al Cho &lt;ACho@suse.com&gt;; qemu-devel@nongnu.org &lt;qemu-dev=
el@nongnu.org&gt;; qemu-s390x@nongnu.org &lt;qemu-s390x@nongnu.org&gt;<br>
<b>Cc:</b> Claudio Fontana &lt;Claudio.Fontana@suse.com&gt;; Jos=E9 Ricardo=
 Ziviani &lt;jose.ziviani@suse.com&gt;; Claudio Fontana &lt;cfontana@suse.d=
e&gt;; David Hildenbrand &lt;david@redhat.com&gt;; Cornelia Huck &lt;cohuck=
@redhat.com&gt;<br>
<b>Subject:</b> Re: [RFC v6 04/13] hw/s390x: tod: make explicit checks for =
accelerators when initializing</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 29/06/2021 16.19, Cho, Yu-Chen wrote:<br>
&gt; replace general &quot;else&quot; with specific checks for each possibl=
e accelerator.<br>
&gt; <br>
&gt; Handle qtest as a NOP, and error out for an unknown accelerator used i=
n<br>
&gt; combination with tod.<br>
&gt; <br>
&gt; Signed-off-by: Claudio Fontana &lt;cfontana@suse.de&gt;<br>
&gt; Reviewed-by: David Hildenbrand &lt;david@redhat.com&gt;<br>
&gt; Reviewed-by: Cornelia Huck &lt;cohuck@redhat.com&gt;<br>
&gt; Signed-off-by: Cho, Yu-Chen &lt;acho@suse.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; hw/s390x/tod.c | 9 ++++++++-<br>
&gt;&nbsp;&nbsp; 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c<br>
&gt; index 3c2979175e..fd5a36bf24 100644<br>
&gt; --- a/hw/s390x/tod.c<br>
&gt; +++ b/hw/s390x/tod.c<br>
&gt; @@ -14,6 +14,8 @@<br>
&gt;&nbsp;&nbsp; #include &quot;qemu/error-report.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;qemu/module.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;sysemu/kvm.h&quot;<br>
&gt; +#include &quot;sysemu/tcg.h&quot;<br>
&gt; +#include &quot;sysemu/qtest.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;migration/qemu-file-types.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;migration/register.h&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -23,8 +25,13 @@ void s390_init_tod(void)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (kvm_enabled()) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obj =3D ob=
ject_new(TYPE_KVM_S390_TOD);<br>
&gt; -&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp; } else if (tcg_enabled()) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obj =3D ob=
ject_new(TYPE_QEMU_S390_TOD);<br>
&gt; +&nbsp;&nbsp;&nbsp; } else if (qtest_enabled()) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_report(&quot;current=
 accelerator not handled in s390_init_tod!&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abort();<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_property_add_child(qdev_get=
_machine(), TYPE_S390_TOD, obj);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_unref(obj);<br>
&gt; <br>
<br>
I think it might be better to swap the order of patch 03 and 04, to avoid <=
br>
that the qtests might break during bisecting later.<br>
<br>
For this patch itself:<br>
Reviewed-by: Thomas Huth &lt;thuth@redhat.com&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR0402MB3744E90DB88F4E5B2805D5A5A0009VI1PR0402MB3744_--


