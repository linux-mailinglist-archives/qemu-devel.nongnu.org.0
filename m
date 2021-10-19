Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19AF432E9B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:51:04 +0200 (CEST)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcixj-0007cQ-TE
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mcisJ-0003Rk-9e; Tue, 19 Oct 2021 02:45:27 -0400
Received: from mail-sn1anam02on2057.outbound.protection.outlook.com
 ([40.107.96.57]:50077 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mcisG-0004r3-A2; Tue, 19 Oct 2021 02:45:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW4Uw/c2sD3YEL6p+FMiTatTh4xvN1uNizGXx+hTFOOz//NQ8k+dVc9xY08HpaquiYzPR3lZDPoB439vwuHNK4wjU1PpUm5d5MKeMMw+bkzCbCh972YJ0q7E/KBayyB4JN84SP0QQJJRIxJ1NFwPJUFn5Mh/qSRu0F38BAGqXp3D7BDIyNFBjumZZCmARfvL+bbzdXQm5t9y2BfcpMKQypRyCmuUyENZF1wP07PEp9ztNo0N0Wmizb7qcFaXPFi6niCSNZiq6bGMbN6Ie9mbSYOQZWuo0Iuo8GHhC+AkdqEGWPwHGLRlIhVtV9hj10amFbyffFQlTHqSdt4mW4w80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVJFvxvbAJgbknspVAY5+XFGUMiFa7sINI3X2zAqkB8=;
 b=kxXNRb1g7LSCqHmn2H00XllZxErXKp1sx2h6OKJfPRKcp+svAUf0Xc5JylPjW3YWBGjK27XLtFpwD9MjOA02Y6Keao54lyjxCmnQW33OlXP3zK49j/4w40Qgo+HhURN9jMbPlHe+y866yjVYm8z6orUOriYcgLQ6lw1Vnwpdqk6V+cSkmEWSIhRvd3vsm7XKLYFtp4xqz1blElN7QQKzJZIGEdvAeLPHPS6j+DMqnWBNrFm6KNvk6k94flTq8hwqE2g4T+/3/fquNZZnQr5UAQMaMVp4D4bB69m6mTuqn4VjdvL0/uGG4VoNWOlTmiuf3hVHf9FjOt8wTmDu+NT7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVJFvxvbAJgbknspVAY5+XFGUMiFa7sINI3X2zAqkB8=;
 b=Eg/LdsETv37wscN4gqTg7Q77iGeie+mhwF/iRJOrUb6Hvd26b0Iw7jFaD5w6KEZuz61FYjIeg3HchbYjnPm1uzF+4s82uzWyYS2cmDlMPVEBjx3/vuvCZnky591li3k/XU8l0yFMWsWITi5630QcptWz3BhIKsEvDY00eGeivHgZNrpcFGWic5AVYdy0/qr+twH9IlsyybX2C2CEhfZy9W8Ry0dLPCqzQGjs3Kf+DC6v0CuUZtjpfKQPSQS9d3NMZyw1OXN2wjywoKKf3odYBHGC2fRsoPDLlyTum1yo0tyG5/mKM9UVdQZKORRAqPpYHwTj20W6NB+nZ0W+fI+oMQ==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM8PR12MB5461.namprd12.prod.outlook.com (2603:10b6:8:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 06:45:19 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 06:45:19 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>, "tiwei.bie@intel.com" <tiwei.bie@intel.com>
Subject: Re: [PATCH v3 1/2] vhost-user: fix VirtQ notifier cleanup
Thread-Topic: [PATCH v3 1/2] vhost-user: fix VirtQ notifier cleanup
Thread-Index: AQHXvBpTdzh5pAnJe0WXpw7EVJ340avZ6TSAgAAIXgA=
Date: Tue, 19 Oct 2021 06:45:19 +0000
Message-ID: <4a1739ac3cdb895e41f7554865d5e1df4d70658c.camel@nvidia.com>
References: <20211008075805.589644-1-xuemingl@nvidia.com>
 <20211008075805.589644-2-xuemingl@nvidia.com>
 <20211019021457-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211019021457-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2308cd0c-6034-4073-5e0a-08d992cc049e
x-ms-traffictypediagnostic: DM8PR12MB5461:
x-microsoft-antispam-prvs: <DM8PR12MB54617804882634C9697CBB1DA1BD9@DM8PR12MB5461.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W8bWsirS50RX0HMTi4Eu/4HbnTEN3brPx1wOuwAUDSe2oRGm6Cg3cnC5FfqLYhXemBtjW1u1ul7bFcwh3YaPiei94V+GWj2mjTPuf4iImKl65IRNtv/wsnFpX7GhPh+ulqYLy3NeWa9y6GUs2shrzuk4jGl8ygQASM8V+U+tJRkVfelcGBllNNg0m1Q+IHxtNv7TXUHvDAYd06W4PFVu8mtsZyBYn1IM79XQQrGG5/r7E7Yd8YTbY13N+E5oG1LxtgfRfIefzom8H4iaBVBu4X8uM8vxaxOfgqejg1544cKI2u1HBpEXtImYcFLOTORUQr9H6YVPsCpU2q99TFvwaI1MYoy8KTEQweBWHFUtzXbK1HPgCUcNuzsmaKd1EwyFaqpr4VOn+/l/+lX6Zxdirs9wJOsr7R88JInJajgMjZehIEaUwbNvD8maQ4cirTioEUuS8jET47NC2xg9yABVU6GloBmLvP19s4q3JyW56OoQTcgCcbwiYsJdJQCiBwJcfzXBoqEg5R5uR2yYRQL7syf/BHahMKV4V4ItxUgsQS6qNF/SRXiRzq5Wic/qUlw6jFbVIxya3UDJY2/bLPd9zVPnirYgiXyM1geIUsGt6nt571Lw+iLzdkVmPNWonQwNoYl4OU6iz642O2Js5Jp/uNbPHJOigWnxL+tq8R/StYuDU8VR1N+epce7Qn+Cf3qw81fxq6Jhkyggwh2LJyadag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(6506007)(6512007)(38100700002)(508600001)(54906003)(4001150100001)(26005)(66446008)(91956017)(76116006)(64756008)(6486002)(71200400001)(8936002)(6916009)(66946007)(66476007)(66556008)(122000001)(2906002)(36756003)(186003)(86362001)(4326008)(83380400001)(5660300002)(2616005)(316002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzlwTjBkRk9MR0szRmF2aU44QVNPN2dRRUtzeWcvdWRPc0s4NEJmQ3hseDRy?=
 =?utf-8?B?WEZWWGN0MHFEY1Y2RUUvV09FS3h6TDI2MzduR0Vnb1M2cFVkZUVEU0g2bUtz?=
 =?utf-8?B?TWZHalR1cUkvd1ZadWMyRS9jSVBjSC9XR3BLclY4VWlFQ0dsRkc1VzRkN29S?=
 =?utf-8?B?ZVJjenhIcmNkUCtoaldTdGxTcUJFd3Y2bjFpMTBob1VrQUpwcmhTY3NHZU43?=
 =?utf-8?B?bjRsdGxqUEJ1OHFpMWtCem9jL2tIWnM0YlZ4VXpqTEl4Wk9uSGNrd215MVI0?=
 =?utf-8?B?eURaUktEcCt2ZmdZK3JUSUl5RUJ4NEpzQ2ozdzYrMm95TU5yd1NXblYvUE5h?=
 =?utf-8?B?SExTNlpINGVkQ0YyY0h5YkJoelczd01IK3RTeXpOY1FUSXFIMTlXbzJacDVH?=
 =?utf-8?B?bmZEVFd5SWVLNUFiR3hTT2Jrb0tMZ0pUVG5ESmNrSkl5OHZUaUV3Tm5WSjM2?=
 =?utf-8?B?QVBhT1RxVEdyRDlKQWJxQ1RROU13RVg3RC9GRm1HdFZydk9nUXlDa25GeWNS?=
 =?utf-8?B?d1pRN2Nra1JQdjBHZWQwb08xbVNxdUNTNkVpc2lSc01iV0d5VS9zbWg2cGc2?=
 =?utf-8?B?VGlMUjFmdW1TVFFhTUZJSlk0czVQNkdDdzFzOWwycnhTS0ppQ2tTcHVSQUlK?=
 =?utf-8?B?ZEFJOFJVM282Uzh6R21CSkVPRkkrUGlTY3hyQ0VzM2RETFBUcFZIWGhFTkZx?=
 =?utf-8?B?KytoYkNGU3loZG15eEJzL3R1MURiUUVVYzljc1dib3lUbjFXWjZmNWdQKzBY?=
 =?utf-8?B?aE9PSGIvMHdJN1FpQ0NXM3hWaTNlSEk5THMrOTU0M1l3blpTOWxsQXdiemJx?=
 =?utf-8?B?aVZVSmc3ZTFsYWNweFJCVEhMRFFia0JHemNQS1FNWXJTa2M0dW5XNExNK1RH?=
 =?utf-8?B?LytCNkc2cGx4SEJhOVBNQ1JYYW43WUhEYTBmTXBLZGl2cUdLRitQRmNJaXNl?=
 =?utf-8?B?dTEzdTdKZU9BRG9EZWVZbkFhMHJDNE1CNlRJMVc3MVhSM24ybVJQVGxqQVY4?=
 =?utf-8?B?T0E1WTNCS3ltMHk2MGpsQ2xzMGY0Y2xTZXVnWDVFZTY5cmFIS01CRTZBTTJN?=
 =?utf-8?B?bGpLQWdMRlc4MEh4bjlrUGFrRnVSY1hMVDNJU1Mwcnh5MW5Oek1OMUJmVUg5?=
 =?utf-8?B?aEI5UjU5UDdjRHNnNnRhU092bEMxTHc3SitrRzBYS2ZzRTVPRUwzclhBLzUz?=
 =?utf-8?B?eE5NdmpCS01vYmxCcTVESW9GY3NvcGcwV0o4UFptMkh1ZDBFb2tEYzh0ZGhM?=
 =?utf-8?B?ZzYyWDJxYWZ2Z3hOSWpDbGFaYlVhYVBSSm9ETUpQcWNQazE4T1hDK2JrRXIw?=
 =?utf-8?B?WlFiV2QzUmxHVXZCMWxsaHZkVmJyN3hzend3SjFSNFRLeXc1dWxXRG1BYmJn?=
 =?utf-8?B?cTFTOTFuMXJ1MDZxbms4eEJIVmpMUFNwOVY4OW9xUXRucVRIVWh1YjZqUDk0?=
 =?utf-8?B?TDhLVGgwWUMzK01ra3E0dXM4ZlhkbVBLNnFVamQzWVJpY0I2a0ZOeXVzUEph?=
 =?utf-8?B?YW5GalozUTRoMStUQnZ6WVFkK0c1OUR3T3pJRS9KMi9tdktyOXVFNHlsVnYv?=
 =?utf-8?B?N3gvQWdzU2s1V0kzTWQ5V0tKcUx5aXczTGZ6S2hNVWZkRFpQUlRLYWtoZ1Rn?=
 =?utf-8?B?dzE2YWNsRE95Y0NRY3BPRi9xQmVmcVNKZHpSZG5TOE5QV1hndXFjVkhDY3pl?=
 =?utf-8?B?RFR3KzZkSis1M01rcmQzOElJYS8xNmZOV1JtbDBrNU1xK0FENnBLaFR3VTli?=
 =?utf-8?B?TUlVRVNEcWx4RVh0QWxacWF2NlVwRE5Kb085dGJXRXAzclRFejNVZ3VDMmpQ?=
 =?utf-8?B?RTZPYnA0WlhMYmpHSGVkQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F99BD0B85D2194DA0D383F9156A7095@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2308cd0c-6034-4073-5e0a-08d992cc049e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 06:45:19.7061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7j5XOeFMFWVefkN4wk6ALmP0VhQzOMOoYMRDF8JmY+OhawMleYVRzOtBiaAtpIgRskXn+5gUeNuSMe+coLkiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5461
Received-SPF: softfail client-ip=40.107.96.57;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCAyMDIxLTEwLTE5IGF0IDAyOjE1IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIEZyaSwgT2N0IDA4LCAyMDIxIGF0IDAzOjU4OjA0UE0gKzA4MDAsIFh1ZW1pbmcg
TGkgd3JvdGU6DQo+ID4gV2hlbiB2aG9zdC11c2VyIGRldmljZSBjbGVhbnVwIGFuZCB1bm1tYXAg
bm90aWZpZXIgYWRkcmVzcywgVk0gY3B1DQo+ID4gdGhyZWFkIHRoYXQgd3JpdGluZyB0aGUgbm90
aWZpZXIgZmFpbGVkIHdpdGggYWNjZXNzaW5nIGludmFsaWQgYWRkcmVzcy4NCj4gPiANCj4gPiBU
byBhdm9pZCB0aGlzIGNvbmN1cnJlbnQgaXNzdWUsIHdhaXQgbWVtb3J5IGZsYXR2aWV3IHVwZGF0
ZSBieSBkcmFpbmluZw0KPiA+IHJjdSBjYWxsYmFja3MsIHRoZW4gdW5tYXAgbm90aWZpZXJzLg0K
PiA+IA0KPiA+IEZpeGVzOiA0NDg2NjUyMWJkNmUgKCJ2aG9zdC11c2VyOiBzdXBwb3J0IHJlZ2lz
dGVyaW5nIGV4dGVybmFsIGhvc3Qgbm90aWZpZXJzIikNCj4gPiBDYzogdGl3ZWkuYmllQGludGVs
LmNvbQ0KPiA+IENjOiBxZW11LXN0YWJsZUBub25nbnUub3JnDQo+ID4gQ2M6IFl1d2VpIFpoYW5n
IDx6aGFuZ3l1d2VpLjkxNDlAYnl0ZWRhbmNlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYdWVt
aW5nIExpIDx4dWVtaW5nbEBudmlkaWEuY29tPg0KPiA+IC0tLQ0KPiA+ICBody92aXJ0aW8vdmhv
c3QtdXNlci5jIHwgMjEgKysrKysrKysrKysrKystLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9ody92aXJ0aW8vdmhvc3QtdXNlci5jIGIvaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KPiA+IGlu
ZGV4IGJmNmU1MDIyM2MuLmIyZTk0OGJkYzcgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvdmlydGlvL3Zo
b3N0LXVzZXIuYw0KPiA+ICsrKyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiBAQCAtMTE2
NSw2ICsxMTY1LDEyIEBAIHN0YXRpYyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1v
dmUoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+ICANCj4gPiAgICAgIGlmIChuLT5hZGRyICYm
IG4tPnNldCkgew0KPiA+ICAgICAgICAgIHZpcnRpb19xdWV1ZV9zZXRfaG9zdF9ub3RpZmllcl9t
cih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgZmFsc2UpOw0KPiA+ICsgICAgICAgIGlmICghcWVt
dV9pbl92Y3B1X3RocmVhZCgpKSB7IC8qIEF2b2lkIHZDUFUgZGVhZCBsb2NrLiAqLw0KPiA+ICsg
ICAgICAgICAgICAvKiBXYWl0IGZvciBWTSB0aHJlYWRzIGFjY2Vzc2luZyBvbGQgZmxhdHZpZXcg
d2hpY2ggY29udGFpbnMgbm90aWZpZXIuICovDQo+ID4gKyAgICAgICAgICAgIGRyYWluX2NhbGxf
cmN1KCk7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgICAgIG11bm1hcChuLT5hZGRyLCBxZW11
X3JlYWxfaG9zdF9wYWdlX3NpemUpOw0KPiA+ICsgICAgICAgIG4tPmFkZHIgPSBOVUxMOw0KPiA+
ICAgICAgICAgIG4tPnNldCA9IGZhbHNlOw0KPiA+ICAgICAgfQ0KPiA+ICB9DQo+IA0KPiANCj4g
Li4vaHcvdmlydGlvL3Zob3N0LXVzZXIuYzogSW4gZnVuY3Rpb24g4oCYdmhvc3RfdXNlcl9ob3N0
X25vdGlmaWVyX3JlbW92ZeKAmToNCj4gLi4vaHcvdmlydGlvL3Zob3N0LXVzZXIuYzoxMTY4OjE0
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcWVtdV9pbl92Y3B1
X3RocmVhZOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4gIDEx
NjggfCAgICAgICAgIGlmICghcWVtdV9pbl92Y3B1X3RocmVhZCgpKSB7IC8qIEF2b2lkIHZDUFUg
ZGVhZCBsb2NrLiAqLw0KPiAgICAgICB8ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
DQo+IC4uL2h3L3ZpcnRpby92aG9zdC11c2VyLmM6MTE2ODoxNDogZXJyb3I6IG5lc3RlZCBleHRl
cm4gZGVjbGFyYXRpb24gb2Yg4oCYcWVtdV9pbl92Y3B1X3RocmVhZOKAmSBbLVdlcnJvcj1uZXN0
ZWQtZXh0ZXJuc10NCj4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMN
Cj4gbmluamE6IGJ1aWxkIHN0b3BwZWQ6IHN1YmNvbW1hbmQgZmFpbGVkLg0KPiBtYWtlWzFdOiAq
KiogW01ha2VmaWxlOjE2MjogcnVuLW5pbmphXSBFcnJvciAxDQo+IG1ha2VbMV06IExlYXZpbmcg
ZGlyZWN0b3J5ICcvc2NtL3FlbXUvYnVpbGQnDQo+IG1ha2U6ICoqKiBbR05VbWFrZWZpbGU6MTE6
IGFsbF0gRXJyb3IgMg0KPiANCj4gDQo+IEFsdGhvdWdoIHRoZSBmb2xsb3dpbmcgcGF0Y2ggZml4
ZXMgaXQsIGJpc2VjdCBpcyBicm9rZW4uDQoNClllcywgcmVhbGx5IGFuIGlzc3VlLCB2NCBwb3N0
ZWQsIHRoYW5rcyENCg0KPiANCj4gDQo+ID4gQEAgLTE1MDIsMTIgKzE1MDgsNyBAQCBzdGF0aWMg
aW50IHZob3N0X3VzZXJfc2xhdmVfaGFuZGxlX3ZyaW5nX2hvc3Rfbm90aWZpZXIoc3RydWN0IHZo
b3N0X2RldiAqZGV2LA0KPiA+ICANCj4gPiAgICAgIG4gPSAmdXNlci0+bm90aWZpZXJbcXVldWVf
aWR4XTsNCj4gPiAgDQo+ID4gLSAgICBpZiAobi0+YWRkcikgew0KPiA+IC0gICAgICAgIHZpcnRp
b19xdWV1ZV9zZXRfaG9zdF9ub3RpZmllcl9tcih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgZmFs
c2UpOw0KPiA+IC0gICAgICAgIG9iamVjdF91bnBhcmVudChPQkpFQ1QoJm4tPm1yKSk7DQo+ID4g
LSAgICAgICAgbXVubWFwKG4tPmFkZHIsIHBhZ2Vfc2l6ZSk7DQo+ID4gLSAgICAgICAgbi0+YWRk
ciA9IE5VTEw7DQo+ID4gLSAgICB9DQo+ID4gKyAgICB2aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJf
cmVtb3ZlKGRldiwgcXVldWVfaWR4KTsNCj4gPiAgDQo+ID4gICAgICBpZiAoYXJlYS0+dTY0ICYg
VkhPU1RfVVNFUl9WUklOR19OT0ZEX01BU0spIHsNCj4gPiAgICAgICAgICByZXR1cm4gMDsNCj4g
PiBAQCAtMjQ4NSwxMSArMjQ4NiwxNyBAQCB2b2lkIHZob3N0X3VzZXJfY2xlYW51cChWaG9zdFVz
ZXJTdGF0ZSAqdXNlcikNCj4gPiAgICAgIGZvciAoaSA9IDA7IGkgPCBWSVJUSU9fUVVFVUVfTUFY
OyBpKyspIHsNCj4gPiAgICAgICAgICBpZiAodXNlci0+bm90aWZpZXJbaV0uYWRkcikgew0KPiA+
ICAgICAgICAgICAgICBvYmplY3RfdW5wYXJlbnQoT0JKRUNUKCZ1c2VyLT5ub3RpZmllcltpXS5t
cikpOw0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgIH0NCj4gPiArICAgIG1lbW9yeV9yZWdpb25f
dHJhbnNhY3Rpb25fY29tbWl0KCk7DQo+ID4gKyAgICAvKiBXYWl0IGZvciBWTSB0aHJlYWRzIGFj
Y2Vzc2luZyBvbGQgZmxhdHZpZXcgd2hpY2ggY29udGFpbnMgbm90aWZpZXIuICovDQo+ID4gKyAg
ICBkcmFpbl9jYWxsX3JjdSgpOw0KPiA+ICsgICAgZm9yIChpID0gMDsgaSA8IFZJUlRJT19RVUVV
RV9NQVg7IGkrKykgew0KPiA+ICsgICAgICAgIGlmICh1c2VyLT5ub3RpZmllcltpXS5hZGRyKSB7
DQo+ID4gICAgICAgICAgICAgIG11bm1hcCh1c2VyLT5ub3RpZmllcltpXS5hZGRyLCBxZW11X3Jl
YWxfaG9zdF9wYWdlX3NpemUpOw0KPiA+ICAgICAgICAgICAgICB1c2VyLT5ub3RpZmllcltpXS5h
ZGRyID0gTlVMTDsNCj4gPiAgICAgICAgICB9DQo+ID4gICAgICB9DQo+ID4gLSAgICBtZW1vcnlf
cmVnaW9uX3RyYW5zYWN0aW9uX2NvbW1pdCgpOw0KPiA+ICAgICAgdXNlci0+Y2hyID0gTlVMTDsN
Cj4gPiAgfQ0KPiA+ICANCj4gPiAtLSANCj4gPiAyLjMzLjANCj4gDQoNCg==

