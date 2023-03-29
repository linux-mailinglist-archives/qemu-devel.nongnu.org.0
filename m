Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2DE6CEC44
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 16:58:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phXFo-00016o-9O; Wed, 29 Mar 2023 10:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1phXFl-00016b-IN
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:58:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1phXFj-0002TC-Lw
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:58:21 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TB4vhT020563
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 14:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=mBjFMA92t1egzMpciiEgoEl2Zw1MGYAPaAM5hKIAfE4=;
 b=aylK4f9SuD6DER0fHFJ7ZSmcWL8jVg4BUrOgfZ3Bki2CNCaF+4aqS5a8V2YeESWtVOZ0
 A/KosyUCoNQSS41KdeJ+sqElODs8Adg3SmSjcC1mpPNbCt0kw98RO+bZpmPsBhA7V4I1
 63PBATtV1jFHfugjn6CN9p9JAC/DQop3oDLtvu/htTNwLTk0O+Zx+HaAL6UP0SvHwQAL
 rRPiPe7zINcM2SO6b7TNhMZ4H2a8+/MKu5vAmREVx5PExIsOW/Q4XRG+JyJvWem52Cg8
 ZfNaNdldYKZ5sQ5xsPZ3OCqgI2C7RcAvvyrypZ1vs2kWgFl939aVZoULLSP4PTbXZyST 3Q== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmb8h1rge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 14:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdzJeCPSuPeQaXryPaGu2K6PZB7wMZZjlGz2JSXPfc2U77JYWAbr6unMI8baixbaToCeDhmBv8bN7LI2mqsTOFjz3jKAiTtcwY2EtUH239UlMxtNmMDMHH8zodzFrFQ48unk0OJ/TRcg5Kdqx2vPbbIJ9nPRn80MbfR7Xfp9ecMiESDUJuL40dFAzZiGjXGoyE+T5fJM9/ighq872nhRBPqCRVrqyExlNIsMxnFvnuKEjO9a3AtkVKI6raJrBwsfZaAJRyUPxx2MoWUA+Gy78DQdTZp93LwpXJPTxhVF9f+ybaMns3DY5gi0+hv+P2fSXbLC6bwOsQganK0MEwoquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBjFMA92t1egzMpciiEgoEl2Zw1MGYAPaAM5hKIAfE4=;
 b=fJooAHr9UO4gfpO8WJGKD0FJoBp1zm2EOBL4qmzI2dcxuJllf8CByR6j5gyQr3AYokZGI9Vo/MnPKLrgdxgD4mxerS++mqJZ6XlIob7dK5QIzEwaOacxHipHWDS4AduRm+5tqIx8Ju8H7g3O3J1/6pLr4p7n1gLU0OkfGUXaHD+STLs1ASVjINk22uMw1fPAd9hA0aJuOmXkaBw4+Hy7gmQgX4Q34KTN5hKEYYALvA1Vblh4xrJEK64HGDEqRAhf+CsTmNfG83wikqkr25+2tADetwHWrAkflmFCXq+fOW+SNlYcZF5dk3q06HKQOE2G2F6/QaC/z3iW4l06b0+xfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by IA0PR02MB9529.namprd02.prod.outlook.com (2603:10b6:208:404::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Wed, 29 Mar
 2023 14:58:12 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::ce90:3dc2:59ca:108d]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::ce90:3dc2:59ca:108d%3]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 14:58:12 +0000
From: Brian Cain <bcain@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>
Subject: RE: [PATCH] Use hexagon toolchain version 16.0.0
Thread-Topic: [PATCH] Use hexagon toolchain version 16.0.0
Thread-Index: AQHZYkn2+MmCH5hI7kSFOMd+iH1Pd68R2LoA
Date: Wed, 29 Mar 2023 14:58:12 +0000
Message-ID: <SN6PR02MB4205C4B02B463E7AB0A9060DB8899@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20230329142108.1199509-1-quic_mliebel@quicinc.com>
In-Reply-To: <20230329142108.1199509-1-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|IA0PR02MB9529:EE_
x-ms-office365-filtering-correlation-id: 993da4cb-e338-4f35-4e48-08db3066046b
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sqxOPju9euHb6Y7sWSyXZRuYsqmCI/6FaEeulh8hxD6bXrr+bU3FUImT1j5pE/7Y65QqVQST27PA6DeZzoFfOlVm0k42Pt1uDgZaewU0H09KeugpmTJVzpG1IikeTfr4zCMJo+oR49W8gcFiOcUBYoEx1SeCsKt/CtI7ktiVf7r4T0PGTxRuBPcQg9NQFY7uhYKA+jbV359+dulZwOn0NL1v+rxoUfAtQCQEnkUDCMZP/GnHfzYv9pckhM28jR9Lk7oS6e3FSSbbMl6Vch8Y5SPjsrKdVM7RugEtY5RdPHAwnB1z2O5qbkM8gkmsfYJGYu2QE/LDK85aC0b+S2bHZK2O67Qy2FZX2zMCzOxZJMBK11wGJjazQGxRVbx9Hw0t8Ack0yl+6GPVv8ASHWZbpKq3mzDzjEET7MEDKfO1OmJLZy5L3oRFG0AfoxWoOAS+b67Bjx+WZqgA8PxdG1Y8UiDD86zHUAJmUzzhzeByeNtqIITkNozxMQEMILg18SdQkKDOdjJcwEHBF0fWBvGY5/sNen5J4DhKMO28JCdrI6dTHxZYg/emAxv/86LuTilPqcXfxUS3mxLtt39wPCGGZSb+lDqLjYulbUhpfdKyC90=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(86362001)(38070700005)(33656002)(2906002)(478600001)(107886003)(966005)(71200400001)(9686003)(7696005)(6506007)(83380400001)(55016003)(38100700002)(110136005)(8936002)(66946007)(53546011)(76116006)(4326008)(5660300002)(66556008)(66446008)(66476007)(64756008)(316002)(26005)(54906003)(186003)(52536014)(41300700001)(8676002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nT5kWdDO6gVQZaxf+ECRTj/EOw8XD4VBpD7TwOwZlupzY6HStp6qSFrrwfYk?=
 =?us-ascii?Q?+Ml8HPxIFBntSdBJNd3bKesr4AeNGxQfPr1sPWnbAUvEFUEXGrx2ruqagn5S?=
 =?us-ascii?Q?csGnoUHnQ6FTOjSyauTgOLeBWfCivxp/YirRllKCXgi0Cl5XnjRRgvsJpQmj?=
 =?us-ascii?Q?2iZjwqhBZ91rGko6xR+wlb/hGsIlXiAwg7hDjD7xL1eDIEKwUcJAgbTOWmoI?=
 =?us-ascii?Q?0CVRfXrGrKrzQR8JfOvnzdrt0JlgN4LygEUsV90iIcD9jmsNbATLXCQNAcrr?=
 =?us-ascii?Q?FaeXH8xoy2wBYp0RH7NBZqIS2uetBUEJAhSDTxIEFar0G1YyMOjnWchFUcxG?=
 =?us-ascii?Q?JtMvH1jrtDAIDbyxgXt8x2wNgn9Yra4KLiPrVMIOpuiHS821Z0c1cWzBT7bB?=
 =?us-ascii?Q?m09N9nLlYz2gNGzvoegAFHuNwfmk2ZBOsF39pSnExjBdWXJ4Cz7vEioyhhlZ?=
 =?us-ascii?Q?eCzJ4KfgM4FAnFSnZnqcLwbE67lqop0I2pk+7BN1unRp8RpE3ydWqwTmUQeM?=
 =?us-ascii?Q?6EZMcxLIoKvVN38old+HR3QTEr/bk5dRtrn/AkwsA9ZHMTa3WHNKlW34weQ2?=
 =?us-ascii?Q?Wge3bKNfX7duQwXn3W/IMwqeRto2IWrOFzj4WLyUVeDhMYWpSnN+8/fBsa4d?=
 =?us-ascii?Q?CucQApLjgVMzFpSRX44HBjDNlCZO75CbPc6S/MZNCFLGugIo7XtdcSOkWhAj?=
 =?us-ascii?Q?7NOFg8CVVcT0HgVB6xAV/f0V5kLCngJ4LLJ695Mh87nzBMJD9ZqOZITPGF3n?=
 =?us-ascii?Q?knpEhRuu533+C4PBBlFZXMisQIP7Q7yyZjkvYZuSFl+Zu5bDKjZk1Ce7JfJY?=
 =?us-ascii?Q?/HxM5uz7FqmaMn773BvTPZyomvJ+68IU6j74be2KAvd4ix/XZxElfv92cl6Z?=
 =?us-ascii?Q?iuH3rYvXZmIvv16ssOl3+sCtaBbcMzEXUa6wP5I5CXBlIX0B84Q5pTTkNXXN?=
 =?us-ascii?Q?qVa8q542kzBsFf+h2wSUPVtMCht7sEcxPj+umv2uodDFjfK2FQNVbm8Wy9qa?=
 =?us-ascii?Q?EdUiS4KPOOLTrlHnt+n9u0jjTeSIxrZMh8lrtvCDmei8rM/7jPOyGtxVh0ta?=
 =?us-ascii?Q?inKldJXYoWpEhhOCKJ5rqi9Bf+heCrAGBXFcjEI/r0bIWGpMVb6ZS/9Tf0he?=
 =?us-ascii?Q?vCeojYbEhqOrnONhIQXrMqugoifJrVHetKHxIZwYOJlRQyHHp1+m/tfcsh8z?=
 =?us-ascii?Q?4lOwEvTeLUgvLl7XO+u/DtHu5KDjbEnjs2lyctlzoHxXDcCK4Jbo5MXineJm?=
 =?us-ascii?Q?/zjQ85FkRxq6dujIiDbkz+cFLwWJ7+bQoZwRZnW+BXQTDYc54jQBOtJP1ux3?=
 =?us-ascii?Q?B/D9WtupXUV0pZ918wQHR9liCrWcea0hKSGMs6nep4v/ieml+dtKsIbOM/sb?=
 =?us-ascii?Q?zdDoL1rdbKJoi30YRQP9PDBA/qN9AiPleTSrfo1nAl66I8rX69Cl90Lz305f?=
 =?us-ascii?Q?NhulGEWRQRRpWla/cLxC975hDLFgcloBbvoHb/08nQWpd8tLmdujit9L+4L6?=
 =?us-ascii?Q?gleRwB6Tn8V/F/7GeVpk1SbI5m1tN4qRusxfTJnAyysPk8bKjgMMHh4JvV1C?=
 =?us-ascii?Q?AFlitcG6jYmHKtc8lSlNd4ZttA5hkXBv5OnZ4Ayp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: p3w64lv/GvufW1iAmFVRBOnvruXi9f86mMIjZhjHTCF0SeVMzK0z1L8/yuLqBfl1qRKjUif+40ruakg4UjyehB+a0MBq+UMk4EboeflQG5zShk+8AHS8ZPEREpcw88DzjiQFjW6nCLBKHOMqvhdHeoA+AQFfPqxxR1dzlqurqOtcEkIxh8yFcJMVtdizm34Y++tGbf09gxHa1dpveBXyOAoReZGAlZxOF7NtuY18f2HjX8GAi+0YundJ1CuSZNHe2pwkhMluWR/HEuu7YTssOjEnS1WGbuoZZWLhXjwVlje/k4TVbe1gnBbvDgEOplW6Fw8XPaNxJEGs4C6hDaoVjMHsKBVPWgN+5SzKRgWoNJ/g8g4P2hTWPCUAKL67fgwYmqoShoIZlO0t+1Ep5cSJ4+6Dn8f1vZ0onRnaI/9TRzbdFyBaWXkqJfaw1BIb8CW1ykyvCFjH5QMqgKpBJpfx+VcNVEYVhWg6IXB5qxVp03WzrGzQ15UOWNLVwSXXxT40tklfZO6WAPd/Z92DZIHg1V2uekzJMr5aLzrOd+bB+5ST6JQTomio4bqMKRNLzuRYRxDyhE6hm3HUjbrM6MGBqWNRerv/mzCzaivHtOoyhOfvAuUiFkXA99DsVf9Eh+f/i0dFVEgbubmmoi2c+/8v82uPj12lptlxCL3AtFlhSr0MzAB4AlM8u3D+/CvWcuJMRw9pZZBJiZBzG9A6mVHsOSKFXPivhC10sf8PsgG6lH5NaOLnlD8aRNNsN++ZDeXRHoGoja5dOSSHAFHz38824g==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993da4cb-e338-4f35-4e48-08db3066046b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 14:58:12.1668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYU4RNtETFMPY6UdbK32zvzkop2+jbzW7Fz6/DgJm1eFVvGC0pm8QDCvhx/ja6KVOec0/AIOqd7ez4GW9sBR1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR02MB9529
X-Proofpoint-ORIG-GUID: X566hHRpGl1CqseKr1a6V_pd6xksSrNk
X-Proofpoint-GUID: X566hHRpGl1CqseKr1a6V_pd6xksSrNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_08,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=511
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290117
Received-SPF: pass client-ip=205.220.168.131; envelope-from=bcain@quicinc.com;
 helo=mx0a-0031df01.pphosted.com
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
> From: qemu-devel-bounces+bcain=3Dquicinc.com@nongnu.org <qemu-devel-
> bounces+bcain=3Dquicinc.com@nongnu.org> On Behalf Of Marco Liebel
> Sent: Wednesday, March 29, 2023 9:21 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>
> Subject: [PATCH] Use hexagon toolchain version 16.0.0
>=20
> WARNING: This email originated from outside of Qualcomm. Please be wary o=
f
> any links or attachments, and do not enable macros.
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker
> b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> index 5308ccb8fe..b99d99f943 100644
> --- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> @@ -27,7 +27,7 @@ RUN apt-get update && \
>=20
>=20
>  ENV TOOLCHAIN_INSTALL /opt
> -ENV TOOLCHAIN_RELEASE 15.0.3
> +ENV TOOLCHAIN_RELEASE 16.0.0
>  ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-
> hexagon-unknown-linux-musl"
>  ENV TOOLCHAIN_URL https://codelinaro.jfrog.io/artifactory/codelinaro-
> toolchain-for-
> hexagon/v${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz
>=20
> --
> 2.25.1
>=20

Reviewed-by: Brian Cain <bcain@quicinc.com>

