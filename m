Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C522666A54F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 22:48:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGRty-00058u-By; Fri, 13 Jan 2023 16:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pGRtp-000569-ES
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:47:46 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pGRtn-00006M-Mo
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:47:45 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DKsWin024510; Fri, 13 Jan 2023 21:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=Cv0VUY9jr6YCapIzooviWFuHRP+XRjERl3zayu0uncc=;
 b=pC/OxqcFzSLO3b3+n+KCzK06thQXotnczZv/L0LI7Kddu+eaAz/q3ktq3jmuEfanJ+Bx
 iWb9dGWKAzDEn4pHQ3EkKy03kKW6oGOi1mbhu3khD8/V2TAUauGRUTTx71wf83ms+6F8
 3k/v5m60fGpMQ+Eu+8Npm4SYHZU7hrCd5kdPosfN61b6K7MGGKt3wmcvPyZU/0N3Zbgl
 cJZlsfO++8KINn/p4ZxlT4us7WMoP0pThOiyZ1DbuuGa0/GLCDR7uCNMRutb6i5LFvBY
 vMmWAlNCmMgAxMusPydkfIry7tWc9iSIlq6nnpUgj+8zbkrJJrrCf9mAN+f87oVu8p9b 2w== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2fwpv3jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 21:47:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jrr7awtnmiOtGGUAXLqJjYm6dGmQOilJ2XbjZ4rK4TrPPVBJaIoAQ+hq7saaJDlnVbumlLw7rC0/7PoYNoo7ezT/JF+P246tmZItrpRrjFfInduHxfgQM06Ey8zX49e9IBwClL+X3iIY+/3iomHjEsAB1888Xzn2OCAehiyAX0B9tBT6XqstTklauLvWlcGHkCyHBNt++V8OOrH2y2OxGLmN83nVLPUW91haMs/h8u/73XwJ2ykFNIJD79+m/OiNIOaoBhOVOhzzf6xy25aiejAJ9KSzvZga1IM1GMxnu8cOf2ZiJ4JMZ26xk43UMO4DIwtULWDrCo/dwMqQF/zH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cv0VUY9jr6YCapIzooviWFuHRP+XRjERl3zayu0uncc=;
 b=D8vt67bkuxvez+hO0uH2qvXE90Ra4arr/ETjS0QULR8G45XxW9Jiet+eg+ExxGhuq7ti23dQEnbczEZL+0tp7ypGh+iNanu8qwVfA5wfjyepiKvb98IAg5qAJVcLuvPww9AoDamyfqQO2gDkzbf1bvp3Ruwl7J/bWTucff/9ixV2A6YgjPqDY67FIGOAMKixUB2jNHGObCrJxGC2zREUCL5TwEvhynR53BXJaNCmv6uebo/MfUBReCKyfcwQjhsOzJf3DkPHQVrnRpDFc3xzA4mh5D2XDpHtX+F4wLKiROL7jxqczAnlmUP2l8MdMsU2tx/UBAZgFqKo3JvEQC5Jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CO6PR02MB7508.namprd02.prod.outlook.com
 (2603:10b6:303:a8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 21:47:38 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 21:47:38 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>
Subject: RE: [PATCH 2/2] Hexagon (decode): look for pkts with multiple insns
 at the same slot
Thread-Topic: [PATCH 2/2] Hexagon (decode): look for pkts with multiple insns
 at the same slot
Thread-Index: AQHZJ1R5OFERJ+65HEuz0a1DVAYVba6c4dyg
Date: Fri, 13 Jan 2023 21:47:37 +0000
Message-ID: <SN4PR0201MB88083AF156EDEF92AC508E51DEC29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <cover.1673616964.git.quic_mathbern@quicinc.com>
 <b976c19578a6aae55bda9b4fe21f91d88d924eb0.1673616964.git.quic_mathbern@quicinc.com>
In-Reply-To: <b976c19578a6aae55bda9b4fe21f91d88d924eb0.1673616964.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CO6PR02MB7508:EE_
x-ms-office365-filtering-correlation-id: e77fbd0d-461a-4ebd-10f2-08daf5afc9ee
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r7xsdvrJ66BV0yHKAFqcyV9bJ7n+n/H2c8BGWT2gFbsXvfOEjFGk+zOMIKddGSazeecxHW7Fxvo8wsqJOJ/7aBDKiEG3TYb16UPJ7FJNzqgPgfUsaH6JnAX3HpXoo2E5HLUkVvOQuQvXPl1NCwX6P4e8VzI2/0ihLO8f4oLgXTueXy71W3visf7xuCAJ6uB78od70QVnFrGBQLigbt1R1CifbG0CD5zdyZQF2uWzN3TNmMZDASpqajwL7rUwq6MOgx6y3Nperws1k3rPCEU/0WIG+edVNdJdbwJRP6wLTCQYfDeEspgV+Nv+JOBDzkht4OccGI8SbPkyTchy9SZtZPrhaJ2RbcZFxqV9JJgIJyP78TCB6kfexS2El9HP13eroeORK0goZJ+61ql+MMZvq5VxtxhNVDr/HqNigYA26J+5/6w6iNUaB0Q6EwWiu08czti7neBjMazXuxzPcGsNN+G3kEhsZPF5TkKlDP1p/vNb67Kj/9FKMEOpnue/Qg9PB2RH6o+qa0FmhjVAUFuKV3Zd4158B+Vnx3dG3tWSMuAcWecSbPjXO8EPfNSS7KyaVR2z11lqLX+DRex+1c7jk/UJg/e6UkiMoilb712t12fAmWqd+IES3caKOY6Rc2ULIDk+aZcVVoeHW9tYfKTSnI0m+IHvS/zok63+x59XnMVZlruS7dOpcjnU7HolxxuLmGO1/QUoYg4QM82DXfJFgg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(8936002)(38070700005)(8676002)(66476007)(66556008)(41300700001)(76116006)(4326008)(52536014)(66946007)(66446008)(64756008)(54906003)(2906002)(33656002)(110136005)(5660300002)(316002)(55016003)(86362001)(26005)(71200400001)(9686003)(7696005)(478600001)(53546011)(6506007)(186003)(122000001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ytSY6Mi5vGkuTedf5f4mbUyXcDIqSfSu8JKguloGMHZNQDrh3jw//LgJuGoK?=
 =?us-ascii?Q?G3u0oHjEnwHWMPQJ5FOG2WZqV9k9sa1w1lsjx4guQOhbGsZFu0VP8sd6PSmY?=
 =?us-ascii?Q?jhmuEOkURv85zlqzfRcYJt890CeKaY8j1MtW7Ihoibn7eMjbB85e1ILMVbgj?=
 =?us-ascii?Q?bwupgKt+wwrnpexKY95XFTVZnu0GW+cUsrxIVuUIwnCZJbolnJG3O4lqfBDW?=
 =?us-ascii?Q?0RdcMp6xxHmR0rckeWsk5TUOjfw1DZjZjrgHCF3t+MI9xuKhakYxpalsP5d9?=
 =?us-ascii?Q?CokHBEapclDDYLzTlnFXTeXvN8I4elp/BnLgNUjaJmUNp+1aNOzXpMPVenYz?=
 =?us-ascii?Q?oB37Lo+MFfG9Ba3ojMeSNw3ACnbaALeOdzmXtehZlSbXtv/rcK56MajYR9tN?=
 =?us-ascii?Q?gM8rOkng0/AAR15nfal8b9QBIGva4UAe8s8DaRzwozJ+4g+DF6Ials59Y/tZ?=
 =?us-ascii?Q?uJ2I2FuL89TRJx32LOlL+tqKY1MaHaQ36kLOYraCIJTQ4AjdV9kGs7qz6lHF?=
 =?us-ascii?Q?dpOO7MXdnj+5uZuBGMpN1MicHArr6VJs8tYAlJGnv/HnVC6gVBjUPqoWdc7+?=
 =?us-ascii?Q?Nc5Z8/1GorTYDOYhE5nJJ3Tb63lJtCK2HiqyCymgforT/XImd6UFxyeW5rTx?=
 =?us-ascii?Q?zUVw1q75GbR2+2ylCkUe1NH5DVBPhNqn5tOCW87OieSbrIxWqq/eTX1KJFoA?=
 =?us-ascii?Q?owSxKN+nOvf8jUCpfN/RxKP4zTfWkeeiyrIS/+BfgRIVdFl8kZHRHOZZsZwd?=
 =?us-ascii?Q?t6+dbBAucRtVGpDyTmH6wL86IGU9J5zymXxL4aSOuC0aCCOQyXXeekIfdbXT?=
 =?us-ascii?Q?UoQZo6qvMALL2FvyeazV21C6RnhLe/g33zbuUg60wq9Rp/B1QXhMblWDOFg5?=
 =?us-ascii?Q?4Ssnk5/6MxfnfnpPH6S48U5/TL+d27yiH55ZcwJiVp+Vz9ni8zpUHm+6voHf?=
 =?us-ascii?Q?jLuux0H7QSyuAgO86avwBy73wYL5Lf9JKQcDGZTJoAZVWfDpauw9y4Gsk6ea?=
 =?us-ascii?Q?a8znAppd7RdNfiCkpFAn0DSlhfmRvXMscANo3k5HPAdiF1qtJPGmv8KOURf9?=
 =?us-ascii?Q?e90YAbHJxIy8Tq3HgNl2OS8SIiVDl7Zshzduhuv7Pwb2q2Ckj1IJEmpZCT8N?=
 =?us-ascii?Q?rRy5tgYqRj1GksOp0g58gCjnT473Mg4zKVXheycCXNQPGiCMmOJFJsCsHdwz?=
 =?us-ascii?Q?6OGyaKe7DmWc0g40qwYO6SISOgBDmHI8YzoCWk9wLlL12q2p1Fv8yVZihaHu?=
 =?us-ascii?Q?C/08d+O1gHJ6bsGKyWMAweYN3ChC+vK0EViNtg7rGp3Go9rAaDcjnE+91ZIE?=
 =?us-ascii?Q?iI69jMQx/m2oAIYDMTCk7W/YvzpWQYm7bcAj/sg2OQpJOUthFT5THgWSW+vl?=
 =?us-ascii?Q?UEybUcPCH71NJx8Hu4NereO6WUN150p8eHj1NdU42jeg1nFuTCcEmBn3csne?=
 =?us-ascii?Q?4U3fz1iJjrvTF9r6PHqT+RsOjFWYlRmFMgh8txx0MInnRhAAW5fjQ/iL1Yd8?=
 =?us-ascii?Q?4ytKhsnpm8fG5mmDUtuVNhmS/gzUukDx/3X1ofT6uuxHc9PiN7rBmAV6Aj0X?=
 =?us-ascii?Q?5sPAWA4AA71LQu/EX0pHE4XUC46nm1PfpqIWuH/4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mBfKWFzWlqXze2Jr3ZL+dOXz+/E+wgG9lVaT3NKHUPMBVj7c1WeI9YOXC/ZMK9UHCzrD9jvQSg+a5rDP29vBQCTqupaQ5lwNFm9XYSn5X+pmkBqxoLffOYhqgyOzUjjIP2fttCRfWkgMco3dBbJVwOqk6VZVqi1TURPPQr5aSr/0Uy2tdQ+XXtFkwK6ivOHT7FhLyEobPBhozNqpRhkthEQd32+ngsAT+pdxTJkwxMaLWEm3scZmDz0mJEdGiw2j1UWKyeAGYZ+SqkVQbntz+wZgk//IrFQCwb4wrEpNM2AcSee+LvZd2P07ZcpDAPEZ37vqlz9TXEsoQWtPfVfpxNBA7I+mMgZMTfKcOfRNnDGBP5QZs2FRnk17uXo6SX3g1fmVk/PgdnsC7H8vwrZr2XLC1cxfYsI0gEMu6uq+9br9tHHAIjcA//JQBio+ep7iFeACPPNeozY6nSovhLJNsT6AWHWh0fgshzO7MIDWd5QiiqorySLBKDYME3wKzmFFTpah1yRqqwIbq8EclNph6Tw+nJATq2ZBNZLiSKQJyyEnO9SgSDTCbIYt3WLmQd44MVv+ZDyZ/gjh5nBnxLoxwmzFE4iXLtiVwhCb0DbZDGNauFRJWXDPfet1wmhngZfe3824nHWgTSxmfmtPRMvxQiV7Y6bseLObbWj2lAu7mD0GfSve90zwY7xjU+uR8ZVSxXFUzZoJ5YWCaHCM5wKX5N4nEdioCfE1kJBXsTRcT3bVMBEGviPTP1rl5xrhA9ZbzizYSwocVmU6XMN3MGKHWL5NTL4ADXhqMQqXcNrQqcQ=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77fbd0d-461a-4ebd-10f2-08daf5afc9ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 21:47:38.2094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FqXX0qpf4Y6ty0BQYBWdXZqhnv0ieqt/htiFDy64bDAi3m5uno3Ed/H6TTFNZRqRvsNizHtK2AOr+kRJXcZewA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7508
X-Proofpoint-GUID: BvSTVoSP5uoBtDV8-7n9tTlCS_nc_KGA
X-Proofpoint-ORIG-GUID: BvSTVoSP5uoBtDV8-7n9tTlCS_nc_KGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=625 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130149
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Friday, January 13, 2023 7:39 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; richard.henderson@linaro.org
> Subject: [PATCH 2/2] Hexagon (decode): look for pkts with multiple insns =
at
> the same slot
>=20
> Each slot in a packet can be assigned to at most one instruction.
> Although the assembler generally ought to enforce this rule, we better be
> safe than sorry and also do some check to properly throw an "invalid pack=
et"
> exception on wrong slot assignments.
>=20
> This should also make it easier to debug possible future errors caused by
> missing updates to `find_iclass_slots()` rules in target/hexagon/iclass.c=
.
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/decode.c           | 30 +++++++++++++++++++++++++++---
>  tests/tcg/hexagon/Makefile.target | 10 ++++++++++
> tests/tcg/hexagon/invalid_slots.c | 29 +++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+), 3 deletions(-)  create mode 100644
> tests/tcg/hexagon/invalid_slots.c

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


