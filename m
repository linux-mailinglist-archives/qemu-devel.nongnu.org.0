Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7C65119A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:15:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Ke8-0004st-To; Mon, 19 Dec 2022 13:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3352ecff70=pdel@meta.com>)
 id 1p7IXA-0005ej-4q
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:58:32 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3352ecff70=pdel@meta.com>)
 id 1p7IX8-0001kT-Ft
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:58:31 -0500
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJFK5dY003807; Mon, 19 Dec 2022 07:58:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 content-type : content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=DdIddRWQOXZV4Il+zOrOV/2+4k9h4/cHtDKlhWAz2/U=;
 b=BBdLnR1M9nmRh6ikZSRUgldP2JvThCZULENEzHmvzkEl+k86oigkV9Px2AgH2jzatj25
 GPKM4CsYBOXsNsxkY0e2ODWBR2Vz7zIRCH2KrANA9cyzqO3qSer0+h4p0vXnb+FuYXZK
 8HYVCBBYL513hR/fE8ckzEhzMq9x3Xp7xRNqeRRipw6nCXlN+bbqei1d9VEcnF9RjUFl
 3ZDAfMKfjymBGaC65zQrZAN6aLMH/eSiWnSwn8DQ1D0pKX79a9Xp88mj2yIqDvTvfjyu
 Acudk06RIqZqUNMx9l1Z6SR5Ra06d9c8FihTOo2OYB4Y8vVWyeF4B5RBDMpqfmH9zS8V MQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3mh9ys7k18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 07:58:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwH4a0eXy4pHDd1q6OK+poyWr+cZ0JsSz4hp3argkhXWAwZ0Te3I5oF46ZEryRTmhweOnBAkiLuKugZW3wJsO5zfGDbUcnVAXwnAv1ionE/2p48AwZrD44T0LyzEyCgvBPy5DX2JPXm5xulVqrEfT7YCnejDTHFipul7IUOivHJblN4HlcRBSLGbgMhPPa2gPr+7/qOMutbVJbYPyzbBSyAkeq5BxkHiuKJpPVWjqbOcjAcaApkrm1REzc9Rh5MbFegCQ/6veItlCABG6EXadnA/jtMUuxv/CuhuPDJQvqGaz4ScMd0oAvjTWFwjjerdLGGOjKFXekpQMLEEcPCyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdIddRWQOXZV4Il+zOrOV/2+4k9h4/cHtDKlhWAz2/U=;
 b=neQbrbep5mMA9nDZfccsw5CUJMvOv+T4hAqlo1ezejiuVvAjV+ebYcauy/+B50flh9HvrzWhIsPFqbgdqxCUbxEuHEQwYbFRCOfjk5dWB+RLLNpAqOGGoMCnV/OiIwk8PfZWLznwX/6Df/zZld58JhSBijr6PM8f+NKtF+voW/oQ4bOr62IRWW6lgInAskGoTVCnFvUNS+IrYqFfx3MhDJ33PHwKjs7bEXuQ+GbyOnLHXRRV4Rw3IJOyuXp25NCzXGto/vGpprIIBSvRiVSdQFjbpPoZOvVqvZ20P8ex2peGffrm49c5Wf7L8z36Osu+gt4TdYez2XYLWhKuHWOCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BN6PR15MB1363.namprd15.prod.outlook.com (2603:10b6:404:c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 15:58:25 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::4084:2548:f657:d950]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::4084:2548:f657:d950%3]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 15:58:25 +0000
From: Peter Delevoryas <pdel@meta.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: Peter Delevoryas <pdel@meta.com>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>, Iris Chen
 <irischenlj@fb.com>, Daniel Mueller <muellerd@meta.com>
Subject: Re: [PATCH 08/11] contrib/gitdm: Add Facebook the domain map
Thread-Topic: [PATCH 08/11] contrib/gitdm: Add Facebook the domain map
Thread-Index: AQHZE6QhLDDngQII9kW5GzQZ/01CO651VC4AgAAHZQCAAAHrAIAAAKAA
Date: Mon, 19 Dec 2022 15:58:25 +0000
Message-ID: <5A6974DF-454E-4146-A20A-D66EF087F10F@meta.com>
References: <20221219121914.851488-9-alex.bennee@linaro.org>
 <052012F1-2E78-40FC-990B-6AA3C95FDB37@pjd.dev>
 <4d316fbd-963b-6fd6-fb70-708719cdcacb@linaro.org>
 <83112C4B-A6EE-4903-BF83-BF61E8DDF926@meta.com>
In-Reply-To: <83112C4B-A6EE-4903-BF83-BF61E8DDF926@meta.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR15MB3032:EE_|BN6PR15MB1363:EE_
x-ms-office365-filtering-correlation-id: 5d59cd4b-7d86-4f08-93c9-08dae1d9dca3
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BcX+tsxi4k+u7jI8oxlYUf5Z5aqxwhATZgBtFMpowAkr7n/9A60GxbetPDMEBy/oiDyTI/reATBZKe76ahtrNT1zuvgWXiWj75jt6cWSyqnVJiets8YFukmkP5vfk9hecdr9UdkasDQrkULzbPfSugWv2AbaW/NsU+Byp+suxXikcdI9omkW0JIU2col9ZWktkHK+AkfUsiGY7kN+OCyXiv2mCgB0E9ND/Df7MZXPjuXtJysIjzfHHfNHalPLHjmRT/Z3eUNE5v8I2NCNHonHrLs2jSJx9oOmhV+H41uy/Jzfb9l7B1SzlTw8YJuAADnc6friS8FlfRxjZYk3cXHhOn3kPW3uHJcQj6E0ik2fALmBBUEMTf7N5nh0JQfO8auhGJvy1j3lL9IrvnZmPdjL+TRV3NogkSsq8zppzgYYGcEf/NOZCgWLmoj4TgKNA5UwPq5VurenCVqGCVtLE/CmagFdBMc9tDoC+zR1pz5Yh+UB3k3Lqiz3fnDkzthQoZ/ujdVlrOij9SsCwvYXXR2HCZkLIj1Z1vBjpX6WFcwOiuZNtU4SR38Dh7SjP6a/ouSVdY2PFq/Zo/Lx6bpoRUd6glAlYGUylEjrAUidAkgYnVzqZAJB8FJicGnjIeQdwtVmD907R3H9zRAmIqt5qH735clmeaPMr3q+NmKJN337feoCq6B6LYK1KXSEnuuRSdWRnTmAgVCL1dTZG8qUh+4Ej0MGf+JQAzzjbuEBW7aleQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(47680400002)(451199015)(64756008)(33656002)(2906002)(86362001)(8676002)(4326008)(66446008)(66476007)(76116006)(186003)(6512007)(66556008)(2616005)(478600001)(41300700001)(71200400001)(6916009)(53546011)(6506007)(54906003)(316002)(107886003)(122000001)(38070700005)(38100700002)(8936002)(5660300002)(6486002)(66946007)(66574015)(83380400001)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG5VbWlIRlQra1ZoeDhBV252TE9DUXpMQjJxT1NORG9rSnlNc0lXcDgrcDE0?=
 =?utf-8?B?TFBsMEpyY1dRb3pjTGlFcjUxMkJyU20wdm5FeGJmWTU0eURFTGRWNDI4T1du?=
 =?utf-8?B?cmpVMVFvMUEremNlM0pDMmlqK1AyM1dNR3lFWlRDNmF5TDNOU0M0UE5ySU1W?=
 =?utf-8?B?UlBIYzVTeWREQVJHbDM3Qklmd2YvZzRpNmRrY2xBV2ZobjRBdnVLdk1BMVB2?=
 =?utf-8?B?Q0QzRWpFSEJBUnlxdmxtdXlWZkd0Z1JueTBId0w2RlhuWkZ6ekZyR0owVzJJ?=
 =?utf-8?B?elV4TXJmNUI2ZFFkVXVjTkJFOHFoeG4vUXZaRGtkV3NmVkpCWXlYeVRPYTB3?=
 =?utf-8?B?WG1ONEpQMHR2cW01VDFycldWTDNKeTQwMXh0RU9ub1VpbE1uM2hSVnFIRDRR?=
 =?utf-8?B?MUhZVHdzN1hYY1Y5K1krL3IrY1Z3cHF4VjdoWnpIUi9rUGUzbDNQVHdEOFBv?=
 =?utf-8?B?RjB5RE15ZlM5d2ZJRzczV0t6bFlGeTlJT09ROFZNcE5Qa2dVbEM4VHNTYnN5?=
 =?utf-8?B?azY4RTRBM2ZNTStRZ3NCZFkzV0F1MVh0VTZGSUVDbU9aekNNbmtyL0JoU0JY?=
 =?utf-8?B?TUNWRTQyL01iMnF3WTRYTmZDY2FGVFQxVFpzS1F1dzVld3k2Y0hXOWJzYkFZ?=
 =?utf-8?B?Wjk3d0ZuakxQbGhqUW1nYmdDQlBUeGVETkQzaThRZnBWbkJzcnJ3WTNOaWlR?=
 =?utf-8?B?dkIwNitwV2JNWWkxZ0FZQmszUm9WSndFREswRjdtWmZWTnRZNmNZbytzdDg3?=
 =?utf-8?B?bTJFUmplbUNRN213V2JSSm5nQUxrRTB0UnZ6M2FyMVladHA5UWNQQUc4Sk5P?=
 =?utf-8?B?QS9Ia3JDRXVjZDFoODI3RGhIZnlpczNWT05NaDNzbDZIYmo1eDY3a2V5V1Q0?=
 =?utf-8?B?ZGJnZjlYUVR0Y3ZEZFNTNkUrdU00KzJXV2l3UU9iVktTcmN2OXVvUGlZNmJO?=
 =?utf-8?B?amJEVmJmbWsyMDE4K1l2d05XcnVYUGt4UVJKei9RTkExSEdycHBnNTloNUVM?=
 =?utf-8?B?RDA4MmYwYXRqVGlEYjU1ZDJKT1ZOTEFmL0JZMHBSUlF4TVpSNzVtSDNibllm?=
 =?utf-8?B?S05oV3ZKcXR2WXFaTWdaalROSXFQNXdiSmNweXllQ2dtMHdxbFl3OFNOV04v?=
 =?utf-8?B?UUhkYzdMZzlBcXg1YnpHWHlrdXEzZnkyTlJqdkhSOW1KdldIaVNDamlaZHlS?=
 =?utf-8?B?Zko3RG5YSjRCK1AzRFhuYi90SjhFTXlxL0V3N2oyUjcxWGRPbjR0enBIRGp4?=
 =?utf-8?B?bXMrTmw1VHVhL2xHd1ZZWXhMYk1TU0EwUmZBcGltbkFRdEVFb25scEl4SmV4?=
 =?utf-8?B?ZlFpTHZuT3dob2x1ZnhlUWpBeG43TXBHNDY0aFhBOWk4WmZoc3djUzJBNlNq?=
 =?utf-8?B?djBMV01yZ2Zmcjh0Kyt0cHU4aG1LNGo4bXdBNTZlTlUvTTBwNU5lazF0ODRK?=
 =?utf-8?B?OWMwZmI3NlMweUZ3Z215SFNzemdqSnpMY3RnQS9QU3FEbmhOaG1ZaDVTN1lO?=
 =?utf-8?B?amtzMEtYNmlKQVhlVG0yYWY0T2ZWUy9KVjRKUW83Z3h1MjF5R1VGRk82NFBH?=
 =?utf-8?B?M2w3SE0xZnY4K29rRUZ1SXJhdENVejg3R09HVFdmYytmNTQrWjZ3TmFPRnpt?=
 =?utf-8?B?cnZxdU9MMmUvcXdCVlVBZ1h0L2I0WTh1UEdITUVEK21GOG80RU96NHN5Sm9k?=
 =?utf-8?B?V0pmd3RrcFNJTzViYTR4alN3UDFjN010Ri9LNnZ1UDJ0R0tPeGJlVHhwY0Z6?=
 =?utf-8?B?U0ttT1prS3ExMTIzWnpUNDFYWUxFekhqdDF6MjRjZXdPcVRaa1VPSUhQVjRG?=
 =?utf-8?B?L0ttYTc2M1FFV3JFTDhNTWVTZlRKbUh4aEUrbmVtRlNJWmplNzNJMFlDRWRL?=
 =?utf-8?B?RWpzVHJqejZhdjhYY3BaOVpDdUxKR3BrcGdDSnBLUnkwSUJIQUVGZ1lLWC9z?=
 =?utf-8?B?M1lhQmcvZk9uWEwrOVFJNE9QcS9VdUNCUGRxZmhKNDZZTzBwUVZuYVhBUkY5?=
 =?utf-8?B?Q2tCNWdwYWZOaFdhdml0RVFUckRjeGpCRERnZEYwemlZaTR4TTRWblB2OE5V?=
 =?utf-8?B?NDViTTQvOWdLbWE4bWNvOTB2N0UxTFVOK3M1Q0R0WmhleTNCcFYzbmp2NzVn?=
 =?utf-8?B?bWxWeWhNRTVjL21YSkhYTXlmeUdIY0JkbHlVdit3bUhLUjhyNDBSbXRGMTZt?=
 =?utf-8?B?V0E9PQ==?=
Content-ID: <CB468EEED0940146BB85CB4E8FE90FD3@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d59cd4b-7d86-4f08-93c9-08dae1d9dca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 15:58:25.1738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3buVLS0MuVBeWagZ9mNypCS+AeXV5VH2AVaCiG9g17ODKFZpNFr+Rq0qKahDC0Qc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1363
X-Proofpoint-ORIG-GUID: wFdxhARhQAq2WGXaybBk9r47QzzQZ1bL
X-Proofpoint-GUID: wFdxhARhQAq2WGXaybBk9r47QzzQZ1bL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=3352ecff70=pdel@meta.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Dec 2022 13:13:50 -0500
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

DQoNCj4gT24gRGVjIDE5LCAyMDIyLCBhdCA3OjU2IEFNLCBQZXRlciBEZWxldm9yeWFzIDxwZGVs
QG1ldGEuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIERlYyAxOSwgMjAyMiwgYXQgNzo0
OSBBTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPiB3cm90ZToN
Cj4+IA0KPj4gIS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS18DQo+PiBUaGlzIE1lc3NhZ2UgSXMgRnJvbSBhbiBFeHRlcm5h
bCBTZW5kZXINCj4+IA0KPj4gfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0hDQo+PiANCj4+IE9uIDE5LzEyLzIyIDE2OjIy
LCBQZXRlciBEZWxldm9yeWFzIHdyb3RlOg0KPj4+PiBPbiBEZWMgMTksIDIwMjIsIGF0IDQ6MTkg
QU0sIEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4+IA0K
Pj4+PiDvu78hLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLXwNCj4+Pj4gVGhpcyBNZXNzYWdlIElzIEZyb20gYW4gRXh0ZXJu
YWwgU2VuZGVyDQo+Pj4+IA0KPj4+PiB8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSENCj4+Pj4gDQo+Pj4+IEEgbnVtYmVy
IG9mIEZhY2Vib29rIGRldmVsb3BlcnMgY29udHJpYnV0ZSB0byB0aGUgcHJvamVjdC4gUGV0ZXIg
Y2FuDQo+Pj4+IHlvdSBjb25maXJtIHlvdXIgd2FudCBwamQuZGV2IGNvbnRyaWJ1dGlvbnMgY291
bnRlZCBoZXJlIG9yIGFzDQo+Pj4+IGFuIGluZGl2aWR1YWwgY29udHJpYnV0b3I/DQo+Pj4gT2gs
IGhleTogeWVzIEkgY2FuIGNvbmZpcm0gdGhhdCwgSSB3YW50IHBqZC5kZXYgY29udHJpYnV0aW9u
cyBjb3VudGVkIGhlcmUgYXMgZmIgc3R1ZmYuDQo+Pj4gQnkgdGhlIHdheTogcmVjZW50bHksIGV2
ZXJ5IEZhY2Vib29rIGRldmVsb3BlcnMgZW1haWwgaGFzIG1pZ3JhdGVkIHRvIOKAnHVzZXJuYW1l
QG1ldGEuY29t4oCdLiBTbyBub3cgYWxsIG15IGZiLmNvbSBlbWFpbCBnb2VzIHRvIG15IG1ldGEu
Y29tIGluYm94LiBXZSBtYXkgb3IgbWF5IG5vdCB3YW50IHRvIGluY2x1ZGUgYm90aCBlbWFpbHMu
IEkgdGhpbmsgdGhlIGZiLmNvbSBlbWFpbHMgd2lsbCBzdGF5IGFyb3VuZCBmb3IgcXVpdGUgYSB3
aGlsZSwgYnV0IHllYWguDQo+PiANCj4+IGdpdGRtIHRvb2wgaXMgb25seSB1c2UgdG8gZGlzcGxh
eSBzdGF0aXN0aWNzIGZyb20geW91ciBwYXN0DQo+PiBjb250cmlidXRpb25zLiBJZiB5b3Ugd2Fu
dCB0aGUgZ2V0X21haW50YWluZXJzLnBsIHNjcmlwdCB0bw0KPj4gdXNlIHlvdXIgdXBkYXRlZCBl
bWFpbCBhZGRyZXNzLCB5b3UgcHJvYmFibHkgd2FudCB0byBzZW5kIGENCj4+IHBhdGNoIHRvIHVw
ZGF0ZSB0aGUgLm1haWxtYXAgZmlsZS4NCj4gDQo+IE9rOiBhdCB0aGlzIHBvaW50LCBJIGp1c3Qg
dXNlIHBldGVyQHBqZC5kZXYgPG1haWx0bzpwZXRlckBwamQuZGV2PiBiZWNhdXNlIHRoZSBlbWFp
bCBmaWx0ZXJzIGF0IEZhY2Vib29rIGFyZSBzbyBvbmVyb3VzIGFuZCBkcm9wIHRoaW5ncyBteXN0
ZXJpb3VzbHkgYWxsIHRoZSB0aW1lLCBzbyBJ4oCZbGwgcHJvYmFibHkganVzdCBrZWVwIHVzaW5n
IHRoYXQgSSBndWVzcy4gQnV0IG1heWJlIEnigJlsbCB0cnkgc3VibWl0dGluZyBhIHNpbmdsZSBw
YXRjaCBhcyBwZGVsQG1ldGEuY29tIDxtYWlsdG86cGRlbEBtZXRhLmNvbT4gc29tZXRpbWUuDQoN
Ck9oLCBhbG1vc3QgZm9yZ290Og0KDQpSZXZpZXdlZC1ieTogUGV0ZXIgRGVsZXZvcnlhcyA8cGV0
ZXJAcGpkLmRldiA8bWFpbHRvOnBldGVyQHBqZC5kZXY+Pg0KDQo+IA0KPiBUaGFua3MhDQo+IFBl
dGVyDQo+IA0KPj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5u
ZWVAbGluYXJvLm9yZz4NCj4+Pj4gQ2M6IElyaXMgQ2hlbiA8aXJpc2NoZW5sakBmYi5jb20+DQo+
Pj4+IENjOiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+Pj4gQ2M6IFBldGVyIERl
bGV2b3J5YXMgPHBldGVyQHBqZC5kZXY+DQo+Pj4+IENjOiBEYW5pZWwgTcO8bGxlciA8bXVlbGxl
cmRAZmIuY29tPg0KPj4+PiAtLS0NCj4+Pj4gY29udHJpYi9naXRkbS9kb21haW4tbWFwICAgICAg
ICAgfCAxICsNCj4+Pj4gY29udHJpYi9naXRkbS9ncm91cC1tYXAtZmFjZWJvb2sgfCA1ICsrKysr
DQo+Pj4+IGdpdGRtLmNvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgMSArDQo+Pj4+IDMgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb250
cmliL2dpdGRtL2dyb3VwLW1hcC1mYWNlYm9vaw0KDQoNCg==

