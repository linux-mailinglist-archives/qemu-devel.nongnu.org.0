Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB7364A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:26:27 +0200 (CEST)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZXO-0004VT-QP
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lYZCN-0005hx-6o; Mon, 19 Apr 2021 15:04:43 -0400
Received: from mail-eopbgr790109.outbound.protection.outlook.com
 ([40.107.79.109]:26816 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lYZCK-0003mX-Uc; Mon, 19 Apr 2021 15:04:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncOpuKEhcTKXZltwJOfwOPm/V3Xy2QuwsKBcWm54k1LELdJMmSYjo6g1cz4BPHTwhGgi2gjJKDfLbZHLrdsyaphJ9hrIyI9C9zZGjhjPGObaUAA7igx1xGlJcqRVxnp9fDv/prh+Tj1/vXj74Oq376YTKw23I7d6f5j4fzLZdvhCeNTuSTQ3Bl2n71N41eHiBQuOa4BeTDGp/eG7VVjyh08VOjX7mkZruIPSjHQdCtbZCUTzpjLy9+gPm7X5cFQa36lFnQ1A188Rgz3Zppq6shxVsmxciW2VfJhMLYRiYibccGgXc+OoLfh/cQ73c4ETM9rYntL9Bzyn5C7TLDmobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY7lJ33uB+irJ+wtWDxTsH+X2Z1qvUeNlux4hQiJEQI=;
 b=OAPUqtJGjkV7TlXTuNATH5nXUyk9mnT/C3p4svnQjVusUnPcJpSQWxP6xhd7k3puCAVctP/o7GdzMncbUUcfhOUdu44P3IWMc/it0clwe5zJb1RsuvD7nn4hIyZ1N0i6nzYlQJ5xE5yzCAF5OsQk2OxOSkvBlUt2B87LtfHoMlRCdb2kvLuOYgpxWnymTHWHA2oUjEg+R4Cxxb3HfSNzlF8m4eexLc4dSr40LVDg9QP3UGwg9o+FfkUTCktk0AW7VEN9OfZhRFkYa7u0TkdAfyFEhObIPee3RqJCLiLZCAwHSuLW2v7XLtfHYyGkv9mIn0+cB8yK68Wi+c82EgaRWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY7lJ33uB+irJ+wtWDxTsH+X2Z1qvUeNlux4hQiJEQI=;
 b=NUlM7cvYVBR7UxpLyyflYl4kb6OvGiL37XsLQzgjs6Tbggm0hpF4k0G+rKpsmBerC4K7wv6CGRIH06Uh64gE14hOj+e9C47zHR2MhpCCG8zdg/zdAiGDCfBQquqm6ojp0AN7mGTeA5ryAKkgsnAdLiZM3eUbS/hLqzXjW00Jd9jDhH95vgmktu6SjVYMgj3A6EWY9hTYzZTP2gHrPyOLBfs6fXENwsDzHdeSXQq29zjw78xfYJrRgpvLJVvYBAy1h2dKF3+uqLA0nGkF1KT/lX374VA2o6Y7BRElo4+aJwPzycIHMsGLqZFDhIdn3Ihc+WsSUE24RARHsv6d0xwgOw==
Received: from RO1PR80MB5610.lamprd80.prod.outlook.com (2603:10d6:4:b::11) by
 RO1PR80MB4475.lamprd80.prod.outlook.com (2603:10d6:10:7::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.18; Mon, 19 Apr 2021 19:04:35 +0000
Received: from RO1PR80MB5610.lamprd80.prod.outlook.com
 ([fe80::80c8:6be4:9ced:38bf]) by RO1PR80MB5610.lamprd80.prod.outlook.com
 ([fe80::80c8:6be4:9ced:38bf%12]) with mapi id 15.20.4042.024; Mon, 19 Apr
 2021 19:04:34 +0000
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: target/ppc: sPAPR invalid function calls when compiling without
 TCG
Thread-Topic: target/ppc: sPAPR invalid function calls when compiling without
 TCG
Thread-Index: AQHXNUsfA1qdn/XUb0miEnW9HMctfQ==
Date: Mon, 19 Apr 2021 19:04:34 +0000
Message-ID: <RO1PR80MB5610B3195A7C36B3878E8C68CE499@RO1PR80MB5610.lamprd80.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [179.154.142.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2973cb39-9c6f-4e0a-118e-08d90365f8c2
x-ms-traffictypediagnostic: RO1PR80MB4475:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <RO1PR80MB4475E4E738E053AB34345240CE499@RO1PR80MB4475.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S9LfCgWH/YpBCiOOlshkZmsH4kQJO0CicavDCVRGvOzGHAnMnfTTr+kd5qrfcq0dBq1QZfrtEV3OjkGt9OI8R2P2XDEtSqVVpjqee+O6uzNHPEYRpOrEzbTMLBuEUB1Pp1z1npxzP6obcAQM7kKEBvEyGrKouYud9FYXcKDGxUJEtIeclejU07tYZEPW1AJCGeP6MLDpAv4jrfPUERfOhdDfufUP45wtYxa+bCuidtH+ZheSDJT5J1hJQjw6I28TV4wECQoq1cFjcQpZIEDbFLaXztXF5lIIZvaqPYhfponOjJ1GVlqSsKm4HVovG8hupwd7CtSMZU8NJAmg6H0Pk6Qwllmv4wEZ+lvQT/3RfJ34tlHAqzbHr+IaQicRqKUT3kxfmoYzAJI2Q4bcYy5O90/K4/R5WnHMRoFY4BIJMWu+OHB1KAeDx9JKTKDdbG+z9LUAMgd6Zmz3LJvetzDd2gA7Uc3cJcJx5c3PlcJAil4hdBNjd+RoxNmrT46x+BfAXsQK01hrbFJ5q4IxeZozqsDeHJ6PuA4hIOv2lUtrvthDYPge45bEH0BO4P9+ldZ3xFTwiYiz+NpQ+EYmGUcr/PlBfaBirAN5ZoFS8u4vnZE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:RO1PR80MB5610.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(376002)(366004)(346002)(136003)(122000001)(52536014)(71200400001)(186003)(26005)(8936002)(6916009)(5660300002)(478600001)(8676002)(2906002)(107886003)(38100700002)(55016002)(66446008)(33656002)(66556008)(64756008)(7696005)(66476007)(316002)(66946007)(4326008)(9686003)(76116006)(6506007)(86362001)(54906003)(91956017)(19627405001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?xiTRBitniI2c7JpI2VwModDpydf6hhkGOvKIcP4uDgmBCJT51bMYc2rTba?=
 =?iso-8859-1?Q?/RJIc0TqBEJtw+i3zbkPPtmuASwR8aA+PMDevgGLar2umEA301+6CEv8qi?=
 =?iso-8859-1?Q?ybK3jIa0w6ptNOkHYsBr+LuTW3ycDaBNJ8y+z2tyqB8R+x4VcvLAtKERK9?=
 =?iso-8859-1?Q?gJTgkGsA4lQGGMPjWHppWdxxuhX2DDPqzlE57TEq2YOhEpLxcrUkN1nRIm?=
 =?iso-8859-1?Q?lN40U54D/QRRqE+3+HE/aepGrQoy397hPyyh7Tp+oceZYwTHo6UOCrVPhd?=
 =?iso-8859-1?Q?2sNwI19ZLNo0kYWTVu2YpWb7/dd5Vm1vYS6Vh4aSRcEt1bd/iodbpD79Bf?=
 =?iso-8859-1?Q?WhDoVvtHvc56frauMtC4e6EP+bqtIO60iiWqCSCh3wBum+bAQBi2A1h/Nr?=
 =?iso-8859-1?Q?/u28YXDLH1cZOSA6dP/Vu+9n9oZ36FbcC6GtBgDLdYb4dZgFVMhT4Fihgo?=
 =?iso-8859-1?Q?flZQn3RPytDZR8PqtRup4Cnbb/kP75B9EMdzhzVYDW/moRHRg6q31HDwAt?=
 =?iso-8859-1?Q?OGN6DEs/40lByQ5adtJv8LPVhuwcWUjvlSm3RuNeBGinuuLnWEl4azExkJ?=
 =?iso-8859-1?Q?a00dPiLbkThbwbYioM1wCcSZXR/a92toDaOK8pAkN8YkezmeRSw+omaPFj?=
 =?iso-8859-1?Q?RJHchVhjCTl4Qzm6jTM0kKDW2k5wMoxDwPFMZOFN2kkttkGnVvLaNkgYrg?=
 =?iso-8859-1?Q?qtOy2o9R4an51ZKJYfv2GGhoGgEz3lGAEJNOTFrjD7Y5kR6WcutJGu3sGt?=
 =?iso-8859-1?Q?UzaRQm275DEvji+yTXXLVf8sMt/bjYcxNbaZ5ofs+wqT0SUqSbhXOPQrGl?=
 =?iso-8859-1?Q?/to7EYGr9CWwkOk8tbmvxWEZ5PWn+sLCt7XtLMsU6nn9WzjlOdxJtKqBR6?=
 =?iso-8859-1?Q?SQdDaO+s6x4hB8pVyEia6hPoMqMVvFQCQwI79VGcqRe1L3TZs+EsYHX2e7?=
 =?iso-8859-1?Q?K6o3OJdO91gNs96y9J4uMRwNbnBNLnqMyoQAFlke+epvIhKtpQspHdP39J?=
 =?iso-8859-1?Q?K35bGZtGsCTcd2vKNNiCR7pqkCdGun7CDQ0Yz5XlnxBRe6HsvGuEN5G/9d?=
 =?iso-8859-1?Q?vboau/Cgxwdp5spP216LFgQ861d5L7kXQFxHKXeUl120CQjWjrvGSi66aL?=
 =?iso-8859-1?Q?s3zcrR9PnyIO2ksTuFvn1F81AuBYYOr6bQnxd390N87/jg0se1yK1sRukz?=
 =?iso-8859-1?Q?ZB3mUhrqvro2m1tkiEdg7DF3gvzXWXmGXbORaFB/7mYFUUGExT5261JKSL?=
 =?iso-8859-1?Q?OkRDHov93BBOFYlzC+CWGHkSCSpzJ67dPeIlJE1UHj7XcZ5ugKVsH5jMHM?=
 =?iso-8859-1?Q?V1+AH5ydvgUodONzxTV5R6VSKcfr9XKuH8C+IN4D/mGYu6Q=3D?=
Content-Type: multipart/alternative;
 boundary="_000_RO1PR80MB5610B3195A7C36B3878E8C68CE499RO1PR80MB5610lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: RO1PR80MB5610.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2973cb39-9c6f-4e0a-118e-08d90365f8c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 19:04:34.9014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZbCzkrgyucsvKl/67a2arjazS4keUlmduD+kWKYflDh9IXGPfOofneLr+LLhvWLCWLktcnzrvFmyI+Fg61wpm4hRGPohe+zU0ceIY+9tAjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: RO1PR80MB4475
Received-SPF: pass client-ip=40.107.79.109;
 envelope-from=lucas.araujo@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_RO1PR80MB5610B3195A7C36B3878E8C68CE499RO1PR80MB5610lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



>> spapr_hcall.c:
>>     function h_enter call ppc_hash64_hpte_page_shift_noslb, ppc_hash64_m=
ap_hptes and ppc_hash64_unmap_hptes
>>     function remove_hpte call ppc_hash64_map_hptes, ppc_hash64_unmap_hpt=
es and ppc_hash64_tlb_flush_hpte
>>     function h_protect call ppc_hash64_map_hptes, ppc_hash64_unmap_hptes=
 and ppc_hash64_tlb_flush_hpte
>>     function h_read call ppc_hash64_map_hptes and ppc_hash64_unmap_hptes
>>     function rehash_hpte call ppc_hash64_hpte_page_shift_noslb
>>     function rehash_hpt call ppc_hash64_map_hptes and ppc_hash64_unmap_h=
ptes

>h_enter, remove_hpte, h_protect, h_read and rehash_hpte should never
>be called for a KVM guest (KVM will intercept the relevant hcalls
>before they reach qemu).  I think it would make sense to split of a
>TCG only portion of spapr_hcall.c into a new file.  You'll then
>probably need !TCG stubs for those hypercalls, which should trip a
>fatal error (if KVM hasn't handled the calls, there's nothing we can
>do that will salvage the situation).

These functions are static, so I thought about turning them into non-static=
 functions and creating the prototype in
internal.h and changing hw/ppc/meson.build to add the correct .c file but h=
w/ppc/ doesn't have an internal.h

What is the best way to handle this static functions?


--_000_RO1PR80MB5610B3195A7C36B3878E8C68CE499RO1PR80MB5610lamp_
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
<br>
</div>
<div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
&gt;&gt; spapr_hcall.c:<br>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function h_enter =
call ppc_hash64_hpte_page_shift_noslb, ppc_hash64_map_hptes and ppc_hash64_=
unmap_hptes<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function remove_hpte call ppc_hash64_map_h=
ptes, ppc_hash64_unmap_hptes and ppc_hash64_tlb_flush_hpte<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function h_protect call ppc_hash64_map_hpt=
es, ppc_hash64_unmap_hptes and ppc_hash64_tlb_flush_hpte<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function h_read call ppc_hash64_map_hptes =
and ppc_hash64_unmap_hptes<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function rehash_hpte call ppc_hash64_hpte_=
page_shift_noslb<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; function rehash_hpt call ppc_hash64_map_hp=
tes and ppc_hash64_unmap_hptes<br>
<br>
&gt;h_enter, remove_hpte, h_protect, h_read and rehash_hpte should never<br=
>
&gt;be called for a KVM guest (KVM will intercept the relevant hcalls<br>
&gt;before they reach qemu).&nbsp; I think it would make sense to split of =
a<br>
&gt;TCG only portion of spapr_hcall.c into a new file.&nbsp; You'll then<br=
>
&gt;probably need !TCG stubs for those hypercalls, which should trip a<br>
&gt;fatal error (if KVM hasn't handled the calls, there's nothing we can<br=
>
&gt;do that will salvage the situation).<br>
<br>
These functions are static, so I thought about turning them into non-static=
 functions and creating the prototype in<br>
internal.h and changing hw/ppc/meson.build to add the correct .c file but h=
w/ppc/ doesn't have an internal.h</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">What is the best way to handle this static functio=
ns?<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_RO1PR80MB5610B3195A7C36B3878E8C68CE499RO1PR80MB5610lamp_--

