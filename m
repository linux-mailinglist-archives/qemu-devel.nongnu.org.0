Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F583D9BE5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 04:39:46 +0200 (CEST)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8vxY-0007m8-KZ
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 22:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m8vvW-0006ok-Dl
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 22:37:38 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:36795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m8vvT-0008W6-JK
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 22:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1627526255; x=1628131055;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MUmsDqqiBlAtj/J5nKgWiV0LrrSXYxkaJvyw5PIi5x8=;
 b=MKwRR3y2M6tw8qJCiUzRDY7ubVbFKLq3lO6X03HqMkzsG59zIFGCos9t
 3xBIOPevQGZw4npeA2wScuBOKzLsqNT2UbcKgrn1XK3FKvsscsSFWF/Qm
 z2ydYGdcnTFdiRCvTH3WIY7BdKXM+aiWDqDLTYjWHcpbk7CzwHkAIRYhG g=;
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 02:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHn4ufF9By0/raWlRjGK+OOsEt0xyctBBrvldVMY/+YSlWAaXqmLlvhaNk39pHUsP0pMW+LAJm3j1NUNY8BIossavMmnidxJMUA8Av8T8GjpJ8y1apd6te/woTRjD3XQ5uwP/I4RxC+JIfcc9JiLU6iQpSWoFJNXP7V1K7Z2Y02cc3DZT0rkJkLAnc42mANsIPsCAs7vaXgvlTTdcUJftt5s5v4jLuKvQWxS0LbcVmFv1Z4BYqf4HIIwjTFXOHEKUGLcgM2e6ZPREtRiomcWJLjSCufj/Qen1gwyeNm6Y+eXvRUTFQhi59Oy/EUkK5xA2N5lsxkV1UzwnHEK/9lJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OodtFja+C7QMLgQ5moH8oqtwuwybfDHTdTGvEkcrqE=;
 b=ZzToKUzIBjwri+xiVYG1WuyaLyNCU1prQr2oNbU6+3nH982kD6l2J7yb/iqTpOpQLlbylSHSEh2iyCTHoNUDrG8PUeZlHl69bPU0USnHLDPWjVUYvc0fVDCAHYAh7OvsI0e/nXF3kKFPmFh7yvIIB+hbLegYK9KayFWV8Fl7yN/HYH0i9hgIgTaMmDu03D3Byxvsd9AooY09tz9fpZo1MatenlUyGypAwF1vDrp9ZBfYUViWwisd9b07RdjpVf6aUFOpB4TyGv6zfURtRvijQALNBjli3IW7RLP2cSbAlVfmFj+8WRzpWGI5d401fu6b2SWSw6n+aZUSvs/yw8rzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7262.namprd02.prod.outlook.com (2603:10b6:a03:29b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 29 Jul
 2021 02:37:23 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4352.031; Thu, 29 Jul 2021
 02:37:23 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH for-6.2 31/43] target/hexagon: Implement cpu_mmu_index
Thread-Topic: [PATCH for-6.2 31/43] target/hexagon: Implement cpu_mmu_index
Thread-Index: AQHXhBNQ3oxHL6pZVUKMmGV6oxAeRqtZPPcQ
Date: Thu, 29 Jul 2021 02:37:23 +0000
Message-ID: <BYAPR02MB488659191A6A644BA3083FB1DEEB9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-32-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-32-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f092ef21-894b-49fe-1400-08d95239cbb6
x-ms-traffictypediagnostic: SJ0PR02MB7262:
x-microsoft-antispam-prvs: <SJ0PR02MB72629CC18D4FBF0952E5725ADEEB9@SJ0PR02MB7262.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: toimf1D18zVATfB8162FxIQTHUVQfKzNEc7LWXdJXaRh3L7qO6k1KY+AsLqPtTlhq40gAd55n4T4dC2UxJtvz0Nptuqef+u11sIR/UZPWyvrhwcaqzzaSaXkWQFwQDfjywVpIe1NrzM+R5ZPeUq5D2CFaO9XntGezlEhnyxyJzUoUoy+OlwvMIe5iDOjQmadyDP0OBSIjcwomkR8m+hiQhjrpkLX5Dh/xUIqijwZfb3/NCFnfZsDJyFjcpM1mK3IaISxOhcQZup0urN1RiLmrZFhdVISj2P2ljs7Z5u/xvCcj6fxjST/Lsri7ODXgBaXR0sZ70Y5R9SMEZ8WivDs8yyFxCZ9tm4LpwiVkLt5D9cn+zftTwLgqRTVxxn4oWF+Nx6hXmFHqjhllnOhgHHAxsWN2LnQtVCiGU/OuAAhrG5sq1P1XmjQNx9T/nvy/3TCBe8pLCmw3vkV5lYBoUgPx7baCEC31LjbFIUtgAUcHwceckS6ycCqpCyj4W92kTEa31AYJsFt5n/j57rxwo5Xb3T2jP2VFiPq/k3r9CyPJFmXSbW6sckaIMFW/ovCEEwYnll4Dm0WNKCBQRhKgmDahMQ6Kk22Cgvf9FT3WPMIvXuCfdDjYzexThaNwXuOfEOWJe9O6BnXYDBbsUYOWW7lwbEsU/JN5aq1Jp3F974TG6fPonInMabJD2JQ1Ho8Kpz5f1mqj6llGodWPW+vBc6QGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(478600001)(86362001)(66446008)(66476007)(66556008)(8936002)(38100700002)(122000001)(64756008)(38070700005)(53546011)(76116006)(4744005)(8676002)(110136005)(9686003)(33656002)(5660300002)(316002)(186003)(66946007)(26005)(52536014)(83380400001)(7696005)(55016002)(2906002)(6506007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?emF9Sw3USGmF6kCFx7AhIzMu7svLLvH/34H7LuN7zJn6zaKlLF3j8gtHCKUi?=
 =?us-ascii?Q?LO7Ai+szM5Y4md6lDxkCRcGZ2azGD/MvQgIrz3mxSg0AyG3s/qg9M5zfc2Bl?=
 =?us-ascii?Q?lXVSdAQen3hz4fOzFOvfryH8aj9LwXrrbEHSTaPBQiFywWULLDmDxRNwYO7q?=
 =?us-ascii?Q?g7GkXOkXWbbpiRKHBfzOl+r1S7Hn4OhhSeMWmfgi29+CaHB/YYZ0TXV6QOvD?=
 =?us-ascii?Q?CQF6IFmNs3Va+l+xQCcVLIQukkj4vRjh5w4d1oxItFBJlMw4QoU34QC7zuDo?=
 =?us-ascii?Q?ACWRjPx+UN6UOmkS4m40uujCkmLErmnnYQBfz1WltYYxX1ENtoKblqVsD9Rp?=
 =?us-ascii?Q?CWqpezNiqLUQ6TIMU98RPiQtyRsmYkBN5iNqyU6EiCtNdSIxaReNPQIWcFM+?=
 =?us-ascii?Q?OiJhDksTJrDpHRD18npNHBpBz/HUCWw46BJ9Mbm2K2cZg5gSOC5Ql8GOMtqT?=
 =?us-ascii?Q?SHB31TIR+E7G/qUWV4tOg55V0UzZhFFi+fkeQ4H32u8tsVJEtRjZWuvcgw8+?=
 =?us-ascii?Q?qPTXhoA1Thskzv5TuL/1J5eWrIop66wE73JqLF+iv5wBH9WL94zC5FIVAmpP?=
 =?us-ascii?Q?yDANKTnA4smxxnftG+HpSUra0hAjGqvq1mOnglHdJ9FsaTK+jal9U/TDusZD?=
 =?us-ascii?Q?Zih9NIvBEeykaiSnF03shqB5Up9cRa/mkVY2ZejK+JCvOoFFsp4kc8W0DY/9?=
 =?us-ascii?Q?acAHOMKC/Q/dZ1UNv4O9h5vI1m855T177WBh8SFFrAYhsvUgj62vRhr3pEWU?=
 =?us-ascii?Q?aj+KFGPoa2D2X2FiJ8JBe7bzwH38Reyobz01k7UQCT2UJiEtpfKI6wq7dgd7?=
 =?us-ascii?Q?sFk4onG0mcDkBxfICtNYJQsWB5ACOLJhWy406XT2Ap1861M3CVsOhqWkxttL?=
 =?us-ascii?Q?yReZdcqvE/HV4t4sKn/HgjukRBhkUcsmaJUSKEQ7igQcjJII7yFlrALUeAwq?=
 =?us-ascii?Q?4aoMcn6D3esVesUfDVg+/XtGLLN6ooCN1g7dg7HkjNEprc1cYo/b4d1rx21w?=
 =?us-ascii?Q?z5zXc9K2tcURqlp0cWdTM5oYAD68FoNyFtnrlEzeOxYM2sqYTMyziIoY1pr0?=
 =?us-ascii?Q?Ynw9DaNYgWJtcv6v3A+0wEsgsFNogdMLxkkMCFBqqH2QaY0DsI1dJTwb4aAm?=
 =?us-ascii?Q?hTYMAnFguoyrDXbQY5wMZQTAWTafP9yXdg0F21GTsG3+Xocio6gNvXEyHn7c?=
 =?us-ascii?Q?UL1BvnX219OzLc/fhn1vhwAiCViuAJxERnjRxNy6dbZVcueaBSq5SInLEBAu?=
 =?us-ascii?Q?fi9TAOZ3yHhnOKnP3f5EBXSC7gDdnmqX4cFdwgeaT1vDlqEWjEv2i0Humi/E?=
 =?us-ascii?Q?zmW+FWAueAI/gppRXqLW2qQk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f092ef21-894b-49fe-1400-08d95239cbb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 02:37:23.2497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vATfvmWmCwrWsfN1XnrKYu0ViFMHf83nGXx8m1Yet3J1ZDSRmRBXuUiVG79Xx8HkPTfvLMn/Ngbp75S6D4JNqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7262
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



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Wednesday, July 28, 2021 6:47 PM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH for-6.2 31/43] target/hexagon: Implement cpu_mmu_index
>=20
> The function is trivial for user-only, but still must be present.
>=20
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/cpu.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h index
> 2855dd3881..bde538fd5c 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -144,6 +144,15 @@ static inline void
> cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,  #endif  }
>=20
> +static inline int cpu_mmu_index(CPUHexagonState *env, bool ifetch) {
> +#ifdef CONFIG_USER_ONLY
> +    return MMU_USER_IDX;
> +#else
> +#error System mode not supported on Hexagon yet #endif }
> +

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


