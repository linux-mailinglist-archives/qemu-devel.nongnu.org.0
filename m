Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5395F4C7B57
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 22:06:47 +0100 (CET)
Received: from localhost ([::1]:48856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOnED-0005kh-P4
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 16:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nOnCc-0004yo-8g
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:05:06 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:17675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nOnCZ-0006bZ-Cc
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 16:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1646082303; x=1646687103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w8v4UbQYKu4xdzYwe+rvkp8pfKZsc8Qsaq7mDpttjgk=;
 b=q1gtrlU5jLeNImKV7UnRFdPqT9bSruBhLcyg7R7vYwuB7gHD5hPf16q4
 a5G19lveXscNDlmFUqarZq1pfz3BCllWJgsshstY22pDVczvr5gBcyCVJ
 NWNT3CM5fpXnboX8EN1+v1GjHbaw8oXxfsnt+pg7h9+qax7cFyWyHNZ6F Y=;
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 21:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntv0FMORGwxcncy8ZgQgiOxTHeEUlBqkOBqYPKNz50aAHhKZ518cFvj/1OQFqQNL2Tykw5NkY68Hi3yW8bSsJBYMYVlez59gKhJ2CoZ74XLRaGtxNNmialqS+JcQiK+kKWxBppSOQvisTh2JHoCRg9rIXKan8A+8Srd9hbO0lUWG2ZDMuUc1qBb7ngoAGZaJxf2gVX8UOcpZjd1zt4rLWXkxNS9We/mlmY+nBsf8kwdkqUmyIG6ak/llcR9od+PmVntc/vnL5PPYd4lTyDr8MfKujFnU0Y3T9wItjO7snmw90OBF7F4PF2x/6phr54jdSYFrzF2ntNIiYOD/lYCwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8v4UbQYKu4xdzYwe+rvkp8pfKZsc8Qsaq7mDpttjgk=;
 b=BTPVny/d7x5tnxwuiesB6DqvdRQLYvpkXTt/n8FJ3gzoiRGeBruhW6txuXtmewCGCGVML8IgzlmhMFd1BLAzZeFb/bnCOToiTFOSG9cUd889BP4FzeeqZUmkmBP53RtpNSP7zCwCZjBp/tZELVrhN3PK0BcYYhGI85+k1seZOt/nan7c16j3080I3x6262qcEirJ6FTJk6xLffNzyVZoSX9ulcr7af7j+FJbOHI9q9nfkkzEf/8xffoR17TbSKMtToXkYhKDpfjju+uAFSGE/cODrQduTQfRq7AxmG7GCX6RGbstT4PyxMMVHvVoWJcGLRzXPO5XRrhdhAHdwQG64g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL3PR02MB7923.namprd02.prod.outlook.com
 (2603:10b6:208:352::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 21:04:55 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%9]) with mapi id 15.20.4951.014; Mon, 28 Feb 2022
 21:04:55 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Ziqiao Kong <ziqiaokong@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 1/1] tcg: Set MAX_OPC_PARAM_IARGS to 7
Thread-Topic: [PATCH v2 1/1] tcg: Set MAX_OPC_PARAM_IARGS to 7
Thread-Index: AQHYK83rkrEC4aCP6EGPrirg/JbDiKypciHQ
Date: Mon, 28 Feb 2022 21:04:55 +0000
Message-ID: <SN4PR0201MB88081EEBFF5B0FE71C0A313FDE019@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220227113127.414533-1-ziqiaokong@gmail.com>
 <20220227113127.414533-2-ziqiaokong@gmail.com>
In-Reply-To: <20220227113127.414533-2-ziqiaokong@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74fb89c0-3b0f-4374-0af2-08d9fafdf8df
x-ms-traffictypediagnostic: BL3PR02MB7923:EE_
x-microsoft-antispam-prvs: <BL3PR02MB7923A636B01979D16F6D8363DE019@BL3PR02MB7923.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LEz2D3yzwIlliYtsF2jcuF9UAMvaJfk7csx1kYJJFdThOlJoZaeT06LUDhA0FCUTnufL5MuZ2/L+cBVr0z1YBCeKwg35O6RgOPTX7HFwq2P6v8Hsz2Doz+/P6nVuHl5M7BUHWq8v7EJDRDX7GszaU+TvrXh/AxfP8KxEP+jZLpc4gJFiQoeBgazUa0N5CrG5iXhHsdZxN4QiMSPr1gS5sa8mY1D/L6kXwM/XDBCWVPCTA4RsNjXOAZ3a038HlLkL+bRh0gyOpE/Cf/3gf6p66cwrqeLIeDSNyUXODiJQZlOQGyE6dhSu/itvDYWF0Gw/nYNGQclqP1cbaqZqx1Y2Hagc483trnGdZ2Rku5+4ldRENNv1aCILry337OaCZU+9DumYIMz2wSRcNcu8/HHspM7QxyYdbldX7y93YRXQFwCmzkeOtP6SPFaEfQVPyH1n8JupoXxNl39zdL8f8QbJdtwTLu2eCdY7b65zYpRFLnuM9rienRdqZ2etgCFSP5WJtSJh4vBVgH2a/IXuJztJc3JZ8/o01t6v5NB1SxxP+++KUbPKBgKugt4BX9u4qxiu0hWzmXS5PSrnEnrjO1+W24emWhpC3XPsGCOw/ygDC2InFUtowqP/ylqrPdjTnC7oNo0RM3A71tU4HkU7zlay9kdZ0XEmKBtNBSQptuue+a6tzmc5jtufdPQvBEplkaVBaTjP9aIsNG26gxLgCqErrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(55016003)(33656002)(53546011)(38070700005)(8936002)(54906003)(316002)(110136005)(6506007)(7696005)(71200400001)(9686003)(66446008)(83380400001)(508600001)(66556008)(76116006)(64756008)(8676002)(26005)(186003)(86362001)(66946007)(4326008)(5660300002)(2906002)(122000001)(38100700002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dagebFBxIeWt6mMQaxIb4ZbcUKAdYONY6tssSwVmfCuDhqm+ZtSzYxcjxlIV?=
 =?us-ascii?Q?yhKPpASE7Xi3vpjoIz+a8dimLmOqtvWSw8bhOHglILg4GgIXJ4URJYTVTFu2?=
 =?us-ascii?Q?3NxBZluvZekAO3xp3TFmXUrJ3flYMBoc/Mu4iUZxY5PFmbwZPqLQTlCBKpDX?=
 =?us-ascii?Q?k674dyp5ED4R/3U08N683t9RCBnp7fvBO5MhRI0EBZlr9K/h5lv0X+LP2w3Z?=
 =?us-ascii?Q?lE11Mcu29iyDeHnD9LQv6X4gXQQxYoEYet1fvP7w+GYSj4pYzRUIpm/uSEeM?=
 =?us-ascii?Q?YJVCAlgZCs8ReYHsSYBfjB7c+6hDX1qeIHrn7NX1bK7fGcR/5doVoyS1gAy6?=
 =?us-ascii?Q?s+q6mWdGCqLcYCyye7x4qg8omCbyCJIhRwRVeCVvqT4NnfbEBCO5x/B41klh?=
 =?us-ascii?Q?J0DIUSX3iD9pvAekLnU3s5CngJXINi9PCpDhJABU7bjujG5PHnSinNxrfH1u?=
 =?us-ascii?Q?UG4dp93tWu+SGwcL9VgQJqqBShhhW1kPvDKc0C+vnfVOUAijPPm+3TBVgUQ1?=
 =?us-ascii?Q?LR7hZ0KJAqaywWWKNYeSlyQSWmFAkQTYxYo8VKtPKpBt9VsQYmpmt8c8nmFx?=
 =?us-ascii?Q?GE344XSsRKLrnXFmK1+wjIWMrgVCGES0KhA2DMNaOSL1AmXfiOWOJKrrYSse?=
 =?us-ascii?Q?yVVHNuwRRBjdBUS2rasRHxSmowf5vpmTBXWSBVaLyfs9LhLbgA4P8bdgzakZ?=
 =?us-ascii?Q?2sXRVRbQtg6ELy+c7iTZSGOGpbbeXGckKu9zUh9GnGlIsQvIec3MXF0bleuW?=
 =?us-ascii?Q?RVFkNPtvrZI/QCBu57SiD7fTFGfoWjEwJJFjZE/VzmHO+SXATw8v85Sy7pQo?=
 =?us-ascii?Q?+bmUjYJaJjeu2nZPn5+fXL84VxtSid1J1Jw2to8PGSz55uiSvKJQBrgG/ooa?=
 =?us-ascii?Q?KsC5stvs5XldwXjZor1hlVOjs5rM6Hz+2jzOQt1yG/PGAQE/O4Q+WfhofwBK?=
 =?us-ascii?Q?3J2kZajEEa7YCipMnkGM0A2EktjG8jraNAHRy6fWjiKxB1roGYr9ukuS6Ggt?=
 =?us-ascii?Q?B68BbwPRdb3sFglafh6TtLSrKktfzeRglvbRSSsl8tPY2eLpHo8BW23OzGh1?=
 =?us-ascii?Q?Wsy3gqJ6hfDTpuwixvpiqtvAme40ijnSKqRkInPBTm3VN7qxjFjwK9vPL72O?=
 =?us-ascii?Q?67mWcl5Eh9LkHCx8MDKy2JpyEwPvfD066jnS2IJpT2kcV6d0wBeVykliVeYK?=
 =?us-ascii?Q?7mAz7FzeHUg9QfVQyP+p+Lj+bnbSidcAVG9IQ/vjrGknQH8BoSNBYv9Uv7DH?=
 =?us-ascii?Q?yL5z7yzisGEox2vpSQtDCNuQ7Nfvrb1pm6gUHmHiNr8yRt2ZLn34TdanWNcv?=
 =?us-ascii?Q?XOq7UltREr4SuwZGH3n+MHSZk6Xv2uD+a7HAh2PFd11nEtwnlispt+5u+gv9?=
 =?us-ascii?Q?w13gzva3xW1g85eXCSC2kc7F8BoZRYb7igLZdiArP2hwZKdBTqLy+ChDxSxe?=
 =?us-ascii?Q?CuPiFDTpW2xDgSe3kHqJXRmHEke/NactwcezNNVEKTpDfbflEVFhwMaoaW3k?=
 =?us-ascii?Q?p+GYXEW3opmGfIyCOyw2jPcEEawj5alds1eN6eoQL3+KtG2MYpVvyGawXC5Z?=
 =?us-ascii?Q?TNMrAUJO+sGGAegFWgmI5DDHAeZixzLzh3JpakvAkdD9acoJcAGltfTWoubA?=
 =?us-ascii?Q?azTiU7JdsD7CrLCr/mO5NQA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fb89c0-3b0f-4374-0af2-08d9fafdf8df
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 21:04:55.8047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EMnnXuqFtHg7MkpOK6Ihq9j9VEVvA41DRTqGEpiGu48pMgBnJFuR51VcrE5ql9/bC2Z7pz85zunwy+uztD0xPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7923
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "sw@weilnetz.de" <sw@weilnetz.de>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Ziqiao Kong <ziqiaokong@gmail.com>
> Sent: Sunday, February 27, 2022 5:32 AM
> To: qemu-devel@nongnu.org
> Cc: richard.henderson@linaro.org; sw@weilnetz.de; Taylor Simpson
> <tsimpson@quicinc.com>; Ziqiao Kong <ziqiaokong@gmail.com>
> Subject: [PATCH v2 1/1] tcg: Set MAX_OPC_PARAM_IARGS to 7
>=20
> The last entry of DEF_HELPERS_FLAGS_n is DEF_HELPER_FLAGS_7 and thus
> the MAX_OPC_PARAM_IARGS should be 7.
>=20
> Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
> ---
>  include/tcg/tcg.h        | 2 +-
>  tcg/tci/tcg-target.c.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h index
> 42f5b500ed..939041103e 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -43,7 +43,7 @@
>  #else
>  #define MAX_OPC_PARAM_PER_ARG 1
>  #endif
> -#define MAX_OPC_PARAM_IARGS 6
> +#define MAX_OPC_PARAM_IARGS 7
>  #define MAX_OPC_PARAM_OARGS 1
>  #define MAX_OPC_PARAM_ARGS (MAX_OPC_PARAM_IARGS +
> MAX_OPC_PARAM_OARGS)
>=20
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc index
> 0cb16aaa81..3e17c0080b 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -197,7 +197,7 @@ static const int tcg_target_reg_alloc_order[] =3D {
>      TCG_REG_R0,
>  };
>=20
> -#if MAX_OPC_PARAM_IARGS !=3D 6
> +#if MAX_OPC_PARAM_IARGS !=3D 7
>  # error Fix needed, number of supported input arguments changed!
>  #endif

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


