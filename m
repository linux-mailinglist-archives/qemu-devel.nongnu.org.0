Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051B4E1F55
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 04:41:54 +0100 (CET)
Received: from localhost ([::1]:55098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW8vY-0006lt-VL
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 23:41:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1nW8tl-00064V-6y
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:40:01 -0400
Received: from esa5.fujitsucc.c3s2.iphmx.com ([68.232.159.76]:45026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1nW8ti-0005WX-9S
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1647833999; x=1679369999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LJYHBSKnsiED6dr1bmcjhWCbQmwne00pL4sPurpzLmA=;
 b=LaToqclsQXFg/YbmEKOjZ5LYCaNSASYwT+ngXWv/AKvXar7Lvj0nLRLx
 HtxMjKUa0rUrHbEEToylCXExEjTr4GUJrHzdQfpw3PPqOmIZ6qW3GHIqh
 QLnFFF1WTDrsXbdNY0sIZGWADmGXQvYpx5I6Bm3SkW+oIVzhCCB4VtN33
 GEFCaC1kdL/CwPlNrmxeeLrJZ3OPaW5mLQa9Ras6IZBCCtNzPrJn9TEgd
 155OPkxjDX+2QeRZkcgfZZKFDUtqJ0GKsHIHxGAXhuTim8VXy35wUVjF7
 /IBzxvjoMfmVKmBVpGFTitJ8bPgedtB3I3GMHOXsbYv8sKszQMt8WNTsb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="52219994"
X-IronPort-AV: E=Sophos;i="5.90,197,1643641200"; d="scan'208";a="52219994"
Received: from mail-tycjpn01lp2170.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.170])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 12:39:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDKSNhhAsY6vA07ww9+hwJgNYY3KdjZzIZ1qbjSC2suYG5d+5a9T9a1ZqZncCuYvcaL2bS8ozCLqPMy0MAinZ4gT7IFqu2Lz2Y0DHw5GD0KMhrHr+cfp4z5WmWBrrpkFapbthN16P7aZPupiBNK36Iyv3vh2HNcfH9Ai1GXfjUunZpU63iYcv1Qw09YDPV60N6TPlPMyXorGYVDFqhjTgI0QUvtXYBABXPkei/mqx69TZsyjfazhmfzSaZ9fnuTglZQGOKmnkBFtlEZQlPfzqpjtAR6PxroGht9ijXWGh8o9nzSS0Bv847MNpNu1gn3kvhDovQFPKCX8SDWGsueagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJYHBSKnsiED6dr1bmcjhWCbQmwne00pL4sPurpzLmA=;
 b=UqRKQ949sIvmmo9W9SetwxIUrGn8XeXDf04AF/wjqrAFTH1QBNw64wjWpYh4M/NYwklpJ5YdLQ0ztIr4IG0mwhKWA+h3Htswk2DWCl0FLIVnKoDHIZoLH6L1aXuCy4NuOugc7fKm7pi/sLylGzhye2X/eQT9NEw9x51g96qgA48rOBSN7gOmVlPi1biU/Gsh4Jb8h1+aRDeF1Zetp631pmBoGkUm/pa5KhDa12JCw5guPs6sO6D5C4SKdnCW0H3EZIg2kalOQV6eHok0pnF+A0SFwBIPB3FXj4WKjBJYd9nkvh+eb7269BlpMGqSQxdoYAnWaZshOuU7aDV/fIn7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJYHBSKnsiED6dr1bmcjhWCbQmwne00pL4sPurpzLmA=;
 b=RG9PMzPCQZsfLV+4eBPMvmwAl+AJZK2cSYQM0wamUSYcPlv55V5QAfEkgNa2id4GtjL8eCpr391tGuq3CIqytw0b3pSJeyS5jSMPiyrPwBL+6UyP52zJhxQ3H5xMsPTgtNSfum9S66MGVw5p3KAehIKId+pWe0OtcVkBS8sbPHA=
Received: from TYCPR01MB9305.jpnprd01.prod.outlook.com (2603:1096:400:196::10)
 by OSBPR01MB4952.jpnprd01.prod.outlook.com (2603:1096:604:7e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 03:39:50 +0000
Received: from TYCPR01MB9305.jpnprd01.prod.outlook.com
 ([fe80::d598:aa14:b8f2:1546]) by TYCPR01MB9305.jpnprd01.prod.outlook.com
 ([fe80::d598:aa14:b8f2:1546%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 03:39:50 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: Re: [PATCH 4/4] net/colo.c: fix segmentation fault when packet is not
 parsed correctly
Thread-Topic: [PATCH 4/4] net/colo.c: fix segmentation fault when packet is
 not parsed correctly
Thread-Index: AQHYM5Lb3v39vcIrt0ieXpRD1fislazJQ3YA
Date: Mon, 21 Mar 2022 03:39:50 +0000
Message-ID: <3ad2a276-faf7-a94b-59fd-dd405d97a3c0@fujitsu.com>
References: <20220309083858.58117-1-chen.zhang@intel.com>
 <20220309083858.58117-5-chen.zhang@intel.com>
In-Reply-To: <20220309083858.58117-5-chen.zhang@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30f21337-5e32-439d-7156-08da0aec746b
x-ms-traffictypediagnostic: OSBPR01MB4952:EE_
x-microsoft-antispam-prvs: <OSBPR01MB495252F5869EE7CC6FBA2772A5169@OSBPR01MB4952.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cd9L9KYF0ba6+OwNiyem/KFdUXnTSei86Xyf4WJmrAaw4h/gAjq9p9TxAecrO/YXJG7q+bgnzlZwg5Mvjr4rB2TZzJFKGjHkOt4n5XHXLhoa0NSPySWlCfS9GNHY/CoZl8PCDUwT77o2L5wSb7aXvSb1CO/HlHcukNgUc+WlqX6KOSBOoYwkC+D6vE4HqxM2hm2Jxppqi+1exs6nqX0nZcBQ1ye81ikhS2BbDwbtQro6KI5SmtAu73dBBbJoY3/tnievg88wkp7z4Fxd7ZAKbmcBXWgUldfHiun44Mr70eZekoUfQNPR2PqI5kYjoMCLvdsesCdS32XiEGi1jSU9tQMha4qhnWYS2TR/a4RpwpBXYH9gr2uUuN4hDi87uG1hgI73QJ0W8Ta4sUYX3xB/8cT/iRICy5idiL1IZ1nu9etTXmKt0tEQoAE1BowN9VHu2gO1IX5kgKET8Q8KszBrKCOzSHnN07ot07Lfvs0J/HyVPLCoblhIiGQMTUxx/rRQI/KDgsO7v2TnFCGchdLkFyLALGytkcO57XG4IfnMux7EtsHMHRZT4ErWPwbDv3hA15c3NHWYs0z6Vwrto5kTYb/8pKPGKEjS+GksTQFgw7lFgTixv4e7maeHl5auwttFWa9BY6tmXcgmBdsLwfbeK0Ik/zoX15KSaGAT6Qub/nUjP/8rChSDYJ9HPzNT5rruU869hOToceeK1qFNqD77LZGhLGI5yiAfsx5i+7HrSY5Z14zJvQ0s4GxBWyYrHc2evuxjr9Go2mGTDctyDmy+fQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB9305.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(6486002)(2906002)(38070700005)(508600001)(31696002)(64756008)(83380400001)(91956017)(76116006)(66446008)(66556008)(8676002)(66476007)(4326008)(110136005)(316002)(54906003)(86362001)(66946007)(5660300002)(122000001)(38100700002)(82960400001)(8936002)(85182001)(186003)(36756003)(26005)(6512007)(6506007)(31686004)(2616005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vi9kcTREaXhtT09xZmUxV1FNb2pRVHY5ckpMK1R1c29PMHllK2V6VkhrTGJ3?=
 =?utf-8?B?SWFzaEV5blZiUnEyVGVZUUd4TC9kVnNuK0tVRmw1MzM1Q0Y3VWd0NEFYYmZv?=
 =?utf-8?B?SWRQZ0ZYM1dIN2piWS95TE9zSmtSdHJmakY1NlhmLzUwVGlTTk5LZnovTVVt?=
 =?utf-8?B?VjYvNk5VVFU4VTE2dHpQWE54UmtoN1ZYcFhDaVdHODRFamlrOFpuNk81WTJU?=
 =?utf-8?B?S2FnWTdCMFg1L1VqZkVNVmJXc3RvMDFKVk9IZ0U4U2p1Wnl2aER5TnQyVkJC?=
 =?utf-8?B?QVRTZGNWdTdoL0NhNmhwTWpVK0dOeGNXbXNGeFpEUDltY3l1bG1BdW1nYjFK?=
 =?utf-8?B?VlgzZUxOQ0lxaVlydHd3bnorK0tvb2ZxOVp1QWZBQ0doMklWM2dTcUJ4c2x0?=
 =?utf-8?B?VVc0Z3FSbWMzYjFGaUt1YjdEaVpMME1UUEpvMEpyT2FmMXNkOWhnK2FneGh0?=
 =?utf-8?B?SWlUTnhIM2Z6ekkzaHlBenppU3gyaXhCaUQzcnBoQ0FKaDJuemJpUWh2ckti?=
 =?utf-8?B?QXlSdFVHVnJCV3FOVWUwMzYvcjU3N1cxck50SDFHOXltN1ZEalRGOE1jdkVS?=
 =?utf-8?B?SWMxV3pyRUdBL0c1R3ViWDBqWkZXaWcvQ2MydHUxYmdkNS9VSnBLZkdzam1M?=
 =?utf-8?B?bTA5LzFhSzlOTjNDL3pyeVY0cjB4dzM1MktTOWRQbzB1eER5WVV3aThGMDZE?=
 =?utf-8?B?VmJ0ZXFBZVlUbUFsS0Z5WVZCQUVDM0llcndaWURQbFpPSlV6UDNqRWxtdUlt?=
 =?utf-8?B?VklVQkg4em5qbDY5MG9naUVKT3R2N3JFT1N4dktSQ3A0UHNQZTd3eVNRcnhG?=
 =?utf-8?B?aUdaS1kxNUN2WnFGbzFVSTU1ZVc1UDAxUFpOYmM1WXZsZ0VkL21YZk5WMmZp?=
 =?utf-8?B?ajBnTDd1NWsxZHlSbjljdkVaWWphRk9lbmdiZ1lNSnJxMUIwTTBILys1a2pj?=
 =?utf-8?B?bmFXcXd3WVA3K0QrdTVGWnZYcHlHaHIyczlYT0hLRGVJVkwrUXhKYjlKWnhr?=
 =?utf-8?B?TXFiSERHeHFZbTAveEJnRUpjMXduQWo0dkE1MnFDeTNSZGhsR1dTZXZrRG4x?=
 =?utf-8?B?enVFWmcrM1hJN09HQk5yQXp3US8wa0Y2UnVONzlXL090NzhWMGhFOEtFcmxP?=
 =?utf-8?B?S2FvYXBuRnFaVWJFTmFiM29GSmtleVpaTFlPTmZGNGlmc2Zqc083bkw1OWkv?=
 =?utf-8?B?MXNSVUM3a1lhWU5iVk5uVWVaTW9lRGRXNFcxdDNPQXRtRWZEQ2J5TWFzY25W?=
 =?utf-8?B?QlQveGtPdG14Zk5ad1kwa0xCNTlwYTBJSW5OYVY3R2ZSdjkzOUVEaDI0WGRj?=
 =?utf-8?B?ai9hV0dOSklmNmNnQzZpL3daZEFnU0lUaXRLbmN5bUtXQU84MmxObi9ONFBy?=
 =?utf-8?B?VDdwd3lqTTFHclhVY1Fzb1dtRWZEUHFBOWs4T0JYekY5c3M2SUE0YXR2UVkz?=
 =?utf-8?B?Yy90QjQ5MVdUUlN4UUJTR2tXS21Sd21VdmhNVXFpYjVZeXVyUzBBREJ0bTlz?=
 =?utf-8?B?R293M3FkVEo0N3hNU055UnBKQS8xbjdUQXpkeFlwQVlrcUV2N0l3bGFZdVZ6?=
 =?utf-8?B?WGwwM0lPQThLVW5BZm9BdFNkSU41UEhXVlBxSTkwWXJBMndLd2ZCVGFRWGpT?=
 =?utf-8?B?T2o0dTdYdStSOFFkQjIvSVphYzZDMUpBeThTSmxaVEtZTVZNYkVLenZ6YUFy?=
 =?utf-8?B?ZkRmY0lYRTBIb0FwdDhyWitQT0wweTFFMlZzd294VGZ4Nnc4cW90OUpRZFdi?=
 =?utf-8?B?WVpUQ2x6aGFDMW5sM1R3T3lnblVhOWVRYjJZUEJSWVRTSmh1eUd1aGYwbkFE?=
 =?utf-8?B?c1pIbTg4dkdEdG1NbHcwM3ovaTZ3WXd3Ym5hSWlGWmtxZ3FmWjh1cGxoOFVS?=
 =?utf-8?B?bzNwN3BMZTZBRkRHS2F2WS85Z2xNTEVPMGVLWkNRNUs2UkJ1bFRKWTVLczdI?=
 =?utf-8?B?aUFRU3BwN2tOTmdDZDRpbjA4N1plblFpb1Jld0xKR2lJaCtCVW40NXFCOFM4?=
 =?utf-8?B?Q3BPMHRaMWxnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3609178B1EED644EB62A0F02E37470D3@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB9305.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f21337-5e32-439d-7156-08da0aec746b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 03:39:50.7323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5Zwyv6jkr1NakwdxLj3Jmmm3qGJPWO+Hx+HCKuIw4Zs17HKBVx/6se8DkpIXUKlysLKvUYo4SE04j2Y7mPJng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4952
Received-SPF: pass client-ip=68.232.159.76; envelope-from=lizhijian@fujitsu.com;
 helo=esa5.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Tao Xu <tao3.xu@intel.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDA5LzAzLzIwMjIgMTY6MzgsIFpoYW5nIENoZW4gd3JvdGU6DQo+IFdoZW4gQ09MTyB1
c2Ugb25seSBvbmUgdm5ldF9oZHJfc3VwcG9ydCBwYXJhbWV0ZXIgYmV0d2Vlbg0KPiBmaWx0ZXIt
cmVkaXJlY3RvciBhbmQgZmlsdGVyLW1pcnJvcihvciBjb2xvLWNvbXBhcmUpLCBDT0xPIHdpbGwg
Y3Jhc2gNCj4gd2l0aCBzZWdtZW50YXRpb24gZmF1bHQuIEJhY2sgdHJhY2sgYXMgZm9sbG93Og0K
Pg0KPiBUaHJlYWQgMSAicWVtdS1zeXN0ZW0teDg2IiByZWNlaXZlZCBzaWduYWwgU0lHU0VHViwg
U2VnbWVudGF0aW9uIGZhdWx0Lg0KPiAweDAwMDA1NTU1NTVjYjIwMGIgaW4gZXRoX2dldF9sMl9o
ZHJfbGVuZ3RoIChwPTB4MCkNCj4gICAgICBhdCAvaG9tZS90YW8vcHJvamVjdC9DT0xPL2NvbG8t
cWVtdS9pbmNsdWRlL25ldC9ldGguaDoyOTYNCj4gMjk2ICAgICAgICAgdWludDE2X3QgcHJvdG8g
PSBiZTE2X3RvX2NwdShQS1RfR0VUX0VUSF9IRFIocCktPmhfcHJvdG8pOw0KPiAoZ2RiKSBidA0K
PiAwICAweDAwMDA1NTU1NTVjYjIwMGIgaW4gZXRoX2dldF9sMl9oZHJfbGVuZ3RoIChwPTB4MCkN
Cj4gICAgICBhdCAvaG9tZS90YW8vcHJvamVjdC9DT0xPL2NvbG8tcWVtdS9pbmNsdWRlL25ldC9l
dGguaDoyOTYNCj4gMSAgMHgwMDAwNTU1NTU1Y2IyMmI0IGluIHBhcnNlX3BhY2tldF9lYXJseSAo
cGt0PTB4NTU1NTU2YTQ0ODQwKSBhdA0KPiBuZXQvY29sby5jOjQ5DQo+IDIgIDB4MDAwMDU1NTU1
NWNiMmI5MSBpbiBpc190Y3BfcGFja2V0IChwa3Q9MHg1NTU1NTZhNDQ4NDApIGF0DQo+IG5ldC9m
aWx0ZXItcmV3cml0ZXIuYzo2Mw0KPg0KPiBTbyB3cm9uZyB2bmV0X2hkcl9sZW4gd2lsbCBjYXVz
ZSBwa3QtPmRhdGEgYmVjb21lIE5VTEwuDQpOb3Qgc3VyZSBpZiB3ZSBjYW4gY2hlY2sgdGhpcyBl
YXJsaWVyLCB3ZWxsDQoNClJldmlld2VkLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AZnVqaXRz
dS5jb20+DQoNCg0KPiBBZGQgY2hlY2sgdG8NCj4gcmFpc2UgZXJyb3IgYW5kIGFkZCB0cmFjZS1l
dmVudHMgdG8gdHJhY2sgdm5ldF9oZHJfbGVuLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBUYW8gWHUg
PHRhbzMueHVAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBDaGVuIDxjaGVuLnpo
YW5nQGludGVsLmNvbT4NCg0KDQo+IC0tLQ0KPiAgIG5ldC9jb2xvLmMgICAgICAgfCA5ICsrKysr
KysrLQ0KPiAgIG5ldC90cmFjZS1ldmVudHMgfCAxICsNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbmV0L2NvbG8u
YyBiL25ldC9jb2xvLmMNCj4gaW5kZXggNjk0ZjNjOTNlZi4uNmIwZmY1NjJhZCAxMDA2NDQNCj4g
LS0tIGEvbmV0L2NvbG8uYw0KPiArKysgYi9uZXQvY29sby5jDQo+IEBAIC00Niw3ICs0NiwxNCBA
QCBpbnQgcGFyc2VfcGFja2V0X2Vhcmx5KFBhY2tldCAqcGt0KQ0KPiAgICAgICBzdGF0aWMgY29u
c3QgdWludDhfdCB2bGFuW10gPSB7MHg4MSwgMHgwMH07DQo+ICAgICAgIHVpbnQ4X3QgKmRhdGEg
PSBwa3QtPmRhdGEgKyBwa3QtPnZuZXRfaGRyX2xlbjsNCj4gICAgICAgdWludDE2X3QgbDNfcHJv
dG87DQo+IC0gICAgc3NpemVfdCBsMmhkcl9sZW4gPSBldGhfZ2V0X2wyX2hkcl9sZW5ndGgoZGF0
YSk7DQo+ICsgICAgc3NpemVfdCBsMmhkcl9sZW47DQo+ICsNCj4gKyAgICBpZiAoZGF0YSA9PSBO
VUxMKSB7DQo+ICsgICAgICAgIHRyYWNlX2NvbG9fcHJveHlfbWFpbl92bmV0X2luZm8oIlRoaXMg
cGFja2V0IGlzIG5vdCBwYXJzZWQgY29ycmVjdGx5LCAiDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgInBrdC0+dm5ldF9oZHJfbGVuIiwgcGt0LT52bmV0X2hkcl9s
ZW4pOw0KPiArICAgICAgICByZXR1cm4gMTsNCj4gKyAgICB9DQo+ICsgICAgbDJoZHJfbGVuID0g
ZXRoX2dldF9sMl9oZHJfbGVuZ3RoKGRhdGEpOw0KPiAgIA0KPiAgICAgICBpZiAocGt0LT5zaXpl
IDwgRVRIX0hMRU4gKyBwa3QtPnZuZXRfaGRyX2xlbikgew0KPiAgICAgICAgICAgdHJhY2VfY29s
b19wcm94eV9tYWluKCJwa3QtPnNpemUgPCBFVEhfSExFTiIpOw0KPiBkaWZmIC0tZ2l0IGEvbmV0
L3RyYWNlLWV2ZW50cyBiL25ldC90cmFjZS1ldmVudHMNCj4gaW5kZXggZDdhMTcyNTZjYy4uNmFm
OTI3YjRiOSAxMDA2NDQNCj4gLS0tIGEvbmV0L3RyYWNlLWV2ZW50cw0KPiArKysgYi9uZXQvdHJh
Y2UtZXZlbnRzDQo+IEBAIC05LDYgKzksNyBAQCB2aG9zdF91c2VyX2V2ZW50KGNvbnN0IGNoYXIg
KmNociwgaW50IGV2ZW50KSAiY2hyOiAlcyBnb3QgZXZlbnQ6ICVkIg0KPiAgIA0KPiAgICMgY29s
by5jDQo+ICAgY29sb19wcm94eV9tYWluKGNvbnN0IGNoYXIgKmNocikgIjogJXMiDQo+ICtjb2xv
X3Byb3h5X21haW5fdm5ldF9pbmZvKGNvbnN0IGNoYXIgKnN0YSwgaW50IHNpemUpICI6ICVzID0g
JWQiDQo+ICAgDQo+ICAgIyBjb2xvLWNvbXBhcmUuYw0KPiAgIGNvbG9fY29tcGFyZV9tYWluKGNv
bnN0IGNoYXIgKmNocikgIjogJXMiDQo=

