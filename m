Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B26658ED4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 17:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAvWt-0005Tw-W6; Thu, 29 Dec 2022 11:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAvWs-0005Tk-Fn
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 11:13:14 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAvWq-0007hN-FW
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 11:13:14 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BTFd40o010841; Thu, 29 Dec 2022 16:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=6RsKS2GzFq8nNdgCoMIgN7ykw0fZakdv2GOo3FV5h7s=;
 b=oEIFaenL4Ju0/SFmsTXEsFoWiTRM+NFVXpnijzFKGoVMeuw7Ixcj4WuCkToj7KJSDoYV
 BBwBWrUyKw6iceJhG3WLz8UzO53Q49Xa5Xp77cSEzK/jocXGijGH2bEveCV7cBPE47Dt
 oksm+wpW26YPVdU7FlFWL05Atfgp2HkORsE2gg2PU3+pOC9+eucH1RzJAxIpelU/WkHP
 61Pq9GfYf8hHLkkbxCyUn7nS4bSGV0N/PjgfmzuiQ1LUyCcsuaPJpYI0BDLnklQ81HDO
 HjopiOisXX/zlUlUbVvMLYA0QhshIgEfyB5zMVyXPbovWnP4CD7Au3ODguzzmZwzskFf 4w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ms2nr952e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 16:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQhZy2iyW1R51Z073PwAo5NmXiI+dCUsyjyjQc27cLokNEB5dHdROpXZ2tYEGe534os4TO8b8LxKhG1W3h+vwo2jqDP8jFOJExZGTwFnsfmPV1dryZjwzHtWLadS4Y8K06ra++epObTFaIo+vL5XLoMIGEcvkjY6hNheIszhZa+bT/5gDp9IiEe7PCakyEQDv/XxYLaT7RlPvULmA5igjH/GMBo/AjmTq//5uKk1QG6s7d83TxXr7XEahnTYiMaZL1d7lBXxycxgoEnjxANeQF8k3SFfAW6EgIFMKTzpxjaCIOFCOSz8haiof6oUzwXBbCCqmgTU1HYIkos2fBPvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RsKS2GzFq8nNdgCoMIgN7ykw0fZakdv2GOo3FV5h7s=;
 b=NrdIzzS8b3pHg0eDfZvR7+AEE8rj3W126rsXSHaQG/n/30abFxJNLcLFhxG1zPJRVLa/UaZSmNCF7QM2Awaizpg75Fr5uW0Dy1qTkaptvBIMcFOc5CW+NdBFYJJ+RzyoU5E6JXfCiiZRdE2QrbCrHEEJWJFz4MKn/RuBYtjFH7COtte83WwaawmXWSFEk69FGOumc6ql/d7uGZbisdRuHNM1osf/vm4/ASxdS4+xatn6uquO76oe+EM0RC78+kuK1RKY227l1w8IPQ8VcdnFRTWEu/qkg04RVk9n2ddblRDOWvXueuug1eFdUGSzzXM3WeYoN0JDrgUYsiE8d1yV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB6651.namprd02.prod.outlook.com
 (2603:10b6:5:21b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 16:13:07 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%6]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 16:13:07 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "laurent@vivier.eu"
 <laurent@vivier.eu>
CC: Brian Cain <bcain@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: RE: [PATCH 1/2] linux-user/hexagon: fix signal context save & restore
Thread-Topic: [PATCH 1/2] linux-user/hexagon: fix signal context save & restore
Thread-Index: AQHZGgjTOOtBEyACFUyjqeVHPtIgrq6DlNpAgAEGqoCAAHEVcA==
Date: Thu, 29 Dec 2022 16:13:07 +0000
Message-ID: <SN4PR0201MB880830E4B5336690337C93D2DEF39@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221227153447.2729-1-quic_mthiyaga@quicinc.com>
 <20221227153447.2729-2-quic_mthiyaga@quicinc.com>
 <SN4PR0201MB88089A3D541389E5DE6D2511DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <MWHPR0201MB3497E4CA18DBC12E1A990BE6F4F39@MWHPR0201MB3497.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR0201MB3497E4CA18DBC12E1A990BE6F4F39@MWHPR0201MB3497.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM6PR02MB6651:EE_
x-ms-office365-filtering-correlation-id: 6fce8c13-fbee-44ef-a4f9-08dae9b79285
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RoZG5MNpmJrPwXbdZ1iM6sJVtS4N0haPdkFTcrcbuff/JODMPQDusFzfJEJnOiUB8CtXWR0Cd7RyB6UuDVk55z9l+M6Ixby4azOBoJhFMp/LstJOiQb60vjEUsOvVVTRFf3a8cRebStjnR2bTBzopctM+xwLtvemqqoI3N+8jFDaUiQQymSjfbrFWFa7BRWIH6rdQxpmZmyEg4+ROY/N83BPUzi8Rt9yMAjfdltQiop2BCj8R6JhzLegKImebb7lwrQKvj0VYJNPlDBL+mb3MPkOyXvN+lEt48bVbatrmeKgppE+WU1nRtKSZ1ieShwXIhntpV0vyGdCBpxzeZ9QF6xZtAxJOOqzOkt5De7m1quKsUM/5kv6We2BdN5cFo7YkJCb7ImQF1moukRiE/s81Cv97xYI/4eyFOaw7IIarg68YvBpObTCQ64piQHw/6sgdiOoqnrgZ9AdlRKrxQ4k8jf3LAIkgGC005P6aPSWdpCTOe6uXvR0S7RxOPSkt7Tik7f1INxnUJy+7T/WGwg+sOy0lfuFso4++/Iofpic+UiqQzI/I4SRBqviCn0Ae9iazejNrFxAo9x3gJB1oD788bMgGqv6BsDOBywmqdAb6DLlHmck8zLMUlp6wYryovDZavDSwnbWE5jMOT2dwAvBvAKTmpD8rgaRw3vvO5zML7cJrS3QpeZoJjQqhrqCkl2fvbaqWxYbQjh7wL4JMFPxKaEnOAj8aU68kjMghTSMRNo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(5660300002)(2906002)(8936002)(7696005)(52536014)(83380400001)(64756008)(66946007)(66476007)(66446008)(66556008)(4326008)(76116006)(8676002)(38100700002)(122000001)(478600001)(966005)(53546011)(6506007)(9686003)(41300700001)(38070700005)(86362001)(71200400001)(186003)(26005)(33656002)(55016003)(316002)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NfA6dnrwM2WIjTxkIrOmQwsiuzVCRUkJzqB8ZGt4GYrDhpY9lkSm8NvZKReK?=
 =?us-ascii?Q?fROFOwAKzfQW+t+87bJNd38CZHUoOmwCZD1KJWnOTqFAT5LhhZveOSNjj7wO?=
 =?us-ascii?Q?oNCm96Aju4l/cztmVpbOW22lOxCGHy06sQ5J0BVyvZEHp3Zj41jCHLa50UTD?=
 =?us-ascii?Q?XTKJ0GPstv1GodT+0aHkw3oMqy7BKvKW7LnE8IH4Jckmuhv+lA16yt55zMbX?=
 =?us-ascii?Q?7coEst8Be1ldiWYF3gUFbkGGT/a2bb+DU7nsNYob46dC1Hfe1R18ZI95G4yx?=
 =?us-ascii?Q?4sUG6ylm7b3X2z/K/1P4WRF5Xi6R/EykAHnODVFOWJTtdXUQF9oUQengf910?=
 =?us-ascii?Q?0481FJuFp7R8yxPseBJM+1ljKqdU9i0FVAc+debDk0s606Nc150l0keTS+5K?=
 =?us-ascii?Q?yXHZCCoI6FkUthrxkaqZBu1v35j4OQ+u0haNda/rYrjtOQy3s9Jqa00t+e2m?=
 =?us-ascii?Q?tyVb1CeGBkfGryihbtmq3jU+KH560Jm48CZJ/ZWf2j4AxBfLD0iMeuNrdtTv?=
 =?us-ascii?Q?EIZc8TBhByjcAuCcbMdx2gePhctmBh0FL6XbrhqXzts5r1zMhx4rj2m1Yt5s?=
 =?us-ascii?Q?S8wNyKaNEXLTCIwSB9NOZ/iVCF8uOr+lRHPXIJWti6Tgmw30wVC3+gue2ybt?=
 =?us-ascii?Q?DJs1fM7+hUxv1YCMi2qgKdmT+yo/RmW6vWbc9WUX0SxPgfq060gbdctC1EVf?=
 =?us-ascii?Q?6x4TU/YB5VeQFpEBgflSSXpj4PqE5GuzLkWpmPys710TbLxEn2uDgztjbaSM?=
 =?us-ascii?Q?lSrUwcaiLOivIAm/vrbPIghPjCsZSFZAxP8mgaJ1ckl2rYh9QB69SxEX9V2L?=
 =?us-ascii?Q?lvM5oOPIfBjDSF+XtHDN+GX/IccAG/ZxsORpHtRQtwtFZiGoEkKjC9aa5JQv?=
 =?us-ascii?Q?Lc/w9gV6kJg14IfvZGSf1SE4J4E5HndIQUeCsCl1DrrqY89fg/FfR/iv+QZH?=
 =?us-ascii?Q?8ifM1cXFV2A4g53WDXsUP+ohsYWz22OLB6yHKLRRd6Y6eI7z9Fd9ra55iFtc?=
 =?us-ascii?Q?F5bIpuaHuuKvgTPGAU2NOu/pktGiHHExm4TMaP4wOppT+pcvZAf4iRokgrNn?=
 =?us-ascii?Q?FYvGlCs29MJ1ugHQAQkHxFOlW+xG2hDYyMDm5IaYzhUVW/24WFfAt4DKd1C8?=
 =?us-ascii?Q?uwGZ4YWJeJduowhx5ddhtcRfAWTkCjlc6rBm5gS5qBvv//OGrrai4yFd4HBN?=
 =?us-ascii?Q?fxAIGcGR6CEaRryApT909nOQxMMbAbQCwpgMYvbYQZ0UswhgEsen/Hiw+C6H?=
 =?us-ascii?Q?xV7XC170srAEuGMqFqwvzWGD81x6EkasUCmZGysTX3jkmAKKK/2Agx5g6HIG?=
 =?us-ascii?Q?n6P24EjEOwfDewDujWXZh72acidLeSN8RWKO6b/79jt3dASgu8LTqsZRnwet?=
 =?us-ascii?Q?gS+pVU6sa2bc5yqDIDMqRWcNG7NhFJDP/sZGR+x7Fs0De80NzhwJuRIe/9RT?=
 =?us-ascii?Q?xkgmBkowfDKTo5jC+FZG89fyDkhl4+QZ63DM7QnfPKSIwX7T39xVbR99gVjC?=
 =?us-ascii?Q?rHge2TQ7liwgAlvE6yWT6YM07VInnW3GnmDEJABa56o5AJCXC0tr5SkF1crM?=
 =?us-ascii?Q?el/QUmPEJ4hLDdtw3GC1EXmWzCLYxJsfmN6dvO5u?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fce8c13-fbee-44ef-a4f9-08dae9b79285
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 16:13:07.2240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ggq8N7PelTWFGMhNs0mXMHg5HwF1LEg/sfwdry/bInDmbKxj4CQKZh5g1PLCRir36tVOKW9nvZqwqm/ee+wztQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6651
X-Proofpoint-ORIG-GUID: 5O2cTTOjVFqmdHFxJD8-3sCrpnR2gYer
X-Proofpoint-GUID: 5O2cTTOjVFqmdHFxJD8-3sCrpnR2gYer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_08,2022-12-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=590 spamscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290134
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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

Yes, the formatting is correct in patchew.

I'll include these in my next PR.

Thanks,
Taylor


> -----Original Message-----
> From: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>
> Sent: Thursday, December 29, 2022 3:28 AM
> To: Taylor Simpson <tsimpson@quicinc.com>; Mukilan Thiyagarajan (QUIC)
> <quic_mthiyaga@quicinc.com>; qemu-devel@nongnu.org;
> laurent@vivier.eu
> Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org;
> alex.bennee@linaro.org
> Subject: RE: [PATCH 1/2] linux-user/hexagon: fix signal context save &
> restore
>=20
> >> +        : : : "r7", "p0", "p1", "p2", "p3"); }
> > Put the curly on the next line.
>=20
> Not sure if this issue is on my end or your mail client, but the formatti=
ng
> appears to be correct in the patchew:
> https://patchew.org/QEMU/20221227153447.2729-1-
> quic._5Fmthiyaga@quicinc.com/20221227153447.2729-2-
> quic._5Fmthiyaga@quicinc.com/
>=20
> I've addressed the other review comments in v2:
> https://patchew.org/QEMU/20221229092006.10709-1-
> quic._5Fmthiyaga@quicinc.com/20221229092006.10709-2-
> quic._5Fmthiyaga@quicinc.com/
>=20
> Please let me know if the formatting is still off.
>=20
> Thanks,
> Mukilan
>=20
> -----Original Message-----
> From: Taylor Simpson <tsimpson@quicinc.com>
> Sent: Wednesday, December 28, 2022 11:35 PM
> To: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>; qemu-
> devel@nongnu.org; laurent@vivier.eu
> Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org;
> alex.bennee@linaro.org
> Subject: RE: [PATCH 1/2] linux-user/hexagon: fix signal context save &
> restore
>=20
>=20
>=20
> > -----Original Message-----
> > From: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>
> > Sent: Tuesday, December 27, 2022 9:35 AM
> > To: qemu-devel@nongnu.org; Taylor Simpson <tsimpson@quicinc.com>;
> > laurent@vivier.eu
> > Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org;
> > alex.bennee@linaro.org; Mukilan Thiyagarajan (QUIC)
> > <quic_mthiyaga@quicinc.com>
> > Subject: [PATCH 1/2] linux-user/hexagon: fix signal context save &
> > restore
> >
> > diff --git a/tests/tcg/hexagon/signal_context.c
> > b/tests/tcg/hexagon/signal_context.c
> > new file mode 100644
> > index 0000000000..297e6915a4
> > --- /dev/null
> > +++ b/tests/tcg/hexagon/signal_context.c
> > @@ -0,0 +1,84 @@
> > +/*
> > + *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All
> > +Rights
>=20
> Since this is a new file, only list 2022 (not 2019-2022).
>=20
> > +void sig_user(int sig, siginfo_t *info, void *puc) {
> > +    asm("r7 =3D #0\n\t"
> > +        "p0 =3D r7\n\t"
> > +        "p1 =3D r7\n\t"
> > +        "p2 =3D r7\n\t"
> > +        "p3 =3D r7\n\t"
> > +        : : : "r7", "p0", "p1", "p2", "p3"); }
>=20
> Put the curly on the next line.
>=20
> > +
> > +int main()
> > +{
> > +
> > +    struct sigaction act;
> > +    struct itimerspec it;
> > +    timer_t tid;
> > +    struct sigevent sev;
> > +    act.sa_sigaction =3D sig_user;
> > +    sigemptyset(&act.sa_mask);
> > +    act.sa_flags =3D SA_SIGINFO;
> > +    sigaction(SIGUSR1, &act, NULL);
> > +    sev.sigev_notify =3D SIGEV_SIGNAL;
> > +    sev.sigev_signo =3D SIGUSR1;
> > +    sev.sigev_value.sival_ptr =3D &tid;
> > +    timer_create(CLOCK_REALTIME, &sev, &tid);
> > +    it.it_interval.tv_sec =3D 0;
> > +    it.it_interval.tv_nsec =3D 100000;
> > +    it.it_value.tv_sec =3D 0;
> > +    it.it_value.tv_nsec =3D 100000;
> > +    timer_settime(tid, 0, &it, NULL);
> > +
> > +    int err =3D 0;
> > +    unsigned int i =3D 100000;
>=20
> Put these declarations at the beginning of the function before any code
>=20
> > +    return err;
>=20
> Before return err, do puts(err ? "FAIL" : "PASS");
>=20
> Otherwise
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
>=20


