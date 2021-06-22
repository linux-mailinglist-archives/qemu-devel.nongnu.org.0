Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0BA3B1024
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 00:36:22 +0200 (CEST)
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvp0H-0006LD-0o
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 18:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lvozG-0005dX-2F
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 18:35:18 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:13430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lvozC-0006n9-Jn
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 18:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624401314; x=1625006114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tZcm6ksAZntaRegJj2g/Jjqq3XqrQoIuLC8U0WfpfDE=;
 b=ol+BHwQG4d4w/WVxxjNOjtsKEBYGEUmefS2yBhxmDsTxGCf+aHbYmi3L
 JJimuCePgtTo/br3h0Hh0oFhXh4VNU/f5fh3xW5SH4kYJiYyuOyrLDkgA
 Xp3yHUCRvbqgnzXoBOOhFM9EP59i0tEOhlRKpa6i+BDe9q5ML69Gj4mX5 o=;
IronPort-SDR: DmCHhgeV+Dl94/mcxrmV0kLvnhsquAkkcvRAPRJpMjDpB5ZKtPSOdBgTUoiL9teoj7534pe1lI
 m8ZwDTRiJZipFVn4Zl1rxoyynTc26SxJwg3dscfp4mgoLrcW4SlvrZtYbbdaeKGyXY9Ois5WjO
 JAt01OJ6048vZILlEjWUN4nthZImYCeEuoEQwkXm5WdJSaIT6AVbmO4P1cCW0dlid3jIG5qE8a
 KHW87y5fv1lu38mQ6qj6bWMBMISSZFZ4w0kZGZ+dDxP+QhCLuwEcHfkfmaA7jqLNlFoOUSImrJ
 ny8=
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 22:35:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7IKd5RBpvfly99G4dq4QTZ9GsWbAs6xCGfPKIjxHht2YnHeH2suI6BgWFCdBJlTtrp+x+yg6tkOX/NYg6/bp37VUvEk7Ubkfat/p21OXSCk5ch87PJ3OwDtVkq2Se6i5d8QOOG1UhHo2Tp1ZalOM+x/3qyKQRidHbhorWVYxH88K2jPTubVzxRiDDuUMwFlUMRAFCrNwY3rWND8wgYi9ridbyb0oignMXFwEahSO0aDw6xXCcBr/i59jFmfMXQsi26BL/gW2dDYf0+gcqhKCOOu+S0am6b2axw1nIa3pUkaLBkxKEpEyfKtP3qsvVTUQXJ5vdwqLIm5qjYz5+TGjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W32cDOQk2WfNqh673K7QDCo/iWI/UbFnmIp06RDE2aI=;
 b=d+Yq7taW6yAORW89FmdBzwGl+OLwee6I/QbQUPGXzgjaeQ+lCcFcEE5T/3YP3FTLGwo5FZVvlpd/oSNUPutY36XGHwVJ8Mo314xPEKYhVvkKu7YjYdT0v3vcmmyj9jAKVe43zqbVbTcfM5w/J5Nou7UMBWYML8KR9uvpSynrPBQGXm2hquG5L/BZyyNVZe4IeHGeOH70BaP+Zw9hbDdUObRo6yv8993hBnPtUA7I4C2mQJ/cVBsi6s7zfLz4vA1x+idDrcJL+t0bNLu19B3II3SRRbwdzOMIstMSadQWlREECfi/JMJGbERUtHkfnmV+yJn0a4V5D5LoINJgLtk8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6660.namprd02.prod.outlook.com (2603:10b6:a03:212::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 22:35:07 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Tue, 22 Jun 2021
 22:35:07 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
Thread-Topic: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
Thread-Index: AQHXZO7Goa2DPYI2nUGjRUNAahm7rasgoj7w
Date: Tue, 22 Jun 2021 22:35:07 +0000
Message-ID: <BYAPR02MB48862208D45DB5E24BFF9483DE099@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-11-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-11-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15e897f4-88b2-45db-a33f-08d935cdfcdf
x-ms-traffictypediagnostic: BY5PR02MB6660:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6660B4FDB61DFE99503650A6DE099@BY5PR02MB6660.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:81;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u72etXkc+vFd7sB2lHG+hJVybFh6gi+wQr3KZUTzuO/BAuvyFZsk6g37Nyr5N/kEcVlu1VZ+0Kb+zOxhs0Vnl2WgWAhR7WMDn9Nzylo7cSb0hKGjj5qWP56XnAlj5uvUQGRmtW2AZRVujjseR8LeivuX4o9xuhgpAApLnmtPoXUioVHuetfm6RgMhHEHHkLO2/C2ZANyJqANzBdRSla3beGyj/rFvD42PSZYg2tOKTTCosp7bDsKOWPnARvSEAHCBJwnFcRz7q6ENB/4jkilvDagWli7SWClDHFqT3z0ZG7ZzXPnA4psaM+fzxmvRXpnlJXMri4b39pMWXL8eubQwpk5Jt+pUyiBPpNSdm6cxeXxz/rp0J+KAQM9gxbplfba4PHOW8+BmR2MRaFoLdDndgbZn6Rd0N8H1Lc1fbvBzL0atV6/WYjTsbCsOrnVmqN7W3GvLfuRdBNXCSYPVZCvpwCRFjHW1XPbpQHak1p6m9I/e4B5sZhWizdaSbAx1McscwZKCsvtQJUsZ7evv4u35OSkPM7CIiy60CMoqBEwLcIwsBkRkDpe5XEJ2lV44mPD0lXdurbMojUAI9CDVhO5JR3Q964qIAjnskAHQDoQy+s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(66946007)(66476007)(66556008)(64756008)(66446008)(8676002)(316002)(110136005)(54906003)(76116006)(8936002)(5660300002)(86362001)(71200400001)(2906002)(52536014)(55016002)(33656002)(9686003)(26005)(83380400001)(53546011)(6506007)(186003)(7696005)(38100700002)(478600001)(4326008)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a3+QhCkkXbiYHfejt6k9PUKq+aFg0mHFt+Jhdi4qtrKVozoM8y4xxY5bDxQb?=
 =?us-ascii?Q?KCeUZgIGsnM9+LpSXOp2TMmSE8qmccJePvuK+0G4dSyffkzrSL1E2WMu3g2j?=
 =?us-ascii?Q?yDnMzYgUIv/J3iP1wkYNO01nkPRraK6uD3RAlN0weauXEKOCJGMVPgjVN223?=
 =?us-ascii?Q?FhW04bt1snhHFkvSwOBVGNKWmZHdj+k8U8V5xiXHaXkjhcz3afN+ZuSCcqbt?=
 =?us-ascii?Q?AnnOv7kBxda8S6sHY/JGeA1rfkILR1lMGelZVIvD7P6WpbHzI6dalX1Crh+E?=
 =?us-ascii?Q?vpHrpQH4etazwd/R8w8H4tbTGtosq/CL87pvtMvaDUGqZTPSTiTcZnJ4rqRD?=
 =?us-ascii?Q?1dKcV0DRJk59JHK6GTNEZIQDbg42q/RN34URovEpSN+bdN95C05WDinMn4Th?=
 =?us-ascii?Q?So6sxtRTUU1XLeIZZgiBM0EipxmeNuQtMzG14mERL7JcF8vRPuX26E3GImKq?=
 =?us-ascii?Q?mUT8zIAvip+9sRSDu6qv5KmFb8An773jsbb6q83Fi7XtcAg+aVTXzw1iBORm?=
 =?us-ascii?Q?9XZZc8RhY5PxhAhQfWvWmam5U+OJej9wSI7PpxRE/nM2K2A2zX9gWiRhUjE4?=
 =?us-ascii?Q?xTrx1sYkYT0KfuOOy1JM0BmclL4+X0CyHGB/58UHD0IrczltMeuOinH87fGV?=
 =?us-ascii?Q?+y3pLmBjIJTAVj/SkGbjmJFgVedWwR07vpss6bn/LrdMlXrz/WTld10fvOic?=
 =?us-ascii?Q?o3e6DLKkvi04A1v/wi0SGLjP7Tuf7oGpHXj62z3tZIU5PnAPnW27zBTJetLc?=
 =?us-ascii?Q?NyoPHWNWbDi/WQx+rjR+xJ8ezyJY79zk2GE1w9CRIMfCZ+rkKjO3+SacMKb4?=
 =?us-ascii?Q?fGfxKhOLDvBG9mbY5NcaUuAliDK7f2DVDu4N/n6GQVNGfwdF2+xPtHJfG+/Y?=
 =?us-ascii?Q?6JWa7vYmGhKJAUfmyiji7pmUybku8+/+HlOQ2DVBJ/u6jaYkIOltRhbcr5WW?=
 =?us-ascii?Q?KbxWqFf2HlG3XQraDVZY8kPXxU/H4kjh1uhq4qbtn8+ATFYB+vKEY59yQ+vf?=
 =?us-ascii?Q?fK/F9RPyOIVgkF3SMNbs744d1qDc1HNpTauQzE/E/ldSr/1okwuTqyRik5Yj?=
 =?us-ascii?Q?qeF6YOtR38Nkc9uVm9Z45a939CR4BPn+F/LzVWWNtizlHfvfVWV3kjBkwVBZ?=
 =?us-ascii?Q?aAN0feKOJFOoVkglmOujU8LyjO8sUPfLifSOe+/fFiPsoKWpX3cwiTOpRSDb?=
 =?us-ascii?Q?WxZlXR9/M7tYaPUEfEBGpFLbZxMZ3W3TFVae/x6Wrp0Qd5A+SykwvJCQm1ZS?=
 =?us-ascii?Q?kwSJJ7flGIHPfTmCkWQvRQlO41XUqULG9gTo6aRI7dVfLs4gVKtUemFBCpRD?=
 =?us-ascii?Q?5dLzFO5RiSnpSSmrTQjVZPZS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e897f4-88b2-45db-a33f-08d935cdfcdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 22:35:07.5289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLwAg4c1CLM+DNB/e+iRvvXI9JOPNcIPywuyf0Zu6NURE4X+0Bb4RyyjASBFsg3xork2UEuGGhFofqxzGQ09IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6660
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
> Subject: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> ---
> diff --git a/target/hexagon/idef-parser/parser-helpers.h
> b/target/hexagon/idef-parser/parser-helpers.h
> new file mode 100644
> index 0000000000..fec3ad7819
> --- /dev/null
> +++ b/target/hexagon/idef-parser/parser-helpers.h
> @@ -0,0 +1,347 @@
> +
> +#define OUT_IMPL(c, locp, x)                    \
> +    QEMU_GENERIC(typeof(*x),                \
> +        (char,      str_print),             \
> +        (uint64_t,  uint64_print),          \
> +        (int,       int_print),             \
> +        (unsigned,  uint_print),            \
> +        (HexValue,  rvalue_out),            \
> +        out_assert                          \
> +    )(c, locp, x);                          \
> +

QEMU_GENERIC has been removed

commit de51d8cbf0f9a9745ac02fb07e02063b7dfe35b9
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Mon Jun 14 16:31:42 2021 -0700

    qemu/compiler: Remove QEMU_GENERIC
   =20
    All previous users now use C11 _Generic.
   =20
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
    Reviewed-by: Alex Benn<C3><A9>e <alex.bennee@linaro.org>
    Message-Id: <20210614233143.1221879-8-richard.henderson@linaro.org>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

You can now write this as

#define OUT_IMPL(c, locp, x)              \
    _Generic(*x,                          \
        char:      str_print,             \
        uint64_t:  uint64_print,          \
        int:       int_print,             \
        unsigned:  uint_print,            \
        HexValue:  rvalue_out,            \
        default: out_assert               \
    )(c, locp, x);


Thanks,
Taylor



