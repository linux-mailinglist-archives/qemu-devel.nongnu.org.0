Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FCB6F892D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 21:00:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv0el-0006VH-3z; Fri, 05 May 2023 14:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pv0eg-0006C6-ST
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:59:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pv0eW-0004vw-Se
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:59:43 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345Hbc4P024209
 for <qemu-devel@nongnu.org>; Fri, 5 May 2023 18:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=VE/A+OBRYDC/eyjjd3Fu7ganQHu/pQpFdcEbu7dXm+k=;
 b=S7RIflulH4lAoE+ZguhvFZDRFnNnHYdNZYlzNhtn6+lYgnR8/+8XMiI8sq9280f1ij7n
 M6gT8bdGB3MSK/8VSgnvBlIFmT8jn9WnDmkyYKZAUQMtxdQo08Q7luwi6kMV8Ck8GDGo
 lhkC1MoIjXrkee6hvSaueePUQGXj6Lz9lGfkHvnVsXpUGt8SG538VaE7FG80a8eD3WGn
 KeHSJAFi+nYgdJWFUixsfdt+ER/+vqUWk/tpi6BatQM86xOxJkdzEjgGEMMd3szrtMtu
 IrbMsGgu1KK8LqLddeyVEqqO4Dl3x6Oc8NlTB2DI7Oezl0LtxakYobdL9ZL3qxkAYh98 MA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qcumk9nu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 18:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6/nnHF3zkt8METM+DNDckvVCPhyffMo+Es2Np6Wwvb310KxPoaE3O9LY/i8/hk1FxNf32MVAV+tp5QTbS95lj9JdeqcTnE8l7YrOC+JfTFSH8IhFcRvv2RThduVXx8I/+QC/lPllx4YUPU6wRe2SxNwBCuEk6/pRanqIsiqLCgwGbLutrFGM004Ky8fXUFgZint5iLe2UZY3Wd+BF6AmJnmtBP/L2csA4zzjNexTBDNzuE+3ZXcFsDp+WK9y3qn1hXHklrldAmNqL7WxU21LGkwzF6d5TgQdZhOOb2eu++5NeImt2NscwU9Hj8Bl/46SkKqo9fzg7xgToVxycpcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE/A+OBRYDC/eyjjd3Fu7ganQHu/pQpFdcEbu7dXm+k=;
 b=RQfM8NfcOjEYHOByZmPMMal4xuyInE3kWT5VEw16JoDtG3XQPnfqUlGm1mMPmzUxhJ4KD/zJD92pKGQRnU3BCvXJr5tvLWRoiUG+CZRdQM4N1JaT8AQtpFn5JHaM4UpGsFNAil+ZGru43rJP2RyBrj8OfB6tOQOxlLRkwnJBTHJ2sJVDsUNVYzmO7ggqrq9yU18IOaXpA+hPoCqfNDVaxhZvhp2Gg7poR6Dd4x7KGj01pkKKIHfIlTDrv26EcEDoqlOIgtlVoJNx9EW/xCfOiDHliAaj2dIdnV7/99bOwSP1vE0YAC4RP20hRLPWI90yZcW3oaTl5bYgCZYFNja4zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN7PR02MB9378.namprd02.prod.outlook.com
 (2603:10b6:806:346::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 18:59:31 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 18:59:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH 0/2] Hexagon: improve output for arch version debugging
Thread-Topic: [PATCH 0/2] Hexagon: improve output for arch version debugging
Thread-Index: AQHZfrmwB9afyCobPU2gkqeerxeXLa9MCd6Q
Date: Fri, 5 May 2023 18:59:31 +0000
Message-ID: <SN4PR0201MB8808EA5F4B38D25CB81BF09CDE729@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <cover.1683225804.git.quic_mathbern@quicinc.com>
In-Reply-To: <cover.1683225804.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SN7PR02MB9378:EE_
x-ms-office365-filtering-correlation-id: 939b49d3-9528-4814-7282-08db4d9adc07
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DhyJ4YUwyk2660ZAV34pP91tX5yzwS/HcZrCl5UdU/fhaKnlJAi6TUCSc4eitRmDGReIBF7utd5x7rnblrFpBTa7d3/DWrm0iVfOUr6d7OjmxjtMd/aoql98IX+wowNzwDsL1eHYb9JuBus4uGH4ITiZz0DpSETgh36fJX1VhNDZXxisdK2bZz5/oIhLCIE7yAdrZaOYUEmAKYW5ggl/yGm3HsQDafwaduyic3H2LadgQybAh0tMPAJQqYtrOPwkKdKumrh9i/LmOwlt+U2nHaDRtN5HvoKiwnj9gwOnjnWsme63M6kDeaIqnbuEV0Tg81YFAUuP0wjcklT4mKFy/r9gwOwOBzUQo8Uhz6DLKCP/FBZrIkgqnVsetLlGnekDXCMfP0VbvXcnci80+r2MTHHKHKwJjCj0RVoC9Ok73/ViFbe38Zqy8UIPniQyFhZOCFLNWCjOkarSzcjVzhgmYJVNsOTYLgbdYoLX4wauYoBrE2KzhxjKTnAEEYBp4ZbEDXhyEAn0WYcTjxO/v4oRGmEYtzvaTkndZhLVcjTQKNk0gRzMu6oHyjcFiauxhYcmDx2xkJByzOVUWkTP68QAywj/F+7nWivtBdctgrUPfS4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(66556008)(4326008)(76116006)(66946007)(66476007)(66446008)(64756008)(7696005)(478600001)(316002)(110136005)(966005)(33656002)(86362001)(83380400001)(107886003)(6506007)(53546011)(9686003)(26005)(71200400001)(8936002)(5660300002)(52536014)(8676002)(41300700001)(2906002)(55016003)(38070700005)(186003)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7/7Zej+hySksZgF6p+JT/Vb4kwFQF8WjPUgl9IM3DK0n3ijga29Yy8+t08Rp?=
 =?us-ascii?Q?ZpKRR40sFZbYwN2O3Lh1oqQQP6378A3mSDf/Sg29ftDYYKuu2hSR+DzyvI7c?=
 =?us-ascii?Q?lp2luoRNF53ClYF6t6q7DEG6utycbx/1JnAlM6JeeM+lE3Hy8hZlJnH/4VM4?=
 =?us-ascii?Q?gwwMVOyON9vLh/IchrsjAUdX9DiqlH6pKx1LxLCStDK3Bl7LK0bgUyKl106H?=
 =?us-ascii?Q?kQFUSBmMGzfx1gmLSU875naf2wcCpBL9D90BuQn/xB+1ZJYQoeMeykOuKPA7?=
 =?us-ascii?Q?uul3hK7KCqg+HT0KIEzWbjxAJK4pWWR3vhyK7DpSLyk7j54XYa4TWYL8ikfz?=
 =?us-ascii?Q?H7hjRCefpTC3G8UEQ1RZJJCuIm6IuN7HInCCSGXJjAuGcCTH+HMNdzh+8D/P?=
 =?us-ascii?Q?UNLoiF+dv0YCNaLx54CiqGrly3FKshiQgYG6JgiXcHvf5psvbaIRd+17ym49?=
 =?us-ascii?Q?gPMdhu8BXzEw+nO8/wSowSBG58WyhsnLJeAFaCec/sGJKvnrNgzOFS+ZKMaA?=
 =?us-ascii?Q?4TNiVur0pG6I642oWoKt8SgNZwEmAlGezjpCH+UeBcAEJISj6LiQ4LZ4KOC5?=
 =?us-ascii?Q?P5XtdS0CMify15/xr6K1vwsKTfxOVgAOhsQPCbHQ6IQmrbUq8AE4WYUF5exb?=
 =?us-ascii?Q?TyNcCa55RKKdCeKagQbsXg+s1rHPzPbL9AI3hMa8o2xFg1qxeUoFvJVaWCu2?=
 =?us-ascii?Q?M3oy5A8jJaulmwOLqBdoFRyWCAHzj6N9xxqJQaLWmSrpa7WFSfwPU269U9E8?=
 =?us-ascii?Q?YwZ+jLNG/pLmFMpkftpVQH1WQrIpWwGZGxHucOTvn+Nvjsazft55PVJJUAgp?=
 =?us-ascii?Q?fDqFG2SesClsFxlJz1/5EYu8ETAI2sfsbi+VNinMvZcmWIaeMsHnzj6ypqso?=
 =?us-ascii?Q?R6pel3kkQQP3CgpUfMsmjQKHK2QxwAmCRC9oLjbq/+7ihdwOeCWlgRuGdLsl?=
 =?us-ascii?Q?CxMZ1o1Mr43v/VGzEc/45KGF3jYFawxYID7PfG+lsKkVzuFpJkj5IdlxFWTu?=
 =?us-ascii?Q?4sFW2YkFhQOD2TVbtCxvkkJSeGslDV2qdnvhMq4dyY86FSHIaA2fScuo/eyx?=
 =?us-ascii?Q?ggn5H21sLfGmxpLZXLvHkZRktEXXdOyzP0GhEMdMvW7t4l24UF0io7AfMwze?=
 =?us-ascii?Q?te4fG9r/tUeSckn0vWUx+0lzGtdtTAfcl3wGHOq4NdpVzDC+WTHEYTpYYlM0?=
 =?us-ascii?Q?tEtTPfX4vP5t7EL47jvqlK+AHVdp2vA0cwzv2gloTFfpjjXX564qgaJ0GTdE?=
 =?us-ascii?Q?n29J6uPK1Y9cwIqpxTvkFaSMm88gxQruBIKsqJeZ+O2SP7g2Fe9QVAXCZxK1?=
 =?us-ascii?Q?Dx0HUMcjJucIQPvVXhbB4sYgmknkP3cb3OOGZIUBLv7welSZQtiMKIO1pwoU?=
 =?us-ascii?Q?nrdn0BqI1tIbHDFmoOgz9cgFQlKxMqf8N4h5msG69bcCnvlh1Gq7J2ZOrz4P?=
 =?us-ascii?Q?GVH3N8P+Mw6Am6cVo/O+jqL7hLaXQtt4xcSsYwc2cDTTB+gcFks3DbrLrJsE?=
 =?us-ascii?Q?ml6rQfA0Shhwivfu5k9i5cwh235th7qIOYpj4ewJcrUaIEvtxRV0U07zJiXR?=
 =?us-ascii?Q?ZUWwFsLM3sYPIVZ9sk76Jc05clh0aKNG6Y1bLFyA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jwSZAQQUPhOySfz1uDatPHLhn0LDz07qJVpeNikwle2qXsSeYHaw8wCwYBdQ6CHtcqBduNfzF23SyS95o1nZKWIN7/LqaPFM5XKGkcb1wtdJ5atwZD70MsCN1S/FzWtL6q43cYLegEZWhlQ/iIGNdE7HKDfOgQY88trEW88ACjU03oGZNybV1AwH/PCFogOza8WW4FB9lyqpu53vx0QbjZY2S3APBVXxAypIRr4JIsPw8zKqf/SEgu/bWrSgamcArNuLDDDLy+CAKOlDl0QF9AdpGcq+WIEpQ3elp4bP1I65uey561RuwEbFA7xrcK1GGESwDcVIJCE8//H0ZyvpLJrn/Sby1eGPVxfXEHRUIe0KHb4Olid+2Cxqr+UrNHOa/g/rTDiW0Sg+3aZBQfzNjcHn03X0Cn1Q0VLgWLDVR0FpTsfe7jKLNbwPCsDHCizUhfyXonenl55sKssrnRozMdiKKetie0o/W6rdmNKIuIthYeIhVlW3yU+8TcVNp++Dv4G6bwMFQMrrcQi/wtj7rGP7GHNKtnxZntjg6qCA+qg4cJZBtAA5uAmERfrOkLapFZzNBymcDGN95Ami83lWuZvVhFGxqRkynZ6yDTDtG6rkondee8Vtq7+7DvoqevjkvztJwrF3R6R2gAvU9B1CyqM/hNDjD16+va5nVnkKF+htBb76PfL0g+Xqa5qeGFVKGGrPdjrGT5oYjljK74fGPE0bcXLPHQZyPp9NfbbhTLyvZ8bQabNhDGq+1AcDJ88vXtbMzuqwRwbAXh79MJVZaA==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939b49d3-9528-4814-7282-08db4d9adc07
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 18:59:31.4451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGcy1p5vNbc2Ic4eQRuAse1g5UBxL1mOQJ+WkRk23hrafNb+v3aEf8noERHSyfi4EzlhN6A/ERog3oOC5jvDdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR02MB9378
X-Proofpoint-GUID: FMzGzZfp9u9lmFaQh9aEmoBpHmMSsk2t
X-Proofpoint-ORIG-GUID: FMzGzZfp9u9lmFaQh9aEmoBpHmMSsk2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_25,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=457 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050156
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
> Sent: Thursday, May 4, 2023 1:53 PM
> To: qemu-devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>; Taylor Simpson
> <tsimpson@quicinc.com>
> Subject: [PATCH 0/2] Hexagon: improve output for arch version debugging
>=20
> If we run qemu with an Hexagon binary compiled to an arch version that is
> higher than the threshold modeled by qemu, we will get the following
> error:
>=20
>     qemu-hexagon: unable to find CPU model 'unknown'
>=20
> This can be confusing ("Was qemu unable to read the arch version from thi=
s
> binary? Or did it read but does not know such version?").
>=20
> And running `qemu-hexagon -cpu help` doesn't help either, as it just erro=
rs
> out with no output. This patchset tries to improve this process.
>=20
> https://lore.kernel.org/qemu-
> devel/cover.1673616964.git.quic_mathbern@quicinc.com/
>=20
> Matheus Tavares Bernardino (2):
>   Hexagon: list available CPUs with `-cpu help`
>   Hexagon: append eflags to unknown cpu model string
>=20
>  linux-user/hexagon/target_elf.h |  7 ++++++-
>  target/hexagon/cpu.h            |  3 +++
>  target/hexagon/cpu.c            | 20 ++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)

Queued for next Hexagon PR

Thanks,
Taylor

