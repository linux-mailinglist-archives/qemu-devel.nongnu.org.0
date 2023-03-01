Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165CB6A676E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 06:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXFGO-0006bf-Kk; Wed, 01 Mar 2023 00:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <KFTING@nuvoton.com>)
 id 1pXDMr-0006iC-H9; Tue, 28 Feb 2023 22:43:01 -0500
Received: from mail-psaapc01on20610.outbound.protection.outlook.com
 ([2a01:111:f400:feae::610]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <KFTING@nuvoton.com>)
 id 1pXDMo-0005uj-Jk; Tue, 28 Feb 2023 22:43:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHrpzmTD0OFHPlb3ViKCSX+gjwjVm4Rh6D7nlaKThDk9FRo24uTs2++hl/i9mA2bMNLD4BimLjgL9kdC+e9pwH7uLOoloxkFCfiFmYNiP2ODDp3PlpyzO2lUzip4ed/2dwDoijx1lgMkX/+sN81REr0Atpzdc5GkU8DOrMyRFoqzpGXVX2aJMf+R8Yt5ZIJ4A5aTn4z6Vd5xjk+OZIr65rSiqZqXxbazGD9pRV5GMUL5XYCqNp3oc1uGGOI7AZkXUXnZ2Lf++L1iWsWVfanBu6CBZ5w3iiSEreVNa/5g/ezhMqavACtU1YblLxkJKknthuq5S7CH+t/F+KSLAKdKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZkfjAPKCDWPCPBE5mxnTd5rn+fknOjWAvXXCOnLM/w=;
 b=dJxRyb+DkVHtP8OdqtOX82ToO+gbDt9qqI3AhE/8dvT59Cgo+VAsM+Ya404hAiuuHz6PTTwpBl/4pWTMmwO+h3hcuXVOwHdAx+HHDsD1gMXlhQQywKbmyFFDp3qUui0J91sRhGz0jt2772fM/1iU42EHJU8XvadFbZiTrtNbXBk4Ggo+acsEFe5TEtQHrGzsPXtmcylyAMhMckxtPM4BZL8QQmzpt/dcXWxr2rzhuDHAQXL05o9XUy9iqhy4HY5mWd+7IT7BzveqEGMhF0XLMMeFp3g/nJ6BcTo7Dj6DxaFcIjdQUstwhLutuYrq2l7IymOFbgrKgpd71Lf8bwGFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZkfjAPKCDWPCPBE5mxnTd5rn+fknOjWAvXXCOnLM/w=;
 b=jLCI9Z3J8CWMIFlOoNmrzQZWgIdK8Fwwpreyp7cmiZOFvgDTQ3tZ7wZJNLP283OVKbUH61dNbfFQCFFGGaNkIqb7l2+KFBpD9bdx7d2zYedWI0YjQqxz+hnKoq26NzXM/ur46I0FVwKfZf6XlDvkxI1cN6ofq87EsseHqJKz9SU=
Received: from SG2PR03MB4910.apcprd03.prod.outlook.com (2603:1096:4:d6::10) by
 SEZPR03MB7008.apcprd03.prod.outlook.com (2603:1096:101:aa::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.26; Wed, 1 Mar 2023 03:42:41 +0000
Received: from SG2PR03MB4910.apcprd03.prod.outlook.com
 ([fe80::bb93:66d8:5dcc:3df0]) by SG2PR03MB4910.apcprd03.prod.outlook.com
 ([fe80::bb93:66d8:5dcc:3df0%3]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 03:42:41 +0000
From: "KFTING@nuvoton.com" <KFTING@nuvoton.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Havard
 Skinnemoen <hskinnemoen@google.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Shengtan Mao <stmao@google.com>, Hao Wu
 <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>, "KWLIU@nuvoton.com"
 <KWLIU@nuvoton.com>
Subject: RE: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
Thread-Topic: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
Thread-Index: AQHZFhaPGXEzN5WWFUCSg0UqlTDldq7cu2OAgAj3upA=
Date: Wed, 1 Mar 2023 03:42:40 +0000
Message-ID: <SG2PR03MB491058B025CF7F8E1D3AF264DBAD9@SG2PR03MB4910.apcprd03.prod.outlook.com>
References: <20200911052101.2602693-1-hskinnemoen@google.com>
 <20200911052101.2602693-9-hskinnemoen@google.com>
 <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
 <a7bc04e9-a3e8-1210-976e-f166b25cbc8e@linaro.org>
In-Reply-To: <a7bc04e9-a3e8-1210-976e-f166b25cbc8e@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4910:EE_|SEZPR03MB7008:EE_
x-ms-office365-filtering-correlation-id: 76ab7206-b489-4da0-c6cc-08db1a070262
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qU2np8jh6Z/R67PxoFjpwZyH5kdtWihr0Vn7wIjvlARZyXCAas6+Q3hr6ZAu0T0FKJifRYOATVO1+QuigCvE0EwgqLE5e12/M9G5MtCqYLJbYWhFagOhUs5ZIF6s8Oo0fmIzNbY/huOFQkVndbrQOhpHZY+Le3O2EUXyInBJVa/eSd5+NkNx8LTJIEQ9vbckibHNLYNwHqcdrC2m1hOXp/FB3mv1FOYFAnRylHzg2FhOif8aLDFw3AXhdaz3ALJy+p4ue0Gq8T2OX7bKpVOSwrQZwxvuFgudi/gkjyc0qh9lpj2gN5/Buuq0U0TnQZ8oyus/E6K34t5hRDHrQ69w1AqxZIEPhSN32U1DsTDbbZsOlnu4EOyyKF6Xqu7L9FpeLivWOPgNlvrNR2VKQD2VNr+1gfBdw8t6QEnBibYfN2a8RJbHD2ZpLh8BRAoS+rGUHr1qOOINbevswt+iZAw7HIXBq4UD12XQ7ZUHyrIZheV2Bqzqd4RVmlVZoQ3f9irc/HXWFuTFbeRao83ltkj3+M5WkLdjrqUWwjh6Y73ar/1pccvs0USVKMdCngXNjiLChjZHrOaT7eEpnDcvg8HcX4rnGvCt4HTVBSHULm4CDY+4LNH73dzP3Zsq5Lv5eRjN17f3s8Y7CCOb5jwlY+JicensrtCBQ1jS9n6/aFysS6Y2LYB6aXbSrU5KiFzrHWiWuN3rYWxXRTWQyNWd9vqMLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB4910.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199018)(9686003)(55016003)(38070700005)(38100700002)(122000001)(52536014)(66556008)(41300700001)(66446008)(2906002)(4326008)(76116006)(8936002)(66946007)(478600001)(5660300002)(8676002)(26005)(66476007)(71200400001)(7696005)(53546011)(64756008)(6506007)(107886003)(186003)(83380400001)(316002)(33656002)(86362001)(54906003)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXNsaG8zMHRzR2NWZVRRbFZLUFd5ZE9WTDlKNmJkSlU5aUVwM3pSZFZDdmRY?=
 =?utf-8?B?YXA2KzlMMWpIRHg3T2RpM1BMdkdJQUc1T3lqbS9RTjBsQWVxeS9JZ1pNR3lt?=
 =?utf-8?B?V2s0SWxaVHArZlkyTGdsTHdGYnBXRko0WmVIVFg5L1pFQkRwait4R1RKWkhX?=
 =?utf-8?B?M1ZSV2k3UjVBQWhFRkFZNXlReGk1cDltUmV4Rml2ajRzZkM5RTlNa1huOU5L?=
 =?utf-8?B?a0NjalNpS2VOeElmM0sxMjlTQUlxYThRRzl3WVhJUXVlaXpseDVXUGNFSlRM?=
 =?utf-8?B?NkR1RE92dzVhSmpUTFo0UjhZU1BrV3JzeEFCRitZZ0trMUpPUUQ1RC9Ebkpm?=
 =?utf-8?B?UzFZRGxpa2ZoUHdwMzlsV1JZcCtldnh0b0FXM3VOa3RaeXBzdUUvMVpweTNh?=
 =?utf-8?B?OStxSHIwUEdjZjR3QWh4dFZlNGloZDNVRVdpZjd5MklpSmFmNHVBZitVOWZk?=
 =?utf-8?B?OEJJdGlIb3RCdm5SZ3JYb0JyeDZRSHUycEVIZ0dxZmwzNUZsZ2JYek1aS2N5?=
 =?utf-8?B?TE5sd2YxQUNCOGs4elBiMHhyeC9IdUcxbmZKbEEvYlZSV04vaEdqS040V2tH?=
 =?utf-8?B?VU4yM04rQkdyVGVLV3dlT0I2b2FNbHgwdVF4S3AyNW40MG1DMG90STNMa0Fm?=
 =?utf-8?B?bytkOHA3UFcraGY1cmR6di9KeW9uVUFFSTUrTVJlWGJOUjFvRXcxRWpYN1hF?=
 =?utf-8?B?Y1ptcU43VmlQL1Jvd1FZMkxsdE9oR0ZvQXNFNDFWOEFwZW5QTUxWanVRNDZw?=
 =?utf-8?B?VGEzMTZ2U2t4dHhaZGdIRkppOGM3S0lOenl4RnFuTWsxN2x2TVpidFBhK3hI?=
 =?utf-8?B?RmNqM0lNdk5CSUtmdUd2VjdNT0lqWktMQmd4dWFxdWQ4NEtMSTJxWTJERzkz?=
 =?utf-8?B?REo3MHRkb0l2Vy93UHB0QkVTZGFhaUVsSzE0T3NOVDcrdVVkQVRpTW9BSFFu?=
 =?utf-8?B?aXNEUXJhaG5zZVpXMUtuVmJuVXVlMlM2WWx4RW1OVUxBR2xEenZxUE9FdnVj?=
 =?utf-8?B?VncrL2lFZUFpWGh1L0xvT1NYTTd3aGJkL1BJb0dDd3lnUkdJc3NKQVAzL0tw?=
 =?utf-8?B?MmlEYnlIaVcrVnpvZXNYanZYN3JYRFVMZWhpMzN2dlNOMWNNQmVXQXJtR3l2?=
 =?utf-8?B?aTlPclpyOVpjR2o2UVh3OStheDdkUkZvM2hJTk5tQ1ViL0tuUVl4YlpQRWdE?=
 =?utf-8?B?SDVDa1JrMm9oVU5hVis2WFdMMHlrczIreFNPTEMyYWFmZ3E2eDBYYkhKZkZN?=
 =?utf-8?B?Zy90QTQ1WG53ZUhoYTRiYXh6c3krWGd6U0dxWVk0UVltS1p5Z01ONHBydmVG?=
 =?utf-8?B?Njg2QUNBR0hyZ0NlN1lBb3NEb2hJaXhTa04vOStIRUdOeHh1Q0pkZDB0Z2Fz?=
 =?utf-8?B?bGdBT0ZZTUJFZDlPUnJCM0hob0dsQWVLOG5zU0R1eXlIWVpzckpjT1RlelVR?=
 =?utf-8?B?b0pBdFgzL1kxS1NjVzl5cFpGbkR6ZkNCb3d5TXdPSFA4SHJ0dStNY0hENy9h?=
 =?utf-8?B?Y0RWN2pNekx4cllmRnBwYW9TSWh2b1FqRXRqVkc0NFRVdU9NTndkMEtHclRz?=
 =?utf-8?B?MDhFRTUvRUx1UGsrNkthR2l0TlpOeE5xVkc5M2NUa3pMRzFuc25Sbzllem85?=
 =?utf-8?B?ZmZCV1BjUHpkSTd2Z2JzcWZRODZKL3NQSktnSEFLdm5YOFVFVWxpTU9ieVhT?=
 =?utf-8?B?N1YzV0psdk4xTTVKT0dzOGVGRXlTVkZsbTZxRTRZVjBjUkl4UFJqNFhmTnNU?=
 =?utf-8?B?emRCdnRVVXllenQ2ZUx1OGhzYWEzV3FES1ZYVmhGaFVZc2UvSjlSMHBJWUxx?=
 =?utf-8?B?QjZ6VkRPVnNxdnFmNWJHZWlHOHZrZElob2IyejdiQVB0ZHNPRDh4WEtNM2NB?=
 =?utf-8?B?NzZlajFZcFlKbGRUVysrUmUvSmhpMmlFTk9MR2hKaDBUbmZaT0ZlOXprejNs?=
 =?utf-8?B?dVh5RkxYQ1VqUzlPSHpBOElLUXpmNksxY2IrSzFqZUFKWnMvSzFEOWFlNVFO?=
 =?utf-8?B?TWwzS216V0x0Y1p0bG9VSTFJc2ZOcmd4UjR1T0Q1eVdPN3I2azFtMGtxNnFD?=
 =?utf-8?B?MFZrSXhHeFg3cUtxazJ0ZTRXMm1vbmdyRFhqM2NWVDZSWjBsbUo2aXh5VnFt?=
 =?utf-8?Q?/mfY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4910.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ab7206-b489-4da0-c6cc-08db1a070262
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 03:42:40.9553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATyow3wxw0iepwwt9vpS0i5uOFPa33TYmfQsbT76UsN3Q8n75Sbyk18an7oL8A4rKAEQgPAqHTQSP3IWRRzoFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7008
Received-SPF: pass client-ip=2a01:111:f400:feae::610;
 envelope-from=KFTING@nuvoton.com;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Mar 2023 00:44:25 -0500
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

SGkgUGhpbGlwcGU6DQoNCldlJ3JlIGNoZWNraW5nIGl0IGludGVybmFsbHkuDQoNCkknbSBzb3Jy
eSBmb3IgdGhlIGxhdGUgcmVzcG9uc2UuDQoNClRoYW5rIHlvdS4NCg0KUmVnYXJkcywNClR5cm9u
ZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIzLCAy
MDIzIDY6NDQgUE0NClRvOiBIYXZhcmQgU2tpbm5lbW9lbiA8aHNraW5uZW1vZW5AZ29vZ2xlLmNv
bT47IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZw0KQ2M6IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgSVMyMCBBdmkgRmlzaG1hbiA8QXZpLkZpc2htYW5AbnV2b3Rv
bi5jb20+OyBDUzIwIEtGVGluZyA8S0ZUSU5HQG51dm90b24uY29tPjsgQWxleGFuZGVyIEJ1bGVr
b3YgPGFseG5kckBidS5lZHU+OyBTaGVuZ3RhbiBNYW8gPHN0bWFvQGdvb2dsZS5jb20+OyBIYW8g
V3UgPHd1aGFvdHNoQGdvb2dsZS5jb20+OyBDaHJpcyBSYXVlciA8Y3JhdWVyQGdvb2dsZS5jb20+
DQpTdWJqZWN0OiBSZTogW1BBVENIIHY5IDA4LzE0XSBody9udnJhbTogTlBDTTd4eCBPVFAgZGV2
aWNlIG1vZGVsDQoNClR5cm9uZSwgSGFvLCBwaW5nPw0KDQpPbiAyMi8xMi8yMiAxNjowMywgUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IEhpLA0KPg0KPiAob2xkIHBhdGNoKQ0KPg0K
PiBPbiAxMS85LzIwIDA3OjIwLCBIYXZhcmQgU2tpbm5lbW9lbiB3cm90ZToNCj4+IFRoaXMgc3Vw
cG9ydHMgcmVhZGluZyBhbmQgd3JpdGluZyBPVFAgZnVzZXMgYW5kIGtleXMuIE9ubHkgZnVzZQ0K
Pj4gcmVhZGluZyBoYXMgYmVlbiB0ZXN0ZWQuIFByb3RlY3Rpb24gaXMgbm90IGltcGxlbWVudGVk
Lg0KPj4NCj4+IFJldmlld2VkLWJ5OiBBdmkgRmlzaG1hbiA8YXZpLmZpc2htYW5AbnV2b3Rvbi5j
b20+DQo+PiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0
Lm9yZz4NCj4+IFRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0
Lm9yZz4NCj4+IFRlc3RlZC1ieTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBIYXZhcmQgU2tpbm5lbW9lbiA8aHNraW5uZW1vZW5AZ29vZ2xlLmNv
bT4NCj4+IC0tLQ0KPj4gICBpbmNsdWRlL2h3L2FybS9ucGNtN3h4LmggICAgICAgfCAgIDMgKw0K
Pj4gICBpbmNsdWRlL2h3L252cmFtL25wY203eHhfb3RwLmggfCAgNzkgKysrKysrDQo+PiAgIGh3
L2FybS9ucGNtN3h4LmMgICAgICAgICAgICAgICB8ICAyOSArKysNCj4+ICAgaHcvbnZyYW0vbnBj
bTd4eF9vdHAuYyAgICAgICAgIHwgNDQwDQo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4+ICAgaHcvbnZyYW0vbWVzb24uYnVpbGQgICAgICAgICAgIHwgICAxICsNCj4+ICAg
NSBmaWxlcyBjaGFuZ2VkLCA1NTIgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9ody9udnJhbS9ucGNtN3h4X290cC5oDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBody9udnJhbS9ucGNtN3h4X290cC5jDQo+DQo+PiArLyoqDQo+PiArICogbnBjbTd4eF9vdHBf
YXJyYXlfd3JpdGUgLSBFQ0MgZW5jb2RlIGFuZCB3cml0ZSBkYXRhIHRvIE9UUCBhcnJheS4NCj4+
ICsgKiBAczogT1RQIG1vZHVsZS4NCj4+ICsgKiBAZGF0YTogRGF0YSB0byBiZSBlbmNvZGVkIGFu
ZCB3cml0dGVuLg0KPj4gKyAqIEBvZmZzZXQ6IE9mZnNldCBvZiBmaXJzdCBieXRlIHRvIGJlIHdy
aXR0ZW4gaW4gdGhlIE9UUCBhcnJheS4NCj4+ICsgKiBAbGVuOiBOdW1iZXIgb2YgYnl0ZXMgYmVm
b3JlIEVDQyBlbmNvZGluZy4NCj4+ICsgKg0KPj4gKyAqIEVhY2ggbmliYmxlIG9mIGRhdGEgaXMg
ZW5jb2RlZCBpbnRvIGEgYnl0ZSwgc28gdGhlIG51bWJlciBvZg0KPj4gK2J5dGVzDQo+PiB3cml0
dGVuDQo+PiArICogdG8gdGhlIGFycmF5IHdpbGwgYmUgQGxlbiAqIDIuDQo+PiArICovDQo+PiAr
ZXh0ZXJuIHZvaWQgbnBjbTd4eF9vdHBfYXJyYXlfd3JpdGUoTlBDTTd4eE9UUFN0YXRlICpzLCBj
b25zdCB2b2lkDQo+PiAqZGF0YSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB1bnNpZ25lZA0KPj4gK2ludA0KPj4gbGVuKTsNCj4N
Cj4+ICtzdGF0aWMgdm9pZCBucGNtN3h4X2luaXRfZnVzZXMoTlBDTTd4eFN0YXRlICpzKSB7DQo+
PiArICAgIE5QQ003eHhDbGFzcyAqbmMgPSBOUENNN1hYX0dFVF9DTEFTUyhzKTsNCj4+ICsgICAg
dWludDMyX3QgdmFsdWU7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIFRoZSBpbml0aWFs
IG1hc2sgb2YgZGlzYWJsZWQgbW9kdWxlcyBpbmRpY2F0ZXMgdGhlIGNoaXANCj4+IGRlcml2YXRp
dmUgKGUuZy4NCj4+ICsgICAgICogTlBDTTc1MCBvciBOUENNNzMwKS4NCj4+ICsgICAgICovDQo+
PiArICAgIHZhbHVlID0gdHN3YXAzMihuYy0+ZGlzYWJsZWRfbW9kdWxlcyk7DQo+DQo+IEluIHdo
aWNoIGVuZGlhbm5lc3MgZG8geW91IHdhbnQgdGhpcyAzMi1iaXQgZnVzZSB2YWx1ZSB0byBiZSB3
cml0dGVuPw0KPg0KPiBJIHN1cHBvc2UgeW91IHVzZWQgYSBsaXR0bGUtZW5kaWFuIGhvc3QsIHNv
IHdlIHdhbnQgaXQgYmlnLWVuZGlhbiBpbg0KPiB0aGUgT1RQPyBJbiB0aGF0IGNhc2UgaXQgd291
bGQgYmUgYmV0dGVyIHRvIHVzZSBjcHVfdG9fYmUzMigpLCB0byBiZQ0KPiBhYmxlIHRvIHVzZSB0
aGUgT1RQIG9uIGEgYmlnLWVuZGlhbiBob3N0IHN1Y2ggczM5MHguDQo+DQo+PiArICAgIG5wY203
eHhfb3RwX2FycmF5X3dyaXRlKCZzLT5mdXNlX2FycmF5LCAmdmFsdWUsDQo+PiBOUENNN1hYX0ZV
U0VfREVSSVZBVElWRSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHZh
bHVlKSk7IH0NCj4NCj4gRm9yIGNvbXBsZXRlbmVzczoNCj4NCj4gID4gK3N0YXRpYyB2b2lkIG5w
Y203MzBfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEpICA+ICt7DQo+ID4g
KyAgICBOUENNN3h4Q2xhc3MgKm5jID0gTlBDTTdYWF9DTEFTUyhvYyk7ICA+ICsgID4gKyAgICAv
KiBOUENNNzMwDQo+IGlzIG9wdGltaXplZCBmb3IgZGF0YSBjZW50ZXIgdXNlLCBzbyBubyBncmFw
aGljcywgZXRjLiAqLyAgPiArDQo+IG5jLT5kaXNhYmxlZF9tb2R1bGVzID0gMHgwMDMwMDM5NTsg
ID4gKyAgICBuYy0+bnVtX2NwdXMgPSAyOyAgPiArfSAgPg0KPiArICA+ICtzdGF0aWMgdm9pZCBu
cGNtNzUwX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKSAgPg0KPiAreyAg
PiArICAgIE5QQ003eHhDbGFzcyAqbmMgPSBOUENNN1hYX0NMQVNTKG9jKTsgID4gKyAgPiArICAg
IC8qDQo+IE5QQ003NTAgaGFzIDIgY29yZXMgYW5kIGEgZnVsbCBzZXQgb2YgcGVyaXBoZXJhbHMg
Ki8gID4gKw0KPiBuYy0+ZGlzYWJsZWRfbW9kdWxlcyA9IDB4MDAwMDAwMDA7ICA+ICsgICAgbmMt
Pm51bV9jcHVzID0gMjsgID4gK30NCj4NCj4gVGhhbmtzLA0KPg0KPiBQaGlsLg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCiBUaGUgcHJpdmlsZWdlZCBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZW1haWwgaXMgaW50ZW5kZWQgZm9yIHVzZSBvbmx5IGJ5IHRoZSBhZGRyZXNzZWVzIGFz
IGluZGljYXRlZCBieSB0aGUgb3JpZ2luYWwgc2VuZGVyIG9mIHRoaXMgZW1haWwuIElmIHlvdSBh
cmUgbm90IHRoZSBhZGRyZXNzZWUgaW5kaWNhdGVkIGluIHRoaXMgZW1haWwgb3IgYXJlIG5vdCBy
ZXNwb25zaWJsZSBmb3IgZGVsaXZlcnkgb2YgdGhlIGVtYWlsIHRvIHN1Y2ggYSBwZXJzb24sIHBs
ZWFzZSBraW5kbHkgcmVwbHkgdG8gdGhlIHNlbmRlciBpbmRpY2F0aW5nIHRoaXMgZmFjdCBhbmQg
ZGVsZXRlIGFsbCBjb3BpZXMgb2YgaXQgZnJvbSB5b3VyIGNvbXB1dGVyIGFuZCBuZXR3b3JrIHNl
cnZlciBpbW1lZGlhdGVseS4gWW91ciBjb29wZXJhdGlvbiBpcyBoaWdobHkgYXBwcmVjaWF0ZWQu
IEl0IGlzIGFkdmlzZWQgdGhhdCBhbnkgdW5hdXRob3JpemVkIHVzZSBvZiBjb25maWRlbnRpYWwg
aW5mb3JtYXRpb24gb2YgTnV2b3RvbiBpcyBzdHJpY3RseSBwcm9oaWJpdGVkOyBhbmQgYW55IGlu
Zm9ybWF0aW9uIGluIHRoaXMgZW1haWwgaXJyZWxldmFudCB0byB0aGUgb2ZmaWNpYWwgYnVzaW5l
c3Mgb2YgTnV2b3RvbiBzaGFsbCBiZSBkZWVtZWQgYXMgbmVpdGhlciBnaXZlbiBub3IgZW5kb3Jz
ZWQgYnkgTnV2b3Rvbi4NCg==

