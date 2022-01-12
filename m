Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284FB48C77F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:46:59 +0100 (CET)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fpy-0001y9-8r
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:46:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1n7fBq-0005Tm-KH; Wed, 12 Jan 2022 10:05:32 -0500
Received: from mail-mw2nam12on2050.outbound.protection.outlook.com
 ([40.107.244.50]:24416 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1n7fBi-0006Yi-QG; Wed, 12 Jan 2022 10:05:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/Sx6EbFkJOTNcIBZn6VdLswNCHXVJC0BY7LtaXefLN1dr9zbfJ+UCiaxW1vue20WnxavHH+YQSnNhDNNp7dp5skBxTWMTmqLvKvluz71p6218aU+irKQU3bk6HCm5KiS8afMcFGKs0ccYo+qLhTUcbOLys8S89DV3g5j+mHnGLZ3NYMVFobNbWRXYO8wJhF1CiB1mz/1Y7kOegqxXXm5f/lX/Qfx/sOeaualaT+emdT43C+VtS+6AM+T1H+KtBn1swi30Y6GVJUEBKYNHRi6IzUcBn4XeOHsR6qrPaz6VwUxhlUJGwedlRHMRuDZs1axd6y2nqigoLgWSliTy0Xvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAJE8BbBbchm3Jtch+X6j2IgDTA+ic4UU+chy/boE9U=;
 b=mfd+FRlvaSiw7ZLIt7VEP4+WpFMDvYdG5plgh0hqq3zDlMv2NDORbbWtxDs441D1sHXcUcwlFU0VWvgDxXkYIWNBW3mA1AF3wbKvsqoB1TbLxZpoWC+yEz9KgD+DHPYcs9e3megicd9FczINXo77d7fmRMD0ugnffd/9N0BxylfBqz9MEEFTjo8zzy9tLIS65izBgTIspVtcSM5j/42c2I8oCLno6xqePqvyDCDWKJ1HjBjm5IYY0v6t+tEd5k2YuqTUq2iMBVeL6S1rfAC+UVvOmFllxOC/ivqim2pUfj1aYiNGdtH8TNBfNoQg4Y+EmWZh4vZwFy7Ryij68jJWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAJE8BbBbchm3Jtch+X6j2IgDTA+ic4UU+chy/boE9U=;
 b=dl0UDuhg4PEEsirhi7kQTN+D9wqGKi/NRnjjPif7kPNdhOkFda6Blm1gxg9rZBgbbxaQUaKbv8mBjoiPRAFo6VnLVSLzURjUxT7kMSKM4ozv4kYkD/HT2Hgy1E07gogdGKhjfiif/E/DMJg3HFKcM/ki2v5MFN2MXoqKFTCrD5BJZ2WHrJymHIlVqh3bIIuIqy/NI1geRuBE0Lm8RSOd4DeZY+E/LRJdWK8xphM2aUnf27MngF0LsPrMyp/vpXVOcTvJ7yC7ImbNwcS2RQBXYVuQNqjIz9MvDgqc2p0qEm9Iq1asAWk+5bLpSiZi4veRqH1zwTbVr3YDERqMwJQ/ww==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 15:05:16 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::9ca9:4188:fa32:54b2]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::9ca9:4188:fa32:54b2%4]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 15:05:16 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Thread-Topic: [PATCH v6 1/2] vhost-user: remove VirtQ notifier restore
Thread-Index: AQHXzvvqdEwO0IQ5t0iKSU5G4bcqHKvvKsUAgACXagCAAAtOAIACGFGAgABfmQCAbag2AA==
Date: Wed, 12 Jan 2022 15:05:15 +0000
Message-ID: <84ad13760fbd1857b91e49ee6af5a8b516c35b15.camel@nvidia.com>
References: <20211101083813.1224522-1-xuemingl@nvidia.com>
 <20211101083813.1224522-2-xuemingl@nvidia.com>
 <20211101170506-mutt-send-email-mst@kernel.org>
 <f433ca338852f0aaad9e23cb47ee39dd53061310.camel@nvidia.com>
 <20211102024742-mutt-send-email-mst@kernel.org>
 <87c14dc604e49b2ae85e9dcf1de4e813106fad6b.camel@nvidia.com>
 <20211103162840-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211103162840-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 006d93dd-55e7-479b-dbfb-08d9d5dcf10e
x-ms-traffictypediagnostic: BL1PR12MB5239:EE_
x-microsoft-antispam-prvs: <BL1PR12MB5239105308E3EA89DF7361B9A1529@BL1PR12MB5239.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hBX2vm851aXpCzZeN7B8yroCXEc7dA4JrTgAfgOD6H6kZnNVKL9EpZ4NgADFRfVrO62ojg3Buoab52HfLTMhfw636iHxscri5m+FtQAQ/eX3T/I7nM+VwrdO1vTuOz7oD4PpTjtWyGfwfnOknZ+U8hkqxhJ1UVVFVXrfuh7H1mnibICDqiak3IibKTUi/pF4rnSZvTauiLPtWWLD1h2wNqM4hIsrpg/2Xg+dlJ5N1Q0lFOMw8NI47tX1lg4+d7AVF8Xferz6fb4cK9RIPbIiDR/OE8EC3WSl+EE/UkXjdiwZHkAfW+BMTnlY71NdXL6j3Kg/ob9EEbZES/8ld4s3Y8R9+QTlsyB6f+g+CdC1qPOzdER0WzaakFLK4gEXTaJkfiLy0xdGwdJFqLzjn2Yxo0fM8YGn3TzZGiXWRcHvsqbVBR/it2WOyJPEYSoD3yN+e9oUJqGbblkYhX3b4YOk570IRzP+DfOSLpPIDR7Fpx2wa6HxtPI+jbOFBikPAn8ibJqtrvvA9YnBtV9Wfci5Tzt2RxQf/oB4uix5nP9N/wP3cmmK1cWqtpXaf5tEOu2Op3KjgyKackRzkKmcOFW6pSnXKFwRWiDBOL1EEfdB3k9uY73ZRO6i3T9gbcQN1cR9DvkHpJaSMFTIZcxk2Qo7s/H70f+ScjO74ZrSG5Ms6GYxcQA5Foz9bUzvtT06MDLgKKJdCTStAvuZtvo53R+5qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(36756003)(83380400001)(8936002)(8676002)(6486002)(6512007)(5660300002)(2906002)(4326008)(64756008)(66556008)(91956017)(66446008)(66476007)(76116006)(508600001)(6916009)(66946007)(6506007)(186003)(26005)(38070700005)(122000001)(38100700002)(2616005)(316002)(71200400001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2NZWU5ZUGVOZGphbEsrMVZwcXI4R1kreUJFZzlTZGlLYmgwYWhRYW5VaW1T?=
 =?utf-8?B?OUUxQzJHeEk2SlpIaFkvQytITGYvRkpyT05FYnh4MjYxQWdXUW52UytoVFJa?=
 =?utf-8?B?UEdwdldSZGlYdE9PQmVxbVF2TmFOSmg3bjNLSkhYYWhRVFpRYm1nWWJJQWdM?=
 =?utf-8?B?a2llYUljNFVuT1BmSGN6NWNKL0haUWhBS2hqdFMrd040ckl3aVRuUEk5RnRk?=
 =?utf-8?B?YW10dW1UZDU5ckZIMGxQejJBSThMMkpyZTlaaTdjb1l3REVscWJTOFRQOEJy?=
 =?utf-8?B?Y3kxQTE2WWxPVDVJY1J4VzNMcWFkaVMxNWJSVDFlRmpqcWV6VVVybGdOYkc1?=
 =?utf-8?B?dmtOTCtmQ2ttWnpoeS9oZlBVd0dLVFBBSXgxd0NHU3dSUWZkVHpGdnJtc3gx?=
 =?utf-8?B?S09PaEpRc1I2b2VkWTlrWURYTlhwTHRlK2thSXZ4VjJVam5wZFdOVGR5THEr?=
 =?utf-8?B?VitUY0I0YXFtVmp3cml4NjI4ODNCQkh6RngwMis4VjE0WitRS2JvZmJ3a00v?=
 =?utf-8?B?MGVPMnVtKzREOUlZK1o2Yi9HbU1qMGJtVjBQU3ZaYUNuRVptNTQ3YTBqbSsv?=
 =?utf-8?B?enp0ZnhoRDdEcVhyVDRHZlVlQWViWmQreVB3aGRnc0hSOXFHTmdWc1MwRVY0?=
 =?utf-8?B?STdYL3BWd2YyUjVFUk1jTkRDRnhsWmxvTHdMNzUrVXUzbXVscVUzbzdGcTNM?=
 =?utf-8?B?QVZ2R2lZcndsOG5GWEtaelQ5dDljUHAzbUN2UEdaMDY1UXR3NjJaeWZ2cWtt?=
 =?utf-8?B?U2VXYVJWTTMwQUhFbHFxWm44VVluNkdtS0dLK2dNcG9rVXdYVkM1bDBCZFB2?=
 =?utf-8?B?Q1pIOUdnam5nZG0zVWFYZHRxTnh6dWVVeWNoMTRvOEpaaXpJUEMzMGZkcy93?=
 =?utf-8?B?NHBNdS82VmFsUUdJTkVQUVVuSU5PVFNFTzUxQkpTWUhoQm5RWWM0QlBEZkRD?=
 =?utf-8?B?U0RiL1VlUFBKVk12SzFudHN0a2Y3R0E2WklNcmdubkNGZk45QzRGakswU2Nl?=
 =?utf-8?B?K0EvVVdHbnU5clZDNGFxZGNFMHJRUndUQTFGT05XVkQ4VW10SlpFMXB3N0RD?=
 =?utf-8?B?ZW4rMFZYUHhuQUhOTXIrbUtxU2NmQnRjanVjQzk3NGhUN2J4SmhWU2h1VzF2?=
 =?utf-8?B?NnV3dnRlUmplNFVxTWM2ZW9KVkU1NjI1ZjNESDBTRmhUMW5wZnl5c1BOT0Z4?=
 =?utf-8?B?UHpzWDVacktGc2FpdW84TEJKN1k3NTc3OUp6R0V3SE9qWDlPM2pYU2IvOTlV?=
 =?utf-8?B?Wlo4NjNUR2xGcmVmQ21sRHpjTUdFVkVpeUkvd1Zja2JrWkRZN1plZEh2ZlVP?=
 =?utf-8?B?OHpwckpKZnpMQ2VhMDFFZk9mb2t4WitmRjUyRFZLdHRZZVdCQ2JFVUx5YnNv?=
 =?utf-8?B?VU96a1IxNHVMdTJHcXlzcktTajdER1RaYlZOQU5WbFgzaHNUaDV4S2pqSzcw?=
 =?utf-8?B?VE1LV25kNjFuQVIrckUzY0NZdnR0MjNNRll3cUxGeDJWTzhkTEhGUWtDc0l6?=
 =?utf-8?B?Wk8wWjhHd1ZUUWpGSWZabXNySXBRMWdpSWVpRmQzbk5Vd3hZNmRJbDRCdjRi?=
 =?utf-8?B?Uit0SCtqaHltM0hmeW8yTjJ1Y3FHMkhldjNBMVdzMi9wVDBMUFVWS2kyVHlo?=
 =?utf-8?B?alc4aFlPVm9GaXMyR2lUZ1ZVdDNGcGgyMXhLcnhiSmErU0VXRmVwc1Z6Qjhs?=
 =?utf-8?B?VVQ1UTZzWVp5U2NWWVpyMWV4Zk1PVTR2eG4xUXdqUGx0blRTMElFNHExL3pI?=
 =?utf-8?B?WlJNaU15WFBHTy9KbENDZ1FrSUczT2RXbFY0ZTc5NFJXTnIvS1Q2QWtsYUdD?=
 =?utf-8?B?QVkvUGlXRjZtcm5rTTJiQlhCWC81L1VSMEVxamJuMUkwRkFxWlR1L24va3V3?=
 =?utf-8?B?QXpYcWxKL3RtcXZ6OU81ZHFxc0RaaWZCYlRGNHByM3ozVDRqV1U1RXJHL3VT?=
 =?utf-8?B?YXFKcS9DNFExMXUwUEVRQUwwemw1MCtIKy91Q0s1NFVEREdiWVc2TTlQQjRX?=
 =?utf-8?B?K0h0WGxUVy9WQ1laYkxYVmxvSlFVMy91bGlqQ3ZuWGNjemtrUXF3aW80UzRW?=
 =?utf-8?B?SzEyMkJteXVrbklQdEw3WmtIeVM0Y0k5dGJVYlRKNHFxaEF1U2FjSnNkeFkw?=
 =?utf-8?B?NkRzTDYzUUM1d0N6c1p3Tms2ckEwNXhLamFoNmhLK1hZcVRCNkhBQVJKVlRx?=
 =?utf-8?Q?FUMQSgOJXEFfITK0TVqsAHcKwRAY/U/nI5G/QziMIvrZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46810D105D341546BF047B48EC0C50AA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006d93dd-55e7-479b-dbfb-08d9d5dcf10e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 15:05:16.3127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQWzCbvx5XhQu6x8eWVmvQ+dTC06yT2IMRUdLTkMcR8U3yxWr48LEHN66+9a9we6vB163MD4+kw7KT8I4IPSAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
Received-SPF: softfail client-ip=40.107.244.50;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gV2VkLCAyMDIxLTExLTAzIGF0IDE2OjMwIC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIFdlZCwgTm92IDAzLCAyMDIxIGF0IDAyOjQ4OjQxUE0gKzAwMDAsIFh1ZW1pbmco
U3RldmVuKSBMaSB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjEtMTEtMDIgYXQgMDI6NDkgLTA0MDAs
IE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgTm92IDAyLCAyMDIxIGF0
IDA2OjA4OjM5QU0gKzAwMDAsIFh1ZW1pbmcoU3RldmVuKSBMaSB3cm90ZToNCj4gPiA+ID4gT24g
TW9uLCAyMDIxLTExLTAxIGF0IDE3OjA2IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
DQo+ID4gPiA+ID4gT24gTW9uLCBOb3YgMDEsIDIwMjEgYXQgMDQ6Mzg6MTJQTSArMDgwMCwgWHVl
bWluZyBMaSB3cm90ZToNCj4gPiA+ID4gPiA+IFdoZW4gdmhvc3QtdXNlciB2ZHBhIGNsaWVudCBz
dXNwZW5kLCBiYWNrZW5kIG1heSBjbG9zZSBhbGwgcmVzb3VyY2VzLA0KPiA+ID4gPiA+ID4gVlEg
bm90aWZpZXIgbW1hcCBhZGRyZXNzIGJlY29tZSBpbnZhbGlkLCByZXN0b3JlIE1SIHdoaWNoIGNv
bnRhaW5zDQo+ID4gPiA+ID4gPiB0aGUgaW52YWxpZCBhZGRyZXNzIGlzIHdyb25nLiB2ZHBhIGNs
aWVudCB3aWxsIHNldCBWUSBub3RpZmllciBhZnRlcg0KPiA+ID4gPiA+ID4gcmVjb25uZWN0Lg0K
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIHJlbW92ZXMgVlEgbm90aWZpZXIg
cmVzdG9yZSBhbmQgcmVsYXRlZCBmbGFncyB0byBhdm9pZCByZXVzaW5nDQo+ID4gPiA+ID4gPiBp
bnZhbGlkIGFkZHJlc3MuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEZpeGVzOiA0NDg2NjUy
MWJkNmUgKCJ2aG9zdC11c2VyOiBzdXBwb3J0IHJlZ2lzdGVyaW5nIGV4dGVybmFsIGhvc3Qgbm90
aWZpZXJzIikNCj4gPiA+ID4gPiA+IENjOiBxZW11LXN0YWJsZUBub25nbnUub3JnDQo+ID4gPiA+
ID4gPiBDYzogWXV3ZWkgWmhhbmcgPHpoYW5neXV3ZWkuOTE0OUBieXRlZGFuY2UuY29tPg0KPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWHVlbWluZyBMaSA8eHVlbWluZ2xAbnZpZGlhLmNvbT4N
Cj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gIGh3L3ZpcnRpby92aG9zdC11c2VyLmMgICAg
ICAgICB8IDE5ICstLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ID4gPiA+ICBpbmNsdWRlL2h3L3Zp
cnRpby92aG9zdC11c2VyLmggfCAgMSAtDQo+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMTkgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3QtdXNlci5jIGIvaHcvdmlydGlvL3Zob3N0LXVz
ZXIuYw0KPiA+ID4gPiA+ID4gaW5kZXggYmY2ZTUwMjIzYy4uYzY3MTcxOWU5YiAxMDA2NDQNCj4g
PiA+ID4gPiA+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiA+ID4gPiA+ICsrKyBi
L2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiA+ID4gPiA+IEBAIC0xMTQzLDE5ICsxMTQzLDYg
QEAgc3RhdGljIGludCB2aG9zdF91c2VyX3NldF92cmluZ19udW0oc3RydWN0IHZob3N0X2RldiAq
ZGV2LA0KPiA+ID4gPiA+ID4gICAgICByZXR1cm4gdmhvc3Rfc2V0X3ZyaW5nKGRldiwgVkhPU1Rf
VVNFUl9TRVRfVlJJTkdfTlVNLCByaW5nKTsNCj4gPiA+ID4gPiA+ICB9DQo+ID4gPiA+ID4gPiAg
DQo+ID4gPiA+ID4gPiAtc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3Jlc3Rv
cmUoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBxdWV1ZV9pZHgpDQo+ID4gPiA+ID4gPiAt
ew0KPiA+ID4gPiA+ID4gLSAgICBzdHJ1Y3Qgdmhvc3RfdXNlciAqdSA9IGRldi0+b3BhcXVlOw0K
PiA+ID4gPiA+ID4gLSAgICBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgKm4gPSAmdS0+dXNlci0+bm90
aWZpZXJbcXVldWVfaWR4XTsNCj4gPiA+ID4gPiA+IC0gICAgVmlydElPRGV2aWNlICp2ZGV2ID0g
ZGV2LT52ZGV2Ow0KPiA+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+ID4gLSAgICBpZiAobi0+YWRkciAm
JiAhbi0+c2V0KSB7DQo+ID4gPiA+ID4gPiAtICAgICAgICB2aXJ0aW9fcXVldWVfc2V0X2hvc3Rf
bm90aWZpZXJfbXIodmRldiwgcXVldWVfaWR4LCAmbi0+bXIsIHRydWUpOw0KPiA+ID4gPiA+ID4g
LSAgICAgICAgbi0+c2V0ID0gdHJ1ZTsNCj4gPiA+ID4gPiA+IC0gICAgfQ0KPiA+ID4gPiA+ID4g
LX0NCj4gPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiA+ICBzdGF0aWMgdm9pZCB2aG9zdF91c2VyX2hv
c3Rfbm90aWZpZXJfcmVtb3ZlKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4gPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBxdWV1ZV9pZHgp
DQo+ID4gPiA+ID4gPiAgew0KPiA+ID4gPiA+ID4gQEAgLTExNjMsMTcgKzExNTAsMTQgQEAgc3Rh
dGljIHZvaWQgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZShzdHJ1Y3Qgdmhvc3RfZGV2
ICpkZXYsDQo+ID4gPiA+ID4gPiAgICAgIFZob3N0VXNlckhvc3ROb3RpZmllciAqbiA9ICZ1LT51
c2VyLT5ub3RpZmllcltxdWV1ZV9pZHhdOw0KPiA+ID4gPiA+ID4gICAgICBWaXJ0SU9EZXZpY2Ug
KnZkZXYgPSBkZXYtPnZkZXY7DQo+ID4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gPiAtICAgIGlmIChu
LT5hZGRyICYmIG4tPnNldCkgew0KPiA+ID4gPiA+ID4gKyAgICBpZiAobi0+YWRkcikgew0KPiA+
ID4gPiA+ID4gICAgICAgICAgdmlydGlvX3F1ZXVlX3NldF9ob3N0X25vdGlmaWVyX21yKHZkZXYs
IHF1ZXVlX2lkeCwgJm4tPm1yLCBmYWxzZSk7DQo+ID4gPiA+ID4gPiAtICAgICAgICBuLT5zZXQg
PSBmYWxzZTsNCj4gPiA+ID4gPiA+ICAgICAgfQ0KPiA+ID4gPiA+ID4gIH0NCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNvIG9uIHZxIHN0b3Agd2Ugc3RpbGwgcmVtb3ZlIHRo
ZSBub3RpZmllci4uLg0KPiA+ID4gPiA+ICAgDQo+ID4gPiA+ID4gPiAgc3RhdGljIGludCB2aG9z
dF91c2VyX3NldF92cmluZ19iYXNlKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4gPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZob3N0X3ZyaW5n
X3N0YXRlICpyaW5nKQ0KPiA+ID4gPiA+ID4gIHsNCj4gPiA+ID4gPiA+IC0gICAgdmhvc3RfdXNl
cl9ob3N0X25vdGlmaWVyX3Jlc3RvcmUoZGV2LCByaW5nLT5pbmRleCk7DQo+ID4gPiA+ID4gPiAt
DQo+ID4gPiA+ID4gPiAgICAgIHJldHVybiB2aG9zdF9zZXRfdnJpbmcoZGV2LCBWSE9TVF9VU0VS
X1NFVF9WUklOR19CQVNFLCByaW5nKTsNCj4gPiA+ID4gPiA+ICB9DQo+ID4gPiA+ID4gPiAgDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gYnV0IG9uIHZxIHN0YXJ0IHdlIGRvIG5vdCByZWluc3RhdGUg
aXQ/IERvZXMgdGhpcyBub3QgbWVhbiB0aGF0DQo+ID4gPiA+ID4gbm90aWZpZXJzIHdvbid0IHdv
cmsgYWZ0ZXIgc3RvcCB0aGVuIHN0YXJ0Pw0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFll
cywgYmFja2VuZCBpbml0aWFsbHkgd29yayB3L28gaG9zdCBub3RpZmllciwgcmVxdWVzdCBWTSBk
cml2ZXIgdG8NCj4gPiA+ID4gaW5zdGFsbCBub3RpZmllciBpZiBuZWVkZWQgLSBjYWxsIHRoaXMg
ZnVuY3Rpb24gdGhyb3VnaCBzbGF2ZSBzb2NrZXQuDQo+ID4gPiANCj4gPiA+IEkgdGhpbmsgaXQn
cyBjbGVhbmVyIGlmIHFlbXUgaGFuZGxlcyB0aGlzIGl0c2VsZiBsaWtlIGl0IGRpZCBiZWZvcmUs
IGl0DQo+ID4gPiBrbm93cyB2bSBpcyBzdG9wcGVkIHdpdGhvdXQgZ2V0dGluZyBjYWxsZWQuDQo+
ID4gDQo+ID4gSWYgdmhvc3QgcGxheSBhcyBzZXJ2ZXIsIHRoZXJlIGFyZSAyIHNjZW5hcmlvIHRo
YXQgcmVtb3ZlIHRoZSBub3RpZmllcjoNCj4gPiAxLiBWTSBzdXNwZW5kOiBiYWNrZW5kIHN0aWxs
IHRoZXJlLCBpdCdzIG9rYXkgdG8ga2VlcCBtbWFwIGFkZHJlc3MuDQo+ID4gMi4gdmhvc3QgYmFj
a2VuZCBzdG9wcGVkIG9yIHByb2Nlc3Mga2lsbGVkOiByZXNvdXJjZXMgZnJvbSBiYWNrZW5kDQo+
ID4gc2hvdWxkIGJlIHJlbGVhc2VkLiBUaGF0J3Mgd2h5IHBhdGNoIDIvMiBtdW5tYXAgaW4gbm90
aWZpZXIgcmVtb3ZlDQo+ID4gZnVuY3Rpb24uIFRoZW4gdGhlIHJlc3RvcmUgZnVuY3Rpb24gZ2V0
IG5vdGhpbmcgdG8gcmVzdG9yZSwgbWF5YmUgSQ0KPiA+IHNob3VsZG4ndCByZXZlcnNlIHBhdGNo
IG9yZGVyLg0KPiANCj4gSSBjYW4ndCBzYXkgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gaGVy
ZS4gRG8geW91IHBsYW4gdG8gY2hhbmdlDQo+IHRoZSBwYXRjaHNldCBpbiBzb21lIHdheT8NCj4g
V2hlbiB5b3UgZG8sIHBscyBpbmNsdWRlIGEgY292ZXIgbGV0dGVyIHdpdGggYSBjaGFuZ2Vsb2cg
YW5kDQo+IENjIGFsbCBwZW9wbGUgeW91IGluY2x1ZGUgb24gcGF0Y2hlcyBvbiB0aGUgY292ZXIg
bGV0dGVyIHRvby4gDQoNCkhlcmUgaXMgdGhlIGRldGFpbCBvZiB0aGUgcHJvYmxlbSBJIGVuY291
bnRlcmVkLCBteSB2aG9zdCBiYWNrZW5kIGlzDQpEUERLIHZkcGEgdXNlciBzcGFjZSBhcHBsaWNh
dGlvbi4gTm90aWZpZXIgYWRkcmVzcyBpcyBzZXQgd2hlbiB2ZHBhIGFzaw0KcWVtdSB0byBtbWFw
IGEgRkQgYW5kIGFuIG9mZnNldCBmcm9tIHZkcGEsIHNlZSBmdW5jdGlvbg0Kdmhvc3RfdXNlcl9z
bGF2ZV9oYW5kbGVfdnJpbmdfaG9zdF9ub3RpZmllcigpLiBJZiB0aGUgdmRwYSBhcHBsaWNhdGlv
bg0KcmVzdGFydCBvZiBnZXQga2lsbGVkIGZvciBzb21lIHJlYXNvbiwNCnZob3N0X3VzZXJfaG9z
dF9ub3RpZmllcl9yZW1vdmUoKSBpcyBjYWxsZWQgYW5kIG5vdGlmaWVyIE1SIGlzDQp1bmluc3Rh
bGxlZCwgdGhlIG5vdGlmaWVyIGFkZHJlc3MgdGhhdCByZXRyaWV2ZWQgZnJvbSBtbWFwIGlzDQpy
ZWZlcmVuY2luZyB0byBhbiBpbnZhbGlkIEZELCBub3QgcmVsZWFzZWQuIFRoaXMgd2lsbCBjYXVz
ZSBIVw0KcmVzb3VyY2VzIG9uIGtlcm5lbCBzaWRlIHN0aWxsIHJlZmVyZW5jZWQsIG1vc3QgaW1w
b3J0YW50LCB3aGVuIHZkcGENCmNvbm5lY3Rpb24gcmVzdG9yZWQsIHRoaXMgaW52YWxpZCBub3Rp
ZmllciB3aWxsIGJlIGJlIHJlc3RvcmVkIGFzDQpub3RpZmllciBNUi4NCg0KVG8gcmVzb2x2ZSBp
dCwgaGF2ZSB0byByZW1vdmUgdGhlIG5vdGlmZXIgcmVzdG9yZSBtZWNoYW5pc20sIHZEUEENCmFw
cGxpY2F0aW9uIHdpbGwgaXNzdWUgY2xpZW50IHNvY2tldCByZXF1ZXN0IGFnYWluIHRvIGluc3Rh
bGwgbm90aWZpZXINCnRvIFZNLCBzbyBubyBjb25jZXJuIHRoYXQgdGhlIG5vdGlmaWVyIHdpbGwg
YmUgbG9zdCBhZnRlciByZXN1bWUuDQoNClNpbmNlIHZkcGEgbWlnaHQgYmUga2lsbGVkLCBubyBj
aGFuY2UgdG8gbm90aWZ5IHFlbXUgdG8gcmVtb3ZlDQpub3RpZmllci4gQW4gYWx0ZXJuYXRpdmUg
c29sdXRpb24gaXMgdG8gZGV0ZWN0IHNvY2sgZGlzY29ubmVjdGlvbiBhbmQNCnVubW1hcCBub3Rp
ZmllciwgYnV0IGl0IGxvb2tzIG1vcmUgY29tcGxleCB0byBtZS4gSG93IGRvIHlvdSB0aGluaz8N
Cg0KDQo+IA0KPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBAQCAt
MTUzOCw3ICsxNTIyLDYgQEAgc3RhdGljIGludCB2aG9zdF91c2VyX3NsYXZlX2hhbmRsZV92cmlu
Z19ob3N0X25vdGlmaWVyKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4gPiA+ID4gPiA+ICAgICAg
fQ0KPiA+ID4gPiA+ID4gIA0KPiA+ID4gPiA+ID4gICAgICBuLT5hZGRyID0gYWRkcjsNCj4gPiA+
ID4gPiA+IC0gICAgbi0+c2V0ID0gdHJ1ZTsNCj4gPiA+ID4gPiA+ICANCj4gPiA+ID4gPiA+ICAg
ICAgcmV0dXJuIDA7DQo+ID4gPiA+ID4gPiAgfQ0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXIuaCBiL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVz
ZXIuaA0KPiA+ID4gPiA+ID4gaW5kZXggYTlhYmNhMzI4OC4uZjYwMTJiMjA3OCAxMDA2NDQNCj4g
PiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXIuaA0KPiA+ID4gPiA+
ID4gKysrIGIvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci5oDQo+ID4gPiA+ID4gPiBAQCAt
MTQsNyArMTQsNiBAQA0KPiA+ID4gPiA+ID4gIHR5cGVkZWYgc3RydWN0IFZob3N0VXNlckhvc3RO
b3RpZmllciB7DQo+ID4gPiA+ID4gPiAgICAgIE1lbW9yeVJlZ2lvbiBtcjsNCj4gPiA+ID4gPiA+
ICAgICAgdm9pZCAqYWRkcjsNCj4gPiA+ID4gPiA+IC0gICAgYm9vbCBzZXQ7DQo+ID4gPiA+ID4g
PiAgfSBWaG9zdFVzZXJIb3N0Tm90aWZpZXI7DQo+ID4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gPiAg
dHlwZWRlZiBzdHJ1Y3QgVmhvc3RVc2VyU3RhdGUgew0KPiA+ID4gPiA+ID4gLS0gDQo+ID4gPiA+
ID4gPiAyLjMzLjANCj4gPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiANCj4gPiANCj4gDQoNCg==

