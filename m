Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88639B5F2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 11:27:57 +0200 (CEST)
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp67Q-0007wf-Qp
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 05:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>)
 id 1lp65F-0004zH-LS; Fri, 04 Jun 2021 05:25:41 -0400
Received: from mail-bn8nam12on2072.outbound.protection.outlook.com
 ([40.107.237.72]:10497 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>)
 id 1lp65C-0007nW-Gs; Fri, 04 Jun 2021 05:25:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvu7cAKzFAX/pcEYFtWqU0Y6xAD/SzyjDjqYwfhVrIJMIGgRVDRFP5IqWjs3RyqJztdjORLoL5a/eqsD2TMKnkIiAV2fAx4VM/rpFK5n2qDDvT7h5wpQOT/LJURRMOSIhBNDm64FXoSH7iUENyo7kPlif7oNilz1IKV9+drnVrKGtEiMbHyjQVhEQt0grgMm++UzRrVMxD2hwnnobupmzxCO1pZfgFfrHmUV/eUJ8K6+5XBLirhzVL6LG+BQXviUk71XWUEQENfCk1Jm6RuIVZxfBcBN+UPo+eGXPWlqbxrubleX1tvMABjFx9swB3ufAlPQjXn+BFkyHDbHQxpgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSOHcbf58yfNnvG9rMyqrA2ZntqT+bF+L/Buav3dadA=;
 b=L/uKEn9gZohGyJ18LeIVRv1fW8mx2LFWvH6g9RRdFMQnKExFxmAxk1z7PHAhpbe2IWSGrSRYgiDqSp06Ls+bGDPCK6/2x/RlBQkKFe9k9kJcTLLgq5MCbYilgtH/UR0o/xbE9z7SWJF30Aqn1TvE1M1s4QWfZgyB2hXKDdi+4X6NbcLnygcxGvWaYsJbmP9ucRKCsqw0um44lohff98NB+yVx1tEKO1CkgII0Bo31JnBm+dAc/CpyuLf2Bx7wElev4SeMPPZg8EfmwzxGOT95XJ9hQMdvgcmgBnfa7XWOI/7suiSl/Vybjj5QgMmZ5YDIn1f2zGwJW6SSLL0wPvw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSOHcbf58yfNnvG9rMyqrA2ZntqT+bF+L/Buav3dadA=;
 b=HFVHtgTrFDGluRjCIuHlFXa/AUrwBE1dC5WP2waYMt0omxhthZZV1ip8X9VMDBWX0/WEnldi+I1yhFi4Ue7DmM8/16qbs668j0VsQtYayO0OXaUbA5VSPBr3JNRCVTo1iWxYYnsz+aBON2xJ2QWM06DrvMq6gqjG/13dYy3tesI=
Received: from BY5PR02MB6980.namprd02.prod.outlook.com (2603:10b6:a03:235::19)
 by BYAPR02MB5110.namprd02.prod.outlook.com (2603:10b6:a03:62::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Fri, 4 Jun
 2021 09:10:32 +0000
Received: from BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::2196:718c:a639:be1e]) by BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::2196:718c:a639:be1e%4]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:10:32 +0000
From: Gautam Dawar <gdawar@xilinx.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
Thread-Topic: [PATCH 1/2] vhost-vdpa: don't initialize backend_features
Thread-Index: AQHXV1/O69Nz5WwZQU+ZsyIYxtE3mqsAVJnAgAAUuYCAAyokUA==
Date: Fri, 4 Jun 2021 09:10:32 +0000
Message-ID: <BY5PR02MB6980EE8C39C9369F5BD3CD0AB13B9@BY5PR02MB6980.namprd02.prod.outlook.com>
References: <20210602033127.40149-1-jasowang@redhat.com>
 <BY5PR02MB69805AC4C88DFE9E5172D8BDB13D9@BY5PR02MB6980.namprd02.prod.outlook.com>
 <af3abe28-69e3-326a-4867-4afc42856f43@redhat.com>
In-Reply-To: <af3abe28-69e3-326a-4867-4afc42856f43@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [182.64.122.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02652be6-831e-4029-14f1-08d927389b38
x-ms-traffictypediagnostic: BYAPR02MB5110:
x-microsoft-antispam-prvs: <BYAPR02MB51103DE804AD9A6A434CC527B13B9@BYAPR02MB5110.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UZRj0xVI2crEK6TgVwBdcjHDPZ5TLi0WKXyiZPgWwCxatYU2rBK0XG1BbTQYDx7uA3e3GT2LJbAtcy3uN2tkxPSG7KyJybJAE1QrOXoxydyW+9jKrkXQGB0TyYlYdP626hYaWlGWCMmJOU2j/T9LR7BCe/Oc2JMswM9+Hq36T/0/d3e0AW7K9WsTWEuowqMK9fMSkCk9dLjpTyEmkESHuxLicROPF4yREDUcU0hvktwSHrlVKZl2Rmg6eCMv75ErEBFKdnnZKipl8L2/9YEXevF4jUAWLTCttBAQG6b7efsMnqKKFBnjbVf5IfNOeBU96bWoiG8xKDKUstg9ZUB7bzRfZUhwRUBqHFxbJvH6+lqELXwm9msvJIuE1Odc0IZlbHgcd7fIUaR/FjfYaNCsMye6H5lpsQd62ezNPTuyJ15+UQeeBJ4m6mqOw/C15hD1nlI0hjnkaTNntsnk/nGmfkFcYxTQOfLkbFlCl6v+oJE2oVEKtbQWakd1f+oMyVflLcioEIFeG3lyR0UefUSPqT/z8b7jvu3G+crLY5kgREz2BySOaPJe5TeocWvtC0UOuj9TtgwmgOVnyZwgMhPPn9FOBM9R+jiFM6bsWSUDQO8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6980.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(55016002)(26005)(186003)(478600001)(8676002)(9686003)(316002)(83380400001)(53546011)(6506007)(2906002)(7696005)(71200400001)(66446008)(66556008)(76116006)(5660300002)(86362001)(4326008)(52536014)(110136005)(66946007)(8936002)(54906003)(38100700002)(33656002)(66476007)(64756008)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWlscGFZTVNrUHMzcGJoejlNM1J5MkZsWXlEOEpVTEVNdWIrVkV4MmNYR3FI?=
 =?utf-8?B?RzRibGFaUEtUNjF1aExydm0rV0FZd0NaWit5Z2NkWUUxdGI2VEkrNXZXcG5X?=
 =?utf-8?B?MTRUa1lkcmNYWE1uTnRvK2Z1aWh1MlpFSTRUUzhwWDNkbi9RdmJJNWxNbVV1?=
 =?utf-8?B?YTAwd2VEMUJneUsraG5BbDdlWHRsZGNhQm9UZDZHekRYR0dRS2E0T0FZZ2xF?=
 =?utf-8?B?STJTd1oxcGJUcjZ5NzlGMy91cUQrU0U1TmlhZ01ZVGVMbHprbWZqVEVybnk2?=
 =?utf-8?B?Wk1qaEErekQ0bmJMOTJEeE9hK3MrelZobHJWWGxQaFUxN3RoOUxraktrVXVR?=
 =?utf-8?B?WHBQeFVQdDYyRzR0Y2xIWU4xcDZEdlVqcVZRRHRQS0RhUnIvSVE0OEI4Qzds?=
 =?utf-8?B?Zzc2VWR1UmtZeU1taGJQVVdSb3ByYU1NbzAzdElSL2phNC9qcEg3cUFFUmNO?=
 =?utf-8?B?U1pXdmJsNWtqZVhSb2I4SXhpd1FFUEdGUTd2emtlZkJ3a29EbmE2ZWdDbUE4?=
 =?utf-8?B?NjVDYTVXY245cmVYMjYrTWg5encrR1lqVFlEUEtPVWtGSW1GUmJXZ0dBbHVn?=
 =?utf-8?B?cFliVDZ1KytkRzgrdUh6L2Fyd04raFRjWVlSVFc2SFBvaTdGUVlHNkE3dk1i?=
 =?utf-8?B?ekp3S3dYdWV6bSs3dXpiYi8xS1ZUbDc4Vm1uYjJSbzMxakZPanFRNWdPM09w?=
 =?utf-8?B?UjNXU3BSbE5sT0VoMGJ6NmhteXU0eVBmeWtXYitpNGFQSS9TWW5WK1prMVEx?=
 =?utf-8?B?dXR2Z1R0Zk5LTnVpMEpaMkxsYi92QlBWVXp1MEhjTmFTSG9KYnd3TWg2YkVx?=
 =?utf-8?B?VnVCQW9kYXR3ZHBzMXVjYm51QisvS0R6T0djeFkxazlGWmsyRE4vQy9PTk1B?=
 =?utf-8?B?aFBxK0x3L3B5SEVYMlZSQ1RCcm9JZnFkazBvUWl5SUZHUHdNSlJWd1BLbWhE?=
 =?utf-8?B?TUNVU1VyRHA2M0o5c2VIa1MzQ3FuVkszWnNIekRIK3IyRVBlS3JTR3hFU3pa?=
 =?utf-8?B?SWsrRm5Jc3MrdklkSWszSGVrM3p3MGZJQmtqNkZIdGkyWHZOdVBySXl4TW9n?=
 =?utf-8?B?Q2R3YjBsY2xIU3FlSW9tSnIyTzBGS2V1OEExVEZJOHlIUFRhdGdaTWRYdCty?=
 =?utf-8?B?cDE5ekhTeFV0THVPdkdEeFA1VFZrTDJPaHQ1aklNdzhLRFRJanQvNDRWN2N5?=
 =?utf-8?B?QjJGS21zTk5tbzhCMjhLMWNaV3dHWlpwTS9rdjZGZEs5c1FJckVJQ2xKK0Zw?=
 =?utf-8?B?UFVDYlNFQitiN081YXd5NytPU01aRFZIaXphSWQ5cGNlRGdHTWRnc3U5Q2V2?=
 =?utf-8?B?a0RRUmtqbEFWTVg3QXVtanRkNEJ1c2RCREFLOVF6d2lXbE5wcE5CcDg3TnhM?=
 =?utf-8?B?WkhpMW91azJDRFlLQWt2NndtZk1pWTBtdGRoODRXK2lCd1MwSnlFL2ZIUVBn?=
 =?utf-8?B?ZlBxVnZjWDg3alBxMzYzQ28rSmVIWFViZGh2dC9kNUIySHZGenkzUXJxbDVE?=
 =?utf-8?B?MzY5b1pWRXpsRmphQkhKQXlmUFVUdEErNnRCMUpjODNUTzFTMlY1QjRXakoy?=
 =?utf-8?B?SjM3TlFwT1FVNzhjMC9LUUtVVkVKWUdaOTlCWFB3TktCUHNyOWNraTM5YmxG?=
 =?utf-8?B?M1pRN1FNQjc1WTBhRHBSL3VOWkNhUW8wbjdESUYyWFJqQllweVpSbVBlZ3RL?=
 =?utf-8?B?Z1N3T2dXdHZNaWhIM1NCdjIxUXMvdS82ekJqN3JuWDNkREtGUmRYVGhaeElC?=
 =?utf-8?Q?Ym49TrMIpFOdyuDtEGJyU0kfkwwkGrtuE4tvZE+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6980.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02652be6-831e-4029-14f1-08d927389b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 09:10:32.2793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mr11mFvfGJAAylud8kjeZ7SQtMbV/zpCpyFV9B2Kwt0rxbXD3bYtoQ0KYZCF+Wy5yvHHm027gGDqV4EXm5+LmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5110
Received-SPF: pass client-ip=40.107.237.72; envelope-from=gdawar@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "lulu@redhat.com" <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgSmFzb24sDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKYXNvbiBXYW5n
IDxqYXNvd2FuZ0ByZWRoYXQuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyLCAyMDIxIDI6
MTggUE0NClRvOiBHYXV0YW0gRGF3YXIgPGdkYXdhckB4aWxpbnguY29tPjsgbXN0QHJlZGhhdC5j
b207IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IGx1bHVAcmVkaGF0LmNvbTsgcWVtdS1zdGFi
bGVAbm9uZ251Lm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIHZob3N0LXZkcGE6IGRvbid0
IGluaXRpYWxpemUgYmFja2VuZF9mZWF0dXJlcw0KDQpIaSBHYXV0YW06DQoNCuWcqCAyMDIxLzYv
MiDkuIvljYgzOjM4LCBHYXV0YW0gRGF3YXIg5YaZ6YGTOg0KPiBIaSBKYXNvbiwNCj4NCj4gUGxz
IHNlZSBteSBjb21tZW50cyBpbmxpbmUgbWFya2VkIGJ5IEdEPj4NCj4NCj4gUmVnYXJkcywNCj4g
R2F1dGFtDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyLCAyMDIx
IDk6MDEgQU0NCj4gVG86IG1zdEByZWRoYXQuY29tOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4g
Q2M6IEdhdXRhbSBEYXdhciA8Z2Rhd2FyQHhpbGlueC5jb20+OyBsdWx1QHJlZGhhdC5jb207IEph
c29uIFdhbmcgDQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgcWVtdS1zdGFibGVAbm9uZ251Lm9y
Zw0KPiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSB2aG9zdC12ZHBhOiBkb24ndCBpbml0aWFsaXplIGJh
Y2tlbmRfZmVhdHVyZXMNCj4NCj4gV2UgdXNlZCB0byBpbml0aWFsaXplIGJhY2tlbmRfZmVhdHVy
ZXMgZHVyaW5nIHZob3N0X3ZkcGFfaW5pdCgpIHJlZ2FyZGxlc3Mgd2hldGhlciBvciBub3QgaXQg
d2FzIHN1cHBvcnRlZCBieSB2aG9zdC4gVGhpcyB3aWxsIGxlYWQgdGhlIHVuc3VwcG9ydGVkIGZl
YXR1cmVzIGxpa2UgVklSVElPX0ZfSU5fT1JERVIgdG8gYmUgaW5jbHVkZWQgYW5kIHNldCB0byB0
aGUgdmhvc3QtdmRwYSBkdXJpbmcgdmhvc3RfZGV2X3N0YXJ0LiBCZWNhdXNlIHRoZSBWSVJUSU9f
Rl9JTl9PUkRFUiBpcyBub3Qgc3VwcG9ydGVkIGJ5IHZob3N0LXZkcGEgc28gaXQgd29uJ3QgYmUg
YWR2ZXJ0aXNlZCB0byBndWVzdCB3aGljaCB3aWxsIGJyZWFrIHRoZSBkYXRhcGF0aC4NCj4NCj4g
Rml4IHRoaXMgYnkgbm90IGluaXRpYWxpemluZyB0aGUgYmFja2VuZF9mZWF0dXJlcywgc28gdGhl
IGFja2VkX2ZlYXR1cmVzIGNvdWxkIGJlIGJ1aWx0IG9ubHkgZnJvbSBndWVzdCBmZWF0dXJlcyB2
aWEgdmhvc3RfbmV0X2Fja19mZWF0dXJlcygpLg0KPg0KPiBGaXhlczogMTA4YTY0ODE4ZTY5YiAo
InZob3N0LXZkcGE6IGludHJvZHVjZSB2aG9zdC12ZHBhIGJhY2tlbmQiKQ0KPiBDYzogcWVtdS1z
dGFibGVAbm9uZ251Lm9yZw0KPiBDYzogR2F1dGFtIERhd2FyIDxnZGF3YXJAeGlsaW54LmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gLS0t
DQo+ICAgaHcvdmlydGlvL3Zob3N0LXZkcGEuYyB8IDMgLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3QtdmRwYS5j
IGIvaHcvdmlydGlvL3Zob3N0LXZkcGEuYyBpbmRleCANCj4gMDFkMjEwMWQwOS4uNWZlNDNhNGVi
NSAxMDA2NDQNCj4gLS0tIGEvaHcvdmlydGlvL3Zob3N0LXZkcGEuYw0KPiArKysgYi9ody92aXJ0
aW8vdmhvc3QtdmRwYS5jDQo+IEBAIC0yNzUsMTUgKzI3NSwxMiBAQCBzdGF0aWMgdm9pZCB2aG9z
dF92ZHBhX2FkZF9zdGF0dXMoc3RydWN0IHZob3N0X2RldiAqZGV2LCB1aW50OF90IHN0YXR1cykg
IHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9pbml0KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwgdm9pZCAq
b3BhcXVlKSAgew0KPiAgICAgICBzdHJ1Y3Qgdmhvc3RfdmRwYSAqdjsNCj4gLSAgICB1aW50NjRf
dCBmZWF0dXJlczsNCj4gICAgICAgYXNzZXJ0KGRldi0+dmhvc3Rfb3BzLT5iYWNrZW5kX3R5cGUg
PT0gVkhPU1RfQkFDS0VORF9UWVBFX1ZEUEEpOw0KPiAgICAgICB0cmFjZV92aG9zdF92ZHBhX2lu
aXQoZGV2LCBvcGFxdWUpOw0KPiAgIA0KPiAgICAgICB2ID0gb3BhcXVlOw0KPiAgICAgICB2LT5k
ZXYgPSBkZXY7DQo+ICAgICAgIGRldi0+b3BhcXVlID0gIG9wYXF1ZSA7DQo+IC0gICAgdmhvc3Rf
dmRwYV9jYWxsKGRldiwgVkhPU1RfR0VUX0ZFQVRVUkVTLCAmZmVhdHVyZXMpOw0KPiAtICAgIGRl
di0+YmFja2VuZF9mZWF0dXJlcyA9IGZlYXR1cmVzOw0KPiBbR0Q+Pl0gU2hvdWxkIHRoaXMgYmUg
aW5pdGlhbGl6ZWQgd2l0aCAwIGhlcmU/IEkgYW0gbm90IHN1cmUgaWYgIG1lbW9yeSBhbGxvY2F0
ZWQgZm9yIHN0cnVjdCB2aG9zdF9kZXYgaXMgaW5pdGlhbGl6ZWQgd2l0aCAwLg0KDQoNClNlZSB2
aG9zdF9uZXRfaW5pdDoNCg0KIMKgwqDCoCBzdHJ1Y3Qgdmhvc3RfbmV0ICpuZXQgPSBnX25ldzAo
c3RydWN0IHZob3N0X25ldCwgMSk7DQoNCnZob3N0X2RldiBpcyBlbWJlZGRlZCBpbiB0aGUgdmhv
c3RfbmV0IHN0cnVjdHVyZS4gU28gSSB0aGluayBpdCBzaG91bGQgYmUgemVyby4NCg0KW0dEPj5d
ICBUaGF0J3MgY29ycmVjdC4gVGhlIGVtYmVkZGVkIHZob3N0X2RldiBzdHJ1Y3R1cmUgaXMgaW5k
ZWVkIGdldHRpbmcgY2xlYXJlZCB0byAwIGluIHZob3N0X25ldF9pbml0KCkuDQpUaGFua3MNCg0K
DQo+ICAgICAgIHYtPmxpc3RlbmVyID0gdmhvc3RfdmRwYV9tZW1vcnlfbGlzdGVuZXI7DQo+ICAg
ICAgIHYtPm1zZ190eXBlID0gVkhPU1RfSU9UTEJfTVNHX1YyOw0KPiAgIA0KPiAtLQ0KPiAyLjI1
LjENCj4NCg0KW0dEPj5dIA0KU2lnbmVkLW9mZi1ieTogR2F1dGFtIERhd2FyIDxnZGF3YXJAeGls
aW54LmNvbT4NCkFja2VkLWJ5OiBHYXV0YW0gRGF3YXIgPGdkYXdhckB4aWxpbnguY29tPg0KDQo=

