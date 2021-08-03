Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB453DE38C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 02:26:41 +0200 (CEST)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAiGW-0007Pt-EH
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 20:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mAiE5-0005vH-6Z; Mon, 02 Aug 2021 20:24:10 -0400
Received: from esa14.fujitsucc.c3s2.iphmx.com ([68.232.156.101]:52217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mAiE1-0007rP-LG; Mon, 02 Aug 2021 20:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627950247; x=1659486247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zNOrHN3TDle2JkeHmBWtDoZro5Q6xIuM7JdDx4NhaWQ=;
 b=oMui9joQDJYIYTTYmKEDHr9398KrGNdiDP2kpharZgMVNV4sLRscOsAV
 hw5yiXrAzYuaqzk5LeVLGfLfHA927usXa9Yw93QaiBJ3HnPfxq2qvXvMv
 1jWtuUEOv4Ih4vifXWRmdqZAf5VDZjKFRbOXXy7vs0/UePpmeMjBzsQcd
 ZMsQvw4pCife/jEp5nDcq9t6Rw6Vg2ZTpOZ3viXIuy5Il7WjxyjvIIUzl
 ZmlYbMDQUrE1U33NcWGwSczn2P/8whPPc2Yghsla8DxSKDqd1i0+jzmDc
 NJdTXo+LSRrO1PpKwK6lDPgr1xe0BX4A3b7s+6Ld59DZmNLc4A30xHXsq g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="35916323"
X-IronPort-AV: E=Sophos;i="5.84,290,1620658800"; d="scan'208";a="35916323"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 09:24:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrMOHk3JAkOuNsO4c/9JeZRXmN8fH4KTRR6Rr5nVV5WQfUsDwgFrwKaVy6bg7/HmCi6T0BdHf+JUep4pu2l1pgSU5zsdIlFz8RQWcXh+3+im2gYBgGQTBk0JvKLl/O6Q0kPBguszHkOHsPTpAa3CxtAEVaOmqJWzyLpBPZwM5zxQQxOJ/hR/Hrm1pNCb1FP85mpIxsVmCYlmCoWa3/XE6LtKDZWBM3zQtlVrHqMk6P9LRnNWl57XUVAVuZPCnCewbTCmjSuhpP7fqrqwQcZtWLlDv/a2+33auO53hwA5nFSV6bKUPbmRrX/5eOF5Rq/joY/bUEu6sMm6hqkkIbU13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNOrHN3TDle2JkeHmBWtDoZro5Q6xIuM7JdDx4NhaWQ=;
 b=eEY1VJqaPtt9QZCpmpGCzuDH7e89hBXhOaH+EQbWKIcsm2ozzva82NZmXhhBwHgQ/VmslW7lCIXOt98Ee3BjiKRqIwcNRgl21GLIuNu1lFG14smAw+FdUV6kEBcf3Mb7Kzkrg70CijtAvYIN/RmYBdXsPyC5WrMcpVZdOq0+QY3kSFKRiorKz8Fgu7gxJtrxAeDs/Keu6tm05GGGxnanx/fm/tqEOOmERJoiHz/ZzRWp2k8b8Sxciv6jbu3VUSu9TShun32/0lXRmURHBuUEo0SgErFeNkqIa/r4a74T7erbeEiRjANDdfVizNHwG2m1OrKNGoZzD6m2BQykDS4brA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNOrHN3TDle2JkeHmBWtDoZro5Q6xIuM7JdDx4NhaWQ=;
 b=azMWiGXTSFZrA9UIm2b/QoBkzBfbP88Hz2aAwXsfhsd8FftcGde6Ny1UkpUJn3OoCBuzUmKbC0KCfgZsLl8/CtNJOIg/czL7qRQPLnk0gPtHqfHyF67ABeOjUh4dhQk/Kd4p42+Gg95JZBejmAsH6X7fKy3i1OHcVHwe06NEoeY=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYAPR01MB4829.jpnprd01.prod.outlook.com (2603:1096:404:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 00:23:59 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 00:23:59 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 1/3] target-arm: delete ARM_FEATURE_A64FX
Thread-Topic: [PATCH v2 1/3] target-arm: delete ARM_FEATURE_A64FX
Thread-Index: AQHXhPAuBW5c6k/W+U+CcgAi+zekmatbUx4AgAWeIEA=
Date: Tue, 3 Aug 2021 00:23:59 +0000
Message-ID: <TYCPR01MB6160E7FA2C650FE4D3A5714CE9F09@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
 <CAFEAcA9YFk29a2o3_kiJ00OSh1VGzx8nXrFXBpts_c-3FNSOEQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9YFk29a2o3_kiJ00OSh1VGzx8nXrFXBpts_c-3FNSOEQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MDk4YjNiZGYtNjk0NC00MmYxLWJiNTktMTU0NDM4YzRm?=
 =?utf-8?B?ZTkzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wOC0wM1QwMDoyMTo1Mlo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8ff8479-65ff-4fd6-5193-08d95614fd30
x-ms-traffictypediagnostic: TYAPR01MB4829:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB48293C422D1C6A0AFE85EAD6E9F09@TYAPR01MB4829.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: daVw9enOhQAT2K2TXTIyfEgwyoSheKVyZSG97eH0/deIvcmBJluLQWn6RA9B8tNdNO/sK0RZxjqU1lHV9mUmpR6ZVxQHIYa1gMgOEu9x+FU4etz8EQeCMfXNiw3dPrE3CuNs8jb0jwLnSXL4XG+2Ky7/9ENnC8l8KbmDvJW6nIWBWTKxKnfF0++Te20Cwi0Pqy5zhns0Vz8Rp9KAHSHituHIlbRH83J+Sb0Ac9w08BWakM2FSM1YwPE51ZqjWVAbZMU6qqyuLpHWABx0A/cYjhcyapkl8UihewTc1ZMbz0A4N2txhkCxZ1/PWbGgwHR8zmxumPs9o9iinv5Ip5Dl+yYOxFm7SonGKPQFYBr3kH5NlnaBb2wUXud9d/jXy560Ii5qsAkx9d418eOJwI2chEBI3DwPual93Jv38N79indEa7n3TDh1S2Uh3KNPiyZxuPn5afxFyuTzVVlBxaX0BAFyesh46oSg0NLLjpkOkLiIn94osG4u4O34KfYMA2RWNgUFPdn5dK9kAz9BJfrfUWR5YIrnR/Y/Dbsuy5Id37atnEj2ubSLH3K6VankZ4Rg0/DIt8hxeE5A2KwFoHMmioDpqYzpnbxeuJVvolv8TyMutazOYkjXbeOoZQbuj+vtypbxPKrl/p9/qSYFX7hFTnX0n9vs9RUhj1otBs2kFnbqh+T/JyjbOVT9VBr9qz41/vkHQcyHskZBzqgFyCchmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(6506007)(53546011)(7696005)(26005)(76116006)(107886003)(5660300002)(8676002)(478600001)(8936002)(316002)(54906003)(52536014)(66476007)(38070700005)(66946007)(2906002)(6916009)(186003)(66556008)(66446008)(64756008)(55016002)(122000001)(33656002)(38100700002)(83380400001)(4326008)(71200400001)(9686003)(86362001)(85182001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0xYbEQ0blFRV1lmT3FZajJoK2trZG1SUFRtN1FLbjh1K1V5TmdqREZsemNp?=
 =?utf-8?B?OTl2WUU3VE5neTB1QkFpWW5RREdoUEQ4UWJYSjZSWkkwZjQ5cWZRMFEzS2V5?=
 =?utf-8?B?S3VhOEpLbG8wZE1qamJDZUgvdUFONmY0b2xhaWVkbUoydC9UU1JRL3lYRk1I?=
 =?utf-8?B?VkJIdStYRkNqd25YNE5yL3dCUUQ5OHVVVUVsa3R3NGRtR2pYWnJIaGFab0hV?=
 =?utf-8?B?cWphaTNZV2t2eUhxY0tEY1p6a2x5VXY3MnM3RHpXVGlpSk9hYk5iUlhZWURY?=
 =?utf-8?B?MERZS0x4bk9KM3IrZEVuYngxY0dCODBzazJ0Wm5INzZNUzJybUlRSnhaMTZH?=
 =?utf-8?B?TlRMZWxHREdrTEk3VFMyYWJ6UzVWUU9PZGtsYllJS1ZZV0hZcERCL3p3VEVP?=
 =?utf-8?B?endab201ZkRyTjRjZ0tQY05wUnNRdmhuNWFOL092OVVsSGhFYkRzUUJCbWVo?=
 =?utf-8?B?UEhibFhaYkVuY3NZNEw1NzkyTExlNG1pNXVEMEYrbXBZUk5HME9MTGh2MlJC?=
 =?utf-8?B?UFZwbzNzVjVpNGtzN3o4aHkzQmZVZHcxd1Y3U01na0c2eFVaQjNoY3B1ekZ1?=
 =?utf-8?B?dFRmdHY2dm54VENyZzBxanJqc0FTeUpSWU4xckxxTFZOTVFLQTFIVk9OZ2N5?=
 =?utf-8?B?bFN2WXMwa0Z1VFJOZkpRTk9mVUJYd05LMmJraUZ3cjZpcXJsUU9tTDQrSzhu?=
 =?utf-8?B?d3d1TGd3Sis4OE4wbENheU9jNU92TjQxMUplNlorRldYVkkvQ1pWNGRXL05y?=
 =?utf-8?B?QkZUNW02SHVPVHdtdXR0My83OE5YYWhxV2NsdlNod0wrUE9oUmdtN1ZXRUYz?=
 =?utf-8?B?dEJFVTNrcFhFS2kreXpqWW10UVphZm9YSENGZU5Pck9YZFlhTmN4eUh2eHhO?=
 =?utf-8?B?cVhrQVdOQXJYU2NzQThRdzQ5cE16cHBlaXQ0cnRzNmlLbGRIbThrZy9IZm1j?=
 =?utf-8?B?cm5na2NkWXd5N2M1eDByVWZVSnNzUVdzRE9rNDRjTkdHVlJvYldaUlBZYkEr?=
 =?utf-8?B?bHJyVWllUEJWWUVJaVFaUFVLVmg1LzRVSEZqUEFGZDRaWG9GVDgxaDgyZEYx?=
 =?utf-8?B?VmZCY2FkQjdScCt0YTVEeUU0d29kMFlKcWEwTzN0MVFyNjJaV0d4Uld1b0pt?=
 =?utf-8?B?UzRqMU9IOHpBdnBUcnQ5czFmWE5CMG5IbkF0SWJFOVo2VnFxc2taeW9uSWg1?=
 =?utf-8?B?WHZXVDNOL0xKM2FkYnJEMmViVzZ6QW1sTisySmpCbDBwZDVuQXJqekJ2elpk?=
 =?utf-8?B?VkFNVUJPejJXNHFEYjV5Q3dkSHQ2V2I1Q0FsbUNLcEhDUmxtYmw2c1owbEMv?=
 =?utf-8?B?MkM3Mmw5TlEwQzlzcE8vVW8vYjlGc1hQR2NvM0tOaHBwM01sT25oSFlxeWd0?=
 =?utf-8?B?a3RZQ3pxUlN2MnpCWWYwTHhCbzlOemk2dGpQQmRvSGpZVmE1bjVJUEtvNmcx?=
 =?utf-8?B?WSsxRXdxdmhWTkxuYVl6bFNna2RzOFdpeEd1c0ZwNFplM3g2TjI3QjY4RFEy?=
 =?utf-8?B?T1FKTjJIaVVpUXlBM2pLSHVUVXBuNzJyaVFBWk9wQkowZnNEZG1LWUVMV3lx?=
 =?utf-8?B?RTlyRW83SFB5blI2ODYvM3p1V2psc1RpdEt0UXJHVitEV3V5UmxEeGIyOXZH?=
 =?utf-8?B?bjdpS0FIRzZpejBNVVYwaGYxVERPU3FPd2wxeS81VEpmUWtTMXRVd2JSOXlO?=
 =?utf-8?B?TWdpUVRIMHd6ZmRQWXdQYVA5YllpUUFPaWxlZUVxMDl1VCsyTXFwZ2NWL3Nx?=
 =?utf-8?Q?sSZkqV4aVnR4cEKNVy9ELLD5ueB6ryZG8eQH5ZI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ff8479-65ff-4fd6-5193-08d95614fd30
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 00:23:59.6205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1X1kzuR0yjRbWs8jR0WY+7QWLs95+x1SbLjKYEgMNB5aOT//iDRZW0mydJq2R5T/jhxaTproAVdzRlTM045oa9C8cdV1bsWlExI9I1duWLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4829
Received-SPF: pass client-ip=68.232.156.101;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa14.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IFRoaXMgZmVhdHVyZSBkb2Vzbid0IGV4aXN0IGluIHVwc3RyZWFtIFFFTVUsIHNvIHRoaXMg
d29uJ3QgYXBwbHkuDQo+IEZvciBhIHYyIG9mIGEgcGF0Y2gsIHRoZSBwYXRjaGVzIHNob3VsZCBi
ZSBiYXNlZCBvbiB1cHN0cmVhbSwgbm90IG9uIHRvcCBvZiB0aGUgdjENCj4gc2VyaWVzLg0KDQpU
aGFuayB5b3UgZm9yIHlvdXIgY29tbWVudC4NCkkgdW5kZXJzdG9vZCB5b3VyIHBvaW50Lg0KDQpC
ZXN0IHJlZ2FyZHMuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVy
IE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKdWx5
IDMwLCAyMDIxIDc6MzUgUE0NCj4gVG86IElzaGlpLCBTaHV1aWNoaXJvdS/nn7PkupUg5ZGo5LiA
6YOOIDxpc2hpaS5zaHV1aWNoaXJAZnVqaXRzdS5jb20+DQo+IENjOiBxZW11LWFybSA8cWVtdS1h
cm1Abm9uZ251Lm9yZz47IFFFTVUgRGV2ZWxvcGVycw0KPiA8cWVtdS1kZXZlbEBub25nbnUub3Jn
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvM10gdGFyZ2V0LWFybTogZGVsZXRlIEFSTV9G
RUFUVVJFX0E2NEZYDQo+IA0KPiBPbiBGcmksIDMwIEp1bCAyMDIxIGF0IDA0OjA4LCBTaHV1aWNo
aXJvdSBJc2hpaSA8aXNoaWkuc2h1dWljaGlyQGZ1aml0c3UuY29tPg0KPiB3cm90ZToNCj4gPg0K
PiA+IFRoZSBBUk1fRkVBVFVSRV9BNjRGWCBwcm9wZXJ0eSB3YXMgYWRkZWQsIGJ1dCB0aGVyZSBp
cyBubyBmdW5jdGlvbg0KPiA+IHRoYXQgdXNlcyB0aGlzIHByb3BlcnR5IHlldCwgc28gaXQgd2ls
bCBiZSByZW1vdmVkIHVudGlsIGEgZnVuY3Rpb24NCj4gPiB0aGF0IHVzZXMgaXQgaXMgYWRkZWQu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHV1aWNoaXJvdSBJc2hpaSA8aXNoaWkuc2h1dWlj
aGlyQGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICB0YXJnZXQvYXJtL2NwdS5oICAgfCAxIC0N
Cj4gPiAgdGFyZ2V0L2FybS9jcHU2NC5jIHwgMSAtDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2NwdS5oIGIvdGFy
Z2V0L2FybS9jcHUuaCBpbmRleA0KPiA+IDFiMGM3YjkxZWMuLjlmMGE1Zjg0ZDUgMTAwNjQ0DQo+
ID4gLS0tIGEvdGFyZ2V0L2FybS9jcHUuaA0KPiA+ICsrKyBiL3RhcmdldC9hcm0vY3B1LmgNCj4g
PiBAQCAtMjE0NSw3ICsyMTQ1LDYgQEAgZW51bSBhcm1fZmVhdHVyZXMgew0KPiA+ICAgICAgQVJN
X0ZFQVRVUkVfTV9TRUNVUklUWSwgLyogTSBwcm9maWxlIFNlY3VyaXR5IEV4dGVuc2lvbiAqLw0K
PiA+ICAgICAgQVJNX0ZFQVRVUkVfTV9NQUlOLCAvKiBNIHByb2ZpbGUgTWFpbiBFeHRlbnNpb24g
Ki8NCj4gPiAgICAgIEFSTV9GRUFUVVJFX1Y4XzFNLCAvKiBNIHByb2ZpbGUgZXh0cmFzIG9ubHkg
aW4gdjguMU0gYW5kIGxhdGVyICovDQo+ID4gLSAgICBBUk1fRkVBVFVSRV9BNjRGWCwgLyogRnVq
aXRzdSBBNjRGWCBwcm9jZXNzb3IgSFBDIGV4dGVuc2lvbnMNCj4gc3VwcG9ydCAqLw0KPiA+ICB9
Ow0KPiANCj4gVGhpcyBmZWF0dXJlIGRvZXNuJ3QgZXhpc3QgaW4gdXBzdHJlYW0gUUVNVSwgc28g
dGhpcyB3b24ndCBhcHBseS4NCj4gDQo+IEZvciBhIHYyIG9mIGEgcGF0Y2gsIHRoZSBwYXRjaGVz
IHNob3VsZCBiZSBiYXNlZCBvbiB1cHN0cmVhbSwgbm90IG9uIHRvcCBvZiB0aGUgdjENCj4gc2Vy
aWVzLg0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K

