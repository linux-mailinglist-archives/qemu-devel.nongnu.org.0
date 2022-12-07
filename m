Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B92645E07
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 16:52:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wiF-0006cu-4Q; Wed, 07 Dec 2022 10:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p2wiC-0006cO-02
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:51:57 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p2wi9-0005qq-HZ
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:51:55 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7CEIVH006114; Wed, 7 Dec 2022 15:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=3MK1opjvw1cPUQkg4Oj35KytP8qTDqkTBXVskQ79NLg=;
 b=ojhxet4THPdoS/tD57FXCcEZrgQWhJwkdyIDtjY4atOinyRZ9/HXRp0/5l5X58B1nN5L
 xnrFXmTAZgiLHSM74Stz6nBOGSxDwat71lP2Ci8s83igGWqn3GEDpwFtVzzcGbzfrAFr
 UmXm2p/e9ALmDsFlC+MskUx+37UZjAV9iluCrBbTVJeQX2mQSbNtdGuJ1TNG2Qp1RGsu
 Pk/XCOjjPtGn5HlI2HjHZepB1etQ7qVtnGGSwjkR5DnxabTDCHMLhqfFNRg2oqfWMy6x
 NzX2UvXQWvMze9F6TcxXEvQ8ggfZZQZk+ggEtN/PIqOIhCHGE4+4juyRqBZVp/IU0cXb qw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ma2bwm4ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 15:51:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLlU6lIXPl3Qq1o3Yh3Q1L3bIIkuWEet1dDQPxzuSAZiSU3NqUM7kI1ccuKtITJFIXjUZ4xDSaUXyxw03dVKgSSwNw/0ONDsehvk9moVUxByRDcAPhSTTzVwpsgEnNEzVM814ub4KvNYDBBqaICxhXFnLJs4jKXiPqFB+1xyb2iBbeVXUWchpAuv1943wteeLhdS2Ll4/o28lhiCUZ1+2Cm4l7T0XV36eyoGHFc6HUA1OE0e3opLP3pZOSVyV2a46z8oUGGAjBK+4REsQa1ModuUe2NxBD34OPAfhg6rIbuYu3lJqCCJQLLGoGyDshrSBek3IrG7D25/sFS+qSG5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MK1opjvw1cPUQkg4Oj35KytP8qTDqkTBXVskQ79NLg=;
 b=hPs+CiOIh8x1f3liytCH3oCUb+A2wMwaCthypX0NqVwP3WeZ9M66HSt6sZMOo3vh+E+U2fhY4hMwZTVl3/JRqv9ZiQy3fmiL7EB0p2eYOVq0jcNxsYJ6G1MsFZxgjJVc9oGMyI7Rx5TBEdLdF0htenANzJnNepioh8NwsHUQNaMzZ0J+nA1ZfOyvfpc7/M+VcdoOl6ZxB0KoMnZIwFX81+A9TEmiZxr2h4wF9FOpSgiVzs1fkoja7rY47ajU8OBVJ/yJtoWDdAZEfqjglcqZQJSKMSk86V6HTZOu9nbmSCa7xZyXyPLeKzL2gDC+IF1tsMcSPLHhu3sOWptKwV3cqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 (2603:10b6:301:7e::24) by DS7PR02MB9436.namprd02.prod.outlook.com
 (2603:10b6:8:ef::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 15:51:45 +0000
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e]) by MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e%7]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 15:51:45 +0000
From: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Mukilan
 Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
CC: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas
 Huth <thuth@redhat.com>
Subject: RE: [PATCH] configure: Fix check-tcg not executing any tests
Thread-Topic: [PATCH] configure: Fix check-tcg not executing any tests
Thread-Index: AQHZChU2J1nWdSd+w0SColBFhcaq+K5iIk4AgABxIaA=
Date: Wed, 7 Dec 2022 15:51:45 +0000
Message-ID: <MWHPR0201MB3497736EFC95B6B3E1D027A3F41A9@MWHPR0201MB3497.namprd02.prod.outlook.com>
References: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
 <3abe6ca7-a0eb-f2cf-aef0-3f4b16478285@linaro.org>
In-Reply-To: <3abe6ca7-a0eb-f2cf-aef0-3f4b16478285@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3497:EE_|DS7PR02MB9436:EE_
x-ms-office365-filtering-correlation-id: 34b6418d-b1e5-407e-bcac-08dad86af178
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eZkHf4tusapB0PxJGM7J4YWE98cLo0xHU7PErsFGNTpe+vYXOfMvkNYuqEkT2ST7VFKfQ9fvXNog3nwzre4Z8tQZnvG7p1QNuyK63S504cUJ0yt/7Dd8KTEO4Ac+u/rt+lFKRhb8wqhaD/CBbZw6fOfF8AEm8XGJm0adxWt2vA5fE78pjCvvPuq2d1j7gi+PFk6Rgq3pBd3yutZtk1pJdbA1CQvMr2elDYYaTRm/69K2qJ3rS6QD+B/WekuQH6EGucw528gzY0Ucu5k/UN6gvi9Letotg4lMtbt61GEckUUrV8Qeo1FpaWb73ljO4DLRljRxk6z1n2WvKyoTwWloV6QViqXnTG5/Jwa58LJ71B+ru1mTOZ3mfy7uvNubaUv2XLXo1ndCvTWcohYyPeuACZbKSFgN1zslxFXUcCO7j/wsWk9hb4VElQ/vPZd9YCTBGEA9U4uKrPk5SBws7emkzmidQlC7DFbduoWPJwF6sjI+Z8DFKxis5PhiMjXLZRFtPkT7oGMgpAdt5tp/XeqIU1GwL2UroIqj3lum2rwE3is9u1fOhCrtEeodhptdkAAhImIPgnElKgQw9Ufjf1vj7d3IL+o5XTIO+SWIsgS17O8kYAdUnQB2azLbSfBh05+NUMa8mnjzhob01U24KN4vMvUwwszF5jVCRj4jnppFo5XO0Ks2FBmg70WuQw7hoJubcV2KDwqTVO+afcoLfYW8ZJBcTjlt9kmLUOmuU/KpmrQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3497.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(71200400001)(2906002)(41300700001)(966005)(478600001)(186003)(7696005)(76116006)(9686003)(38070700005)(110136005)(86362001)(316002)(6636002)(54906003)(26005)(64756008)(66556008)(66476007)(66446008)(4326008)(6506007)(66946007)(8676002)(122000001)(55016003)(38100700002)(53546011)(83380400001)(8936002)(52536014)(5660300002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVREOEpWZGdGaFF1cnJXMVEvTG1zZEMvUUdESVA3OG5aK0I5ZndJdktGTUkz?=
 =?utf-8?B?TWpmUUZUdS9OQ1pBaVA2alA3Q0FDWFQ4RlMvVFdUNGRJNHU3a08wMFBSTGNs?=
 =?utf-8?B?UHpmVXRFdmlFY1psVlJhN3YwU3owNllqZEFKMEVHcitTdTArbWEyWGlsTEN3?=
 =?utf-8?B?YjRVQUJIYXh3WnlmRmR1MVhqVG9hYlFUWGY1WWdKV3VRajdnalJJSVRLRUE2?=
 =?utf-8?B?WVl5WUxCN0FCczRNWXA0aDJwZnJxV2dkcHRvK0lVUjYyTDNMNnJjY3RRbFdy?=
 =?utf-8?B?TnN4TFc0UTZHem1WQjFOQXVDUE4vQ1VBM0JaWlJoTlkzUFFZL2ZmUm9hcERN?=
 =?utf-8?B?dUFjQk05Smx1Qjk4SGtGaU9KOEsrYS9WQ2RKa2VsYUphaFZ4VUNUa0JtZ2h5?=
 =?utf-8?B?V2N4OTZMMk1lbUU0Ny9NZTl3QUQrc1UwLzJYQWI4VVgwKzRhRjZQdXZzQWxW?=
 =?utf-8?B?cnpybGxZc1poWGFpTzlybzIzZWd0b2FRenFNNFBrZmtUQVg5VHVkRGwra0Q1?=
 =?utf-8?B?TnhOUmNtbWI2elFXd3lwRFQrTzA3T3BvTGZPVGZ6aWE4TEFkUlduSDNCWGlW?=
 =?utf-8?B?MHV1cUhLbTV1Y2VQS3phRmE4UFAzdGlXQkIwMTdLN2hBR3BMQmNldXBhRnFI?=
 =?utf-8?B?RFA0T05rZjlQRHgzalNvaDVhdVozUis4cXZjREhqOXFmQzV1TCtVRG83UzJS?=
 =?utf-8?B?MzdPdlhPTkoyRjVtQk56bmJxajZ2RWlOc2c4OUpJQjdSZnZKR0c1V2xBUEFo?=
 =?utf-8?B?QXJXTXdMYTAxNmZhc1VkSnRFYUtXVGF4dUd1V2I4ak1LY2UzZDF1dG5NYmRD?=
 =?utf-8?B?c2lvb0xWQk05SjF6SlBzbm9CbGNwTUVpeHNvQjgvTTM2VXJKUThZV05ScHlm?=
 =?utf-8?B?RkdscjFzd0NudlV2dXBJbzZGbzNaQVFCdmlyZEwyTWduZ0VvV2ZGOFc2UjhD?=
 =?utf-8?B?LzJzZnhhdDN1SXJPUTE4V3hzQTMxb1I4YWZheXcrSDA3M2JFZGlHMVZBbVhG?=
 =?utf-8?B?STMvTG93dmx3NHRKQWlOTDh6NjhwQzN0bXVGT29kdmNhMTdWTzg0dVoyVmMx?=
 =?utf-8?B?SVNmVmxtbDN6SUlYMnpHNE14WHYvVkt5b2czQVQxdjZ6b1F4NEF0NWJvVXlk?=
 =?utf-8?B?bk02NExPY3hubld0Q0s3c1VxTDJpUnVJZVNWK0VaRmxKbTIxZUhDMkhhVG1w?=
 =?utf-8?B?TEF5M00zSStRUjl1ZUVFMHNOMmxrOE5GTnNjRE1XeW1xZ2YwaitnQUVlc0ta?=
 =?utf-8?B?WWtVMGRUd2ZqUDBuRTVuT3RBN1lkNVdkaEZpZUtzTXJ3WDBveE13NWhleWdw?=
 =?utf-8?B?dEtmYVBWRXd2TTZ4UjZTMU0zSXJJUXh4UlkrZmh0eWRpTytxYjdOWE1EOERH?=
 =?utf-8?B?bFVqQy8ydk5NR1NvRWRwQk4rN3hYS3djVTg5bVluaTlaWVY4T0NuR2ZDMGV5?=
 =?utf-8?B?enI0TC94OXE2a2xpNC83VmJIbkEyeDROZm91WTVVOTlZb0taS2pGQTlKZFpu?=
 =?utf-8?B?bm5EYXNaQ2ttRGNKeDgxUTA1RGRyOU1CNFh0ZTFkNVNoSm11VHdvaDREc2FO?=
 =?utf-8?B?NnVNUTJhVWpjMU1jUjZiNmNBMXRkajgvcXJZQ3JCQktqVUt5VkpGaktlRU44?=
 =?utf-8?B?QmxsR05yOVEzNkdOY1pJSG85MjBhbzdpL0luNkJIaTdBV29tOFREQkd2Vnox?=
 =?utf-8?B?VTFaUk1YR091a3hncmxNMUpibG5CVUU0QkhHZGM2WUVDOUlQc2lBZWg2NnRh?=
 =?utf-8?B?T2l6aW5lbnErZDJEekM4dHlIZjNNUTlZZEVDK3pKVVZQcjBQSHdrRExKcFdv?=
 =?utf-8?B?OXQvSHFQZXhkeUVpSFpqamFjZngrTXc5dThiSTFpUFZkSWdDcWVOYnE2cVZQ?=
 =?utf-8?B?ODE0dlVJOGIvNlBXUjdXdGZsM2ZWYjRXYkNYSnZuTExBK1ppdTMrUGZCSlJ1?=
 =?utf-8?B?VU5WbVpmNERKTTUycWF0bWJCOWs3YzYxT0NyYk1ZdW1tMFVxMFYzOFdBcTBy?=
 =?utf-8?B?bXE2cDRTTVQxUHNBVUhGTDZESDUrZi9ITGVTcjJOUWJRRzJRM0hjc0lDbHBx?=
 =?utf-8?B?Y3Npa3Zyb2JDaisxaTVZeng3ekg1N2JVVWpZb2xScVlEaXlCQmdZUTdUQXI4?=
 =?utf-8?Q?3UxxcY2Z4iPukILqOcBf8x3ds?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3497.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b6418d-b1e5-407e-bcac-08dad86af178
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 15:51:45.5232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1VCANYMtXMjqeH+2TV/hAkyDGNsYWTbFQvVZhlBKY318PVQwc3GVEvjoNVtq6P8dRUf1AywtikcIGjMblGA5Tmt92JUf1Hhlaua4lriZ8ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR02MB9436
X-Proofpoint-ORIG-GUID: vb1jBMvB848rRmb6lABTJASATZ9HOyik
X-Proofpoint-GUID: vb1jBMvB848rRmb6lABTJASATZ9HOyik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070137
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0a-0031df01.pphosted.com
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

VGhhbmsgeW91IGZvciB0aGUgcG9pbnRlcnMsIFBoaWxpcHBlIPCfmIogV2lsbCBrZWVwIHRoZW0g
aW4gbWluZCBmb3IgdGhlIGZ1dHVyZSBwYXRjaGVzLg0KDQpSZWdhcmRzLA0KTXVraWxhbg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPiANClNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgNywgMjAyMiAy
OjM3IFBNDQpUbzogTXVraWxhbiBUaGl5YWdhcmFqYW4gKFFVSUMpIDxxdWljX210aGl5YWdhQHF1
aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBCcmlhbiBDYWluIDxiY2FpbkBxdWlj
aW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykgPHF1aWNfbWF0aGJlcm5AcXVpY2lu
Yy5jb20+DQpDYzogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsgUmljaGFy
ZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBQYW9sbyBCb256aW5p
IDxwYm9uemluaUByZWRoYXQuY29tPjsgVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+DQpT
dWJqZWN0OiBSZTogW1BBVENIXSBjb25maWd1cmU6IEZpeCBjaGVjay10Y2cgbm90IGV4ZWN1dGlu
ZyBhbnkgdGVzdHMNCg0KSGkgTXVraWxhbiwNCg0KT24gNy8xMi8yMiAwOToyMywgTXVraWxhbiBU
aGl5YWdhcmFqYW4gd3JvdGU6DQo+IEFmdGVyIGNvbmZpZ3VyaW5nIHdpdGggLS10YXJnZXQtbGlz
dD1oZXhhZ29uLWxpbnV4LXVzZXINCj4gcnVubmluZyBgbWFrZSBjaGVjay10Y2dgIGp1c3QgcHJp
bnRzIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiBgYGANCj4gbWFrZTogTm90aGluZyB0byBiZSBkb25l
IGZvciAnY2hlY2stdGNnJw0KPiBgYGANCj4gDQo+IEluIHRoZSBwcm9iZV90YXJnZXRfY29tcGls
ZXIgZnVuY3Rpb24sIHRoZSAnYnJlYWsnDQo+IGNvbW1hbmQgaXMgdXNlZCBpbmNvcnJlY3RseS4g
VGhlcmUgYXJlIG5vIGxleGljYWxseQ0KPiBlbmNsb3NpbmcgbG9vcHMgYXNzb2NpYXRlZCB3aXRo
IHRoYXQgYnJlYWsgY29tbWFuZCB3aGljaA0KPiBpcyBhbiB1bnNwZWNmaWVkIGJlaGF2aW91ciBp
biB0aGUgUE9TSVggc3RhbmRhcmQuDQo+IA0KPiBUaGUgZGFzaCBzaGVsbCBpbXBsZW1lbnRhdGlv
biBhYm9ydHMgdGhlIGN1cnJlbnRseSBleGVjdXRpbmcNCj4gbG9vcCwgaW4gdGhpcyBjYXNlLCBj
YXVzaW5nIHRoZSByZXN0IG9mIHRoZSBsb2dpYyBmb3IgdGhlIGxvb3ANCj4gaW4gbGluZSAyNDkw
IHRvIGJlIHNraXBwZWQsIHdoaWNoIG1lYW5zIG5vIE1ha2VmaWxlcyBhcmUNCj4gZ2VuZXJhdGVk
IGZvciB0aGUgdGNnIHRhcmdldCB0ZXN0cy4NCj4gDQo+IEZpeGVzOiBjM2I1NzBiNWE5YTI0ZDI1
IChjb25maWd1cmU6IGRvbid0IGVuYWJsZQ0KPiBjcm9zcyBjb21waWxlcnMgdW5sZXNzIGluIHRh
cmdldF9saXN0KQ0KDQpXaGVuIHBvc3RpbmcgYSBwYXRjaCBmaXhpbmcgYW4gaXNzdWUgaW50cm9k
dWNlZCBieSBhbm90aGVyIG9uZSwNCnlvdSdsbCBnZXQgbW9yZSBmZWVkYmFjayBpZiBDYydpbmcg
dGhlIGF1dGhvci9yZXZpZXdlcnMgb2Ygc3VjaA0KcGF0Y2guDQoNCkFsc28gQ2MnaW5nIHRoZSBt
YWludGFpbmVycyBhbHNvIGhlbHAgaW4gaGF2aW5nIHlvdXIgcGF0Y2ggcGlja2VkDQp1cCA6KSBT
ZWU6DQoNCmh0dHBzOi8vd3d3LnFlbXUub3JnL2RvY3MvbWFzdGVyL2RldmVsL3N1Ym1pdHRpbmct
YS1wYXRjaC5odG1sI2NjLXRoZS1yZWxldmFudC1tYWludGFpbmVyDQoNCkkndmUgQ2MnZWQgdGhl
IGNvcnJlc3BvbmRpbmcgZGV2ZWxvcGVycyBmb3IgeW91Lg0KDQpSZWdhcmRzLA0KDQpQaGlsLg0K
DQo+IFNpZ25lZC1vZmYtYnk6IE11a2lsYW4gVGhpeWFnYXJhamFuIDxxdWljX210aGl5YWdhQHF1
aWNpbmMuY29tPg0KPiAtLS0NCj4gICBjb25maWd1cmUgfCA0ICstLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
Y29uZmlndXJlIGIvY29uZmlndXJlDQo+IGluZGV4IDI2YzdiYzUxNTQuLjdhODA0ZmI2NTcgMTAw
NzU1DQo+IC0tLSBhL2NvbmZpZ3VyZQ0KPiArKysgYi9jb25maWd1cmUNCj4gQEAgLTE4ODEsOSAr
MTg4MSw3IEBAIHByb2JlX3RhcmdldF9jb21waWxlcigpIHsNCj4gICAgICMgV2Ugc2hhbGwgc2tp
cCBjb25maWd1cmluZyB0aGUgdGFyZ2V0IGNvbXBpbGVyIGlmIHRoZSB1c2VyIGRpZG4ndA0KPiAg
ICAgIyBib3RoZXIgZW5hYmxpbmcgYW4gYXBwcm9wcmlhdGUgZ3Vlc3QuIFRoaXMgYXZvaWRzIGJ1
aWxkaW5nDQo+ICAgICAjIGV4dHJhbmVvdXMgZmlybXdhcmUgaW1hZ2VzIGFuZCB0ZXN0cy4NCj4g
LSAgaWYgdGVzdCAiJHt0YXJnZXRfbGlzdCMqJDF9IiAhPSAiJDEiOyB0aGVuDQo+IC0gICAgICBi
cmVhazsNCj4gLSAgZWxzZQ0KPiArICBpZiB0ZXN0ICIke3RhcmdldF9saXN0IyokMX0iID0gIiQx
IjsgdGhlbg0KPiAgICAgICAgIHJldHVybiAxDQo+ICAgICBmaQ0KPiAgIA0KDQo=

