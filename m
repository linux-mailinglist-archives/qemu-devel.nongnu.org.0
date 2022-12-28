Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2D365854F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 18:37:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAaMt-0006wk-Mi; Wed, 28 Dec 2022 12:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAaMX-0006nP-G3
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 12:37:13 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAaMV-0000GM-0D
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 12:37:08 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSGrDUE030166
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 17:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=SsKE65c2We+MsZY4HIXYqi1DGOBCu8Vx3GApb5+Efk8=;
 b=hNrESR+kJkZThPHe5dP/gi9MIDNJM1iFS1Krt3JYMYYbGxARc+lLx801zfGIgIxKz7px
 iP4JziH8mDLVK6ErGmAtBc1fqUGoM8+UFddtkUB16i+SK79uPmKaFoUKEWJxRrTWroPp
 zZGSF4qVJFZCljVzWoJMiinZZFWlkMaKYAMhuJitvfpMLIQN29wUZJEnWfa1rAUvZZtz
 zs9ooZoo8grQYT1ZfvXVm5+hekRqes7/Bh3h8qHVLVUZXSun5kDzUxD1xOYj9UpvZpqQ
 rBtUax/NF8O2VUdsYxNyl1bflUNDByhxcoR7v2jyZsFDc4Nsx2R8v1vDFVyhaRKDPlrc zA== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mr1r1jjx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 17:37:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyoqZNBwrn2/QNLaWBMrT+c12OvUN1UvYRdgdN3Vm8N/yPEAk3eYa/Uuhr7TV8MaSnXimcsoP02loh0ytl8RJF8UPewwzAZ+h8mv+0MpJtYLvMCCWFcSSROUaHbwctEdXoXW5vTq39ZrTUFtbBUIt0J/GowMZmY5C905ARvrxC9MaDr3hRjmnugodaOt8KUJZhmtERyx8EFFmOG3R7bSpvMHVYjrrXC2CeQHrQFKPba7K4izvajwFLsquYXhdg18XFX2itCRtsfPM2sAaeR8Cp5wB8mzlC/zEbCIsNZNJih62ebnAsDMu3DY4F2mAFriRunCtEF1WLEgwesxtcV9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsKE65c2We+MsZY4HIXYqi1DGOBCu8Vx3GApb5+Efk8=;
 b=ofGvp0GPgMP+BtV1RCvLPNLGe0LBTnvX6HsO6/6qhzFEduPqNvJBIwGWuP9QR3/bhu4A9jTNO19wd5uuHCxMritAO7ErHHOZ81hGpYQu6wCUKqvocQ+5TRHxUq9lRpFzRGklIeDOyHHYGPFr5BbVezmAgyOMSl5AvCFHzQbR3aVQW6x9RHbreaWGELIowb8DTIQKF7GEGXCUGLXzetUa+B4YH5lcUYBSc09joILh1Lo/vLxRFJDDAzznyVdFQ5tr4Ud0yXcpyCUdCdCf8sGzBrBW3rjFz7IyEL8qtgjO5y0YaAckhOljU38P/xLzSBve3EF0Q/Y4E2onikrL1HFS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6653.namprd02.prod.outlook.com
 (2603:10b6:208:1dd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 17:37:00 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 17:36:59 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] tests/tcg/hexagon: fix underspecifed asm constraints
Thread-Topic: [PATCH] tests/tcg/hexagon: fix underspecifed asm constraints
Thread-Index: AQHZGtJEGKTYfafHxEOfIkKEQyzn9K6Djyzg
Date: Wed, 28 Dec 2022 17:36:59 +0000
Message-ID: <SN4PR0201MB8808DFF40FC2E821380E0F6CDEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221228153657.10210-1-quic_mthiyaga@quicinc.com>
In-Reply-To: <20221228153657.10210-1-quic_mthiyaga@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB6653:EE_
x-ms-office365-filtering-correlation-id: da1ec3c2-08c4-4bac-d19f-08dae8fa1fc3
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p6EwH7UjcJV9c9z+ce3efxa/GVMfQvRBDdyEWN1LMlCEy+tQwtCUgte61MRbwpc+oykr4jEj0BdFqfZVuPtAnAd5y7VsU0wAQ580XQaCGycZCL1Hnubcwxze9vdTrDDT2SDL00YqnSEm3BdWKkVd6g9KGbaUR7AK0kwsV0kcydaMy5nIphJo098Zd8xVdPLe7dCaOQgJHTorIdqiRiAhM6RRt83h3LGNyZVAo0Wy7YrUjY4K2zuOQ2LNKOB3q3YzMXnC5acdb3te46IM3L6APQNRVM4epwOD8sv4t1AfdbebUN8NUOG5u12bk+abnZgoQyW8XnnW3obqAz/PRJ2LtCK4q7BL78O3qBTupMhW0v2hOiZ+bQ4mBfiDOI1kxJ5QVay7YwSPR03pUK/FkdPdWsNlf4kZShRH2KW+NLal/1wPQSXH7AguVuH6TY6YkwiXoIEpiKSTWTJHDGRC/ModOUx7sxBdWdv4lCWaiwtZ1sDM/fGJ6iXZ0KCNcHglm+GME/3fp4XggBRSNl72X2SWyNFTjCGSSjO/G4L1/pi9crklq7WA11pKH2xaG7p6iWKl0l7iijUd6uFwe2wD6VEJrMxDNC0coz89P2l/UHSbtUI3u9TYyGM55g22c3lnDq/rCAj0qHphDh331FG+61lcI6ogmPsdPK6VvftQ8r7qr1Pjn8q97Lxa5sWfhSVKYRpUV8FQki7MhC2vZeBJjAmDMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(478600001)(107886003)(33656002)(4326008)(2906002)(54906003)(316002)(71200400001)(110136005)(53546011)(83380400001)(38070700005)(38100700002)(122000001)(26005)(9686003)(186003)(6506007)(7696005)(55016003)(86362001)(52536014)(8676002)(8936002)(66476007)(66556008)(66446008)(76116006)(66946007)(5660300002)(41300700001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L7GGxjkKzPWRpQZ9s4vwWWBpZFBzW50kBC6q+jnp69qNCniSJ7nSpYrnBx5g?=
 =?us-ascii?Q?zw/P3RCPMBOX+ixMSiWw28d7/WsDjfVvmQtwvnW8swNgIwxWVif1M9pqSBXS?=
 =?us-ascii?Q?0lvZb6o8tFWMW5uKmhs+14ue0w2DMZHtF4Q9tk/f+RlTtGhY9AXrKbVl54Tl?=
 =?us-ascii?Q?Xh1uGF3/IPIRtLnj/ol1TgbnFQSb41Y9vMoYid9ymfhv2jOcnIQHOfSwxtvP?=
 =?us-ascii?Q?J29YI1taPl41IckbKNO+pvsZ5NAwZv/EhDI8WDKJ1bY/11PWb2H1pfT9L3jD?=
 =?us-ascii?Q?b8kZP4okSjYDCAh5Rt3XUpaTs65WLUrQ7OaZiQREyCfJhoI3D05sCOXMfII/?=
 =?us-ascii?Q?1QzyCKbrCDRUwxVIaECNKFNfKDhoOK8UOD7sFC9IAVJrJgz4TGlGnr02rIlY?=
 =?us-ascii?Q?n6DNStx7K7FyLZI7fACVAm9KmsnLv4rQrCs7CFmlBEjmHHBVI28RrEfM1EMj?=
 =?us-ascii?Q?NKkqhxLbNJVlO4ihwhr/fXBANEGhX9Y+9ILkRCpuxUSR9AxdzNEZejS6+tH9?=
 =?us-ascii?Q?MWo0qilVp4pJzBogrxksrEXHHd4yDqtSSkmpHmJxun1t7uXuJtVpYjgwqBga?=
 =?us-ascii?Q?1uTJBW4eBZ2ar2Dnsdu/88t200XKQ07EIElM0+3kmB/QUjseVe/QBHcJLAHm?=
 =?us-ascii?Q?RhV6mqnuFM8QMt0ivThUQ8bTmtXCAwrDDZZ550vPwYS2v4g5qhfrN0F0CQ3E?=
 =?us-ascii?Q?P6+tmdzTNpqgWi6CmsH0PIHDQCYmRRge/tF0wxN2vY4CvBNxs4xDySjUbiAs?=
 =?us-ascii?Q?Le/d7JiZnKAUcTWSbc0tfSmYfomCWc33a4IkTF0hnLoUyF1d/knl5Hrpysyi?=
 =?us-ascii?Q?7L4oofEGzFX5g5YHhgoHXLoU1fhz50bTopuQJYxCAUf/GaPosNa9rgwJ6snu?=
 =?us-ascii?Q?9Kmu6AkC0FII1xLi0wLL2y600fgROTy4M47dWMDejB8I9H2dwvyRF5dzq6wj?=
 =?us-ascii?Q?rt4gtQWc4E6RbBt0O+unITpqg+jC0cNL9P7rfpU6m+t9v/BBxuaDelLTVwnf?=
 =?us-ascii?Q?Zmp5VELKnIeg3ExVMZE1DhODN0if3zK24s+BUai3QHL+fXS5aZzxwwp3YaZi?=
 =?us-ascii?Q?LqeE2Yqqf+hXOCC5ajQnfiT8qV8QeuU1fdzmjLiCpQiEUe4jwS2vFqjwFTH4?=
 =?us-ascii?Q?STBy6OaqdI1HqD3aQOHt1zRWVKTENqgPJ3U3ZJ92OXKhLPoCPibgnOqtyDve?=
 =?us-ascii?Q?6zT7+j02xwYXr0oaDBvC0kWZuH+1/dgF/ErwhyWUZsZB4hekCOiotj00yvRq?=
 =?us-ascii?Q?jztyFKfVBXnxBwZEp5Cme3f85TqhzniHNaOM4hADzrDW9Q9NJt/WWcQgtvkr?=
 =?us-ascii?Q?XB9kDPh1hAG4Nm4Igf8KPURWutIP+kPms/HHNibCW28uCFABeezec4unJYCi?=
 =?us-ascii?Q?EHQo4q2KPhU3pmnNzfHKRvyp/iKtj3sS80hX4ZCF3HhwPqGvea/vTiBOoXQO?=
 =?us-ascii?Q?JJj26tIbQc/ymsuX8vR+nBGMn3YKkcGsI4ACRgtkBTHLc6/OdCpdaZ4k4Ze7?=
 =?us-ascii?Q?70es32jHKxWI1W8ZhmnwRcA4ak2unCkWU3jtdya/B6Y7abX8Blj6SB2agHzI?=
 =?us-ascii?Q?M853eYejSRmAV+/FUx7K6Mc4fad4LbImX14dT/9j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1ec3c2-08c4-4bac-d19f-08dae8fa1fc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 17:36:59.8585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfzQtuxFv2EkEtdQa37MYNdMKfLBqhE7WXe7cIuNXGBT6dMTCsGVbqhN72lMteLB2e8jK4YJmOK7ZbpB5uiYKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6653
X-Proofpoint-GUID: WS_atpgP0_z5yftLTGI9sVRBIvdOqxfJ
X-Proofpoint-ORIG-GUID: WS_atpgP0_z5yftLTGI9sVRBIvdOqxfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_13,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280152
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
> From: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>
> Sent: Wednesday, December 28, 2022 9:37 AM
> To: qemu-devel@nongnu.org; Taylor Simpson <tsimpson@quicinc.com>
> Cc: Brian Cain <bcain@quicinc.com>; Matheus Bernardino (QUIC)
> <quic_mathbern@quicinc.com>; Mukilan Thiyagarajan (QUIC)
> <quic_mthiyaga@quicinc.com>
> Subject: [PATCH] tests/tcg/hexagon: fix underspecifed asm constraints
>=20
> There are two test cases where the inline asm doesn't have the correct
> constraints causing them to fail when using certain clang
> versions/optimization levels.
>=20
> In mem_noshuf.c, the register r7 is written to but not specified in the c=
lobber
> list.
>=20
> In misc.c, the 'result' output needs the early clobber modifier since the=
 rest
> of the inputs are read after assignment to the output register.
>=20
> Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
> ---
>  tests/tcg/hexagon/mem_noshuf.c | 2 +-
>  tests/tcg/hexagon/misc.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/tcg/hexagon/misc.c b/tests/tcg/hexagon/misc.c index
> f0b1947fb3..9b1604d82f 100644
> --- a/tests/tcg/hexagon/misc.c
> +++ b/tests/tcg/hexagon/misc.c
> @@ -189,7 +189,7 @@ static int L2_ploadrifnew_pi(void *p, int pred)
>                 "    p0 =3D cmp.eq(%1, #1)\n\t"
>                 "    if (!p0.new) %0 =3D memw(%2++#4)\n\t"
>                 "}\n\t"
> -               : "=3Dr"(result) : "r"(pred), "r"(p)
> +               : "=3D&r"(result) : "r"(pred), "r"(p)

Good catch.  However, the "p" argument is also modified, so we need to move=
 it to the outputs list and use "+r"(p).  This will also require swapping %=
1 and %2 in the body.

Otherwise
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

