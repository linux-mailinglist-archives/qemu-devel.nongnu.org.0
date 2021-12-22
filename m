Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC447D8EC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 22:49:06 +0100 (CET)
Received: from localhost ([::1]:50466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n09Tt-0008SH-Gu
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 16:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n09Sa-0007nk-R1
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 16:47:44 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:30082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n09SY-0005e2-HO
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 16:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640209662; x=1640814462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4uE5Nllv5Liq2P0xvmWhLeDnAmU+/W9S82qA4zWyS+k=;
 b=ol14gp3jX8HQ6UmJMjqXROA7cy+guJulJUp02mZwTxjKA/TIsCBmumOQ
 bT/lX6ooPhmi+eQ4VsmZTnjcKo3eKhY8yYqyuHzwT8bS4iGF2fvoAjT9L
 2XeW7Hnj1xtfDM53ekwSaXrXatL8h34ELE1KMxUPXOGwlEOb5V90LPkgJ I=;
Received: from mail-dm3nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 21:47:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFPRTq6QwS567bhzbypp+fOtC19BV3rJJlp8XBE9BwQZggR9d7kSTkkLElARMNgnGdc5zz75O95heKR3q55cdXgnxTuu0+6YOcnWr5w/CFWsx3s95v9aq4dz9WHAkDkZ87sQ7itAfbukD3F5kVPu4Oz8nCg0MUhZE5qQQbnDRXnlNC6LcMGfNQ6oDv7Y3506WFziZzVFB8QOKzaqkdujg3b/dppIAIX7zE+C7q8LM3TZ1qNeoYK9dRFBLVPF6CVjEy5dt/ee4DJxSW/viBUj5GKcG+ZQV+SuIwgz3qdTl1RwPR2iEx2OTYJrVSUubFtHCzq6XpG+iWaqtVO97/jkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uE5Nllv5Liq2P0xvmWhLeDnAmU+/W9S82qA4zWyS+k=;
 b=ejPJHgm2NBLTP+XQDiKIm/i6iT7NgOAdyIJMd31/wQ1w7n5elXpxSLRHIdguAd9GY/0RwrTPxFxpad+5Hu6ZTjzV8q72U875wUfGmFL8A3p6lDvLuJcYOs9KXXlPBf4WA7PYAtD2VpsRD131wzCCPXVBvNTesh9e/2K2B2VsvSSl5/q9qwbEkTm4x8aXw6KzPTw+NaM5uRhD7TMOW+9+RUzQZEuAi05gJP9c+XNCCOlKHJz0hzoU6U5atnZZAp6D4pZySYA+tC86hcHwRepJPNjUtIKNTTJyWgj2iIzWcLnTmOhHCETVHZfaLJWCn+ye/2ZnsW3pPo1cBcwUrfvt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4672.namprd02.prod.outlook.com
 (2603:10b6:805:8f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 21:47:36 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 21:47:35 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 03/13] target/hexagon: make slot number an unsigned
Thread-Topic: [PATCH v7 03/13] target/hexagon: make slot number an unsigned
Thread-Index: AQHX8yTDrfY8m74nu0+fIZuysogLqaw/FJug
Date: Wed, 22 Dec 2021 21:47:35 +0000
Message-ID: <SN4PR0201MB8808CCADAD537BDCC891B1D5DE7D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-4-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-4-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d8605a7-a143-4c1f-5979-08d9c594aab6
x-ms-traffictypediagnostic: SN6PR02MB4672:EE_
x-microsoft-antispam-prvs: <SN6PR02MB4672A2D2F2DE57044575F764DE7D9@SN6PR02MB4672.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sDgSN55vfYz8bCNDbhlpzg3OInr52nOvCM+1O4G+YW9sbbUxtJroQMZPznKCGvxgFtulJLzBeGrYRI9vq1DmBQGtZgoNPEJ9aQ7OGQOOIVGQliJVvf8PfwAoi8QVDmZauZqOrqsdYC/NbVOCcyvuKlq0D+glftRwcKdjcPM4TOGBVNB8iklvqFHkh11oIN2QtuAC+q+3Z30YYveg7+lQQeelTrpXccrDkFjHrXxSgW9B2YotHfMZb9U5PLrqUCJ0rb5GWJBqc3GYo2g0G57yr6AVUT1o5XwD6g/Wtkbl5v6RjKU0GhdgIeWk7P5YXGyBYGa++HWuCvtS0yPFSZUX5ycgbjmTO0xvU6t/lft5WsVtKOcpQ4BvDt0LtCoOgpwZBDjZM+ultAXpGZriTx8NhK5DAtwUQLxO8M0lz8Fg4jlWTBt6puIUiiEyZWrO98Nzcj5tcv74HmeyVS2OnvW+qV0Uu3QbwuaTvpdhdj1of5yPO9LUlwGBTsJu0NJJ6eFk0479TO4D3jNTzrfFMoDZRe0cs+9yUvmZuZhWqtnrhq6uHk29Bi1XtSfRifKuLCF65jZzE20od1kTCdMV5J+ATIbSG/R2+UoePqLMJEu919JnRtvsQIWIvw0lVnmQAU/7KvrQcbf/fFTrZi5GD95HcXPSKDqPv5YeojCxOzLTlopWxvVltzD3xOsrabr+sXG24s2X2gwGtOgoAYYGtCPGpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(71200400001)(2906002)(316002)(9686003)(33656002)(5660300002)(4326008)(38100700002)(122000001)(4744005)(86362001)(53546011)(52536014)(66446008)(66556008)(66476007)(64756008)(8936002)(54906003)(26005)(8676002)(110136005)(76116006)(186003)(508600001)(66946007)(38070700005)(7696005)(55016003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MPbxqHQszW5J5JQ0Ih1a2XTZVpHKe7EPMoMRC0q7dBqNVnBxH4+NyEO5XTqg?=
 =?us-ascii?Q?alU0g9FwQRWOwQ4dQzUcnnYz6q08/H7JoETaf7MgX2eXoxi4BYxE0Mrs2Sam?=
 =?us-ascii?Q?hfpDR2bJfo5sXkctduB9lHnHVgadov5g9uTqR3YRhkeuvaWxBVaH+qCiJUsL?=
 =?us-ascii?Q?51DdQjVnwHw3i3skxfnk+PFfvOt8sXockqqrc0y5yjJTXxnHk5vMBgyPCLS9?=
 =?us-ascii?Q?6LFEGQ6S/E7EOtwTzJSyQIXKQUQJJaTwd9EGBG89s+MSrAZjcg++fF+1qs44?=
 =?us-ascii?Q?/hMhSvfkTMvX7IW1k9CyMAAsawOs91QyHxViRH8Np01rry794lISJsbZ64+3?=
 =?us-ascii?Q?Q+N33haS5+jAs0o1wzbgOa6LCzmUcQpiYpW1+RScyRE5vyz6/UMqGGBU8xx8?=
 =?us-ascii?Q?1W3P9m4OLrqbcu8xAaIS/tnLlYzTdXx4viFAFTY1T33aTb78Kxehc9qN5JIC?=
 =?us-ascii?Q?eAeQbwaAaRKSCI0G8BIVQySl85nXoVgu8YbMJJ7c4vz7p435Mdtav+TK9OTx?=
 =?us-ascii?Q?PY0DyALMCDL60t8c/D8OfRKVf1wPXDijN7aoTHai8noFw6htd0MxhI0Cx5fp?=
 =?us-ascii?Q?OXqIi5RB0oh3q+D0OJ8F9DAN9v3mxsj5GGagDkzeFlsun7WuPsxgD0Kqb7YE?=
 =?us-ascii?Q?ymCCKyIJ52KxUYhH+vc/dBNtW8ASeaL6sgk23Xawpl/4YloH9xRQsIa7WSIB?=
 =?us-ascii?Q?jgeN9T0o7R2kHieK41pfjtZSpRUmEckyLOp58Rc566CAR1fXC8RB0QjQXwyM?=
 =?us-ascii?Q?SH7ObJVqs4jePepja6FIKI0XIoV6NT4NQJgm7YyyhfVpVAySZ6+w39YVfieF?=
 =?us-ascii?Q?deCaJVhb138278OmK2hp2/kuiFNV8UMjqBE8DNrYmdmqD3XakkQuEvpj4bvF?=
 =?us-ascii?Q?S22wS7lZpFjJLRmbpAOcwYJhU5b/opNm+j0F45/ZqQrn0UrHWCQdPX/Ofihs?=
 =?us-ascii?Q?bnSqScfGL/3b5GMgf1MLBUoQfc7Sx3/sxKc1lPrBP0XPoC/tfX+rmVtlijmA?=
 =?us-ascii?Q?oFnqnLZE/Ox7n6pXKMzW7m9IfVd9CVbIR0rjx1afPud5slsJjOz8FfEMDA5L?=
 =?us-ascii?Q?U0QF/N54niIED6hmezlcrZRpiwwteo5FlYF+Fls0qCe8ObxLAZhbcrNYe29F?=
 =?us-ascii?Q?eEpfLGlT3X4tzdbUw19MGUmMOpSwkMxSyr2fylleuvHiji/kprML983Bzd0p?=
 =?us-ascii?Q?57QlTjHrPcjCAPGRqvA5Xmn23U+XT+duLOVK8ImnRJGjlENJCWyjMI/il66S?=
 =?us-ascii?Q?6lmeKN5NJGdOZgefEcwKMDgpdQe3YmG7A/upbgWMkERUHbcrFAPTi6nLOoem?=
 =?us-ascii?Q?7rpYDL+EqM8d9yEYDNUb9WM7bWArnE2VUNIQZggu81Va69c660+NkdkK5Z32?=
 =?us-ascii?Q?1KbB2P/Q3bthyE0AJULd1d/RWx6/6Y0RLSVsGUjwbuwQeOko6EDo2fMrvuU1?=
 =?us-ascii?Q?B/OEmNgsa6ERY0OJywOVJJ/eXuvODn6L4g35mKq/TuGtu9nUbTc8a+L6OMwT?=
 =?us-ascii?Q?RUQ4nCG+ywIMOjkJ3sbK2LCiHRhjzrjB2KPScwuMPgHaHp9SLeFUp+9WQ/5+?=
 =?us-ascii?Q?GkcKYTpkjEulEXh3Q4L13jLitqOeRo9egqxdbyxBUxqdoQQ9215OjJM+foPC?=
 =?us-ascii?Q?WLJDNdX1qrZJ7tKlqQhIC4k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8605a7-a143-4c1f-5979-08d9c594aab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 21:47:35.8763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PId8jVHxgg8NX5CIh3GQ4scpuPwtpotrPTkkWXIHKQJk9YGolrBCvrpsMSpX9vgyM3m/4YghNXWmX/Vr20nM/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4672
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
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
> Subject: [PATCH v7 03/13] target/hexagon: make slot number an unsigned
>=20
> WARNING: This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

