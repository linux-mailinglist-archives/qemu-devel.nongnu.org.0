Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F770C246A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 17:37:17 +0200 (CEST)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iExjg-00030k-Fi
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 11:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iExSS-00072l-56
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:19:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iExSR-0007T6-1Z
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:19:27 -0400
Received: from mail-eopbgr50131.outbound.protection.outlook.com
 ([40.107.5.131]:19618 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iExSG-0007Lr-RL; Mon, 30 Sep 2019 11:19:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgshyEVVSAp5tiAchpOgpxuOQnk1pQ00mzEtNcbUgxxdPmc1yGTs+7Ykbd8fFkA4lsslGk2/rh10g9vMiXGQbvsvXBnHtCqOg3BALTZFDHbyAt/tiNSVEjx0OamOZuGBSpYX4kaEdTQvVU+J6MfMWB+GvCRyDneb6h6ApzTcjOgIjHVyZc6zg/T45Ds8tziSX2Ai2D45ylvLg4yrz+yS/KR0ln9EpoeE79svFq1kVEkEMwS0nQPSaS3oKakFesiAaagL/mIB7EPPrRU9qJw2gSZzi7rPsA5Q4Whl9DG8DfhKsZY00NjQ0zR94bKt3patmt9LQv5XXsYEIoILttdNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUGD7uxF68AjvUDWtECUGIgEwQddHyDkoH5B6ewjqFo=;
 b=N1RfjNb/usKymiNC4tUbYZOeqECoVuzmAGvVkSnUrLxuQT6x21l9/JT8rGPL+mjswFyzy5DDZJ0/zHG99LRgvmxMu9B6x0SI/GYYeAjzL6cXwGrZcxGPJrg2XrBdSwAv+WvZAELZAF6zmgZfGlll6kAFnwqwDpdobw+NwxCB+defSug25Ju7tVDmki2lWU6m3+4xWVxLWOTUtc3xDt9YzVCPvc64FnyuIil8R2HxxJEsbx/psmdDOv3ZtbyzIs26kW6vAlfvsJU/EWR2JioHtXrMctPcGbnBfnI/6RcSlMoX4Y0QvVdoX+XeGSAJ9TDoV3sRX8c3CowQYslZSUFyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUGD7uxF68AjvUDWtECUGIgEwQddHyDkoH5B6ewjqFo=;
 b=wRYXgDc1ThLf8bgws4s1/paEZN7feMlhy3vEj24CwC1mGM6F0VDyd5PCAS/DogVkENDw6HL1bhbp31CzizTseRYYAVo5FRWxAw+EXxNoF343Hkf4f+wzq+8bd2S/a//y33Y3LKrs8PiAFPqO00PJ/Y7qnmHC/PfvruPLnYlv/28=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB3961.eurprd08.prod.outlook.com (20.179.11.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 15:19:12 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 15:19:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 04/25] error: auto propagated local_err
Thread-Topic: [PATCH v3 04/25] error: auto propagated local_err
Thread-Index: AQHVcxQEcKETnqqn7ky5xEykJfDDyadEXLqAgAAB64A=
Date: Mon, 30 Sep 2019 15:19:12 +0000
Message-ID: <ca629ae8-15c5-1685-1cbb-99283d37b0a1@virtuozzo.com>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
 <20190924200902.4703-5-vsementsov@virtuozzo.com>
 <20190930151215.GB12777@linux.fritz.box>
In-Reply-To: <20190930151215.GB12777@linux.fritz.box>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0501CA0005.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::15) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190930181907771
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3e67d9a-6170-40a9-b0cb-08d745b98c65
x-ms-traffictypediagnostic: DB8PR08MB3961:
x-microsoft-antispam-prvs: <DB8PR08MB3961234CBA443C2608C0B2C2C1820@DB8PR08MB3961.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(396003)(376002)(136003)(346002)(366004)(199004)(189003)(7736002)(52116002)(386003)(7406005)(76176011)(305945005)(6506007)(6486002)(26005)(6512007)(186003)(102836004)(4744005)(54906003)(99286004)(316002)(256004)(6436002)(7416002)(446003)(476003)(2616005)(486006)(11346002)(5660300002)(6916009)(6116002)(229853002)(3846002)(31686004)(478600001)(71190400001)(71200400001)(2906002)(66446008)(66066001)(66946007)(64756008)(66556008)(66476007)(6246003)(86362001)(81156014)(81166006)(4326008)(36756003)(14454004)(8676002)(8936002)(25786009)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB3961;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: epO2fAItlVvnb24ZK3Z+jIBbEiHOngemufx1Bhj9YTXp2weOY8NNLZnnk6s+2HeqUu3kviaX3jA+O0eKj/2EIMpfWVEniYkpuZ5vHUr4KvpLrb48Zmkv1hI+rMA2KGPwROWYPx87BWQJDp7k5WKoZEk7EOW/K+9uPvuwHAUrjvKsJR5DpfJ7rnV1Tv8LYwxBHCbGC5DIPAbeNvbNEsTj/yndVV1w8ceImnkSSofaSiFmp1oWTh7STIk69E0caHoQ2plbJbIzKt+DSOXoM19hOS0vaS83+u7HxX9Z7zH55mUoWBmx0+OTMuXJVf3Tv9k1xHjB89S++zEa3AdSzayu2WmSCayQo88iHegYuQGhYrPBJuJNlt/IsJHUvM3foCSz/IQ2gUY/SMDfwDJo6SC6E3UhCiP7iqmjBm/YA7Maiuo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <18EBCAE8CB939D4996F6F991EB2DF3CA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e67d9a-6170-40a9-b0cb-08d745b98c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 15:19:12.4846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tev0aNW000uLgyUgy7WL/ZcFTDMO8Ie2j52Nkgo2C7sp9oNkqB292s/drkpH68gY3aHm+hd267JCDPrx41R03cRzYLjENVRJgc6MD7Gq7SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3961
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.5.131
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Paul Burton <pburton@wavecomp.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "integration@gluster.org" <integration@gluster.org>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MzAuMDkuMjAxOSAxODoxMiwgS2V2aW4gV29sZiB3cm90ZToNCj4gQW0gMjQuMDkuMjAxOSB1bSAy
MjowOCBoYXQgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSBnZXNjaHJpZWJlbjoNCj4+IEhl
cmUgaXMgaW50cm9kdWNlZCBFUlJQX0ZVTkNUSU9OX0JFR0lOIG1hY3JvLCB0byBiZSB1c2VkIGF0
IHN0YXJ0IG9mDQo+PiBmdW5jdGlvbnMgd2l0aCBlcnJwIHBhcmFtZXRlci4NCj4gDQo+IEEgYml0
IG9mIGJpa2Ugc2hlZGRpbmcsIGJ1dCBGT09fQkVHSU4gc3VnZ2VzdHMgdG8gbWUgdGhhdCBhIEZP
T19FTkQgd2lsbA0KPiBmb2xsb3cuIENhbiB3ZSBmaW5kIGEgZGlmZmVyZW50IG5hbWUsIGVzcGVj
aWFsbHkgbm93IHRoYXQgd2Ugd29uJ3QgdXNlDQo+IHRoaXMgbWFjcm8gaW4gZXZlcnkgZnVuY3Rp
b24gdGhhdCB1c2VzIGFuIGVycnAsIHNvIGV2ZW4gdGhlICJlcnJwDQo+IGZ1bmN0aW9uIiBwYXJ0
IGlzbid0IHJlYWxseSBjb3JyZWN0IGFueSBtb3JlPw0KPiANCj4gSG93IGFib3V0IEVSUlBfQVVU
T19QUk9QQUdBVEU/DQo+IA0KDQpJIGhhdmUgYW4gaWRlYSB0aGF0IHdpdGggdGhpcyBtYWNybyB3
ZSBjYW4gKG9wdGlvbmFsbHkpIGdldCB0aGUgd2hvbGUgY2FsbCBzdGFjaw0Kb2YgdGhlIGVycm9y
IGFuZCBwcmludCBpdCB0byBsb2csIHNvIGl0J3MgZ29vZCB0byBnaXZlIGl0IG1vcmUgZ2VuZXJp
YyBuYW1lLCBub3QNCmxpbWl0ZWQgdG8gcHJvcGFnYXRpb24uLg0KDQpXUkFQX0VSUlANCg0KQVVU
T19FUlJQDQoNCkFVVE9NQVRFX0VSUlANCg0Kb3Igd2hhdCBkbyB5b3UgdGhpbms/DQoNCi0tIA0K
QmVzdCByZWdhcmRzLA0KVmxhZGltaXINCg==

