Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1E4084E1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 08:43:07 +0200 (CEST)
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPfgH-0007AA-Ko
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 02:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mPfdZ-0006Iq-Le
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 02:40:17 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:22041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mPfdU-0004QT-Vf
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 02:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1631515213; x=1663051213;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kkgFlZEFSl1zq9w/9Fdjs4WyhgXYo6LwXqNrWxjvKGg=;
 b=TaqncsL8YW1l4AzBTiAtjbc+z83O86jUIggw/XDoucGxfq3vuC5JluKs
 lzBTmf+QoxtjCKQibfZAF3Iu29QKHPgZp7bWjws56MOmb8saFVD+3EwHw
 jYgP4OAIhWzUd+adVICI27nMML5lF2XpkmoAU6ItY+rIhxYzuh3+RoYRe
 v3X9R/V8SZnuhaTQbhS972nSlV6RKLiRKGqGPLNpLCw04Uw2ioNJumaQh
 RZmOTnqN4yL35CkEw5qAoFdrKKFPxvL4I8a9/tOHWYESPxHeQ9kgEZPjI
 0BPudgEgzsVhtwCX/yVdMpHdgmrdsmKb56Uli63RrxoqiWlEY+mhM+hCg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="47222847"
X-IronPort-AV: E=Sophos;i="5.85,288,1624287600"; d="scan'208";a="47222847"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:40:05 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdZoj72UEil7JrkexTuBJ19VXLYOg5+vXB20TC0e0X3c1LtEPg8dMA3IugttJi1tBvohgw31i00W0yd40h1YiBF+4M56hqwJjqO8hbwEF6KSW2Yu8gWPvQWCTDbOj74aYE7WsiwVWRrCy+nREZ8YJRSI+4hbjz6v2K5mSYi8mcejM2cbQ5w+pv+RNe5il2c/BTW6UOZ1/wmFSD1jNy1Do5o+xUB3ZjssOFC0OCxnVksm+jG6C+8OuclbrgCf96bsWxaLuOM86bFWdwx3FS0A3kw8Ae9A68te0BNfbffLs854MYW0KbQwMpHyoN+HFGMFsohv5WBFxrX6lwN7Lq4AQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kkgFlZEFSl1zq9w/9Fdjs4WyhgXYo6LwXqNrWxjvKGg=;
 b=gAhuZCvTTriLrPd1VBAtdj++HQ2bXi4Y6T0YQPcDOspZPmzUuUYZ1GDd4EUa/5zX+bKF89ba/vgfMdN74vKn0Sv26pEdc03+uaFJ4peuCXQI17hoLTu2AtfWKiPHE+gBYam1+lJze4/8Auh7JCox/uQQskPIr1SfEztOAe+XNkwSL5YBFFnXC6ZxfqLfRXurcoia0Ur/ehazlka4YGNQ31LrxRu/3Y/uwtVHcfnrVlM9GZW13KN10jMXh7HVcNwwjcjGcaX5fYXjsXQxBm3i0oerdLRXhisk//Vl5FGX8DFYcoa7DsdGzVj41uBRgPsDoUQ4MIesTwlh1Btndl+qhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkgFlZEFSl1zq9w/9Fdjs4WyhgXYo6LwXqNrWxjvKGg=;
 b=BijWr32VMRSlpBOqlwVVkWvGcyJD9h0dr+tmhXEQL0Mp0IKy1TBK95NGg7zUCFWpjPqnBcdHDx659wVvAIl2KSwNQRW2byHAFjTYF5Wda5u/8Ec03zRl7TK52qC6aIOUkGrG8YUeC6goSuDmbnErTaid3TI6gV/4QTaAcQyBHaY=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OSZPR01MB7770.jpnprd01.prod.outlook.com (2603:1096:604:1b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 06:40:01 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9%5]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 06:40:01 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Igor Mammedov <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>
Subject: Re: [PATCH] nvdimm: release the correct device list
Thread-Topic: [PATCH] nvdimm: release the correct device list
Thread-Index: AQHXaOgkqoUGbhyF6kmemLxjVshx96srDdcAgDZYaYCAKj4EgIAWXjQA
Date: Mon, 13 Sep 2021 06:40:01 +0000
Message-ID: <e3257270-2ba3-e890-4506-7b1a14b5bc1a@fujitsu.com>
References: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
 <20210629160534.208b56ad@redhat.com>
 <224e4f45-14c7-4eec-f553-6fa25b4ffb6b@cn.fujitsu.com>
 <3ed73782-0ab2-d178-23e6-0ba19c70cb6f@fujitsu.com>
In-Reply-To: <3ed73782-0ab2-d178-23e6-0ba19c70cb6f@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09c09e42-cfc8-4177-a9fd-08d976815022
x-ms-traffictypediagnostic: OSZPR01MB7770:
x-microsoft-antispam-prvs: <OSZPR01MB7770E01AC6C8D71C0653B0B9A5D99@OSZPR01MB7770.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5cmctnCOWg3NMtwszCW3mnOkk7PEGb9Ei9UBZMoRZWopwN3YPM6jj6Bbbngj6mfX7Xu1YVajwg0JdpiCnAsLZ6+pNpldCIglEBVHlGFqAdypLHuKOoG6gkoroPGlskO2rAogePXqO97nrzvk1YcgUZiOENbwOCG+RWNObHx0v1XBxUW+UuA6uRyfyQ90cwukOpWn1MG8uJWwHwvFvxV3K4czMxwRcQOrhMT8JSA8ZVFuxn9SK4+x+XwN2gXRBPDrOZJ9IaFHK7wpYB5/fZ7lq83AU9LieDp1+vG/VhEHZf7GazhEkZUkztFGcAO5YHbVqPgQP3nDPju5R2HD3wBU2ABNISTYcapWr57VHx/kCVICZNfrDMu6drO/YoR9VPA3EMETVkVL8vT3zHFYEmo/Alo3jn2sGmO/gHrA46kyXy6rZdEMoW9vIsBlCwIh4GdLafWIp0+s+PlOgC7KYuKkkFeHC9Eqbhbi6ANcmV1fPV4/dnmv+PAA/AQI+Jf0tCbREZcDHMGDXWCYSEh843lsSSonUnPf6QZBMxgRvri+fjfYtPBx9WGqO+LZAkJYOUHH3K9crwuJdXPYHTAFDcyPt7W2yFi8gm86ciBx7gLsV00SpuDiGQAygFnZVo9A/ojuVTeIkK74waskamLoFRTjlk6UtoxJp0sy1uMdBLUZ4zaQKlorxl75giwKIFmYovuTtrcWnDtzTALNa122CADy1lrcij+ccxZJqnXS4XVwBsw+WKq1LYWHYL/wEBIWyFGwSySP2oS6957vfGLBtiisXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(6506007)(478600001)(110136005)(6512007)(53546011)(5660300002)(186003)(6486002)(36756003)(71200400001)(26005)(4326008)(31696002)(2616005)(8936002)(85182001)(2906002)(316002)(91956017)(8676002)(66476007)(38100700002)(76116006)(38070700005)(83380400001)(66556008)(66446008)(86362001)(66946007)(64756008)(122000001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGpQc1VSMDRnS3ptODdjNnBqZ091aGlNMnB3REkvNm1JbGl3b1gvNjhnYlNj?=
 =?utf-8?B?Y2FpS3FDR2hsMnIraVduMzRMTDZMVW5Vc3pPMzRjV3ZXeFVFYjgzQS8rcmJa?=
 =?utf-8?B?WnVOQU91dzc3L0xxaS9lZFpSMXBiVEVhMTlxZkFIcDUzL3N6Z2VWYWc1bzdB?=
 =?utf-8?B?SjNDZVJLMDNwaGk4a2hHczNwMXU2QzdHUlRLWWgwQnFkOXdNVkxmOUs5WS9k?=
 =?utf-8?B?a21nNzF0SGdteVhHc3V1cmJBa0toOWttOTVKWkpsMS9pYU5pdzcydVcwSlh4?=
 =?utf-8?B?T1drNW1nNDl0cmw0WmF2a0gxcmV5N0RaMDZPR2l6ZUIydW9SVDgrYmtQaG9B?=
 =?utf-8?B?WFk3c1RZUkJqTVI1bTIxa0JFRTlYQzZ1SU9aeWFDV1JjS2Y4TjVjWUFuMmdV?=
 =?utf-8?B?K0E2WGU0V1BiR1cxVUNVRjJxcGRYUzRmL0FVb3BobmMycmEvYjZGM20wK2sr?=
 =?utf-8?B?U3pwM0pneUxuaDNmOGU1MzJkVlljMnFlQjFYRFBFQ2pBNkNzMFhiZEFCcnNu?=
 =?utf-8?B?N2ZleFkxREJvdkIzS0VQNjBEWU9BTi81SE03enI0YVh3VWIxSGNsc0V1OG9y?=
 =?utf-8?B?OVpFL0plRFh5Y2lXRnRZeEYzY0lVY1g3RFFad2x5OVBIUDdyREtRUllrTjVB?=
 =?utf-8?B?Q0F3VG91MnkrQ2dIbytUbDZ0Mi8vOUdRV0J5YVE5NGpWSzQ2Zkh4aFdDemZw?=
 =?utf-8?B?TThJem9wRzJkL0NjNW9JbVZtcmhLYURyclZiV2cyTVpKeHlrMmc0allQZmVi?=
 =?utf-8?B?TW15eUVwTlZGZXlvUEhzRzdrTkhCZnhFMTk1VmphVUxLUktDaE9JUERseUlk?=
 =?utf-8?B?L3hDQWhEM3ZZSStXbFplRVZFcnozMWNSVmhySkVEbUhRNkgvWW1wNjhWR1hP?=
 =?utf-8?B?amo2aWgyZlg5SHNaNk4rOE16THZjaHU0Z2dVOEN5bGpXTCtoU2Q1NWFOS1F5?=
 =?utf-8?B?ditLNlJZc1lkaWkyVERUenUrM29HUUhvVG5DREpTYXBMbmVuRnA5K0M0WTJT?=
 =?utf-8?B?VWVGODlNd29sVTIyaHdCTXJlNW82VktZcnFYZGZTNnAxbHlGQ2JLS1d0amlH?=
 =?utf-8?B?c1Z2cnltWXBLcEk0ME5WYlhQd09uVWVjcEdnNTZaV09ENjRvNXpwV0ZOanhl?=
 =?utf-8?B?eVUxT0hkRkhPTTBMZGNKeE51QjkzeDhTWWV6SEtqcHdZQ044NVd1b200S1E1?=
 =?utf-8?B?a2d3cnd4SlVQZlF1NGNxNUxmMmVQbkRiYWN1bTRrL1pRNWg5OHg2emcyUlFu?=
 =?utf-8?B?SWVFLzhxWlBSbzdvWVRHMUQ2N1huU1hrdUdMMmRPdzZ5YmlBYmJNaHZ4SStn?=
 =?utf-8?B?Ri9uUGZIYmhPMXBPVEJrdHJKUWFIa2NVWFc1MmQ4Zm5kMFR6TGZoM01KYWJZ?=
 =?utf-8?B?RzhmYUdUOTBtSkR4U0VBS1p0R1VRRm9ZRDlpcXNSSGpnTGgvRXR4UHFhMkhS?=
 =?utf-8?B?VzMrWGk0WG01cXFLejcvNWM1N2tHWStrYWtENkJwWnd4MDcwUDZHYmEzTTRo?=
 =?utf-8?B?UkJuMHg4bDdrVEJVZVd1RmgzOTFxYkVpcklMdEtXV2hHN2NCZ0dJMUdNU09M?=
 =?utf-8?B?Z3I3NnlCNmpUSE1NWnhuR2Y2OUhDcVZIbFhWMmUvM0E1TTY2Q0t5OWdSR0xj?=
 =?utf-8?B?YUZBODNlZFYwMnowYnR3eUZkYThlTExwY2tGRHFHWmMrVm40WllHRFBKSy9D?=
 =?utf-8?B?NnRmVkp5dUt2RDdEbTY1TElwcEV0MmVWUzNJanp2emRrTExiR3FLRkVIMnN0?=
 =?utf-8?B?djNDNEh0S0JSeGN3M1luUWF3dEVtOWxtSSswaXBQU2xYRVFQS3lDTEFBQTRG?=
 =?utf-8?B?S1hwZVVISEtFOUs4TzUrUT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <73E26F305BA5E445A69C53509100A961@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c09e42-cfc8-4177-a9fd-08d976815022
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 06:40:01.5838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hJ/JsL1sajj08ca+shrtmxIlgXIod15rPxFKFEw4kLWUXdvq+8R3a7kwAIEWfIxYgeYiMx5GPGRtg/AHcvksMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7770
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=lizhijian@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -79
X-Spam_score: -8.0
X-Spam_bar: --------
X-Spam_report: (-8.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQpwaW5nIGFnYWluDQoNCg0KDQoNCk9uIDMwLzA4LzIwMjEgMDk6MDQsIExpIFpoaWppYW4gd3Jv
dGU6DQo+IHBpbmcNCj4NCj4NCj4gT24gMDMvMDgvMjAyMSAxMjowMCwgTGksIFpoaWppYW4gd3Jv
dGU6DQo+PiBwaW5nDQo+Pg0KPj4gQW55IGJvZHkgY291bGQgaGVscCB0byByZXZpZXcvcXVldWUg
dGhpcyBwYXRjaCA/DQo+Pg0KPj4NCj4+DQo+PiBPbiAyMDIxLzYvMjkgMjI6MDUsIElnb3IgTWFt
bWVkb3Ygd3JvdGU6DQo+Pj4gT24gVGh1LCAyNCBKdW4gMjAyMSAxOTowNDoxNSArMDgwMA0KPj4+
IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4gd3JvdGU6DQo+Pj4NCj4+Pj4g
U2lnbmVkLW9mZi1ieTogTGkgWmhpamlhbiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPj4+
IFJldmlld2VkLWJ5OiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29tPg0KPj4+DQo+
Pj4+IC0tLQ0KPj4+PiDCoCBody9hY3BpL252ZGltbS5jIHwgMTIgKysrKysrLS0tLS0tDQo+Pj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pj4+
DQo+Pj4+IGRpZmYgLS1naXQgYS9ody9hY3BpL252ZGltbS5jIGIvaHcvYWNwaS9udmRpbW0uYw0K
Pj4+PiBpbmRleCBlM2Q1ZmUxOTM5Mi4uZmYzMTcyNjNlODUgMTAwNjQ0DQo+Pj4+IC0tLSBhL2h3
L2FjcGkvbnZkaW1tLmMNCj4+Pj4gKysrIGIvaHcvYWNwaS9udmRpbW0uYw0KPj4+PiBAQCAtMzU1
LDEwICszNTUsMTAgQEAgbnZkaW1tX2J1aWxkX3N0cnVjdHVyZV9jYXBzKEdBcnJheSAqc3RydWN0
dXJlcywgdWludDMyX3QgY2FwYWJpbGl0aWVzKQ0KPj4+PiDCoCDCoCBzdGF0aWMgR0FycmF5ICpu
dmRpbW1fYnVpbGRfZGV2aWNlX3N0cnVjdHVyZShOVkRJTU1TdGF0ZSAqc3RhdGUpDQo+Pj4+IMKg
IHsNCj4+Pj4gLcKgwqDCoCBHU0xpc3QgKmRldmljZV9saXN0ID0gbnZkaW1tX2dldF9kZXZpY2Vf
bGlzdCgpOw0KPj4+PiArwqDCoMKgIEdTTGlzdCAqZGV2aWNlX2xpc3QsICpsaXN0ID0gbnZkaW1t
X2dldF9kZXZpY2VfbGlzdCgpOw0KPj4+PiDCoMKgwqDCoMKgIEdBcnJheSAqc3RydWN0dXJlcyA9
IGdfYXJyYXlfbmV3KGZhbHNlLCB0cnVlIC8qIGNsZWFyICovLCAxKTsNCj4+Pj4gwqAgLcKgwqDC
oCBmb3IgKDsgZGV2aWNlX2xpc3Q7IGRldmljZV9saXN0ID0gZGV2aWNlX2xpc3QtPm5leHQpIHsN
Cj4+Pj4gK8KgwqDCoCBmb3IgKGRldmljZV9saXN0ID0gbGlzdDsgZGV2aWNlX2xpc3Q7IGRldmlj
ZV9saXN0ID0gZGV2aWNlX2xpc3QtPm5leHQpIHsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIERl
dmljZVN0YXRlICpkZXYgPSBkZXZpY2VfbGlzdC0+ZGF0YTsNCj4+Pj4gwqAgwqDCoMKgwqDCoMKg
wqDCoMKgIC8qIGJ1aWxkIFN5c3RlbSBQaHlzaWNhbCBBZGRyZXNzIFJhbmdlIFN0cnVjdHVyZS4g
Ki8NCj4+Pj4gQEAgLTM3Myw3ICszNzMsNyBAQCBzdGF0aWMgR0FycmF5ICpudmRpbW1fYnVpbGRf
ZGV2aWNlX3N0cnVjdHVyZShOVkRJTU1TdGF0ZSAqc3RhdGUpDQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAvKiBidWlsZCBOVkRJTU0gQ29udHJvbCBSZWdpb24gU3RydWN0dXJlLiAqLw0KPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgbnZkaW1tX2J1aWxkX3N0cnVjdHVyZV9kY3Ioc3RydWN0dXJlcywg
ZGV2KTsNCj4+Pj4gwqDCoMKgwqDCoCB9DQo+Pj4+IC3CoMKgwqAgZ19zbGlzdF9mcmVlKGRldmlj
ZV9saXN0KTsNCj4+Pj4gK8KgwqDCoCBnX3NsaXN0X2ZyZWUobGlzdCk7DQo+Pj4+IMKgIMKgwqDC
oMKgwqAgaWYgKHN0YXRlLT5wZXJzaXN0ZW5jZSkgew0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
bnZkaW1tX2J1aWxkX3N0cnVjdHVyZV9jYXBzKHN0cnVjdHVyZXMsIHN0YXRlLT5wZXJzaXN0ZW5j
ZSk7DQo+Pj4+IEBAIC0xMzM5LDkgKzEzMzksOSBAQCBzdGF0aWMgdm9pZCBudmRpbW1fYnVpbGRf
c3NkdChHQXJyYXkgKnRhYmxlX29mZnNldHMsIEdBcnJheSAqdGFibGVfZGF0YSwNCj4+Pj4gwqAg
wqAgdm9pZCBudmRpbW1fYnVpbGRfc3JhdChHQXJyYXkgKnRhYmxlX2RhdGEpDQo+Pj4+IMKgIHsN
Cj4+Pj4gLcKgwqDCoCBHU0xpc3QgKmRldmljZV9saXN0ID0gbnZkaW1tX2dldF9kZXZpY2VfbGlz
dCgpOw0KPj4+PiArwqDCoMKgIEdTTGlzdCAqZGV2aWNlX2xpc3QsICpsaXN0ID0gbnZkaW1tX2dl
dF9kZXZpY2VfbGlzdCgpOw0KPj4+PiDCoCAtwqDCoMKgIGZvciAoOyBkZXZpY2VfbGlzdDsgZGV2
aWNlX2xpc3QgPSBkZXZpY2VfbGlzdC0+bmV4dCkgew0KPj4+PiArwqDCoMKgIGZvciAoZGV2aWNl
X2xpc3QgPSBsaXN0OyBkZXZpY2VfbGlzdDsgZGV2aWNlX2xpc3QgPSBkZXZpY2VfbGlzdC0+bmV4
dCkgew0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgQWNwaVNyYXRNZW1vcnlBZmZpbml0eSAqbnVt
YW1lbSA9IE5VTEw7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBEZXZpY2VTdGF0ZSAqZGV2ID0g
ZGV2aWNlX2xpc3QtPmRhdGE7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBPYmplY3QgKm9iaiA9
IE9CSkVDVChkZXYpOw0KPj4+PiBAQCAtMTM1Niw3ICsxMzU2LDcgQEAgdm9pZCBudmRpbW1fYnVp
bGRfc3JhdChHQXJyYXkgKnRhYmxlX2RhdGEpDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBidWls
ZF9zcmF0X21lbW9yeShudW1hbWVtLCBhZGRyLCBzaXplLCBub2RlLA0KPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTUVNX0FGRklOSVRZ
X0VOQUJMRUQgfCBNRU1fQUZGSU5JVFlfTk9OX1ZPTEFUSUxFKTsNCj4+Pj4gwqDCoMKgwqDCoCB9
DQo+Pj4+IC3CoMKgwqAgZ19zbGlzdF9mcmVlKGRldmljZV9saXN0KTsNCj4+Pj4gK8KgwqDCoCBn
X3NsaXN0X2ZyZWUobGlzdCk7DQo+Pj4+IMKgIH0NCj4+Pj4gwqAgwqAgdm9pZCBudmRpbW1fYnVp
bGRfYWNwaShHQXJyYXkgKnRhYmxlX29mZnNldHMsIEdBcnJheSAqdGFibGVfZGF0YSwNCj4+Pg0K
Pj4+DQo+Pg0KPj4NCj4+DQo+DQo=

