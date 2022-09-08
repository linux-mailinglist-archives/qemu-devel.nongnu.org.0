Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB55B28BE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 23:51:33 +0200 (CEST)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWPQq-0008WI-1L
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 17:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oWPML-0003kR-Kd
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 17:47:14 -0400
Received: from mail-eopbgr60100.outbound.protection.outlook.com
 ([40.107.6.100]:23213 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oWPMI-0003Lg-7P
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 17:46:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OA3QTXBtT5OfxJ1ek4ketMQ+ZQRneW+yMo88AdE27t8VxRopt33/0cFsU4ZpYTg5U3nhX2C2Kdt8cTYcaMW1eYiLL7G+Rtv/JApUStYB828i0fedwGWBRlKPS2iF9XI2gUiwoQ2uGl5dsXeI3yzmfPuo+IAq+9wcXGlAWvW5Ap32qE/iASdZ04RdDIxyaRkt0ZQQzn0LLSm0apiNwNoc1pioVkb/787AD2jIaBCGYLEH9tZUD/VCP3oSEEIEyiLuqANI84T0D4lLU944+BACK/VihJbcwyYeydjPi8ellr70wdXtFYSoSl5byOkmY9yKZglmobNh6CUCuHz3UhHwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgQp5AJR5dGeuEGR456iiFpuLh4crUj3N2qyojLNUwI=;
 b=mTIzJ1Rp7Ldy7Md/tfjaGuUNzxZsTr3hdXOsiz31Noc1hcXGxe1MM9rncYpgqZMibI+DC14Cjdtr5FDbZ49pTWpbw8v3hEov9WLKyUwPOwpIfbEjklT8uP503yTeqEMary+R6O12L5pxyNxfI1V3Gjh0HBFojKOi8VA5ftM1ippXJSbYS8RkpOIsJB2I6J9tWv4yLYUjBgu9cETYTXa0g42ktJrdA/VS0ZvXvs/oi/eZpnBqoMr+IuxwG1f6sTgP51fGzRYRXE2U/JbBvBUQ/W5efacFpJ9PHQPnbuTSwX5ItmUjNstwJkxi4xIbwSa/+lZHu8VcSPrTW4WfGVB/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgQp5AJR5dGeuEGR456iiFpuLh4crUj3N2qyojLNUwI=;
 b=zkkJM5GKmY6ihtWCzOIFVX9Mj13ld6oxaSOFKGShV00UpGJvxEOQWbi3klLzz7G3MAfYvPgA2pp++4pam+XaTERqCTu786qK8UKZ1St4h7+LpilDiuPaFYY7lBj3CYDK93zEUbPZQ0Tp7IZv2NAkc7jyPPI19xj0l6gh9YxOU0Q=
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AM9PR03MB6995.eurprd03.prod.outlook.com (2603:10a6:20b:2df::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 21:46:45 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 21:46:45 +0000
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
Thread-Index: AQHYwQ5Jg57WUnLFukW9kO7hVRF1CK3QtEAAgAU2tCmAACLRAIAACKjw
Date: Thu, 8 Sep 2022 21:46:45 +0000
Message-ID: <VE1PR03MB6045BDD0D14A9F78EDF5AF73F8409@VE1PR03MB6045.eurprd03.prod.outlook.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-13-milica.lazarevic@syrmia.com>
 <dc7ac467-b881-b353-a63a-ff5a744df5da@linaro.org>
 <VE1PR03MB6045ED62A423FBD5D3A617C1F8409@VE1PR03MB6045.eurprd03.prod.outlook.com>
 <275b5287-9c81-13da-f57a-0069d19158d9@linaro.org>
In-Reply-To: <275b5287-9c81-13da-f57a-0069d19158d9@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6045:EE_|AM9PR03MB6995:EE_
x-ms-office365-filtering-correlation-id: 6eef2e03-dd4f-42c6-a599-08da91e39fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8BZXerPxECOCvEDVpSOIrJkCoCoDyGi0aBTVKoIYm2F+7Oj5Ut5k+f5D2atWGdz2kB5EbgMVfNBEHJeppoTsLcFEexByrsJYlBQhrel8XgX0BHs+q9JnsXkJpyvBIH+4HULPkLedhgSoqxKWs62uyuYp1CHdDFkdLq3JDpAxRxsDRvYieb/hV76eskodqQQ22nudMGovt9j0L6Dc2Ss4n0sLx/knNUHnqpU4AvjUaZ8xdfFa87oQhsGpcE6UJZFmWYNpBLvr4c7rfV70eL+sX25L+tSqATxL2nMZtQt8n+vsSXqG3ZaMzYVcHSPwdc5RfxPx+k7qcBXLrOQjPiHMhkrSzwE7j4TZz+BArx2J/AMxFCQUHCXNE7RiN5kq6ZctZUpPjH+X7u8m1QorBZi1Xiks6R8/elLVUdlQcsNv/VcQFXZJUViFePaqJOUTyBCDqtEj+0q57eaxV5tZCL7gnSljRv8J8zHY9I7y5gSo4ZEohlZqT7+2n/x9B1os1DhsL6xjivb3VUWq5SCtY2BH0w8f6MUQoGa6MJFxMjZuGcKZdMibgyjQpqrNGwTn9f+tmrxooRzK3VRsWqL4qsrONvD8DR3tUeuqbddsToD50X9nPL9v7/T7qu2GMSv50bPfwCUzOGwT4JxcaY6fL6DHKyflfnmO3Avgh/P0kR3uEo/GJV+N+MkoHeUXpWlwPiV6w31nXSRGkGw41AjAr66+jDC/3wQADk8yA6XzAfLOJi22QTFRmWOYFKTNh9WX3x8aH3WaYpBr9PI+DqWQAo6twg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(136003)(366004)(39840400004)(346002)(26005)(53546011)(9686003)(71200400001)(478600001)(7696005)(6506007)(107886003)(41300700001)(83380400001)(186003)(2906002)(52536014)(5660300002)(8936002)(55016003)(110136005)(54906003)(316002)(4326008)(8676002)(76116006)(66556008)(64756008)(66946007)(66446008)(86362001)(66476007)(19627405001)(38100700002)(33656002)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rRz3+gX8E0qRvVJPp1lIacW6ev/UuMSUz/A7/TgvPqAQKeqyPaulXPylTFJu?=
 =?us-ascii?Q?TZahdT4FA18xtC5DqMcIfiOjiqOf1fw+x3l06+4Z8yag1ZXd6EVqY4bDOL6i?=
 =?us-ascii?Q?4dEOHBBJyWZbhhr884zj1OUa7dDfB1SqLdwX5ni+EiUIAOE/+YzjBbxSmwhz?=
 =?us-ascii?Q?pjYk6sS1jjtBlyfwe4tp+E/LyyAIdHx5Io0hAfU/Q7bwN0Yefo5vx8qukN5w?=
 =?us-ascii?Q?ImbK84mD4TCmNn/TP8u7kGYz3WsHRaNhQhMYdW+AN2Fmgfy+gfpGtv3V/J/d?=
 =?us-ascii?Q?Hw596c9aMXybsp0F8ySXE68AfSlT4Ap//3WONE8wh3OBwlnuIQNd6dzwX1Aq?=
 =?us-ascii?Q?r7SmOx0sd7lxgTv0RKBaO93qxSkmcAwi0yhDfLRNauzSzWUUI6S38K5yChrM?=
 =?us-ascii?Q?z7SWRX5cGfeLnMahePVGprLDc64bIU+dl3ZvOfgMqvs+piWVyEVCv1aSLzwK?=
 =?us-ascii?Q?EVvxjpNLvLYUcJvJ+frL943M8G12UovPJ92T0bxqUq8fnKMTG7sYOiCVEGBN?=
 =?us-ascii?Q?1zJgwVJ3Q0M8KqcOKkatsMweb7CB/TGj20GHWLvPCnLiwSEhpbplcdA58pek?=
 =?us-ascii?Q?unxQXXJyCICXvL9+kNJF1FZq2BqBoYdJmUO/f2vNd2DURFGSGDf0GKJ1/hBY?=
 =?us-ascii?Q?ZZDicbPlRc5UgDpHcagKVBD19K+WM/quVPH5zVBXaVzZtMGi5cMqMk36LIka?=
 =?us-ascii?Q?uYYoz/j0qtve7vFwznXzoPOGJYmRhKtHytRNjl2Hqs5GKYXf0l8gwyRluRHW?=
 =?us-ascii?Q?ms+HLZBovV9v3Zx055SxOe4BlvEFs98xOauurXMqoo+K5cET6hyEdVxhlHro?=
 =?us-ascii?Q?a97CBWREqJj9COiOjVVLAcdM0yCWd2RI3O+IzcTEoQ4Y4PDpXUmqyL9u3Y5v?=
 =?us-ascii?Q?8DLhlhJDRaNwBh4wFPjjHxFPvcVhR8O9hYTwzsKvjZlVEsv1qVmCX5J/layy?=
 =?us-ascii?Q?UiSYkhcSyuO8LCEJpKAgN48bTQ2KDr0JhpEZHhCB3W4A5F/ss9Lh6cc4EAxZ?=
 =?us-ascii?Q?MAUYzzE+3HRn7SMB10GkK9iXKk3QXORRkawANCpn9gZJYjal3j3z9uc9qyZ/?=
 =?us-ascii?Q?oSxg8Q0JUMOyM+Kvij+OwZUGZmW61q5iK4Tf18ENInsbYD53Y4oAamEVMxte?=
 =?us-ascii?Q?9j2oMBOiBxRoDDHL2lEGgXXkSt4FtzsH6uppBcSnOlKjoaxWT6XaY3L9aY92?=
 =?us-ascii?Q?5hDvC/X+m4H3zLViYrVTGR3ymUKTwrnBC0paDCr/+0syHgX7N980wuGfj+/n?=
 =?us-ascii?Q?nAuMLLY9rhn81HKjFOkemCe9qhV7JlRiuBXEqJpvRiKofAEZytx1HaTNNw+T?=
 =?us-ascii?Q?+glV/9VJQhYUxbmLLEAZo5Ck5aB/831OpwFX2TGelkFv+G7jPjFketSTj9e5?=
 =?us-ascii?Q?/gzaNs/1EYqVR2Ty8Pgg/qRhfe0B+KY8X8TamaBuXhjVA3qAohLmEdGC+xZT?=
 =?us-ascii?Q?NZA+sfID2D9MgD8ni+WDhUKCH1YhIrLaNjdWhSCmvdJVFrBmMauZyO2V6A2a?=
 =?us-ascii?Q?qNhe5DtIFLrXRU4efgNK0PQgrW7a83xPwYdxZwUzldVUz8EkZEfIw4wIOJBf?=
 =?us-ascii?Q?CN8IAxy51AajBet/EdhNBA04BLtDbOx+JzIwsJJZ?=
Content-Type: multipart/alternative;
 boundary="_000_VE1PR03MB6045BDD0D14A9F78EDF5AF73F8409VE1PR03MB6045eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eef2e03-dd4f-42c6-a599-08da91e39fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 21:46:45.1675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u0Ij8XzkZGmvRJBv/2oqoDs/qBnAaGrlHp9CTDDBqr65qbcbGRexa0fowXAyijWGDlM/nlfDP9jMveczkhNolAgBoFGieyse81NGI7in+Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6995
Received-SPF: pass client-ip=40.107.6.100;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--_000_VE1PR03MB6045BDD0D14A9F78EDF5AF73F8409VE1PR03MB6045eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, it's more clear to me now! I'll modify it in the next by the sugges=
tions.
________________________________
From: Richard Henderson <richard.henderson@linaro.org>
Sent: Thursday, September 8, 2022 11:14 PM
To: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>; thuth@redhat.com <thuth=
@redhat.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; cfontana@suse.de <cfonta=
na@suse.de>; berrange@redhat.com <berrange@redhat.com>; pbonzini@redhat.com=
 <pbonzini@redhat.com>; vince.delvecchio@mediatek.com <vince.delvecchio@med=
iatek.com>; peter.maydell@linaro.org <peter.maydell@linaro.org>; Djordje To=
dorovic <Djordje.Todorovic@syrmia.com>; mips32r2@gmail.com <mips32r2@gmail.=
com>; Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>
Subject: Re: [PATCH v2 12/20] disas/nanomips: Replace std::string type

On 9/8/22 20:16, Milica Lazarevic wrote:
>     This would be better written as
>
>           char *reg_list[33];
>
>           assert(count <=3D 32);
>           for (c =3D 0; c < count; c++) {
>               bool use_gp =3D ...
>               uint64 this_rt =3D ...
>               /* glib usage below requires casting away const */
>               reg_list[c] =3D (char *)GPR(this_rt);
>           }
>           reg_list[count] =3D NULL;
>
>           return g_strjoinv(",", reg_list);
>
>
> In the implementation you suggested, there's one comma missing in the out=
put.
> For example, instead of having:
>    > 0x802021ce: 1e12 SAVE 0x10,ra,s0
> We're having this:
>    < 0x802021ce: 1e12 SAVE 0x10ra,s0

Oh, right, because SAVE of zero registers is legal, and even useful as an a=
djustment to
the stack pointer.

> So, I'm assuming that there needs to exist one more concatenation between=
 the comma and
> the result of the g_strjoinv function?
> Maybe something like
>      return g_strconcat((char *)",", (char *)g_strjoinv(",", reg_list), N=
ULL);

Well, written like that you'd leak the result of g_strjoinv.

A better solution is to first element of reg_list be "", so that it's still=
 just a single
memory allocation.

>     I think this interface should be
>
>           char **dis,
>
>     so that...
>
>     > @@ -746,25 +647,26 @@ static int Disassemble(const uint16 *data, st=
d::string & dis,
>     >                                    * an ASE attribute and the reque=
sted version
>     >                                    * not having that attribute
>     >                                    */
>     > -                                dis =3D "ASE attribute mismatch";
>     > +                                strcpy(dis, "ASE attribute mismatc=
h");
>
>     these become
>
>           *dis =3D g_strdup("string");
>
>     and the usage in nanomips_dis does not assume a fixed sized buffer.
>
>
>     r~
>
>
> I'm not sure why the fixed size buffer would be a problem here since the =
buffer size has
> already been limited by the caller.
> I.e. in the print_insn_nanomips function, the buf variable is defined as:
> char buf[200];

There would be no such declaration with the above change.


r~

--_000_VE1PR03MB6045BDD0D14A9F78EDF5AF73F8409VE1PR03MB6045eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks, it's more clear to me now! I'll modify it in the next by the sugges=
tions.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Henderson &lt=
;richard.henderson@linaro.org&gt;<br>
<b>Sent:</b> Thursday, September 8, 2022 11:14 PM<br>
<b>To:</b> Milica Lazarevic &lt;Milica.Lazarevic@Syrmia.com&gt;; thuth@redh=
at.com &lt;thuth@redhat.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; cfontana@su=
se.de &lt;cfontana@suse.de&gt;; berrange@redhat.com &lt;berrange@redhat.com=
&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; vince.delvecchio@med=
iatek.com &lt;vince.delvecchio@mediatek.com&gt;; peter.maydell@linaro.org
 &lt;peter.maydell@linaro.org&gt;; Djordje Todorovic &lt;Djordje.Todorovic@=
syrmia.com&gt;; mips32r2@gmail.com &lt;mips32r2@gmail.com&gt;; Dragan Mladj=
enovic &lt;Dragan.Mladjenovic@syrmia.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 12/20] disas/nanomips: Replace std::string ty=
pe</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 9/8/22 20:16, Milica Lazarevic wrote:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; This would be better written as<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; char *reg_list[=
33];<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; assert(count &l=
t;=3D 32);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; for (c =3D 0; c=
 &lt; count; c++) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; bool use_gp =3D ...<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; uint64 this_rt =3D ...<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /* glib usage below requires casting away const */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; reg_list[c] =3D (char *)GPR(this_rt);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; reg_list[count]=
 =3D NULL;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; return g_strjoi=
nv(&quot;,&quot;, reg_list);<br>
&gt; <br>
&gt; <br>
&gt; In the implementation you suggested, there's one comma missing in the =
output.<br>
&gt; For example, instead of having:<br>
&gt;&nbsp; &nbsp; &gt; 0x802021ce: 1e12 SAVE 0x10,ra,s0<br>
&gt; We're having this:<br>
&gt;&nbsp; &nbsp; &lt; 0x802021ce: 1e12 SAVE 0x10ra,s0<br>
<br>
Oh, right, because SAVE of zero registers is legal, and even useful as an a=
djustment to
<br>
the stack pointer.<br>
<br>
&gt; So, I'm assuming that there needs to exist one more concatenation betw=
een the comma and
<br>
&gt; the result of the g_strjoinv function?<br>
&gt; Maybe something like<br>
&gt;&nbsp; &nbsp; &nbsp; return g_strconcat((char *)&quot;,&quot;, (char *)=
g_strjoinv(&quot;,&quot;, reg_list), NULL);<br>
<br>
Well, written like that you'd leak the result of g_strjoinv.<br>
<br>
A better solution is to first element of reg_list be &quot;&quot;, so that =
it's still just a single
<br>
memory allocation.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; I think this interface should be<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; char **dis,<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; so that...<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; @@ -746,25 +647,26 @@ static int Disassem=
ble(const uint16 *data, std::string &amp; dis,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; * an ASE attribute and the requested version<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; * not having that attribute<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dis=
 =3D &quot;ASE attribute mismatch&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str=
cpy(dis, &quot;ASE attribute mismatch&quot;);<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; these become<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; *dis =3D g_strd=
up(&quot;string&quot;);<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; and the usage in nanomips_dis does not assume =
a fixed sized buffer.<br>
&gt; <br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; r~<br>
&gt; <br>
&gt; <br>
&gt; I'm not sure why the fixed size buffer would be a problem here since t=
he buffer size has
<br>
&gt; already been limited by the caller.<br>
&gt; I.e. in the print_insn_nanomips function, the buf variable is defined =
as:<br>
&gt; char buf[200];<br>
<br>
There would be no such declaration with the above change.<br>
<br>
<br>
r~<br>
</div>
</span></font></div>
</body>
</html>

--_000_VE1PR03MB6045BDD0D14A9F78EDF5AF73F8409VE1PR03MB6045eurp_--

