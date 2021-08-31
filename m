Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC993FC975
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:15:03 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4XW-000161-Bi
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mL4BN-0007xV-HF; Tue, 31 Aug 2021 09:52:09 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:12962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mL4BL-0005pf-28; Tue, 31 Aug 2021 09:52:08 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17VDYWqo028527; Tue, 31 Aug 2021 06:51:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=8i6zdcy/HSVWxXYgnSlGYUVa1Ccl1EqTxVQQ+j96GDA=;
 b=L0pj0EXDO4asDLsfocdID40hgpbH5BHxRPhJzSDUuxIJZnDa/FsnfHsMm2Z4i0poNpnb
 Q5yfPuWBtVbLlFEcKKKSxJk0u4HfxVPWAzaaMwjbmunAskCAcvpz/GrsYnTPvnpR2kXV
 BxfDYzdeY51EuCiRFKc6zmAP7Fq1hup/lIs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3artue2bvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Aug 2021 06:51:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 31 Aug 2021 06:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvWjbHPFo0/1TlkclBsD8b1CoUYn1+WOSZdbzhBtXPkN8TVXzkdNQtnRPF7Bbxjo22ptb94f1DoKJKBuj8+YdFjWGiNZK2o5tf3+vLtymaQ3JwZBGIXzWu7XWFavL8sIgtKSGL5ekplBsMC9I+wa23LmuhmDcam0iPdX0LalovT5oDL3TihR7uoBDj0oEit5qRlJmuM+3CLosX9/VglzrRM1Gx9f8ele8VO0B0tJszFNNH3AqUAUW7EmovUJYHmJBIg4nJ8IBRHKh/Zwhg1duHfD72CKZU0SDcY3bSXyv29ucuyBlVe4QYlkFuRTqEneZefaLR7zISTSRAH/WvgJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8i6zdcy/HSVWxXYgnSlGYUVa1Ccl1EqTxVQQ+j96GDA=;
 b=HtVdhY7QsEhhRuVc9J1yCym8K8/71KVLLAWSzrHW9JNuvgAuOuvLOY07CeW14/SiIUxXYN5fBcYL4JjT7ihofjDZJuR1DyGG42URVjKBXKKYG81HIZgPi0/dmP0cigsaaElYm6QduTnM6VnrEGgABEdLuGJnqY0mtxWVfP4nGqfR3DBaKgoSuyZyBVHSrL4xrWLbg2XAibwpBLh0oGdYVs7t85ZrvZnUfGQrSFHue9e0CNCgBSCjkAg6LBH3Uzy9lYbfJKvnmQd/7r/h4y6B6OKrgkN6zH1ipgPBxXpiJVZTF0AEzxv7y3JOW5tjoQ0+dPPlNZyZeM6VCMqbQItZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2631.namprd15.prod.outlook.com (2603:10b6:a03:150::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Tue, 31 Aug
 2021 13:51:52 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:51:52 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: "joel@jms.id.au" <joel@jms.id.au>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
Thread-Topic: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
Thread-Index: AQHXm4dh466/7b8SHEitTznuegJn+auIlZeAgAByzN2ABEE2AIAAXguA
Date: Tue, 31 Aug 2021 13:51:52 +0000
Message-ID: <65C83ADA-7546-40AF-9EF5-C990FC09F0B4@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <a67c22a2-eb11-87f5-54e7-14c2d771861b@kaod.org>
In-Reply-To: <a67c22a2-eb11-87f5-54e7-14c2d771861b@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 267f2b4c-8330-4f24-5844-08d96c867cbe
x-ms-traffictypediagnostic: BYAPR15MB2631:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB26319A45D4E451F18D1A9719ACCC9@BYAPR15MB2631.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e2BjO4PrsxUVQrrJeGkjmOdhG0nFk0Cr+tjkuopZfuLvw6+s64KsCmjlibmQBwtj/P0Cjk97RyxI+7+Y9B4bLyTVxYp27dK2eC3FlI9lrRKTHugw9MEex+F/KeV3jxvdDwvmPuyglvHPIQI38Iu/oxaP8nhAuJQDTUPPc+AqZ8/1esGzjVa5hHNIT71wbCGfvw7qX+ZEqfOZiFIJk9gri0SubhOE+JEStu+L9rHkXSylSjDNQJhV+BXQ0PwfmX7fJRtGhdOH6lnncJ/MOJSgQbk3XlKj+5PQTiIHbIBUh5Dlp/DXaaU6XCHDvxXF5ucTfDhXX9HD5p3eH3YwH1xkJsenKlOYHeJlV5RB2bM5OMHlCusMdWXau0NmXCu2UZh0z7Wc6l0i9dxJjC1AskpMuTFD7hkyGnq0ZYx7MiKAvqLlrr5FymOTBKt1CIp+8UJlSkFPdRKIFgQk8KdH9Yemy6n/FHmyOycUd43NvKcjCKVZj7gEkJI1crBGqXchrQnSKSCx4JHN1hZsuOGAUBVETRsI/dUsNbiC9mHigGqX0BaRy2YcL2VucX0h3zOl4sa8vGpaDSCcXs1+2NICk7NWUelsRODjLrmQMsZBPkOilTxjLSnn39+YOw4yYcYbPd+MVuH9sWCZhbAoKB+aA2vkto660ccbopuXeqpjCfSs8CePEDGxs/tKpctGDihVNE8PIo7zFt3Fz5490UKuKvcLgOucyqN588iPdHKGmLpDXmfiURg9euqxoUY7HqyHui+MYIBkv/7w734dmQ8OGscigMOv8FfRSypUPlsVh60HegymV5Mz28/bR3/PjNKstCinAGWsAc3LW7B0H1LHQKd+JurGqCKhETyLPSPT6mNgNl0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(6506007)(316002)(33656002)(86362001)(36756003)(54906003)(6916009)(66446008)(64756008)(66476007)(966005)(8676002)(2906002)(66574015)(478600001)(4326008)(186003)(4744005)(38070700005)(6512007)(76116006)(5660300002)(38100700002)(122000001)(66946007)(66556008)(53546011)(71200400001)(2616005)(8936002)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U25oaS9RemV4NDJaTjltTEZ2eEV3di9UdzlCdmw3YVVxZ01wY21kQ3VQZ2c0?=
 =?utf-8?B?R3Y4UFlJb1NQeG8vQ1hIR0JvVTZuSUJrU1NrcUtIK1VpUUdFU0JtUzNjalMw?=
 =?utf-8?B?TGttOEtGSlBRZHRveWhVMFNyc3pROWlVZnJ6MzU0UjNqVXZ1WnZwbDJJRWZK?=
 =?utf-8?B?QndhVWxmNE10UlYraE5sdnNJV0E1bXdwZ3FLWEdUa0hMdXZuUFl4VlhsY0kz?=
 =?utf-8?B?UEFKTnJMbXpQWnYrVkltMnN6em5rNUg5VkE4WmxuWUhyYyswTVJta2M2RmhV?=
 =?utf-8?B?MWJnTjFVWmxZR3lON3A1VkIzeVJocVdXR2ZQZ21UWTNKZWdVSHc5bHBrMnVv?=
 =?utf-8?B?T0RXVDFvS0FHU2pSdzRKcHY0Y3V0R2lxbUNNYlRyUFF5ZFhEQ05JR3dueW0w?=
 =?utf-8?B?cUttMjNEM3Y3TUNLWndKUFFGQ1VibGZOaStlcmk0ZXllNEpld0xIdTUzanJW?=
 =?utf-8?B?SDBTMWlvakJsTEZibDgzYmg0RnZQbFdzSXl6RWdYLzdZM29wQ3JVZHg3VXNt?=
 =?utf-8?B?VEZsZm5pNjZSM1lMYzlBQTFqeW9GUEV5TG1Tbmhla3oyN1RXeU1PdmV2dVFR?=
 =?utf-8?B?RXVCUk9TZDI2dkZhMWlIcFVSTlVuc1QzbzhhbWNYMnZxVXFKT3BqdTFJK0Nu?=
 =?utf-8?B?d29XMW1SbFpTRkMrYTNzbHZzT211UGFFQ3VkdE5jMEFmelpTUHlmVTNhdVl1?=
 =?utf-8?B?OVAzVjdaTXlJNUlhMDY0WklCVVdsSDZTTkwvZzhkRkZBNm1tY2NyVE9ySkpD?=
 =?utf-8?B?S3dHR2phdVFaTTFQbmFTbzNDTWc3WWFBa0hiTHB6UWMzcVJoY0lxSWFDQzZi?=
 =?utf-8?B?SHZXSFpua3JsVHo0dnZObUxGVWlpNmxEcW5HR0NqSTNSLzVMUko1QWorWUdp?=
 =?utf-8?B?OWZlOUZoeHZtbGo5RnN1N3lWcmczMUdBUEozbHJIT1puSi9pOVhrenc4eGdO?=
 =?utf-8?B?TVgrOUNuYnhYRmdYTW05dmhEQTZZQko1YVBBV0xGNDNpZnBBaC9CN3JiSXBT?=
 =?utf-8?B?bHpEbUIyN3BqNWpWcW5tbzArcjgweFIyV1JhcVBlQlZrSVMwNS8vV1BOZ3JR?=
 =?utf-8?B?QXZlRzhWcURucEsxQXhseDdZUStza3kyZXhzbDFVc2ZDZ2FNa2JmYUtoNTlD?=
 =?utf-8?B?blRxYmxKeDBja0s2TlkvNnk3QlVpaE5SZG4zOWROQklPaGw3RWJiYy9XbTEw?=
 =?utf-8?B?MExEWTQ1V0pNVitGKy8zZkttYm1YVFVLck44Rk9IMW9uOFlHYy94WTFYSlVU?=
 =?utf-8?B?SkpZTUxVVm1vVmFTZi9DbGtiajhLODUyMmxONEluMG4vemxCWDU3ZTkwOFA5?=
 =?utf-8?B?anlxTEZCd01BbUluL21YYllMdS93V2xEUjVLSWxvR2JMbmsyL3lQZWFHeSsw?=
 =?utf-8?B?elFMc0dGZWxXVE1RNWxNMTVkMnBQMjJHYm1NTUpHcm5IakVpdFBQdmV5WENn?=
 =?utf-8?B?VjZhRjROaG5tcGYvWTZYVGxBa0hDSi8rdTI2OENtRkp3akYvQ0JtbGxFZUJu?=
 =?utf-8?B?ZVl2UlFSdDFGWW5NSGFCL1hvdGpGSCtUNTJFMDJZODY1Q3AzTVhZUzU2dlRx?=
 =?utf-8?B?Y0RXY2V4QS9rUEZ2SGhKcHlpRjd5SWx6UjJiOHNTTU83ZW9tOCtZdVBXNlJt?=
 =?utf-8?B?LzBSVW1rZlkydnRrZWdiSXR4Kzk3azFRTlowUU91eUpWYnZaR3NUckxiamJL?=
 =?utf-8?B?SVB1V2ZocGE5aFpUazBNOGpKenZzT0lNb2pEL1NiUzBvZnhoREVaYlNHSDJh?=
 =?utf-8?B?cW9CNU1jMXBPSDlZUEpsY01oVFBVb1dBR2tyYmF6cVhhSk1XNURxallveHdQ?=
 =?utf-8?Q?xpKBmdiucqI9KktLG5V+w05wE73m/2lalSL8c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3D3BDE518BA5E4DA42DF91877CB9B7E@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267f2b4c-8330-4f24-5844-08d96c867cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 13:51:52.2223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7HPjfy7/pyQzW1hPPhOKRqeF+FtMUaVpzaX0DoBBm/pu9Utdq1n5iYMV91PiBGN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2631
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: aVkuT7BESan9mTVV8foe118eiWTfXnjR
X-Proofpoint-ORIG-GUID: aVkuT7BESan9mTVV8foe118eiWTfXnjR
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_05:2021-08-31,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=687 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310077
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=88771d3da1=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SeKAmWxsIHJlc2VuZCBQQVRDSCA1LCBhbmQgbGlrZSB5b3XigJlyZSBzdWdnZXN0aW5nLCBJIGNh
biB1c2UgdGhlIGV4aXN0aW5nIGFzdDI2MDAtZXZiIG1hY2hpbmUgdHlwZSBmb3IgdGVzdGluZy4N
Cg0KICAgICMgU2V0dXAgc2VyaWFsX2hkKDEpIGFzIFVBUlQxIGluIDI2MDAgU29DIHJlYWxpemUg
KEkgd29u4oCZdCBpbmNsdWRlIHRoaXMgaW4gdGhlIGRpZmYgdGhvdWdoKQ0KICAgIFVBUlQ1PXNl
cmlhbF9oZCgwKQ0KICAgIFVBUlQxPXNlcmlhbF9oZCgxKQ0KDQogICAgcWVtdS1zeXN0ZW0tYXJt
IC1tYWNoaW5lIGFzdDI2MDAtZXZiIC1zZXJpYWwgbnVsbCAtc2VyaWFsIHN0ZGlvDQoNCj4gT24g
QXVnIDMxLCAyMDIxLCBhdCAxOjE1IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3Jn
PiB3cm90ZToNCj4gDQo+IEkgd291bGQgcHJlZmVyIHRoYXQuIFRoaXMgcGF0Y2ggaGFzIGJlZW4g
aW4gbXkgdHJlZSBmb3IgeWVhcnMgOg0KPiANCj4gIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWdvYXRl
ci9xZW11L2NvbW1pdC8xMzg3MTNlZTFkM2Q4NDY4MmI4NWMxYjAxNTc3YTdlODZhYjNmZWQ0DQo+
IA0KPiBTZWUNCj4gDQo+ICBodHRwczovL2dpdGh1Yi5jb20vbGVnb2F0ZXIvcWVtdS9jb21taXRz
L2FzcGVlZC02LjINCj4gDQo+IE1heSBiZSB0aGlzIGlzIHdoYXQgeW91IHNpbXBseSBuZWVkID8g
WW91IGNhbiB1c2UgdGhlIGFzdDI2MDAtZXZiIG1hY2hpbmUgZm9yIA0KPiB5b3VyIHRlc3RzLiBU
ZWxsIG1lIGhvdyBpdCBnb2VzLiANCj4gDQo+IEFGQUlDVCwgeW91IHdpbGwgbmVlZCB0byByZXNl
bmQgUEFUQ0ggNSBvbmx5Lg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQy4NCg0K

