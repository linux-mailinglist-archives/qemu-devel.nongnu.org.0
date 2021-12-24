Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978AE47EE2B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 11:10:19 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0hWf-0005vr-TI
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 05:10:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1n0hUf-0005G4-93
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:08:09 -0500
Received: from esa12.fujitsucc.c3s2.iphmx.com ([216.71.156.125]:2503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1n0hUc-0007Ds-Bq
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 05:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1640340485; x=1671876485;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g0UR4LpKHlSEwMO4Eu2ej9E/sfxb8hM5UD5pHi8M+Wc=;
 b=dr1vs5cL68+/gk5VHBxLeScpJI1hM4WF5H1o09S95I3/EeOZbgCM8+8+
 go9HJGeeSCW1NkiB7rfPbi3uOk+Z/8VcEWVSs755RO4W3av+tnhk7rj8L
 Fot4pvXA3B4IylV4n9jXAMcUtP2dtyhKySpLRPGGi0xwpBnMj1lMiaQOy
 lla29AZAE8CFc9B4Le/F77PgOPDKsui/mpb4ph0Wa3sjEXvGey/FqT2Vi
 hjEJKzHb5KAvzAWVlEI68430ay/LrXnISMB6AoW4vJvpYp9oIC9v0zFAu
 g859r77w23j3bfBAqgHwsqqtJHDl+1A7FOz83b5/aIYh6hpyiMq93wgRC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="46754859"
X-IronPort-AV: E=Sophos;i="5.88,232,1635174000"; d="scan'208";a="46754859"
Received: from mail-os0jpn01lp2109.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.109])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 19:08:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1vSdPNWxmp16NbxDsJaZOJRuAXZT568kZm5/xjZ1l4wJ/P5mV+TeLDbpWflD00DhvBZpItRhJjIM/hkSFF0DbGZ1P1Dsy4bda8BRRaTO3llMigFJISZxgkMVa/sUdWGa4j0verOGvZp60+jA2DLReI1M66E8pF1tKMPpNWGZVeZ6HBb79YFJIQpmERQ8rqEZG16mfRTvxLbEiYtuKj9nX8MPvQ8pJ/3iFdr9X0XvL6p+YGDSJbMvq6zknzhrPDoprk9R6xIzBG3A0+z0vyxu6/Psp8/KpbVk60TBBGebmwZZcOCBANaBn3c+UuiI7ya+UeNNkriL5/evgKePoGerw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0UR4LpKHlSEwMO4Eu2ej9E/sfxb8hM5UD5pHi8M+Wc=;
 b=Jn9++gHe6EJd7cHvziC/oxcyDKI2oIqIBShQL5i8+v5gSohx+L3lwqPCQ3OfxLCBwTwR1Ior3um+CDrCWGsS76j7JcdV8WTkqOWEBikV1Pjdty8bMsiaoy4Gp8BeuI5lLDY3pkTzDmLtg/oKVnCxswGK3p+agT6kUZemXJA/aXUEl19jNsjNJ5JFwVx0ENUlbzcKIGIiVU760x9Gdy9X41dM53Zw/SJTrr9piUQvAXl0CaUeElNpTFYpio0R+J2Ci8V7apQFOQBFDEqNxJUAXkSCDa6BXoaF3zD6iCu6017HlkHnMsk8Ngk5n2JkcEFTepg12obTsbRoxXCxu5crLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0UR4LpKHlSEwMO4Eu2ej9E/sfxb8hM5UD5pHi8M+Wc=;
 b=Tv0J4o1s/Equ6ltKR6qvL1DkmM2aCwgzL54qtxYnNXJNVqu/Jy0HmxgUnaq7AHWgc6HF6wdw2qG7N0hy0oJtCFz56fRgt5WrY8xN+yijHRxxTp02SjF4/Hdb8IlwEehJKXq0SCm6FUFr1mpgmAfJ/frZhUUijrTAn2NNNWGRHhQ=
Received: from OS3PR01MB7706.jpnprd01.prod.outlook.com (2603:1096:604:17b::10)
 by OSZPR01MB8799.jpnprd01.prod.outlook.com (2603:1096:604:15b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Fri, 24 Dec
 2021 10:07:58 +0000
Received: from OS3PR01MB7706.jpnprd01.prod.outlook.com
 ([fe80::e93c:fa4b:dda5:ff26]) by OS3PR01MB7706.jpnprd01.prod.outlook.com
 ([fe80::e93c:fa4b:dda5:ff26%9]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 10:07:58 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "Rao, Lei" <lei.rao@intel.com>, "chen.zhang@intel.com"
 <chen.zhang@intel.com>, "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: [PATCH] net/filter: Optimize filter_send to coroutine
Thread-Topic: [PATCH] net/filter: Optimize filter_send to coroutine
Thread-Index: AQHX+G9Tr4H9J5YFbEu9IRJT6q52J6xBayyA
Date: Fri, 24 Dec 2021 10:07:58 +0000
Message-ID: <b6233b02-21f0-be63-7326-c23ec3c0fe08@fujitsu.com>
References: <20211224023755.532189-1-lei.rao@intel.com>
In-Reply-To: <20211224023755.532189-1-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48de3cff-9477-4650-bd10-08d9c6c54316
x-ms-traffictypediagnostic: OSZPR01MB8799:EE_
x-microsoft-antispam-prvs: <OSZPR01MB8799E5CA708067642E87855EA57F9@OSZPR01MB8799.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EoRn0caAH0xwpW2e9NFoV2HVHfo0ypBgtNHz3rrFVPSb/8fuvy3anVv0ItAw5rEEoBpn6C8pSWoS5Ca98WX3OAxM6T0nHA4zU0flwsfxlgaJt4wsAGfkSRPa8Fb0id4kXF7pPCqq4gAg4RyKLAd0OcUmW983Xo27/KXHP/FOVaRk/bW8LS+MwhOKVkv/diF4WLA9OXjwVRyYfeaSf2c7BgYB8ktCiZOpBHFB326tkR/uMuHzr2qvdAgPI7vxrG2mCWV4tr6/q+aplZnnfhhowbrTfbj7zcC7xverz43UOFypDixrFZ+ZH8O8gWFHLwQUv0hNPnjEb06wOPznH7piHnKnpR6PMPUZbDXn3lE+98cBM5xf6B0AtV6bTPp4VMou6GueDrO7fcWO9FUk5F46UVmhQzTty/xy9z1iOVLCxNQ9hm7lRoz/b8MiNpmwXOqYx28tEnATRTcHlSpSHR26KkTh8zpAA/nRov53hXn8jxfeCaX6cuywfHzIcZVfDv3gGh+6LLPhFdfe199edukX2OcJSbUqtMIoPcWdGhNYkVRfrFb4NBvvCWXT+qbtHiTq5rW6Vi0JtyXDYGonoz61orOzFP09cHWtV2MnPyoXSsDP5hNzJZ6qKGAQzn8VWMoR5qkqXIj0+6uUzU6w3aggRqWYUTl2eivFJm5O0+u6PGIs+KapoeFGiwg7l1WP/cQHugbSRUoJlpDAZ9QTcFCGjid3d0GX1ni0GFjCO3pa/JUZU7zRumj3lRGRLeOl9gvlpH3vaIeyMrMTxlfO3mIs+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7706.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(85182001)(66476007)(508600001)(36756003)(8936002)(31696002)(66446008)(4326008)(64756008)(6506007)(66946007)(31686004)(186003)(83380400001)(53546011)(82960400001)(6512007)(8676002)(76116006)(38100700002)(2616005)(91956017)(110136005)(38070700005)(122000001)(316002)(6486002)(2906002)(26005)(71200400001)(66556008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWdNaHBqV2RUcGI0d2NwV25hSUFxelAyNFVyK0FxQ0x2blhJZG1pbkl3U0w4?=
 =?utf-8?B?ZEdaZS9QN21NaHplT0I0bzhKb25xbzFHQk84ZjR4Z0xNc2JmTTZpeEVhWTVv?=
 =?utf-8?B?R01kMXlUWVVZMEE0SnFkbmpWbFFWTUNWOVhEZzh5ZEJHcU1qczBRa0plVzFi?=
 =?utf-8?B?dmZFL1htV0IySDBzQ2l6d1NlZmhlSWtJcFZGYzRwRmRqMmRsOWgzc2dsdy9k?=
 =?utf-8?B?WEtPczdWZkVYZUNFdkFzZFdBL01DTDIvSTlrU1JabzEvdEhwUm82OEJwcC9R?=
 =?utf-8?B?L2o5ODNNc1B0Nm1RWjBHMTA4b0EvQ0l5L3VyZWdVNHlMTDNjL21LMDR1VlBC?=
 =?utf-8?B?SVVJQi9TWHFqdUtDR1hvZGYya0FvaERPUE9ZZ3hrVHR1L09QNTl3bnpFV1lO?=
 =?utf-8?B?VFpSdDh4TkUwa2JvYXkydzFvbDN3MGwramV5OWN4WTZiWHZLOVUwWnkrekFP?=
 =?utf-8?B?TEJMOE8wamlhR1hOcXJDckxhTEhzRlc5Vno3NjkwUFRqVW5sR0RWN1JTbUZ0?=
 =?utf-8?B?eW5WNmtBZUFraVo2L01vWkd6V1hHOGM0UUZDQ0VRZmNodEY0TnJsNW84dnVH?=
 =?utf-8?B?c3kyUUhGWFpMcThyanpoOXI3SGhMTGRJQjY4SzY2UVZnZXhlbzk2UXNPRVR3?=
 =?utf-8?B?Nk4xaWpFcDBmQ3dVaDZGWW5Yck9BWHp6RUtjVkkvMDRlb2h3UE5aeGxTblNr?=
 =?utf-8?B?YmVkcVFaUXFtZkgvaFF3elFsMVI1dCtCYU9RSHY4TDBNVXhtSjVPRTk1VVhz?=
 =?utf-8?B?UWF2c1BSczFaaEhldSt6UGVFSlRLc0xXRHR4cGZFVk1tMS9GSGR6dG9vU3la?=
 =?utf-8?B?SGs5d0JTeUVVWUJpSjQycGV5NjVuamRNaUhSR2FDTzArM0tqWHVqT3gxMVk4?=
 =?utf-8?B?RjZUc3crN0lIU2xLWkNTSVpYbE1RWm4xRDJHVTA3QnNCL3cxQVpKNVpZWUR4?=
 =?utf-8?B?QTh3aHdYOFVoQmtiYnBnaEUvM0ZXLzBNMzFnVXhpci9mRHk1K1ZlRVRGWDhq?=
 =?utf-8?B?citFZHdpVVFDY3dwRWNuUUdWTERxRUZzdDYxUkgwNUpVU0ZtVXlMVW4rTGRj?=
 =?utf-8?B?Y2gxK2pMN1VIMGNEdUU3TDZ0YUxoSVhiUEFXdEVuSVkzMVNYamNCUkFueEN6?=
 =?utf-8?B?dk5CbXNlNWZwRFZMYlNabXM5QzdKYlZBTytya3Z4WFkwcUZuVzBIalYxQis5?=
 =?utf-8?B?QTVnSHQyc2FTejhxQ1daQ0hod3dNallHZ2FaTTBteWZ1Z2F2ODlSSUtzVjNi?=
 =?utf-8?B?YVROb202TFNEM2lBcGg4R2xLTlB4QUhtbWw3RjZGSU1rQTNjVWNRTldmUkFs?=
 =?utf-8?B?Q0dEUEUwZUpWbU9FYWZ0WDhQc1hrYzN0WCt2UHU4dktWL1VyTXBQd1dOV2RS?=
 =?utf-8?B?YzFaOE9MVU5NTFcremRnNC9zMjE3aFQ1bHhmZW9zT01ZQWlGWUR5ZEJESGFq?=
 =?utf-8?B?emY2enV3RnloOThrb1FTdjdjSmo0QjlNbHdoVitFWnpndVdOV1JCcll3OXhM?=
 =?utf-8?B?Sk9lN2VNYTNsU1JGSC9uYWUwZU9YNkZkenE0cVBOelhHRmIrNnRsLzBaeFRm?=
 =?utf-8?B?b0FnYlZPUHd1R1NWb3pWNzViY3ZybmdaclRpWk13VVYwei95WkM1am9sRC9y?=
 =?utf-8?B?cEZueCtTd3QveFdhRmlZWjJFZStRdDlZdG40TnRFbEhoTFQvclNFYlNwUk5R?=
 =?utf-8?B?R3o1NUcxNk9GR0paeFh0aVFBL0kvMGdDeW9ER0tuang1VUZNWVlnSXJDRitk?=
 =?utf-8?B?a0x5MXFWYkgzcjJJRlRzb01MWGZTR0VjU3ZuSzE2dUxGWlJVREtiZllBbXAw?=
 =?utf-8?B?Sm8rK2pJMzlFa2xEZVhKc1gya3N1MTc1ZWhra1JhRjBxUFpGYTdEUzkzNU5C?=
 =?utf-8?B?bDM5NzE5Ullkc3BrUXZjWXlONzhaRGJUdVZxeWl5RTRoTVh0RGdUWUY5NG1Y?=
 =?utf-8?B?OWZFLytHcVVTZ1lQaGRZRW96NzlmTG5jWXAveGlOcnU3ekYwNDRjbFZTSkxl?=
 =?utf-8?B?K0VZeHZtaWVHS1Y3WEd3enV1S3NCWWs3WE1CVS9pS3k0eER5M05TdGtlcnFV?=
 =?utf-8?B?K1kya0NPMk1zRnhxRzAxbFFqT3VhdWVaK2QxNDhWTkVOTzdwL1JCSGI3eE8v?=
 =?utf-8?B?Z05DMk9YWHVtQ1U3NUdUVktkbEZ5NUdFYWxqRHFYbFhJWklDT21xRkszR0VU?=
 =?utf-8?Q?p6tmgi8qQuuebAfJxCrovJ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <823D13D899F7C548A0EB483AFEDA9E7D@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7706.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48de3cff-9477-4650-bd10-08d9c6c54316
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 10:07:58.5118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DMmhMNKf7JRqxcXMQXsm4K05MbuvKt1t40dU83yHKpUhtiq+JRXrlIfcgKxRFvJbjmMr45CXJw+xut/urvnxlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8799
Received-SPF: pass client-ip=216.71.156.125;
 envelope-from=lizhijian@fujitsu.com; helo=esa12.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDI0LzEyLzIwMjEgMTA6MzcsIFJhbywgTGVpIHdyb3RlOg0KPiBUaGlzIHBhdGNoIGlz
IHRvIGltcHJvdmUgdGhlIGxvZ2ljIG9mIFFFTVUgbWFpbiB0aHJlYWQgc2xlZXAgY29kZSBpbg0K
PiBxZW11X2Nocl93cml0ZV9idWZmZXIoKSB3aGVyZSBpdCBjYW4gYmUgYmxvY2tlZCBhbmQgY2Fu
J3QgcnVuIG90aGVyDQo+IGNvcm91dGluZXMgZHVyaW5nIENPTE8gSU8gc3RyZXNzIHRlc3QuDQo+
DQo+IE91ciBhcHByb2FjaCBpcyB0byBwdXQgZmlsdGVyX3NlbmQoKSBpbiBhIGNvcm91dGluZS4g
SW4gdGhpcyB3YXksDQo+IGZpbHRlcl9zZW5kKCkgd2lsbCBjYWxsIHFlbXVfY29yb3V0aW5lX3lp
ZWxkKCkgaW4gcWVtdV9jb19zbGVlcF9ucygpLA0KPiBzbyB0aGF0IGl0IGNhbiBiZSBzY2hlZHVs
ZWQgb3V0IGFuZCBRRU1VIG1haW4gdGhyZWFkIGhhcyBvcHBvcnR1bml0eSB0bw0KPiBydW4gb3Ro
ZXIgdGFza3MuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IExlaSBSYW8gPGxlaS5yYW9AaW50ZWwuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4g
LS0tDQo+ICAgbmV0L2ZpbHRlci1taXJyb3IuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL25ldC9maWx0ZXItbWlycm9y
LmMgYi9uZXQvZmlsdGVyLW1pcnJvci5jDQo+IGluZGV4IGYyMDI0MGNjOWYuLjFlOWY4YjYyMTYg
MTAwNjQ0DQo+IC0tLSBhL25ldC9maWx0ZXItbWlycm9yLmMNCj4gKysrIGIvbmV0L2ZpbHRlci1t
aXJyb3IuYw0KPiBAQCAtMjAsNiArMjAsNyBAQA0KPiAgICNpbmNsdWRlICJjaGFyZGV2L2NoYXIt
ZmUuaCINCj4gICAjaW5jbHVkZSAicWVtdS9pb3YuaCINCj4gICAjaW5jbHVkZSAicWVtdS9zb2Nr
ZXRzLmgiDQo+ICsjaW5jbHVkZSAiYmxvY2svYWlvLXdhaXQuaCINCj4gICANCj4gICAjZGVmaW5l
IFRZUEVfRklMVEVSX01JUlJPUiAiZmlsdGVyLW1pcnJvciINCj4gICB0eXBlZGVmIHN0cnVjdCBN
aXJyb3JTdGF0ZSBNaXJyb3JTdGF0ZTsNCj4gQEAgLTQyLDIwICs0MywyMSBAQCBzdHJ1Y3QgTWly
cm9yU3RhdGUgew0KPiAgICAgICBib29sIHZuZXRfaGRyOw0KPiAgIH07DQo+ICAgDQo+IC1zdGF0
aWMgaW50IGZpbHRlcl9zZW5kKE1pcnJvclN0YXRlICpzLA0KPiAtICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgaW92ZWMgKmlvdiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
aW50IGlvdmNudCkNCj4gK3R5cGVkZWYgc3RydWN0IEZpbHRlclNlbmRDbyB7DQo+ICsgICAgTWly
cm9yU3RhdGUgKnM7DQo+ICsgICAgY2hhciAqYnVmOw0KPiArICAgIHNzaXplX3Qgc2l6ZTsNCj4g
KyAgICBib29sIGRvbmU7DQo+ICsgICAgaW50IHJldDsNCj4gK30gRmlsdGVyU2VuZENvOw0KPiAr
DQo+ICtzdGF0aWMgaW50IF9maWx0ZXJfc2VuZChNaXJyb3JTdGF0ZSAqcywNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY2hhciAqYnVmLA0KPiArICAgICAgICAgICAgICAgICAgICAgICBzc2l6
ZV90IHNpemUpDQo+ICAgew0KPiAgICAgICBOZXRGaWx0ZXJTdGF0ZSAqbmYgPSBORVRGSUxURVIo
cyk7DQo+ICAgICAgIGludCByZXQgPSAwOw0KPiAtICAgIHNzaXplX3Qgc2l6ZSA9IDA7DQo+ICAg
ICAgIHVpbnQzMl90IGxlbiA9IDA7DQo+IC0gICAgY2hhciAqYnVmOw0KPiAtDQo+IC0gICAgc2l6
ZSA9IGlvdl9zaXplKGlvdiwgaW92Y250KTsNCj4gLSAgICBpZiAoIXNpemUpIHsNCj4gLSAgICAg
ICAgcmV0dXJuIDA7DQo+IC0gICAgfQ0KPiAgIA0KPiAgICAgICBsZW4gPSBodG9ubChzaXplKTsN
Cj4gICAgICAgcmV0ID0gcWVtdV9jaHJfZmVfd3JpdGVfYWxsKCZzLT5jaHJfb3V0LCAodWludDhf
dCAqKSZsZW4sIHNpemVvZihsZW4pKTsNCj4gQEAgLTgwLDEwICs4Miw3IEBAIHN0YXRpYyBpbnQg
ZmlsdGVyX3NlbmQoTWlycm9yU3RhdGUgKnMsDQo+ICAgICAgICAgICB9DQo+ICAgICAgIH0NCj4g
ICANCj4gLSAgICBidWYgPSBnX21hbGxvYyhzaXplKTsNCj4gLSAgICBpb3ZfdG9fYnVmKGlvdiwg
aW92Y250LCAwLCBidWYsIHNpemUpOw0KPiAgICAgICByZXQgPSBxZW11X2Nocl9mZV93cml0ZV9h
bGwoJnMtPmNocl9vdXQsICh1aW50OF90ICopYnVmLCBzaXplKTsNCj4gLSAgICBnX2ZyZWUoYnVm
KTsNCj4gICAgICAgaWYgKHJldCAhPSBzaXplKSB7DQo+ICAgICAgICAgICBnb3RvIGVycjsNCj4g
ICAgICAgfQ0KPiBAQCAtOTQsNiArOTMsNDggQEAgZXJyOg0KPiAgICAgICByZXR1cm4gcmV0IDwg
MCA/IHJldCA6IC1FSU87DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHZvaWQgY29yb3V0aW5lX2Zu
IGZpbHRlcl9zZW5kX2NvKHZvaWQgKm9wYXF1ZSkNCj4gK3sNCj4gKyAgICBGaWx0ZXJTZW5kQ28g
KmRhdGEgPSBvcGFxdWU7DQo+ICsNCj4gKyAgICBkYXRhLT5yZXQgPSBfZmlsdGVyX3NlbmQoZGF0
YS0+cywgZGF0YS0+YnVmLCBkYXRhLT5zaXplKTsNCj4gKyAgICBkYXRhLT5kb25lID0gdHJ1ZTsN
Cj4gKyAgICBnX2ZyZWUoZGF0YS0+YnVmKTsNCj4gKyAgICBhaW9fd2FpdF9raWNrKCk7DQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyBpbnQgZmlsdGVyX3NlbmQoTWlycm9yU3RhdGUgKnMsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBpb3ZlYyAqaW92LA0KPiArICAgICAgICAg
ICAgICAgICAgICAgICBpbnQgaW92Y250KQ0KPiArew0KPiArICAgIHNzaXplX3Qgc2l6ZSA9IGlv
dl9zaXplKGlvdiwgaW92Y250KTsNCj4gKyAgICBjaGFyICpidWYgPSBOVUxMOw0KPiArDQo+ICsg
ICAgaWYgKCFzaXplKSB7DQo+ICsgICAgICAgIHJldHVybiAwOw0KPiArICAgIH0NCj4gKw0KPiAr
ICAgIGJ1ZiA9IGdfbWFsbG9jKHNpemUpOw0KPiArICAgIGlvdl90b19idWYoaW92LCBpb3ZjbnQs
IDAsIGJ1Ziwgc2l6ZSk7DQo+ICsNCj4gKyAgICBGaWx0ZXJTZW5kQ28gZGF0YSA9IHsNCj4gKyAg
ICAgICAgLnMgPSBzLA0KPiArICAgICAgICAuc2l6ZSA9IHNpemUsDQo+ICsgICAgICAgIC5idWYg
PSBidWYsDQo+ICsgICAgICAgIC5yZXQgPSAwLA0KPiArICAgIH07DQo+ICsNCj4gKyAgICBDb3Jv
dXRpbmUgKmNvID0gcWVtdV9jb3JvdXRpbmVfY3JlYXRlKGZpbHRlcl9zZW5kX2NvLCAmZGF0YSk7
DQoNCkJUVywgZG9lcyBxZW11L29sZCBnY2MgY29tcGxhaW50IHN1Y2ggY29kaW5nIHN0eWxlID8N
Cg0KaW50IGE7DQphID0gZm9vKCkNCmludCBiID0gYTsNCg0KDQoNCj4gKyAgICBxZW11X2Nvcm91
dGluZV9lbnRlcihjbyk7DQo+ICsNCj4gKyAgICB3aGlsZSAoIWRhdGEuZG9uZSkgew0KPiArICAg
ICAgICBhaW9fcG9sbChxZW11X2dldF9haW9fY29udGV4dCgpLCB0cnVlKTsNCj4gKyAgICB9DQo+
ICsNCj4gKyAgICByZXR1cm4gZGF0YS5yZXQ7DQo+ICsNCnJlZHVuZGFudMKgIG5ld2xpbmUNCg0K
T3RoZXJ3aXNlLA0KUmV2aWV3ZWQtYnk6IExpIFpoaWppYW4gPGxpemhpamlhbkBmdWppdHN1LmNv
bT4NCg0KDQoNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyB2b2lkIHJlZGlyZWN0b3JfdG9fZmlsdGVy
KE5ldEZpbHRlclN0YXRlICpuZiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCB1aW50OF90ICpidWYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50IGxlbikNCg==

