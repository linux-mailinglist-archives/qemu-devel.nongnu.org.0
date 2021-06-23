Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0333B1E38
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 18:00:14 +0200 (CEST)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw5IR-0006FC-Gg
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 12:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw5HM-0005a7-OT
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:59:04 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:6792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw5HJ-0007MO-Co
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624463941; x=1625068741;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PfiV4mm5tAr+0THhQPEheNXp0KoQpOZ/xbHE0/qoJ/4=;
 b=Rv7mr7lLw6+KbtWw38NNNH1ODOQkdXXzafkUhvFW8AHiaHpz2UVFoNw5
 N92CR5rC+HApk5NykoZunRkoFiRlxADiDfhRaDyNEkMYVLeZy2YFEfYl2
 meMQ15ZzjWITGhGdspOwuzP/6eVnvk6NHDGnzK//quE6OfjTLgUZUeoB4 Q=;
IronPort-SDR: /7qciC65X4s0jvZmXkDrYntPbKp894m2UIJX6u47P3yvdK8Mbop5nSdfhrXJcfULD1NapTnEz2
 6rs2w+wpjiw8jZ6+R5NQJRTHa137q6A26c84G5rIVP+EDe43P8tNKXsdjCBrUvCfuU+BTRhoIU
 81mFhQwZ/e7IBFgILbbI0fHSmlSvsEvW9P2U/0c1TsDFiZZixJLgIyFXOcdVyj0Wo+ghdpIjG2
 1BJScPlrOzE2zx8qcejDLeqnB2lpkBUO1Akmwr4J7hRTTEQ29LTTClMrtbIk+11YILV/Tch2wj
 8fs=
Received: from mail-bn1nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 15:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xf37XCMMpLqjpeY5XIztRTAFObQaJyIwsvVR+QCxIKMWDxLsjNEBUMG5rfzYDnTH0p4A7JAKeMekuFlehtgEytvaR/XNdxOc/YOCMS2SVyLSpopqtmmvAAf9kcCcKa85gArN2/Jfp03lfYtNDDQ/nd6rfg1B4YzPKBvwoA2EsEA/553oD7syrkQp+maBu8/PLSsBQwTTh7ArMlBIo1z/gssfS2145VzTD0Wzdcab9QOFeHGKWbJeDRj7GRVLllf1VakTV2HEIWMyn6tmtCBTOySMmqSKIRxhiQrq+ZvDSdKs0EQ8jr4aVtCGZ8ywwMAqu6WYEc9YI0OUhO6U+GGSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYjseHH6TXRTZPw1Z2eLSv+b0r2l4zVohDbtWAmKGvQ=;
 b=TkjGOxFJFcuOxWop0mjEz69s0BcjS1jgZnPK3/SoGPfN08ieQ3GlCXecg6sMUjcz27adf1uRzZsH+6fk5l5VdQ2CZPrcu1GcPVEPtDcJ4EFPnJFh79OM+21JDUbx2uM83wEwYi5b1eUyECmtbFTgdqhXHoSzBn1HGYkWdxXkmacAg5zkuoO18BRMo+h/SXXdD2lc/AkvNqHTxv0+IWr2hTO0Z+jfYUgVlsuCusYt5PSf9agUr6LQIQczxA4rxYf4Rkv+Ez2UCXzBHeN4BJ8XWnLpNXtdh3xdt8zzT6T4k8Fb8zzr9gTDc4c4AYrqdjeQkX+5Nu/JK+4rYDivwadM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6385.namprd02.prod.outlook.com (2603:10b6:a03:1f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Wed, 23 Jun
 2021 15:58:52 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 15:58:52 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 04/14] target/hexagon: make slot number an unsigned
Thread-Topic: [PATCH v5 04/14] target/hexagon: make slot number an unsigned
Thread-Index: AQHXZO7JK26hopSm8UGJPWVIC6cn9KshxFSg
Date: Wed, 23 Jun 2021 15:58:51 +0000
Message-ID: <BYAPR02MB488681951778846A16690039DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-5-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-5-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ad3c6fd-4e8b-45b3-ad5f-08d9365fcbe6
x-ms-traffictypediagnostic: BY5PR02MB6385:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB63859EDA41DB4E55E621F897DE089@BY5PR02MB6385.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lAPIqsqHWCUTtSLO6gQluAf086kskfpN93sv9EajjMDD6fTPMAPEqTn50zKWCTaLj4mMGumAP/YpbbpTAFutwVAmo4ZAodWNhEMoxHsrsBJUQj1XLk/feeNjtZ805fC6pl2E069+JERcr54NsMEZhcsWBEqW+tKtV44J6FmV25sXY9MgJZ3O4+FSM7CFK5zOBJrmtxCL2tiJnBU951JxhS8/+1H+UYWxUaYr48H9eWgDHw0P3+5vF1Cfdx5ZEuSw8hW/0mcs3Srb2cnBvbzFWAFrjKUGeU+6UrIlhAItiEaEV+9jl6J3iNNsY9xBc2gHwxRxqa0FAXcWRuw1dSnQtpFUbFflH/txvs+F3nVI+9IH+7TNdT4joHN2j5BqJlGkwpWtqgUcH3EZmFwtu6c8z0XYQ316s+WFvLXYbFSE95UXHpSafksOaiGrkJ9zQ3w154NmneKN9PtbRjDzdYPMFepUGFDgVKhF5OzBOX27J1MgwWQi3t6qK7WqFG809rRZxKYjGnUtE30k4nhhXIK6TNuFoiPb/o0xCjZ7OtsemvJ2WQIeDoF7QEpW0PoK+43U1uI37QweHbZex+7sLv9GuKCRIGRE41ITAxPt+S9e/NY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(316002)(8676002)(86362001)(8936002)(71200400001)(4326008)(7696005)(122000001)(110136005)(52536014)(478600001)(38100700002)(54906003)(66446008)(26005)(66476007)(76116006)(5660300002)(2906002)(186003)(83380400001)(53546011)(66556008)(55016002)(9686003)(66946007)(64756008)(33656002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WQ8jV1g1MNnpRBaDjOswRPUolnItIml1GfXHa0SspOEPf68nypPr53Kj6+L0?=
 =?us-ascii?Q?w8w+wyl1MOwfDq25YgEXkkMFzcT/WvRNMSV2n5kqEO1auuLdNaelWLO/I445?=
 =?us-ascii?Q?FscysnbOz6J2MPRxbiU/0TZU7zwHERVjNvws6/svgTI60pTuX/kcowZZ81hD?=
 =?us-ascii?Q?xXVdONadb3NHjZ1Wc7/VVBhIFJw669QnxkF3fEG1WyVlZsQJJ5gi6tRCBDDx?=
 =?us-ascii?Q?3IYDNnViVUbwo/mFA5L6Dw2Uxncq8hZs+4Cg7KVjfa7KcfWevTmxMAbasTiR?=
 =?us-ascii?Q?e+z6Cbri6C6q4rGVtgKQjW4DBcklVYY1Eka2IBwgKZV6qT/xs0s71WxoTeg5?=
 =?us-ascii?Q?SVq0YGMROxvigiVHl/5JmzvkxOmVqR4+3p24jweT7KsFtKbmeu2fkFrHmciJ?=
 =?us-ascii?Q?lGwG0QdX46JK2iTfP/p0VjrdX9/2q0ys8pI4qGdo7+pMGx2n4U1NAdUHzYxO?=
 =?us-ascii?Q?5Y6baMS5LDAo3kQSKaRLs17b8OGxFgSuJX/z2kNeeoIMiiMVdo7Muu9/vFq7?=
 =?us-ascii?Q?96xCU3XROnquDS0m9NAN7jKe2IZRIieWjgU2d7RgUzmcObs1Ejq4trimyF28?=
 =?us-ascii?Q?QOVArWPFUUU9qAxtvQRsgj8w1cZMNY+1+hRy2jOqezb2iOSFta81NaN+icwa?=
 =?us-ascii?Q?tGcSnTGzPMH5LSaKSNG+gYOihreOzFh0FtOPHSI/dpjzb3Eb/BX7U94EL13a?=
 =?us-ascii?Q?ZvSx1PGbWEe2hEf/YTcdiRoOtMQ9YKwcwGeboTO0xgQsIMfPBKtJgdmNockS?=
 =?us-ascii?Q?dGfcNu9ZIjNOf/tGzmlMNXfGCf8MaW52jqZHAN/X0dfypF1H5HVtcbbDLw6J?=
 =?us-ascii?Q?LNt9iGRtXkOnqWRGp2EGrB4SLM3EpijYzistJNGk7N23LnhAvdwM1BCHxDfw?=
 =?us-ascii?Q?N4raTB/uChu6TFK0tien4ywGJiEUHkNIocY324pu+skJZ1fqnOXl2hRKM8Xz?=
 =?us-ascii?Q?6XVXG2Ecq08uhEAqjUhULkbw3IX7bDDCLYeZJGg7xugVdiJ6dOFIfI75KC5x?=
 =?us-ascii?Q?WVSIp3y1vRZV/blWT5vKo1NLfbu9P9VyG6yMBWX51Tn2k8Noqr32pUD3oxEQ?=
 =?us-ascii?Q?5WdhCulW8f0TgeSTlofktQBb9Bo4wQh7ntzZcm/wJLybZedOtyW4INWQpM/Y?=
 =?us-ascii?Q?6LMRsqf140eLGnt9MyjNPHSGxY0ztBL5vDU23YaZwhXe6bNWLHUo10+gnry9?=
 =?us-ascii?Q?7yPlMft3KZRLqUlJxwjJS9a8JE9QHD4e7UcK3IeeQFHC2DbLMcMb5PohsURk?=
 =?us-ascii?Q?FCs395msiZuFxjBklY7CAxT0guRC4MX/99q/6Y3HfyahJgMqA3WStbNLbBnz?=
 =?us-ascii?Q?nSaLS3u7pm691fEByskbV5CS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad3c6fd-4e8b-45b3-ad5f-08d9365fcbe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 15:58:51.8832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6LcyRTYTddh8/WaM6OvQ61mz072K/6Ab63tXFapzM7Fl5wPTSCpwVnTaSTewWoZ3mt64AChjBTmh/JwM3U5XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6385
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Saturday, June 19, 2021 3:37 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng; philmd@redhat.com;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v5 04/14] target/hexagon: make slot number an unsigned

I'm curious why this is needed.  Is there a bug caused by having it be sign=
ed?

>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/genptr.c | 6 ++++--
>  target/hexagon/macros.h | 2 +-

Run the following in your git repo so the .h files will appear first in the=
 patch.
    git config diff.orderFile scripts/git.orderfile
This makes it easier for the community to review


>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c index
> 797a6c0cc9..3b8013d4e2 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -33,7 +33,8 @@ static inline TCGv gen_read_preg(TCGv pred, uint8_t
> num)
>      return pred;
>  }
>=20
> -static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int =
slot)
> +static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
> +                                                unsigned slot)

Let's use uint32_t to match insn->slot that is passed to these functions.



