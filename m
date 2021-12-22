Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6BE47DA7B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 00:22:47 +0100 (CET)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0AwZ-0004ap-1z
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 18:22:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n0AvG-0003p9-FE
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 18:21:26 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:46569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n0AvD-0001jW-Ag
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 18:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640215283; x=1640820083;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gH6QKDGbfLl2uwXYfQzRY0b+qnrIvV0v3Hoa28dAjU4=;
 b=rvPhxE27l9HXjve0QTce4uq67BFQbw0JXDFsmEWJPJubZsR6RdXyOOWv
 TztjsEuGSom3m1Of/kCn+VWpvi1wt60LWGqovcYeYlw/yqDOeAZyZK5Ah
 us/rG686nLBYOUvSVf9mvYAjTVqkxLVuc6uLT/sWOqHeS5dtZv7kKv48w M=;
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 23:21:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jW/RgcO690bFoFCphG4MQeEmCA7boR43jEJc0XDnIuPZJqzW2S0K4Ix8aQ84JLuYJmRLUV8TtgUDJZ0d65zJh4pfESsBuK3ttkQIgfM8q3ztu/xkwLCb6GllSRlPSI71+fD+NXJ6m02ZnKeyBKN221nd4G+KTaK97RJhyetUi7DW9jkdJRRvM41UuL+qA7iZoeuLZjCD6M66GRrbVUqsobbv0cSBctGvbO311PM4YKKl7cm5YqPd43OP+CfdJBW2BWQs7AqNLpGqGR2x4PMK2f0sQko3+Ig554Vy04s345sdD89mMoDPoVDJIYOxAFe6ghD1boSSHYbRm13XL64HBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH6QKDGbfLl2uwXYfQzRY0b+qnrIvV0v3Hoa28dAjU4=;
 b=lo8VXwtN0ync3rnZjtTKiIKvcKQzpLefsjhprskgNR6TUO85BHI+AOjAGf05ELWjh8XZtCrzYYYtKaT6BAdTiTFcEFU4Brlhqh+a3L4jM2rQ9YszCZv1imuviw3SZqJ3LGHDliwMImPb7zi+ByF3Byg2RY8TvDffihL+HiBM+Nj3vbcT6NoWGGxRm8d8hs7shVcES8syYrq4S6s01KjY3/JyW8ImA+LU+U9iqrcqnlsAf8n5A2nX9peYWpu2JFIzEOxzaaQm0Q4ATP5qKWrUxp+feYBsVS/7+Hlod8Lwhvj4wEgs8LLxWuGY8qrv3W4+IUCW9RT7Y2fA2lLQpVi+5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA0PR02MB7196.namprd02.prod.outlook.com
 (2603:10b6:806:da::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 23:21:20 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 23:21:19 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 11/13] target/hexagon: call idef-parser functions
Thread-Topic: [PATCH v7 11/13] target/hexagon: call idef-parser functions
Thread-Index: AQHX8yTD7Cfq/4XTDkq8xT4O3qs6x6w/KwCw
Date: Wed, 22 Dec 2021 23:21:19 +0000
Message-ID: <SN4PR0201MB8808B454DFB2A4E97F99E492DE7D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-12-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-12-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 469aed1f-84d5-49b3-7847-08d9c5a1c2e6
x-ms-traffictypediagnostic: SA0PR02MB7196:EE_
x-microsoft-antispam-prvs: <SA0PR02MB719656D955F592932EE79983DE7D9@SA0PR02MB7196.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z9a32jgBEeUhEEwGOGq3jF9ZqWyoJS8kbkIVJt4B7UapPC9Peg1ClP6ht3xwhdiltM+n+bzDERwyMwQclU2cEnR7iP31A+GYYJgtN/aEiM9cCSfqSejfLlVoFAy79vOH15GOr7QsHe5rGSf+7Hl34jOIOgtVZytt9z2ccmCfy+BsfQuIm4TVLQszM2YYjynX7IfDiG5UlZT/Qe7mk0ycE3wkm6XuyfQknwnJh+FHm4Zi1kJyZVNf32Rv0T21WDD3isebrK8cVhZ0tcR/rcHmgQyUXEfJOzUm0ApMN5MzHzZKlBgDT/0LrMeH0QzORxGCQnO+N0ZDcREmbUT4nqIQGFSA4YgUvE8PNJydBxE+MSxU3qHmABmFR3Jz2KuMecuNly5i2RIUGQeslIhW+wBAiZd7l587rGjD6DWVwE8tFj+9/l/P6vgR2RvjD+VatVX1olTah72Lrn/aejrjvUuFQJAx1laDovO9riAa1/TSqYGP6mOdIhSiBf3/nvxvMlWQILF7zyhbp4gAEKdGG0+B4N8MAvHAW55xCAJwm4W6jSMjzgzSTCqd9vT5UodnlS0uHp8CJda90MTjKuGo1vWvS5tf50w/Qxnf52LtuVTydQLwilHWd/tMVba8GTZsqjrjWmIlsJf33rEpTO/s8m9nfVeEzYUQmfCJHAibCPWnAuXC8zt6H3kIraGsN13folJ2nqXotZwS2NlePdV21O26Uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(33656002)(38100700002)(8676002)(7696005)(86362001)(4326008)(26005)(508600001)(55016003)(110136005)(2906002)(5660300002)(53546011)(76116006)(9686003)(66446008)(316002)(66556008)(66946007)(66476007)(64756008)(38070700005)(6506007)(8936002)(54906003)(71200400001)(83380400001)(52536014)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dcDEQ0pTACW0/epe0Xqd2YrEdGUZSX7rZXik4XEf2pi8AgoweskitdxXZ+2M?=
 =?us-ascii?Q?d2YGGVk/6StxHk7vTEkabak2q+URLRqo3Lwkiw+iuYjRcTNlWG4q7+WWGjX4?=
 =?us-ascii?Q?vbrfgD9YojOOpOWucZbnqGdb+qzX1vT7lc6jRdmTd0WvjKnghFYwkN7pXTSC?=
 =?us-ascii?Q?Zv2o41bSh+RdSIVTjb5CUtvR+deKOu53Vjot9DP7B1mVUf/lLuU5h0+evXYA?=
 =?us-ascii?Q?RX/P8pPI2knrZYHpXNebgNuSqQ6YCD5rLwrZvzUX8aG1A2CiIcIDP8I3uADN?=
 =?us-ascii?Q?HcYZaTD7nYqA51VOX3XGV6WezgwyJ5K/AA31ueSESa4v6tjEdxeVjxL3evmu?=
 =?us-ascii?Q?iihMAvh8aDp0TaEQ/a9xPCZtt/MZ+zVAc8ZIwyOQ5I+NlpTY4VgwLDldPrYv?=
 =?us-ascii?Q?67cA0zCafP4Ozp24H9bN28nU9Wa/hjpsZWj2TfVYlCCnKUQon6I5xra7JwEq?=
 =?us-ascii?Q?+Ka45IYfrjNgIBQYPxonxRiKgbN15yEDVbklp//togv0SY2XoTaIiuzVF0Y2?=
 =?us-ascii?Q?ppnkb2qA5STQn2HpNrPMxa2xx0FZsji3la+9DFZKF4FIwNKURdgESRV/R2I6?=
 =?us-ascii?Q?VdgKQScfdpbYaT2Tc4FEDmfWdUp8bXFG3P+zCeUjdbpWJT5YKizh5BqPO2y3?=
 =?us-ascii?Q?B1ldW09QJuLQ5UdxxIi+VTz3FT3miE75WFQm/u94fyZ1uQ+brASBa+hOt44n?=
 =?us-ascii?Q?3mRN8HMXoy1gOKiXl8IO3uOnTcvuqi9qVjy5h4RotFt8B1YVmhcP0Ps+LTgs?=
 =?us-ascii?Q?5GSwK91Zs6WEzlW2LZT1z5tDD+5LTEdBjIIOBHpQiZrJr5Rh+MEA2FH6aJ2O?=
 =?us-ascii?Q?zl0iVrDm6pqbJmIfvAxrrYjZdUl/u7E5QzRKayAK4o/IIdgeAoPpT6OUFnid?=
 =?us-ascii?Q?dTMbt2+GZbfN8AMHBooI+jyabScWFsAfMTeyLF325Ny3ES1x3r9xLaJSVW+R?=
 =?us-ascii?Q?XRaMS24fEgIXMCkGh8VNjhWlv53fmy74kkebFMQibpkqDAb8XIoRKJb50eMb?=
 =?us-ascii?Q?EYYRR8a16bl4WT8+QXRmcfhdGqsEnyKljRV4+BP/Nij+JVGcTCO2VcC6gEhK?=
 =?us-ascii?Q?B83mXYamiG2u4yFEN7AApXljotXaoth8sd6mlNrdY0AZEcHXHj6KpUxJ3gFn?=
 =?us-ascii?Q?VZ/U/10h8eyRgaBXnAGhCQ/R32jUcqtj7YtJqCpdo9I8oVK0jDaUJVanoNOH?=
 =?us-ascii?Q?Xi1y74IB9MCKAGQ7zeSxINYZKKKCzx8JfcfIQIviyR4qGc6P8hkZB9XNvz6P?=
 =?us-ascii?Q?KHLkIBKPl6DxzopWNeKy9rDnw1ZFxn5KSBBLuoD/B5sDe/z0wMBsExLzG2Zv?=
 =?us-ascii?Q?xyNyu/RUuS95ab0GdOi58Hv04PRvdnvCSjPcfK1ffs7wz5t4JEcPVupoK1gr?=
 =?us-ascii?Q?UBx5rUCS5onKDipt+Y3JqV4vpVfFyB+RQ1E4FBMqAuxgV71y7guC8gKjknHL?=
 =?us-ascii?Q?OG4P++aT8yEAPCT5h6b24UbRtpF4YSwoKKUOybgN16j7rIZx0ILnOf4ehPBb?=
 =?us-ascii?Q?HySo7by7MKbrF81OJRyd0ZmIPJxc5O2+Fnl+0f3EwJEYXnyou0RMSD/0uGHR?=
 =?us-ascii?Q?C0AgUWK5Nx9cVNkihBbLNrbUgMJT4qpXLuQRwDXKpOkkY9O5+7JDwylY0U9q?=
 =?us-ascii?Q?N41Pf/umTU1726mZkgIk234=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469aed1f-84d5-49b3-7847-08d9c5a1c2e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 23:21:19.9145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2q5eEQOjl045esgzlowM5ptme0OhZtHGvx6ZMVnRlAbj6yn8J9FT6J2iVxAcesPPg6siw2rrMYAcW2C4Od7Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7196
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Anton Johansson <anjo@rev.ng>
> Sent: Friday, December 17, 2021 2:01 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
> richard.henderson@linaro.org
> Subject: [PATCH v7 11/13] target/hexagon: call idef-parser functions
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Extend gen_tcg_funcs.py in order to emit calls to the functions emitted b=
y
> the idef-parser, if available. An option is also added to fully disable t=
he
> output of the idef-parser, which is useful for debugging purposes.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> diff --git a/target/hexagon/gen_tcg_funcs.py
> b/target/hexagon/gen_tcg_funcs.py index 1fd9de95d5..0ea89d1ed7 100755
> --- a/target/hexagon/gen_tcg_funcs.py
> +++ b/target/hexagon/gen_tcg_funcs.py


>      hex_common.calculate_attribs()
> +    ## Whether or not idef-parser is enabled is
> +    ## determined by the number of arguments to
> +    ## this script:
> +    ##
> +    ##   5 args. -> not enabled,
> +    ##   6 args. -> idef-parser enabled.
> +    ##
> +    ## The 6:th arg. then holds a list of the successfully
> +    ## parsed instructions.
> +    if len(sys.argv) > 6:
> +        hex_common.read_idef_parser_enabled_file(sys.argv[5])
>      tagregs =3D hex_common.get_tagregs()
>      tagimms =3D hex_common.get_tagimms()
>=20
> -    with open(sys.argv[5], 'w') as f:
> +    output_file =3D sys.argv[-1]
> +    with open(output_file, 'w') as f:
>          f.write("#ifndef HEXAGON_TCG_FUNCS_H\n")
>          f.write("#define HEXAGON_TCG_FUNCS_H\n\n")
> +        f.write("#include \"idef-generated-emitter.h.inc\"\n\n")

This should be conditional on the number of arguments to this script


