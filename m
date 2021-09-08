Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2D340398A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:13:08 +0200 (CEST)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwRu-0005lB-Ls
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mNwLW-0007tf-SK
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:06:30 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:8862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mNwLQ-00040l-31
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:06:30 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188A8nkd026033; 
 Wed, 8 Sep 2021 12:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=obybt6S4lWmVb2iYBscixo+DgvI7vI+8L88rkIEJuBU=;
 b=h/kqlR+S5nPGo+8PoFAya9zhvsQ4FDVaZlLJSix+gwvy2AwOtyB1bjt32tVKYR8xrkdG
 DyLfgnrI3V1var9X9JZxEuDKXmlibYZguJkiw+QXMAdxRTZ6mwFqR0f4bcPXYGnGW4Mo
 1GiSCCCAJuUeS+KTRETkkxmxn88UOYXSwsMpxRpVvmocVyrEf9LPmumgEzlNnLodvXp8
 sYGPdSCbFjzz63I+9teljKsFP01v03DI/WlTYjAIuOHDKleKr8Wj5eAGqfZjjnm3cuwD
 EepfMKE9IxdO0feJg5u5RRl+M4taI3bvXyeCGgVBv+d0ISFyzH+TvfWOV63B9MR1QJuV ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=obybt6S4lWmVb2iYBscixo+DgvI7vI+8L88rkIEJuBU=;
 b=cpebCaQbxZnFzCtHsJ0FdKwOMay7JNhtTsPjTD31qxat1IEdWN87MD42OdfacmcwuxKT
 yJOAP7pfOlZ2j/nk3bKJKGjleVNbhuqpMdfTDF9xC8D8yJ1XESfc3JON8jbej5IgHAQF
 WMDxowHONg66uCSFOveaB9pDKCuOJ1wsXhc9neZM5rT26QtV3uycFqZaddzcjHbMedyH
 H+jr2S7i9hbgGlvqeN7b1bIWwmR93++aMdXxlv9yKrceBpd1LfpMLS87UayRjqUWFfkv
 YU+EXN6mCHcxL5EH3xfWboiROXcNqEGwxbo1rpUgsQ5/axGC8ofpijXw/b5LYMCkGRPr Yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axd7tadnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 12:06:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 188C64dT172129;
 Wed, 8 Sep 2021 12:06:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3020.oracle.com with ESMTP id 3axcpm53tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Sep 2021 12:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In0RMLcXa2uCZXc31nkfrw8N1L/NFXK0bDFR6q+78ZueOit9YyoAeL+p4y/27g+m6aKXZkqeRt5zFJ7ZkbQSjhn2fubPl/nkueL8fSzgFTI5MgHNBXsJM4pgL94SA/YyR6Hv18xc1itBwoUsrGUDDwdp5dwi122JOntl6G4UWmUVk/9WISB+CVkoUpGDwsUsQV6C0uAw4ebVjLL+oEA9mGkxsBbislx8BFMMBTqcXrYPIUCiO80fi9WYb5a2R1M6pAaYjQzeVbitbsnVL/oFQgj7zCsuG60oxg3Yg+6Dq7IUL9BZjGRbPLFvxva7dM/6bNao9SCTBiXIYO410vedCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=obybt6S4lWmVb2iYBscixo+DgvI7vI+8L88rkIEJuBU=;
 b=Pxl0uufs2/r572133LQZ0hexmXnYS9LJTmC+YcPh40JWbFzrBCThZZvXLpwDQppzkvVi99rIJ3neIypKsHUhx9TxAvJvuG83p9kOdo6cluo9PcmxUyWTimz1sRDzbLtndyIRB/pCiv7CUTHyqOizBVP5jbrg9h126juOceOV7i58WLUXUkGCbQ1E3crnsazQLqx8QCi3TAkFez3TTK/Hrms4M+mWx1I9N4s1VJaT16xwknU2BxWKXqBUThLpQOr0P5Rfa6UninprGmRJyq2dErmdMknQr6DAtXAceWo6PHyhibBl9/AQSQXAtbIjnxCs6V5DyYxTwQJw8EsjzlNDbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obybt6S4lWmVb2iYBscixo+DgvI7vI+8L88rkIEJuBU=;
 b=zVhy+RaGcoDI74A2hY4R7aH2iZyX9sKRRPeyBrlAy4g8sgU7C9OnBBZmL5hVcBNT+jyoZmr96Aawi1hiy4nAH4/t2sUbE9anEXEijoQg2DC/X+Q8VJ9EejR7oXbooJUNvLep3YB+KvB7BFGbW9/zWRHIARO5MdXkoabGYZNTCpk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4191.namprd10.prod.outlook.com (2603:10b6:208:1d1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 12:06:02 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::756a:e7ee:b7ae:c92%6]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 12:06:02 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 00/11] vfio-user server in QEMU
Thread-Topic: [PATCH RFC server v2 00/11] vfio-user server in QEMU
Thread-Index: AQHXm2axIjCdfadpxkGIfiW62B8HDauZ/CiAgAAg0oA=
Date: Wed, 8 Sep 2021 12:06:02 +0000
Message-ID: <1DF55977-96FA-4BD3-AF62-738B5C874C9A@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <YTiLocBXniFqW/gl@stefanha-x1.localdomain>
In-Reply-To: <YTiLocBXniFqW/gl@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9801820e-d5ca-450a-b1eb-08d972c1072b
x-ms-traffictypediagnostic: MN2PR10MB4191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR10MB41916C15450E15DBFEB9512C90D49@MN2PR10MB4191.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0wqCWmw63seAXWvEgF8EZGRxigERyeqQdJftZmAMM3e1UQaeRogIkCsMiP+bWdEd+9UzT0K5dAmmdXSFQcUuY0uBkiM4awx4gH49OCmQnrkzak4cBZ89/SdlTuDdLHJCQRt1X+xqHY2vaJExUHz/WwNY8dNarXihNj1UeY9Ky0Nz4IsLspiDrHWzrjDd1ouvJfd+dy3Qz8tfFPgIGyo7Ly4bhTDqM1zcc5NKkNu/O1S4cwUpwi+yyR0su1VrBYymzQlvWjp86rUFV/pOx2n+qCSe65pCDYKL+tjwQW9Ed//+hqGwDCHs9OFEUovRRTLHovksEb3ZB3LlGujwTWViQ/bwIDbv9Bp8stgmUMRoElKNp3VRmGGXg+hK+rMUxRYI/rfGHx5UqT77m2Dq8TSp7N0kjM3WzXsbmg7gdZCEly46iC7NcIWfTuY7nwzPKtxqe6Hyz6OeyiP0F29VyzjcNt6zQgG0Y4MiObSVARVxDi8CBNuT3myIh9Hf/15+3vvxF1tVgWbS3HF7Oqh1YpFHuIr6m30YaItWUqpVsvkteDaIyb8m8NJSz4kS+Hu5FEbeYHEkNgExLOhI9i/AmljOdPuVKBq6fwQfCM/wE9oTZCYAxqqMgwK0ROGrVZsrROwTMHx636Xsaeuk0d61K+YC0PCiv5ur4t9/oluMwbXVgqOV2G9ShjTw/Mq04crZnsQ4zDAIHIqnsJRvWausInH/R1Sr6Y1Ofkw8Zm0v77fH/6INDZ7AMP8J/AKzMISpObw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(366004)(346002)(376002)(396003)(2616005)(2906002)(8676002)(66556008)(86362001)(6916009)(478600001)(316002)(122000001)(38070700005)(6512007)(4326008)(33656002)(4744005)(54906003)(71200400001)(186003)(36756003)(44832011)(7416002)(66946007)(66476007)(8936002)(76116006)(6486002)(6506007)(64756008)(91956017)(5660300002)(53546011)(66446008)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UC/6IwIFjVKA0kFvYxbPPQHZwh99Fh14zFeXLBpDL8i7Bw/C9soy3GK5Y6?=
 =?iso-8859-1?Q?98XurTWlfWFUqKfQoDVavYPRjavIqkWaynjkai7NnL59AL+XxONnPdhzxi?=
 =?iso-8859-1?Q?7swcNSS1NnRrYP1VJkaVVkcFbNc1Cs69lDTz9WiyvTHFvmz0UEq3eXNkah?=
 =?iso-8859-1?Q?MOwUWB1MG8i0BDSm4Pc02CmiVr4rWG+JiM5oWISOGw9X8mvh61cSH2d9/n?=
 =?iso-8859-1?Q?mkYEf53o+gSSCg5fJ4CBqrbVQbufTSXh5F8t+yrUFvrX+voTLmaY5RotkG?=
 =?iso-8859-1?Q?nOoabLPBuT0vw58cnvCMIXUc11VXY62/CeR0fAdn00IA63uDhGHvC1PU3L?=
 =?iso-8859-1?Q?0nER6nULI2woSWDTMO+LFE2jdd02Wni36srH3dHTTJKlXu1YMsAqg8aaAU?=
 =?iso-8859-1?Q?bsbnW0mvayRV0vnd6TBX3WBdUbNmIrwYdxbrSBv8M28jryMCo+2FVvICwm?=
 =?iso-8859-1?Q?aVQu42mEuXTPlYKK9sNNadTw5BRya9Iduw0tt5H81pJms9q9F493buX0oA?=
 =?iso-8859-1?Q?EfjOQjHC4RhB5+BFiwEgVHzrpA07NRjR9CP+APjblbEShU9iOUn9mwtaVu?=
 =?iso-8859-1?Q?I4GyRRxso7DAawII0EwVu0t2TIygfQApSLCCs6d7UYSM0K5PAM3qJRuBD/?=
 =?iso-8859-1?Q?3zaT6q81Y2Ayo9UPmTEH7amEH2cGW4PRLfHSoW3ygH7REwniPLvxucbOGu?=
 =?iso-8859-1?Q?Yo32w+akH345lVzKyR8fwiFAYwnYTldREkOrkzFoCkV4mbjkx9o+NJYJzL?=
 =?iso-8859-1?Q?vVRhkc9L45ElHAqhVSx2A7bcDgitGV2M8x4xeJYquKAZrXzaySfbHKFdaG?=
 =?iso-8859-1?Q?+KnY2aXh6Qi7X7giWUizYz9aL5vSWF1A3GiUsqoo3rra0zsCSxKgJcPr2s?=
 =?iso-8859-1?Q?AF4CGCzu7v2oEpkpkBWyWdNLyPdaXvioBm47gvXJihn7i0FJG9YndYCLMS?=
 =?iso-8859-1?Q?MHzvJEqGWj8rmT4Q0Y+mBVLKZh+c2IAVuQFwzxQt+tqZOm+56PBd+LhLNt?=
 =?iso-8859-1?Q?2NGAjts+QEtSV6NTzD29SpzH9sdfIRCoVhoyj/lJRAd7MAM7HMFTihp+2B?=
 =?iso-8859-1?Q?g4KahoYyNO3jB+vFbo0H3X4S83RcQCX65KULvmsumsLutpIa0DE4oKszsZ?=
 =?iso-8859-1?Q?CObcVy38l1yARLwUMCsHDzEqzoGZKKAoRTZNrkTV4w627fI0QhTp1MEso3?=
 =?iso-8859-1?Q?MIl4Z3qdFcu3YwIJQieZdgThRsN4LIodIcO5BbSEb4wRIIQ35YSPqsSnyr?=
 =?iso-8859-1?Q?kkCm9RPjeQcPDnLN3qlsfWUxI7eZ0HK8vkFVEy4IqQbNW2GIW56oxCXB78?=
 =?iso-8859-1?Q?Bu0h76+jHTbCJnFoiKb+FER22yr7IOf5cBi/aUpDGokyBTl/KAf2Iir8Of?=
 =?iso-8859-1?Q?hnqhBhS2lE13SYebRPj2q8J18Cd22kXK+4WVOE2VDlNHmIVij1zug=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DAB989707462AE4E8AC7CF441FDC00BB@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9801820e-d5ca-450a-b1eb-08d972c1072b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 12:06:02.3315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+sikf1kptZvqycB5bmqMZzuUf/qDzeb+PG2T/WXGz2I/XWSfPVl++GDrDtkQ8gPLAwqK+RT3XVpR2C9m6AGjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4191
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10100
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080078
X-Proofpoint-GUID: g5oAK77nA4Fk0ZnVA2DhRXNAx-jdkZ1h
X-Proofpoint-ORIG-GUID: g5oAK77nA4Fk0ZnVA2DhRXNAx-jdkZ1h
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 8, 2021, at 6:08 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Fri, Aug 27, 2021 at 01:53:19PM -0400, Jagannathan Raman wrote:
>> Hi,
>>=20
>> This series depends on the following series from
>> Elena Ufimtseva <elena.ufimtseva@oracle.com>:
>> [PATCH RFC v2 00/16] vfio-user implementation
>=20
> Please send future revisions as separate email threads. Tools have
> trouble separating your series from the one you replied to.
>=20
> You can use "Based-on" to let CI know that Elena's series needs to be
> applied first:
>=20
> Based-on: <cover.1629131628.git.elena.ufimtseva@oracle.com>

Thank you for letting us know, Stefan! Will do going forward.

