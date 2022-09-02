Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9DF5AB7FC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:10:01 +0200 (CEST)
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUB7A-0001AR-D4
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAq3-0002P6-Dt; Fri, 02 Sep 2022 13:52:27 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:25576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAq0-0005UT-NJ; Fri, 02 Sep 2022 13:52:18 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282BaqSu005794;
 Fri, 2 Sep 2022 10:52:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=0NVV6xKobFgCJdcTVcnOdaXeEn3PSX/yD7P/TV0EmV0=;
 b=sVFcZKj+3pX/pw9Ry9SLyLyWoS3C+p9bsVRMVKDodOhZ2fmZ6vW3pS/gjB099VcvSiol
 v2lBKibsbEDmPgzLOL9U0Pm81UJE/Oylp1vM+x6Sr4FsYq9YCaZuT88SdOBBn5AZT8lT
 sMRPXmNXFYH9FBjXpl7aLAjFgospykzImtqjW5WQRDZGzrkXFx6QrfNC1mDC3VRKcuFJ
 jWmRQ0z2EBmcYM5xYYXP//V3ZoSDioXADj6cG6t9VOa6OvxLUIo+mwcdG7LjiwKClCAe
 I47UoYNkvu+dT9MC4+PeVFh0o0iG7XdpLKAwaqk81CgnpnbmTOKtbI5qsnjgsA1aiwRt wg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3j7gt9eva8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 10:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODcMfSo+8FbPIoIx6gPV87kx7jaOB3WX5vIxHciTZHPkDfaa6hlCUGaCPLDguX4+3jb9Sah/AfAoRP7qr/nd7r1o6s7rk1VL7tD6FTWZiwW9SuV4S6RdZ9tnZiB3gR/wbrzTdcXWi+ugXVv2WObx+EYdgAOQ7R3p0VpNm6FnLBcaauYdqlUe16XeJrDfm1YsN7Z0+bpRE71LDBMqintHxdiwxQsso+IwrZSo6G0GFh7x+H+AxCjk+6lmIn7Ms5qfvfnSBWul0dVVZDijn0Jdnly3GIRFkQ1ck2U7/KV71uSoj9EW/IThmVeOtpZgsYUfrLNG8atx0rNilVpVabeu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NVV6xKobFgCJdcTVcnOdaXeEn3PSX/yD7P/TV0EmV0=;
 b=aBLQwWiFh1AMxkc4NvXjINvYsZBCSPw0MwB3gj1MH6lkvfNDMtl06t/DVhXUG61uiiiwXwZloloipXEA/q8VUfn6GmYBuM7mjWmE9xIM/rY1nT/YhRtK7T0wUEV3O7RCnBXTCDaxjg7EyutVu5xzFqZ3OOy1wZP8RJl2Sg2lXTeB7oCF9kF1sJRjziKTs4+SZrH8gaEGE9HoH+iDpMGAdz6Evy/87R7r+Koo0uj+65DM8TLVo63f0mkcf7hsbGzTgsBL0qaDSRf3SHbS7hb5yIOoLb0cdvEeCut70vaifOfYMInnXNjchju2S43y53LAPExX5+uuk7gu9eM0xKo0qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by DM5PR02MB2554.namprd02.prod.outlook.com (2603:10b6:3:43::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.15; Fri, 2 Sep 2022 17:52:08 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 17:52:08 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v2 1/8] virtio: introduce VirtIOConfigSizeParams &
 virtio_get_config_size
Thread-Topic: [PATCH v2 1/8] virtio: introduce VirtIOConfigSizeParams &
 virtio_get_config_size
Thread-Index: AQHYuVjI2VSWY2BpvE2HlUIKaNkCoq3MdnwA
Date: Fri, 2 Sep 2022 17:52:07 +0000
Message-ID: <20220902175112.GA5363@raphael-debian-dev>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-2-d-tatianin@yandex-team.ru>
In-Reply-To: <20220826143248.580939-2-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d093aae-afae-4f87-c0e5-08da8d0bdacb
x-ms-traffictypediagnostic: DM5PR02MB2554:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wO1eVY1/MkzYO9ph2DH2dHnnAX0yqN/ZOS1024o9ToG5d7SDbpu0Cvys4xcf2/nnvO09xn2RgQ8caABFWpFqsQfcTIwX81LPapeLdEpewhcpNL3YT9T/21HAE3F50TbkQVA28YSI7PGj34VNJsq090DatF4sekm0z2+GbEj0Ra155wvupMd4x69r3b/4jtbp6eV15TUwmlLpDBj6FB/FX/Y2S+9kSrp0QtPEvfLYGa2JH985dgDHzv/mnBb39A6UPC/pcyWEfhPopWPSUskZE61HRNGi5zPOHMwhIWixWUbKxkLhn8uWe0Ms/DDHjOoEayUTVc8fEnGgOLwQWmZfQXIV7ZweMaPZfHNXLUCoJwMfYr++w0YFI1LntbYqwD3NG6X6oNaaALRKYxbtgrVTIhsJ0CJ6RV/E8ucsJEsAzgxgkT1LvhP8Y8R/OVUoj9HmkW/Ls52R+WKK3QyTLK7+AQvDYVg/r0OAWihOAppgj5IuDlbCCtnJGrNxyYZlYH4sRvrKac4WAZdyZ3K2rAShfc7HgI32DzVVjP2UjUssl7akQ3DdGYcxX0eB0x6gikumuw6c1Xs3TafkOK76DFan2FuwIH9sOKDUkZuq2VGP4aCwTBo6laihq6J42rK5n5PSFa6PjYBYizrd3KOK4IjUOLvJk6HLcKU/lKpDkNRO/v/dE3KZgcpR+wWI587RynuQc6mV+0P4/SHcXBap6vr9aaBMK2kNneB3cuJrlOpgDezWjKTLKCbKQpd3Sd+21ehoF832D5GNe+P1vintr3hP6SduKCMi9EPqCJ/hKpZbtu7rXMR/zeyIOoMk4tS+Sytp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(39860400002)(136003)(366004)(396003)(346002)(66446008)(64756008)(66476007)(66946007)(76116006)(66556008)(5660300002)(316002)(54906003)(6916009)(33716001)(33656002)(8676002)(4326008)(86362001)(2906002)(8936002)(44832011)(6512007)(9686003)(38100700002)(41300700001)(122000001)(478600001)(186003)(1076003)(71200400001)(6506007)(26005)(38070700005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cy9NaTZRa2FIQjJCRFFsK1psQmRhYlFJWEYwZk9qRDQ2MGhYSlk4RGNYTUJH?=
 =?utf-8?B?SVZzbUx1NU9peTdqVjliUFh4d1FYbFRIN25vbE9QcG9GcVo3SVoreWh2ZVdu?=
 =?utf-8?B?VnBUenBzVWE3VkJZa1JlTmVIemlqYk9pZDJtSUptOUo0R2dvcDhMaUpYSkdo?=
 =?utf-8?B?eWhHNEo1djluUVFCR0NveS9DeGhBaUtUNjFNZUpuMlRjQ1ZveXVnRnhNSEoz?=
 =?utf-8?B?bXV6MjAvL3Qrb2pjaW9XYXh1Rnh0dWxyVEJBUjNxeUNEUiszZUdpUzhRVmxN?=
 =?utf-8?B?NVlCL1Q2OGE2NjE4SE5JVFByaDlzR2xTc1hwaVF2QWZpNGVOVGdjaDlPTEo1?=
 =?utf-8?B?WU0vYXZDWWYvTHM1UXhSblh0akJaemNQdHYxRnJLUEZGSGJ4UkR4MUpJTE9M?=
 =?utf-8?B?d05TTFdJeXFjdWlBTzlmSDlncFkyc3YxSHNEWUhDa01rV0Y0OHJEbHFQakJE?=
 =?utf-8?B?V0VlYWM4dGQrV0tUMVovdEdlTmFna1A4Q1J6aVltYmUvZVgyLzMvcWdURmFN?=
 =?utf-8?B?VmV6ZHpmUjhzZVhZUDhtTm5jbXUwY0ZTcTFEbmJnSXdLWlJQd0NCZVlxU2Rj?=
 =?utf-8?B?dEJaVUtEUW9UUmZKVXpWR1hRYXhBQUtNWDdWZ0FlRDhCL0pnVjZzWFJUUzhH?=
 =?utf-8?B?VUphaktWc3ZGTFpaMk1pQzZRYWk0Z3ZETG5WYytHZzh1Y0dVSWNTa3RkeWxp?=
 =?utf-8?B?Mm9mVTJmVElHeEhib2VsYzRSNG1KSFNMTDBBMGJNWDByTVdzS2ozZnNlVmUy?=
 =?utf-8?B?SHBHY3NwSnFJdFh2VXpZTW5EYUQ0L1h2NXF4b3paQlp3MWZpRTVBUFMxWVpU?=
 =?utf-8?B?eFRmUDNqREo5ZjcrSU9DM25jZE11ekwybEJiL2JGbHl0VmNZUlAyNWU1UitG?=
 =?utf-8?B?TFNHT1hURGM3WEhWUURnTEU3enE1ZnJKbkxVUUxHTVh4UjFMMm9XSkpncFg3?=
 =?utf-8?B?K0crRTFudDRjMHRRQ3EvM2VRbnR1S0hQeTBFL2ZmYW03NnpvbmFvVlJwSlJl?=
 =?utf-8?B?RmNyMzFaN3Q5S3k2OFhyeThvMms1UEJFQkpZQzM1MVpHU2J0Ujg1TmtjWHBh?=
 =?utf-8?B?Zzhqc3lOMDVZVkVCTC83REVPdHRoeU4wVms4ZDJKdnNhbkozU1cwSUdJTGM0?=
 =?utf-8?B?N3VWaDIxYytCOWF1Q0JCRUczTnBVK1RFM0tHTmFWNVh6M2d3YWowV0VmMHZK?=
 =?utf-8?B?UXRYNkxwaXpJWkMxZUcyL2ZYalZPTFJ1ZGFacnlxc0ZSdnRiRjMvRnZUT2dv?=
 =?utf-8?B?NThMakFkUndicktlWWx4dHVWbmFEaTVBbituTUgwVTA5YXZWQjV3YTlqRW55?=
 =?utf-8?B?Z1VoZ1Q1c1ZDMVA4T0lLTytRdWpXWnlsZ04yMTU2c2hUTkpuYmZYMUtTUS9j?=
 =?utf-8?B?NGtDS1E3OGxIanowV1ZTY1hnaUQ0RExrMzdkOWxFU2xWTitiZnl6K1hKWits?=
 =?utf-8?B?dGhDUk1lQW5aSFpCdUdOZEM2TzVob2dhYmY3WFZkSnJHMVlJRTltaU9lMUZF?=
 =?utf-8?B?aEVKakgzWnVwem10YXM4R0pub0dQSjJ2dlZvdERhLytxdmtQWUtIblpBSWZ5?=
 =?utf-8?B?UlRWOHVKMWtqeXVnclhjU3VOUXh4aXNCSFc5RUo4aVZIZkdMK2VPRmVTZjB2?=
 =?utf-8?B?dE1yVjUxSzBFNmk0TmxHTzVwbGJ0ZUREMzFEa0IvWGRZenFueGNnZUhYMFQz?=
 =?utf-8?B?bklTNE5KenBhUHBHOURyZ1ZiZjlmVGxLY2VjbmVodUNlTFovMnhBSFo2a0hr?=
 =?utf-8?B?RzlHYWo1dG1sbWNCakExVC9tMXhzYXRpMWZnQjdsNHhBblFtYVhvaGNkcFI4?=
 =?utf-8?B?cmdzWmRBQ3JNanZYRXNvdVN0TUNGc3dPOXFLd3JYM0Y1NzlEakhhNUhoT0RD?=
 =?utf-8?B?QUpNM2ZMcTJJaHJUemtGdHVhTW5QdGRuK05USkdJN3R0QURQbk1CTWxPbnhY?=
 =?utf-8?B?ZFA2MVRMZi9NclExemQyNEtYeXRTVTBud3N4d2xHOVlteFZ1eXg5VEhCV0JK?=
 =?utf-8?B?QUlYQWpidHpWVDBHTDZveHc2VUw1N25aU0N4YytuamJVNUVYL3Q5bXZMdzhj?=
 =?utf-8?B?cjhyZ01QUC9DUURNMHZYVEFOZ2tsZXA2ZWNnYVQ2b0VybjV6V0g4d3dKWXpJ?=
 =?utf-8?B?aUxEbUM5SVl4OE4xd2xpZXJNU1ByNy9TNTI2TkhlUzBQQ1llRlZwNk8vbFhM?=
 =?utf-8?Q?k7J+kou5w7Ful8R++gcz2Ck=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93F5AB8BE4AFB144BB7A2866F29EF580@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d093aae-afae-4f87-c0e5-08da8d0bdacb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 17:52:08.0820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XohRtezDl4XRohEB+aJs0OEFvsm+WCVWE49CGJzC0TRTqeaR/kXDhwzMVLOHsMJFldqK/a1BhAquBaHjjtAiriiqVHG4opST+A3MJ6Vk9oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2554
X-Proofpoint-GUID: a200slwcVliIYme9Iq1XFARttcTDOwLY
X-Proofpoint-ORIG-GUID: a200slwcVliIYme9Iq1XFARttcTDOwLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSBmZWVsIGxpa2UgaXQgd291bGQgYmUgZWFzaWVyIHRvIHJldmlldyBpZiB0aGUgZmlyc3QgNCBw
YXRjaGVzIHdlcmUNCnNxdWFzaGVkIHRvZ2V0aGVyLCBidXQgdGhhdOKAmXMgbm90IGEgYmlnIGRl
YWwuDQoNCkZvciB0aGlzIG9uZToNCg0KUmV2aWV3ZWQtYnk6IFJhcGhhZWwgTm9yd2l0eiA8cmFw
aGFlbC5ub3J3aXR6QG51dGFuaXguY29tPg0KDQpPbiBGcmksIEF1ZyAyNiwgMjAyMiBhdCAwNToz
Mjo0MVBNICswMzAwLCBEYW5paWwgVGF0aWFuaW4gd3JvdGU6DQo+IFRoaXMgaXMgdGhlIGZpcnN0
IHN0ZXAgdG93YXJkcyBtb3ZpbmcgYWxsIGRldmljZSBjb25maWcgc2l6ZSBjYWxjdWxhdGlvbg0K
PiBsb2dpYyBpbnRvIHRoZSB2aXJ0aW8gY29yZSBjb2RlLiBJbiBwYXJ0aWN1bGFyLCB0aGlzIGFk
ZHMgYSBzdHJ1Y3QgdGhhdA0KPiBjb250YWlucyBhbGwgdGhlIG5lY2Vzc2FyeSBpbmZvcm1hdGlv
biBmb3IgY29tbW9uIHZpcnRpbyBjb2RlIHRvIGJlIGFibGUNCj4gdG8gY2FsY3VsYXRlIHRoZSBm
aW5hbCBjb25maWcgc2l6ZSBmb3IgYSBkZXZpY2UuIFRoaXMgaXMgZXhwZWN0ZWQgdG8gYmUNCj4g
dXNlZCB3aXRoIHRoZSBuZXcgdmlydGlvX2dldF9jb25maWdfc2l6ZSBoZWxwZXIsIHdoaWNoIGNh
bGN1bGF0ZXMgdGhlDQo+IGZpbmFsIGxlbmd0aCBiYXNlZCBvbiB0aGUgcHJvdmlkZWQgaG9zdCBm
ZWF0dXJlcy4NCj4gDQo+IFRoaXMgYnVpbGRzIG9uIHRvcCBvZiBhbHJlYWR5IGV4aXN0aW5nIGNv
ZGUgbGlrZSBWaXJ0SU9GZWF0dXJlIGFuZA0KPiB2aXJ0aW9fZmVhdHVyZV9nZXRfY29uZmlnX3Np
emUoKSwgYnV0IGFkZHMgYWRkaXRpb25hbCBmaWVsZHMsIGFzIHdlbGwgYXMNCj4gc2FuaXR5IGNo
ZWNraW5nIHNvIHRoYXQgZGV2aWNlLXNwZWNpZmMgY29kZSBkb2Vzbid0IGhhdmUgdG8gZHVwbGlj
YXRlIGl0Lg0KPiANCj4gQW4gZXhhbXBsZSB1c2FnZSB3b3VsZCBiZToNCj4gDQo+ICAgICBzdGF0
aWMgY29uc3QgVmlydElPRmVhdHVyZSBkZXZfZmVhdHVyZXNbXSA9IHsNCj4gICAgICAgICB7LmZs
YWdzID0gMVVMTCA8PCBGRUFUVVJFXzFfQklULA0KPiAgICAgICAgICAuZW5kID0gZW5kb2Yoc3Ry
dWN0IHZpcnRpb19kZXZfY29uZmlnLCBmZWF0dXJlXzEpfSwNCj4gICAgICAgICB7LmZsYWdzID0g
MVVMTCA8PCBGRUFUVVJFXzJfQklULA0KPiAgICAgICAgICAuZW5kID0gZW5kb2Yoc3RydWN0IHZp
cnRpb19kZXZfY29uZmlnLCBmZWF0dXJlXzIpfSwNCj4gICAgICAgICB7fQ0KPiAgICAgfTsNCj4g
DQo+ICAgICBzdGF0aWMgY29uc3QgVmlydElPQ29uZmlnU2l6ZVBhcmFtcyBkZXZfY2ZnX3NpemVf
cGFyYW1zID0gew0KPiAgICAgICAgIC5taW5fc2l6ZSA9IERFVl9CQVNFX0NPTkZJR19TSVpFLA0K
PiAgICAgICAgIC5tYXhfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgdmlydGlvX2Rldl9jb25maWcpLA0K
PiAgICAgICAgIC5mZWF0dXJlX3NpemVzID0gZGV2X2ZlYXR1cmVzDQo+ICAgICB9Ow0KPiANCj4g
ICAgIC8vIGNvZGUgaW5zaWRlIG15X2Rldl9kZXZpY2VfcmVhbGl6ZSgpDQo+ICAgICBzaXplX3Qg
Y29uZmlnX3NpemUgPSB2aXJ0aW9fZ2V0X2NvbmZpZ19zaXplKCZkZXZfY2ZnX3NpemVfcGFyYW1z
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBob3N0
X2ZlYXR1cmVzKTsNCj4gICAgIHZpcnRpb19pbml0KHZkZXYsIFZJUlRJT19JRF9NWURFViwgY29u
ZmlnX3NpemUpOw0KPiANCj4gQ3VycmVudGx5IGV2ZXJ5IGRldmljZSBpcyBleHBlY3RlZCB0byB3
cml0ZSBpdHMgb3duIGJvaWxlcnBsYXRlIGZyb20gdGhlDQo+IGV4YW1wbGUgYWJvdmUgaW4gZGV2
aWNlX3JlYWxpemUoKSwgaG93ZXZlciwgdGhlIG5leHQgc3RlcCBvZiB0aGlzDQo+IHRyYW5zaXRp
b24gaXMgbW92aW5nIFZpcnRJT0NvbmZpZ1NpemVQYXJhbXMgaW50byBWaXJ0aW9EZXZpY2VDbGFz
cywNCj4gc28gdGhhdCBpdCBjYW4gYmUgZG9uZSBhdXRvbWF0aWNhbGx5IGJ5IHRoZSB2aXJ0aW8g
aW5pdGlhbGl6YXRpb24gY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmlpbCBUYXRpYW5p
biA8ZC10YXRpYW5pbkB5YW5kZXgtdGVhbS5ydT4NCj4gLS0tDQo+ICBody92aXJ0aW8vdmlydGlv
LmMgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2h3L3ZpcnRpby92
aXJ0aW8uaCB8ICA5ICsrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3ZpcnRpby5jIGIvaHcvdmlydGlvL3Zp
cnRpby5jDQo+IGluZGV4IDVkNjA3YWVhYTAuLjg1MTgzODIwMjUgMTAwNjQ0DQo+IC0tLSBhL2h3
L3ZpcnRpby92aXJ0aW8uYw0KPiArKysgYi9ody92aXJ0aW8vdmlydGlvLmMNCj4gQEAgLTMwMTQs
NiArMzAxNCwyMyBAQCBzaXplX3QgdmlydGlvX2ZlYXR1cmVfZ2V0X2NvbmZpZ19zaXplKGNvbnN0
IFZpcnRJT0ZlYXR1cmUgKmZlYXR1cmVfc2l6ZXMsDQo+ICAgICAgcmV0dXJuIGNvbmZpZ19zaXpl
Ow0KPiAgfQ0KPiAgDQo+ICtzaXplX3QgdmlydGlvX2dldF9jb25maWdfc2l6ZShjb25zdCBWaXJ0
SU9Db25maWdTaXplUGFyYW1zICpwYXJhbXMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50NjRfdCBob3N0X2ZlYXR1cmVzKQ0KPiArew0KPiArICAgIHNpemVfdCBjb25maWdf
c2l6ZSA9IHBhcmFtcy0+bWluX3NpemU7DQo+ICsgICAgY29uc3QgVmlydElPRmVhdHVyZSAqZmVh
dHVyZV9zaXplcyA9IHBhcmFtcy0+ZmVhdHVyZV9zaXplczsNCj4gKyAgICBzaXplX3QgaTsNCj4g
Kw0KPiArICAgIGZvciAoaSA9IDA7IGZlYXR1cmVfc2l6ZXNbaV0uZmxhZ3MgIT0gMDsgaSsrKSB7
DQo+ICsgICAgICAgIGlmIChob3N0X2ZlYXR1cmVzICYgZmVhdHVyZV9zaXplc1tpXS5mbGFncykg
ew0KPiArICAgICAgICAgICAgY29uZmlnX3NpemUgPSBNQVgoZmVhdHVyZV9zaXplc1tpXS5lbmQs
IGNvbmZpZ19zaXplKTsNCj4gKyAgICAgICAgfQ0KPiArICAgIH0NCj4gKw0KPiArICAgIGFzc2Vy
dChjb25maWdfc2l6ZSA8PSBwYXJhbXMtPm1heF9zaXplKTsNCj4gKyAgICByZXR1cm4gY29uZmln
X3NpemU7DQo+ICt9DQo+ICsNCj4gIGludCB2aXJ0aW9fbG9hZChWaXJ0SU9EZXZpY2UgKnZkZXYs
IFFFTVVGaWxlICpmLCBpbnQgdmVyc2lvbl9pZCkNCj4gIHsNCj4gICAgICBpbnQgaSwgcmV0Ow0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLmggYi9pbmNsdWRlL2h3L3Zp
cnRpby92aXJ0aW8uaA0KPiBpbmRleCBkYjFjMGRkZjZiLi4xOTkxYzU4ZDliIDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8uaA0KPiArKysgYi9pbmNsdWRlL2h3L3ZpcnRp
by92aXJ0aW8uaA0KPiBAQCAtNDQsNiArNDQsMTUgQEAgdHlwZWRlZiBzdHJ1Y3QgVmlydElPRmVh
dHVyZSB7DQo+ICAgICAgc2l6ZV90IGVuZDsNCj4gIH0gVmlydElPRmVhdHVyZTsNCj4gIA0KPiAr
dHlwZWRlZiBzdHJ1Y3QgVmlydElPQ29uZmlnU2l6ZVBhcmFtcyB7DQo+ICsgICAgc2l6ZV90IG1p
bl9zaXplOw0KPiArICAgIHNpemVfdCBtYXhfc2l6ZTsNCj4gKyAgICBjb25zdCBWaXJ0SU9GZWF0
dXJlICpmZWF0dXJlX3NpemVzOw0KPiArfSBWaXJ0SU9Db25maWdTaXplUGFyYW1zOw0KPiArDQo+
ICtzaXplX3QgdmlydGlvX2dldF9jb25maWdfc2l6ZShjb25zdCBWaXJ0SU9Db25maWdTaXplUGFy
YW1zICpwYXJhbXMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBo
b3N0X2ZlYXR1cmVzKTsNCj4gKw0KPiAgc2l6ZV90IHZpcnRpb19mZWF0dXJlX2dldF9jb25maWdf
c2l6ZShjb25zdCBWaXJ0SU9GZWF0dXJlICpmZWF0dXJlcywNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgaG9zdF9mZWF0dXJlcyk7DQo+ICANCj4gLS0g
DQo+IDIuMjUuMQ0KPiA=

