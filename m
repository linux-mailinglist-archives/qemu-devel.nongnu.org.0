Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958951AD91
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:09:38 +0200 (CEST)
Received: from localhost ([::1]:58338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKNV-0007kB-AY
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6123628e29=pdel@fb.com>)
 id 1nmKMB-0006iY-E9; Wed, 04 May 2022 15:08:15 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:41070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6123628e29=pdel@fb.com>)
 id 1nmKM8-0007Xk-Vg; Wed, 04 May 2022 15:08:14 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244J1YxS024938;
 Wed, 4 May 2022 12:08:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=D80ZUuYip++aG0Rzw0V50IM3tw6TfdASZVsRz7kBt4Y=;
 b=l4Dkh0u+OwEB4jovn0g8+wWHxq8Sq/XZkJWCp3yuvW5QHkg+TDAbUkv5tJ0tuQg3N087
 gLwicj+uVtTD6sFaZaSVc67agJIUABN0miBoMHdeT7pVnYIxPs1tm1fSzdMl5FzrRuEc
 7ZSKx2qS9ecjcHy+bbkUNeeLNZ87aBm+u7Y= 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3ft6ac353p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 12:08:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjI5f0xelG6m5bPLCnZZWZJXd8LsVaed0Upw4FWebgqW2xa/NA/QPJlXiZBZgV8bVv2tn9vVFwmIdhRzPLEbGC88+JCb4sMUmeyGU2wz9llS49jPEDf6H/TVlwclyo1UvGocQ+CiCkzPcDeX5GH5sXXnnFQAxp7jVlCJjcFWMsjvFS86NM2fdP6Kt6ZxnvUpM8iIoZxAZXhAhDrBIVbNI0XeLBgTaaNFRPr1KrXa9hw2OVNV11UFUjse63ft++gDs9dvi7Tn87DOHY6576G2N0II4+or95Jcv774STROieDK2MiQpc3yJFRgKczoB4C+oJfj7t5o5JAgY+Ik/i0c9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D80ZUuYip++aG0Rzw0V50IM3tw6TfdASZVsRz7kBt4Y=;
 b=jPqfNEKf2ZWLrKDvHijJ9woOrqCaK7gm6xpS1hSn6Cv9R6587xaMUe37CFCJQc46Amr4WkMHUio+9DgnoHJKnQBN8qNc/aGVJ5zwPE6xskm+VzhY1/ZeAlJ1gXUHKzcx047IA7Nj6QafUKVIjrfWrUdx4lR9blhCM8jygWxnPsgkghAys12QAR4xCGpW6ujDyEc4K6tbvXnmfvRVlLCKypLonvrdr/NS7NT89pAQ/6vlDfI+W40cauJbxaIlASse7NFp93ZJTefC0sagGGJ/KdxE7fRBln+nKuzWQibch6tLMwBXy2COaSS9/7PZqM+Xkx7hYTlFfaoONb0Tmr0Z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM6PR15MB3484.namprd15.prod.outlook.com (2603:10b6:5:170::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 19:07:59 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541%4]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 19:07:59 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Thread-Topic: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Thread-Index: AQHYX0HIkqOKjoOJ/k+YKhqMRITql60OVaUAgACVbwmAACrxAA==
Date: Wed, 4 May 2022 19:07:59 +0000
Message-ID: <3C811C58-AF56-412B-B567-1218076B7584@fb.com>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
 <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
 <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
In-Reply-To: <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84ce974e-e9fe-4214-44db-08da2e0167ab
x-ms-traffictypediagnostic: DM6PR15MB3484:EE_
x-microsoft-antispam-prvs: <DM6PR15MB3484CE244ECEE17DEDA77C16ACC39@DM6PR15MB3484.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x0Eoml5wufO03BMHgxt4+W0HptrRRK5m56s3khy10YWk9xESWR59PhpvvKtmV0A8VsMrfNNDefafJ7JoL3XtZ8Ly/BY429baeBxkU2Xs/u0GXwfwCU6t5QSxqGag4OgvJrxo9IdHiPhaNTk/W7zlQs7XZjLQrmOinIt63Leror8eluVPtO1Kn16oOXgSjeeHC4D9JNC1ONhom4squLn7UnTwjlogiBm5RevO6Za4bRse8qRC3ms/Ke2TcCJWqh+4y28s3RibINU/pRwybIeoBZwk//QgjcDieRWlYEGI1W3q8t9gNScNoIKRIZs56imB4FVEFYWKcIp1wl5rbedwX6kUZa94k27OvxgTAiPHB3PRcgCzJaQ8JcpkrAJ+hBZlXTgMakcdlKoxRVJfmS2sr4t7XRPfDsTu1EoZ0H3S4+0XuCxyw90XKAaCQJQkMa4FEiAgel+eL7ekgcWSCIe+3pBFMm1nZa75/8lFnvuaf9JNWYkzvq3vzeN+dZxe7J7mAC+soqvg4mq/05TtzraPT3B1GwFAAFrJYi2qhWqaNUYDVfMi+502qC+A7iEC7MwFgY7NRHjsJuVh/oK5G/Dg5G1HCo7xzW3VsH7HsMtrp1im5Pirz0y5/kq7oHEuEtKQW9DiG9i8CmQQz72RAELLt6i+D78swoJEKpn0+ViTwYotmx6xnbt3lGQkQ3xUZUQNNLTwt8sh8tg4zDx18iwWhArbKdKOWlYqQRM72y/3G1FnnT68VuxFhio03ZNyRRQVR9cYYioFLBrlOAjuZLawiCFnYO/uY+QdLLLaQt4b0II22yPGcvtqRpAPT5GwnCobc2TbPlXSslZ+dK/jBa47INT4KvC4V0E9vAOyqpnMsQQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(2616005)(86362001)(38070700005)(83380400001)(38100700002)(8676002)(71200400001)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(4326008)(36756003)(2906002)(8936002)(186003)(316002)(33656002)(5660300002)(6486002)(53546011)(508600001)(6512007)(6506007)(54906003)(966005)(6916009)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTNKbWN1bVhvdFNMZ1pGSmlDNHRuUlNvY0dpYktNZkNJRmdUMWNaSFR2bVBX?=
 =?utf-8?B?dUhId25uTzh1aUlzd1VWMGRScjlPQzJCdGJaZzlvQUErNFNMK2dTaE5qMkkw?=
 =?utf-8?B?K25lS2lDUWI3M2dlUHN6dG5mbUlxVU1JamYzb0QrUTdUY1RUYmxwOUlXa0dF?=
 =?utf-8?B?eWpVSXRzS2lJcjU5ZjRWYVVQUVpjSUl6Yjk2bjJON2hFSG9CeHljQWxLQlNT?=
 =?utf-8?B?MExEUDZaUTRHTmMzSnljSGNwSkNTU0NNcGhQTmlqVU9aeGZYRk05UC9wOVNk?=
 =?utf-8?B?bFJnTzlia24yY1VkNWVsVHFldDBodWMzazRFaFFWd25zcDJvUzlPUDB6NWU4?=
 =?utf-8?B?c3hTWGpwYUhMTytKVk5nQ3EzelhEZlVsV3dIY2ZvZjErQndmNThiZ2ppQXpW?=
 =?utf-8?B?L0NHUnRRY0ZmazBiV0dDSytWOGZ0VnlXN0hYTlhZZklkQllCVTN0RWxkM2h4?=
 =?utf-8?B?SnpEd0hFblVncU9NR2ltSUFPKzd6aVdmOXJOazVIR0lBRUk5TkExaG9nTWVV?=
 =?utf-8?B?Z0lsVHl1ZzF4ZFUzZE5xeXhNdDA4eWxYUi95L0xiek9rUHl5UlhiZHMrdzlQ?=
 =?utf-8?B?Zm1YVmJiTllRc2ZRV0djOGJxMml2YWFPdjcrR0RraUx2SHRWbTVORVVYTDlZ?=
 =?utf-8?B?OTA5eXZDY2p0Q0ZweEZELzZIMm5IQ08ySDhweDZWbmFkMWptQTZscGVvd1Ft?=
 =?utf-8?B?cTBSWXFFMWxtZU5PK2FITVNHcG05dXBPWUR0S1NEWnlJUXhJZGdoeTNFN2pQ?=
 =?utf-8?B?QVBMK3VRdzhnanNaTlpRRkZQN3M5TzFuM0RDQnJ3SXdvZUlHeE91YkYvZTlK?=
 =?utf-8?B?cWNQaVhnS3Z4WEoybGY2a3p0WlVJeWlXYURVOXpWRUFVMHI0clFya1VxMklW?=
 =?utf-8?B?TjNmM28wd3JsVExTaEZTUDJaVHFXcGFoeERpQ2FnbElnU0ZNTDAxQi9lZVBS?=
 =?utf-8?B?NlN5VUdiMzNIbkhNbzAzVjBLK3dDQUpEV1FuN1VWeFA1Z0taWW9yQUNyRDBx?=
 =?utf-8?B?WVVYeE0yN2pBWUdwdUlOL2xPSy9wTW5KM1poL01FNWFHR1Nlc0lDVkF4NGln?=
 =?utf-8?B?OUIzNlJCdHZ4VjNpd3lBQTF5cGlWOWlHdkE2ZG1TMkZITVhpUG1Eckc5OHJZ?=
 =?utf-8?B?S1l5U3dkRExNaGhJUFJNTkNLdXJTYmpIZjMycHVsaSsrdUlPYzh4VnhUWHRy?=
 =?utf-8?B?bThoMkpPcVo4UlpjZ0U3cnZEcGRvbE8yMTVDdG8yaHk1bUNOaWpVbCtxZ0My?=
 =?utf-8?B?UUZhSE5aclYzR3lvWWJXZ0k1RTB4WXY0amorS21zR2YzSWpNU3B0dG5GOERT?=
 =?utf-8?B?WThHV0czRnR1ZGxPZ2szY1BKTHFJRUFNTzFVcUxSMVpHcFVhc3E0dnNTNHhG?=
 =?utf-8?B?UWxJbWgyc3pXUzJHTi9IZzdUcVlwZlpkTG4rNjU4Y0pRZktob0dueUpmZlN1?=
 =?utf-8?B?bDNONC9DcU9VSXplTVlPVVBDWUYxc0FGNUlrdGNFOXMybmpRWmlYN2xERHps?=
 =?utf-8?B?dzMwSDhMOHcrUjZWNTZ1THZDN0s1UFR5WGVXY3FOM2pLVnBHSW1TMHZUZzR1?=
 =?utf-8?B?c0R6OVVXT1U5Q1lEMXREVkZ6UGhhNFpPaGErOC9vOS9XM2VXbkFIVG9XQ3B6?=
 =?utf-8?B?czJoNWttOHc4U3lwTWdoMlFTaVl5ak51cVJwWVNicklSN2dZWXdqNU95VmVT?=
 =?utf-8?B?R0lhdmw3U3M1dG5Yb0hhRVltYTZRWGR2M2IwNjk5dytPbzNrOEJNQ0dRRUkr?=
 =?utf-8?B?eGNLam1VSUUrbGhsYWsxZVdPTzRnQk5oVHliN2NGSGFNSThES2Q5djBjVXpO?=
 =?utf-8?B?OEk5RnZ6NndMNkROZ1NaUFF6Y0JmRFZHOGcwZFlZcXYzL29ibHlGa013b2tO?=
 =?utf-8?B?M2g3K1FPaGRpLzJRNlhpSXBqTXo0M3A3Y3h2WE5WRHNYc2pvZHB3cmRaOGNW?=
 =?utf-8?B?NnU5QkdneCtJOU43eTBNSzh2bDI2NU9zQXVkZDJRcERHRUJydFBYU1BDQURB?=
 =?utf-8?B?WVVjaVFURFNkWDFYbTQ1T1RjVHRjUjdyOTNTT25XbTB1YldSRGtHTUcyOEVy?=
 =?utf-8?B?KzF1R3JXNXJvZFYrbXZFN0pPd3BZaWg1clV1elBvbXdBaUVYQnJ2eDdPaFh4?=
 =?utf-8?B?MmJkQnRFZ3JSaWZoMDBZS2V6SDFwY0ljWXNlWklFWHkvTzczVE5ldmNKTVVs?=
 =?utf-8?B?dURnckw0ZUdBYUZINGUzTlg3SGE0VU1kN0FSd0hqNFFPR2F0MnRKa2wwVnFO?=
 =?utf-8?B?ell2T3R5N2Q4WU9GZVNJYThmSjRkaWNrMlNzVDFyNWk3Rzkra0tqT1JMNitq?=
 =?utf-8?B?WjJ4c0pJdzFrTUI0aFBuVUIyWm9NbldTNDZySFBSMTduaFk3bFpWS0JzK01E?=
 =?utf-8?Q?gdVYYPxoGsbcr68s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7ECC2FFCF6F4F4F83AB1B306AB5F980@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ce974e-e9fe-4214-44db-08da2e0167ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 19:07:59.5000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAwbCqvmtFq7qe9KqpAAsbU7m13HF+HUhdMxDG2uswP4+5eCZwMaRok/WfoTdMI/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3484
X-Proofpoint-ORIG-GUID: DPR89aY8RVhTRu_V9i4kOdB_nTqMhkeq
X-Proofpoint-GUID: DPR89aY8RVhTRu_V9i4kOdB_nTqMhkeq
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_05,2022-05-04_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6123628e29=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWF5IDQsIDIwMjIsIGF0IDk6MzQgQU0sIFBldGVyIERlbGV2b3J5YXMgPHBkZWxA
ZmIuY29tPiB3cm90ZToNCj4gDQo+PiANCj4+IE9uIE1heSA0LCAyMDIyLCBhdCAxMjozOSBBTSwg
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6DQo+PiANCj4+IO+7v09uIDUv
NC8yMiAwMDo1OSwgUGV0ZXIgRGVsZXZvcnlhcyB3cm90ZToNCj4+PiBBZGQgdGhlICdmYnkzNS1i
bWMnIG1hY2hpbmUgdHlwZSBiYXNlZCBvbiB0aGUga2VybmVsIERUU1sxXSBhbmQgdXNlcnNwYWNl
DQo+Pj4gaTJjIHNldHVwIHNjcmlwdHNbMl0uIFVuZGVmaW5lZCB2YWx1ZXMgYXJlIGluaGVyaXRl
ZCBmcm9tIHRoZSBBU1QyNjAwLUVWQi4NCj4+PiBSZWZlcmVuY2UgaW1hZ2VzIGNhbiBiZSBmb3Vu
ZCBpbiBGYWNlYm9vayBPcGVuQk1DIEdpdGh1YiBSZWxlYXNlIGFzc2V0cw0KPj4+IGFzICJmYnkz
NS5tdGQiLiBbM10NCj4+PiBZb3UgY2FuIGJvb3QgdGhlIHJlZmVyZW5jZSBpbWFnZXMgYXMgZm9s
bG93cyAoZmJ5MzUgdXNlcyBkdWFsLWZsYXNoKToNCj4+PiBxZW11LXN5c3RlbS1hcm0gLW1hY2hp
bmUgZmJ5MzUtYm1jIFwNCj4+PiAtZHJpdmUgZmlsZT1mYnkzNS5tdGQsZm9ybWF0PXJhdyxpZj1t
dGQgXA0KPj4+IC1kcml2ZSBmaWxlPWZieTM1Lm10ZCxmb3JtYXQ9cmF3LGlmPW10ZCBcDQo+Pj4g
LW5vZ3JhcGhpYw0KPj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJtYy1s
aW51eC9ibG9iLzQxMmQ1MDUzMjU4MDA3MTE3ZTk0YjFlMzYwMTVhZWZjMTMwMTQ3NGIvYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1mYWNlYm9vay1mYnkzNS5kdHMNCj4+PiBbMl0gaHR0cHM6
Ly9naXRodWIuY29tL2ZhY2Vib29rL29wZW5ibWMvYmxvYi9lMjI5NGZmNWQzMWRkNjVjMjQ4ZmUz
OTZhMzg1Mjg2ZDZkNWM0NjNkL21ldGEtZmFjZWJvb2svbWV0YS1mYnkzNS9yZWNpcGVzLWZieTM1
L3BsYXQtdXRpbHMvZmlsZXMvc2V0dXAtZGV2LnNoDQo+Pj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNv
bS9mYWNlYm9vay9vcGVuYm1jL3JlbGVhc2VzDQo+Pj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVs
ZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+PiANCj4+IFJldmlld2VkLWJ5OiBDw6lkcmljIExlIEdv
YXRlciA8Y2xnQGthb2Qub3JnPg0KPiANCj4gVGhhbmtzIQ0KPiANCj4+IA0KPj4gYSBxdWVzdGlv
biBiZWxvdywNCj4+IA0KPj4+IC0tLQ0KPj4+IHYyOiBSZW1vdmVkIGF2b2NhZG8gdGVzdCwgdXBk
YXRlZCBjb21taXQgbWVzc2FnZS4NCj4+PiBody9hcm0vYXNwZWVkLmMgfCA2MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gMSBmaWxlIGNoYW5n
ZWQsIDYzIGluc2VydGlvbnMoKykNCj4+PiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZC5jIGIv
aHcvYXJtL2FzcGVlZC5jDQo+Pj4gaW5kZXggYTc0YzEzYWIwZi4uNzI1YzE2OTQ4OCAxMDA2NDQN
Cj4+PiAtLS0gYS9ody9hcm0vYXNwZWVkLmMNCj4+PiArKysgYi9ody9hcm0vYXNwZWVkLmMNCj4+
PiBAQCAtMjEsNiArMjEsNyBAQA0KPj4+ICNpbmNsdWRlICJody9taXNjL2xlZC5oIg0KPj4+ICNp
bmNsdWRlICJody9xZGV2LXByb3BlcnRpZXMuaCINCj4+PiAjaW5jbHVkZSAic3lzZW11L2Jsb2Nr
LWJhY2tlbmQuaCINCj4+PiArI2luY2x1ZGUgInN5c2VtdS9yZXNldC5oIg0KPj4+ICNpbmNsdWRl
ICJody9sb2FkZXIuaCINCj4+PiAjaW5jbHVkZSAicWVtdS9lcnJvci1yZXBvcnQuaCINCj4+PiAj
aW5jbHVkZSAicWVtdS91bml0cy5oIg0KPj4+IEBAIC05NTEsNiArOTUyLDM1IEBAIHN0YXRpYyB2
b2lkIGJsZXRjaGxleV9ibWNfaTJjX2luaXQoQXNwZWVkTWFjaGluZVN0YXRlICpibWMpDQo+Pj4g
aTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzEyXSwgVFlQRV9QQ0E5NTUyLCAweDY3KTsNCj4+
PiB9DQo+Pj4gK3N0YXRpYyB2b2lkIGZieTM1X2kyY19pbml0KEFzcGVlZE1hY2hpbmVTdGF0ZSAq
Ym1jKQ0KPj4+ICt7DQo+Pj4gKyBBc3BlZWRTb0NTdGF0ZSAqc29jID0gJmJtYy0+c29jOw0KPj4+
ICsgSTJDQnVzICppMmNbMTZdOw0KPj4+ICsNCj4+PiArIGZvciAoaW50IGkgPSAwOyBpIDwgMTY7
IGkrKykgew0KPj4+ICsgaTJjW2ldID0gYXNwZWVkX2kyY19nZXRfYnVzKCZzb2MtPmkyYywgaSk7
DQo+Pj4gKyB9DQo+Pj4gKw0KPj4+ICsgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzJdLCBU
WVBFX0xNNzUsIDB4NGYpOw0KPj4+ICsgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzhdLCBU
WVBFX1RNUDQyMSwgMHgxZik7DQo+Pj4gKyAvKiBIb3Rzd2FwIGNvbnRyb2xsZXIgaXMgYWN0dWFs
bHkgc3VwcG9zZWQgdG8gYmUgbXA1OTIwIG9yIGx0YzQyODIuICovDQo+Pj4gKyBpMmNfc2xhdmVf
Y3JlYXRlX3NpbXBsZShpMmNbMTFdLCAiYWRtMTI3MiIsIDB4NDQpOw0KPj4+ICsgaTJjX3NsYXZl
X2NyZWF0ZV9zaW1wbGUoaTJjWzEyXSwgVFlQRV9MTTc1LCAweDRlKTsNCj4+PiArIGkyY19zbGF2
ZV9jcmVhdGVfc2ltcGxlKGkyY1sxMl0sIFRZUEVfTE03NSwgMHg0Zik7DQo+Pj4gKw0KPj4+ICsg
YXNwZWVkX2VlcHJvbV9pbml0KGkyY1s0XSwgMHg1MSwgMTI4ICogS2lCKTsNCj4+PiArIGFzcGVl
ZF9lZXByb21faW5pdChpMmNbNl0sIDB4NTEsIDEyOCAqIEtpQik7DQo+Pj4gKyBhc3BlZWRfZWVw
cm9tX2luaXQoaTJjWzhdLCAweDUwLCAzMiAqIEtpQik7DQo+Pj4gKyBhc3BlZWRfZWVwcm9tX2lu
aXQoaTJjWzExXSwgMHg1MSwgMTI4ICogS2lCKTsNCj4+PiArIGFzcGVlZF9lZXByb21faW5pdChp
MmNbMTFdLCAweDU0LCAxMjggKiBLaUIpOw0KPj4+ICsNCj4+PiArIC8qDQo+Pj4gKyAqIFRPRE86
IFRoZXJlIGlzIGEgbXVsdGktbWFzdGVyIGkyYyBjb25uZWN0aW9uIHRvIGFuIEFTVDEwMzAgTWlu
aUJNQyBvbg0KPj4+ICsgKiBidXNlcyAwLCAxLCAyLCAzLCBhbmQgOS4gU291cmNlIGFkZHJlc3Mg
MHgxMCwgdGFyZ2V0IGFkZHJlc3MgMHgyMCBvbg0KPj4+ICsgKiBlYWNoLg0KPj4+ICsgKi8NCj4+
IA0KPj4gDQo+PiBIYXZlIHlvdSBjb25zaWRlcmVkIGV4dGVuZGluZyB0aGUgZW11bGF0aW9uIHRv
IGluY2x1ZGUgYSBBU1QxMDMwIFNvQw0KPj4gaW4gYSBsYXJnZXIgbWFjaGluZSA/DQo+PiANCj4+
IFRoZSBBU1QxMDMwIFNvQyBpcyBtZXJnZWQgYW5kIEkgdGhpbmsgdGhhdCBRRU1VIGNvdWxkIHJ1
biBhIGNvcnRleC1tNA0KPj4gQ1BVIGFuZCBhIEE3IENQVS4gQSArIFIgQ1BVcyBpcyBzdXBwb3J0
ZWQgKFhpbGlueCBib2FyZHMpLg0KPj4gDQo+IA0KPiBBcyBhIG1hdHRlciBvZiBmYWN0IHllcyEg
SSB0ZXN0ZWQgYm9vdGluZyBvdXIgT3BlbkJJQyBaZXBoeXIga2VybmVsIGxhc3Qgd2VlayB3aXRo
IHRoZSAxMDMwLCB0aGF0IHdvcmtlZC4gSSBhbHNvIHVzZWQgdGhlIGV4cGVyaW1lbnRhbCBpMmMg
bXVsdGktbWFzdGVyIHBhdGNoZXMgZnJvbSBLbGF1cyB0byBtYWtlIGEgaTJjLW5ldGRldiBkZXZp
Y2UgdGhhdCBjb25uZWN0cyB0d28gc2VwYXJhdGUgUUVNVSBpbnN0YW5jZXMgdGhyb3VnaCBhIHNv
Y2tldCBhbmQgc2VuZHMgdGhlaXIgaTJjIG1lc3NhZ2VzIGJhY2sgYW5kIGZvcnRoLiBJIHdhcyBh
YmxlIHRvIHRlc3QgYSBiYXNpYyBNQ1RQIHRyYW5zYWN0aW9uLg0KPiANCj4gSeKAmW0gaG9waW5n
IHRvIGhlbHAgaG93ZXZlciBwb3NzaWJsZSB3aXRoIG1lcmdpbmcgS2xhdXPigJlzIGNoYW5nZXMs
IGFuZCB0aGVuIHByb3Bvc2UgdGhlIGkyYy1uZXRkZXYgdGhpbmcgdG9vLg0KDQpPaCB3YWl0IGEg
bWludXRlOiBZb3UgbWVhbiBJIGNvdWxkIGluY2x1ZGUgYm90aCBTb0PigJlzIGluIG9uZSBtYWNo
aW5lPyBPaCB0aGF04oCZcyBhIGdvb2QgaWRlYSBhY3R1YWxseS4gTWF5YmUgSeKAmWxsIGxvb2sg
aW50byB0aGF0IGFzIGFuIGFsdGVybmF0aXZlIHRvIHRoZSBzb2NrZXQgdGhpbmcuIFN0aWxsLCBp
dCBtaWdodCBiZSBzb21ldGhpbmcgdXNlZnVsIHRvIHN1Ym1pdCBhbnl3YXlzLg0KDQo+IA0KPj4g
VGhhbmtzLA0KPj4gDQo+PiBDLg0KPj4gDQo+PiANCj4+PiArfQ0KPj4+ICsNCj4+PiBzdGF0aWMg
Ym9vbCBhc3BlZWRfZ2V0X21taW9fZXhlYyhPYmplY3QgKm9iaiwgRXJyb3IgKiplcnJwKQ0KPj4+
IHsNCj4+PiByZXR1cm4gQVNQRUVEX01BQ0hJTkUob2JqKS0+bW1pb19leGVjOw0KPj4+IEBAIC0x
MjkzLDYgKzEzMjMsMzUgQEAgc3RhdGljIHZvaWQgYXNwZWVkX21hY2hpbmVfYmxldGNobGV5X2Ns
YXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0KPj4+IGFzcGVlZF9zb2NfbnVt
X2NwdXMoYW1jLT5zb2NfbmFtZSk7DQo+Pj4gfQ0KPj4+ICtzdGF0aWMgdm9pZCBmYnkzNV9yZXNl
dChNYWNoaW5lU3RhdGUgKnN0YXRlKQ0KPj4+ICt7DQo+Pj4gKyBBc3BlZWRNYWNoaW5lU3RhdGUg
KmJtYyA9IEFTUEVFRF9NQUNISU5FKHN0YXRlKTsNCj4+PiArIEFzcGVlZEdQSU9TdGF0ZSAqZ3Bp
byA9ICZibWMtPnNvYy5ncGlvOw0KPj4+ICsNCj4+PiArIHFlbXVfZGV2aWNlc19yZXNldCgpOw0K
Pj4+ICsNCj4+PiArIC8qIEJvYXJkIElEICovDQo+Pj4gKyBvYmplY3RfcHJvcGVydHlfc2V0X2Jv
b2woT0JKRUNUKGdwaW8pLCAiZ3Bpb1Y0IiwgdHJ1ZSwgJmVycm9yX2ZhdGFsKTsNCj4+PiArIG9i
amVjdF9wcm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoZ3BpbyksICJncGlvVjUiLCB0cnVlLCAmZXJy
b3JfZmF0YWwpOw0KPj4+ICsgb2JqZWN0X3Byb3BlcnR5X3NldF9ib29sKE9CSkVDVChncGlvKSwg
ImdwaW9WNiIsIHRydWUsICZlcnJvcl9mYXRhbCk7DQo+Pj4gKyBvYmplY3RfcHJvcGVydHlfc2V0
X2Jvb2woT0JKRUNUKGdwaW8pLCAiZ3Bpb1Y3IiwgZmFsc2UsICZlcnJvcl9mYXRhbCk7DQo+Pj4g
K30NCj4+PiArDQo+Pj4gK3N0YXRpYyB2b2lkIGFzcGVlZF9tYWNoaW5lX2ZieTM1X2NsYXNzX2lu
aXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0KPj4+ICt7DQo+Pj4gKyBNYWNoaW5lQ2xh
c3MgKm1jID0gTUFDSElORV9DTEFTUyhvYyk7DQo+Pj4gKyBBc3BlZWRNYWNoaW5lQ2xhc3MgKmFt
YyA9IEFTUEVFRF9NQUNISU5FX0NMQVNTKG9jKTsNCj4+PiArDQo+Pj4gKyBtYy0+ZGVzYyA9ICJG
YWNlYm9vayBmYnkzNSBCTUMgKENvcnRleC1BNykiOw0KPj4+ICsgbWMtPnJlc2V0ID0gZmJ5MzVf
cmVzZXQ7DQo+Pj4gKyBhbWMtPmZtY19tb2RlbCA9ICJteDY2bDFnNDVnIjsNCj4+PiArIGFtYy0+
bnVtX2NzID0gMjsNCj4+PiArIGFtYy0+bWFjc19tYXNrID0gQVNQRUVEX01BQzNfT047DQo+Pj4g
KyBhbWMtPmkyY19pbml0ID0gZmJ5MzVfaTJjX2luaXQ7DQo+Pj4gKyAvKiBGSVhNRTogUmVwbGFj
ZSB0aGlzIG1hY3JvIHdpdGggc29tZXRoaW5nIG1vcmUgZ2VuZXJhbCAqLw0KPj4+ICsgbWMtPmRl
ZmF1bHRfcmFtX3NpemUgPSBGVUpJX0JNQ19SQU1fU0laRTsNCj4+PiArfQ0KPj4+ICsNCj4+PiAj
ZGVmaW5lIEFTVDEwMzBfSU5URVJOQUxfRkxBU0hfU0laRSAoMTAyNCAqIDEwMjQpDQo+Pj4gLyog
TWFpbiBTWVNDTEsgZnJlcXVlbmN5IGluIEh6ICgyMDBNSHopICovDQo+Pj4gI2RlZmluZSBTWVND
TEtfRlJRIDIwMDAwMDAwMFVMTA0KPj4+IEBAIC0xNDExLDYgKzE0NzAsMTAgQEAgc3RhdGljIGNv
bnN0IFR5cGVJbmZvIGFzcGVlZF9tYWNoaW5lX3R5cGVzW10gPSB7DQo+Pj4gLm5hbWUgPSBNQUNI
SU5FX1RZUEVfTkFNRSgiYmxldGNobGV5LWJtYyIpLA0KPj4+IC5wYXJlbnQgPSBUWVBFX0FTUEVF
RF9NQUNISU5FLA0KPj4+IC5jbGFzc19pbml0ID0gYXNwZWVkX21hY2hpbmVfYmxldGNobGV5X2Ns
YXNzX2luaXQsDQo+Pj4gKyB9LCB7DQo+Pj4gKyAubmFtZSA9IE1BQ0hJTkVfVFlQRV9OQU1FKCJm
YnkzNS1ibWMiKSwNCj4+PiArIC5wYXJlbnQgPSBNQUNISU5FX1RZUEVfTkFNRSgiYXN0MjYwMC1l
dmIiKSwNCj4+PiArIC5jbGFzc19pbml0ID0gYXNwZWVkX21hY2hpbmVfZmJ5MzVfY2xhc3NfaW5p
dCwNCj4+PiB9LCB7DQo+Pj4gLm5hbWUgPSBNQUNISU5FX1RZUEVfTkFNRSgiYXN0MTAzMC1ldmIi
KSwNCj4+PiAucGFyZW50ID0gVFlQRV9BU1BFRURfTUFDSElORSwNCg0K

