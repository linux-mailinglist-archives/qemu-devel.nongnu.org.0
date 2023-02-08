Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B668F583
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:37:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoNe-0002qm-JR; Wed, 08 Feb 2023 12:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pPoNb-0002lo-Vq
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:37:12 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pPoNa-0002bM-6f
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:37:11 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318DRi2P011976; Wed, 8 Feb 2023 17:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=IZGBm7xD7tVvTDkNgO8qt5BJohQind02sgVkW5IfE8g=;
 b=JV6cw3O7O6V6rYNrD88qf+4LZkUeTaz5aqvJk7F5e0Z8aaWzJyh9EpuZ6c2qCEm+JTGL
 fpiEDZakwBhppuKI+It9FSl5PuF//COv6EUvHbmaZcVRz3lqKa3ljfjI9Oz4h/bmaASA
 +DVoH156uvSifWoONrvRDhg65/uIsc8NTiepGUKw+vCQWIpVyif1nsY1nk3TZAfZSac1
 KVqNKdi6TiU0VUkId/xb7jVqcSHShAcEJZkCtKxkprf49U0Ae/LHYJEerzppAD0TLMT5
 079Ov5zrXoVdISDHDZoW1PV8LAh6NVwMn8R8llHU+s13GCZjsrGfftx4gk43583YX+DK lw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm86msddy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 17:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsVCQwOO63pIuM7AyBugdrc4Ld0v66Du6JgPnNhEGOfC708aEH1/Qi9rVfsiBpJF6SMUGELz0BDoOHqpoFVmethFltG2uhGI0XYKkc13cMvxq7ZubWp36kGB+X+Fs2ozH2anlB0Ptq0VFWlKG5czhH3wSCMU41RdICiz5oogdQzs4hC7H4MR4D2BICv2oG34vic5p9JAf9D/WERlaWDGirieO+whVHTh+WOcR6CP+7i1nuURbaUEO6fJ1kiin7xMPKMsJQbGtAwaQMPTAV4S7c7hFZOIobdpazXczf+sJVy3cQ17CNbblNUSjbhccKP6l65Y+fIfoQnplBrr71WsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZGBm7xD7tVvTDkNgO8qt5BJohQind02sgVkW5IfE8g=;
 b=LbyTAekQHOYPEhx4MO+AincNEErLEWG7dLugL1UC+T7BH2OxvZZ5CyV2lka7SPlZiuCw967oOs2h2HNPG7iWAAzwWh/lYUs7bpS20iL7OU/PQWFMCjZV6ajF7txAAj7rzoicXaJHv5p+75l+i4k/E3D/07cCnnlbb/XCZ/TEMEHKpjuoMzEMsZXLU1ACUoRSTeDadHcZLTgdwrAoS6CLLiTtcvu/UOAOn06IYeNxP19t1MKUMr0kai9yPc7lxDkDABv8YirJPBa9oqOnDnVkYziHlxwDNpzlUIOjfKesYZj1ayeFRsOoQgsnHRBoMvSRzN5mDRj421hhimNlk5LiaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM8PR02MB7911.namprd02.prod.outlook.com
 (2603:10b6:8:10::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Wed, 8 Feb
 2023 17:37:02 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%9]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 17:37:02 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>, Michael Lambert
 <mlambert@quicinc.com>
Subject: RE: [PATCH] target/hexagon: Access `pkt/insn` through `ctx`
Thread-Topic: [PATCH] target/hexagon: Access `pkt/insn` through `ctx`
Thread-Index: AQHZO92CNHRKhqh+9Ue3ALCgkEnU4K7FT+6g
Date: Wed, 8 Feb 2023 17:37:02 +0000
Message-ID: <SN4PR0201MB88083C22D51E3F8FA957B9EBDED89@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230208165034.21510-1-anjo@rev.ng>
In-Reply-To: <20230208165034.21510-1-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM8PR02MB7911:EE_
x-ms-office365-filtering-correlation-id: 5d0aca9d-848c-4038-f31b-08db09fb16a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oeVERZtIqYKfJqDfZhht35jF7G5Kvql4rGLDPBXLVOeqX1QSyq0y7nbJZnANfv3hppy3e1aWWa+lb3tnN1ynsTVSD036behO4ZKIAqPcyPepoTf1u1zjXbggMcW//oBOk0DyZS1iZHf6Mmq5Y4aFWEoWmupI4hTFv9Y1wPWGBxSSVj1WU2yblPd3OgvVHo64C1cSgbDm7SFlGg18PUippVs9kT8jMzs7ssOxmnS/XTY+B+HnVq25eERgRHVbjl8Uu7i8H/L2dWIcIEPwLC6RXuLCZVcfci4xAagoIvLc6Z5RUSJZNpm8o9aDV0CDJzMfnPUORmSPF4ART74KocMj+LBCwalBibZai46/pxmsl7TRMyHZPnUtZ0ZvcXE8gdd2OK/+R6d7s59EwQh4Ot3+OVZSLz5LjiO3Q+iORzt5GtZaLF0Qtkj4n0mV5iSZ2lXHqHbGucWC4dAy6CeZ+b4/snlGJBImG2Iu1mkxOwYBpcFDSlVZVfZrJpCv6S42RFf195SH/wq7PJEJSHWSHfpessEQegqj/m7VrH43KF1UwihHgPmsd4HTnAIf3UMKJulJYpvW5FggX6VLe+3+1QNGC1PW4LmNRaYXvy//qmOkq5dzxyJLr+Qjeu/dS0YwJSGRAJo5eUDbRY4fMUNKD4l6IOB4NPa14JGn51wxZukX6J5pYxHOUQhyi0e0l10++NxDfJJScnUDfh7UF8yyTYfdHQFe62mehHcs+pgV4rXKtpU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199018)(66476007)(4326008)(66946007)(76116006)(8676002)(38100700002)(316002)(66556008)(122000001)(83380400001)(110136005)(54906003)(86362001)(5660300002)(52536014)(33656002)(478600001)(38070700005)(6506007)(53546011)(2906002)(26005)(9686003)(186003)(107886003)(4744005)(71200400001)(64756008)(66446008)(41300700001)(8936002)(7696005)(55016003)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VYG7ugMWKTMIcP/OMVuSj0wvNALLbFOpPqSPu1XlMebZggZi0GW9GXnEc2JS?=
 =?us-ascii?Q?cgupiUOyWvvFPALpFNKlmeXyM0liNyiiSsV3khuhECMJPpWTJC3nNVx5xEF8?=
 =?us-ascii?Q?t2MUezp9KnoUzPti9KkkAueag6QOPJUtfXW60Gu2Cs/Fce0TfQiOm8q/FLZ6?=
 =?us-ascii?Q?PTMT9lwQJNOLXvqsFqS+6WMA3/VWmvyCMySYAOUeuTymuda810lQMLG6ePwv?=
 =?us-ascii?Q?dH5gkQ0lu0hj59qkAvXngs9LQg6dL6fgHSVW9yQeSwDpn2gQnlkgAd7gBf+V?=
 =?us-ascii?Q?z+Wkkjbn5uQo3/uR5PeaPUkxFzf4p5mU5Bvj8n/Z1Xyn55m6p3mb3kPTxQBQ?=
 =?us-ascii?Q?O5os1hFAYlVQ6596NjpTsZosfhybl8FrpycV2XV8s1xvm7ifNl7v1M5iqFZF?=
 =?us-ascii?Q?wKpX4D+EKqu047vGQt++hFW658vKnbjnrMlPrKlDyjEO6ufq8M0QPCVpyn36?=
 =?us-ascii?Q?SP/zLOzOGoWT4++2cEyxEB7JUmMOVIXtaBV4aAKABpmypdDiClcg3TW+MfP5?=
 =?us-ascii?Q?vrSDpixeei4eOhEtrXeWiXkLqzOu7l5l5VjWQiCWNxCS4r9R7lJx+yIxe5HT?=
 =?us-ascii?Q?u6w1KNj9kwbNb2W+c8wPKniJ/hpALItYxyG2MLctKB/W1lLcOU89Ee4uwZsq?=
 =?us-ascii?Q?3v/M2js6cdytUKImGmEWmXZHMlv2sobUF6R0dz65hG0803srnItFq5QHBe3e?=
 =?us-ascii?Q?ywVxfPuSVM+65TDi19D8thCU23pn2NMacN13mhRNj1YD66RCYcA/i/fvDKF/?=
 =?us-ascii?Q?tFrTT759Rl4Lafqod0/HLwUpa5EU6DfAgPYFbk342PS9/ObYHnJ3cFapaTM3?=
 =?us-ascii?Q?fV+VgBIov2WC1G7b8uCmj+bbhziQQvEAkEyfXUtQLhlXZzo17IcJ+hV2WbXQ?=
 =?us-ascii?Q?L/hVL21LRYuzawIAth8cpyJqrUDZTDUdmL57UViz/cLR0fMXP50Wd/ZB1PXF?=
 =?us-ascii?Q?uo5J21X3L4AxkXydc/aFkUOBkE+OGbAGU60A3k2rduVvLTPe4c8omroPUpn5?=
 =?us-ascii?Q?F2P9SAlWtBnmBP2WOikb4AAbH3lnyRvRv87D7ps/HG0XjMlxvyqO72BWv8wO?=
 =?us-ascii?Q?HZ0GIJcgVxuolCxuiQUbUU6PzA7W0sBF1JkP40rlASgMBHAQdaekcKJxpquV?=
 =?us-ascii?Q?8shTx3/CwfQRCqswLp0p4E1FscvuR8tsy/U4yTjW4zf+Kqyq5qRkrPiI1xqJ?=
 =?us-ascii?Q?LL23xy8qTPM+B0t1CT2DYqXc4MCqBqSKBA/ep7nebGoo/sGxkqIssxwI9wdS?=
 =?us-ascii?Q?WHSB6bkrbJCZcc3eZarWAHOm7+EKK3EHiw3S90K4BH2LtaPYRfNbSzpk6mvI?=
 =?us-ascii?Q?mBp6NP2kxqkrGz/X1Q7I7Bi+tqm4eQpTg/kSlCRqNpXhBjIW5wfPaGhCdAVO?=
 =?us-ascii?Q?ULqAAB2kj7GEIO5KFzSRjrBeg9XqVNEGY8oYxIHHNAJNqS84zSQHXCywladF?=
 =?us-ascii?Q?7BwbgeHcJpPM0o3+KrN6oJE2BFpswDO2Q+S8MQlsBWSQrUsDCWwtR7M07J8R?=
 =?us-ascii?Q?zHOGPakWFjjTnmNGT8Winv6asr9W6f6YJaLyJ2NT0U7srqVPLjZsWDwqa1dF?=
 =?us-ascii?Q?eY5Vl2y/7H+8Fdf2+RS+9agYItRXrv50ndN0HwTO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ULtHe4ODDc9liMOlCsJCK81hI2+zZe0rqwx31yDlTA6gDun4CXodAoMjda3FTx4R0XiUHgWgJmPZ45XvNfg2f3YtOEw8Yh7IykFH9FxzPJ/8ZXScVdWNY+PF3kDSb/SogpvbVHkPvTLV7O8RIMYC1OOLSTi64EJ/bg6OKMWM3RWHRUmr+IZjgCKXJ0SwPLibbNCL9HTfnI9mK2+Wel0PnrTYf6BkT1/POgvKoEy8xCUptFeI58qLxyIrGa1wRrzsY5CL7kdl5WQSEhbIRYjhFiEcMrrgPI3vnvybHamQD1E2JeGokMf+7NUDJ1HecMibBIjLBjXmM2zGQNy4DTKZWlDcNt+P8v3jIS779vd+L0QJPMzh5ZDKXrejAx2qWdG8lZkrOeDo7wtgLXdDcEogpg+6fznqa6QnIFeifX5h6gtgpQgKwwSVBL0A00aLVrr5Dc/n5Iz5al48D1n+Z3FA3O/A1+dZojQc6PGLcOxWilSMH7k8HQuCB6GFziLhUqUouHRtyOKKvminKNkJdekFimZCOtc1pXxqlPzTqw4A9M63NHpitO2nb2y4XXZ1GDXKoug9oTQGrg9+d1uNwHHMYi3r8AGIUdV1nFjB5QUIke6MbOBzw0zDgqYcLQL4HLb9/+jiGrp/qc1PDtxHsfIGunGy7YV+kb1e1eaelHOLR+/KAI1xQFLkjQw9F4V0Vzas/pJvV+Tn1e8FuMbAPIsbt2hgIdCGbzxu1/UcxZak3XauOyMB0hxOhtlzbuykF87qryooqDwm6V3460dzzPwClRFq+j0q6a3nmLQTONXcT0A=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0aca9d-848c-4038-f31b-08db09fb16a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 17:37:02.3898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ph0iYwTSJ/63nzltaseXmnHxe7kxansGXaUJd+CX6sIjpVxbuD3YP58S5GRUADzGq50bEp1z9LErFCx9BaQmKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7911
X-Proofpoint-GUID: nENnBUBzOCd7qNLJqJb0IvFq3ksSFdaU
X-Proofpoint-ORIG-GUID: nENnBUBzOCd7qNLJqJb0IvFq3ksSFdaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 mlxscore=0 mlxlogscore=547 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080153
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
> From: Anton Johansson <anjo@rev.ng>
> Sent: Wednesday, February 8, 2023 10:51 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; Michael Lambert <mlambert@quicinc.com>
> Subject: [PATCH] target/hexagon: Access `pkt/insn` through `ctx`
>=20
> In code emitted by idef-parser, access insn and pkt through DisasContext
> instead of explicitly taking them as arguments.
>=20
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/hexagon/gen_tcg_funcs.py             |  2 +-
>  target/hexagon/idef-parser/parser-helpers.c | 13 ++++++-------
>  2 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


