Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC4702BB7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:43:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWau-0004LJ-GM; Mon, 15 May 2023 07:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pyWaO-0004FK-Ju
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:42:02 -0400
Received: from mail-vi1eur05on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::71d]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pyWaK-0006Za-Vi
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:41:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3LKOylpGj8wLoLz+U78Ivb6qjoHox6Xeou5HEGw9/Ej0kdSilUvao3+WObW9c9me7v7ApEokc5NQEtHXlKc94Gf75m4+GDctb8Tf4Qh3PDLGyaxDcyUyXYRKmCXMzybu9mnz+ySkUXQ/0JhOrGIXyEDplukrJJlT/mpqsIsi5YR9XGJ743o6i8ogoNZh+Ts/6FgScFp7C9SBHPVZ1xI1HncRvKdF1La4zZgAvYHHAh2PEVTjUlxqa3Aqj6twITUfCTNE3OC87gTD6dpdgVK10G2p6hyXe2Bs1m6O+iUM/5uT4GDyMo0UySCJHkj3uiMoWZO0QkC4qTbXqbZF4U1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ljv9yHzC2YHFlXvdrS5CGK9SfojOny3RN7dnzFs5Wcg=;
 b=hMRSIQKH0qdZxDEYbvZZ5SOjiGejBDcWpRYzqK4xDa4Hf/gC1Y+hLW9KLsplqk2N2USsJ99M7Y2nglY9pSHHbbWh+9g3eJHR4LHBVKSO4uPJiFm6qzS3yDGvYjBXDdae491C1ePpeUQGZrx5s5gE1iPCoPl1KPGd1u272bZLcQp1/33/uUgNkp3aAk+pDZv2tqwCbouosLVhyTa56deKhmSeM2Jeo2UJ0+HWsh0JtJGJSoVMtUKa1RcGQJ6cFo0C73gqcjK/xevqP7waVgxT6ysfhlrxpJaB3BXYc9YejjL46JcL8gqBOtb3vHE/L3vHebs95o+IoWnEfoyvI4Kk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljv9yHzC2YHFlXvdrS5CGK9SfojOny3RN7dnzFs5Wcg=;
 b=murCkUrCeQDq9pVDDUkx0E+vtFwgZ2fM9vvg6sCX0R96brFREYPYSZ3r8wAdsDEoA6WAziiTtsELUe1fLbrP7tdA4PUg5ZkfRabjRl1T1BnsRSYEJEWAz3SqbXccMsmXD5CJPrcRLGUK89xIQ9QpzD7n0QVQGOTsfMAkcSubtbM=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0699.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 11:41:46 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%7]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 11:41:46 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "akihiko.odaki@daynix.com"
 <akihiko.odaki@daynix.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "k.kwiecien@samsung.com"
 <k.kwiecien@samsung.com>, "m.sochacki@samsung.com" <m.sochacki@samsung.com>
Subject: RE: [PATCH v6 5/7] igb: add IPv6 extended headers traffic detection
Thread-Topic: [PATCH v6 5/7] igb: add IPv6 extended headers traffic detection
Thread-Index: AQHZhOiOfsqM2qIUfU6N57k39K2PJa9bOpPQ
Date: Mon, 15 May 2023 11:41:46 +0000
Message-ID: <DBBP189MB1433D3B9D88EDC7D2504CB4F95789@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154351eucas1p1d6dab09b1b9812534360a617a8d1d79c@eucas1p1.samsung.com>
 <20230512154335.2536-6-t.dzieciol@partner.samsung.com>
In-Reply-To: <20230512154335.2536-6-t.dzieciol@partner.samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB8P189MB0699:EE_
x-ms-office365-filtering-correlation-id: 39e74bb7-3624-423e-f77e-08db55395ce3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uw4YuNjpM/mo28vptL26TmGjitGisoXza/MhVI9/WZCiI0q+ZObPAxq5n6JauVjlWasUIP5SfXeYMUoM0EapemSyjpwEbs0vGHPadPbS76H3p/BXMkOBzNW1fuLARu+9yurxJP9NG75aILgb2nLwezDqNiJjOyQCAyau8ckJS2AHb/s+1AL2osi6H6480My+uaQ9LsCPq3hZULDXDLS48QwSj/UC8dcIorhWsTCSTQYUmxyrQJ0rfFP1kIo1h/xRjvB9B3Y90vlPexnGb4Nj2bsXfvDpCFX7Ee1kBlT5w7S26gzij+Tc5lK1FcckRTo2DKZQ+37TKmuyin21ygKlxJlHBf5UI8c7KcQvTVFI4wsGcWNfemig72w5e7hdwXFkgeajybN24kgTdEK2UhLOGWoNqeAUXmBoZE85ea3gNOSua30DqBXWFS4CrIAURucSfp9LoEZjYBDFlTeQBelHP5y2iG1FWVvrdeR+4uXGHG1H6d5Fz6ejVJmCLKWdhIFn6ej5NOdpAOsmoKAEy4Xmqvy4/h1rxpdpAGxeP0rgHCunVTLh8dYOT3Lcepx86t/lp63nrW40QcOLUEh4FXV6YtNNeaqAii3TZf0mvUkLH/pHYkMLe8F1g6O3bUrguejP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39830400003)(451199021)(83380400001)(66476007)(66556008)(64756008)(66946007)(66446008)(76116006)(55016003)(7696005)(26005)(6506007)(53546011)(478600001)(5660300002)(54906003)(110136005)(71200400001)(44832011)(186003)(2906002)(52536014)(4744005)(86362001)(8936002)(33656002)(8676002)(9686003)(4326008)(316002)(38070700005)(41300700001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzVGaFdWd1MyUDRNc2hyVFIyVElCVm9taDhqRjhNdEVaTEdmQmVnMVB6elBh?=
 =?utf-8?B?VjU3bnZDNGRScFZINkVkNGI3U01ZWUxrY2Jqb2pxMmlrODAyNmduWEhUNjhv?=
 =?utf-8?B?RVZnbWo2UFFzMGI1UFBhQmtKWUt5S2tIS1Rqc281eXFuKzRIS1QzelQ1ZC9l?=
 =?utf-8?B?dEViTFc3a0FIQUlsR3kxYUlnZk0yQVRkaTZiNVc5bGFxNXVnRkFHWDVUeXlz?=
 =?utf-8?B?bkw4QWZMRzVJNDNvbXBjaHZIVVRyUUhKL2ZNUUVFL2MvMzVsM1lBWUxBU29I?=
 =?utf-8?B?ZXVkL04xL3dZYVl0eGp1YnAxU2owOVhxUG5RU1NXSEpUTDBDaXFQaHVmYzQr?=
 =?utf-8?B?ZHVJa3JIbEtxMkxWSUdnb3Rua1ZmRmJDbFRIRHRyMy9JSXV0TFFtU2ZtOU1t?=
 =?utf-8?B?Qnk3aGNodjNmZDBhOXNma29KVVFoS1V2NkxzQ3VlTHN4bWFSRXlmRUxmYXh6?=
 =?utf-8?B?bUhBQ3JuNmFHa0gvZmRYbjc5WWFVa0RNdzZ0bk5GNW9jMGhWNTRVY1JvcWRN?=
 =?utf-8?B?cmVuTnFOTkdUZ3hDbUd0TnpZUlBoSEpYY0s1cFlXVkx6aXZBZHc5Mi9ybEh1?=
 =?utf-8?B?RkJ0ZVdOZFJycXdEeUdvOG5IZjk3ZlJXZXVPMG5mamwzRG9icjg3QkZkK2Rs?=
 =?utf-8?B?OUhqTkl1SW9nanprTVAzYVlSMEV4N1RoTFNTeC9CcUJIRzhWV0VPZmVPYktD?=
 =?utf-8?B?QXo1VGdPa1RqT29tM2Z6eWtsOWtkY2wrYTJuQktFSHpEV0l3cDZpOFRDR2M1?=
 =?utf-8?B?VTA1VkV6dmN5eTJxbmFjMk1VdlNqY2ZIcFF0c3RSOEdJb0JjbEdObVozdUxk?=
 =?utf-8?B?TzFXajI2R3FVaG51cmg1S1dxL0VoNGVUVVRGcFNIQ0ZKL3kxRVpvbll1TUpw?=
 =?utf-8?B?MkNWenVId3gyWEZHNGp0UDZUNjZ0Mk9wS09SOVhFc0xEUWhqOGxlSVZ2eG1s?=
 =?utf-8?B?NWc2N3RKR1ZYNWVZNGtZWnNOREtLN0JsOWNpMmRQeWpXMG53b3dFdFVOUkxr?=
 =?utf-8?B?S0NTQnU4YW1aL0Z2WjhpRkRKdnBOSmZlVHlGbWNzQldzUWpoOWN2YmRoWElJ?=
 =?utf-8?B?LzVIZUVOdzBtdnUxdWE1Y2ZoeEZ3NmlIcVRoek1YTy80WlFVdy9ZaDUyNkVr?=
 =?utf-8?B?ZWRRZ1NaRytubzFUYkdsYnNyTHhKQWVFRmlQN2Y2R3FxN3dCZHdlemVKM0ZH?=
 =?utf-8?B?c3cweDVMT3EyNEUva25tUWZsM2N1d3AwTzJoNmp5ajZyR2xpV0pXWUFodmsy?=
 =?utf-8?B?QlNuK2d6Q1kwTmdqN3FUcGgrLzFkdTRTaHlIcitKS2dha1BBOUs3STZIN0hI?=
 =?utf-8?B?Z2U4akI1OUF3SklwNGdBTTNJaStlU1FPQTlndUs2RW5RVXVodTk0Qk9oU3dJ?=
 =?utf-8?B?UHgvQnI0ZmFTME5MaUZUbFdMSkJOR1V1eU5UVHpNSjlYZHhsaXhQNEtIUW0r?=
 =?utf-8?B?bzZ3Q09MTTA2NFMybjZNVkZYSWpUa2ZoWHZvbzZEVU5aQVJNeEVIc0lwS1BL?=
 =?utf-8?B?SFVkMzlsSm5aeXNVR2E0bXNrVS9TZGhKYTZHRFAyQlFQbTg5Tko1T1lxWFRH?=
 =?utf-8?B?NTkrUklWTkc0OStXV0pVZnBjRVdxRlJMNU1TUkxCemROMzZsZTUzZ1RKbGdG?=
 =?utf-8?B?NG5xK2VvcWR1SWZQandlRzM4SE1iNG9oZy83ckZyUFBnRVQ5MUd0S01OMUxa?=
 =?utf-8?B?VjBRRmJCOFljU3dhYXIvV1dmTUJzaE9Zc3c0NXRQbkZYYzlmaEwvblQ1Z0Vr?=
 =?utf-8?B?SVYrWEV6Z3AwYkp4TmxzbkNHMEV1T0pkZnNibUVzZHVnY24waVQ2RkQvY09F?=
 =?utf-8?B?UWsvaUxLbXFqcXlJSFd4cjdXRUQ1NDMrQ3pSUnhlVzVDWUtDbW1ORkN5anoz?=
 =?utf-8?B?YUJwcmk5QU9qWmpWRHNrMk82Skt2czZiNE9NVDNyNUd1Q3Jqd3NLYmhkR05u?=
 =?utf-8?B?ckFnL0kyZWZyQmZUSTQrbDJ5RU1uaEJ1dVdBWnp2V0N2MVFZTlRCTHc5NkRq?=
 =?utf-8?B?QVN1YVp2VnVPWlVLL2lnUW9RNlM3Tm9udWVFTzdseFl1VWxxWHNkREZCaHZs?=
 =?utf-8?B?VllDd3BXd2lKdVMwUGNyTy9xZXlWUHQrRzI0VjgyeExjTWFlZWlzTi9NUDNj?=
 =?utf-8?B?blpnNytDVVE0MTZ1NXR5dXdUSEZZYUxNczV6TXBHbUdsRTR3dStaL0tVaUsw?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e74bb7-3624-423e-f77e-08db55395ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 11:41:46.2678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGR85m7MNjhg1+c/y/l18avys2mgTnyQHk6ZfO5TRkoSViV1KRUcoryeAsMDt4geF09cAo7IdQb4qR/Gc9aaX7MLuXU7Bq/fZbJVD+aXcX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0699
Received-SPF: pass client-ip=2a01:111:f400:7d00::71d;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9tYXN6IER6aWVjaW9s
IDx0LmR6aWVjaW9sQHBhcnRuZXIuc2Ftc3VuZy5jb20+DQo+IFNlbnQ6IEZyaWRheSwgMTIgTWF5
IDIwMjMgMTc6NDQNCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgYWtpaGlrby5vZGFraUBk
YXluaXguY29tDQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0
LnRlY2g+Ow0KPiBqYXNvd2FuZ0ByZWRoYXQuY29tOyBrLmt3aWVjaWVuQHNhbXN1bmcuY29tOw0K
PiBtLnNvY2hhY2tpQHNhbXN1bmcuY29tDQo+IFN1YmplY3Q6IFtQQVRDSCB2NiA1LzddIGlnYjog
YWRkIElQdjYgZXh0ZW5kZWQgaGVhZGVycyB0cmFmZmljIGRldGVjdGlvbg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogVG9tYXN6IER6aWVjaW9sIDx0LmR6aWVjaW9sQHBhcnRuZXIuc2Ftc3VuZy5jb20+
DQo+IC0tLQ0KPiAgaHcvbmV0L2lnYl9jb3JlLmMgfCA0ICsrKy0NCj4gIGh3L25ldC9pZ2JfcmVn
cy5oIHwgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPg0KDQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJh
bWFuQGVzdC50ZWNoPg0K

