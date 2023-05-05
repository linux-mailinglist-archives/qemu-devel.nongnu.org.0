Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575466F872A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:58:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puylC-0004Vg-92; Fri, 05 May 2023 12:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1puyl9-0004VP-K2
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:58:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1puyl4-0004Gl-HQ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:58:16 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345FxWGL023509; Fri, 5 May 2023 16:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=KIiMLS/Esl2c2yTP0nCbg3fT2E7hiWozP1jMfw67IAA=;
 b=QxKf5ZKNmESbBaAvqTKXy8tQhQ6EdlO/zch1aoUVur5shvjkih/gHBwtr/xTFlVvA8LC
 +r3+L206rAMYCVfGr7ndVvfkf86Fa4wsXlFLrBtacnRo30TAbI13FS0lsPsW+0uSMiCt
 +2sSLd2Xaw8are9tGASe7QA3g4AoPixAYHLLhsuizdEIMS4keqycD0mz+AwNUljAynsC
 yH0mqOdMKlWgXlZenrhjPrtL3/LRZLuRUGwIGwqMmcuxlETPr5cGoC2wGLHTLErKgbwf
 zXbrVEjfSvtl1TQOu9/LqWGP4yMPAGBGJjAs4M7gdyPOLz9bNLHXj36ijP5To/qoG/dI 0w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qckf7288c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 16:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8Xy5u9KdwZeISmD7KYnIMBIfYIa5hwojKUX15wDyqwlHTMKQXni8xRSaXwXZ32E0wQtHaWA1OKmCzUeQJZgvsmV4nwTXulCpZHO0fEcwlErNPHtls6W3dN8sKeFMEfzorIXXud5pLT0Q9LnHdw39NYxKFQD7EbLz9bM5wfRISpve3oKzgQUYKzs9e/68AjgchhUWl9Ar64teR2cL4cmUequnY0wJfTyU62pfNG3zubX1vwECickUbOnXcgKXI15VQs8JBpVwlmJq0VjLbI+J5RggIB+MACTPHD/KMJKBMMbaJYu1RPDWBv3N8hbjHGE4VxLMB14KoAIekmM3lT9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIiMLS/Esl2c2yTP0nCbg3fT2E7hiWozP1jMfw67IAA=;
 b=nNqb5fuGN+OehhmRDn/NHeBzul3eaJ5SXpYq77FC7LyYOvZ1SK9zV6ppvnXfLNh3XHjjpIjd3Paxm3KNVC5vZRVpCDPV3LrAml0lht3ngUz5EUVs9+0FrtQJ57MPo6uXGkYKLc3f3terY314I8jXZwL60IuE5L5ghrpPcrWiptaagad0EO/ySCTcSrvb3om3uZ96UiwlJGnMuFOfTlfs/k8F8F6fm8p3vzPSZNwV2xwl/08Kzkof7eiu9Q0zNhlOduJ7jOeCP6Na1ld+D4yZTeu5yhxIZq1GFzX+shZgWzQu2I/4Te0HKSfRQE6WVapVvvoPlGHdw09/of2CLKNaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CYYPR02MB9928.namprd02.prod.outlook.com
 (2603:10b6:930:bb::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 16:58:07 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 16:58:07 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng" <anjo@rev.ng>
Subject: RE: [PATCH] Hexagon (target/hexagon/*.py): raise exception on reg
 parsing error
Thread-Topic: [PATCH] Hexagon (target/hexagon/*.py): raise exception on reg
 parsing error
Thread-Index: AQHZfqP6nHPLq6ZQ/UmvlqqKvUAxZa9L46DA
Date: Fri, 5 May 2023 16:58:07 +0000
Message-ID: <SN4PR0201MB8808E191EE99CAD969724CA4DE729@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <1f5dbd92f68fdd89e2647e4ba527a2c32cf0f070.1683217043.git.quic_mathbern@quicinc.com>
In-Reply-To: <1f5dbd92f68fdd89e2647e4ba527a2c32cf0f070.1683217043.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CYYPR02MB9928:EE_
x-ms-office365-filtering-correlation-id: 6eee8ea4-5c3e-4c3f-6cf9-08db4d89e67d
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jOB2AhWKCWfKHPAxbd6IBwo8C+ZTMahelLzQMvr9Z/YiEC2pM4PkAIeu5c6TMTLArAVAUI9VfJefhjK8RtJILXwmUBxu6nYX449+wV9rHqPffYklMARGkGphRKlG/cJwCucS58JyU/1LxYdyH4Y50Z/0U8HB6DWcMkYEh+3FhXY7TeMjNIbTZhi7ZC5TKOzJcTc2v6ulgIwHNpwrnXTOQreO6eZ6ael2GnXUVTJEjKpNKj8ceGT+s8ZjtdO87+RIUN3os+In64MGvV/aSzD7VSOi3jInAf8VcGN+1nPxdn9XOdHro6awnnifTaLNdcCYnGeCTMXqkOWXJ4aWuCfwItx46fxshOd6hY++b5ihFaaiDf2msDLggNiBYwTiTNS0/bGa3tZHPLZqWk5ugs1piIGU/eXLIKbbZW5qzs4kME90DhzxhLjVCw9moEtNSS4N9k4ZrCyLaYimHfKnpvMBc879teJTkxTrKbI7zj+yJwFA1/EIB9L+8jgVInrLtQIocvgXZMrzv8+12iqBvUSFd0vNio6nr7feFQ949Mu6SWQZhPTrZeijt+PV6AWo0JDNRnLuRYb0l1K9ydYZYxQtXZvUfxsWRtvLmtgVyqCDV1XeN+N0cTwdNUSekKgy8B7d
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(33656002)(86362001)(316002)(54906003)(110136005)(4326008)(76116006)(66556008)(64756008)(66446008)(478600001)(66946007)(66476007)(7696005)(8676002)(55016003)(8936002)(5660300002)(52536014)(2906002)(41300700001)(38070700005)(122000001)(38100700002)(186003)(26005)(53546011)(9686003)(6506007)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tNSTtY5VdmkwokqRLhGNTFlVJEY0PYC9DRgCr33xbDqGMWjfo6BwYTielrdI?=
 =?us-ascii?Q?itG/Yoftk+vTbpaQh4Xbwdskt/NQVNKrWUHGzTZ03vAU7MDb6nd3rhMhEV8d?=
 =?us-ascii?Q?wmn3ygiyUma+n3Wth95Jyr5DfpbiZQ7B6+7DBdJr0iwTCRNtG6kcPyF49O9b?=
 =?us-ascii?Q?IZUucJXXuOFAgKjh8q49Gh1SRAlOW1LSBLTcQldRu5sREpAY4SDhRHV5VNlM?=
 =?us-ascii?Q?5o1kTqke7OREqtBnm5Ot+EoZ3ArktvBIXkbABQXFVLhMFL1PVpkgradfEc0i?=
 =?us-ascii?Q?OJvIXT3gOHnivclFk9dSn4ckVcZHoxxjTJWrTye+wEMKhfEESDY7p+0ZzPSw?=
 =?us-ascii?Q?bHaWnVBLHhf7BV78ZQIZxcK+cNq9P++Z6X2mdFKSjB4UHXP5x7da32XOjRHw?=
 =?us-ascii?Q?lDWJ2qcX/Wv69gir3TOiEJFuwiUBsTmw0bhAoMATQp3nyXJ+so7JcMXaNNMr?=
 =?us-ascii?Q?/7VoVFZNdwRZn5Kz/T2YrzEv+QeODslJVsMzdI4QVy/hZZIB8zzLJGYV2fXA?=
 =?us-ascii?Q?JXj7DjfhQlAr13oxloCy60imReTKmpy8unBebLciJr0BnVAhflg6lsrIS+dX?=
 =?us-ascii?Q?Pq+yIm6JHnl01Oqp4eAtd5hTZbD6EXfqnrY23XtqKSEqrczU8jBCBwAOy1+e?=
 =?us-ascii?Q?iSH3fjeUOGa+RQKyWpL4x32T09Z90Fo9w6PMDCwIJ4mTr/ZDt3yI2zXlNYbF?=
 =?us-ascii?Q?Br8CI5RmEmLbmb55/PYY6y6Kw57MRnnqJu26RE9kvQz+0Lm5QfJoG5T40bap?=
 =?us-ascii?Q?85zq+YZbU3I+4UMQ1k24UqDFMDy5zwfZtmt+Op5oIR/rDFYWWN4beXiv9e6B?=
 =?us-ascii?Q?0MFSshofhIUzyGrz2HCJHCpAeMSXcYVY6PCZWxhGX0Ezr0gp5PT9RqTU3IoB?=
 =?us-ascii?Q?yKne5bqoQtlOaiHGJYPQQYwxUUprV8AN2bml/XpPG0V0jUd9HFR8mCj7Vp8b?=
 =?us-ascii?Q?CSz7yERr6jpYMb0G+8BbZri0J7cMQOCyaXPCJZ4saGUakf2vOxp8+E+GdcSF?=
 =?us-ascii?Q?tFbE1tL8Hgic3q9qW9x2GK5WqFnYHt6OEz/HfXR0mUhhNmAivL9PuHpAM/Aw?=
 =?us-ascii?Q?kK4cQfUbIz2xog+G5A0+bjidqFkKKKbUWdQV9txC9mlXYJQuq8i5BudeeFrR?=
 =?us-ascii?Q?inKE57neRndbps+f/i7A++ehbb7eeChBWoC5UUWUpWT6k2KRyl0ghSdjOXjd?=
 =?us-ascii?Q?P6Z4NLEpB8u+46ypsvwYTyaBDSbh8cBpGfIZltmhSWimdtLANBVDcHjM1dFo?=
 =?us-ascii?Q?ypoNSTm9dp6jv7d3erSgjBHjGVQG9CnA8no4g7yWJuwoskpA0S+GKhAlPR+B?=
 =?us-ascii?Q?K50K31ElM/XnKdg3+k0VniIHxMHcJzCqAhl3Vq6PmDXeVgB+I54nkIx9npVI?=
 =?us-ascii?Q?4HuqECxvelmE7EMLdRk965C6tC1mqraULjWyapkMxy91wd6yGJIuc5PXiDmQ?=
 =?us-ascii?Q?c5hid4GF2AhRN6tBSm7TGPLUN+OYJEHeJyHYj06gIRUOBByiTP0UDCrgHR9i?=
 =?us-ascii?Q?SVDYakQV1wTOkRfLhfzgFWJbfMUteu3iqFZEoL0X8Ltrv+bxsl81lKhUq92R?=
 =?us-ascii?Q?EFu1qtHaRQF8Tb9J0Q0grb/bKGYrwhdQaq+WqXtz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: F8Ijmufl+RMbuL2LgmlanqQU3OU/K2u7QaPgb0zt9Ucm7JmMTAPafHKRhvgOS0RjGaP9yELO6qQ/UWzE4qMJILELUrBlVZkrsMk+Z0aUa+0L5c0cEFKff0YFdp53eE4ZfI01u5OIU5HYG7V9+1w0+fhc2cpRV8DjlDvt6RfKRis8rZEOCSaTMOJbwv5Iex1Xmi+CqHTawVmUyaUkb8GB6GFvysAv4shFWK5Shq08PDdOJtcSg3tJ2qjhjaid+ZUDNebi2XyX9rg0j/Z2p+MLc0bgm56uXq8rNt7vKgwN8+L2bQFeGTNVgxW5oXdPTgqOfnhvK9QLOUfIxN2R7PqL8kBXlQQgC/K9JcRHTKml1m6SJ8SUwiDNbXDsDfOHE5ThGLNALrJ7ng6hE4cG+Yk5U67S1AcbUWE/rwwjLHAtME8LfDlESdzSU9NdENWffPbfi1IHx8ivuMUGhc+DVX9apX3o36AymSNHnHvVfvl1Zr//otKWUNpWkADV9SpLQcz1aOduANiXD00K5/GthFo6eof9FgQS34iBqJABL+/smzhInlOKhtkcJCk1fJCrCgyjPMor3sS2g1U801DbW8r3amwE2b1kOAC7Bpb/fu9gmTMge1SlLtPT19BrtEDLNhgdbzXNvcnYvCOoedI1xVpcxMRpqb9HqG5uu6SZzNGqpDPbTR2LbAr8ssB005KHNS/vMhhbrDgt+ybxD72n05G/uCu6cegaBBZYVGF/EYrP9FEqVTjVfOZLuSOrWjfVsS681d+wRmHq02GS8HF/dLr7eWouFZTWzfcFFtFERANUPYc=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eee8ea4-5c3e-4c3f-6cf9-08db4d89e67d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 16:58:07.5693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmAWeI1jSEEh//e/TtIvwXNP9Xu2jVq012i2+WP+mwPNP4teqrX0jt4NzHegrOuPOG7iuA5tvzakACkUhuZeWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR02MB9928
X-Proofpoint-GUID: gjcAnIa7_vg2YdEWu2umT5FT0xk4mcUV
X-Proofpoint-ORIG-GUID: gjcAnIa7_vg2YdEWu2umT5FT0xk4mcUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=431
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050140
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Thursday, May 4, 2023 11:18 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; anjo@rev.ng
> Subject: [PATCH] Hexagon (target/hexagon/*.py): raise exception on reg
> parsing error
>=20
> Currently, the python scripts used for the hexagon building will not abor=
t the
> compilation when there is an error parsing a register. Let's make the
> compilation properly fail in such cases by rasing an exception instead of=
 just
> printing a warning message, which might get lost in the output.
>=20
> This patch was generated with:
>=20
>  git grep -l "Bad register" *hexagon* | \  xargs sed -i "" -e 's/print("B=
ad
> register parse: "[, ]*\([^)]*\))/hex_common.bad_register(\1)/g'
>=20
> Plus the bad_register() helper added to hex_common.py.
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/gen_analyze_funcs.py     | 30 +++++-----
>  target/hexagon/gen_helper_funcs.py      | 14 ++---
>  target/hexagon/gen_helper_protos.py     |  2 +-
>  target/hexagon/gen_idef_parser_funcs.py |  2 +-
>  target/hexagon/gen_tcg_funcs.py         | 78 ++++++++++++-------------
>  target/hexagon/hex_common.py            |  3 +
>  6 files changed, 66 insertions(+), 63 deletions(-)

Tested-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

Queued for next Hexagon PR

Thanks,
Taylor



