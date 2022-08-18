Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F46B597FE2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 10:13:47 +0200 (CEST)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOaev-00071u-TN
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 04:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oOaUz-0001va-LB
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 04:03:29 -0400
Received: from mail-vi1eur04on0718.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::718]:2958
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oOaUx-0004aR-7f
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 04:03:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJShBouPYfT/jh25X56ukFr6PnQeV9HeekYkF8ipYGZDTDsun0s0QtfvTcBqcKcCDj+npfaHPCnrCyt4UWAG1TaJJ+YyFkjIE8weZi7E427b3vqng81T57opGvZafvE+P+UqhKWxO1grabxtHvhk7ypkR5xkvDU2iq4leq48wbgiRSMK9m4J0plzVu0Ac+brMAEOmD7LzXPYY2JXM+BtQ4EM+eWqxOnQTlPumKvHuue9hOUaZCLD5AmX/vkEbgLUg5qDzVdo1eJBZ/9650NpaRF6Ym1tYOPKMrrPi4TS5/T/6tRH0cANBkipH34Rv7GkSlbkZhVYM37uEEBeJ6L2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJEl9gLJwNk+6mlyq63K8osGvsy6miyiALEu4dvsr4Q=;
 b=K6/v0XjYIkuxzVuc4mhRUOaAg33zC0vRbEfeyBAurmEZTdYYXO47INGVVieuvPV45yO/UjLPxjgJP0/gzfurdBgausDIzBYHir0ezHl21Mw3jHDKav/8YD0tsWP15WN/H8RjKlz4/kt9B1Hw8TA9pUd4wlj1uL5GzlfuJEVjFILY6KLz26DA4urEYqC85vnACb50q+/6PBtX2uC1oq9TIGxZboxl0z+NCxehKGdwUS3jDdsoDHRXyREv6S4AN1lqeTImGkXb8Bi7btB2GCgIlMOCN7Au2LD3WyEioz1/HWsfcWKK0oYHyvYoO7n69Gj9euLnca7UDaDg9NZI1LOSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJEl9gLJwNk+6mlyq63K8osGvsy6miyiALEu4dvsr4Q=;
 b=ElYoGfxc0ZzHkEK9rh9HVeo59ieSvR7rQjSY0waoWPlCCz4p+Rc/4VEH7ZfcDYyRX9CSPawv2SfSwuhPJu6kUo0GidbPSmpX1obHLftmMnlU11828PrW8mrmm207FZeUfa7bOmuJgXLOGwA8N8KPNUPuAc7zxjbQ/fE9rSdNgqg=
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by HE1PR0301MB2332.eurprd03.prod.outlook.com (2603:10a6:3:6e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 07:58:18 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 07:58:18 +0000
From: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "thuth@redhat.com" <thuth@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "cfontana@suse.de"
 <cfontana@suse.de>, "berrange@redhat.com" <berrange@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "vince.delvecchio@mediatek.com"
 <vince.delvecchio@mediatek.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Djordje Todorovic <Djordje.Todorovic@syrmia.com>, 
 "mips32r2@gmail.com" <mips32r2@gmail.com>, Dragan Mladjenovic
 <Dragan.Mladjenovic@syrmia.com>
Subject: Re: [PATCH 19/20] disas/nanomips: Add modifier static
Thread-Topic: [PATCH 19/20] disas/nanomips: Add modifier static
Thread-Index: AQHYsHkhp6IH7itH4EWGexVCxDbSBa2wq6yAgAOjTxY=
Date: Thu, 18 Aug 2022 07:58:18 +0000
Message-ID: <VE1PR03MB6045C5E67C7277B81F26E251F86D9@VE1PR03MB6045.eurprd03.prod.outlook.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-20-milica.lazarevic@syrmia.com>
 <a50d77f2-68a5-ab65-4911-eef14ebee9a7@amsat.org>
In-Reply-To: <a50d77f2-68a5-ab65-4911-eef14ebee9a7@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42818171-b84b-48f1-c8d3-08da80ef69a4
x-ms-traffictypediagnostic: HE1PR0301MB2332:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZQJQjCt/gY0QnNjbTfFb+PuU+oeB27tlzMgxlU4PkV6Ou7Upp+VveEUnUD7UcAcE/Hno0E0H6uSXeiv+pGgUF50co4EaTUsyQleLJPM5meTuK+WB8NhWmIiQHqyw3rthpKN/kWLAuW93wqy2lIJuZ6SfGeIeC8wU0TL1oY5PlYS5tVkwcaAAYCdtqWwUvjIIiY9GzM6P3TXQsmjHwikCucmoAIvduohNzzVIUtrmJl2JdQa/vbka20KrRC32EsNQeMjBhlxzchpJBsEEK74R71M9w2LNtj164CdGVLzlTzdGlon/cz/VQJSauHeYRbcdGvOHdXIZcrVUTW/3z6KSu8voSgaz9jvSa2cR6DdML5XQK4b7YnfapxFzosmX90W0q+MEAEiPQlLBwSJTSA8q+G/JBSl/rEnX7ynw1L7PFe6Xpb/dziztyasvX2K80klLd2BLQi6bbRSyrNzPyHCZeXMFo1jH3eAargJM8jt+xFmv5fwCXThxU9Jy2W1/8xKFLJNp7xUWtwSz7EZmcCG8I3p0L4mi7uIb4Hv34pOK51mw6TrClb1jwq6xBxk8UIMbVnbcg3Z6mvhZqDi336LqiPX75ACVYEFHvXTgFC4spvYzh4U8iD1UkHZ6JLnIl4s4mbpWPbr4HbZufkvRdi6zerns6jgGGU7q2eNouLpG0lIMeHp+OawKwd1tBUOxISfYqnyCYHtxn4OolCBjq/RB+824cMAbZOO3GObN1iq7ElBM3sr7NkzxZPxRW94hZuAn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(366004)(396003)(376002)(136003)(346002)(76116006)(66556008)(110136005)(66446008)(64756008)(86362001)(4326008)(66946007)(8676002)(38070700005)(54906003)(38100700002)(66476007)(19627405001)(8936002)(122000001)(6506007)(33656002)(53546011)(83380400001)(7696005)(71200400001)(316002)(55016003)(7416002)(478600001)(2906002)(5660300002)(9686003)(26005)(52536014)(107886003)(186003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LVi7/UHipqyfkK5vbl/TMcgLEcxIVxDlKfXK/2d1slTrq9Zk2fYVPlX23X?=
 =?iso-8859-1?Q?mi7iPwOVIY/Us3IJpXM10zEep/7J5nzkbokIE5NouSyDSlsXYkZcq9fM7+?=
 =?iso-8859-1?Q?u1w9qNMMo2OabwHv1ZKFjGPjJq2IuNLdbISJG4FO9vdzvZfwo7bmrSmHco?=
 =?iso-8859-1?Q?jybWIxoSFGUjgzIDORO+JQtT875Sn+RhAMJU8LXGC1T2q5+k7q67ptcgxj?=
 =?iso-8859-1?Q?248qouMzhXUhoTR2LQm6dXo4EWFIoIXH5kUDnxB7CnxTHg0YiR19lKvmPQ?=
 =?iso-8859-1?Q?7+af4cYobrVdSlQyotOMNuGtY7AhjOINmohf1Mwi3SkNF/M6Se847UQckJ?=
 =?iso-8859-1?Q?jBtQTOwRYrzIHJmMl6q7Mfnk/OpXhKCM69r/UyZwrJOCodoZfvHJ2E8vM4?=
 =?iso-8859-1?Q?j5l0aSfXZpHqnjYSbSyCeCQ9Im128VbraiyL11z3/BuYxCFPZ6hVGPUYl1?=
 =?iso-8859-1?Q?JCHXTZB7qw8e60F6piroOyYgFb5qAyTq0nHQC63BptFxLMN4U0nxtQTyuV?=
 =?iso-8859-1?Q?OjItM20llcxvTThJUDBfxBQ4VBfaMM7gVyVCjkgSLeF/QaMBKIMx8dhJ27?=
 =?iso-8859-1?Q?p8zXLUiGCwkULm/jCqGoSJpLECqlYbvRASyZUwNqL76EyULuM+kf8SXKje?=
 =?iso-8859-1?Q?uxOqRqn5QjkPNAV00DYaT3RhtRA1D+koXXkk5jXImsO71Cce54ZfTsXpsp?=
 =?iso-8859-1?Q?BLHBj4El1LtqryE5ZesnCy+a6afAliaJ2lNDsu5N+99V6BzLT/qm3nOMxy?=
 =?iso-8859-1?Q?861eyB+BOhuJBNbkIIhv4eHOvzGqDeaaK2MQrZ/WJ1/ypSIaHF/6wTSFzj?=
 =?iso-8859-1?Q?3cJ771rCUMInImK8M89kqOIXEKfZqO/3kbH3vPwBfBs4z993ShXbgLgaNt?=
 =?iso-8859-1?Q?tMOEhEyooIwxMFqxBfGT9rZ/UmtAuLr07kpBR1k0lWTm9Yuc1e2hjwFFO5?=
 =?iso-8859-1?Q?I25KRGU8O93OZjKn2qQTPCBVaiC4GOSkC/0WQ/ie5iFNhve3ft33YfLe/d?=
 =?iso-8859-1?Q?F9byH+xHDg8uu1//adKIQJe+Q7rXYMS1pjR/TR/xDK9N68kLPGdJlP541q?=
 =?iso-8859-1?Q?MdU9NeKuxa1MgcnSqmXT8kMUpW58k8yNRPWHDEsdxLbiPgo8A5bB5zPVqI?=
 =?iso-8859-1?Q?XC4yXp2SJKBf1SxYVYd4Ad7umJoW7IEqkFXgVVw4+MpNfAUllBf5tJK+Qk?=
 =?iso-8859-1?Q?iPF8jTfej8/ikzd6gRgJgmj9lIS4lkh8lU+uXIo1btjXXOPZgz0E03+0v3?=
 =?iso-8859-1?Q?2tyPTBTJIIKlLJtg9ogfxL8TQYpuXEXrF/E5BEFLJZntVuA6hJwAqHU7K1?=
 =?iso-8859-1?Q?3CRoViyj8MCX6BHJBS8CFYlGeqe5ChLRv9llPq1hd4o+ST2mm2kZyqWkax?=
 =?iso-8859-1?Q?jTYCtecM0Klx+dHl0kbGLKl3r80MaHVMlCQJc9wq3nUmfkWuJdJy0K07Su?=
 =?iso-8859-1?Q?txMzkevXYsspT2kjtpmAezwted1f+p3Lpm5kYeKztw84unIQgFxxghsxJl?=
 =?iso-8859-1?Q?cjYzAv9+HKRr6i//xYRvY8jkXYpyMPjR12GmSUbyHmCpEnUGzLXMLOrYSz?=
 =?iso-8859-1?Q?5OHkUDa7j+PYkGmHGyZklJz8SH8S00jVSncRfDwCnw1ILIu2wOL/ulP5Yc?=
 =?iso-8859-1?Q?yfTNTiyBn3Btx++Fj9jZUFLsmKyl5haW/U?=
Content-Type: multipart/alternative;
 boundary="_000_VE1PR03MB6045C5E67C7277B81F26E251F86D9VE1PR03MB6045eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42818171-b84b-48f1-c8d3-08da80ef69a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 07:58:18.4136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VWT9FIwRrjKwY1mh7fyXvh45YwT/VQDH1m+JbVfvW+CFtRSwfnmNOdSidVqMFdY9wdp/nazo1wUkoUcjDnMVKR+yZHDKec8w87t6PDdqHOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2332
Received-SPF: pass client-ip=2a01:111:f400:fe0e::718;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

--_000_VE1PR03MB6045C5E67C7277B81F26E251F86D9VE1PR03MB6045eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yes, it should. I'll squash it in the next version, thanks.

Milica
________________________________
From: Philippe Mathieu-Daud=E9 <philippe.mathieu.daude@gmail.com> on behalf=
 of Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
Sent: Tuesday, August 16, 2022 2:22 AM
To: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>; thuth@redhat.com <thuth=
@redhat.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; cfontana@suse.de <cfonta=
na@suse.de>; berrange@redhat.com <berrange@redhat.com>; pbonzini@redhat.com=
 <pbonzini@redhat.com>; vince.delvecchio@mediatek.com <vince.delvecchio@med=
iatek.com>; richard.henderson@linaro.org <richard.henderson@linaro.org>; pe=
ter.maydell@linaro.org <peter.maydell@linaro.org>; Djordje Todorovic <Djord=
je.Todorovic@syrmia.com>; mips32r2@gmail.com <mips32r2@gmail.com>; Dragan M=
ladjenovic <Dragan.Mladjenovic@syrmia.com>
Subject: Re: [PATCH 19/20] disas/nanomips: Add modifier static

On 15/8/22 09:26, Milica Lazarevic wrote:
> Modifier static has been added to the remaining functions that shouldn't
> be used outside of the nanomips disassembler.
>
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index e7d6bffe84..6cb527d1f7 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -114,13 +114,13 @@ static const char *to_string(img_address a)
>   }
>
>
> -uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)
> +static uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_si=
ze)
>   {
>       return (data << (64 - (bit_size + bit_offset))) >> (64 - bit_size);
>   }
>
>
> -int64 sign_extend(int64 data, int msb)
> +static int64 sign_extend(int64 data, int msb)
>   {
>       uint64 shift =3D 63 - msb;
>       return (data << shift) >> shift;
> @@ -463,7 +463,7 @@ static uint64 encode_shift3_from_shift(uint64 d)
>
>
>   /* special value for load literal */
> -int64 encode_eu_from_s_li16(uint64 d)
> +static int64 encode_eu_from_s_li16(uint64 d)
>   {
>       IMGASSERTONCE(d < 128);
>       return d =3D=3D 127 ? -1 : (int64)d;
> @@ -22780,7 +22780,7 @@ static struct Pool MAJOR[2] =3D {
>   };
>
>
> -int nanomips_dis(char *buf,
> +static int nanomips_dis(char *buf,
>                    unsigned address,
>                    unsigned short one,
>                    unsigned short two,

This seems to belong to patch #4 "Remove helper methods from class",
shouldn't this be squashed there?

--_000_VE1PR03MB6045C5E67C7277B81F26E251F86D9VE1PR03MB6045eurp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Yes, it should. I'll squash it in the next version, thanks.
<div><br>
</div>
Milica<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Philippe Mathieu-Daud=
=E9 &lt;philippe.mathieu.daude@gmail.com&gt; on behalf of Philippe Mathieu-=
Daud=E9 &lt;f4bug@amsat.org&gt;<br>
<b>Sent:</b> Tuesday, August 16, 2022 2:22 AM<br>
<b>To:</b> Milica Lazarevic &lt;Milica.Lazarevic@Syrmia.com&gt;; thuth@redh=
at.com &lt;thuth@redhat.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; cfontana@su=
se.de &lt;cfontana@suse.de&gt;; berrange@redhat.com &lt;berrange@redhat.com=
&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; vince.delvecchio@med=
iatek.com &lt;vince.delvecchio@mediatek.com&gt;; richard.henderson@linaro.o=
rg
 &lt;richard.henderson@linaro.org&gt;; peter.maydell@linaro.org &lt;peter.m=
aydell@linaro.org&gt;; Djordje Todorovic &lt;Djordje.Todorovic@syrmia.com&g=
t;; mips32r2@gmail.com &lt;mips32r2@gmail.com&gt;; Dragan Mladjenovic &lt;D=
ragan.Mladjenovic@syrmia.com&gt;<br>
<b>Subject:</b> Re: [PATCH 19/20] disas/nanomips: Add modifier static</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 15/8/22 09:26, Milica Lazarevic wrote:<br>
&gt; Modifier static has been added to the remaining functions that shouldn=
't<br>
&gt; be used outside of the nanomips disassembler.<br>
&gt; <br>
&gt; Signed-off-by: Milica Lazarevic &lt;milica.lazarevic@syrmia.com&gt;<br=
>
&gt; ---<br>
&gt;&nbsp;&nbsp; disas/nanomips.cpp | 8 ++++----<br>
&gt;&nbsp;&nbsp; 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp<br>
&gt; index e7d6bffe84..6cb527d1f7 100644<br>
&gt; --- a/disas/nanomips.cpp<br>
&gt; +++ b/disas/nanomips.cpp<br>
&gt; @@ -114,13 +114,13 @@ static const char *to_string(img_address a)<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; <br>
&gt; -uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit_size)<=
br>
&gt; +static uint64 extract_bits(uint64 data, uint32 bit_offset, uint32 bit=
_size)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (data &lt;&lt; (64 - (bit_s=
ize + bit_offset))) &gt;&gt; (64 - bit_size);<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; <br>
&gt; -int64 sign_extend(int64 data, int msb)<br>
&gt; +static int64 sign_extend(int64 data, int msb)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64 shift =3D 63 - msb;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (data &lt;&lt; shift) &gt;&=
gt; shift;<br>
&gt; @@ -463,7 +463,7 @@ static uint64 encode_shift3_from_shift(uint64 d)<b=
r>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /* special value for load literal */<br>
&gt; -int64 encode_eu_from_s_li16(uint64 d)<br>
&gt; +static int64 encode_eu_from_s_li16(uint64 d)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IMGASSERTONCE(d &lt; 128);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return d =3D=3D 127 ? -1 : (int64)=
d;<br>
&gt; @@ -22780,7 +22780,7 @@ static struct Pool MAJOR[2] =3D {<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; <br>
&gt; -int nanomips_dis(char *buf,<br>
&gt; +static int nanomips_dis(char *buf,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned address,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned short one,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned short two,<br>
<br>
This seems to belong to patch #4 &quot;Remove helper methods from class&quo=
t;,<br>
shouldn't this be squashed there?<br>
</div>
</span></font></div>
</body>
</html>

--_000_VE1PR03MB6045C5E67C7277B81F26E251F86D9VE1PR03MB6045eurp_--

