Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCD0538B16
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 07:53:08 +0200 (CEST)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvuoV-00017q-M9
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 01:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nvucv-0006rR-8s
 for qemu-devel@nongnu.org; Tue, 31 May 2022 01:41:12 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nvucs-0007aL-RP
 for qemu-devel@nongnu.org; Tue, 31 May 2022 01:41:08 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24V2qlqh003368;
 Mon, 30 May 2022 22:41:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=hXuBQ1PH406tp2Fs60w9ilPl6ZCVbxy84EeGuGL4+JA=;
 b=gK1sQcoe6sEEdtPaknEw7Pcc2NVzcgxKVvCa0JMj/YQWWi1g43hBbFtvAB0VttMSGmbL
 PSJXuhpEIm/uJ00XCGoxLZB7/uA8B9KIYhAV0Db9eowtXPkP3BgxcBMuLyQLqcHVyhgU
 nlLopw4PQeHMjco9doKl2rzl4IPDxVlgLhVujFHut15Ni3Ax2af8Sd9rDYvmICiQVEsC
 zHK5fHBenxjV7v/G0cmnrPvJgLgUJklSf5fHG7WX0ejeUvTV8J8r71qdYqf4cGn9KAYj
 5W9tJoySkLiE+3dMIZ5T5gM2K+2aZC4FpGmTRZVnG3kFSd7bonqxoBjGggcaR6HuVUWW Uw== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3gbk2ecacu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 22:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlIG/WZZ9z/7FwBYPP41TrOKFaSsOfbYSBx6+0DQERbBfWWFuuSF27HCBSyGCI+jNYfWXA7migVpwSibgrAqFBsMtbnmByL4pESYuo4S0PPMtniYHyEfCDyLs7e1yvAvFpTxA7jweTdEbk4ZlELGFg30Oclgqwbbx5nOqlIY0+HeJ3+sBIqYN/CWsSvO8aL1U397en2g9BUYv+9qyDN4McU8ZSsxj0DYdnuZ6pomOmUX4eHC5Qefgn7DV55qKre64KLi/ETYH0//0AQBQFkCoMAdQNjk1LmcqbkQQPaLpRHwTCxKqN+Umg/LX5F0HGiOfArP3Vwz5ljFfRTc0bwLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXuBQ1PH406tp2Fs60w9ilPl6ZCVbxy84EeGuGL4+JA=;
 b=B3LA5QrEaXZIdNM+2VfA+SP80KElUn+Ys/DqgJCt/lqi2k+fhRJnLjop3J+yeR3BcB3rdmn+HxXYsnzwp2JXDQjGICCiTdFYbo1N3T/osocLwTblblcT/IxdCdTQLN5TWgAnwAD9qpa0z7gTYtwJvROC0JpCqXm5WC10ztvLCulqWFJFUtrjpIqLkrwyMjZK8tNR/uTMIsSTQ4WmlqyfRLusQ7b/aP9lEMgUpgl3J6Ic7OzGgJTVjQ+jGayEcz/3o+GHXvfDMsIiZEcYD0H/dEjjLWRW3+OgZVE2Ghsbr0ukHGHrZJMHjQna0JViiN+8eymZmng/AibQdym7T7FRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by SN6PR02MB4558.namprd02.prod.outlook.com (2603:10b6:805:b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Tue, 31 May
 2022 05:40:59 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%9]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 05:40:58 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Changpeng Liu <changpeng.liu@intel.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/2] hw/vhost-user-scsi|blk: set `supports_config` flag
 correctly
Thread-Topic: [PATCH 2/2] hw/vhost-user-scsi|blk: set `supports_config` flag
 correctly
Thread-Index: AQHYcEDET3ZjDtuMrkKXKlw+NkTO/a04gXyA
Date: Tue, 31 May 2022 05:40:58 +0000
Message-ID: <20220531054055.GD8262@raphael-debian-dev>
References: <20220525125540.50979-1-changpeng.liu@intel.com>
 <20220525125540.50979-2-changpeng.liu@intel.com>
In-Reply-To: <20220525125540.50979-2-changpeng.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74feb55d-2022-48bc-20b4-08da42c82365
x-ms-traffictypediagnostic: SN6PR02MB4558:EE_
x-microsoft-antispam-prvs: <SN6PR02MB4558F0287C32E823C038A46CEADC9@SN6PR02MB4558.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mf2pEWeR4xAFaIzXzsAenrCyiHJR9IaPhJuumLuDsOyY+lsHA4u0F5KA/S34tgvBzTCpsVGhaeoPtTPkCnGTdc9hYpYBg7qcYUfNv5JdnxN8i/75s2uvXqIYNtZmeqHpRYNhvvgBx2NUGlZXF0uYlapk72ewXWJrbEuipCNF4xHOY6PnV3RTUcVY1ZytQdXlMg/fxuIGZgT2/7vaxjyJ0bR3btR2SOJVOEo7BA4yWC/qD0TzG1iN41RDu+N37QthhvSIInB2n4pBCZ5ngPlV9zccWCkcMI1JZOp5ppWICacOG51LwRHBjOh/mtj4sS63ngtt86uYvYJBhP0tOwnuoPYGXB4HpiXsV/7Fv81TaZtEXMtKQGXziUZ5c/FQOXWzYusjOZd8xxrkjEO7pFg0tEG2KccL0seV0pBvyjkd4QeYxTyM7RvZTnXTzTV6XLf02W1WnrVky+XneL82Q8V+s4Dgg1UEEveADfjLH+05GLtGeZCCRWtX5QATOhoqYLBKnvGyJkT9j4zkWdSy8KAytK62rMG9Xde2NaAoF8q9HT5W9eYRNP341AzoJrmk+gTuy+K4mtJQ57gT6B2i4ob1z/WZZlrR4BoR7Rt/K6gteG9oBWULE/E9CWdEJk39Awyi0lt9rNgjdnYM+904B7c1nmyOyeZHuUTLjjdGgkk0oSaI8OegJUcr1Ihq7/kr3Fk+nWTy9aXoFQcDD0m8aFPJ3SkRIlHLCiLowXrsxOt5KZ4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(1076003)(6916009)(38100700002)(54906003)(2906002)(316002)(26005)(33716001)(6512007)(9686003)(186003)(76116006)(5660300002)(66946007)(86362001)(6506007)(4326008)(64756008)(66556008)(8676002)(66476007)(66446008)(71200400001)(91956017)(122000001)(83380400001)(38070700005)(8936002)(6486002)(33656002)(508600001)(44832011)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ExrHtoabP/NoIyoQxzPHTWNH7cirdIZLmP2kmoxmBqzAAv7EiM0eF3wFEYy8?=
 =?us-ascii?Q?ZhkR7GKa34i/qwF7Gibq/SRXeIOSCIRBxzsysc7BanwkriylOcEylg/HAsNU?=
 =?us-ascii?Q?oVQEo2PUfXQAhdB8nCzS8Kq5Zda19q2gpv4Qj3N2HB9oD0z3hy5AKW2vzxxo?=
 =?us-ascii?Q?a4KlUhFpXk8c5ZlzzDj0WMfC1DSemjHYT0DH8488RbXBYfvQXXEXsOYEWOx2?=
 =?us-ascii?Q?WquA+hLrRKxY/6ILQkuvhaXErkyMZTeeke+2h5CDT+YD6fFOBmafYt9NUO2V?=
 =?us-ascii?Q?iXpvKsBiieyt03i5m5bBV2CbK7M/Dvxgkf2Auea7C9fY9x+b4K3H2UExt2Eb?=
 =?us-ascii?Q?CROfFyVU6Ae3nwMgEKbpMfOYdrkbuzv+YJJYGf1XSltLB4nDTn4U3mepxm/c?=
 =?us-ascii?Q?h5ChP0FcIq4tLhw9BHHyAiuwFHNDYPxp1C2alV5vRHgJe/cX/JyBGCu/BPJt?=
 =?us-ascii?Q?WhwtJr1pA8nDTxCMgT4c+VN07gp3jxgK/Zor/0Li5IasEXadDS6Ddh0eBm33?=
 =?us-ascii?Q?1yeSsY2OtdNxxy+EME6f1BALeYRJd1KhLq3C3JwqS4mWzLxL0re4Mcm+ctoU?=
 =?us-ascii?Q?+W5vJz8kt7kAaTcr31UK5Co3tPjPwfs6Hu0cOTUDW9zrOKQ4Z8qVyNtwjAwy?=
 =?us-ascii?Q?V+O3nEIxJz8BSBAyYmZ3H9rTZJVeh4Gy7SiYL7MzgaOWUkB5pjXoWHgdEJbU?=
 =?us-ascii?Q?9gc/7gKaIHfPw3EkPdFBd0lndUlOA5VScXmk0QZ567mN4MYjHaEYJcY5GMHX?=
 =?us-ascii?Q?VSAwmAm3pW/kHKT/Iaa/P/9brF/Yx/BjS5/QSQYSwvXw1P2xBxd0E2MSxsuG?=
 =?us-ascii?Q?R2kmERkeNw6NbPBf4uuqYc7RDKTewbYbpxV/LQ2dyDP0GOzjfXmZYsR0gYt3?=
 =?us-ascii?Q?dmfvWHpPRjxUpsVTAlqpP0yMo3kGagRJ9qOZl0fEJ+jmRcewU0dJB3CFv0bu?=
 =?us-ascii?Q?gy4Jf705W/MC/nPrLEoA6xW4k6xmalUhI1TGwwq2pLDkGDLCZIXPqc6kegEz?=
 =?us-ascii?Q?qClo/2F6rJG1fOWqs2YCN2Yr94Y/mKJ4GVwGre8MTVJHSeMW034y136NhDXi?=
 =?us-ascii?Q?CIFHwOcxkr1XWgFZpPo2VfIfUSHELd7muDRYTNBeFvckrnXj5BqU1J/TUxlT?=
 =?us-ascii?Q?O8mB0wqGaZ41tWf8x+FbYjw4uJgbvkvFh0kawbqCn/IVGVpeA7JjA4etTYlZ?=
 =?us-ascii?Q?dFizZjMewwJEZqKr4do022GLVtm511sRBUtxB4X+wFUqSM10uIBRebE0nc//?=
 =?us-ascii?Q?RBiK6RMBO8xwSB4SyLg7my8X38W5dcGrkMTnVr16SNSQd1nw3CsIrji8mL40?=
 =?us-ascii?Q?2oJuH3lD/5j+aVd1nDCPbPX/f9QGm2kEsBy3TJ8N74QxU8RvNwFzs9gnItzX?=
 =?us-ascii?Q?LEIXkQvsS5qaWN2wuYnTd03KnRAy4Byn9Tr0p7jglNlpm2uHQbriAJzhXgra?=
 =?us-ascii?Q?VVYdSytcd1w1Vrj6PlTd1mJPnlk3AejrxxrCSy5FPTM+8fiB4Muqz0/SpA4e?=
 =?us-ascii?Q?ArGKXmfxtMEfgby4In2scJLvlauSAJ1H5Bzz6pfXW5TJFRvyzWZfIi1V15EQ?=
 =?us-ascii?Q?VMX9kQ/XqKBO1jl+U0+s+Ol3Vc/zwrP5UzbazmL+Eo2KL2smmjBRif+rogpJ?=
 =?us-ascii?Q?pIavkInpaIkxG+MXH1rQCfcDRT76wlhg4BnYpRCa8evEhjEcxZaezOdKMdMW?=
 =?us-ascii?Q?ExE4eyD9P++UP0WRMUTc1cn8qW/S69zovxeSOV9B+Z/vuNIp8rXCfEftWUwU?=
 =?us-ascii?Q?OimaPVw1yORARXPiJnBa2QzdDRp7IXb4fjzaZEOjTwlsMbg6vKJP?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C2B2677E76D0E94F9DEEA2510BD8483A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74feb55d-2022-48bc-20b4-08da42c82365
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 05:40:58.0756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FLs6V/KE+aWGxp6O5SkWujDOWmEs1N4SNLZoLU7Ccuhc4/LZzocSegkSx8iGbPriyQNn0G937k9tl83xA0STNPiVZk+LRxesF+5Lv3MzYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4558
X-Proofpoint-GUID: 7nJ9L5FAXpPeGYme_d520vy6ur3Gb4JA
X-Proofpoint-ORIG-GUID: 7nJ9L5FAXpPeGYme_d520vy6ur3Gb4JA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_01,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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

On Wed, May 25, 2022 at 08:55:40PM +0800, Changpeng Liu wrote:
> Currently vhost-user-scsi driver doesn't allow to change
> the configuration space of virtio_scsi, while vhost-user-blk
> support that, so here we set the flag in vhost-user-blk driver
> and unset it in vhost-user-scsi.
>=20
> Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 1 +
>  hw/scsi/vhost-user-scsi.c | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 5dca4eab09..9117222456 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -337,6 +337,7 @@ static int vhost_user_blk_connect(DeviceState *dev, E=
rror **errp)
> =20
>      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> =20
> +    s->vhost_user.supports_config =3D true;
>      ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_U=
SER, 0,
>                           errp);
>      if (ret < 0) {
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index 9be21d07ee..1b2f7eed98 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -121,7 +121,6 @@ static void vhost_user_scsi_realize(DeviceState *dev,=
 Error **errp)
>      vsc->dev.backend_features =3D 0;
>      vqs =3D vsc->dev.vqs;
> =20
> -    s->vhost_user.supports_config =3D true;
>      ret =3D vhost_dev_init(&vsc->dev, &s->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0, errp);
>      if (ret < 0) {
> --=20
> 2.21.3
>=20
> =

