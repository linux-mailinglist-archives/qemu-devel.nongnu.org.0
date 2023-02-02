Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24514687655
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNTxW-0006ia-84; Thu, 02 Feb 2023 02:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNTxT-0006i6-Le
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:24:35 -0500
Received: from mail-db3eur04on0708.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::708]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNTxR-0002DU-Nt
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:24:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdx0tFXHeec831sxR1P4rSaoF31Kqikp4sro2hAmUuesve5CeGq2cVVfEFoGoprHeuKiOkUcEbgpbsRCmjjqpf5jSUh4QH4mv8CoyRqEgbmHD6lRgXw680455PL/gpRhwq3lxjRBLeKfblVyuzmTZ8QyyDWaeUR37DAKOk6hEbNv/RN5aYO6QknAEDMVbXuY3Wnuk+sk/SjPheoWQwoIyXaT9lj18gb0dgo+OBPE565WhaYgZINklEWvOTYicBZwb7lfbECfmIhtOb1MS7vI6U1/PGVbIB8Lxsr6VYASp0ismO9TJZHx0W8vpyyA7Mi8nMnz1Z8da5XefcOZRDo7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJgfwv/GHRA1eGk7Xqlo7MiQKQD0/hNAI258LSn4VoY=;
 b=OcZ0E4eznvdNC4zaygi2Lax75saqgwhnuBT5OStPCV4lQEtJnqsQTxQNFhKVWTcdpOKTcEUaRokL7r7f74QfXjaUDqIFLQ6Uf7ZG1BFjKebUxn1XghMRb1nWVKqt+MnZ2MSs+DnXp65hfv/6HmXf6RTzgGh8h7Qc4VC3ostQpq0YwBEpx+AzEzbDstSn0BKVx1gZT5mtFPrCPoZhXk8/KJ6FrBtRMUhF3FotZRs3tr6BNwvN6bFy9EKv4oJsmVGWq2NWcEqkCtwdkmMU40ya+O2Pd85p+Zw0a0CDB91Mk3OpodEXRP1MgtCHlxppYyi4zX6uY1148MG88CJoQk7fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJgfwv/GHRA1eGk7Xqlo7MiQKQD0/hNAI258LSn4VoY=;
 b=IZRSRUTy9FBQYM1vYdsdDBOtBVN7qkL17cO98eG28M2Kwru6XRNmkuTzPly2lAkwhM+rvLSu4kEGcznUdoTSJDHho40U92dvWvSHIcOxYyn9OnktMhYRy/SE1AQvaN9p9QDdHTYMbw+Mqdta3wJdaH4c7kKwoEfp2RbPgMmMdfI=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS8P189MB2072.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:521::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 07:24:30 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:24:30 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jason Wang
 <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH v3 8/9] igb: respect VT_CTL ignore MAC field
Thread-Topic: [PATCH v3 8/9] igb: respect VT_CTL ignore MAC field
Thread-Index: AQHZNVhbPu1rv7d0gEml5+cOmwOQV665iOSAgABV3YCAADGwAIABMEvA
Date: Thu, 2 Feb 2023 07:24:29 +0000
Message-ID: <DBBP189MB14338D5138429C8379E5B2C795D69@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
 <20230131094232.28863-9-sriram.yagnaraman@est.tech>
 <6ee9c527-2993-83b4-02c2-6e604d0c3679@daynix.com>
 <DBBP189MB14332AC6E6880C0A15E0CB9795D19@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <4fb5d35f-e859-3887-d075-1c843007beac@daynix.com>
In-Reply-To: <4fb5d35f-e859-3887-d075-1c843007beac@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AS8P189MB2072:EE_
x-ms-office365-filtering-correlation-id: 3881705c-2fb5-46b4-2f84-08db04ee85f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LccL+H071qocEAbI/6m6XKP7sG7vx1b83ptWNEWCtsuXm7RvLY5/Tpi/0qwZhd8BtGLbkvYAB358a+8W++5yUJY95UH2aO7/QYcnufO/p77vh99sztj+PCmLf3zsBScnFyC7ZPBb7s343yurTv4oY3OpJ2ngjz+3JKL8008E/9CVAsY6hyTalPM1o+6EnYr9qc0EfpgpoY9DJ1iJBlEJ/20cQOHTbev/TE7nEdTsHhGc5/xxmKEBqSqz40hhsiCEhsFsyI0L55JY704HTuq9jR+3yrRVQBElw5cVlF/GqjPJOhfwTgNstZOcjawkPBXcNpguLB0izh3hbkx28Ns4L/saIUEYQosjC0lWvHB5bfHpsrYVY3kTpQXrle15IC0puq4lLytuAbX4PkhTDxAQmEhKPVh/junF7k1VGhGP4PBCpZ6VJ3RNJ+izHHPkuqbj/JxGXht4LOn5Tg1CH1OxqR4QG2ggMdZbBRsvHSyVUQHW0wM2Xj4lp1disoPs70pE8r9XMN+5Hcqq/OcdVx8wXCF1wEwcqUvszK6Ea6KgtoY8/7Ve5JDZ90X1rvxfG86kHdhVMnvvkgAGSti3iqFTltVIpLcLWkJK2GRW+gya1EKY+OjV9W9YuprjbtcROHwEZ741YEx6Jmb2UraoY8gCov7WgEoR+9cKfmVMHrBM+YCa1F3CRv9L9SQw34RbM8V4cNJByCViyXtDCzYvaHt0iQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(39840400004)(376002)(366004)(396003)(451199018)(44832011)(54906003)(55016003)(52536014)(86362001)(83380400001)(8936002)(76116006)(4326008)(66476007)(64756008)(66946007)(6916009)(66446008)(122000001)(8676002)(66556008)(33656002)(41300700001)(53546011)(5660300002)(6506007)(316002)(71200400001)(26005)(186003)(9686003)(7696005)(38100700002)(478600001)(38070700005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUFHSUI0UWl2eHFMMVB0dE9QSHlkM3hlcWt5M3c0NThMaEZUaTJVV1BMMk8r?=
 =?utf-8?B?aXhlRllVZnRZbkRkSk4rcVhoZHlaUUtudkIvUUZyQ0x6dFNlQ05zUytyeC9q?=
 =?utf-8?B?dUQvbWR1WWoybWNTaGJ4Z0REMWhFYUp4eHg3eGxQZFRLNXZhYXFyWDNETDJJ?=
 =?utf-8?B?b2Zqem9Ibkp3Z2ZhQ1B4T1h4T1V6MmN5U0FwWGJhZjRIYjVXc0crdk1Oblgy?=
 =?utf-8?B?cXZiMW91SHlORXRBdHRBWDhLN1N0ektOQ0xoOEJ1RTA2WlpNcXJCOHlROTlK?=
 =?utf-8?B?dlFZK1hVejZIUzBrOGFPMlEvUDZldTRXUm11N3NQYk1JMTc0dVMrSWF6RVB2?=
 =?utf-8?B?VTZKM29TV1pkek4xRjdWN3g0QXJMeUN1Vk5CbW9KTEVtQ1Y0MEJjRkpNbm5t?=
 =?utf-8?B?Sk82TUpHSGZFMjBMZmltWXBOK3RueHNsZzN5Z0R1ZTluYjNoNU9PTk13b0w0?=
 =?utf-8?B?cVptanJuOGtVOFQzN01DOUQxMW5DbUF1dnhMaUtYVktRL0gzM0lXNHVHcHh3?=
 =?utf-8?B?SVdsUDF4ZlBMbFBQakhITkxHUnVNSnY3NktqRFB2MEdqd3RRdDZBTDF6WmF0?=
 =?utf-8?B?TC82SURKSk10ZmI4Q29CSUhFZVBTTHVOZHhPUmFOMk5IUVVESDIrd2JvL3dI?=
 =?utf-8?B?cnYrbm5PODBLNlc0MEtqNi9KVmE3UG1BQ1l2enh4WjlOdVZmYmpJNWRSNGwx?=
 =?utf-8?B?QWxsdytyNlZIRXAxUUcyYU5MUk9CdGpYRFplamF1d0FRNFhOVEZ3SnRPSWt4?=
 =?utf-8?B?OFY1U1R1Z1JnKzNxZ1hKSzBGamdORVN5eHZNMlh4bVhZMTFDVEN5cHJyUlQw?=
 =?utf-8?B?Y3ZjT1NDUlAwaFBzUFIxQmxiQVRtc2tDeEJTSVJCek54Q0RSbHFPKzJuTnBW?=
 =?utf-8?B?Z3hob3ZER3Rmc0prRVlRaVYxSUJoK2luZTdvMW1NSFRCd1NoRWZtMEZTOWR4?=
 =?utf-8?B?NUd5bFZkZjJRd0hBbXpRTU1COUd4YzRsYkRnRDFaN3p3UWxiT0FNRGpqakVW?=
 =?utf-8?B?bTAvZGEwaUlBUlZiWUJPMEI2YTlmTmVhQlloMm85OEd1UDVZaTRtSXI4WHVj?=
 =?utf-8?B?aU0yTkk2SGhKNlJBQVBhL1R5SUJKcmlEbVhPb2tyT3crSXQvYy9CRHBDZG5z?=
 =?utf-8?B?SGl3aFBkbXFieXgxL05LNytXRWJhT05tSjJTZUlLZkxmZ3A2U0E0OXdtTzBJ?=
 =?utf-8?B?cld6NngzQitaUTlSWEpFWjNLREM2WVlCOHM3aUdmS0d2NXdRaElIQTEvUWF5?=
 =?utf-8?B?c3RGTHdWYVRaaHlhRXM5WnQyaU5ydStFYlIzQmtnTW9Vd0o4aEFCNCtiaFJV?=
 =?utf-8?B?K1dDbVN1YkpZK3ZHQzUwQTdFU0QyN25ld3pqc1VESHhGSWcxb3VhbUl5WFNO?=
 =?utf-8?B?WlFvb2RwVXZIcFg3ZXBGeEJYU1J6ei9BNlh2eE5TYW1WOVZYbHRXanZtcE5o?=
 =?utf-8?B?WTJLV2t3b2JXeGJnUTlXTE1kMEw0TkNQM1BMR3NHNXpVVjhzVW11OUJiekJW?=
 =?utf-8?B?L25wVURFYUtMRnpFWnk2YThOUzdFTGlpN0M4RFltLzNjUDF1SHFod0NraDdN?=
 =?utf-8?B?QTRuQVhVRmhmUjhHZGs3Z2RZVEU4d0FZVXFQVEJtK3Bsb1YyaVo0NVdQT0Zw?=
 =?utf-8?B?cEFCYS93cVliTG1mUVNsMzMzYVJwbmxJbjVSd21tMW1rbm5VQUlxZmFTdld4?=
 =?utf-8?B?ZmpWM05JbE9MTklra0hoSHNDL0ZtOEtYZ3kzNjF0VUZwWk90M3k5QmYzUXBL?=
 =?utf-8?B?RHlvMjZZWkZjMjNMY3JHRVREcUZXWndxMDZ6eVBFUkxFeGVESHpoTjhlVXZF?=
 =?utf-8?B?Nlg5ZkRiN29GQ2U4bWhaZnVrV1BHYVlOVzczM1U0aHZpanlHem0zOG9IdG1q?=
 =?utf-8?B?bTQ0SmE2QXFmUkx0TmVNN3FXWThRNEdhWTYvYWVxNUpyZmx1MHdtaHVHQXNT?=
 =?utf-8?B?ZmRUZk1qRkdKeHV5T2ZkYjZFcGlqczNvb21vd0V4dmN6aENZRkFnYnNwVVJI?=
 =?utf-8?B?MkRmVUUyWTVsK0VScE9rcldsTy90VlFpY3hsUVFVbUlmMGZ0OThibUEyNzJz?=
 =?utf-8?B?MVpNVjg4aUg5YzVxR0d5VXE1MDBadlQzQWE1ek04bzgyQ2F1bTlqaWFXR0hi?=
 =?utf-8?B?dnEzbFpXa3ZLNG8wNXhlQVNmSUh5cnUrNktzSGpkV0xLeTJ6RnBOQWFxeXRt?=
 =?utf-8?B?Z3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3881705c-2fb5-46b4-2f84-08db04ee85f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 07:24:29.8663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NCEbmHbmq/wKXC7loh/wQazDhnlxNxXvx1vqD9b/cfb8+QbbBx7UnN2Rhd0PLqfDVsjiEP8A2xKD88ANs1NjNvtu2UH/OIaFlWQFlSCj1i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2072
Received-SPF: pass client-ip=2a01:111:f400:fe0c::708;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBa2loaWtvIE9kYWtpIDxha2lo
aWtvLm9kYWtpQGRheW5peC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgMSBGZWJydWFyeSAyMDIz
IDE0OjAzDQo+IFRvOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRl
Y2g+DQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+OyBEbWl0cnkNCj4gRmxleXRtYW4gPGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+
OyBNaWNoYWVsIFMgLiBUc2lya2luDQo+IDxtc3RAcmVkaGF0LmNvbT47IE1hcmNlbCBBcGZlbGJh
dW0gPG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYz
IDgvOV0gaWdiOiByZXNwZWN0IFZUX0NUTCBpZ25vcmUgTUFDIGZpZWxkDQo+IA0KPiBPbiAyMDIz
LzAyLzAxIDE5OjI5LCBTcmlyYW0gWWFnbmFyYW1hbiB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEFraWhpa28gT2Rha2kgPGFraWhp
a28ub2Rha2lAZGF5bml4LmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCAxIEZlYnJ1YXJ5IDIw
MjMgMDU6NTgNCj4gPj4gVG86IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBl
c3QudGVjaD4NCj4gPj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT47DQo+IERtaXRyeQ0KPiA+PiBGbGV5dG1hbiA8ZG1pdHJ5LmZsZXl0
bWFuQGdtYWlsLmNvbT47IE1pY2hhZWwgUyAuIFRzaXJraW4NCj4gPj4gPG1zdEByZWRoYXQuY29t
PjsgTWFyY2VsIEFwZmVsYmF1bSA8bWFyY2VsLmFwZmVsYmF1bUBnbWFpbC5jb20+DQo+ID4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgOC85XSBpZ2I6IHJlc3BlY3QgVlRfQ1RMIGlnbm9yZSBNQUMg
ZmllbGQNCj4gPj4NCj4gPj4gT24gMjAyMy8wMS8zMSAxODo0MiwgU3JpcmFtIFlhZ25hcmFtYW4g
d3JvdGU6DQo+ID4+PiBBbHNvIHRyYWNlIG91dCBhIHdhcm5pbmcgaWYgcmVwbGljYXRpb24gbW9k
ZSBpcyBkaXNhYmxlZCwgc2luY2Ugd2UNCj4gPj4+IG9ubHkgc3VwcG9ydCByZXBsaWNhdGlvbiBt
b2RlIGVuYWJsZWQuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogU3JpcmFtIFlhZ25hcmFt
YW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPg0KPiA+Pj4gLS0tDQo+ID4+PiAgICBody9u
ZXQvaWdiX2NvcmUuYyAgIHwgOSArKysrKysrKysNCj4gPj4+ICAgIGh3L25ldC90cmFjZS1ldmVu
dHMgfCAyICsrDQo+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4g
Pj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9jb3JlLmMgYi9ody9uZXQvaWdiX2Nv
cmUuYyBpbmRleA0KPiA+Pj4gYzVmOWMxNGY0Ny4uODExNWJlMmQ3NiAxMDA2NDQNCj4gPj4+IC0t
LSBhL2h3L25ldC9pZ2JfY29yZS5jDQo+ID4+PiArKysgYi9ody9uZXQvaWdiX2NvcmUuYw0KPiA+
Pj4gQEAgLTk2NCw2ICs5NjQsMTAgQEAgc3RhdGljIHVpbnQxNl90IGlnYl9yZWNlaXZlX2Fzc2ln
bihJR0JDb3JlDQo+ID4+PiAqY29yZSwNCj4gPj4gY29uc3Qgc3RydWN0IGV0aF9oZWFkZXIgKmVo
ZHIsDQo+ID4+PiAgICAgICAgfQ0KPiA+Pj4NCj4gPj4+ICAgICAgICBpZiAoY29yZS0+bWFjW01S
UUNdICYgMSkgew0KPiA+Pj4gKyAgICAgICAgaWYgKCEoY29yZS0+bWFjW1ZUX0NUTF0gJiBFMTAw
MF9WVF9DVExfVk1fUkVQTF9FTikpIHsNCj4gPj4+ICsgICAgICAgICAgICB0cmFjZV9pZ2Jfcnhf
dm1kcV9yZXBsaWNhdGlvbl9tb2RlX2Rpc2FibGVkKCk7DQo+ID4+PiArICAgICAgICB9DQo+ID4+
PiArDQo+ID4+PiAgICAgICAgICAgIGlmIChpc19icm9hZGNhc3RfZXRoZXJfYWRkcihlaGRyLT5o
X2Rlc3QpKSB7DQo+ID4+PiAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgSUdCX05VTV9W
TV9QT09MUzsgaSsrKSB7DQo+ID4+PiAgICAgICAgICAgICAgICAgICAgaWYgKGNvcmUtPm1hY1tW
TU9MUjAgKyBpXSAmIEUxMDAwX1ZNT0xSX0JBTSkgeyBAQA0KPiA+Pj4gLTEwMTAsNiArMTAxNCwx
MSBAQCBzdGF0aWMgdWludDE2X3QgaWdiX3JlY2VpdmVfYXNzaWduKElHQkNvcmUNCj4gPj4+ICpj
b3JlLA0KPiA+PiBjb25zdCBzdHJ1Y3QgZXRoX2hlYWRlciAqZWhkciwNCj4gPj4+ICAgICAgICAg
ICAgICAgIH0NCj4gPj4+ICAgICAgICAgICAgfQ0KPiA+Pj4NCj4gPj4+ICsgICAgICAgIC8qIGFz
c3VtZSBhIGZ1bGwgcG9vbCBsaXN0IGlmIElHTUFDIGlzIHNldCAqLw0KPiA+Pj4gKyAgICAgICAg
aWYgKGNvcmUtPm1hY1tWVF9DVExdICYgRTEwMDBfVlRfQ1RMX0lHTk9SRV9NQUMpIHsNCj4gPj4+
ICsgICAgICAgICAgICBxdWV1ZXMgPSBCSVQoSUdCX01BWF9WRl9GVU5DVElPTlMpIC0gMTsNCj4g
Pj4+ICsgICAgICAgIH0NCj4gPj4+ICsNCj4gPj4NCj4gPj4gVGhpcyBvdmVyd3JpdGVzICJxdWV1
ZXMiLCBidXQgImV4dGVybmFsX3R4IiBpcyBub3Qgb3ZlcndyaXR0ZW4uDQo+ID4NCj4gPiBEZXNj
cmlwdGlvbiBpbiBzZWN0aW9uIDcuMTAuMy42IGlzIGEgYml0IGNvbmZ1c2luZywgSSBpbnRlcnBy
ZXRlZCB0aGF0IHBhY2tldCBpcw0KPiBub3Qgc2VudCB0byBuZXR3b3JrIGlmIGl0IG1hdGNoZXMg
YW4gZXhhY3QgZmlsdGVyIHJlZ2FyZGxlc3Mgb2YgVlRfQ1RMLklHTUFDDQo+IHNldHRpbmcuDQo+
ID4gSSB0aGluayB0aGF0IFZUX0NUTC5JR01BQyBzZXR0aW5nIGlzIG9ubHkgZm9yIE1BQyBmaWx0
ZXJpbmcgYW5kIHBvb2wNCj4gc2VsZWN0aW9uLCBhbmQgbm90IHRvIGRldGVybWluZSBpZiBhIHBh
Y2tldCBtdXN0IGdvIHRvIGV4dGVybmFsIExBTiBvciBub3QuDQo+IA0KPiBJdCBzYXlzIG5vdGhp
bmcgYWJvdXQgVlRfQ1RMLklHTUFDIHNvIHdlIG5lZWQgdG8gbWFrZSB0aGUgYmVzdCBndWVzcy4N
Cj4gDQo+IFRoZSBydWxlIHNheWluZyAiYSB1bmljYXN0IHBhY2tldCB0aGF0IG1hdGNoZXMgYW4g
ZXhhY3QgZmlsdGVyIGlzIG5vdCBzZW50IHRvIHRoZQ0KPiBMQU4iIGFsaWducyB3aXRoIHRoZSBj
b21tb24gZXhwZWN0YXRpb24gb2YgZHJpdmVyIGF1dGhvcnMgdGhhdCBhIHBhY2tldA0KPiBkaXJl
Y3RlZCB0byBhIFZGIHdvbid0IGJlIHNlbnQgdG8gc29tZW9uZSBlbHNlLg0KPiANCj4gSG93ZXZl
ciwgd2hlbiBWVF9DVEwuSUdNQUMgaXMgc2V0LCB0aGUgZXhhY3QgZmlsdGVyIGRvZXMgbm90IHRl
bGwgaWYgdGhlDQo+IGRlc3RpbmF0aW9uIG9mIHRoZSBwYWNrZXQgaXMgYSBWRi4gSW4gc3VjaCBh
IGNhc2UsIHRoYXQgcnVsZSBkb2VzIG5vdCBkbyBhbnl0aGluZw0KPiBnb29kLCBidXQgY2FuIGRv
IHNvbWUgaGFybTsgaWYgeW91IGhhdmUgdXNlZCBpZ2IgZm9yIG5vcm1hbCBNQUMgcm91dGluZyBh
bmQNCj4gbGF0ZXIgc3dpdGNoZWQgdG8gVkxBTiByb3V0aW5nIHdpdGggVlRfQ1RMLklHTUFDLCB0
aGUgZXhhY3QgZmlsdGVyIG1heSBiZQ0KPiBsZWZ0IGFzIGlzLCB0aGUgZXhhY3QgZmlsdGVyIGNh
biBwcmV2ZW50IGlycmVsZXZhbnQgcGFja2V0cyBmcm9tIGJlaW5nIHJvdXRlZCB0bw0KPiB0aGUg
ZXh0ZXJuYWwgTEFOLg0KDQpPa2F5LCB0aGF0IG1ha2VzIHNlbnNlLiBBbnlob3csIEkgdGhpbmsg
aXQgaXMgYmV0dGVyIHRvIGltcGxlbWVudCBEVFhTV0MuTExFIGJpdCB0byBrZWVwL3JlbW92ZSBz
b3VyY2UgcG9vbCBiZWZvcmUgaW1wbGVtZW50aW5nIHRoaXMgY2hhbmdlLiBPdGhlcndpc2UsIHdl
IG1pZ2h0IGVuZCB1cCBzZW5kaW5nIHBhY2tldHMgYmFjayB0byB0aGUgb3JpZ2luYXRpbmcgVkYg
d2hlbiBWTEFOIGZpbHRlcmluZyBhbGxvd3MgaXQuDQoNCj4gDQo+ID4NCj4gPj4NCj4gPj4+ICAg
ICAgICAgICAgaWYgKGUxMDAweF92bGFuX3J4X2ZpbHRlcl9lbmFibGVkKGNvcmUtPm1hYykpIHsN
Cj4gPj4+ICAgICAgICAgICAgICAgIHVpbnQxNl90IG1hc2sgPSAwOw0KPiA+Pj4NCj4gPj4+IGRp
ZmYgLS1naXQgYS9ody9uZXQvdHJhY2UtZXZlbnRzIGIvaHcvbmV0L3RyYWNlLWV2ZW50cyBpbmRl
eA0KPiA+Pj4gZTk0MTcyZTc0OC4uOWJjNzY1ODY5MiAxMDA2NDQNCj4gPj4+IC0tLSBhL2h3L25l
dC90cmFjZS1ldmVudHMNCj4gPj4+ICsrKyBiL2h3L25ldC90cmFjZS1ldmVudHMNCj4gPj4+IEBA
IC0yODgsNiArMjg4LDggQEAgaWdiX3J4X2Rlc2NfYnVmZl93cml0ZSh1aW50NjRfdCBhZGRyLCB1
aW50MTZfdA0KPiA+Pj4gb2Zmc2V0LCBjb25zdCB2b2lkKiBzb3VyY2UsIHVpbnQzDQo+ID4+Pg0K
PiA+Pj4gICAgaWdiX3J4X21ldGFkYXRhX3Jzcyh1aW50MzJfdCByc3MpICJSU1MgZGF0YTogMHgl
WCINCj4gPj4+DQo+ID4+PiAraWdiX3J4X3ZtZHFfcmVwbGljYXRpb25fbW9kZV9kaXNhYmxlZCh2
b2lkKSAiV0FSTjogT25seSByZXBsaWNhdGlvbg0KPiA+PiBtb2RlIGVuYWJsZWQgaXMgc3VwcG9y
dGVkIg0KPiA+Pj4gKw0KPiA+Pj4gICAgaWdiX2lycV9pY3JfY2xlYXJfZ3BpZV9uc2ljcih2b2lk
KSAiQ2xlYXJpbmcgSUNSIG9uIHJlYWQgZHVlIHRvDQo+ID4+PiBHUElFLk5TSUNSDQo+ID4+IGVu
YWJsZWQiDQo+ID4+PiAgICBpZ2JfaXJxX2ljcl93cml0ZSh1aW50MzJfdCBiaXRzLCB1aW50MzJf
dCBvbGRfaWNyLCB1aW50MzJfdA0KPiA+Pj4gbmV3X2ljcikNCj4gPj4gIkNsZWFyaW5nIElDUiBi
aXRzIDB4JXg6IDB4JXggLS0+IDB4JXgiDQo+ID4+PiAgICBpZ2JfaXJxX3NldF9pYW0odWludDMy
X3QgaWNyKSAiVXBkYXRlIElBTTogMHgleCINCg==

