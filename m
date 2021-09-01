Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3CC3FDDA6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:07:48 +0200 (CEST)
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQu3-0000Zx-It
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLQrp-0007JP-Fj; Wed, 01 Sep 2021 10:05:29 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:61681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLQrn-0000ER-0q; Wed, 01 Sep 2021 10:05:28 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181E4ia8025527; Wed, 1 Sep 2021 07:05:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=5tgUz34ZrEn/uo6AXp6mCle9cjRxeOD2OkOAV5nJqII=;
 b=ot37BIT9CkcITc35AMH8F+lGw8ZBg0DQMC7dOL8CBifiEi6LdqQCT0fuHnjIQc8Lp4Lk
 SavKZFd9ikHdltWDzj2ksS6BGVJ+ap06MUWlTo7dxmEy09JzFh071LG98TWyEzJT466g
 nQHYeBl6gy4UWMPFqPVY+1cSaSov+U6IEjg= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3asscs011w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Sep 2021 07:05:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 1 Sep 2021 07:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C29ztv7yTmyDyLB+jdXTEl2a32RMfs6NmBSkQ3sd1cp1ZSjTZMtGNHNE1ulYcsWGpJj8KB++es3SB1pXMDzq3/TsmZ6AFOD/1i61BeEJRF4x2LTMBPZ+4dd75Ers3/yOaYcz1H1Eo30RwSbx0lQzoIQI90efvfILukwuBnY4om/pzLDiR49XZ9jp5na1xAJDYYCU5DilTbU++l2mEiaIYcb7j9UP+Bvxf3OG2UKsrip4T6L3KXT3NiTiaEpymWpvMQplZosG1zmJTaL/vopBDPhSX7QCaZd60nvbza9x3Hn6XtWjT+xo1DhiUk6QBhvQGXVnItmFTbohWa/a6L+qVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5tgUz34ZrEn/uo6AXp6mCle9cjRxeOD2OkOAV5nJqII=;
 b=iZzyRmL32+xNPaZsASZhDjhbUYoOwTAVWswSjKrzferpHHLijpbGqKrwhDqdMjhWvjEkQVkAKvl+BSVO9Igg3ECf9GMpqNp1chYX/pLfSsUTFtc5pGkykmI2lIOSyT2Vh4CGS97xa7b51Zt7iAIvUQf99NF/O2EITvks0KS80NRmbQfHvPTvK1MJuCAmFLea4tElE/fdTATk34mK3A8sVaBmxIwPVrwiGgn/7tcL8OMLuh6rueOj43Q35GXAXBe5taGI26XmsJjzHkLrkyoOPlD8FI/YAgPApf6jRSt3blWh/mLXqRS1SgMxBOznLPMeylr3YKrWrGDHlr2ZCxHeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4187.namprd15.prod.outlook.com (2603:10b6:a03:2e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 14:05:02 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 14:05:02 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "f4bug@amsat.org" <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/1] hw/arm/aspeed: Allow machine to set serial_hd(0)
Thread-Topic: [PATCH 1/1] hw/arm/aspeed: Allow machine to set serial_hd(0)
Thread-Index: AQHXnsBlsSFYF3r22EOX3ZMAlg3ji6uOuV2AgAB92AA=
Date: Wed, 1 Sep 2021 14:05:02 +0000
Message-ID: <002242D9-22C4-4D31-BA91-1E181DBC041A@fb.com>
References: <20210831233140.2659116-1-pdel@fb.com>
 <20210831233140.2659116-2-pdel@fb.com>
 <3ffd8327-6b62-a39f-49db-100bb1475309@kaod.org>
In-Reply-To: <3ffd8327-6b62-a39f-49db-100bb1475309@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c513935f-0724-4c91-93b4-08d96d517e3b
x-ms-traffictypediagnostic: SJ0PR15MB4187:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR15MB41870826CA624A7EAC6C25C4ACCD9@SJ0PR15MB4187.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FJlafGCFBKf2btHGi4KQ4zDfYyZyucz5W0EkZzCPAaRk/dZg94ss7kjCXZo7hcrhPK5yxNo+XfpC4KKayPsw1xN52jf9h7IreATWVN4EwDHsiSUnfP3BGSf1q9/sjqskAfmw33cJjrxHYba1wwSo9caEWvOvs2vPkgNk/b82kAv4LQ1l2G8kfhTXyuo6Det9XdB3I80YQFaTBAUDXBKruhJjGzv+7G6Db7qxHnqz6Q2/q6Ftkx/G+MMmUTtg5UlmdVGz1sdf14t1/xNPHrUNtLL8Q+h9ar9j/XfTz4f6ooJIupIZlGj1pg0S6h7jjKb4bknJMT8Mnvjl8w1pPTbrU0Z9uPOC+ggW40CD2hJwLKmEOQR174eIi41L7Om4FzyBe06WCgGi4p/a4lxj9NcvMaerYDr3xb4KBZ3sFkQPE8Y4M+rbn6JNHjxDD2dpDbLMkcp1PdkSGOJ+RUAZPpFqryEN0sEscHt7b3gBTawBYmht2H6Cmt7yx5YlvS2HpsLcRi5aoPkTWVFZvuXdWgtbHGazjv9NfI/mJ5dq72OoiZ1ir195RWDxGRgAiLSUB0zqWpfmzeMdEBUZPQlbALKnpza3lLbprPZYOOVWNjsya84kfbreQ3kpq26HQXQXRBm5bcmJjoDMsKDttDDUJ9ChYVP3WV72JeRZjQwRw4vSO1NKu9oxFwt5j9qfKBxi9hFuydPPonvHCwhf04wckr/n2hY5tDf/sahni5/bNso0KD0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(2906002)(71200400001)(33656002)(66446008)(66476007)(478600001)(54906003)(38100700002)(38070700005)(76116006)(8676002)(64756008)(66946007)(122000001)(66556008)(5660300002)(6486002)(2616005)(186003)(4326008)(36756003)(83380400001)(6506007)(316002)(6512007)(66574015)(53546011)(86362001)(8936002)(6916009)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGNnMDlSNTByVUFBT1hSSlJUM2JNSklEb0k0ZmRKeUxwSHFXSmI2a1lWSDJW?=
 =?utf-8?B?ejdFazdubWhFaTBsa1V6VVdXUXZ1aVJDUWpTSVFDRXVPcWZWL0NRSm80cXps?=
 =?utf-8?B?bjk4aHQySXg1azRGM3RnSzBKY2lBblllUmFvUjN4T3NQd2p6K25sbkhKQitX?=
 =?utf-8?B?L0wvOEhCQTgzQzlBNlBJSitTNDJOVkhYM1pHUi9UMi9WTEV2b1RJQ0ZuUXlI?=
 =?utf-8?B?czhMVk1CRW1WVEZpYi9Jdm54OXFkbVJLeTRocGJTOExPZlhabkoxcVc2eG9P?=
 =?utf-8?B?Q0pMcTJsb3B6Tm9OZXVtQXVLRittc21KSW5qcGJLcFFjODNDS0hwdzJWRUdj?=
 =?utf-8?B?QWNxd3ZUNW5KdHZFK3NWRHRNS0JnRWhjMGNoMTl4bFo5ZktCQVgySVcyemty?=
 =?utf-8?B?cVJDeHdaZm5ZWlhCWlU0SnlvY2NGeTkrZkp6UURlZDBES2oyWk1KeGR1WXRJ?=
 =?utf-8?B?VUU0cTZHZWR3UmJnOW9sR2dnTGtIZnkvcVRVdzNKL2xYK0JlUTBIVzY0L2Zn?=
 =?utf-8?B?Ry8zYkNzcU1WOSsreGZISVBwZlNWSDIvRkdSYkE5bVovVnFYL1pyTm5ZWURK?=
 =?utf-8?B?cHhLcWR1NEJHb09BQkh1dDJ3SHNvTUkwaDQyVGFHbU5UY3hRaXpVWVpsYnFv?=
 =?utf-8?B?cy9PRWtTNWhDUVRKOE91Uk1YaVBFajVNL0s4WWU1S3M3VUZRZGdRWmxTdDZJ?=
 =?utf-8?B?VmQyQnZITFJtSXVQVW1nS2dyak1mVmh2QWZxK0xSODBWeDY3aVZqQnVUdDZE?=
 =?utf-8?B?MlhBTWVQR0VqMks0YkllSVZlNE42VCtlMzljV1plbXQwT2k4ZHlUbC9EVEhN?=
 =?utf-8?B?UUxRUGl1TVFUZXg2Q2toUFZIV0JZTmhBOS9vZ2xYMENhTkJGdE1UaHlnRlpJ?=
 =?utf-8?B?UnNVWGJCdHNqMXlSNDVxMDJiZEVwMGlmMmF5WWpQdEZGUVZVOXZJNHlNQ1RG?=
 =?utf-8?B?bTQ2aUhFU0prZXJTdG5uUVNJTnhid21RWWh0MDdkbG15TXlYbExlSklQd1dG?=
 =?utf-8?B?cVlZeGdYc1Q4RTdydUhRczh6RGZYc0dEdEY5TEZNZFptUmZ4TVVzdjN0Z0Ra?=
 =?utf-8?B?UXY3a3ZvTDZpNEw5b2w3WnRpZVU1Q1k4UEY1aDdLNWo4WmRocldxNU5PcXox?=
 =?utf-8?B?OU9DdXp0QWZ5ZXh3emVMUkJKcU02U2FReFVRNkh5TVVXRE42QjVEdnVZa1Zr?=
 =?utf-8?B?S3VpUEhacCs0YnFvQW1pbTBySFJjeTdybkxtdUszK0piUGJMN1k4d1dEV296?=
 =?utf-8?B?OGRzcHNEWTNZTVJlbG9mYVNtdHRsalVtMnVsVUFmMzRISXZMQnNjdEVsWXJQ?=
 =?utf-8?B?ditxQWVNRi9MREFnMGFuUktrS3N6SVpRRFBrTXNCRDVZQlNOWi96ZElzRm1z?=
 =?utf-8?B?QkMybjFBNFluR3VqMWY3QkV6WUc1VEQ1QVZrcTJyc3ZldDdEbGRvbzNGNU5x?=
 =?utf-8?B?ZWhmeVluUFlLWFZTTWdkVm5TeVNWeHBqOGFMOThZZGJvK25iVUpTakl0R3B3?=
 =?utf-8?B?Z09KM3BMRHRZZVRjV0NsTE50b1FoRk5Ud2txWDcrMHEvNEc5eUp2eEI5aUZ6?=
 =?utf-8?B?RUh3OUp0YWRDaUR6VFpaTHZHSVFwWGxLRjJRbmZYSnpxQ09mcUM4UDVYeTVs?=
 =?utf-8?B?VlNOMXdpbWJSdjB4WEZqK1NuaVMyaG1Xb3c5anVqTFdEbDZoTlQyRzFQS3hu?=
 =?utf-8?B?UzZxSWwxcENjU1A0NnNuYXZ1YmJwQkk4Nlc1Qk1pUlFrSzM5V0ZUOER1a1RS?=
 =?utf-8?B?S2tHd1VkeDFCbHMydEFPOCtDQ21nM3hFVFRiUEJSTFFMdzVRNjM1elZDYWdB?=
 =?utf-8?Q?q3fNhdrkMVwZ6ueONCdoFChN7mQI+XfX0p0dE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B61B91D94807574FA22C3984BA919C3A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c513935f-0724-4c91-93b4-08d96d517e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 14:05:02.6528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bs3Ri6xdR8iN7z0UnEP4nRoMWYa1FuOSUEc8i2ySDAyGIeOsrXSQmWCn3OtBiO5O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4187
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: WQcDZk92sIisY2FQMJLkzjxfxtYHj9Vn
X-Proofpoint-ORIG-GUID: WQcDZk92sIisY2FQMJLkzjxfxtYHj9Vn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_04:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010084
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8878769573=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

DQoNCj4gT24gQXVnIDMxLCAyMDIxLCBhdCAxMTozNCBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4gd3JvdGU6DQo+IA0KPiBBZGRpbmcgUGV0ZXIgTWF5ZGVsbCBhbmQgSm9lbC4N
Cj4gDQo+IE9uIDkvMS8yMSAxOjMxIEFNLCBwZGVsQGZiLmNvbSB3cm90ZToNCj4+IEZyb206IFBl
dGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4gDQo+PiBXaGVuIHlvdSBydW4gUUVNVSB3
aXRoIGFuIEFzcGVlZCBtYWNoaW5lIGFuZCBhIHNpbmdsZSBzZXJpYWwgZGV2aWNlDQo+PiB1c2lu
ZyBzdGRpbyBsaWtlIHRoaXM6DQo+PiANCj4+ICAgIHFlbXUgLW1hY2hpbmUgYXN0MjYwMC1ldmIg
LWRyaXZlIC4uLiAtc2VyaWFsIHN0ZGlvDQo+PiANCj4+IFRoZSBndWVzdCBPUyBjYW4gcmVhZCBh
bmQgd3JpdGUgdG8gdGhlIFVBUlQ1IHJlZ2lzdGVycyBhdCAweDFFNzg0MDAwIGFuZA0KPj4gaXQg
d2lsbCByZWNlaXZlIGZyb20gc3RkaW4gYW5kIHdyaXRlIHRvIHN0ZG91dC4gVGhlIEFzcGVlZCBT
b0MncyBoYXZlIGENCj4+IGxvdCBtb3JlIFVBUlQncyB0aG91Z2ggKEFTVDI1MDAgaGFzIDUsIEFT
VDI2MDAgaGFzIDEzKSBhbmQgZGVwZW5kaW5nIG9uDQo+PiB0aGUgYm9hcmQgZGVzaWduLCBtYXkg
YmUgdXNpbmcgYW55IG9mIHRoZW0gYXMgdGhlIHNlcmlhbCBjb25zb2xlLiAoU2VlDQo+PiAic3Rk
b3V0LXBhdGgiIGluIGEgRFRTIHRvIGNoZWNrIHdoaWNoIG9uZSBpcyBjaG9zZW4pLg0KPj4gDQo+
PiBNb3N0IGJvYXJkcywgaW5jbHVkaW5nIGFsbCBvZiB0aG9zZSBjdXJyZW50bHkgZGVmaW5lZCBp
bg0KPj4gaHcvYXJtL2FzcGVlZC5jLCBqdXN0IHVzZSBVQVJUNSwgYnV0IHNvbWUgdXNlIFVBUlQx
LiBUaGlzIGNoYW5nZSBhZGRzDQo+PiBzb21lIGZsZXhpYmlsaXR5IGZvciBkaWZmZXJlbnQgYm9h
cmRzIHdpdGhvdXQgcmVxdWlyaW5nIHVzZXJzIHRvIGNoYW5nZQ0KPj4gdGhlaXIgY29tbWFuZC1s
aW5lIGludm9jYXRpb24gb2YgUUVNVS4NCj4+IA0KPj4gSSB0ZXN0ZWQgdGhpcyBkb2Vzbid0IGJy
ZWFrIGV4aXN0aW5nIGNvZGUgYnkgYm9vdGluZyBhbiBBU1QyNTAwIE9wZW5CTUMNCj4+IGltYWdl
IGFuZCBhbiBBU1QyNjAwIE9wZW5CTUMgaW1hZ2UsIGVhY2ggdXNpbmcgVUFSVDUgYXMgdGhlIGNv
bnNvbGUuDQo+PiANCj4+IFRoZW4gSSB0ZXN0ZWQgc3dpdGNoaW5nIHRoZSBkZWZhdWx0IHRvIFVB
UlQxIGFuZCBib290aW5nIGFuIEFTVDI2MDANCj4+IE9wZW5CTUMgaW1hZ2UgdGhhdCB1c2VzIFVB
UlQxLCBhbmQgdGhhdCB3b3JrZWQgdG9vLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBE
ZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4gDQo+IFNvbWUgY29tbWVudHMgYmVsb3csIA0KPiAN
Cj4+IC0tLQ0KPj4gaHcvYXJtL2FzcGVlZC5jICAgICAgICAgfCAgMSArDQo+PiBody9hcm0vYXNw
ZWVkX2FzdDI2MDAuYyB8IDExICsrKysrKystLS0tDQo+PiBody9hcm0vYXNwZWVkX3NvYy5jICAg
ICB8ICA5ICsrKysrKy0tLQ0KPj4gaW5jbHVkZS9ody9hcm0vYXNwZWVkLmggfCAgMSArDQo+PiA0
IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+PiANCj4+
IGRpZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkLmMgYi9ody9hcm0vYXNwZWVkLmMNCj4+IGluZGV4
IDlkNDNlMjZjNTEuLjc0Mzc5OTA3ZmYgMTAwNjQ0DQo+PiAtLS0gYS9ody9hcm0vYXNwZWVkLmMN
Cj4+ICsrKyBiL2h3L2FybS9hc3BlZWQuYw0KPj4gQEAgLTgwNCw2ICs4MDQsNyBAQCBzdGF0aWMg
dm9pZCBhc3BlZWRfbWFjaGluZV9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0
YSkNCj4+ICAgICBtYy0+bm9fcGFyYWxsZWwgPSAxOw0KPj4gICAgIG1jLT5kZWZhdWx0X3JhbV9p
ZCA9ICJyYW0iOw0KPj4gICAgIGFtYy0+bWFjc19tYXNrID0gQVNQRUVEX01BQzBfT047DQo+PiAr
ICAgIGFtYy0+c2VyaWFsX2hkMCA9IEFTUEVFRF9ERVZfVUFSVDU7DQo+PiANCj4+ICAgICBhc3Bl
ZWRfbWFjaGluZV9jbGFzc19wcm9wc19pbml0KG9jKTsNCj4+IH0NCj4+IGRpZmYgLS1naXQgYS9o
dy9hcm0vYXNwZWVkX2FzdDI2MDAuYyBiL2h3L2FybS9hc3BlZWRfYXN0MjYwMC5jDQo+PiBpbmRl
eCBlMzAxMzEyOGM2Li4zNjFhNDU2MjE0IDEwMDY0NA0KPj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9h
c3QyNjAwLmMNCj4+ICsrKyBiL2h3L2FybS9hc3BlZWRfYXN0MjYwMC5jDQo+PiBAQCAtMTAsNiAr
MTAsNyBAQA0KPj4gI2luY2x1ZGUgInFlbXUvb3NkZXAuaCINCj4+ICNpbmNsdWRlICJxYXBpL2Vy
cm9yLmgiDQo+PiAjaW5jbHVkZSAiaHcvbWlzYy91bmltcC5oIg0KPj4gKyNpbmNsdWRlICJody9h
cm0vYXNwZWVkLmgiDQo+PiAjaW5jbHVkZSAiaHcvYXJtL2FzcGVlZF9zb2MuaCINCj4+ICNpbmNs
dWRlICJody9jaGFyL3NlcmlhbC5oIg0KPj4gI2luY2x1ZGUgInFlbXUvbW9kdWxlLmgiDQo+PiBA
QCAtMjMxLDYgKzIzMiw4IEBAIHN0YXRpYyB1aW50NjRfdCBhc3BlZWRfY2FsY19hZmZpbml0eShp
bnQgY3B1KQ0KPj4gc3RhdGljIHZvaWQgYXNwZWVkX3NvY19hc3QyNjAwX3JlYWxpemUoRGV2aWNl
U3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPj4gew0KPj4gICAgIGludCBpOw0KPj4gKyAgICBB
c3BlZWRNYWNoaW5lU3RhdGUgKmJtYyA9IEFTUEVFRF9NQUNISU5FKHFkZXZfZ2V0X21hY2hpbmUo
KSk7DQo+PiArICAgIEFzcGVlZE1hY2hpbmVDbGFzcyAqYW1jID0gQVNQRUVEX01BQ0hJTkVfR0VU
X0NMQVNTKGJtYyk7DQo+IA0KPiBUaGlzIGlzIHJlYWNoaW5nIGludG8gdGhlIG1hY2hpbmUgZnJv
bSB0aGUgU29DIHdoaWNoIGlzIG5vdCBnb29kDQo+IHByYWN0aWNlLg0KPiANCj4gV2hhdCB5b3Ug
c2hvdWxkIGRvIGlzIGFkZCBhbiBhdHRyaWJ1dGUgaW4gQXNwZWVkU29DU3RhdGUgYW5kIGEgDQo+
IHByb3BlcnR5IGluIGFzcGVlZF9zb2NfcHJvcGVydGllc1tdLiBUaGlzIHByb3BlcnR5IHdvdWxk
IGJlIHNldCANCj4gaW4gYXNwZWVkX21hY2hpbmVfaW5pdCgpIGJlZm9yZSByZWFsaXppbmcgdGhl
IHNvYyBvYmplY3QuIExvb2sgDQo+IGF0ICJkcmFtIiBmb3IgYW4gZXhhbXBsZS4NCg0KT2hoaGgg
SSBzZWUsIHRoYW5rcyBmb3IgZXhwbGFpbmluZywgSeKAmWxsIGZpeCB0aGlzLg0KDQo+IA0KPiBU
aGVuLCBpbiB0aGUgYXNwZWVkX3NvY18qX3JlYWxpemUgcm91dGluZXMsIHlvdSB3b3VsZCB1c2Ug
dGhlIA0KPiBhdHRyaWJ1dGUgdG8gaW5pdGlhbGl6ZSB0aGUgZGVmYXVsdCBzZXJpYWwgZGV2aWNl
Lg0KPiANCj4gSSBkb24ndCByZWFsbHkga25vdyB3aGF0IHRvIGNhbGwgdGhpcyBhdHRyaWJ1dGUg
YW5kIHByb3BlcnR5Lg0KPiBIb3cgYWJvdXQgdWFydF9kZWZhdWx0IGFuZCAidWFydC1kZWZhdWx0
IiA/IA0KDQpPaCBvaywgeWVhaCBJ4oCZbGwgY2hhbmdlIGl0IHRvIHVhcnRfZGVmYXVsdCBhbmQg
4oCcdWFydC1kZWZhdWx04oCdLg0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBDLg0KPiANCj4+ICAg
ICBBc3BlZWRTb0NTdGF0ZSAqcyA9IEFTUEVFRF9TT0MoZGV2KTsNCj4+ICAgICBBc3BlZWRTb0ND
bGFzcyAqc2MgPSBBU1BFRURfU09DX0dFVF9DTEFTUyhzKTsNCj4+ICAgICBFcnJvciAqZXJyID0g
TlVMTDsNCj4+IEBAIC0zMjIsMTAgKzMyNSwxMCBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc29jX2Fz
dDI2MDBfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+PiAgICAgICAg
IHN5c2J1c19jb25uZWN0X2lycShTWVNfQlVTX0RFVklDRSgmcy0+dGltZXJjdHJsKSwgaSwgaXJx
KTsNCj4+ICAgICB9DQo+PiANCj4+IC0gICAgLyogVUFSVCAtIGF0dGFjaCBhbiA4MjUwIHRvIHRo
ZSBJTyBzcGFjZSBhcyBvdXIgVUFSVDUgKi8NCj4+IC0gICAgc2VyaWFsX21tX2luaXQoZ2V0X3N5
c3RlbV9tZW1vcnkoKSwgc2MtPm1lbW1hcFtBU1BFRURfREVWX1VBUlQ1XSwgMiwNCj4+IC0gICAg
ICAgICAgICAgICAgICAgYXNwZWVkX3NvY19nZXRfaXJxKHMsIEFTUEVFRF9ERVZfVUFSVDUpLA0K
Pj4gLSAgICAgICAgICAgICAgICAgICAzODQwMCwgc2VyaWFsX2hkKDApLCBERVZJQ0VfTElUVExF
X0VORElBTik7DQo+PiArICAgIC8qIFdpcmUgdXAgdGhlIGZpcnN0IHNlcmlhbCBkZXZpY2UsIHVz
dWFsbHkgZWl0aGVyIFVBUlQ1IG9yIFVBUlQxICovDQo+PiArICAgIHNlcmlhbF9tbV9pbml0KGdl
dF9zeXN0ZW1fbWVtb3J5KCksIHNjLT5tZW1tYXBbYW1jLT5zZXJpYWxfaGQwXSwgMiwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgYXNwZWVkX3NvY19nZXRfaXJxKHMsIGFtYy0+c2VyaWFsX2hkMCks
IDM4NDAwLA0KPj4gKyAgICAgICAgICAgICAgICAgICBzZXJpYWxfaGQoMCksIERFVklDRV9MSVRU
TEVfRU5ESUFOKTsNCj4+IA0KPj4gICAgIC8qIEkyQyAqLw0KPj4gICAgIG9iamVjdF9wcm9wZXJ0
eV9zZXRfbGluayhPQkpFQ1QoJnMtPmkyYyksICJkcmFtIiwgT0JKRUNUKHMtPmRyYW1fbXIpLA0K
Pj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3BlZWRfc29jLmMgYi9ody9hcm0vYXNwZWVkX3NvYy5j
DQo+PiBpbmRleCAzYWQ2YzU2ZmE5Li43NzQyMmJiZWIxIDEwMDY0NA0KPj4gLS0tIGEvaHcvYXJt
L2FzcGVlZF9zb2MuYw0KPj4gKysrIGIvaHcvYXJtL2FzcGVlZF9zb2MuYw0KPj4gQEAgLTEzLDYg
KzEzLDcgQEANCj4+ICNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+PiAjaW5jbHVkZSAicWFwaS9l
cnJvci5oIg0KPj4gI2luY2x1ZGUgImh3L21pc2MvdW5pbXAuaCINCj4+ICsjaW5jbHVkZSAiaHcv
YXJtL2FzcGVlZC5oIg0KPj4gI2luY2x1ZGUgImh3L2FybS9hc3BlZWRfc29jLmgiDQo+PiAjaW5j
bHVkZSAiaHcvY2hhci9zZXJpYWwuaCINCj4+ICNpbmNsdWRlICJxZW11L21vZHVsZS5oIg0KPj4g
QEAgLTIyMSw2ICsyMjIsOCBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc29jX2luaXQoT2JqZWN0ICpv
YmopDQo+PiBzdGF0aWMgdm9pZCBhc3BlZWRfc29jX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwg
RXJyb3IgKiplcnJwKQ0KPj4gew0KPj4gICAgIGludCBpOw0KPj4gKyAgICBBc3BlZWRNYWNoaW5l
U3RhdGUgKmJtYyA9IEFTUEVFRF9NQUNISU5FKHFkZXZfZ2V0X21hY2hpbmUoKSk7DQo+PiArICAg
IEFzcGVlZE1hY2hpbmVDbGFzcyAqYW1jID0gQVNQRUVEX01BQ0hJTkVfR0VUX0NMQVNTKGJtYyk7
DQo+PiAgICAgQXNwZWVkU29DU3RhdGUgKnMgPSBBU1BFRURfU09DKGRldik7DQo+PiAgICAgQXNw
ZWVkU29DQ2xhc3MgKnNjID0gQVNQRUVEX1NPQ19HRVRfQ0xBU1Mocyk7DQo+PiAgICAgRXJyb3Ig
KmVyciA9IE5VTEw7DQo+PiBAQCAtMjg3LDkgKzI5MCw5IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9z
b2NfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+PiAgICAgICAgIHN5
c2J1c19jb25uZWN0X2lycShTWVNfQlVTX0RFVklDRSgmcy0+dGltZXJjdHJsKSwgaSwgaXJxKTsN
Cj4+ICAgICB9DQo+PiANCj4+IC0gICAgLyogVUFSVCAtIGF0dGFjaCBhbiA4MjUwIHRvIHRoZSBJ
TyBzcGFjZSBhcyBvdXIgVUFSVDUgKi8NCj4+IC0gICAgc2VyaWFsX21tX2luaXQoZ2V0X3N5c3Rl
bV9tZW1vcnkoKSwgc2MtPm1lbW1hcFtBU1BFRURfREVWX1VBUlQ1XSwgMiwNCj4+IC0gICAgICAg
ICAgICAgICAgICAgYXNwZWVkX3NvY19nZXRfaXJxKHMsIEFTUEVFRF9ERVZfVUFSVDUpLCAzODQw
MCwNCj4+ICsgICAgLyogV2lyZSB1cCB0aGUgZmlyc3Qgc2VyaWFsIGRldmljZSwgdXN1YWxseSBl
aXRoZXIgVUFSVDUgb3IgVUFSVDEgKi8NCj4+ICsgICAgc2VyaWFsX21tX2luaXQoZ2V0X3N5c3Rl
bV9tZW1vcnkoKSwgc2MtPm1lbW1hcFthbWMtPnNlcmlhbF9oZDBdLCAyLA0KPj4gKyAgICAgICAg
ICAgICAgICAgICBhc3BlZWRfc29jX2dldF9pcnEocywgYW1jLT5zZXJpYWxfaGQwKSwgMzg0MDAs
DQo+PiAgICAgICAgICAgICAgICAgICAgc2VyaWFsX2hkKDApLCBERVZJQ0VfTElUVExFX0VORElB
Tik7DQo+PiANCj4+ICAgICAvKiBJMkMgKi8NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2Fy
bS9hc3BlZWQuaCBiL2luY2x1ZGUvaHcvYXJtL2FzcGVlZC5oDQo+PiBpbmRleCBjOTc0N2IxNWZj
Li5iYzBmMjc4ODVhIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9ody9hcm0vYXNwZWVkLmgNCj4+
ICsrKyBiL2luY2x1ZGUvaHcvYXJtL2FzcGVlZC5oDQo+PiBAQCAtMzgsNiArMzgsNyBAQCBzdHJ1
Y3QgQXNwZWVkTWFjaGluZUNsYXNzIHsNCj4+ICAgICB1aW50MzJfdCBudW1fY3M7DQo+PiAgICAg
dWludDMyX3QgbWFjc19tYXNrOw0KPj4gICAgIHZvaWQgKCppMmNfaW5pdCkoQXNwZWVkTWFjaGlu
ZVN0YXRlICpibWMpOw0KPj4gKyAgICB1aW50MzJfdCBzZXJpYWxfaGQwOw0KPj4gfTsNCg0K

