Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF483991AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:29:50 +0200 (CEST)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loUgf-0003NO-GG
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1loUdy-0001dv-Gb; Wed, 02 Jun 2021 13:27:02 -0400
Received: from mail-sn1anam02on2090.outbound.protection.outlook.com
 ([40.107.96.90]:6232 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1loUdw-000376-Np; Wed, 02 Jun 2021 13:27:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6PhW5ukmTMdBpgTl40dCiCwfA79xHN9XOoGfist1zzRDcku697ADP7k8zqUxCpdpFlrzKBqP90hlSZYBNEwaJCNXfhwoDZK+vLUj6/AcLHpgp1vWB+hJgZYbRSGFo/7soAj2ac1uZKjO7jo8hLHlIMlTzbdAmS2/6MCGoLd+RU8jT7SHrpC53Rd5Ffdi85JS6NEjKvBAICMcAJj8OLfSe9qy+fOILJGL+Y3pxyz49zwtTelDqRbGi6o33CylFqPg3AOLySgIYjIz6RY9luqmuvle4WOlXbxW1moqt9lRz2fx+x9DctY2eer1v5blmp+uYcEcW4N/nnLGn8y9Y9tSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjeKcufZF8rJvHJVYWf9CIPnjoZcpLtqHws79Xp01Ks=;
 b=gurtcAmcakchF/PHP4IAiihS3aEdhuKJVOsQRuBAMfNLsS/tsi6NcPI7CZ5eDjIq3rBTE9YTU37mkTd5g7indXqTCujem18ZPuEQwl2hjI3mW0D0opjDhZa+DE0AHPoFOAYwR7pB45x6/Og9uOavdtfVzxvF9AV2EpbI0pg6hQnV3V5epIhZfkoRrWPucxwCkLVV1qUsRKpn69AwsnMapcIdPwEmpk+ucP3z5f/bTMGfYFZIMe3BW7TDz9RaJUVSU6359DA+3J7XrD/ZI/sZ5SYEfFqCBjZxVQe6bInd/msKiA+vJiO52n9piiy1smox46FDccDfubOBZ/j+29wYXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjeKcufZF8rJvHJVYWf9CIPnjoZcpLtqHws79Xp01Ks=;
 b=ew2TaoaQ54MRr2q08KPDsGJ7C7G6sczi210nxZphqCoHxnJdwdzivbP7WZFJeoi9Rb1QBpSrUtm/PtAE1iHe5zag0AMjCJu4NqpJft+YNer/W57x7M9LOPaMd1uQ5d7btvA7pP4Az9kaZdkr/jGxbK+q6aQyYaxv/uyKOd9PIXRANIMIrrBJo+T3lO4BXjtPsoUexe8BTp9iHdg4O1E8Pd5wX+hOUFjjXaU2udfY0E8YeiHiVy2DAts3yRCZ9rC4eUHISx3IOpQDXbDMdwppciLxnDycAKvgU9BIs1JUioVMywbEgxMYjZG1a6bqLOZn36s9LOY1epqoGFHD/e8WRg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5191.lamprd80.prod.outlook.com (2603:10d6:103:12::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Wed, 2 Jun
 2021 17:26:58 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 17:26:58 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 2/3] target/mips: Fix 'Uncoditional' typo
Thread-Topic: [PATCH 2/3] target/mips: Fix 'Uncoditional' typo
Thread-Index: AQHXV9In93vYrVheo0Oq55WmDZ8w3qsA+RjQ
Date: Wed, 2 Jun 2021 17:26:58 +0000
Message-ID: <CP2PR80MB3668FF73C163F77915CA8CDFDA3D9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210602170759.2500248-1-f4bug@amsat.org>
 <20210602170759.2500248-3-f4bug@amsat.org>
In-Reply-To: <20210602170759.2500248-3-f4bug@amsat.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [177.9.76.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 942364ac-21d7-441c-a5a9-08d925eba007
x-ms-traffictypediagnostic: CPXPR80MB5191:
x-microsoft-antispam-prvs: <CPXPR80MB51912F95F9AB86DA41BF0D86DA3D9@CPXPR80MB5191.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VwS/Zh4akjKE9ZWmDx4x8RaSjY06OydFN11vjZuhnwufBX0mK1T8Q+rUAh6JC/42x1iPfkw+aUTDpZVmfCf3sesvzqjYBblS2A7h+vsLCC93L9Cy2yknxNNMlPaAedFGwW8gdZCwEi9w8YoKzPsiOPCRse9rUc8HLeELOISRXim+uNLtCnF7M9oFmwv47PAsGJ5dwclMFmBOSZ2ECQcGDXb+FkjPXLZADbhixvBQLa7z7mLK2HYRcPee//7VFtrPHdSRSqSNoEVRtcs+g9S5M3oXM+cDqSapQ02XAsRAsTjZb4fjo1hsr2OvYs5Uq8ZXScB00jlSghOg+U5mjLHeLu4BZrKpKT98fMiFm3Ls+5IxSS4kF9K35KwEuOwmcG3r1eguG3cGGxkP3ujoUIXD8Gic91KoIbFDdIVA3u1wq3gZkvixMR2HtBHFufB9CwBIu8x4uv1xrCqB3BqI6tnpJyBAc4PrejfK3qR9EqwzF6csvIOvoxu6az7grMrtCxTxqJhlAoWVAuIS04esyrm8L1+8MZb6sbuoUHF4B7DDFep6+QHj1LG6DIS5m9kYtxw2kWnXYIgNplK1T7jeDqBhVj1gw2b/Try7vMETB7hJGy7vyR9LXaLXAuQWXkNA2b2ft7bk/VjDu3kV30sdFiBbQupMvs+qzdO9G/MGXBF5gYC0IR4i2LE+H5sFAddN88k2wFHehgcXX2C7OOM3iOuBhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(366004)(39840400004)(346002)(186003)(7696005)(316002)(4326008)(6506007)(86362001)(26005)(33656002)(8936002)(8676002)(110136005)(54906003)(83380400001)(478600001)(52536014)(55016002)(9686003)(5660300002)(122000001)(38100700002)(66476007)(64756008)(2906002)(66946007)(71200400001)(66556008)(66446008)(4744005)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WE1lNTNaVFhBNlBoSnJndkNteWdWMnpVdS9hMUZWSjZEWkxQdTh0L1BmYUdH?=
 =?utf-8?B?ckRGcnBQVXJjamZ3SXpIWFhTaDgwWHdlTUFQTVdHS2h3dTNKTkRhejFpRnE4?=
 =?utf-8?B?aExiQVJRTm5hSmM0ckl5MCt3SzM4WEhERzliOENSUG4wMkVQaVJ1anUza2Nx?=
 =?utf-8?B?SVQvaVNJSTJBUFZCN0V6b3o5WjJMV0pRKzlkdHAzZzBuc3MxaVFFNnRKMVI2?=
 =?utf-8?B?ei8vNFFxN2Y0QkpOQUhrOXdjSGlRMjRWUkZqWEtqUU00N1NiTHV4S1g2UE1v?=
 =?utf-8?B?VEVabnZLY2dYYUpSV2pkSGJzYTNLdVJFNlFmblJEd0pqZkV6MXBJanZxQzl6?=
 =?utf-8?B?OWN5RWt0WUdTcHk3ZmxvcUJlRUJMNUY0NC9wUG5IcU1HZjNMdXV1VFVWVFh4?=
 =?utf-8?B?UFJxcWRXOGp1TFo3MDVjZUVCK295TGtGU3VMNE51QXYxOThRNHNXenN5VFk4?=
 =?utf-8?B?c0NrQlEwdkxkcGkxeEdzWDFMTW9zS1QzOVAwcEFuMDMrSGpGR1JDMjUvYVpV?=
 =?utf-8?B?VDE0SnBDNkYzSzcveTVLOGZ5SmUvQngzZEtrYXVjL3dHeE8wc2ZsUW1sQUJo?=
 =?utf-8?B?b2VyNVcvaFJDWUl3eDNocUpFT05FU2J2clNvUTFudHNVaUhZV3J6UnF0L1Fq?=
 =?utf-8?B?WW1GMmx3M3l3MjVJQnpwUkpGNlZPTUkrVi95dEptSzNtbkJqaURldTdrdEkz?=
 =?utf-8?B?MGp2TkV6Q0wxdkhYaGFzSE40OVFHUnVNUm5teW80cXA5OTQ3VkJrcWpqS096?=
 =?utf-8?B?WWJSTU1CT0UzdTNQc2hGS3Z0ZkhrSXFWeXZlRm43djNRS2E4WWlkRExRWUJu?=
 =?utf-8?B?VUZ5cWFYekdlNW1kZ1lDZzBtaTIwTjJpU2dqeWM3dTdCVU1wTjRtMzlJanNY?=
 =?utf-8?B?K2ZYaVdrNnFVYy9UeWQ4cmVWYUV2cFhRMlFja0ZabjFpNFM3RWZiMGN0MTM3?=
 =?utf-8?B?WUY2Z2hxZkVaVWhueUFlRTlpRjZGa1ZSVTJZc2o3K045WEhPcnFGUEwxREhr?=
 =?utf-8?B?ZFRVRm9pZnEwbnNaaGdEekpUbTBBdVBEMy9RZnVqS0JIYzIwY2ZCYVhERjJT?=
 =?utf-8?B?Nk9NRkFacDFMbk9jQi9PYWZlYUllNkNId1lWZWNsRkhmNytWVVBreXAzaklr?=
 =?utf-8?B?bUFRbkhCWTQyMUM1dGUveU1YRDlFZzNQZW9OS2puZ1ZocGtIMzgxR1NDUEV5?=
 =?utf-8?B?UEVZVDU1UUtVdjNGOThCUlh4WUUxSklIV3dmcGpJSENFRGowdXhXb0lDdjA5?=
 =?utf-8?B?dDAySG5RSnJXREQxSXMzd2dtOC9lMEN1VUZad29OSWJmTkJnY1pYVkxWYkx0?=
 =?utf-8?B?R2dYc1BJMXNZNEY4akYzTDNiSlBSWVMrTTFxSXBXYlBLdXR5ZGR5d3NObkhq?=
 =?utf-8?B?ejRURmVEcGxNOGo5TXdObE9BazAwaWJXWUEwMXA0SytEQ0IwYUd1T0R0MHow?=
 =?utf-8?B?S1VoWldlUXhHdUtHaUgxcXZNUGc4cEFCT0t3ejQyTHA4T2tub2xlaEJqZGx6?=
 =?utf-8?B?Mmt0aWFZMnVRZS8vNVJIcHR1c0R1U3NKV3lWRUZWMWN0eUVjMmhiN0gxaEph?=
 =?utf-8?B?dS9icjhHUlJCOG1IL005Q2JUVC92NmJyWGVCeDFiTkxJYzZxcWFGQnpzaFo0?=
 =?utf-8?B?UXh3S0VIYUZ4bGRqNFUxNndudFgvQ2RIMHM3ZmNiVGFFV1BnVW4zV2pIU0Vh?=
 =?utf-8?B?eXp1b3BSenJ2eWR0MmtmYjVsTGRQNFB5cktKL29wZFNhV0F0c1VoMjBOcWp0?=
 =?utf-8?Q?m4szryHWqqN3PPylQ8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942364ac-21d7-441c-a5a9-08d925eba007
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 17:26:58.1024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g10Nn8Tttx4PugPfEKZe6yQjveBLLqW/XEd0KSQzR8yfGE9/+m1sh9BW1jSETFggLbb3wgFHVJXoHHqhkDxjQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5191
Received-SPF: pass client-ip=40.107.96.90;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gRml4IFVuY29kaXRpb25hbCAtPiBVbmNv
bmRpdGlvbmFsIHR5cG8uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiAtLS0NCj4gIHRhcmdldC9taXBzL3RjZy90cmFuc2xh
dGUuYyB8IDYgKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQpSZXZpZXdlZC1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0BlbGRvcmFk
by5vcmcuYnI+DQoNCi0tDQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9S
QURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5i
ci9kaXNjbGFpbWVyLmh0bWw+DQo=

