Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C734F81DD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 16:36:54 +0200 (CEST)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncTFl-0007de-Q7
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 10:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1ncNxs-0007rR-0d; Thu, 07 Apr 2022 04:58:04 -0400
Received: from mail-dm6nam08on20606.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::606]:2656
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1ncNxp-0002El-Fj; Thu, 07 Apr 2022 04:58:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkDzC1AbSsp0k0g8bo1OrSS3/fFR4+ODfbhBOqA8I5fAHzD8W2wllx/F5cV4ZrcCsf38qgMHYed80EaW3dYOS2fYxFOHQrcU2zEHYalbYC2Wh3LIW2wt+NKGIcRuLjCR50zTtLqwLATejOj6BVGt2D8ubFfjOnCRg+WzO0OP9lFrQIdQkYHJG6KIjprVkYhBxyIP7rUN83M3HgaeKQeRQaHa5oC9rhMTzy79qLUdBVoVQhiOvx+QE2cLK4t/dzJ1adIxT9glsW4F8LoKX7frHZIKrdHXdhMehfCFLM2kVOWaxALLPZDWxMRl6Yk7bpzO0zCFEcylMUe2UzwtJv7z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07JPq6eDRAcBSSLjICjOVeh2x3SUhrsRo0B5zvv2ndo=;
 b=X/2XGHixSDC0Okss9Q2+fFDklCd9Y6DRERoh77xODy6SIztZXrkFY2GnJfopGRs33muawkEX4ylJG/2M8ECRvWQgHxLVpF2xcjMNDYDNNsPaZQctrj5nuLmW7ZriSOGgOBgqI0eKwJxkpUrCIrmRyhv98jAe/zvCn9vZIauTddVT9Jeg2Hy5cHftBOXrmm4Q4FQNP4mhXuafg6dny0ojVj49NMsFJ48iS4iJz8eB63MuUZJ2of4YD/2pe+KUVQN/IDpxxFRw74F6cFV2/GhnBSlH00pMaclCFAelkBskCD5rSNUEbKvn9Xx5m0ej8bm8aUa9aGIP3L7nD8aRUcST0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07JPq6eDRAcBSSLjICjOVeh2x3SUhrsRo0B5zvv2ndo=;
 b=G6Obe2M4j5609hKrFYMIMsdLr1g6CwgxnWWoAEWL8pk/hUD+z10TkuEZAJTLJwiBPMX0O4AOOLQzV4F7bJmvHq5YsKOqBbgNZUeOFeDpK6HFRdDHPmo/tkQwRfEGmoUZZ7t8lKQUcesUigTx2SJMCwILPBte9t0o30BlEfJCC3U=
Received: from BY5PR02MB6354.namprd02.prod.outlook.com (2603:10b6:a03:1fd::12)
 by BN8PR02MB5841.namprd02.prod.outlook.com (2603:10b6:408:b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:57:57 +0000
Received: from BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::3854:75c0:3d7f:299a]) by BY5PR02MB6354.namprd02.prod.outlook.com
 ([fe80::3854:75c0:3d7f:299a%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:57:56 +0000
From: Frederic Konrad <fkonrad@xilinx.com>
To: Edgar Iglesias <edgari@xilinx.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v1 4/4] hw/arm: versal: Connect the CRL
Thread-Topic: [PATCH v1 4/4] hw/arm: versal: Connect the CRL
Thread-Index: AQHYSd3L6r6K0Cx6mUG+t7kZ2QQt86zkJonQ
Date: Thu, 7 Apr 2022 08:57:56 +0000
Message-ID: <BY5PR02MB635418AB5A8A5C5225A196C7CCE69@BY5PR02MB6354.namprd02.prod.outlook.com>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
 <20220406174303.2022038-5-edgar.iglesias@xilinx.com>
In-Reply-To: <20220406174303.2022038-5-edgar.iglesias@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a270cfb-59d0-454a-f352-08da1874b57b
x-ms-traffictypediagnostic: BN8PR02MB5841:EE_
x-microsoft-antispam-prvs: <BN8PR02MB5841F41634BC4FD319F6F8E8CCE69@BN8PR02MB5841.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1cEGRzRUK3rjLcSOTTcJAoKGSCOkik41uxopMwqahUEfLjJdUTg4hdOlg5gZtNkf6nZKuOo09cwkaSAQJukAEimczr7rorx6BGaQkp2qGXTMg8T45nk194rHHTGVo2enQKC+f8NKtnIeN4C2rG6MG58oz7L4CNlaXoNqjj9b67j8RtTOX1CBe13Sl/bTEfhbrDjI2ul5PQMeigy4/cNAOgldqNg28vunrlCJodlxkRPeESuUiEU0atgfDEmnjO8TzxSzZwPKvI+BaF44MoBJoPvJ9GUfBUvM1V3K/usjH7KPpsYjqs+f2Pd+JB93h7IvscmZCfZ6rWpWJtOt74mlhEdxLqwhv+QOt9xBYquTNOY8slBqKkV6EgWZ+uGfgneErgo9JW4I1edhAEUvjjAZNHQjRyHcqvzCG3X8R9gxErhQ7nlwYpnEAGJ7NvaE2R7xJ9D/dNtC2RjWjXOCCTV2RIuI9u8tu7v/8pSO6Pcjky4PIZbj2jgQqn9SC6vfEvsGDVrqxpaNRB+qJkQoKTJQUk3TG2S1nvJ1tZGB/l9NTO+bxf0LEVY7XdR0hKhfeo6yeHkOMZktnVNPBVc/RIamxiXE4o/u+bJSvQBlxgTAmDpVddctWuIL2eAkcBFWf9180sJ+ag8L8DTSxPNzQFvhGfrbZYz/zW6uuRLMsKHaXVlYrmjM4fVf7BZVh5FFEQv6dHnQ7Y2dnEk/MlGnsIJVHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6354.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(71200400001)(52536014)(2906002)(8936002)(508600001)(316002)(26005)(186003)(83380400001)(110136005)(38100700002)(4326008)(54906003)(7696005)(33656002)(9686003)(122000001)(5660300002)(55016003)(6506007)(66556008)(66476007)(76116006)(8676002)(66946007)(66446008)(38070700005)(64756008)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3dHEewrMWEGHOc+XXCNqQTn+zznE85658D212IJe0u48DPGCJ6Uqi1NCfpav?=
 =?us-ascii?Q?OXdJm2Z+IigLIxDX7rF8bhmeuo616FrHeOPwbNaOnvX8GEvLbTwFg3LSM2Gu?=
 =?us-ascii?Q?RGZJUjF5FEfWIf0WrmgO8t0PUg+zJmtPZ+olGsLGdiojTBrWBmvT0gvZoYU9?=
 =?us-ascii?Q?2ZHdBni2MQoHvX89Qwq43obE6KL4ocPhe4JwHHsmOeeqMlg0EYv/NJhnF7YI?=
 =?us-ascii?Q?e7dFx4TvhhuV53XvvJx8QggutjrRyrduXhYsansc8SoAlj8uEtD+8BGWOlex?=
 =?us-ascii?Q?RR7rvnDqVI/IlE6+aAGwPBAll/iTsWKOVCZvqa81DA/jBD9uOi12Pthuj+CJ?=
 =?us-ascii?Q?EY6rGb+yN0rThoexS8mmGkZJ7Jn5/DvRtJ2sutjIVQrW0wR8lIyt15wGkm/L?=
 =?us-ascii?Q?5dta12jSc/VOVRl4dwW1UG1prHQGGIxSumTrzzvUv3O34ITa7ylGulfUVwXs?=
 =?us-ascii?Q?aDFJtPBCyegY3jEoMhE/4nrrJ+atL/73Ff0JtZ6UdVYzZtIZU/IwKx+NjMQK?=
 =?us-ascii?Q?M2rvXQ2mttRhgPfbSEeHqkWEQWe0wMVyIoLiRun5Vte/acnF1gz6t8wmP7Np?=
 =?us-ascii?Q?dFLA5W6wg1UKaRz5y6f3WBbtxYN1YnvzmAZ10evZcxytIaxT8rvzo+FxbqaW?=
 =?us-ascii?Q?RW9Cb02AH8oYSuqUfmqNzbNqIUHhRWukmkp806d64Pq8hujjl7kodStmWRzY?=
 =?us-ascii?Q?4pK9AM3P7ylqwWFsw7laA//sl6HMqVXSwAF+7W844lGxz6XlZXL8b4lUuSgS?=
 =?us-ascii?Q?X4nHYKvCYsmUXIgul3niCpjdfwpWkruzCcD3h5GFnxWgugF7om2RKsyG7rXQ?=
 =?us-ascii?Q?k/hmgMKApQEXjeiirIrnyYBJ/XVcX1g6F4vmyTMBjX4tdhkHZjB+h2t+pIU7?=
 =?us-ascii?Q?2vXZ2Q/CiYe6OfrYErL9R3e6+OwnNMlPp5UTgBUBxMx4FrZLU8w9+oeD8ipA?=
 =?us-ascii?Q?zJhxBr+73FygE5VI7seFeqVqG/rJAh1Kg/bQoOyxWQZG45UMVEpbEbqzX6Ht?=
 =?us-ascii?Q?cw+5Ma0tobc9kDJZ3+vHtQyBXkXS9ccx837I3ZZsn8P9p7bBlczvYlTSI3i9?=
 =?us-ascii?Q?RqAvB2le7Ht+0LR73JxxJmI/u3La2mev3qJDC/aV7OsT4QB52HPFn5dJutQO?=
 =?us-ascii?Q?JROlDE2mBDF5Ds1d8mRvMlCLgmB6spuGuBysJFjcYfNtYUBs38vesJ0ApZo8?=
 =?us-ascii?Q?jkxruHdsCWei9RvLRQF7S3LWoUmvf9p6JRuknYkVCdKQS7KWkWRtE7xnm9Vb?=
 =?us-ascii?Q?IFjKIw4us0iBPyz/JcHrxFQEHRJec1lpogPdsTeMIyVRBU4W5Q33SMsKO6gG?=
 =?us-ascii?Q?n1v+j5BYcwl+fk9oUSxjND06kIhyGRN4Qa7RUZhGbFM2Xlb/m7recmg8M3X5?=
 =?us-ascii?Q?qduYzgbpbM3f7ML7SDWl+ff5RJnIhk/3RqW2Vi6PA/DDWyq2D5+EFTa9LiBe?=
 =?us-ascii?Q?4s/zbZBplZSslMhXH5XrlpyvjmztaGbCSptTCJbUT5JSyRYh7SDWPbFLUdX7?=
 =?us-ascii?Q?J2PfStuyV3Jabl6zH8R+vXhewr4tXLTuIJd8EFCvsJl3jENBLb/+YsbA+j95?=
 =?us-ascii?Q?N59MkkaBxtBK/aDeZQRLMuMo9NIbiZCXSKVbcJWcSKZbcITlTsTJt5BSRIuV?=
 =?us-ascii?Q?E1HoUodQ3xqkjs/gfwKzlF4VSv1tO0+n5jw5FRFxsk575vCKwvQUAIBoiuks?=
 =?us-ascii?Q?I2p6f6XdJa+BMZffA26H9SOcWHLsFl/oIzYG+OzQbn2oCztdifxpqSLmwZws?=
 =?us-ascii?Q?wYdf8eya1g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6354.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a270cfb-59d0-454a-f352-08da1874b57b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 08:57:56.5481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4t8bRy0sXYHYrxuOYAeKsNJNUe/fyTWRt3uD+3a4TyJwPKVflASGc7fcNL3Nia3WCK181Vsy1m0eWl78p7rhSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5841
Received-SPF: pass client-ip=2a01:111:f400:7e8b::606;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Apr 2022 10:25:48 -0400
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "luc@lmichel.fr" <luc@lmichel.fr>,
 "edgar.iglesias@amd.com" <edgar.iglesias@amd.com>,
 "frasse.iglesias@gmail.com" <frasse.iglesias@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Sent: 06 April 2022 18:43
> To: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; alistair@alistair23.me; luc@lmichel.fr;
> f4bug@amsat.org; frasse.iglesias@gmail.com; Francisco Eduardo Iglesias
> <figlesia@xilinx.com>; Sai Pavan Boddu <saipava@xilinx.com>; Frederic
> Konrad <fkonrad@xilinx.com>; Edgar Iglesias <edgari@xilinx.com>;
> edgar.iglesias@amd.com
> Subject: [PATCH v1 4/4] hw/arm: versal: Connect the CRL
>=20
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>=20
> Connect the CRL (Clock Reset LPD) to the Versal SoC.
>=20
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/arm/xlnx-versal.c         | 54 ++++++++++++++++++++++++++++++++++--
>  include/hw/arm/xlnx-versal.h |  4 +++
>  2 files changed, 56 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index ebad8dbb6d..57276e1506 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -539,6 +539,57 @@ static void versal_create_ospi(Versal *s, qemu_irq
> *pic)
>      qdev_connect_gpio_out(orgate, 0, pic[VERSAL_OSPI_IRQ]);
>  }
>=20
> +static void versal_create_crl(Versal *s, qemu_irq *pic)
> +{
> +    SysBusDevice *sbd;
> +    int i;
> +
> +    object_initialize_child(OBJECT(s), "crl", &s->lpd.crl,
> +                            TYPE_XLNX_VERSAL_CRL);
> +    sbd =3D SYS_BUS_DEVICE(&s->lpd.crl);
> +
> +    for (i =3D 0; i < ARRAY_SIZE(s->lpd.rpu.cpu); i++) {
> +        g_autofree gchar *name =3D g_strdup_printf("cpu_r5[%d]", i);
> +
> +        object_property_set_link(OBJECT(&s->lpd.crl),
> +                                 name, OBJECT(&s->lpd.rpu.cpu[i]),
> +                                 &error_abort);
> +    }
> +
> +    for (i =3D 0; i < ARRAY_SIZE(s->lpd.iou.gem); i++) {
> +        g_autofree gchar *name =3D g_strdup_printf("gem[%d]", i);
> +
> +        object_property_set_link(OBJECT(&s->lpd.crl),
> +                                 name, OBJECT(&s->lpd.iou.gem[i]),
> +                                 &error_abort);
> +    }
> +
> +    for (i =3D 0; i < ARRAY_SIZE(s->lpd.iou.adma); i++) {
> +        g_autofree gchar *name =3D g_strdup_printf("adma[%d]", i);
> +
> +        object_property_set_link(OBJECT(&s->lpd.crl),
> +                                 name, OBJECT(&s->lpd.iou.adma[i]),
> +                                 &error_abort);
> +    }
> +
> +    for (i =3D 0; i < ARRAY_SIZE(s->lpd.iou.uart); i++) {
> +        g_autofree gchar *name =3D g_strdup_printf("uart[%d]", i);
> +
> +        object_property_set_link(OBJECT(&s->lpd.crl),
> +                                 name, OBJECT(&s->lpd.iou.uart[i]),
> +                                 &error_abort);
> +    }
> +
> +    object_property_set_link(OBJECT(&s->lpd.crl),
> +                             "usb", OBJECT(&s->lpd.iou.usb),
> +                             &error_abort);
> +
> +    sysbus_realize(sbd, &error_fatal);
> +    memory_region_add_subregion(&s->mr_ps, MM_CRL,
> +                                sysbus_mmio_get_region(sbd, 0));
> +    sysbus_connect_irq(sbd, 0, pic[VERSAL_CRL_IRQ]);
> +}
> +
>  /* This takes the board allocated linear DDR memory and creates aliases
>   * for each split DDR range/aperture on the Versal address map.
>   */
> @@ -622,8 +673,6 @@ static void versal_unimp(Versal *s)
>=20
>      versal_unimp_area(s, "psm", &s->mr_ps,
>                          MM_PSM_START, MM_PSM_END - MM_PSM_START);
> -    versal_unimp_area(s, "crl", &s->mr_ps,
> -                        MM_CRL, MM_CRL_SIZE);
>      versal_unimp_area(s, "crf", &s->mr_ps,
>                          MM_FPD_CRF, MM_FPD_CRF_SIZE);
>      versal_unimp_area(s, "apu", &s->mr_ps,
> @@ -681,6 +730,7 @@ static void versal_realize(DeviceState *dev, Error
> **errp)
>      versal_create_efuse(s, pic);
>      versal_create_pmc_iou_slcr(s, pic);
>      versal_create_ospi(s, pic);
> +    versal_create_crl(s, pic);
>      versal_map_ddr(s);
>      versal_unimp(s);
>=20
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 155e8c4b8c..cbe8a19c10 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -29,6 +29,7 @@
>  #include "hw/nvram/xlnx-versal-efuse.h"
>  #include "hw/ssi/xlnx-versal-ospi.h"
>  #include "hw/dma/xlnx_csu_dma.h"
> +#include "hw/misc/xlnx-versal-crl.h"
>  #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
>=20
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
> @@ -87,6 +88,8 @@ struct Versal {
>              qemu_or_irq irq_orgate;
>              XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
>          } xram;
> +
> +        XlnxVersalCRL crl;
>      } lpd;
>=20
>      /* The Platform Management Controller subsystem.  */
> @@ -127,6 +130,7 @@ struct Versal {
>  #define VERSAL_TIMER_NS_EL1_IRQ     14
>  #define VERSAL_TIMER_NS_EL2_IRQ     10
>=20
> +#define VERSAL_CRL_IRQ             10
>  #define VERSAL_UART0_IRQ_0         18
>  #define VERSAL_UART1_IRQ_0         19
>  #define VERSAL_USB0_IRQ_0          22
> --
> 2.25.1

Reviewed-by: Frederic Konrad <fkonrad@amd.com>


