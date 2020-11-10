Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50A2AD277
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:29:20 +0100 (CET)
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPxm-0003BQ-Tb
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kcPwV-0002kl-Dc
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:27:59 -0500
Received: from mail-bn8nam11on2071.outbound.protection.outlook.com
 ([40.107.236.71]:59104 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kcPwR-0001GR-TV
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:27:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuKa9ra4QRK2i0rfMuoSmAUYrzZBNHSYN+pIhD6Wu1XUzg5Yk/gy2Ige6GPBETNLYhl0O7KgE3No5Xp4ye4OQc3vppHid2iT41i/K1wFkaXs7sgdQxlQL2gC//buw5I/GYGILGgUfHQOCIkz4MYjSNSyn6FkYm87WvDHptkASYqrdiS3g2L8axC2PJ1v3fvoe/2RTPC34CnwdV769VPiA3bnuAAM2+8ZCfMaFstvAmU4V2qb4BgoYmSFKSEjYxDl53KhNA8xTgiL/u3lJ4QVAi+cjOceWvCpSae6cU4P/tD6HdwNh5HQGYuajhkZkwRzEriKI/jXsYiIqXR8R0jgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmUHvzl3pw43Y37cl6WwwvYBxr9ZFiymcs6YHdm3i0I=;
 b=jo0cjS1aBO1tRsLbCn041Pu8ZoM2bHJ7hokosxwlteJoEwW/r7DUy8PDGYDTLBkg3gV9BMjBjSfbUmnnCleubBaocYFKOEA1TT/TLyDz/a/kII6XbDziObbkh/q0aCoYac4efk23Ag9C8c/IDlfZpqUOdNUog8RlnZOQZlpff6/RGiipVt1dofxf2kpk5lJXfxKzJ16M3/W9ChZ2QKIfbak8wFx4aNfv0RnyczZlsVUkEKUAY+aDjk0hRbI03vcNipley5iX3vNhBLhfK+yt15d6PtmLrk4t6iZ0ID8l5J1sXFaKRXuh74Edzsd4APeAkZylMuXya4A8zFONkjjogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmUHvzl3pw43Y37cl6WwwvYBxr9ZFiymcs6YHdm3i0I=;
 b=QNZ4tRGKms2CiPYSZpqP92dOejcc7G2wplqPRb9GxRkWP5LGjQC6C1kT3oYWNBGLgUvBhYjg94mhK+ZhrKmFFZ3RhFPFSSZECgq+/T+U3RLReyg+A1YTrC7Fxcn/EMEf4Go6n+e8/CgRtvVPJ4rhYdeS3BDx6QTjhIpCJa2iQqQ=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BY5PR02MB6276.namprd02.prod.outlook.com (2603:10b6:a03:1b5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Tue, 10 Nov
 2020 09:27:52 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15%3]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 09:27:52 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Edgar
 Iglesias <edgari@xilinx.com>, Francisco Eduardo Iglesias
 <figlesia@xilinx.com>, Alistair Francis <alistair.francis@wdc.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Ying Fang <fangying1@huawei.com>, Vikram
 Garhwal <fnuv@xilinx.com>, Paul Zimmerman <pauldzim@gmail.com>
Subject: RE: [PATCH v13 0/4] Add Versal usb model
Thread-Topic: [PATCH v13 0/4] Add Versal usb model
Thread-Index: AQHWty2HdOp1M5opqUSqk1plzrVo8KnA/90AgAAZHBA=
Date: Tue, 10 Nov 2020 09:27:52 +0000
Message-ID: <BY5PR02MB67725F99A3777D658F10B9D4CAE90@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <44ea4075-aac5-386f-52e4-832606870832@redhat.com>
In-Reply-To: <44ea4075-aac5-386f-52e4-832606870832@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 01b516cf-99de-47fb-a574-08d8855ae5eb
x-ms-traffictypediagnostic: BY5PR02MB6276:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6276013FB422ADD72B06DDC3CAE90@BY5PR02MB6276.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zD8nhpahPUaYnyuqqOKVddlM78ZzlkVx7snJVQF7dbDbbLr/OPXVuPP2QQ72SgsCj0/KZGM8VGUGC38+oRp2dXmEe/LPqoITfaZOyHnbrqJTqwpXh3Cs0mLSY5aYbYKwMr0CTOQWwCFLR1Kp9tmhbPY4qk5pRxZFBupBWc23YScqzaDCVJxvyAtXp6pRwt+oPMlRgRFxLrsVinBEX2ecTSYVCKLgLvQBdQx7AL3pLvzj8mTFwXt7+G14Ki/V4UF/AyCmP6p/LaIGKcMKTpV/GPkfjNyyVWTUXyFlfIxBmVTPiL5fwTAei3zWkq/eXhC15IzfS0ZSKNDNL8QgAAFmHzC5WxbFIToSynRj66DnNoeKI/th/zfHYA0pnZ5fZEWy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(66556008)(66446008)(64756008)(8676002)(110136005)(76116006)(316002)(66476007)(33656002)(26005)(83380400001)(2906002)(71200400001)(86362001)(55016002)(9686003)(478600001)(7416002)(4744005)(5660300002)(53546011)(66946007)(6506007)(8936002)(4326008)(186003)(52536014)(7696005)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /VDO3cU3QizHUhL3q6PwfD6Q47IIK3RDozjMV/uKeMqZbrNbhLRZ7z76SGm0oNhUr73mXkqxkrGR0637ngBM+2xng3DDmuZ8M6jrbjKWcpCaOZYSPwl/2SMNc1/NTmbCRV+KO7xZUDxASmzydJEl6mV8t9eZY+QvAnnR+OJqv8GJ9Yruh/tHbgObsbgVN6jLubSf9Lz9FJIRAqBo4WRlm1O4EFmYUfnjgy9/tPbu+NLa/eliWofwyB5zy+y7V0TrowaXVcjyLpAxq1TJ4iwKp6XDelccb9pmou4EBc/WDRod9FdnRWgkoWmrY5f56jbRAQGXsTJX8YZoE7bnpU8YDRo5/hlyFoZIHXGMz3ox1ha3u36zLVumWcx0GOo1AONEt/b4+h7bEJBulcYSinLNwBas4Uqv5eVRCVXJNfhpvoSYSQ2kexLjL9phZi6tKwYI5MpWCfSgBP1/B/JMup9yI1McH/JDPDtDwRnsirWr8VXvi5jVnHzxzHCMxwBVMeDl/m0qn/CwddofZlvpRIjL5E+PdxAfWvCqmCOYs0r48c6251MoQ6QpaNI3fmSO7jUAV9UNDDxoPe1SyIcXCUlpkSgqvv5buVTW5D3GAYFAH4SnbLpQUXMBNU5INnNAdrnk6oAxkTnlhzmPjvRTQBPK9w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b516cf-99de-47fb-a574-08d8855ae5eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 09:27:52.2398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VrDKzmbjZmKPGg5GW1lDZq2ORQdwzchGtjWktcbumBy3YQenkQNf0yujbiF7QXfVjC4Q8Yd1W6F02MUioSX/NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6276
Received-SPF: pass client-ip=40.107.236.71; envelope-from=saipava@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 04:27:54
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUGhpbGlwcGUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDEwLCAyMDIwIDE6MjcgUE0NCj4gVG86IFNhaSBQYXZhbiBCb2RkdSA8c2FpcGF2
YUB4aWxpbnguY29tPjsgUGV0ZXIgTWF5ZGVsbA0KPiA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3Jn
PjsgTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsNCj4gTWFyYy1BbmRyw6kg
THVyZWF1IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+OyBQYW9sbyBCb256aW5pDQo+IDxw
Ym9uemluaUByZWRoYXQuY29tPjsgR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+OyBF
ZGdhciBJZ2xlc2lhcw0KPiA8ZWRnYXJpQHhpbGlueC5jb20+OyBGcmFuY2lzY28gRWR1YXJkbyBJ
Z2xlc2lhcyA8ZmlnbGVzaWFAeGlsaW54LmNvbT47IEFsaXN0YWlyDQo+IEZyYW5jaXMgPGFsaXN0
YWlyLmZyYW5jaXNAd2RjLmNvbT47IEVkdWFyZG8gSGFia29zdA0KPiA8ZWhhYmtvc3RAcmVkaGF0
LmNvbT47IFlpbmcgRmFuZyA8ZmFuZ3lpbmcxQGh1YXdlaS5jb20+OyBWaWtyYW0NCj4gR2FyaHdh
bCA8Zm51dkB4aWxpbnguY29tPjsgUGF1bCBaaW1tZXJtYW4gPHBhdWxkemltQGdtYWlsLmNvbT47
IFNhaQ0KPiBQYXZhbiBCb2RkdSA8c2FpcGF2YUB4aWxpbnguY29tPg0KPiBDYzogUUVNVSBEZXZl
bG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEz
IDAvNF0gQWRkIFZlcnNhbCB1c2IgbW9kZWwNCj4gDQo+IE9uIDExLzEwLzIwIDc6NTIgQU0sIFNh
aSBQYXZhbiBCb2RkdSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhdHRlbXB0cyB0byBt
YWtlICdoY2QteGhjaScgYW4gaW5kZXBlbmRlbnQgbW9kZWwgc28gaXQgY2FuDQo+IGJlIHVzZWQg
YnkgYm90aCBwY2kgYW5kIHN5c3RlbS1idXMgaW50ZXJmYWNlLg0KPiANCj4gVGhpcyBwYXJ0IGdv
dCBtZXJnZWQgYWxyZWFkeS4uLg0KW1NhaSBQYXZhbiBCb2RkdV0gWWVhaCwgdGhpcyBsaW5lIG5l
ZWRzIHRvIGJlIHJlbW92ZWQgY292ZXIuDQoNClJlZ2FyZHMsDQpTYWkgUGF2YW4NCg==

