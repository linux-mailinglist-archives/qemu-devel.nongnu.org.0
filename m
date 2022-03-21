Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF534E3030
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:42:38 +0100 (CET)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWMzE-0005SZ-J1
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:42:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nWMxW-0004NC-F7
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:40:51 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:36078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nWMxU-0003gx-4M
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1647888047; x=1648492847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IEVpaRlfoD2q78kzLIBsn5qpXle9aD1V1kZm3+6hHhg=;
 b=WNEoIajcaEkcOk6Hk8oaREVlM8HwuvLmJhAWHlKsfYbks2RbHp8Ww+4d
 8XZrw2IeX+I+4PWVXvnJTetlmt4dvo0DI9rGU5uzJhon/qDSSFz7sye25
 MFQx3N+uXG3daC26KId6wrKgvPjCDQwdNHlgSCkARxFeHiNRTLNRaynNH 0=;
Received: from mail-bn1nam07lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 18:40:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ff/fSsdLKoV/zeZ6vEyolIyPhmNi9XEn4dlTmOBmoVtT6VW7ohg/pLjjDJ2hekYBLaxeDZZi+mi46OMXVLA96XbLfIXWJBSWZqnf73jmq0UxKPzoldm+uuqA7JKJ+ZNkQORViiWBhkzDIFgYvof4tFDNHDhEmAGv0LX4CWyLz/V3AohZRikFCYmb4RamLqyazi8/d5vPdejiDv/mdXLP1vpltPWlZfZGu8V0ZDJbbV9wFXS12Krht66rfwjUM2NSL7NdhCkyYMJsZ+lmw/zEtL1P7gbfnPtQPG+JALcF2d22RitDjtLlD2QjYJupDL+lC1KdfSuBxYnPr19UNUjn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEVpaRlfoD2q78kzLIBsn5qpXle9aD1V1kZm3+6hHhg=;
 b=GcO/xZRUXlO0ifFbPdyxKNBXMQERh38qLPH2vncFJPTdO3R/Y0GtrIIcoEagcShAgwSu1U4T4XziOzXXpAQyF4juJvz8LkegRp50zi2Bv41V5os4SN2RpK3A5iczI4OMBPXtPB0YkKkO0hcYK1FDUVLWL3ZnBQpZFpSEXEoYtnK/D/z9frq4jwZMKqKQ5jFqNZy77yPW4sAj97PAxdVzYDXD1aEpZLNt22QSikN5qY9wp9T8x/GCoweumZr09CurE5FJWXFpbJAAotJIdshpw0AUQI/snXT3DJjr18pAdHypp2HYFUXOKkjf+9s8wmdRYONvjIP/OHnjtPzQLRyIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BYAPR02MB5799.namprd02.prod.outlook.com
 (2603:10b6:a03:128::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Mon, 21 Mar
 2022 18:40:41 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::a55a:64a8:cac:4a39]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::a55a:64a8:cac:4a39%3]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 18:40:41 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 09/12] target/hexagon: import lexer for idef-parser
Thread-Topic: [PATCH v8 09/12] target/hexagon: import lexer for idef-parser
Thread-Index: AQHYHdcAoVyg/hFKhkWTasdW89A6VazKaKyw
Date: Mon, 21 Mar 2022 18:40:41 +0000
Message-ID: <SN4PR0201MB8808C325A4B4734F4DF09CAEDE169@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220209170312.30662-1-anjo@rev.ng>
 <20220209170312.30662-10-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-10-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6ba24e6-ee21-48db-e46e-08da0b6a4d22
x-ms-traffictypediagnostic: BYAPR02MB5799:EE_
x-microsoft-antispam-prvs: <BYAPR02MB57992A685DF38178F717A054DE169@BYAPR02MB5799.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qiOPsj8ATIaCqv5mnY3XjY4EnYS58+dwdoyL6v9BOA6mAwQle/6/7xXCVaeUDr6XOtoqghBzl4hF662dTklyPJmHW5osu27+sQ2Vr4DEMU/bPRLEJPJn8x8wi69IItzDfCimOwAA2TkZ3xdldEraUZ8rgwHubTUEGuONliQ383kRXMZQSZOd8yqq1ShjmIb3q4z4COAPFPz0RbwYUej2mgtLjz4jLdnKV8AXzCPc1sMQhdCeLoiqViDpaS2ldLUFyWi0mLt3hYE0YId2J4vTPHHopFH6bVQZzU8vvxZX8wSlnCF15DIR+5E/Cmee5wVdGJ4z65HVwfJOCbOFqzt/Y1RrY43Z4p5HexlD1AUOYM3KmirX+5nWgIy8fUYoxG10qs7T6z783SOuZ01SDmbcl1hsesPpJ564pd4k1fLAJI3e0kwLurf5OZkyAzERJ9FnUm2PG7cXoQD0XGfC+LAb/PfUNl9JCks1I0jWecdSWGTKfLCTLt4C1daMPI96xqjcDjRmrsOFJY+ThSR7S4nX+yWYzgHM2wsvWZTxDKWLgEdEsyEMZH4RZPCMLjHDVbk5p8Kq0FflQuPa9mTox8Wt3stIIFMipkHT1zUxN3VWXI/8kovLEfqdPrqaNOwpRGxGSs+8iOI+nIgh2aTbbCXERpsFuy3K8D76Mw1hRF/W8cGxp6DyCxbLd68UHiDe6u8IIRmZ2PQEHWMINoyRKRBZIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(316002)(83380400001)(54906003)(110136005)(33656002)(38100700002)(6506007)(9686003)(7696005)(122000001)(53546011)(2906002)(8936002)(64756008)(8676002)(76116006)(66446008)(66946007)(66556008)(86362001)(66476007)(26005)(4326008)(186003)(38070700005)(5660300002)(55016003)(4744005)(52536014)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YbdvmQzHECgXW0M3sp5zMbW/Nd9VfvTdOlH8AHIkTA8E+5FPDOolAeAbpzO2?=
 =?us-ascii?Q?ZZjlqeZwjCISooz12RVCiT0zUu2YZPwKMGleIOvF2bXBkaqizo/ImLK3VxTZ?=
 =?us-ascii?Q?lxr5Wp3DHP/LccPxFAMHQ7b9qYFedhh0ld3GzRIQ2BOn6o3BIv/IwZJZsCus?=
 =?us-ascii?Q?6r5gtFTSqf6PeC5FU7VX/eKDYpcnLKFrQZs2YKlSwpxT3fhyte5CS+ofYos6?=
 =?us-ascii?Q?HkORQgPQprHkwRcXWZEVnCdC0ZrOTnC8ny42V54+1qo4WhdPevGfQrnamPYS?=
 =?us-ascii?Q?Cpj6p6wPPRNa+SK3OhBFLBh5kpLWyZHaXxU+w12lv8Zmy/vG4zoCU3RCj7T7?=
 =?us-ascii?Q?pD70pjkV/tVUsYxDxEbQPLNzKqveuCR2L3sJPveh+0EdZzweLGP9GfFR0ykl?=
 =?us-ascii?Q?LuAV3rp0wWP1s+29cFJLQN1xxu+8hUmOkKMlTPV4xUfU9NBhYE8NPBGYERe7?=
 =?us-ascii?Q?bjXMz9imyICLk14ictP0RpsN6PSs/+A5sm3VdxypNexfCuHa+ZaUcTEYI/3/?=
 =?us-ascii?Q?hO/XaRLKmAUQROVNygNxlQ+sFSA3jX5LQAPp5jT28p9QQprSPkuH3BFaP7+J?=
 =?us-ascii?Q?vGM1wtkbDbeRdN3nXw2kmYel5QI8YulrwF98l6vSwciAuOk/Y3ziC/aW7ioM?=
 =?us-ascii?Q?EVvoaXCu/WhzLWMdmsEN55MyFf2WgWA3760Jp/TSA6zEuj4xq30tZfmq2FbU?=
 =?us-ascii?Q?O5SeF71ZrAcxKCVVztdjYUyBLSsrmVmGNmqy0ISrwE6urmR0CCHwJXWGkvYu?=
 =?us-ascii?Q?t3169zGd8LppNgNkHA1r5Z3dUV65rmGuSfrFy7ELCyX4oLmHJdWNFeWL1Fos?=
 =?us-ascii?Q?O74+JlIsWe8FCrRZXr/Q6g2Eiy4vHn4Qow7X4j7vcPBVgj62IdORZlIf+CTx?=
 =?us-ascii?Q?FIUuIg6+Q9ErVgP5YexTG9eKv+CbtIOEmsZQHdPk0XJmn0dTw+yqCvGQ7oF2?=
 =?us-ascii?Q?Nwfu12mat/ZLpB0yoKm0tZyRAgXmyP0Ia2OJ5cx0EeT/epkZCw+JaWPs82RD?=
 =?us-ascii?Q?GV+uDVtQNQWK379spIwMR9Wq4UwM7bnRIw+1AQbhCwPVfz38uTFnBMtGt52L?=
 =?us-ascii?Q?sZFQGvawPcPwY9spen4981Y2PyBGs4gOp9wJLA1xaG6afI3Hr26/343KjXqI?=
 =?us-ascii?Q?C3ZjlO0skr4rvYCooahNJiTjX9oTllk5H8Yc3RQihczepCl6KDgGqRUtXqXI?=
 =?us-ascii?Q?/mE5O/PeKc4tUdA79MmBFy5hXe77w8YuqzeY6oJLZht4no3Tm955I8LH2WoF?=
 =?us-ascii?Q?LOAm6H7bbMnpU8ndAxO+8QZwbJ4PcJx7l3iJHS2PwUtelZZs5+29cgS0A7x7?=
 =?us-ascii?Q?HpWM8SPActp8XT1pDLnodhsNqGEGA1HDbvIb1l5HaIl/GylEraQGMiZaJCaO?=
 =?us-ascii?Q?DLUNGGxEaH9n9d5aNIIGJCd/EiJHxmpRBdrhKazFvCutHRrvO9wjIJxAkaqb?=
 =?us-ascii?Q?B6vN8v/VSIJya+GudfPuhMRx/PbsWl30?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ba24e6-ee21-48db-e46e-08da0b6a4d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 18:40:41.3824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYC/IPtatl2od6cHPBHtid2xuUMwpm6SxVnDwop+ip2dxYqUw4aGHrXlzhqdtZAsYztuM6AZt2KA7cVfb8JudQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5799
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 Michael Lambert <mlambert@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Anton Johansson <anjo@rev.ng>
> Sent: Wednesday, February 9, 2022 11:03 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; Michael Lambert <mlambert@quicinc.com>;
> babush@rev.ng; nizzo@rev.ng; richard.henderson@linaro.org
> Subject: [PATCH v8 09/12] target/hexagon: import lexer for idef-parser
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/hexagon/idef-parser/idef-parser.h   | 254 +++++++++
>  target/hexagon/idef-parser/idef-parser.lex | 566
> +++++++++++++++++++++
>  target/hexagon/meson.build                 |   4 +
>  3 files changed, 824 insertions(+)
>  create mode 100644 target/hexagon/idef-parser/idef-parser.h
>  create mode 100644 target/hexagon/idef-parser/idef-parser.lex

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


