Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401214330B7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:07:40 +0200 (CEST)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck9r-0002Yh-Ad
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mck30-0000ZF-4f; Tue, 19 Oct 2021 04:00:37 -0400
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com
 ([40.107.93.51]:4512 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mck2q-00082l-VQ; Tue, 19 Oct 2021 04:00:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpJzA9oX/Uocr7Ohy/Yrz6ASuXXylFkj0AKzFuwHgMyGLmCRpmf0cu2PWGH7QIqF5fOd9MjRXJWTYbbspCu7AHCMVbEOx17s6AQn3+jvX9n1ZCXqUNSv60Rq6qc797STysGIIrQvn4TLvVab7aaPtlFD+Tsv4FAU1FypsIvIHrP+LBNppMUiYy1xBq+212yD5rC9E58F0YWGn6panZaq8WLktaaqgB5jZE0tB2+sHyL24UT+We4bAhyrYI4D/r6Bq6sb0lgakyoBQGEzl7s5KcgEmA1Y1/TLYqR8FS32uhCzbf9rY1IKOvKyWuO4w1xbyooldfUkfkjI4tNDAaq2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13VVxK3yMzTM+z9GQdq3mzRmczT3kkeVetKUvK4hEPc=;
 b=eIQrq4VdV117BkqxS3jkk/Q/zlwpvetyy4D5ekYawtHAqZPUzlNIyAd7WF/aywkZBNP9vU40FOj5VtVQVvzvvV/PXx/hC9hUw5eo3tkWppSPg7ydq7+uwNKSCDg5JnWqZCA00TB4McnueCdRoWHvJSWnF13iNY7ud1bTDbLxqPoKw0/HdyyCN5Kbp+tTNhyjADhB3V3HP0d29Gz2gyMuT4Q9yGSGPnl3gCbZzR81zZugXvr9o6W9K/h1tddr//kF7YWGPZZHNoLZqKqHT2vhmUjDSYlNUhQmiL/ys7eSV2PtBXiHPqOXqZwbNygA5oBHo9qy1UQ5OVYo8gF6IS8LLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13VVxK3yMzTM+z9GQdq3mzRmczT3kkeVetKUvK4hEPc=;
 b=j8P6Gy3Uz3PpQFrR8Z3rBDrIpkX6mDYMex3HCGHnxYJySOvUIwge8/SriApK/MPfNRKjvtppHbzRuNRNzFcAusRyzFaiiQtwaviEkM017SYQOL+ed7QI+jk9xjNCsjdQWIy9dBQAy+s2eiiO7LRp9RV2jsjOnuxPGaSAFfl+XskwEo5vnvk9S0f93AM4HgguBQwgn+mBMyaEvZHblxM5jrX980jK/r9zflhCZXAKgYaZnMOIINtIcovwW4Z0J3r6lZnEgZBs/sRhnsi4zPOu6EOnA/Yrfz1XpvukznEcpdj/OB0jArA0EQ+S9LoYpN8t0p9Dp+Ue6MZuQ2eRnnpxAQ==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM8PR12MB5448.namprd12.prod.outlook.com (2603:10b6:8:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 08:00:21 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 08:00:21 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "tiwei.bie@intel.com"
 <tiwei.bie@intel.com>, "zhangyuwei.9149@bytedance.com"
 <zhangyuwei.9149@bytedance.com>, "raphael.norwitz@nutanix.com"
 <raphael.norwitz@nutanix.com>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH v3 2/2] vhost-user: remove VirtQ notifier restore
Thread-Topic: [PATCH v3 2/2] vhost-user: remove VirtQ notifier restore
Thread-Index: AQHXvBpUsD17GzANq0yCE2CwBSg326vZ720AgAAMOoCAAAD5AIAACekA
Date: Tue, 19 Oct 2021 08:00:21 +0000
Message-ID: <3fc6702e4c11fe885f7923fc558578e920ead90b.camel@nvidia.com>
References: <20211008075805.589644-1-xuemingl@nvidia.com>
 <20211008075805.589644-3-xuemingl@nvidia.com>
 <20211019022100-mutt-send-email-mst@kernel.org>
 <1e58a3d2b8cfd9b802e5e9422598a9217f306ee9.camel@nvidia.com>
 <20211019032437-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211019032437-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f682d06-bb5c-484f-045e-08d992d67fbf
x-ms-traffictypediagnostic: DM8PR12MB5448:
x-microsoft-antispam-prvs: <DM8PR12MB544873DC21220EAC788ED25BA1BD9@DM8PR12MB5448.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YSZvF9kQvYhT/i0C8ybMJzKR4pdLGr3eaayUO07OdXK8fLJdK0DZjNP4wa3lwS+I20mMcXGCinCYfspkii/HnpVu2hWkpHnd1MI21aLo72T8vnAbFJrcnxDZHDqKkqjqN7jbgRphtLPpDs9uOk4m2aBwwntrpxsbj1tcqtq0Vij4Nr0Qt0/intirV43By4VPWP0OIBPXzGiZCyfghJEYSY+N/loU7/e8OWWXHB/IedSJ0UwRD6h2+MhE+MX2ksgnghnDrWsb80hqOfQIJdxdp2BvexGqZwFau8Gd3PX8PQCOAth7yBgk3KcKC327MkHgu4DUO0gi+lP7n6HXeH0WlNWOKh95YG1W9gZV8litAFRrux0e0xN1iMMlSY9DtozXdDPJcxk0/4ecDKTXNaqmGN9ef0GVosAFGNjWt/ub5aAAx42TlKIWm5G5qf6SJhQaMW4LFyBHSYKq+COJbTqb6ZUPiRMGM1/WlrojVX8fcl30mwzY8DfsqnH67CvKdwU01bCQNw4qoObv4ZLLY1zVSDB7tpfNqPFP00SUd8Zqv3W+XxHDZXzfZjVM1v+WF6gcM7k+m5ytOeGBHJ/EXelaKedMhUDyuKHWcpeW3eysA1upI1WZfWJd8+cp4TCM630gccq2f+8J6SpTMeNBeSHzS2u9I67Q5jWczSH1wRIAAoMJIgyurhskltl/5K5W6hBteU/jiTXtDGk4a4gW9zF9Kw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(54906003)(71200400001)(2616005)(38100700002)(4001150100001)(76116006)(508600001)(38070700005)(91956017)(6916009)(8936002)(6486002)(66476007)(186003)(66446008)(26005)(4326008)(83380400001)(8676002)(122000001)(316002)(2906002)(36756003)(86362001)(5660300002)(6512007)(66946007)(66556008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TU9oeTRhdysrMzQrcG54blpyWm1JdVJ4ZXU3d2hyamduTU9za1Z3bW9rRW9D?=
 =?utf-8?B?YUJnMVg1SjcveFY4Um5jTnV6clk4NVE3VXA5WW9lQTdnUm04NklnV0FDQU5E?=
 =?utf-8?B?L3FBZ0lJK3VhMEFjS1I2bnZ5aEVuZmZJSHhHWEtrUFMvcjZSaEQzelNmeUt5?=
 =?utf-8?B?M08xWkxJK1E5UVIvYWxtaGFDWVdCOE1JcVNXaEowWWcweFc3UVZnVWRsNTVT?=
 =?utf-8?B?bEVIckZvbGhlS3hGWHFrTVBGa1dxRk9ybDl3MXh2MVk4a1BLVzJPSFNDdkNZ?=
 =?utf-8?B?VWRlb2FJaGtJSE16dUdHbjJUd2NpdzVQUUFwUVJ1WWljY0VhMk5yeGtYczhm?=
 =?utf-8?B?ZTl1VUltM0JtN013RVAyc2QvVTJYUmJLcERVSjEzTUNSeGpwd3JMNi8zeVNK?=
 =?utf-8?B?cWFzb0JjemM4c1V5NmtWUDd5Tm9sb0VuTEtGL3dDblcxVVd3YTdiY3p6ajdz?=
 =?utf-8?B?ejUrWWt1S1hVT0pSM2xaeGtjOEhLUEcycVlvWmc3NDA4UEVDOHVOYkJraHE1?=
 =?utf-8?B?K2FhSUZnN1FWclhoWE1oSTFvTGtPTXlZT0pTbnFHOStHUlNocklDekRLNUFl?=
 =?utf-8?B?MDRsZFJFU3NEa3dqUEpWLzhlVFZRZmhtaXllMFdJTUw3bjFwd3ZTdEIra2tM?=
 =?utf-8?B?dUJGcjVEa0Jid2RXZVpnblJIY3QxUGVlSE5aUDZKOXVzMzkxbW1vUkR4dGFC?=
 =?utf-8?B?TWFOc3Zta2VZdHE3dGNSbTFTNndlU0NoQjRQZ1FHNmdjQWJjaDRKU3FlSnRx?=
 =?utf-8?B?OFJVMUJrblhuaUVYclJYTm9RWDZhY0o5ZE9Cc01GYnNZQXh1ZENJejdEcVc5?=
 =?utf-8?B?SVM2K2N5OGNVQ3owd0wrYU1WV1F6bFlycDRJeFI0SFFYNURsQjQ3dHM3T2dq?=
 =?utf-8?B?bUZxaUxVQWRRVjBNMGNpQ3BxV25FSFNwdUVJdzBselhoVVpPTWZPSjRPazk0?=
 =?utf-8?B?U0g0NUIzSWk4T01iNVVIcmJpU2NXNUQ3K2d6cW04UUJVOHNZNzN0VmVNKzgr?=
 =?utf-8?B?T2xqeEhVUTFuekEzYWU2Z2VjdExZNXM1ZUFSOGp0ZXFYTzlLTUo3cjlKZHBN?=
 =?utf-8?B?MCtpdGJTSVRnd0NZd3U2UVBQaVUrM3FmM1ZsTU83ZDZ6ejl5bStkMTRsQmRD?=
 =?utf-8?B?ZWh5bDlrWlNSaHVKZWFZY2RvcTdMdWlWbmRZM24xVTB4MTdkeFo5Um8wNXU3?=
 =?utf-8?B?UHVqZXRJbU5LQjhtWmpTcEtNRithcmRlbXRuT0IxdXkwcW1taUFoMTNYVU94?=
 =?utf-8?B?NWRzUjkwa2FSWU5Md0NmUW8yMTd2bmVHOU5URFk0ekh3a082UUcxTnVFeGJv?=
 =?utf-8?B?K08xU0pvaGY2MDlsamR0ai9SZ3g3NGdpSU9CZUI4YjEwdnMzcDNwa0toNXp4?=
 =?utf-8?B?S3pETDR6QXRHSG11aVc0eHlLOFFjMjAwZ1BsS0k0czJaa3ZHa2phUEpHYjNx?=
 =?utf-8?B?aU5tM0N2b0d1c2FOaDI3SXBqcGU0TW5wdU5BQjhvam5lNmNzSWxST241a0dR?=
 =?utf-8?B?MDlsRzJvSUlURDYxQVRNMkpwMmorWGxFWHUrSE92N3NHRy9IaURCR083SmNY?=
 =?utf-8?B?eS84RkFhd0tEdjNKSUhzQWdmbTl6aWc2NmJ2U0lYS3RWVUFSanhsVVBHL2RF?=
 =?utf-8?B?ZThrNG5iK1FXNG5SY1pzL1FMK1NRV2ZJQ3dnU1VwRUdHZVJJVlR2dW1heWdU?=
 =?utf-8?B?Um12SUI0dXpFWFVNM0ZjdytZRnk3SGI1TXJ5UC9iMkRvSTBEcm9SS0FsYlV6?=
 =?utf-8?B?RzlNK3NaL0JyVXgxWUtZbmVvTVN4bW1mQXc3bjZ0UlE4UFpZeEErUXlUTGdZ?=
 =?utf-8?B?NlBPQ0VXTDB4RmgwckZzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D3AB1B4BDE70945992B35C187BF682F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f682d06-bb5c-484f-045e-08d992d67fbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 08:00:21.2621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mU3QdInjD/gPf4DGm1mJ6mID3psYir8H7i9NQzisGjPKGkmI6sIbNHpChjWJNiPIdk9iKVW+bwA4H4rC1SZDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5448
Received-SPF: softfail client-ip=40.107.93.51;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

T24gVHVlLCAyMDIxLTEwLTE5IGF0IDAzOjI0IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIFR1ZSwgT2N0IDE5LCAyMDIxIGF0IDA3OjIxOjI0QU0gKzAwMDAsIFh1ZW1pbmco
U3RldmVuKSBMaSB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjEtMTAtMTkgYXQgMDI6MzcgLTA0MDAs
IE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiA+IE9uIEZyaSwgT2N0IDA4LCAyMDIxIGF0
IDAzOjU4OjA1UE0gKzA4MDAsIFh1ZW1pbmcgTGkgd3JvdGU6DQo+ID4gPiA+IFdoZW4gdmhvc3Qt
dXNlciB2ZHBhIGNsaWVudCByZXN0YXJ0LCBWUSBub3RpZmllciByZXNvdXJjZXMgYmVjb21lDQo+
ID4gPiA+IGludmFsaWQsIG5vIG5lZWQgdG8ga2VlcCBtbWFwLCB2ZHBhIGNsaWVudCB3aWxsIHNl
dCBWUSBub3RpZmllciBhZnRlcg0KPiA+ID4gPiByZWNvbm5lY3QuDQo+ID4gPiA+IA0KPiA+ID4g
PiBSZW1vdmVzIFZRIG5vdGlmaWVyIHJlc3RvcmUgYW5kIHJlbGF0ZWQgZmxhZ3MuDQo+ID4gPiA+
IA0KPiA+ID4gPiBGaXhlczogNDQ4NjY1MjFiZDZlICgidmhvc3QtdXNlcjogc3VwcG9ydCByZWdp
c3RlcmluZyBleHRlcm5hbCBob3N0IG5vdGlmaWVycyIpDQo+ID4gPiA+IENjOiB0aXdlaS5iaWVA
aW50ZWwuY29tDQo+ID4gPiA+IENjOiBxZW11LXN0YWJsZUBub25nbnUub3JnDQo+ID4gPiA+IENj
OiBZdXdlaSBaaGFuZyA8emhhbmd5dXdlaS45MTQ5QGJ5dGVkYW5jZS5jb20+DQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFh1ZW1pbmcgTGkgPHh1ZW1pbmdsQG52aWRpYS5jb20+DQo+ID4gPiANCj4g
PiA+IFBscyBmaXggdXAgYmlzZWN0IGFuZCByZXBvc3QuDQo+ID4gPiBBbHNvLCBjYW4geW91IHBs
ZWFzZSBjbGFyaWZ5IHdoYXQgZG9lcyAibm8gbmVlZCIgbWVhbj8NCj4gPiANCj4gPiBtbWFwIGJl
Y29tZXMgaW52YWxpZCwgbmVlZCB0byB1bm1hcCBpdC4NCj4gDQo+IA0KPiBjb25mdXNlZCBldmVu
IG1vcmUuIHBscyBpbmNsdWRlIGV4cGxhbmF0aW9uIGluIGNvbW1pdCBsb2cuDQoNCk15IGJhZCwg
dXBkYXRlZCBpbiB2NSwgcGxlYXNlIGNoZWNrLg0KDQo+IA0KPiA+ID4gWW91IGluY2x1ZGUgYSBG
aXhlcyB0YWcgYnV0IGlzIHRoZXJlIGEgYnVnPyBXaGF0IGJlaGF2aW91cg0KPiA+ID4gYXJlIHlv
dSB0cnlpbmcgdG8gZml4PyBBIHJlc291cmNlIGxlYWs/DQo+ID4gPiBPciBhcmUgeW91IGp1c3Qg
c2ltcGxpZnlpbmcgY29kZT8NCj4gPiA+IElmIHRoZSBsYXRlciB0aGVuIG5vIG5lZWQgZm9yIGEg
Rml4ZXMgdGFnLg0KPiA+IA0KPiA+IFllcywganVzdCBzaW1wbGlmeWluZyBjb2RlLCB3aWxsIHJl
bW92ZSBpdC4NCg0KU29ycnksIGl0J3MgYSBmaXggYWZ0ZXIgYW5vdGhlciBjaGVjay4gV2lsbCBh
ZGQgaXQgYmFjay4NCg0KPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gDQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiAgaHcvdmlydGlvL3Zob3N0LXVzZXIuYyAgICAgICAgIHwgMjAgKyst
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ID4gIGluY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXIu
aCB8ICAxIC0NCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhv
c3QtdXNlci5jIGIvaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KPiA+ID4gPiBpbmRleCBiMmU5NDhi
ZGM3Li5kMTI3YWE0NzhhIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9ody92aXJ0aW8vdmhvc3QtdXNl
ci5jDQo+ID4gPiA+ICsrKyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiA+ID4gQEAgLTIy
LDYgKzIyLDcgQEANCj4gPiA+ID4gICNpbmNsdWRlICJxZW11L21haW4tbG9vcC5oIg0KPiA+ID4g
PiAgI2luY2x1ZGUgInFlbXUvc29ja2V0cy5oIg0KPiA+ID4gPiAgI2luY2x1ZGUgInN5c2VtdS9j
cnlwdG9kZXYuaCINCj4gPiA+ID4gKyNpbmNsdWRlICJzeXNlbXUvY3B1cy5oIg0KPiA+ID4gPiAg
I2luY2x1ZGUgIm1pZ3JhdGlvbi9taWdyYXRpb24uaCINCj4gPiA+ID4gICNpbmNsdWRlICJtaWdy
YXRpb24vcG9zdGNvcHktcmFtLmgiDQo+ID4gPiA+ICAjaW5jbHVkZSAidHJhY2UuaCINCj4gPiA+
ID4gQEAgLTExNDMsMTkgKzExNDQsNiBAQCBzdGF0aWMgaW50IHZob3N0X3VzZXJfc2V0X3ZyaW5n
X251bShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gPiA+ICAgICAgcmV0dXJuIHZob3N0X3Nl
dF92cmluZyhkZXYsIFZIT1NUX1VTRVJfU0VUX1ZSSU5HX05VTSwgcmluZyk7DQo+ID4gPiA+ICB9
DQo+ID4gPiA+ICANCj4gPiA+ID4gLXN0YXRpYyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmll
cl9yZXN0b3JlKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBxdWV1ZV9pZHgpDQo+ID4gPiA+IC17
DQo+ID4gPiA+IC0gICAgc3RydWN0IHZob3N0X3VzZXIgKnUgPSBkZXYtPm9wYXF1ZTsNCj4gPiA+
ID4gLSAgICBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgKm4gPSAmdS0+dXNlci0+bm90aWZpZXJbcXVl
dWVfaWR4XTsNCj4gPiA+ID4gLSAgICBWaXJ0SU9EZXZpY2UgKnZkZXYgPSBkZXYtPnZkZXY7DQo+
ID4gPiA+IC0NCj4gPiA+ID4gLSAgICBpZiAobi0+YWRkciAmJiAhbi0+c2V0KSB7DQo+ID4gPiA+
IC0gICAgICAgIHZpcnRpb19xdWV1ZV9zZXRfaG9zdF9ub3RpZmllcl9tcih2ZGV2LCBxdWV1ZV9p
ZHgsICZuLT5tciwgdHJ1ZSk7DQo+ID4gPiA+IC0gICAgICAgIG4tPnNldCA9IHRydWU7DQo+ID4g
PiA+IC0gICAgfQ0KPiA+ID4gPiAtfQ0KPiA+ID4gPiAtDQo+ID4gPiA+ICBzdGF0aWMgdm9pZCB2
aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJfcmVtb3ZlKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHF1
ZXVlX2lkeCkNCj4gPiA+ID4gIHsNCj4gPiA+ID4gQEAgLTExNjMsNyArMTE1MSw3IEBAIHN0YXRp
YyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUoc3RydWN0IHZob3N0X2RldiAq
ZGV2LA0KPiA+ID4gPiAgICAgIFZob3N0VXNlckhvc3ROb3RpZmllciAqbiA9ICZ1LT51c2VyLT5u
b3RpZmllcltxdWV1ZV9pZHhdOw0KPiA+ID4gPiAgICAgIFZpcnRJT0RldmljZSAqdmRldiA9IGRl
di0+dmRldjsNCj4gPiA+ID4gIA0KPiA+ID4gPiAtICAgIGlmIChuLT5hZGRyICYmIG4tPnNldCkg
ew0KPiA+ID4gPiArICAgIGlmIChuLT5hZGRyKSB7DQo+ID4gPiA+ICAgICAgICAgIHZpcnRpb19x
dWV1ZV9zZXRfaG9zdF9ub3RpZmllcl9tcih2ZGV2LCBxdWV1ZV9pZHgsICZuLT5tciwgZmFsc2Up
Ow0KPiA+ID4gPiAgICAgICAgICBpZiAoIXFlbXVfaW5fdmNwdV90aHJlYWQoKSkgeyAvKiBBdm9p
ZCB2Q1BVIGRlYWQgbG9jay4gKi8NCj4gPiA+ID4gICAgICAgICAgICAgIC8qIFdhaXQgZm9yIFZN
IHRocmVhZHMgYWNjZXNzaW5nIG9sZCBmbGF0dmlldyB3aGljaCBjb250YWlucyBub3RpZmllci4g
Ki8NCj4gPiA+ID4gQEAgLTExNzEsMTUgKzExNTksMTIgQEAgc3RhdGljIHZvaWQgdmhvc3RfdXNl
cl9ob3N0X25vdGlmaWVyX3JlbW92ZShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gPiA+ICAg
ICAgICAgIH0NCj4gPiA+ID4gICAgICAgICAgbXVubWFwKG4tPmFkZHIsIHFlbXVfcmVhbF9ob3N0
X3BhZ2Vfc2l6ZSk7DQo+ID4gPiA+ICAgICAgICAgIG4tPmFkZHIgPSBOVUxMOw0KPiA+ID4gPiAt
ICAgICAgICBuLT5zZXQgPSBmYWxzZTsNCj4gPiA+ID4gICAgICB9DQo+ID4gPiA+ICB9DQo+ID4g
PiA+ICANCj4gPiA+ID4gIHN0YXRpYyBpbnQgdmhvc3RfdXNlcl9zZXRfdnJpbmdfYmFzZShzdHJ1
Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHZob3N0X3ZyaW5nX3N0YXRlICpyaW5nKQ0KPiA+ID4gPiAgew0KPiA+
ID4gPiAtICAgIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZXN0b3JlKGRldiwgcmluZy0+aW5k
ZXgpOw0KPiA+ID4gPiAtDQo+ID4gPiA+ICAgICAgcmV0dXJuIHZob3N0X3NldF92cmluZyhkZXYs
IFZIT1NUX1VTRVJfU0VUX1ZSSU5HX0JBU0UsIHJpbmcpOw0KPiA+ID4gPiAgfQ0KPiA+ID4gPiAg
DQo+ID4gPiA+IEBAIC0xNTM5LDcgKzE1MjQsNiBAQCBzdGF0aWMgaW50IHZob3N0X3VzZXJfc2xh
dmVfaGFuZGxlX3ZyaW5nX2hvc3Rfbm90aWZpZXIoc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+
ID4gPiAgICAgIH0NCj4gPiA+ID4gIA0KPiA+ID4gPiAgICAgIG4tPmFkZHIgPSBhZGRyOw0KPiA+
ID4gPiAtICAgIG4tPnNldCA9IHRydWU7DQo+ID4gPiA+ICANCj4gPiA+ID4gICAgICByZXR1cm4g
MDsNCj4gPiA+ID4gIH0NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvdmlydGlvL3Zo
b3N0LXVzZXIuaCBiL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVzZXIuaA0KPiA+ID4gPiBpbmRl
eCBhOWFiY2EzMjg4Li5mNjAxMmIyMDc4IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2h3
L3ZpcnRpby92aG9zdC11c2VyLmgNCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9ody92aXJ0aW8vdmhv
c3QtdXNlci5oDQo+ID4gPiA+IEBAIC0xNCw3ICsxNCw2IEBADQo+ID4gPiA+ICB0eXBlZGVmIHN0
cnVjdCBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgew0KPiA+ID4gPiAgICAgIE1lbW9yeVJlZ2lvbiBt
cjsNCj4gPiA+ID4gICAgICB2b2lkICphZGRyOw0KPiA+ID4gPiAtICAgIGJvb2wgc2V0Ow0KPiA+
ID4gPiAgfSBWaG9zdFVzZXJIb3N0Tm90aWZpZXI7DQo+ID4gPiA+ICANCj4gPiA+ID4gIHR5cGVk
ZWYgc3RydWN0IFZob3N0VXNlclN0YXRlIHsNCj4gPiA+ID4gLS0gDQo+ID4gPiA+IDIuMzMuMA0K
PiA+ID4gDQo+ID4gDQo+IA0KDQo=

