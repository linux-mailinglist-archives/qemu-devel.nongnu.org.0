Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF17747B5FD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 23:52:26 +0100 (CET)
Received: from localhost ([::1]:34548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzRW5-0007xl-85
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 17:52:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mzRUG-0005tz-QO
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:50:32 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:58599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mzRUE-00069T-PF
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640040630; x=1640645430;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ccZ0fV+oG8N++p/5UqW7Q/rU5ldjpW8WF0Tm6hhIim8=;
 b=gtDCS2V8M7TsFdmVrDGcZcU6lPNBi5tJ7NWFRM0p5Kdi2ihagopi1wxv
 XPxZIxTzHoTQMlZ4BRp5W1zBMhT8NepIgJMY3B6VfqGy3KOXrGO7w15UY
 b8d3PgHUu5GQ//viQ3XPOTabRFP+AIxxPkWvwbcQQr7vShRxMaIM2I9+6 I=;
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 22:50:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/lPtRoeMUigvErZ2aWtTfC+Vpml4YXJ+zOLS9YTFBtJ1cRt2D2FjHw/5TwgFIXqPUnDaXJ8Al+jZC3/scyGyFLwWfX53TU83m6HoJCjRPeM1CDwvAnlTb2CU+QTmEpKR8DrO1bI/rBOLvA8F0qWHu7aLB9YwdgS1shGIxUzaa+si+b8afuxanvQaOm4XKrtgMt1dvzBM0lDVp2ZQuSB5sSMJu+3RFn8oaIpoJacM2/3YaQYM7pIc2I7Cs+YsZXaMSkRETna8sSqio/W4FUMhX7DlpT+KMnJozXlJFyqltcExnKNDmwT/79nIyG5HvwikN+MdoIF6Zfk1iF929iU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccZ0fV+oG8N++p/5UqW7Q/rU5ldjpW8WF0Tm6hhIim8=;
 b=dmdWSPqDqNk0vCsrPqj4uKIE4pwn60VOmSPaIjIMaJeabBaiZ0ylvB2OdSy5MUi3Ai6JxV1nrscpkrdOcEgSlgjJrvMxsMb0UTKgirCoKIM8w8X6+L54pbitH+8pus91JwC/Shpg6MILgaULWpzoX3MA/99d8tTcekQ3dztNZtqJ/ZifnFmpa0EnNG1C69cU3faFpjGBndV6V8O8xgEDGinDckIqinyDo8B7PX7oW8YgM6ePtpX5xy3fmCLVqPNm0VTLFcuITyTGfwE/Wbict1uOsoHL/NYvbudwznEGw7v1zE/a8BGCGjrvSkQitqYeOkWRtCQldCbU0HifUHcXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4974.namprd02.prod.outlook.com
 (2603:10b6:805:91::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 22:50:19 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 22:50:19 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 01/13] target/hexagon: update MAINTAINERS for
 idef-parser
Thread-Topic: [PATCH v7 01/13] target/hexagon: update MAINTAINERS for
 idef-parser
Thread-Index: AQHX8yS7u+a/s7DOSk2L/DZZikxpJ6w8ANcg
Date: Mon, 20 Dec 2021 22:50:19 +0000
Message-ID: <SN4PR0201MB880803E912C50DD188AC82FCDE7B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-2-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-2-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c59b4cc2-c8ef-4f94-cc57-08d9c40b18f9
x-ms-traffictypediagnostic: SN6PR02MB4974:EE_
x-microsoft-antispam-prvs: <SN6PR02MB497434A5C59FFBB4B1369EB9DE7B9@SN6PR02MB4974.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:386;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y6Srxe9OZ2SIO+Pj3Hjmq8uPDXjPJV1Wgf/NHgrV/UGTifcLeL/mD1m8HzKaCIlV9imY/dyE1F5JAswa5lRFovjdr2amDYJMM2P1HZqO1wYOynS5twxIu0F3EHQnFqmgrDGXYUCjuO/ZnFA6moUYrpA3+cM5bK5ZMt0Tfz3ADAFSJf2PSBv/GFgxDfHl7ISXPjpkv4KQuI6C7xvmNdIKkioUXO334GOHS8ZsgWp4rlhgbvoLTiipSgMVUuL51gKOYo2AoJyvlzP1XuKC2ORAaqf6rDyg7gszcyBqc/mW3x5Z8TqmhU1goSV3isD1EEZihkH1Sr6Y3aidhrIPG0xRRva+BMBJSnrF1FHbbKQ986bA+dazt3Jonkx8Vq5afi/WDICynWLseenqLhYckqJx0dvj9/MBoEvjvYv5jFWwEGREfzn9bFxcBnZQpe68g1asOdM+lhJ7rqVS1iRHnOToRF7ZZ9y5MEhtwcbMyiAfFAmdersxe9Cdfr+hHZfOJxXUKb35SDMcjnTHOUXOThzVjrXzR9d5X1xdMEHGw1AOyE6pZApzvldjipIc8DJHNGC+dUAX3yM/2SVLWAk4yyjmgYuKx7z98pfJJvse7iN0MpD3/ejviOqQeIb1epZwabRpjZMQEbroEl68hvAZAHtsEuogPRLKXTY/Ydw0U0Ik/bH0Uohj2s2ivIaV0N+uGi1BAH5MTwGyoAivieEVRqGbkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(83380400001)(76116006)(4326008)(66556008)(64756008)(9686003)(7696005)(66476007)(66946007)(55016003)(8936002)(66446008)(53546011)(6506007)(508600001)(71200400001)(26005)(54906003)(8676002)(15650500001)(38100700002)(110136005)(122000001)(316002)(2906002)(33656002)(38070700005)(52536014)(86362001)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IoFP8tWFd6h2HbxleqBlKyyuhC1X0REMRuJbnaRCrQ7+3NYXiUYFqE9DZRTl?=
 =?us-ascii?Q?kYqSG4UFRVkXRzQB8b7C4XFMvnoesvX6Y1ayKXP6d4kpkOIBemtlIDFb8A5u?=
 =?us-ascii?Q?42kPcc/iLO1W7N/oKRTT+rKj0VXM/jThHXaSy2+/4ccMTqwzaCWUt/H3q9gZ?=
 =?us-ascii?Q?zeKoRf0ApsqdB89FM7q0aAc+6Vnu02/PQyOOhBB9UFVmR8ZkxDIk14wXNg4g?=
 =?us-ascii?Q?65ot46tdkdlbmK3YF6R2WHH5t8bh6Rl3RpNKAIgV17zf52ftP/R0GC9iVUSw?=
 =?us-ascii?Q?Ek0+FdOsvzLE6dZXBfi+UwJnCjSGIVN2b9QvwpEDMGrSZwQlMu9Nas1ORj3u?=
 =?us-ascii?Q?PKo4BI6jaRoT8jWZvCro5bH+BAXXykKoJ+XHnHQFWlI4zbxdlgTbt4RWE10k?=
 =?us-ascii?Q?SiQjTxgqzSTatMmzWZw+QTlvsmriN5MIQsZW0byeM+6gxtMYQGmzSqhatHlQ?=
 =?us-ascii?Q?dMwLS3HdT8CeULD21qMpVs9e65tgkPlH55/UlZVdQno9UpC7Xn6P1G5dCR/P?=
 =?us-ascii?Q?f6N2Vn8hOA80VmycXEIOksP4Gl0EwgUETZhzZ7K97Clx2ugXOOb0cfmmO86J?=
 =?us-ascii?Q?fAP4WsQgklmmFbY5qbJv172rB7nUDnnIk8RAHWC8dKAEjvLv3BS3kT/UkQcM?=
 =?us-ascii?Q?EDbDnsz9rDHGcTNK+eWbnnZbxAE11o58syJZfx5DGekaiYFOcB3GmIfY/RCi?=
 =?us-ascii?Q?9uIHxOAAMfB7cCxxmomQMCQj22gi8h91JP1AwCHUKlIhGAyaRrabx/Br4QPu?=
 =?us-ascii?Q?BhjxDS9LhXEtRtCWy8izhE9roga+9r8Ux+LJVqgxLB0S3gOQmOR6lG0GCvf4?=
 =?us-ascii?Q?7yFznaISRoeie0MUMQxr4lcSiCLRwVLZpUADOBcxgQRfzo+HMpRLMu/Q1W6X?=
 =?us-ascii?Q?3rvTvbbxO1zralTuS/04pOycXGjRDSZDgSNKR3L+5Wh9DIkCLhYPIEBdjSwO?=
 =?us-ascii?Q?zsQKqLcV06/jJtdATbL+9dD4WXbPyxJDIxGeCcjy3g+hk97YZYuIdhtTTeep?=
 =?us-ascii?Q?8irumq4ai3pAeRRLJw4XqKogcAW6L6cbL89zjinTWIaSIBfAirn1+vC26RZv?=
 =?us-ascii?Q?JgqmWAghGUY4YzqVE4aVOTGAtfIlHjQDy9VBeiKt+vIfwGSeG44v+tB7C37s?=
 =?us-ascii?Q?9Yw6nlwKJV4dDKtyGHH9bTMFkHkxe35XLUboKgcPTt/LO59glSP2MTxOFTKn?=
 =?us-ascii?Q?Ye3kwVf7NlT5wm+NyxZ7xl6IcxTBa2R+aMWP6smdg5AznbQ6315vZZLtaHGI?=
 =?us-ascii?Q?7+UToZse+Sxx95Wt/cWmPHqp7asB1if8rq37a1iT636Ew3IVi+dKY+PHl01S?=
 =?us-ascii?Q?ArohyWBv8CydmUVCJX/5hJRNQXE3bTDG+5ppzBvIvvjOAEEL1nmusl9fN/WX?=
 =?us-ascii?Q?nbXBatjkeDBpmnJeCciOkk2nMngiOBYEUFivn0n1L/sc0fHgurqdDCm9wYnm?=
 =?us-ascii?Q?uCabwChBKqTPP7lHQtsl9+tosIruY31kwB9cTItaMb3Po5u0yB4vvleLRvhA?=
 =?us-ascii?Q?64hcPmum24IEoebNhl5EX9/rFpUVmkUVhssnFhx+GfFeDJBH1yNwGc3obpEI?=
 =?us-ascii?Q?/LutL6ZDbu+OdDBMRBLmBsu6m/YlK+JLLz6KMbcGqwUImCwLjygvEvNG/mzx?=
 =?us-ascii?Q?/9Q+sGSv3YsIf6M2FrL54mk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59b4cc2-c8ef-4f94-cc57-08d9c40b18f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 22:50:19.1238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hY/HVZlby48wvlXnSIgwIBEwyqC4RX4QOVlYFU2OE9fcCFrcF22zgLqoU600Of4SrzcwqMnGyEdyNCC8+W6qKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4974
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
> Subject: [PATCH v7 01/13] target/hexagon: update MAINTAINERS for idef-
> parser
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  MAINTAINERS | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7543eb4d59..f6fbc5f664 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS


> @@ -2788,7 +2797,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
>  R: Bandan Das <bsd@redhat.com>
>  R: Stefan Hajnoczi <stefanha@redhat.com>
>  R: Thomas Huth <thuth@redhat.com>
> -R: Darren Kenny <darren.kenny@oracle.com>
> +R: Darren Kenny <darren.kenny@oracle.com>

This change looks spurious.  Otherwise
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

