Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCFD2B4364
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:13:50 +0100 (CET)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedOH-0003sy-5v
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kedMg-0002ec-Bn
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:12:11 -0500
Received: from mail-bn7nam10on2056.outbound.protection.outlook.com
 ([40.107.92.56]:16032 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kedMc-0007Dc-7X
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:12:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inQvcb4Ms1U8IYKn+WsRtU1WaExlNobjoW0j2nEc466Hkw/eRCYELyafH7acSNglva7snuMf9RtzHD4C7aoQcjJ5X6ldYX9qgXmpD/2ZPX8RAiMHFAPaWsln8yaPx6RtrKiMn+PNp9Swh6EzS5/7Gnz/uCQErvqcR0Y+quyePzWGaz6I+j15vJbQGjjfkZvu1krwY+ZqLzM4raQ+gXvmJABhefc5fbQdICyboZ3V58V+M6T1Oq0gNn0wdx8PMCi8M9Nhsyh630Ho5jDwzM8YemhbgiiLF6nUcDKLwDvBgNAo1T4r6hK01L6Yx7ZUsvjfJQT7FjI30wyt77pUsd+c9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPT/cDN6R7Rd7UluN/cIQkolJqPkuiRjGehA4BDlSSI=;
 b=ANPn40Kt92Xfks21uOfwAV+GmKyyAeSsv4n/QPWaTCCJCZ4ctvEdU+IpdbC1NDPmu9zvhsS/3yCh0qpIEn93WoUw1VJZTS926fQdDuXorNRG6ix4hQiCPwxx8n+XKH9Mw/f3p4uN2keHDHvJVtSEFfKKsUfkkcCq9+NqvAu2N4Lrr4060GBEVprgcLTlFQzzHCRgjJlinGjRW5WJRna7uhifK7/YmmMCjz2nylq3JtU/tsXyb4+Q+gF49rLrr+Q6LKobDXOYo2tHvo0JCTu8VbqxI1IxtAhd/N4GyvEv0jlMT/GLCA/iWz9DnoSwgFg7vfkOeaHNeMhuPqr/DA0DKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPT/cDN6R7Rd7UluN/cIQkolJqPkuiRjGehA4BDlSSI=;
 b=b8nolEZPL2Hekm7PPIOlSh1PGUenxMyXzZKo7naoZ1eXARYjtImmM1kV2ZS6QctEsdtvWrVTGHGl/jIvWQ6bTmQdK0pVaa0d25htR/+rzMueQCh2mnzJqm71/Gkw37c4fGAtJ47+awVK0agMe61sowTBiq6q269KnxwtTtnFMsY=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by SJ0PR02MB7536.namprd02.prod.outlook.com (2603:10b6:a03:32a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 12:12:02 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15%3]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 12:12:02 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v13 0/4] Add Versal usb model
Thread-Topic: [PATCH v13 0/4] Add Versal usb model
Thread-Index: AQHWty2HdOp1M5opqUSqk1plzrVo8KnKcPEggAAkhQCAAB8iwA==
Date: Mon, 16 Nov 2020 12:12:02 +0000
Message-ID: <BY5PR02MB677214FAC6E2F1625F2A104BCAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <BY5PR02MB67725D033C3725C001D0AE05CAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
 <CAFEAcA-eR+BkbRGWAEh-6HFXgx2DkHZrxf2=tBprw-H6mm4kfw@mail.gmail.com>
In-Reply-To: <CAFEAcA-eR+BkbRGWAEh-6HFXgx2DkHZrxf2=tBprw-H6mm4kfw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e271f4dd-ac8f-40c7-7e83-08d88a28d3a9
x-ms-traffictypediagnostic: SJ0PR02MB7536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7536B9851A6530CBC9C19CFFCAE30@SJ0PR02MB7536.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vYNBB/m6hy+cq6d+pqwiNfcGL++Sg6RY+x9jmKIX/UwF28Lg00exjw0QD+Kc+cuJu+Pj8IHVRBKbFMjoAdzFNK1CI0L3pnxNGxBNeAnsyoQ4CFkoW/NXQHKv04uOq5f4mz3MdLk72nWlwc2RdTop01cBL4e6tT8DgAiTf6kYZIZhnMW9A9FK/Rks8ebf/78QaxmTvQV6fuqMehtB4oMj2uQWS94EwREAspPNiuANrwOV+kCTEpXnJD1GLghcqPSM7TmmutSL44n7QX/rrcfScZNtY52qqqCvsiGNiKs33juSTeDVI8+q/RtGLVI+gCBf73MqtHqUWQPOM8LQqnmxxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(186003)(9686003)(55016002)(4744005)(6506007)(53546011)(26005)(6916009)(33656002)(7416002)(316002)(5660300002)(8676002)(71200400001)(54906003)(66446008)(8936002)(478600001)(76116006)(86362001)(83380400001)(2906002)(66946007)(7696005)(64756008)(52536014)(66476007)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: YTABS8S6V7zJFMf/5qJyqpwB4k7mbzBRLDgcPcSNRp8uiDvYOTYJz6FnJX00J+572TmZGq0FQqLG7C8MrDELKry91H63T1/nxRgSyaFrPTm6hbIIgk5aQw/1gF4qzj6l1y0RGX+PXjoDNSOgNfhM7UZAfzQVOsUZ323LZvfo0CLYKov/K7j8ZeL+oPezlYq5ZfuASKtHuNcsCp0/ChXotBUlLddGqwFSwXCR9/T1/iCQ2oKRfODFyU3Sr1bAGKJFfEswwKjYA35xgVIu3qtuWeMkhCyyCgtCKFS4RhGpcJvn1th7jWgXoG8OkBUnR0HzVg3LwyuUPDCB9y8eNukMD4Dvcz6wSHe3eJWtipV9r6isMAyDEHdOJ7W6Jdq4WuagtrHhuTAsXp9tyM2HpEf8+2LwnrFFrisjTPnDBWcNK3tcQz+Gum3yC6i8seon5hGdMorOViDHh+pm3vUoR/VxqPmuBWyfI1ugUeNKylnzaluUACmtiwZYd0MwzhMqiO69wtRXXW0NBZwe4eLK4ezFx7IFWZVj++WFZu7FR0oPRNnNjAiImnVeF4bPv35Eq0AunGops3aglm9hMXWhIriNswwR9XomE2akjzj+SWh6O2CVQBAUAPs2PTRKCg48K527d8ckmoznqFSVHucsR39dAA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e271f4dd-ac8f-40c7-7e83-08d88a28d3a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 12:12:02.5548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Yo2RSmus7bvK6Rn4wuUz31YvhQGF7O/T34G50Dyg0rsjXLea6F0L204RJrQu0A1rFzyIagnn4ABn6Rcy4N3TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7536
Received-SPF: pass client-ip=40.107.92.56; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 07:12:04
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGV0ZXINCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5
ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVy
IDE2LCAyMDIwIDM6NDkgUE0NCj4gVG86IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxpbngu
Y29tPg0KPiBDYzogUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBNYXJr
dXMgQXJtYnJ1c3Rlcg0KPiA8YXJtYnJ1QHJlZGhhdC5jb20+OyBNYXJjLUFuZHLDqSBMdXJlYXUg
PG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT47DQo+IFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+OyBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT47DQo+IEVkZ2Fy
IElnbGVzaWFzIDxlZGdhcmlAeGlsaW54LmNvbT47IEZyYW5jaXNjbyBFZHVhcmRvIElnbGVzaWFz
DQo+IDxmaWdsZXNpYUB4aWxpbnguY29tPjsgQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJh
bmNpc0B3ZGMuY29tPjsgRWR1YXJkbw0KPiBIYWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPjsg
WWluZyBGYW5nIDxmYW5neWluZzFAaHVhd2VpLmNvbT47DQo+IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT47IFZpa3JhbSBHYXJod2FsDQo+IDxmbnV2QHhpbGlueC5j
b20+OyBQYXVsIFppbW1lcm1hbiA8cGF1bGR6aW1AZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYxMyAwLzRdIEFkZCBWZXJzYWwgdXNiIG1vZGVsDQo+IA0KPiBPbiBNb24sIDE2IE5v
diAyMDIwIGF0IDA4OjEwLCBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGlsaW54LmNvbT4gd3Jv
dGU6DQo+ID4NCj4gPiBIaSBQZXRlciwNCj4gPg0KPiANCj4gPiBEb2VzIHRoZXNlIGNoYW5nZXMg
bG9va3MgZ29vZCA/DQo+IA0KPiBIaTsgdGhpcyBpcyBvbiBteSB0by1yZXZpZXcgcXVldWUsIGJ1
dCBJJ20gY3VycmVudGx5IHByaW9yaXRpemluZyB3b3JrIHRoYXQgd2lsbA0KPiBnbyBpbnRvIHRo
ZSA1LjIgcmVsZWFzZS4NCltTYWkgUGF2YW4gQm9kZHVdIFRoYW5rcywgbm8gaXNzdWVzLiBJIHdv
dWxkIHdhaXQgZm9yIHRoZSByZXZpZXcuDQoNClJlZ2FyZHMsDQpTYWkgUGF2YW4NCj4gDQo+IHRo
YW5rcw0KPiAtLSBQTU0NCg==

