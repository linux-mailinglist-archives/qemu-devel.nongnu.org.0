Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC46F8929
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 20:59:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv0e9-0005Y2-Uv; Fri, 05 May 2023 14:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pv0e0-0005S2-TM
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:59:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pv0dz-0004cl-14
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:59:04 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3454iA3X011717; Fri, 5 May 2023 18:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=J+mgPAYJpRtA3NFSUDElUOM1ewg9OIY5TCQHitcV8jg=;
 b=cPiy+7bcUKxhRYsMBj1+xuSCxywdw2tR5+0R/oE93x6QuzIkrTIy9PvxnauKSErUtQWI
 2OP58o2mO4YJJ8F7UmtFtzlRC04zebcgu+3F/t1/TkvjmH1wj/ol6W/8i6LE9Idz0NoM
 PnQSYAWU1EbvhOMIgbsjFyK+x/8iHfWPEbHqogo77M2d6QA+k2JluXg5Tvk2YOl1BCzi
 hi6Nvyu52jJZ7MULiOQtXr6n+GeLGgkk+RiZnzFk/HuCSHzhbXlBeZlDvnPuqkxNYQsR
 Q8WW4/t10R6EzjnDbSt6w6CjL5O5cWQ7SVjhnnnLImR8thNSqVxrX6RrTTboTBmXowMJ 0A== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qctfq1tet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 18:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrPm4jIMHjNafi8rO9GKTvzMuwf+t9C+NVpUqS9MeS8bSz2ee5ZfhBc067KF+TyZ7TobDEduq4Gr/6RMhlyzi6SPWFQN0gN8+/xSTqF1wAKVMayOX+chZRHYbutIeNWyoFDLA96n/azLcUbQ9oStx1xXztdJ4gBxMJvitOEJLjYwT2evYdsKtW4JzYqbuoXTW/tZAzeZqJlYCgypbmVk4aMsKWyh8GKgzyzZ7boUpTwewQEz+fWgkoQ9rFQ99jUuyR8o4gujLJ/wqcPZEgxU70nqkxN0AEIqb4YEhDNx1IAaswzN+KUjQ1rVtSZYYnKgoDC8w+2tkmT4fJ5roeCnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+mgPAYJpRtA3NFSUDElUOM1ewg9OIY5TCQHitcV8jg=;
 b=ZH4yvIfQZNNjpfW76KUqnfIW3aiJf8bevO1BSQ3ArSaJWFehyrytz5YMX+0mYXTeLA9/i4T3gSOS/8Z4udIEjtDpqQ5jUi2fb2ptQ9cIFQIOhJmgD9obJZdnSZKTzkl3iFeGyoYnN8TX0UY4vTpM3w999JQJunsvS2QkhMM1tgnSf3X1U1z/D8iF0hEkmxJx5kI87cdTTD6VPOaud5E1W0+IgEwKmgYrJyAcC9t356YpdThZSAv0WfYSLCZF2KieVHDQvpIrh0n3RmE5fKr5DY3GmY55p2LKE8bYkvJnAXkti1iNbfYYKd94nZ+POtEAwZUyFAFQrbRhvFliSaCOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN7PR02MB9378.namprd02.prod.outlook.com
 (2603:10b6:806:346::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 18:58:54 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 18:58:54 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Subject: RE: [PATCH 2/2] Hexagon: append eflags to unknown cpu model string
Thread-Topic: [PATCH 2/2] Hexagon: append eflags to unknown cpu model string
Thread-Index: AQHZfrmwl6uzxWTBKUypb1+Y53IgXK9MCaMQ
Date: Fri, 5 May 2023 18:58:54 +0000
Message-ID: <SN4PR0201MB88080B7AFBEDB7F5374AA283DE729@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <cover.1683225804.git.quic_mathbern@quicinc.com>
 <8a8d013cc619b94fd4fb577ae6a8df26cedb972b.1683225804.git.quic_mathbern@quicinc.com>
In-Reply-To: <8a8d013cc619b94fd4fb577ae6a8df26cedb972b.1683225804.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SN7PR02MB9378:EE_
x-ms-office365-filtering-correlation-id: 145d2668-d8f3-4fba-f946-08db4d9ac632
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: drHJ3a7nAshhGfLUo61FNIWBL91LBIJ261DG95+pDKVTj0tvZAeVjPLcuBSxHhym5+w1XQSmRe/I7ZIHC2gBo2D74aYnqbAtgTRVjidH5TWXlvvsoJxWTTlCoOWTwjEa5yvAxU9ipAktpjSg425wKcLk19//IL+LV0XlvwJOKdtZ0QI5TWIBSa7vIDmj46Lv/mjdFApoiJwe+jBvi5GEL+NpgY6hpeRc+iascMYRkyZrJtdZ550CM7ZyLj/6rO+gYpk6WrZEWcDybx6RYtYmkYNaU3o4LNlgiI8TfHd+4uk5HbBEcQZiEAogbsT8Wx7n69RvZBAFVmlx0lFF52oMF/XdRxdURLyeWCDLHPdYBumZFQVMtvs9YSdqJU4pPz7g3X2dngOxNaNxV4r+evjgcZ5GXfBcCRiAw73MCeTqxGZaIS1Yt1uNgKDmzXnsIa7Y/dboh/tSLsmCtOCjEP7PcyqPyGSdf9QU6zMmmDVkzGX5H0e07/1VAY4oyfbIy8ddUN74tYv8kTYXihjoPAq0QpPUsSBtVB8j3LFHruJM7kflBB5kz9WV4bC2+JiUs5loF22FOjrfG1GzKTNoQjf1ihvYGPCwn078c/JXauxM4ojxI5LLdNeMuI+dHz3x/kmc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(66556008)(4326008)(76116006)(66946007)(66476007)(66446008)(64756008)(7696005)(478600001)(316002)(110136005)(54906003)(33656002)(86362001)(83380400001)(6506007)(53546011)(9686003)(26005)(71200400001)(4744005)(8936002)(5660300002)(52536014)(8676002)(41300700001)(2906002)(55016003)(38070700005)(186003)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BAaWW2Gu5ZMkfEl+h8dZqtSeK1Fbhw0+y4YjTcvUDECSAMieIIAlwo4qciG4?=
 =?us-ascii?Q?1xfwu0G3IaSSHwIP+Zb2Jte65zq+KNPjHjDP2ozKZdNhUwNmzLkY90fwH/8x?=
 =?us-ascii?Q?HOFoTCBB/V0MQYR6XnlLIvYkjhbAb4PN1mP6LR0+pt0Tuuo1yrHHx7EO6LHQ?=
 =?us-ascii?Q?qVhbR2e49fMRz0IVfQwRMYg5h6b6MHFNuYXgnmQ4SIrGILue+xRE6d2sRWC3?=
 =?us-ascii?Q?cXGLWy/4VkB+5kSxYAv50OueE4svff2Wl8fJC6e+Kq1oP7/cSTLMpdszkQdE?=
 =?us-ascii?Q?YivdoNnL1hUeWIQEdpQM9aTNmPjDpgvt4zWX31RvWpAjXBX+G0wHk/eKqf5l?=
 =?us-ascii?Q?yVmJqJcjVTpG5IcLTxUy37HwEkUcyE6IfVolCqXwrYE5cwSN2gZz66JdXELX?=
 =?us-ascii?Q?2xsLE628hMwn7EN2jTE6r2kTzdaJ26QLBcovom0NDeIrkPCAU1A/hAeMq+tZ?=
 =?us-ascii?Q?J035dOby5WjZDm4D/lZOkjACMAsy67rwEu+7ly76CPky1fkYIjXvQvONaaRR?=
 =?us-ascii?Q?fWEDgSR2lyS5dK+v7+I4IVZzv4IAv09jeQQjiuTWw3GnHt83y7WXvj2855kl?=
 =?us-ascii?Q?ZN/1rjS66t84dld3cGZknLEiyC6DJ6HJuofi6PfLr4UDGEA35tB2PkKdJ1yd?=
 =?us-ascii?Q?0jkePcq5khcpgggRkIBK1eabSCMPIkd1las1+AdTMcK2MvysqhmYNouh8rMx?=
 =?us-ascii?Q?rlMd58KR2P7GhHs8wGpABOWl4CECqG3A+g0quDAJHaLsGApN4JbqrO1PqYxd?=
 =?us-ascii?Q?DTZ6ev1kg33QZ3uQytGnHKFeae8wgzII5Ro3DKwRwn+96c+QBt7uUA+N29s6?=
 =?us-ascii?Q?8GDFJ1i+xQZCUanOh+XTpgBKmFrC5AktNKYofm9ie+9U9u222Bn6O8UUedqy?=
 =?us-ascii?Q?meq8l2aWHW/flXZKo5zgujEiEPm+75vLHhgnGUA/A0zKZCln6lOobSqI+kMD?=
 =?us-ascii?Q?Y0v1MVaunAWKL+yUV9LuO/PqLU6ye0hLIuRNN/VeI81llUgH8AHChN6/+ZYN?=
 =?us-ascii?Q?m688l8tWuG/KMZS7LoETMxBfQqbkbEOlhjUile5LsHGZt9VQz+QxoESxSodP?=
 =?us-ascii?Q?Fam7PrqqRBmaAwOjmUOSv/RFwOL/rsrTrVQ0hoE+sUVGJM3yTCqtCDRTF01j?=
 =?us-ascii?Q?nV0Tjkgx8kka1nFRQXsOeMgGvhF6hefCVVelk5hJ7rOVvW/q3dEn3b/SagoT?=
 =?us-ascii?Q?xS/8OUEk7AIVNVUaKd2EDL6kGAJtZCWpJHTUF2YraFfcNfbVNDDavObhLrMp?=
 =?us-ascii?Q?TN8xJ58j7PV4u7Zxk+6cXbeGlVsmiQXGLaTm8oEzmObZnUKF/+r6sJOGfZet?=
 =?us-ascii?Q?DCvCkhXPUxOhZfkf883QgvkVf7jantKLBNHoP7wXIvcOFpQiymG446ceKHAl?=
 =?us-ascii?Q?QOqQquJFFt2eAX+0+jxSdLXr1auYc3Yeey4iRkOG8rThrGjWpAa8irZ2clDk?=
 =?us-ascii?Q?4bQi6iXYd8XQQ/jtR2rq/gLdqX94BHaDpiH8eyNlRa/VoqlSBeA7M9tbUOmk?=
 =?us-ascii?Q?ul8BBdMLQDo/Olrz3yLdl5R+2UJ/ZnLa3Tg8p0BgghSuHx7c5YCZXpROXaE+?=
 =?us-ascii?Q?Eo1lJqznTBj/EMd+AbWOOE4TrBb6r8bq1NLojDtb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: yG1EfHS/7MaWuUkSCi26F9Vw35dsLRb08fh5qk6fC03Acl4WuCoU/zNSnjRc34LVhRehwCg3lFub+Ko6zE38YWAZnUmtvlXFYRBHbhNyo+5qpqT4CpnG8rYfNznNAEVMZBgMCcqTx4dseXL16f7k87YAYFVcfAKIwZeukIuBdBzSXP7Tq5AXI/b64xC7xuaCKP40ypbOroBmNfewLqOGy2JyqchiAfKFSIj6YdUKy3P3myaDuOeJsUEYWvAuZLsH9UrRW3ojqXHCARb79uqNDdKblQkJs/fn384FAIuDm/LuPYqqYBtTmwN2ejrYODp9ygJXAU7qaw05vD4WJinN0oFmnXXQeVzQngUwpJ+ZrPAgKk3kTqmdR/25XqfQn57r/KmjONpn3/9lLaXmxG5t2cCJcgmBCTDwMAjiY/mNv6DrlgppI9EFtpXmhlFQ9mZS7MSRUtVWbnahCXmUi4/ZCvv+5ghjt2aZjULEK+rEmEqerypGQ7V6jf/PZodzRfeJNkjnR5f+/qZlZIrPUDQyMweRdEy/hMzI7x0R2xGDuahsEopdgX8qBL2z1464OdqFQg8/f1lEgGGGnJ7ENourBpI3ls7jj2f1dkK9MnNPDDXZPlqriozK0T84kgIxrt5c1CqK9R7H3LcOpnEn2Icl4PN711ZuuSCIDj+oGph/GUp2F+k9omnKKxdErCizSrjCjr/PFdUPgoWtZXhfj8Z7fI4f6IsS/ABJ08b4srJWv9gmQ/zYSB0fRaRcKJPW9QdUw1koN8l62Rmt8boQakgV2ZHAnSrPUGI0En9CPYsk3Q0=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145d2668-d8f3-4fba-f946-08db4d9ac632
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 18:58:54.7965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3XH1NvgOez2Ipxb0KP6YaDx4TQICAM9bxw/YR+jngAtCC62Wn3i6WxCrEnbYsjSc5T/Vk+aWrw77xg43K1lLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR02MB9378
X-Proofpoint-GUID: lDc1b6jJSwucTA9sfLzYmrZ7loS3ygOs
X-Proofpoint-ORIG-GUID: lDc1b6jJSwucTA9sfLzYmrZ7loS3ygOs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_25,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 mlxscore=1 clxscore=1015
 mlxlogscore=214 adultscore=0 phishscore=0 malwarescore=0 spamscore=1
 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050155
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Sent: Thursday, May 4, 2023 1:53 PM
> To: qemu-devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>; Taylor Simpson
> <tsimpson@quicinc.com>; Laurent Vivier <laurent@vivier.eu>
> Subject: [PATCH 2/2] Hexagon: append eflags to unknown cpu model string
>=20
> Running qemu-hexagon with a binary that was compiled for an arch version
> unknown by qemu can produce a somewhat confusing message:
>=20
>   qemu-hexagon: unable to find CPU model 'unknown'
>=20
> Let's give a bit more info by appending the eflags so that the message
> becomes:
>=20
>   qemu-hexagon: unable to find CPU model 'unknown (0x69)'
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  linux-user/hexagon/target_elf.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>


