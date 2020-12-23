Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D52E183F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 06:08:18 +0100 (CET)
Received: from localhost ([::1]:56910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krwNl-0004TL-5r
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 00:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1krwMd-00040a-E5
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 00:07:07 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:40820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1krwMU-00088a-Mc
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 00:07:07 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BN53kOl014922; Tue, 22 Dec 2020 21:06:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=ulw9FJnRzc3rOBSehpw1C5Sm1AHvFLLEPf65aFK5BRI=;
 b=S2hkxicIj0uF9UHr4o5HIAaXqxSZE/o/9xhuFCOoXvedVknn0DjAGSNfvkwKkpvQW/Jd
 YbqC7yoUR+QcsHP4cI4jQ0Hxrdcfpn4xXXQd8rESr+tForymQXbi3OSgqqyzj26eP9Qb
 c0WO7JF50ahrHG6a+3eZBZDzVRdZOMD0GiaZ3M05sfMI6FZ7oTIkTXa4PPGKUU/icR92
 l5j+Ypx+RTrUWv9xTHQtdQ/zcwAcKfjDkSB2C2nJ5Oe8sP0ZwarDO62VmWzh3WmkuDf1
 Yr/5wm6K9MCT4Vea/BzeK5VYVW4z2PV4/crAfhtIW8kL31wH9FMYK8dXcl8U7G080NTK KQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by mx0a-002c1b01.pphosted.com with ESMTP id 35k0qjkbbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Dec 2020 21:06:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrNNQ+FKALdifft2+6zHf3DGI6g3sYxpbkZooV+B+IxRyMD865f9I+wEtmwUxFcV6srfF7ToeSHLZKrP1tL5DZvcJbAoQyRLCAARUEerxSKsdtstDSduuLoRDxz/Y/WXVUlqyYTGfeLmFAfAG2c9d5grtLigk67E3dJUtU09Adp/k2l/LKVyT2hDsU29VoKOLSmy3kHgCSqlNbClX50LKzFGtxri82EIkeVDlcMNHpULsrcG0vLCiHqaoHgpaPS2Wq+2JcMDEUiVYDKbCrG9nOOt8i3GgNjmq1c37ywxkmp4bzAi96dD8ic2isLocZTZ9Jc6t26pHW5s08uTD12bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulw9FJnRzc3rOBSehpw1C5Sm1AHvFLLEPf65aFK5BRI=;
 b=Uv510hi0voI8B6BjZ200dKf88x7kiEyzQhMx5uYEFSROHY8RseDSKIDaLoZRd6vpkbarZjadqg1OU7k6/QYTPABtmRQpATxl4JqGmUkqV1us4hKVRS9tzOSgKIMV/Setla7411gSZOS4tq2fudhknk62nbhmv+lML/Yg6tZVtiluJRJIMU94zwQ9+7e9O5DchpURBfbJhN6Z5pfpfdT6jPUs9MV8EB/kEvAAZGSahUgDIyRQgX5LRp+6MXruwdzvkPK2jlKa3J6XnibcTxKWSHaUGkB5Tm+D7VU/rHYX5zSyMoqbq5mf2OD+6XJl68ihWQgvoe5Mi9yJs2W4SIueFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MN2PR02MB6159.namprd02.prod.outlook.com (2603:10b6:208:184::12)
 by BL0PR02MB4403.namprd02.prod.outlook.com (2603:10b6:208:47::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Wed, 23 Dec
 2020 05:06:51 +0000
Received: from MN2PR02MB6159.namprd02.prod.outlook.com
 ([fe80::c921:e745:9890:d7c8]) by MN2PR02MB6159.namprd02.prod.outlook.com
 ([fe80::c921:e745:9890:d7c8%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 05:06:51 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Dylan Reid <dgreid@dylanreid.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] vhost-user: Check vhost features for CONFIGURE_MEM_SLOTS
Thread-Topic: [PATCH] vhost-user: Check vhost features for CONFIGURE_MEM_SLOTS
Thread-Index: AQHW2LwCXvx/gQKKS0i8CQRWnHZ6/KoDzY0A
Date: Wed, 23 Dec 2020 05:06:51 +0000
Message-ID: <55D3E635-B98B-467F-8A73-D15F20965983@nutanix.com>
References: <BYAPR08MB464854F9582554185F3B36AFC8DF0@BYAPR08MB4648.namprd08.prod.outlook.com>
In-Reply-To: <BYAPR08MB464854F9582554185F3B36AFC8DF0@BYAPR08MB4648.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.43.20110804
authentication-results: dylanreid.com; dkim=none (message not signed)
 header.d=none;dylanreid.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 305d965e-9440-4359-9a5b-08d8a7008f44
x-ms-traffictypediagnostic: BL0PR02MB4403:
x-microsoft-antispam-prvs: <BL0PR02MB440391400CE4289B22B9F690EADE0@BL0PR02MB4403.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fhyZOLEgdpeyYmIB356R8KjC/WK/TRZX+cPk00aBnr/uwF48uPJb7NXKxkIb3kuaxoZWAxbFJzd8XrT8ZW216QJTeMVQxm5a46qTTuEB8kqwcunOEJ6jGDbVXrJ9nMTytX803ageJcNQ4TVoJEmKZX1ZoiTdrpWM/qzI9wR33/JwM4WClp8+wiGrhYaEzBb7f/rdCD5cZp+U0kt0ZcLDl93Iqn3FqT1tZ+tKh4+KJ77QjyDUrzaXehaTsTc1Ug4NTZ5qyjEbODFZjN3Ww7GEYKTMwuZDsCOdwLXRa3IXqkeEShdyl2mZZnEZoOgwf2CPjfuj4WRV2bkZF7R0l41NfzE9iZShkyzTZYfvqJWrrQkmCcw/l/oQdYpJA9yJyowZ0zF13VyxN3OKt4OXYlBrBDX9UpEoZaguolAwlqCbMiaofIcVeEwpRIaqzIosr8iy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR02MB6159.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(346002)(136003)(396003)(6506007)(478600001)(64756008)(36756003)(4326008)(186003)(8676002)(26005)(71200400001)(2906002)(2616005)(6486002)(6512007)(83380400001)(8936002)(66946007)(76116006)(33656002)(316002)(66446008)(66476007)(86362001)(5660300002)(44832011)(91956017)(66556008)(110136005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z1BXMUZ1SFh6WTBRQnFaeDBwUFBwclEvRElDaUFmSjRSSUZBcnF2TFhNdFhP?=
 =?utf-8?B?WUhBc2lhN0U5NnF5UkNiVCtsaFl2TXUvYVJ5NW5adVZyMW5ET1JwakIyU0Js?=
 =?utf-8?B?Mi9Kcm9qUWpONldFb0laZGNtalpuOThzdllWRWh6ZlJ0Qi9VNHNMUklQb2di?=
 =?utf-8?B?RDZWUzVRTXJ4dXA0eFRZV2NYenNQV2hGZm9veWhST2FHc2JId0pTZXBYQkl5?=
 =?utf-8?B?SEMzZUFOVEJ4dm03SkltY0M0dytwNGV5anIvelhKUjNHQ05aNnAyRDlDTWJN?=
 =?utf-8?B?eXViV0tIQUFKRzJyMDFZMkVDK0NNK0xMeVZrdzV5NTNHSGp2VlV4dk50WGVy?=
 =?utf-8?B?YVJBekkyTzVQZWUvSkN2NHl4RGlxUnVkTGFjdjgvaUJJRkhVK3R1K2JDajhB?=
 =?utf-8?B?aHh2SFJXUjBkWW5XeGMrbnNnb3NRbGpOenpUMHBHYnRrMyt6K2diQjFsYzRF?=
 =?utf-8?B?UGZBRzE2VEJiNm5QU0JqNFFKZ3RKQ2xqQXJaOXJFTmJRaDJJa1hmdjZsYTJM?=
 =?utf-8?B?bENtL1hvdTVtaE9CUjg3VDJpY3EwMEZ3czQxcUNIb0cyNk9Ddmp1RUhJNU51?=
 =?utf-8?B?bUg0MFNCMWNVS0ZjZTRXSVhFVVBGSFVJbTVvanoxZk1HK0ZvcXJrbkxtZDM5?=
 =?utf-8?B?QW1qTHJtMFNtSWRSaFE1Qit5L090S084UmJ0SEFxSDNzTWIxV2ZDbVdUM1lY?=
 =?utf-8?B?OTVuTUVmdjVLUHprSE5zOFhUSi9sRFgwMG41N3huQnRKalFmcjZKcC9zS3pZ?=
 =?utf-8?B?RzRXNy9hUnRwTmZQOGd3T1kzcjZuQWQ5MEkzcDJLWGtzT24wOHZ1aElPUHlL?=
 =?utf-8?B?WE5DdzBNRWVFeEZQWEdVblBaeGltZlc3a3J2ZGZWdlpJdmRjYnFhZ01ud2tE?=
 =?utf-8?B?YjZBeHRGcWpZaEMxYzN5bWxCektIZTZ0d1FXMlBNMGhWNWR5Umd2NXRCS1I0?=
 =?utf-8?B?WEFiODZCWEtkamJSa1gvZEUwSVRYdlJ1ZnBKQStnbVY2eWVNckV2K3hPeWND?=
 =?utf-8?B?dmQwclhqcER5UUNFaVhPSW0zWk01K0hNOW9Kd3hqNC96R1FjR3hjSkNja0FP?=
 =?utf-8?B?U1ZyQk9wYnZtbER0TEhJNUs1cjF6NkNFRnovbWFZNDVpSUhzWGNaNjc2V1dz?=
 =?utf-8?B?VmtyTVVVclVLeXZXMFIvdEdiUVVOd3I5Y3BNWUlSREpscFBUWU83TlNXWHp1?=
 =?utf-8?B?RkQzcjRLRUNjcjk2UnNyUXN0RTlIbXY0M05IZXpiWDYrTmFOMSttWitSaWRy?=
 =?utf-8?B?Ym0wSGdOYU1MdEgxZllvTVQ3aTNybFAxc2NLM0E0d2ZPZjlmVEZHWFpENGFj?=
 =?utf-8?Q?qsJgRuB8JIpyzo3qFLlJ0Sx5i8waD1YaKF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <948549E21E465147ABBD573A5E3610A2@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305d965e-9440-4359-9a5b-08d8a7008f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 05:06:51.6672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMXnrlFxecIpKK133sMY8JlzA194bEYo4CbaISd3EcwBXiX/BOD3f3IuGkHM13PFu1ofutpyTyNFZBlW48FKHHRNkR4RNW1ucipYFWIHFV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4403
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-23_01:2020-12-21,
 2020-12-23 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSBkb24ndCB0aGluayB0aGlzIGlzIHJpZ2h0Lg0KDQpPbiBUdWUsIERlYyAyMiwgMjAyMCBhdCAw
Mzo0MToyNlBNIC0wODAwLCBEeWxhbiBSZWlkIHdyb3RlOg0KPiANCj4gVGhlIGBDT05GSUdVUkVf
TUVNX1NMT1RTYCBmZWF0dXJlIGlzIHNwZWNpZmllZCBieSB2aG9zdCwgbm90IGJ5IHZpcnRpby4N
Cj4gQ2hlY2sgdGhlIHZob3N0IGZsYWdzIGZvciBpdCBiZWluZyBzZXQuDQo+DQoNCkFncmVlZCAt
IFZIT1NUX1VTRVJfUFJPVENPTF9GX0NPTkZJR1VSRV9NRU1fU0xPVFMgaXMgbmVnb3RpYXRlZCBh
dCB0aGUgDQp2aG9zdC11c2VyLCBub3QgdmlydGlvIGxheWVyLiBUaGUgZGV2LT5wcm90b2NvbF9m
ZWF0dXJlcyBmbGFncyBhcmUgdGFrZW4NCmZyb20gdGhlIFZIT1NUX1VTRVJfR0VUX1BST1RPQ09M
X0ZFQVRVUkVTIG1lc3NhZ2UsIHdoaWNoIHJldHJpZXZlcyB0aGUgDQpzdXBwb3J0ZWQgdmhvc3Qt
dXNlciBmZWF0dXJlcyBmcm9tIHRoZSBiYWNrZW5kLiBTZWUgbGlidmhvc3QtdXNlciBmb3IgYQ0K
c2ltcGxlIHJlZmVyZW5jZSBpbXBsZW1lbnRhdGlvbi4NCg0KVGhlIFZIT1NUX1VTRVJfR0VUX0ZF
QVRVUkVTIG1lc3NhZ2UgcmV0cmlldmVzIHRoZSB2aXJ0aW8gcHJvdG9jb2wNCmZlYXR1cmVzLCBz
byBjaGVja2luZyBmZWF0dXJlcyBpbnN0ZWFkIG9mIGRldi0+cHJvdG9jb2xfZmVhdHVyZXMgd291
bGQNCmluY29ycmVjdGx5IGNoZWNrIHRoZSBzdXBwb3J0ZWQgdmlydGlvIGZlYXR1cmVzIGluc3Rl
YWQgb2YgdGhlIHZob3N0LXVzZXINCm9uZXMuDQoNCkFtIEkgbWlzc2luZyBzb21ldGhpbmcgaGVy
ZT8NCg0KPiBJIG5vdGljZWQgdGhpcyB3aGlsZSB0ZXN0aW5nIGEgbmV3IHZob3N0IGltcGxlbWVu
dGF0aW9uIHRoYXQgZG9lc24ndCB5ZXQNCj4gc3VwcG9ydCBjb25maWd1cmluZyBtZW1vcnkgc2xv
dHMgYW5kIHJldGVzdGVkIHdpdGggZHBkaydzIGJsb2NrIGV4YW1wbGUNCj4gYXMgd2VsbC4NCg0K
Q291bGQgeW91IGNsYXJpZnkgd2hhdCB5b3UgdGVzdGVkIHdpdGggRFBESz8gSSBoYXZlbid0IGhh
ZCBwcm9ibGVtcyANCnRlc3Rpbmcgb3RoZXIgYmFja2VuZHMgd2hpY2ggZG8gbm90IHN1cHBvcnQg
Y29uZmlndXJpbmcgbWVtb3J5IHNsb3RzLiANCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRHlsYW4g
UmVpZCA8ZGdyZWlkQGR5bGFucmVpZC5jb20+DQo+IC0tLQ0KPiAgaHcvdmlydGlvL3Zob3N0LXVz
ZXIuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92aG9zdC11c2VyLmMgYi9ody92aXJ0
aW8vdmhvc3QtdXNlci5jDQo+IGluZGV4IDJmZGQ1ZGFmNzQuLmZhYTBlMTMzZjIgMTAwNjQ0DQo+
IC0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gKysrIGIvaHcvdmlydGlvL3Zob3N0LXVz
ZXIuYw0KPiBAQCAtMTg2MCw3ICsxODYwLDcgQEAgc3RhdGljIGludCB2aG9zdF91c2VyX2JhY2tl
bmRfaW5pdChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsIHZvaWQgKm9wYXF1ZSkNCj4gICAgICAgICAg
fQ0KPiAgDQo+ICAgICAgICAgIC8qIGdldCBtYXggbWVtb3J5IHJlZ2lvbnMgaWYgYmFja2VuZCBz
dXBwb3J0cyBjb25maWd1cmFibGUgUkFNIHNsb3RzICovDQo+IC0gICAgICAgIGlmICghdmlydGlv
X2hhc19mZWF0dXJlKGRldi0+cHJvdG9jb2xfZmVhdHVyZXMsDQo+ICsgICAgICAgIGlmICghdmly
dGlvX2hhc19mZWF0dXJlKGZlYXR1cmVzLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBWSE9TVF9VU0VSX1BST1RPQ09MX0ZfQ09ORklHVVJFX01FTV9TTE9UUykpIHsNCj4gICAg
ICAgICAgICAgIHUtPnVzZXItPm1lbW9yeV9zbG90cyA9IFZIT1NUX01FTU9SWV9CQVNFTElORV9O
UkVHSU9OUzsNCj4gICAgICAgICAgfSBlbHNlIHsNCj4gLS0gDQo+IDIuMjUuMQ0KPiANCj4gDQp+
ICAgIA0KDQo=

