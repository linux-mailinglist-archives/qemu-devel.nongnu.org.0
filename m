Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A8653F1B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:36:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8JrE-0006WP-8R; Thu, 22 Dec 2022 06:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p8JrC-0006WE-DH
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:35:26 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p8Jr7-0006ap-26
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:35:26 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BMAloKP003860; Thu, 22 Dec 2022 11:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=31l5CcdByoi54n0APVemUGuG2EsI1o3wI0csgBoWgkA=;
 b=M669Q66ecocA4ZFSgHHSogs2MlzZbmje8H/+MY7Fm72Vh77Fnw1sZ8DVV6wRJ862Aal5
 M4i9C93vJnbMm2mjziKmKP8e4E9NvaUzF0g433HtS1SdU7crVl7NBX6YzbivdvRQJDP9
 ndihGSjdWVsVutk4saTMVPUmqwDepdt4cVfUQ3naVLU+56No4gwfwa/ayZOhv/3Sw+uC
 FPdibX1jD5YoDBEexYllsZcjTWveBZSOutGGuGPxXozC89W7sEYZVKzLjJwtmx/H0W87
 /05L0IHMayAPNYkT3SgCtw9e1fop6uKGYurzXHuYV/eho4/AMcF9bWP+8WANmMqLyEJi Nw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm2brtdhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 11:35:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In+49EVPrD0rOSN8FQVeDRm+/GYT87v9C9ofjFd1RF7L9uo0pij2rQ8+G1ii+HdiiuuG4bdcIdx8b29EiAEy81H+hUaKu52n7Id7mD7iWdEjGwiZ7HOaqbZ2eZMDAqj5TDCA4vtwFjXVDUtoMZ7qtoEJH/cBW9Ll7resdfhbqrAhX4ghJ3BH5vKJHSkAlmC5PW3rfG1WFQ96nsyuoHMycDh+OcmjBI+8kxV+H4GNzJnCGdg4zOLQwBI1VWeqbRITDbNw01ZbBFRwjGp3MNIhuVHqw+hdOqamIOpVHPCZXwKlujPflFuvCr88HG8iFkUVFq5J9whRdA7ElvyPFSmWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31l5CcdByoi54n0APVemUGuG2EsI1o3wI0csgBoWgkA=;
 b=NZ1twvc6rWQZUCnQqxyS742jdipbvx0XRrUO+a9klkimNydoc7jrrQVcagBvERcuKzIXaL4rfUR0s/NEWGZBg0BrAaU9Vw9G01jQ3GiB68U27IufiaV4GRV84Qc4preDj87pav1pFhm0vgZyuiSyN4nDPvf1uhleb/lXMqNzOJhne0ckakull436yOXff9fEDxwMoMKpCkDk+tumRxS8d2FHeudya+2/jCKw+EhY00R8hAnvX+55H/rD+7+laa4TKMYW4Fgn99uAEcjn84p5NtgdF5PzNoEBfd+8KOiFiRe/10ZKDX/M26p/0TTB102IqwV6hCwGe9Yf6VEfFN1DXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 (2603:10b6:301:7e::24) by BY5PR02MB6577.namprd02.prod.outlook.com
 (2603:10b6:a03:20d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 11:35:14 +0000
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e]) by MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e%7]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 11:35:14 +0000
From: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PULL 0/6] testing updates
Thread-Topic: [PULL 0/6] testing updates
Thread-Index: AQHZFUpONOQCnVodMkWajF4BvjFiAa55wp0AgAAEMUA=
Date: Thu, 22 Dec 2022 11:35:14 +0000
Message-ID: <MWHPR0201MB3497AA0A5C77B9198A1EC3CAF4E89@MWHPR0201MB3497.namprd02.prod.outlook.com>
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
 <CAFEAcA82JV9B-kuW-fZVAHv=VCs7H5KWqG=XYAhjzmK+9wmCyg@mail.gmail.com>
In-Reply-To: <CAFEAcA82JV9B-kuW-fZVAHv=VCs7H5KWqG=XYAhjzmK+9wmCyg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3497:EE_|BY5PR02MB6577:EE_
x-ms-office365-filtering-correlation-id: 55016b77-4f11-47e7-8d1d-08dae41097d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MCapwlYidU5YMgx6E1pEqz8djrF9/r07j+0zHoqWnh7BXOWxWDG9dKTaV379NLKtpojuDFbIicYXa1Ct6E5G9rvJ1yvoA4Pt69YNjKcDNuN7ZQAoVw8uJABGFwBNY4Te952+m/J5xbZldG2EMPJUxwZfe1/KJSzjZxQ15qadPv2C67TQtAwhgSsbTFtyZWMHEgeCtyrvudMUKtN0uFoNk0K7L80zCpb5vSs8kK+GLx36hcFrCbsqIuajtMrdMbDTMjRljl2ISVR5cpZV6rlYl2EW3ee7nMCS1owL6ONt0DHeIuemVGjTrEIgAw6PVDGFE3pgj53mDuV0M8eLqhr4UswxDNVjjxoI8xQ7FTGfmUjFmu/KZVrYJJP6oGgAyIa2Yf4iq5Dc2r38rsElPDi4KRjfLhx4/dz0WEdU5ydVLxj8u4UChL+h+4YIEn8nI1NG16YY8i7fYhpMHQsuzKGZYqD3Q1WMmNNv4qGtdv3MDzuMOaAQ2Vx+ZhLD0ivSHMaqq0Ze5Jo9dYrCzvgcXs7nr9TCpyAQIXXWN+Td2ut4w2Cdilnof3JO/JkPwWe95QIat897Yuf2Yd8zgVM3asF/8WrDmuBw8ERF8ROS8m64GcIqAIq4ZTdsGG3rxi/7Wepfx/wwQ6X8iBUuLXA+pd+ff2OT1rIodN+KjpmYCUO/WjXeCTNfgXFKIGe1l6qTM/6M/JV5C/iU4H675E2DQ1Wx2ARJ1/IW71WinpaBHD6syFwY0rGeYlnnLm+GO5NkgOoLdAE4/fTTePFYvCju+G9VCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3497.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199015)(33656002)(71200400001)(122000001)(38100700002)(66574015)(6506007)(9686003)(186003)(478600001)(53546011)(26005)(7696005)(966005)(83380400001)(8936002)(110136005)(66446008)(5660300002)(66476007)(4326008)(8676002)(64756008)(41300700001)(52536014)(66556008)(15650500001)(86362001)(316002)(55016003)(2906002)(4001150100001)(38070700005)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TENxZzJuV3BhRzlMd1BkWmpIMnkzMUc4dDN1RW9YVnpPREZPemhEWElackZx?=
 =?utf-8?B?ZElxMXQvdzJiNzcwUTVvK29rQi9zV2VwaUgzTTg5OG5PcW1RSkNGUEtmMjRW?=
 =?utf-8?B?WHZzSCtpeGxSdm5Md0U2Q01WMWRBWmtadVIvRHh1ZURaSGtVczQrdWF0MHdl?=
 =?utf-8?B?WStjVGtubk8xYW1PenNuRkFWWmhWZU04QjNwSUVxOTRielprRjdCUW1aMzR6?=
 =?utf-8?B?bHFtSit4ZTcrNnNaRE1nakFFVkN3bnRQL0RHbHF4d0tvNVRtUkZlcWdBQlE5?=
 =?utf-8?B?SFoweHFoWFcrSWQ2bGMvUzhOcnFzbkFpTUFMRjNWNUVsY3FXMnZQNWVDZjBP?=
 =?utf-8?B?SkV1MjV3TW0rYlh0aEl5SFkwMTF0ODBnVm5PK2ErVmNrakIyVzVqSlJma29z?=
 =?utf-8?B?Y1lrL3dpMENCRDNQanppZUhpUDNDYThBNnFEdjAwTUlrS2Q4anlwekh0SWNS?=
 =?utf-8?B?MitLQllHV0M2TThkY1p4aXNxZmZCaGxRVlVHTHBqS2FuSXE4R0Z1US9UanFt?=
 =?utf-8?B?QjZwZDZKQm85TkNXZVAyUU1hRTJ5M2FLOHZwdFNVcmFlZ2JsR0lzd0NBUE00?=
 =?utf-8?B?ekN6TkpMRnlHamc2bHhzbE5jaE15UWZYZWNCWnRZK1M1MkpnZXVoSUNucXFt?=
 =?utf-8?B?cDdCMEJyR1ZaVDhHeVQ2OHJvbEtYci9BYjlnTVRESUowY2UwZ0wxdWs2YVJU?=
 =?utf-8?B?clU3WkxtYktkV0J1a2VpV0VXZmhDQlVCOVk3K3ZibGFvdjd1U2ZKMkJ1bmNU?=
 =?utf-8?B?Yy9qZnJiZ3QyMDk2Zm9wWks0cXdBSWM1dGxUalEvMG93T2VQb09lRUtORmtk?=
 =?utf-8?B?V1RGMU8zclQ4RWhaQUdGeU8xY0FPT214NjJmUnNoZE54NVJIZWdldUV1MXJh?=
 =?utf-8?B?MXFkdkZnU2tzaUsyM0Z4dXh6TzZYTTI5OXpHdkRNZ0VtMU94MzVLQXE1ZXJ2?=
 =?utf-8?B?aFhES1h2Z0tpSEJlVG1LTFkreHpPQ2FPU0IvVkFmMG9XbmRkMW91TGpNSm4x?=
 =?utf-8?B?Q1VvNWpIR2hWc0p2RGFkVXB0eisvUWZrWStPSGl6dXcwU1ZISDl5TU5VVlZP?=
 =?utf-8?B?dmtKcnFFZkNZNEZWdGtvWWF1cHVGK21NUnFqZlRnUlQya2o0RURHSVdmL0d2?=
 =?utf-8?B?VTBVU3FjaUtkMU5TYzZ0bkxKUUZpWFJoRmVwR3AwTmZVWUQvcnZMQ05iMElL?=
 =?utf-8?B?UHUzMnlqTjNqaVpUc2VjTGVJZCtxckRQK25wOEhsb0IxcGI3NzhmOFdlT3o2?=
 =?utf-8?B?ZWt0ZmlLTmZVeTkvWnJ2TTJtbDBCOTBFa0NvR1Jlam5iTDlRQ3NQVy9hdFpw?=
 =?utf-8?B?YS9RMGgxTFVHUkIwcGo5YlZGRzBMVVg4ZEoyZjh0NlUyQ3orVk9xM2NwODFh?=
 =?utf-8?B?a3V5U2dlV2pwQ04zT0JhOHpoemtLdkJhT2M4dEZrT0JZeXhKcm5CZUpsR2lW?=
 =?utf-8?B?d2Z2SU8zZEt4OExpNTJwMXVVV1M4T2d0UmNxODE3WEs3VCsvSGlOa2NwamZs?=
 =?utf-8?B?bVU0K3B2RXJyaFJVbmZjdWlXUTVGZmtjZy95T2ZydUUvZ3pkWHhYZjFHZWZP?=
 =?utf-8?B?QnZBZyt3cHNlQkk4c01pSUQxSXRIZDlxdjlDaHJMNXpPcTNSckpHckZDYXZj?=
 =?utf-8?B?b1lYVVVyd1R3NHpoelVLdVE4elNhenBiZ25USzNCY2VTYndONFFEMkNKQUk3?=
 =?utf-8?B?RkNjVThpZ1FCaTNjcWJMV0UwSGtoN1c4K1ViZTd6d3MvQ2M4SnUvRENQeW5I?=
 =?utf-8?B?VVkwV041ekFBN0RZUEFUeStEOUJJUklpTS9sMzVXcDAxMEFoNkNCWnBuOUVr?=
 =?utf-8?B?R09QQkV0TXdva0hYeFdia1ZiNTIrcmRRVkdKQVl4WjZnL29mM0kvcm5ZdUFP?=
 =?utf-8?B?NEQveHE3by9VTC96dWtORmIxUklEWFFZS0JkWlVqUjMwamdEM1VjMTc1alNI?=
 =?utf-8?B?ZlV4SjhoRDRzMGpSR2RMQmNqdGpabFV1UFNIV2YyZmk4NWZCL1pHZ1FpUFl1?=
 =?utf-8?B?UldSTEJWY2x4QlJSZjZaWHJVQnc0bnY1QlZaR2hHMnhHSzZHZ0hqRzE2dG1k?=
 =?utf-8?B?UktXb3lQenhFbitpRkFycldZd2FPeVdtZlNKQkRnUXFaekZCZEVkNUFaaWE5?=
 =?utf-8?Q?HhqFFPPk9sdh6ErYFt6uUD5oc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3497.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55016b77-4f11-47e7-8d1d-08dae41097d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2022 11:35:14.3514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +y/9lp3M8BUThwwJkRsCG6MLReqYlBVRuUu6PNB9GJLPeY3ahMY4B/Lti8Gl1NwdJr8xv1iQ9RBWJvqxgGJDvNt3CQsBMbtzxuhZAw44ksw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6577
X-Proofpoint-ORIG-GUID: 0oXuhssIiwtvn3W_CmdmVw6i1ozL4d-K
X-Proofpoint-GUID: 0oXuhssIiwtvn3W_CmdmVw6i1ozL4d-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_05,2022-12-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212220100
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0b-0031df01.pphosted.com
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

SSBiZWxpZXZlIHRoZSBlcnJvciBpcyBjYXVzZWQgYnkgdGhlIFFFTVVfSk9CX09OTFlfRk9SS1M6
IDEgbGluZQ0Kd2hpY2ggbmVlZHMgdG8gYmUgcmVtb3ZlZCBmcm9tIHRoZSBkZWZpbml0aW9uIG9m
IGhleGFnb24tY3Jvc3MtY29udGFpbmVyLg0KDQpBbGV4LCBQZXRlciwgDQoNClNoYWxsIEkgcmFp
c2UgYSBwYXRjaCB0byByZW1vdmUgdGhpcyBsaW5lPyBTaG91bGQgdGhlIHBhdGNoIGJlDQpjcmVh
dGVkIGFnYWluc3QgdGhlIHRlc3RpbmcvbmV4dCBicmFuY2g/DQoNClRoYW5rcywNCk11a2lsYW4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHFlbXUtZGV2ZWwtYm91bmNlcytx
dWljX210aGl5YWdhPXF1aWNpbmMuY29tQG5vbmdudS5vcmcgPHFlbXUtZGV2ZWwtYm91bmNlcytx
dWljX210aGl5YWdhPXF1aWNpbmMuY29tQG5vbmdudS5vcmc+IE9uIEJlaGFsZiBPZiBQZXRlciBN
YXlkZWxsDQpTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMjIsIDIwMjIgNDo0NSBQTQ0KVG86IEFs
ZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCkNjOiBxZW11LWRldmVsQG5vbmdu
dS5vcmcNClN1YmplY3Q6IFJlOiBbUFVMTCAwLzZdIHRlc3RpbmcgdXBkYXRlcw0KDQpXQVJOSU5H
OiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2Ug
YmUgd2FyeSBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1h
Y3Jvcy4NCg0KT24gV2VkLCAyMSBEZWMgMjAyMiBhdCAxNDo0MCwgQWxleCBCZW5uw6llIDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPiB3cm90ZToNCj4NCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCA4NTQwYTFmNjk1NzhhZmIzYjM3ODY2YjFjZTViZWM0NmE5ZjZlZmJjOg0KPg0K
PiAgIE1lcmdlIHRhZyAnaHBwYS1maXhlcy1wdWxsLXJlcXVlc3QnIG9mIA0KPiBodHRwczovL2dp
dGh1Yi5jb20vaGRlbGxlci9xZW11LWhwcGEgaW50byBzdGFnaW5nICgyMDIyLTEyLTIwIDE1OjMy
OjI3IA0KPiArMDAwMCkNCj4NCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6DQo+DQo+ICAgaHR0cHM6Ly9naXRsYWIuY29tL3N0c3F1YWQvcWVtdS5naXQgdGFncy9wdWxs
LXRlc3RpbmctbmV4dC0yMTEyMjItMQ0KPg0KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gN2E4ZWM0ODQ4MGMxMTZkYjkzZTBkOTE2ODhiZTFkY2YzNDE0Nzc5NToNCj4NCj4gICBnaXRs
YWItY2k6IERpc2FibGUgZG9jcyBhbmQgR1VJcyBmb3IgdGhlIGJ1aWxkLXRjaSBhbmQgDQo+IGJ1
aWxkLXRjZy1kaXNhYmxlZCBqb2JzICgyMDIyLTEyLTIxIDExOjE5OjA1ICswMDAwKQ0KPg0KPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+IHRlc3RpbmcgdXBkYXRlczoNCj4NCj4gICAtIGZpeCBtaW5vciBzaGVsbC1pc20g
dGhhdCBjYW4gYnJlYWsgY2hlY2stdGNnDQo+ICAgLSB0dXJuIG9mZiB2ZXJib3NlIGxvZ2dpbmcg
b24gY3VzdG9tIHJ1bm5lcnMNCj4gICAtIG1ha2UgY29uZmlndXJlIGVjaG8gY2FsbCBpbiBDSQ0K
PiAgIC0gZml4IHVudXNlZCB2YXJpYWJsZSBpbiBsaW51eC10ZXN0DQo+ICAgLSBhZGQgYmluYXJ5
IGNvbXBpbGVyIGRvY2tlciBpbWFnZSBmb3IgaGV4YWdvbg0KPiAgIC0gZGlzYWJsZSBkb2MgYW5k
IGd1aSBidWlsZHMgZm9yIHRjaSBhbmQgZGlzYWJsZS10Y2cgYnVpbGRzDQo+DQoNCkdpdGxhYidz
IENJIG1hcmtzIHRoaXMgd2l0aCBhICJ5YW1sIGludmFsaWQiIHRhZzoNCmh0dHBzOi8vZ2l0bGFi
LmNvbS9xZW11LXByb2plY3QvcWVtdS8tL3BpcGVsaW5lcy83MjkzMjQwODgNCg0KYW5kIHRoZSBl
cnJvcjoNCididWlsZC11c2VyLWhleGFnb24nIGpvYiBuZWVkcyAnaGV4YWdvbi1jcm9zcy1jb250
YWluZXInIGpvYiwgYnV0ICdoZXhhZ29uLWNyb3NzLWNvbnRhaW5lcicgaXMgbm90IGluIGFueSBw
cmV2aW91cyBzdGFnZQ0KDQp0aGFua3MNCi0tIFBNTQ0KDQo=

