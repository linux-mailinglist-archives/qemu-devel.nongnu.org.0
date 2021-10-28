Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9759043E194
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 15:04:28 +0200 (CEST)
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg551-0001Ay-8t
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 09:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mg537-0008AR-Hg; Thu, 28 Oct 2021 09:02:30 -0400
Received: from mail-bn8nam11on2060a.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::60a]:28950
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mg532-0003Yu-PW; Thu, 28 Oct 2021 09:02:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx3oUYJ1FNDX3iZu88IQ2gIODBiynRmuWL7iYkpJqgtn6vY+OoIMQVMe8uVmcFYYTw2hkLkVUvJxjCaCVbKLrH2zCYv9f6Hu7WF1QcWaTf+PJIlSTXPE0lSixxDQAvwi3hdGZB4JeVq777o6gd2RD9gPHK8AA3qVdCuhD8czj30/K/0n1PIJgGxrHf6JrJ1+GEeBTvJJORs6CRhj1UkLY5zHweD/3ZDFjBz6iwAO1vTG3LqvXQfk5c/RtoZfDP9hvznuDyxFk9anGEU1kaxHSN2RNSIE4jG9ttDR0O3s6jFVSzclWOa2TVs2hzCSexNqqoewAilDH7U721ze36cV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmdN70TEGZxF5+Dt41sPNiynzojyu7byw0py8moqzgU=;
 b=fwttArCo3DcNEIXHeQbiM4C79CKXcCx08vGjzcsw7FPbmHevnrIgoVNrHYoRed6i+SA2v5Xo31iArpps+IYdLdx8u+u75UejXrvI5wchm/ujGzdVvJ+ekNKTnQpzHqv6Yu7R8okbeVC1xgqYk1qyiWDt1I7xOZVBWu/tBpL9nVL4+8G/ZkA2AVWGXjSMddAsC4OAEj1EsR4nXmWp+TWRLDeOYtkomgV5YtntOHYfTrnNjcT5LQBqAej2VRQMtrXoDyk/MKiHp2QB4K9YrzweST+mCRd7FqjGXcWujDej13SBijzwTt0rY8zt/k2zo4Tqg1ksD+N9eqgROQfskjDHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmdN70TEGZxF5+Dt41sPNiynzojyu7byw0py8moqzgU=;
 b=GRrrdW6vpwt9gBVrWbPFAL9bZozQc13M7mqsKhI/BX3W+ug5lhqn2T74nS+2Hd4Q5nhNP3UQHvQzOVUs85WYul3+/daCpQxSKd11zdDwEGzhFqvn6DWTgIB+YBYfEeQcUzKXZXvnLUkn0SlQngAUgivo+rGVemLdsy6B3jH3XF7UqqwFkIT+kBBkVfzhHekf6yrGwke9xR11qkGYfpwm00mvUHBYBVcqAAJR155XtIcWFL4AsLCX2YjVx1Rj4ExuHbY8tlJicPH9xZiJu7fHv6GrpciNdBiOqwAckCiLNsUzT3PhgAw3qfMiwpLt18fNpJcvtOb59kOUPkAVCN5FDg==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM4PR12MB5392.namprd12.prod.outlook.com (2603:10b6:5:39a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 12:57:20 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 12:57:20 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>
Subject: Re: [PATCH v5 1/2] vhost-user: fix VirtQ notifier cleanup
Thread-Topic: [PATCH v5 1/2] vhost-user: fix VirtQ notifier cleanup
Thread-Index: AQHXxNeF+k2hp9Whf0i/eqODy74aRKvobP+A
Date: Thu, 28 Oct 2021 12:57:20 +0000
Message-ID: <e8e7b760d3dfa4a26c24882c01e867ff0889750a.camel@nvidia.com>
References: <20211019064825-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211019064825-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6fe1682-b0bf-4318-7364-08d99a127ab4
x-ms-traffictypediagnostic: DM4PR12MB5392:
x-microsoft-antispam-prvs: <DM4PR12MB539202B81D7E8E07833CFB37A1869@DM4PR12MB5392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dG349VL2p+E9ADYuLFPF6g8m4ffZecGc/NEcumMnxK9x6jqH/Z4QS8++pZDxc5GD3n28XvXVbylpWJxeNkAotKVO1mN0sR9ZB99d7gbOCHMxTifm7yBYiM6hfSnJBLmDO9Tbu2r0wfkEVz/9yUCD+CNcRlXSD9aGK060ovd2Kkb3SQGC1QONLR/t2lE5A8ElnS6SJnv3NOsUjcEF9NQqzi38ko3Mj6rm7T+nBy/bNR6XxXYp4UCW81x/tw1WqpHXpxq3FbifAHfVTtZOwbitRK99ypoHDhDnxU3owjKQv3pi++12zJ4yGoQxoM4fWp324QL9JmA+ygExZnyBPjF/CxxIF7QPh5nHokVKHDbzuRpoSH4sH+cr83906+d5iCfnGTNOV5Po/yDjL2QIAvy8ypOlU6qGoyJMyF4NEQTkVCOqkkYioYE7DvLn0FFiUuJAGwA8RQRnz7fsLflVgxnPCqyCFEUcya1Sk2IMjt4CTDTmjGIDtqWeF0ndwOCiIas09ykdWc+sChSM3Rwifg992dfj/jIvf+8/T/Ty+FgpVnBBIQ/EjQBwySK+xAZqz4dO8YPcb/Ya7Bi1hsPSiqhToTpNlsyoNvfcndWGGI52Jal/rbXxXRCJ9/NsNbyuDlB829vHj4/LOg9dNot1vnC/P9A24SgNtCefGagH3jbr8SfCaSbpEWQMcTQT6aI4QcRVHb8TGOEyEuYX62i1pQxGkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(8936002)(83380400001)(6506007)(6512007)(71200400001)(6486002)(5660300002)(8676002)(6916009)(54906003)(86362001)(4326008)(36756003)(316002)(66476007)(66556008)(64756008)(91956017)(38070700005)(2906002)(508600001)(66946007)(122000001)(4001150100001)(66446008)(26005)(186003)(76116006)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDZQeC9uTHQ1NE5pWW5oM3VMYWpMZDE1WnlRdmRaYnREMzArbWtrNFIrMFJ1?=
 =?utf-8?B?NzdOMFdpK0tvU25oeFF2dlRSWVdpTW1UcVdlOGZjaXZKU0JOUTdsVklNVWU5?=
 =?utf-8?B?ZmIvNnJJT2tEUXFjV1dyMEVtSGc0c28rU0E0ejdUMlVPWGZCMTVZeHNSQ0NK?=
 =?utf-8?B?UDV1M2xHVHNOSE5RT25QbWZzcUZGZlhROWE2NFJNMGk1WHRBcUxPY045L0Ez?=
 =?utf-8?B?eWFwUS9GZEFUNGV5MWlpRUxic0FlSkxsK3h5dFlnbG9jcFRDY1JoMk81Sloy?=
 =?utf-8?B?QjdTYjdDZHdSekJvWFl5V3EwbnRNM0tadnF6ZzF0WEE5NC9RbFhFMWRtNU90?=
 =?utf-8?B?QzFQc0hVcmEzK3FWdXlQa2JFeHBlL3lZNzRXNC84KytzdUU3aTRlRERpOGZ1?=
 =?utf-8?B?VUZjalB2eWRvbEl5S2ZvcVFHcUttT25MSDMvQ01sMUMzT1VhcDd6WW5WcThC?=
 =?utf-8?B?anQ2R2xDbjdUbzEzSytiTVI0N0NCYjg1VmF4WEFEMGQ1Zk5aUDNWdElVUVpG?=
 =?utf-8?B?d25jSzlMWXl2VkgyZ0pYa2NHbzZsaTFGWG1id0w1Y1ZpRWxmK0RYSEZpTHd0?=
 =?utf-8?B?KzdrcFUxSHUzVkRFQ3FqczIvUmJpemhWb0pRcmx1MXFJRWVXdnozNXFMZ2F6?=
 =?utf-8?B?QUJ5ckhYTGN1ZHpzeWFLQnV5dkhIRW5GSlhLVnhUY2ZUYTdvZ2xIYVpzZFpD?=
 =?utf-8?B?L3dyQ201ZEQ0enBpZlJHeHdYMUpzeEdYRnJFVnpZSDRuNHp2WE9haUszK0tr?=
 =?utf-8?B?WG1oeGhSV0FVNnd4QjhaOWdzVDJycDdpVnUvSHV1d2t0RE9sMmF6eGZsZ0Qr?=
 =?utf-8?B?dW9qYVZOZzBwY3NLdmVocHRBTUx4RkFpTHY3L25CRlZRT0IwOHIzMWtQRkl3?=
 =?utf-8?B?N2J5Sm5nbk9NZjU5VFcwNnI4SjJrY1YrYmhPb3piMFpjWkplYzFFQ1pRVlhL?=
 =?utf-8?B?cXdoemRMMzQ1ZFIyVDRiQTNvcmI0OUQzVnVGWXhVbUM0amZzb0pmbW85VEIw?=
 =?utf-8?B?S3RDbk56M0NEeHNGTnB0dHM3RUdSLy9zUGhCNXN0Y2Z5UGZWNHphYndwd2I1?=
 =?utf-8?B?c29qalEwZ2ZZQmVqUklHOEtwMzhPK3B0bXE5NUVrdVlZblBOWWFlQUV0blMz?=
 =?utf-8?B?VGdScVJNUWtJNDBWM0xGczNZLytWL2ppTGp5M0hPM2gzbForMGNQbGwvY1ZE?=
 =?utf-8?B?ZzlNRVF6VWdDTXdKV1lDQURRWG42OExEdlI3RnZLbGtjeGJjbnlpcHhCUTBJ?=
 =?utf-8?B?S0NKMmpVOVdFSS84U3poUWdrYUFlbysxTXJ5am1sZ08zWnFudUxoQmlHUE9r?=
 =?utf-8?B?YTdJRGhJakM4YWJmS2hEeFg5WVlwbkpkNzZmYlg5T2h1OFRudXRuVm9tSEIz?=
 =?utf-8?B?cnFsZ2VxTHlFOGpkeGYydmRkaEdheW1NQUkrdGNLWmgwT2ZIV1BPUzdSUlpW?=
 =?utf-8?B?akJpWCtXcEI5bHNyN1hNbmpvS0hWOHg1cG5OQUFyakpBTExydndWbHJmbFVH?=
 =?utf-8?B?SjVjZGVEa1phSFdqREdGTkVsT3J0SXdCMmEzeGFNMEF3RjJkdXJzUEZPN25F?=
 =?utf-8?B?b1VHRWdNVWM5MlA0c000NENiZ3ROU0RzZXNCTG9Tb25QUlcwVmhIMWpMVDVY?=
 =?utf-8?B?WFJIaUlseExhbUFCU0VkQ0Z6UHNFRmdvNDRpSStBSzlJVHcrNVFDeTZrT01t?=
 =?utf-8?B?MDZYRGYyYUE4VkpackZJZEM3Lzc0MGpKcWM0RXVsVnRvWlVLYXRNSW41c1N2?=
 =?utf-8?B?OGt6bTNiMHJyRkdaZHdnUE52aVF5TnEyQ2ZGWTNCa1VhTzkxWkQ1eVhoWE5L?=
 =?utf-8?B?SkRUb3h6cVgySU43SFpRanhzOUtPSEE2VXBLUUp0ODVETWVjczBmZlNONUtq?=
 =?utf-8?B?MHV0VDR0aWF3eFRWWnNTQWlISSt5a25mZCtpazRYUzVqUGd1eTJCdzQvb3d6?=
 =?utf-8?B?TmJ0TG92dDVWYUFBUE43VVhtVDZqTVJnNmJoamRPd0Z1ekR5SER0SkNRT1Jy?=
 =?utf-8?B?NC9WS0NYZm5mdTBwT25jQkgrWHhVbXNVUUt2N0FPRldVOTkwRWxXdWw5TDVG?=
 =?utf-8?B?K0JlQ0RRb05NUVprc29JSW5MWkdvUUNGS2dKWTRHdmJNTTFUTS9HZ3k0YUM2?=
 =?utf-8?B?dGc0dTFQN0xQaFJXMnU0QXdjNGVvbW5SYlliemVlUnprRGtCKzc3L1RTYVQx?=
 =?utf-8?Q?2DRaUCS/malLHpUnZ0JkCZyJG7R1rgbZ0N0p6jPZNv0q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E9AFE474D610E4D830FFC4F0F8B32D3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fe1682-b0bf-4318-7364-08d99a127ab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 12:57:20.7544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U4egL3r0/ViSh5xeHRvtePIZW7MyhpB4HZqL1qe1/wtKRFA9vtHvl2PPa11qEb/NU1VXb+6uh6YtadXyEWU4kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5392
Received-SPF: softfail client-ip=2a01:111:f400:7eae::60a;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

T24gVHVlLCAyMDIxLTEwLTE5IGF0IDA2OjUyIC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIFR1ZSwgT2N0IDE5LCAyMDIxIGF0IDAzOjU3OjQyUE0gKzA4MDAsIFh1ZW1pbmcg
TGkgd3JvdGU6DQo+ID4gV2hlbiB2aG9zdC11c2VyIGRldmljZSBjbGVhbnVwIGFuZCB1bm1tYXAg
bm90aWZpZXIgYWRkcmVzcywgVk0gY3B1DQo+IA0KPiB5b3UgbWVhbiBjbGVhbnVwIGlzIGV4ZWN1
dGVkIGFuZCB1bi1tbWFwcyAuLi4NCj4gDQo+ID4gdGhyZWFkIHRoYXQgd3JpdGluZyB0aGUgbm90
aWZpZXIgZmFpbGVkDQo+IA0KPiB0aGF0IHdyaXRpbmcgLT4gd3JpdGluZw0KPiBmYWlsZWQgLT4g
ZmFpbHMNCj4gDQo+ID4gd2l0aCBhY2Nlc3NpbmcgaW52YWxpZCBhZGRyZXNzLg0KPiANCj4gLi4u
IGVycm9yDQo+IA0KPiA+IA0KPiA+IFRvIGF2b2lkIHRoaXMgY29uY3VycmVudCBpc3N1ZSwgd2Fp
dCBtZW1vcnkgZmxhdHZpZXcgdXBkYXRlIGJ5IGRyYWluaW5nDQo+IA0KPiB3YWl0IC0+IHdhaXQg
Zm9yIGEgDQo+IA0KPiA+IHJjdSBjYWxsYmFja3MsIHRoZW4gdW5tYXAgbm90aWZpZXJzLg0KPiA+
IA0KPiA+IEZpeGVzOiA0NDg2NjUyMWJkNmUgKCJ2aG9zdC11c2VyOiBzdXBwb3J0IHJlZ2lzdGVy
aW5nIGV4dGVybmFsIGhvc3Qgbm90aWZpZXJzIikNCj4gPiBDYzogcWVtdS1zdGFibGVAbm9uZ251
Lm9yZw0KPiA+IENjOiBZdXdlaSBaaGFuZyA8emhhbmd5dXdlaS45MTQ5QGJ5dGVkYW5jZS5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogWHVlbWluZyBMaSA8eHVlbWluZ2xAbnZpZGlhLmNvbT4NCj4g
DQo+IA0KPiBJZiBJIGFwcGx5IHRoaXMsIHFvcy10ZXN0IGhhbmdzLg0KDQpIaSBNaWNoYWVsLA0K
DQpUaGFua3MgZm9yIGFsbCB0aGUgY29tbWVudHMsIHRoaXMgb25lIGlzIGNyaXRpY2FsLiBUaGUg
YmxvY2tpbmcgUkNVDQpkcmFpbmluZyBpbnNpZGUgYSBSQ1UgcmVhZGVyIGxvY2sgY2F1c2VkIHRo
ZSBoYW5nLiBJJ20gcGxhbmluZyB0byB1c2UNCmFzeW5jIGNhbGwgUkNVIHRvIGRvIHRoZSBtdW5t
YXAsIHRoYW5rcyBhZ2FpbiBmb3IgdGhlIGFsYXJtLg0KDQo+IA0KPiANCj4gDQo+IA0KPiA+IC0t
LQ0KPiA+ICBody92aXJ0aW8vdmhvc3QtdXNlci5jIHwgMjIgKysrKysrKysrKysrKysrLS0tLS0t
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zob3N0LXVzZXIuYyBiL2h3L3ZpcnRp
by92aG9zdC11c2VyLmMNCj4gPiBpbmRleCBiZjZlNTAyMjNjLi5jZmNhMWI5YWRjIDEwMDY0NA0K
PiA+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiArKysgYi9ody92aXJ0aW8vdmhv
c3QtdXNlci5jDQo+ID4gQEAgLTE4LDYgKzE4LDcgQEANCj4gPiAgI2luY2x1ZGUgImNoYXJkZXYv
Y2hhci1mZS5oIg0KPiA+ICAjaW5jbHVkZSAiaW8vY2hhbm5lbC1zb2NrZXQuaCINCj4gPiAgI2lu
Y2x1ZGUgInN5c2VtdS9rdm0uaCINCj4gPiArI2luY2x1ZGUgInN5c2VtdS9jcHVzLmgiDQo+ID4g
ICNpbmNsdWRlICJxZW11L2Vycm9yLXJlcG9ydC5oIg0KPiA+ICAjaW5jbHVkZSAicWVtdS9tYWlu
LWxvb3AuaCINCj4gPiAgI2luY2x1ZGUgInFlbXUvc29ja2V0cy5oIg0KPiA+IEBAIC0xMTY1LDYg
KzExNjYsMTIgQEAgc3RhdGljIHZvaWQgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZShz
dHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+ID4gIA0KPiA+ICAgICAgaWYgKG4tPmFkZHIgJiYgbi0+
c2V0KSB7DQo+ID4gICAgICAgICAgdmlydGlvX3F1ZXVlX3NldF9ob3N0X25vdGlmaWVyX21yKHZk
ZXYsIHF1ZXVlX2lkeCwgJm4tPm1yLCBmYWxzZSk7DQo+ID4gKyAgICAgICAgaWYgKCFxZW11X2lu
X3ZjcHVfdGhyZWFkKCkpIHsgLyogQXZvaWQgdkNQVSBkZWFkIGxvY2suICovDQo+IA0KPiBvayB0
aGlzIGF2b2lkcyBkZWFkbG9jaywgYnV0IHRoZSBjb21tZW50IGRvZXMgbm90IGV4cGxhaW46DQo+
IHdoeSBkb2VzIG5vdCB2Y3B1IHRocmVhZA0KPiBuZWVkIHRvIHdhaXQgZm9yIG90aGVyIFZDUFUg
dGhyZWFkcz8gd2hhdCBpZiBvbmUgb2YgdGhlc2UNCj4gaXMgaW4gdGhlIG1pZGRsZSBvZiBub3Rp
Znk/DQo+IA0KPiANCj4gPiArICAgICAgICAgICAgLyogV2FpdCBmb3IgVk0gdGhyZWFkcyBhY2Nl
c3Npbmcgb2xkIGZsYXR2aWV3IHdoaWNoIGNvbnRhaW5zIG5vdGlmaWVyLiAqLw0KPiA+ICsgICAg
ICAgICAgICBkcmFpbl9jYWxsX3JjdSgpOw0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICBt
dW5tYXAobi0+YWRkciwgcWVtdV9yZWFsX2hvc3RfcGFnZV9zaXplKTsNCj4gPiArICAgICAgICBu
LT5hZGRyID0gTlVMTDsNCj4gPiAgICAgICAgICBuLT5zZXQgPSBmYWxzZTsNCj4gPiAgICAgIH0N
Cj4gPiAgfQ0KPiA+IEBAIC0xNTAyLDEyICsxNTA5LDcgQEAgc3RhdGljIGludCB2aG9zdF91c2Vy
X3NsYXZlX2hhbmRsZV92cmluZ19ob3N0X25vdGlmaWVyKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwN
Cj4gPiAgDQo+ID4gICAgICBuID0gJnVzZXItPm5vdGlmaWVyW3F1ZXVlX2lkeF07DQo+ID4gIA0K
PiA+IC0gICAgaWYgKG4tPmFkZHIpIHsNCj4gPiAtICAgICAgICB2aXJ0aW9fcXVldWVfc2V0X2hv
c3Rfbm90aWZpZXJfbXIodmRldiwgcXVldWVfaWR4LCAmbi0+bXIsIGZhbHNlKTsNCj4gPiAtICAg
ICAgICBvYmplY3RfdW5wYXJlbnQoT0JKRUNUKCZuLT5tcikpOw0KPiA+IC0gICAgICAgIG11bm1h
cChuLT5hZGRyLCBwYWdlX3NpemUpOw0KPiA+IC0gICAgICAgIG4tPmFkZHIgPSBOVUxMOw0KPiA+
IC0gICAgfQ0KPiA+ICsgICAgdmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZShkZXYsIHF1
ZXVlX2lkeCk7DQo+ID4gIA0KPiA+ICAgICAgaWYgKGFyZWEtPnU2NCAmIFZIT1NUX1VTRVJfVlJJ
TkdfTk9GRF9NQVNLKSB7DQo+ID4gICAgICAgICAgcmV0dXJuIDA7DQo+ID4gQEAgLTI0ODUsMTEg
KzI0ODcsMTcgQEAgdm9pZCB2aG9zdF91c2VyX2NsZWFudXAoVmhvc3RVc2VyU3RhdGUgKnVzZXIp
DQo+ID4gICAgICBmb3IgKGkgPSAwOyBpIDwgVklSVElPX1FVRVVFX01BWDsgaSsrKSB7DQo+ID4g
ICAgICAgICAgaWYgKHVzZXItPm5vdGlmaWVyW2ldLmFkZHIpIHsNCj4gPiAgICAgICAgICAgICAg
b2JqZWN0X3VucGFyZW50KE9CSkVDVCgmdXNlci0+bm90aWZpZXJbaV0ubXIpKTsNCj4gPiArICAg
ICAgICB9DQo+ID4gKyAgICB9DQo+ID4gKyAgICBtZW1vcnlfcmVnaW9uX3RyYW5zYWN0aW9uX2Nv
bW1pdCgpOw0KPiA+ICsgICAgLyogV2FpdCBmb3IgVk0gdGhyZWFkcyBhY2Nlc3Npbmcgb2xkIGZs
YXR2aWV3IHdoaWNoIGNvbnRhaW5zIG5vdGlmaWVyLiAqLw0KPiA+ICsgICAgZHJhaW5fY2FsbF9y
Y3UoKTsNCj4gPiArICAgIGZvciAoaSA9IDA7IGkgPCBWSVJUSU9fUVVFVUVfTUFYOyBpKyspIHsN
Cj4gPiArICAgICAgICBpZiAodXNlci0+bm90aWZpZXJbaV0uYWRkcikgew0KPiA+ICAgICAgICAg
ICAgICBtdW5tYXAodXNlci0+bm90aWZpZXJbaV0uYWRkciwgcWVtdV9yZWFsX2hvc3RfcGFnZV9z
aXplKTsNCj4gPiAgICAgICAgICAgICAgdXNlci0+bm90aWZpZXJbaV0uYWRkciA9IE5VTEw7DQo+
ID4gICAgICAgICAgfQ0KPiA+ICAgICAgfQ0KPiA+IC0gICAgbWVtb3J5X3JlZ2lvbl90cmFuc2Fj
dGlvbl9jb21taXQoKTsNCj4gPiAgICAgIHVzZXItPmNociA9IE5VTEw7DQo+ID4gIH0NCj4gPiAg
DQo+ID4gLS0gDQo+ID4gMi4zMy4wDQo+IA0KDQo=

