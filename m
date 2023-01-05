Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B618965F0E7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:13:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSr8-0007qm-Ht; Thu, 05 Jan 2023 11:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pDSr6-0007qP-1N
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:12:36 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pDSr4-0005cU-8G
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:12:35 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305DdSJA018659
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 16:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=5PGwr4FzZc0iROEPGjRRW9J/tZYANYhXmnvw7J9rXyA=;
 b=F9xioB48AKqgVCST/tbsYSmbH2IFlS5Xjtq1/FRR5IgMOWrashp+ml8OIo1hVTBzpPcz
 Ej67ezDJ15qlbVcW1ZFIeDXXd3j4uW3TQ1+mie/aSK0hmFM7GGmoC1C63Wn1KIcI9DJJ
 j7g+MHCeQH6bJrZGbATR4MUVVPkE06467sH78MVMihgIWXnLi5EqFu4o6sV5e4nl/e7v
 R9/UHrfpcrIuvvYqL+ySobElV1LpvNRm1/Tz0bJ648gw+2Cm1vlWhaIG1Bm2qKRPGjhk
 lvDpPatFTSaQZjYH8evakxEh4jQ7EmghX2aCATWZ4AK2QTOIJ5g0HsjtumoT8wNMzd1R 5A== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwj1rssdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 16:12:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR0nUfBs6AAmfFX6abX8XMlqwnkHEWnjxnSF181ehDu9VvJ9CVQuXzg9DjXcZ6jxMshTpQXebaktBW7EPCJWUzA+6HV2nvYZXpOY+xiEz1eT/dg9DV1D4O0AmtDRgZn2bkIVt4LEk6MxwiplMnu3cVxSkTfsP/NUL2RnNz7JgP/hMACrkvpTpVbRBYL0a0Vwyr3I6TKHtDB6OBqTO4RdaQO8vhdwxlmZyB8bV31PXJKtg2OF3nPlQrpI1Jkdq+4meGBwIyKdEYSvJXo6jKd/1991qfn8jChlm0nFu0e9l+ITKxeUGc/X5ThyZ8NL0NntmijUoe4F65Ubq6ryGHB6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PGwr4FzZc0iROEPGjRRW9J/tZYANYhXmnvw7J9rXyA=;
 b=TOQoq3C6HRFCIRDtvA5iQA08y4LqZj+53NK2bxAcoEtALsIxtQqQ6N143mxJVKbDng2ktETTiUr6D5eiyGSqs2pX584d6r29bqUm73oFhXIOjP4g0YXoD+o+M+zK6iXaZvceWokoy70nFHIJWyLoKj5nZP6aKLK08QLn7pu3XD0H/V+nCavwyK7qCbgDfPNPq2yPWOfOvr7PFZH4MuQD9VwyvJlB8oPBNDQKFAOWQgw3MkbEL1fWCEA9IyJYMZIk0umiF3WNK0WNztjksjbJBoMTHXsTASBURoonD5AIkBCfMC4Q0r/VR/f+imrFHiXtYFMiPfqhi0NrslTCVbUcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by PH0PR02MB8503.namprd02.prod.outlook.com
 (2603:10b6:510:104::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:12:28 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%8]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:12:28 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH v3] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Topic: [PATCH v3] Hexagon (target/hexagon) implement mutability mask
 for GPRs
Thread-Index: AQHZIO//FCsx1fD3a0imZi+/GzFBHK6P/D1w
Date: Thu, 5 Jan 2023 16:12:28 +0000
Message-ID: <SN4PR0201MB88086A0B92A1D3E853EF198FDEFA9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230105102349.2181856-1-quic_mliebel@quicinc.com>
In-Reply-To: <20230105102349.2181856-1-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|PH0PR02MB8503:EE_
x-ms-office365-filtering-correlation-id: 5eaacb2c-4fcd-4123-783a-08daef37a41f
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eNxHkjeq6Gu5b5POhUIpYswb6q7EH+eEq6v8oVrDuPV7delihkLlAFYF2vFdXsMP11EW0NiewEL5DtPfKM41Qwc90BAEN7DsoEL9VhjGIOFps1NNnRy7T2+Kw7ilLvTVjNL0dTHrBm5990/7pMgR3jI5K7cjbjTzOWG9cuQu4anIsWRV3HN2MORbP6ySbuaDwDEe+lOtFJF2UT9CxLfBuRkqHNeA18uDLQXBfg71E6XaHZ4AaKH9HgnHvwopc6gOdXJZKdSqEtB/o/geSPz4Ksg/aMX76O6o2v99d4FLUXN736PNGkMZmsKDZge199knxKGPiq1l0IR67HY5BPty17ex+cZxtb+uqu71wFoU/NqKx+Kc3nJZcL674TQcQZE6XoXwWBgiA6m40MjFtUtkUkf8e4raomk/OcVZeGb22wg5BiPck8bcz+vYFSD4XowANI0DEPvxfoGC3AV5q9AblVy2PjpYta9tZJRvV1HmmfiJ1tOqfExVcKijXvBCTYn8bRFqKdfKbsFadzinwopNyvDam8K/6yApxCp7tlqyEeMjMArmwZaY3z7weL+HDDQFTVR7NPO7w7UWuztvn1tu5Asija6fSMdgvpuO2kYRtlQqbp8Eb3+9j07F0jI6B+WN27VLBXHrtr/lCo/c0LAhNHt24vYLtLGfPtVlhxMz+RrxF//jd3+BWNdyXM4vZl1vcN1LhNfIN3rWMzV+qv2aGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(55016003)(83380400001)(7696005)(186003)(107886003)(26005)(6506007)(9686003)(33656002)(38070700005)(86362001)(122000001)(53546011)(38100700002)(8676002)(4326008)(8936002)(52536014)(41300700001)(4744005)(5660300002)(2906002)(71200400001)(478600001)(66946007)(316002)(76116006)(66476007)(66556008)(66446008)(64756008)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uKAZawzdlItxR6gzqGxKJIQepbxP60zC8f6U2Hb8rDa3NsQwEUhIRcoI40q2?=
 =?us-ascii?Q?miMdF0Xa35fghNUctOgsmJkPw6NSHYSRzmi7/hc9l5iu/WfJRDXlJsN3jihW?=
 =?us-ascii?Q?TcW7NEW51q4QzooSshH5D43WtW+etmdCxXJklphc35XLx6MACT10wC9AyeiL?=
 =?us-ascii?Q?244KwgJA/s8RjXOM5rVxGcFJ4Y0FMfP/WGIc2eLX3mwgGyaB0KD25tzODRJF?=
 =?us-ascii?Q?b2ugXLpcvVi/5D4HCZeHYGRceGCEo51GEgFGHDNvYt5tnm+OdliNHxcHi2te?=
 =?us-ascii?Q?2K9+iW6Lp8aMvYB8EChdKPzy8ADLu+GMhUNcKkEEbQnQTmy6ecDEKBF3QpnU?=
 =?us-ascii?Q?RtbDqiKWCk5C4AGnsnfCyicgmawJDMMxP6+OLkba4Ed5eSLSfqFyL7sumpOE?=
 =?us-ascii?Q?9ftKyDqFfKH1TrDoC+H8+P5QxJRqTYOfvV6/hvbWA7nFBMJHIcWz32p0IZOW?=
 =?us-ascii?Q?PmEeyT7QbZC/2v3kzSFE17oK47z2QdnEOeKOO/y+qbqSpS9xDzoPRwo9Swq/?=
 =?us-ascii?Q?sXjTaayoE0uOjpc/Wvn3y3I8nOHshJdQk446kRs7Fw2mwdlkBK53dTs21ruZ?=
 =?us-ascii?Q?dESujLTpdrw1VeWpJhc/g7V+dXf+cIyAvvRyCzPfBc2cNVYeZhapvNWoc2ZH?=
 =?us-ascii?Q?uWHLImROnQmSwcv1IKQIPDF7lqjr0Gj3BtLeVJyMyZNiIEPm1pzkCiI7mRgP?=
 =?us-ascii?Q?pr5FsCnRqDSPABg9R74bNBb0nSy+GuNnTuokRbYMd+JX0FPpygtvAiZ51t2N?=
 =?us-ascii?Q?gqtKJ+9fCxMY7O/hOgkEsUn5+2LWT4zOTe/Sfc+iuLr42kreY849O9AAZNzu?=
 =?us-ascii?Q?E81jvRfwEE23kyFe5GFKBjNX6lb0NMdS/fA//8NM7SxJAzhrE4g/Zxg9iYg9?=
 =?us-ascii?Q?izOOKJ0706MJOObP7qVuK6EWx8kDglm0QjhOUGeAZks46re/h51oOkyPb498?=
 =?us-ascii?Q?Uad9ddSmGpIO6Z2uh+9KiK4clSTQgfPta9fpB+ZzDVJ2Abxu7yGBHW3LGSwH?=
 =?us-ascii?Q?XYnoS5wdxf3xdslG6TChlYzt35VxhOPLpB5cvJoZZk4I+3Y2+yBcH9iHNlpz?=
 =?us-ascii?Q?gCVihA0sHVhto5AxwnkXx0ihsJJplrp4auUoZlqIqDdX3rrTGmutNT+s8zPe?=
 =?us-ascii?Q?nRi1mSaCFBsf/ZfG0ZUJLi7lMcQ8Y9cYc/GLT+MFTbbqmSjNFlwo2adVUCkd?=
 =?us-ascii?Q?smk2iOAkj4YiFQt3Rnt6Wuzft15G8EcDeDRkLbK3rUB/DNYvmaKLH38rJQpb?=
 =?us-ascii?Q?g1T3J8Si8gr58Q2dv/Z4oBn6xwG9zNBznJIT22S0noktAVOT3IhFRdco3aAD?=
 =?us-ascii?Q?KI9MJfJOSmLBeuYcj7BnEkkuzi4x2INfSjGDFvCziYBq3hKUa8Z2rQBCVKO8?=
 =?us-ascii?Q?EWSizyaLn7V6LMYdkNB3TKIzsIuStrUatha3y54R6y6GcjjXeGsShmgGEZMi?=
 =?us-ascii?Q?zfU77734iafbdHOs9DLylbRKC4y74TLYmiSaSieEWXHQS+QbDRoBiysqddkC?=
 =?us-ascii?Q?uzZJBLPIA1hjp31NLj1L3fg1SZXTIwfxBu+rz14Rx7rDzmBCXYQ0CB2foTXZ?=
 =?us-ascii?Q?2Tb/lV5EQu3FpLyjs3MJu9LxGYLrJOgCbNnzX+fn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: p1YN2ctqZoxSyrpYBmPhLR7S+cvZw8Jcyk3OEBcRpZkUaTawVA92TImgjAolSc8cicz5bCoKs3TqrOvm3g3dZR0fx5ulGsMB1Lfh3o4b2oc3PqmUaIPsmSVOumMeKkEUGn4MESwkYwmBNByoUVLJy28t39RGAa4+urJJRSZYmhBhXmBKVnLTJRb6BzNIp+/EO0HUVHPygjNfDMIA9BzqJUPIgVW0Boket11QI1WW3rCfxSbuetGAjs7PtE+Po6gR9b6Al5iUpkpynlqnjVxF9dSTxceaQQy1vzXrOjM1tqHCDHMFmdKxLQs5VqN3g/mXhqKoGIOFROkNFZBDJLGEcrxgm7EsygfzJdE6WF20BFRROh2zxeTAva/zMPRGFNBLci3TyH0JsLQpr4o92QjNMuXM6d162YJEaKcmm9KzqO1tjDt+WZZEYL/xR0UPiOd9vn11g5Q1KZ7Prow4cSEX33qXRHRsQ369piHDRUzq48j3POmGSqONqNKukYEugQpOotFNGRfrq6jvxq+GAETksso5XWaLKC6X+jT1h8eemDy3mQ/cLY0nleyJLVKpVcFQvMTn8e0eIYWIgxKXJ61n7XUrxd3VdV2JThx2WZ7L7RRxf9bL6hAjsquJRtwBlXwrk6JOyMkO42Dq8OSREYEJ2DfW6/7i+dSJe+O9HQVuIicI9iko1+PBY8lRSXKo6TK5j/cktbYyYam1shc+2SD5svEaknh9U0Sso7GjEiaax9+JhAOR+c1ezd3aeBGALk9c2H9YCtEWmf+8u4RpxGIaGA==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaacb2c-4fcd-4123-783a-08daef37a41f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 16:12:28.1955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3XzOBiEr6xK+kZR9nFPX5F/wtS/WUbobhfzd1V+fNv0oo6HxSNrIBz/UnvGH7ydwA3/4aoWWcNGJApmV3P4bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8503
X-Proofpoint-ORIG-GUID: TDdw_OGF7MvYyRxZs3BmYf8CtvDqXlGa
X-Proofpoint-GUID: TDdw_OGF7MvYyRxZs3BmYf8CtvDqXlGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_07,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=415 malwarescore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301050127
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> Sent: Thursday, January 5, 2023 4:24 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> Subject: [PATCH v3] Hexagon (target/hexagon) implement mutability mask
> for GPRs
>=20
> Some registers are defined to have immutable bits, this commit will
> implement that behavior.
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  target/hexagon/genptr.c           |  44 ++++++++-
>  tests/tcg/hexagon/Makefile.target |   1 +
>  tests/tcg/hexagon/reg_mut.c       | 152
> ++++++++++++++++++++++++++++++
>  3 files changed, 195 insertions(+), 2 deletions(-)  create mode 100644
> tests/tcg/hexagon/reg_mut.c

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

