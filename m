Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EAE5B26A8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:23:43 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWN7m-0001yK-Dn
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oWN5f-0000PE-5M
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 15:21:31 -0400
Received: from mail-am6eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::729]:2528
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oWN5c-0003rg-Ow
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 15:21:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2sLINHwiYQSTVgd3jmUKMn7ecU/vXC+2GdOVg2YX8Kd9nw05ogu6NUozuPeWrXKBPrBAnaQc+HDnqTGinUMtxyWRaw7kP23gBdfXig6lqhaKXsL+J0YY4vp9LVBHIhC1MxkO4oWHEBMT+X25AABij5XHxgtlXA22Gew3rVR88o2hKmMhB1RW6GtS51hEuVDMtsm1V1jYai4uqvZB1cCPS5+KVtljcX2mnRk9EZdEfBE8/07D2Nijw04I6OqfQYql/P8ltQNxilak9iB8/HGKLYRvd0+N1Mbn88+WIFTia1tUcPKtsxAU1XrMnAqESPqFiSppN5IeU2r9IMsog6nMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeEYWhxYkxHhd7t7FYTO/sWXu+gy7iG/RVRZvLMVXTI=;
 b=IrOt+846Sf/fa+0bCvhUp1r42aTxelzGU3x/NHA4RH4Ic0OHXoDyEaACJLMkSuwf/ZwgDjOJ09QJXUhgbOorrTHLYBm/WRtsxqmCmgW7sySl7xnny9VnFJ5/ZLbV+rgXdnqh9TpHoHP/5+pHgS4G6PUGgBQVBv64izfXvhdG99d20mJjmuAFnotPHEocY3zwDzSFZloKuaEBfCgPsD/WFh8hz0uJGx9hCOlGLleJR1R429N8GeJ1qzA1Y2b1Dfsa4kRO2WztOAaBdSCz8RusjDC0OyBF/GfiFfuQJ86mZmDcJrGIrkd4r3HvxIchyx/obDcZv8PBaA+KoQCyezwwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeEYWhxYkxHhd7t7FYTO/sWXu+gy7iG/RVRZvLMVXTI=;
 b=xvXyRepOcQBb4/InPiHrc+OA3Cw0dkKwv5eaO0BPqaDbkjsJTanGunSU8vqxTMrZ/uvfm+jyiz/wfHvn9kegtw7vPMxYyhZ82wYehXnRaLM21M7zcUQSUpprbnMHo+24K2cH6ClU1pTLNl56OODzn2wtFMzkCyTSrfKDAQcpl08=
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AM9PR03MB7852.eurprd03.prod.outlook.com (2603:10a6:20b:433::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 19:16:24 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 19:16:24 +0000
From: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
To: Richard Henderson <richard.henderson@linaro.org>, "thuth@redhat.com"
 <thuth@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "cfontana@suse.de"
 <cfontana@suse.de>, "berrange@redhat.com" <berrange@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "vince.delvecchio@mediatek.com"
 <vince.delvecchio@mediatek.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Djordje Todorovic <Djordje.Todorovic@syrmia.com>, 
 "mips32r2@gmail.com" <mips32r2@gmail.com>, Dragan Mladjenovic
 <Dragan.Mladjenovic@syrmia.com>
Subject: Re: [PATCH v2 12/20] disas/nanomips: Replace std::string type
Thread-Topic: [PATCH v2 12/20] disas/nanomips: Replace std::string type
Thread-Index: AQHYwQ5Jg57WUnLFukW9kO7hVRF1CK3QtEAAgAU2tCk=
Date: Thu, 8 Sep 2022 19:16:24 +0000
Message-ID: <VE1PR03MB6045ED62A423FBD5D3A617C1F8409@VE1PR03MB6045.eurprd03.prod.outlook.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-13-milica.lazarevic@syrmia.com>
 <dc7ac467-b881-b353-a63a-ff5a744df5da@linaro.org>
In-Reply-To: <dc7ac467-b881-b353-a63a-ff5a744df5da@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6045:EE_|AM9PR03MB7852:EE_
x-ms-office365-filtering-correlation-id: 68303c8a-b973-462b-001f-08da91ce9ef2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CFETb0Pf6RELhL4/y2je4ysl85lop/I4ZVJ0Rj1MAcgaHUP5y308R6v/LarKRPcZ+eDsKint7Zd2rzj8YMjcZ2Wt5s3OEAFhLapgYlvYngWnZUmBj1NwWos5b82ne1TNng2pKwSrcgfdTh/TBQqnsDiWwes6mmBsUDW3ykVhig4UI6jzSUxUSwO1jfjiHiJTWIKFQvPDB/6EnKFW/PpNu6WB6GaWugjzeBgRZKqHJkUryIxrA9H3lsvrMYqc4sOvYPlDBBq6zIn8ipKoUDQIDap1IZ1EWljeUpQM/Z7rGUjNoQcq3EElSaoExufCWHeUQro4hwNb+lh3+AdyzaKKm6HkM/O5Su7kvd+ixYVQAPm4bX8xuoke1dWkOs+OcaFGNkpSPa76G9XlE3Hu9wLhUe3rnwTpMORC52d0NIdOx5569onL636XA/hXNlyHKp/I2bA9SJ+tWhb5+r0CWFO8JVLSvNlGrTtS7myG0kgVCr7+4c2BWysOgunBv7CIGy4rW5v0ZRfypaEoYimu6TBCUS/rZxwAID9FIEMcRmC0v7mrH1Pz3DxV4XeogZgaezQ2lLCAhQ3FyJ/2j4xTF9G1PzpVV97PILY1MQ/OBRJJ23lWtymuETPKc4YZSJxYcKRSlhQUDWk//pGSkqwqCPhAlp7f3WYwm00Rh2la+btY14B5CrkoDiy8gLL2llqBP/Dzv/2y+iPJYfFisb2Mp+GfMbZG9JYCX90LidxIQEyN4S0qxSrn2m/4WdNURBPPXGuY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(136003)(39840400004)(376002)(396003)(66446008)(66946007)(8676002)(76116006)(66556008)(66476007)(64756008)(4326008)(478600001)(7696005)(19627405001)(52536014)(41300700001)(6506007)(8936002)(5660300002)(107886003)(38070700005)(54906003)(110136005)(316002)(71200400001)(26005)(9686003)(38100700002)(2906002)(122000001)(53546011)(86362001)(55016003)(33656002)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3X7qaAxHg+15YXSisp4mATz6vlP1qTXOtvZvk0dxSIr5jZyTsoJV6xpKxt?=
 =?iso-8859-1?Q?q5JagXIZKYOHUu+UuAfzjEIndiHxt4gQPWDxDxZhTnXFDMjmvHcjLfCsmZ?=
 =?iso-8859-1?Q?lAsUXHrTduxlKb72PGGCMS6YK+yyikTr2fs06psqyDlKjGVi5SdBLxTZ00?=
 =?iso-8859-1?Q?JGMyEN1nCBfT4t0hw2F3Y13eZP/FYnMfeXzsNo29cbBc24PW6GVJYM5rd3?=
 =?iso-8859-1?Q?pSuvwhJNqh8vsdwXmc8wlEErW2c5kTl8Yvj6LmN7qDIAbg056qdwBS8Nwb?=
 =?iso-8859-1?Q?eMPtYlnOz2sFojmT2gwqKDPrXiksIVjSSxOMwF0+k5vBIbVPAJSxQDc4+u?=
 =?iso-8859-1?Q?uGW8NKzXJHjESPgeleSXFXag0fQtaM6z/Ya4adKChLeeNmMtuuoaPH6Qa5?=
 =?iso-8859-1?Q?OsAP34MJR0zCDd/+1Ge/tRvDtOQbNvXp2z2R//YMwjDGoRSPe1m4sS4JHS?=
 =?iso-8859-1?Q?yaNk7bqohl9ndIggicFPtBWyJ/q8yymyInO5zJ8QObwf9oU/1ENJEuzfWq?=
 =?iso-8859-1?Q?C4+Eqo5QR73yv6OEaHI36oPEzHuBOMkobaMyMVejUM9BccuINq9WbcSWIY?=
 =?iso-8859-1?Q?kjLXHhs1dT55YtpoMKKJAT8j4UqPcjJ7/IqNHOczh6BaS5d2pH/CScV8TX?=
 =?iso-8859-1?Q?ARcNdy3s6rK7nY1jRuzoRI1uWSU+lzirVHiOki+WUVTY/hXUd53XZCVjFZ?=
 =?iso-8859-1?Q?E+y+Wp/xZx0DDy78icbvtpA/Do7d5iV1qHloEdXaNczTVjLZqRwX9Z4rbW?=
 =?iso-8859-1?Q?P61QTd7YBP33iihdG7uCY4TD/pxET1QTZvT8S+NmVA/KUghMw3Sax250jw?=
 =?iso-8859-1?Q?nnjzS4JKWPkJRaz4ARYdM/zb2Fl7rIckvDKdyhlHhFl2rjm8dhgko/udYI?=
 =?iso-8859-1?Q?0UVon9RWkgbl9HGz8ad2FxtS5v3HNPG0w3XCtEFeh9FkkciTcWKKegROso?=
 =?iso-8859-1?Q?QHu5c5mHAhmifdQWQ4J1iXPzC0vNxtpxTXG9hYcIVvfYKEbNb8QzT5jBvv?=
 =?iso-8859-1?Q?YWja66miIdH5dy9+bZv0/cGq1hcSFQCND9MTIsArzfu2iDgvz6sxgMkGW+?=
 =?iso-8859-1?Q?xTsYN1XXerzf/wgofV0zkxqywQ/L7GFx6txeF+/ngcTkQDJdgdbsfLx+PJ?=
 =?iso-8859-1?Q?OtUgEiPgJzi5WAhGPZUf95YRerXOzFx3SDO0klYvSuzSzNzFZevGEgtHbJ?=
 =?iso-8859-1?Q?66iOsXqyM/jx8941HqHj8amw+DwfBiPJS/DX9VmIKHlRVCulTvCuoALS3a?=
 =?iso-8859-1?Q?yT+3gFzWQKT4YxeXt6CReOhQQlPFhx4qMwNRADWopjoPJ4s04glmMBiIMc?=
 =?iso-8859-1?Q?vv2pqnWYYlouPkfzz50Av798SozYFa9TcUgqpzVP3IBFHeiXrTzexEs9iL?=
 =?iso-8859-1?Q?T5+eE5GB3vvMAw8ABm4t66mKoprR8xgvdSS6M76MjQnSo/kfljTXMyqpf5?=
 =?iso-8859-1?Q?sDrawApzsrwi9mFg1u1E5WUok7RJ5kjeXETeFZmzYf1ZggLvq+2SDTyPh8?=
 =?iso-8859-1?Q?MOHnN878HE9naMH3oTYb7gClx0thhSoElfZc7FxxFltm3YlJ5q+v2pfCrn?=
 =?iso-8859-1?Q?0I0VCb+7ET9zk0h19G4S8cTVO+p/uq8LdfAh8DB6eft0RrnNWNjyHShdUH?=
 =?iso-8859-1?Q?tygRJ9EqXbgTUjhNBhqYCM8IXbPMJIum9Y?=
Content-Type: multipart/alternative;
 boundary="_000_VE1PR03MB6045ED62A423FBD5D3A617C1F8409VE1PR03MB6045eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68303c8a-b973-462b-001f-08da91ce9ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 19:16:24.1671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQqJPHwiYazCVQOc6/2xjTSeo2QL5YsR4dByjdTmCcAS0/LEkXvORVUkS0lj68KpW82mobZN9eiI53itxk365mGtnLLOYupMQ0tNtcbVeFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7852
Received-SPF: pass client-ip=2a01:111:f400:7e1b::729;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

--_000_VE1PR03MB6045ED62A423FBD5D3A617C1F8409VE1PR03MB6045eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


On 9/5/22 10:55, Milica Lazarevic wrote:
> -static std::string save_restore_list(uint64 rt, uint64 count, uint64 gp)
> +static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
>   {
> -    std::string str;
> +    /*
> +     * Currently, this file compiles as a cpp file, so the explicit cast=
 here
> +     * is necessary. Later, the cast will be removed.
> +     */
> +    char *str =3D (char *)g_malloc(200);
> +    str[0] =3D '\0';
>
>       for (uint64 counter =3D 0; counter !=3D count; counter++) {
>           bool use_gp =3D gp && (counter =3D=3D count - 1);
>           uint64 this_rt =3D use_gp ? 28 : ((rt & 0x10) | (rt + counter))=
 & 0x1f;
> -        str +=3D img_format(",%s", GPR(this_rt));
> +        strcat(str, img_format(",%s", GPR(this_rt)));
>       }
>
>       return str;
>   }

This would be better written as

     char *reg_list[33];

     assert(count <=3D 32);
     for (c =3D 0; c < count; c++) {
         bool use_gp =3D ...
         uint64 this_rt =3D ...
         /* glib usage below requires casting away const */
         reg_list[c] =3D (char *)GPR(this_rt);
     }
     reg_list[count] =3D NULL;

     return g_strjoinv(",", reg_list);

In the implementation you suggested, there's one comma missing in the outpu=
t.
For example, instead of having:
  > 0x802021ce: 1e12 SAVE 0x10,ra,s0
We're having this:
  < 0x802021ce: 1e12 SAVE 0x10ra,s0
So, I'm assuming that there needs to exist one more concatenation between t=
he comma and the result of the g_strjoinv function?
Maybe something like
    return g_strconcat((char *)",", (char *)g_strjoinv(",", reg_list), NULL=
);
this?

Would it be acceptable to go with a similar implementation as in the patch,=
 but without a call to img_format and with the g_strconcat instead of the s=
trcat function?

> @@ -716,7 +617,7 @@ static uint64 extract_op_code_value(const uint16 *dat=
a, int size)
>    *      instruction size    - negative is error
>    *      disassembly string  - on error will constain error string
>    */
> -static int Disassemble(const uint16 *data, std::string & dis,
> +static int Disassemble(const uint16 *data, char *dis,


I think this interface should be

     char **dis,

so that...

> @@ -746,25 +647,26 @@ static int Disassemble(const uint16 *data, std::str=
ing & dis,
>                                    * an ASE attribute and the requested v=
ersion
>                                    * not having that attribute
>                                    */
> -                                dis =3D "ASE attribute mismatch";
> +                                strcpy(dis, "ASE attribute mismatch");

these become

     *dis =3D g_strdup("string");

and the usage in nanomips_dis does not assume a fixed sized buffer.


r~

I'm not sure why the fixed size buffer would be a problem here since the bu=
ffer size has already been limited by the caller.
I.e. in the print_insn_nanomips function, the buf variable is defined as:
char buf[200];

--_000_VE1PR03MB6045ED62A423FBD5D3A617C1F8409VE1PR03MB6045eurp_
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
<blockquote style=3D"border-color: rgb(200, 200, 200); border-left: 3px sol=
id rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(10=
2, 102, 102);" itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quo=
tedText">
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">On 9/5/22 10:55, Milica Lazarevic w=
rote:<br>
&gt; -static std::string save_restore_list(uint64 rt, uint64 count, uint64 =
gp)<br>
&gt; +static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)<br=
>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp; std::string str;<br>
&gt; +&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; * Currently, this file compiles as a cpp fil=
e, so the explicit cast here<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; * is necessary. Later, the cast will be remo=
ved.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp; char *str =3D (char *)g_malloc(200);<br>
&gt; +&nbsp;&nbsp;&nbsp; str[0] =3D '\0';<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (uint64 counter =3D 0; counter=
 !=3D count; counter++) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool use_g=
p =3D gp &amp;&amp; (counter =3D=3D count - 1);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64 thi=
s_rt =3D use_gp ? 28 : ((rt &amp; 0x10) | (rt + counter)) &amp; 0x1f;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str +=3D img_format(&quot;=
,%s&quot;, GPR(this_rt));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcat(str, img_format(&qu=
ot;,%s&quot;, GPR(this_rt)));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return str;<br>
&gt;&nbsp;&nbsp; }<br>
<br>
This would be better written as<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; char *reg_list[33];<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; assert(count &lt;=3D 32);<br>
&nbsp;&nbsp;&nbsp;&nbsp; for (c =3D 0; c &lt; count; c++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool use_gp =3D ...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64 this_rt =3D ...<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* glib usage below requir=
es casting away const */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg_list[c] =3D (char *)GP=
R(this_rt);<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp; reg_list[count] =3D NULL;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; return g_strjoinv(&quot;,&quot;, reg_list);<br>
</div>
</span></font></div>
</blockquote>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof"><br>
In the implementation you suggested, there's one comma missing in the outpu=
t. <br>
For example, instead of having:
<div>&nbsp; &gt; 0x802021ce: 1e12 SAVE 0x10,ra,s0</div>
<div>We're having this:</div>
<div>&nbsp; &lt; 0x802021ce: 1e12 SAVE 0x10ra,s0</div>
<div>So, I'm assuming that there needs to exist one more concatenation betw=
een the comma and the result of the g_strjoinv function?</div>
<div>Maybe something like</div>
<div>&nbsp; &nbsp; return g_strconcat((char *)&quot;,&quot;, (char *)g_strj=
oinv(&quot;,&quot;, reg_list), NULL);
</div>
<div>this? </div>
<div><br>
</div>
Would it be acceptable to go with a similar implementation as in the patch,=
 but without a call to img_format and with the g_strconcat instead of the s=
trcat function?
<br>
<blockquote style=3D"border-color: rgb(200, 200, 200); border-left: 3px sol=
id rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(10=
2, 102, 102);" itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quo=
tedText">
<br>
&gt; @@ -716,7 +617,7 @@ static uint64 extract_op_code_value(const uint16 *=
data, int size)<br>
&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; instruction size&nbs=
p;&nbsp;&nbsp; - negative is error<br>
&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; disassembly string&n=
bsp; - on error will constain error string<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt; -static int Disassemble(const uint16 *data, std::string &amp; dis,<br>
&gt; +static int Disassemble(const uint16 *data, char *dis,<br>
<br>
<br>
I think this interface should be<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; char **dis,<br>
<br>
so that...<br>
<br>
&gt; @@ -746,25 +647,26 @@ static int Disassemble(const uint16 *data, std::=
string &amp; dis,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * an ASE a=
ttribute and the requested version<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * not havi=
ng that attribute<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dis =3D &quot;ASE attribute mism=
atch&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(dis, &quot;ASE attribute =
mismatch&quot;);<br>
<br>
these become<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; *dis =3D g_strdup(&quot;string&quot;);<br>
<br>
and the usage in nanomips_dis does not assume a fixed sized buffer.<br>
<br>
<br>
r~</blockquote>
</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">I'm not sure why the fixed size buf=
fer would be a problem here since the buffer size has already been limited =
by the caller.&nbsp;
<br>
I.e. in the print_insn_nanomips function, the buf variable is defined as: <=
br>
char buf[200]; <br>
</div>
</span></font></div>
</body>
</html>

--_000_VE1PR03MB6045ED62A423FBD5D3A617C1F8409VE1PR03MB6045eurp_--

