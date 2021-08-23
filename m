Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EE3F46CA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:46:05 +0200 (CEST)
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5am-0004BN-KH
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI5Xs-0001Ba-F5
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:43:06 -0400
Received: from esa5.fujitsucc.c3s2.iphmx.com ([68.232.159.76]:51791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI5Xq-00028w-AH
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629708183; x=1661244183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1Pjh+MNLrrfEM1fyU7JjmnkBFwPrDn55zGkmEzNKC10=;
 b=qb6oreUN4UDw9I4jr8YrP5Z9NykLe9cfQ/Cs0/jvX4N51h/dxQB3U45z
 4al65tihSSAsYetdo/5zMVlFbzuG1i4eOqhmDtOnNqydjoUI+ensxtGxv
 PnKTpqEjIUaSBmHIBAVDpCyWvuEZ1Wo63pdIq46BQ/BpE28r8MWvFRsJx
 5PU+8ZSOBmDuDYoQhnxe+IcVsZuCBQCJvVhU3xY+dAztSt+DtssFtfFNi
 5Vt/94D7BUERlzXTkOJFh7WWZ5i7386bzftFg5mBhrtzNmWjHZs9mcTVT
 V2QONTq5bvI0jNiWXXjMvf8vyEmrxm+KtLpXP8zQiUdq78Q0IIu8DtC7j A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="37412033"
X-IronPort-AV: E=Sophos;i="5.84,344,1620658800"; d="scan'208";a="37412033"
Received: from mail-ty1jpn01lp2055.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.55])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 17:42:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LygQ+E/1fSgBTAMwvqOAfBRAgVHTwTFHxlc/s2S1n5i8MshBLQP5BnF+PkPY1cA8BA2we5B9GY1tKbLakNWE1ODnJEV1JnN3/H6AvjrLryQpHdmyx3qsw0IMmciESJWEbheladfX3BVnjJYxU++BNuEXBjS/HaVB/0Q7Xill1Vn3zXBOxSFxpN6ShCk5KtTnEiK7vgpIpoZzeZeMZxvP9lXZsHfWHkJ8QR72trvcrYye5R83UOtQyFdsAuPNM1kjIB3hzb49L5TIZZoageHoR/cD5Z1ga7+KnOXg2PRByW2vWZ+ZXswJvIhP3LbK95T+HxJrKgxBD58N8o+0NxdvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pjh+MNLrrfEM1fyU7JjmnkBFwPrDn55zGkmEzNKC10=;
 b=TJbdSnZ+EWMkMOk5RecqrnI/0adPu57EKlcuvnR9aLtvA9l5eF5e9Y8agFfIB4iVu3LtX9L+U4j4ekZvDRTaRvpxUYnjLH1oLCpbRN2+nGSP27zKusSNfFKQv9I4aa6ZoThNSfPSHiCfNkoMdURhZzb/H4Kl836DJo0Iv1hlizRJ/hWgkS00fJ8y7NNlwUCNk65EfcFVNSBA30anJnybrAWYtPnavOZzfn2bT3amRLrNOAkiV+23KfDxlveHay0rgLIOc5DBxSatLvZkAENqxpy0r+nhN7M7xYfjfYcyyvAdqAJ/5SQklVYOYnZR0QGLKN6Ni2rFkopyEmWTCAi2DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pjh+MNLrrfEM1fyU7JjmnkBFwPrDn55zGkmEzNKC10=;
 b=CmIDPOUXhEtFXuS7x+BIHYMIf1Gwhk859M9b48FhMTN5n44GWfLPbOw2ynbYWTZly16gxlsm+ho/C2zXzkylnTsFpjo9pmppbAdr/Ppd1KwEgUzn5rz+9lO518xmkynivHMtPLjZsMAd59ONsk+nuibqaRfvOwrRW1Xt/t8wshI=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7405.jpnprd01.prod.outlook.com (2603:1096:604:11f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 08:42:55 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634%6]) with mapi id 15.20.4415.024; Mon, 23 Aug 2021
 08:42:55 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 2/2] migration/rdma: advise prefetch write for ODP
 region
Thread-Topic: [PATCH v2 2/2] migration/rdma: advise prefetch write for ODP
 region
Thread-Index: AQHXl88fACppJFhb9Uq9uhT6FJH0C6uAxZCA
Date: Mon, 23 Aug 2021 08:42:55 +0000
Message-ID: <6261ee2f-5093-237d-0b3e-232e46eb326e@fujitsu.com>
References: <20210823033358.3002-1-lizhijian@cn.fujitsu.com>
 <20210823033358.3002-3-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210823033358.3002-3-lizhijian@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33b0c730-c973-4c52-7d00-08d966120097
x-ms-traffictypediagnostic: OS3PR01MB7405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB7405B4364705F66A3CA1D85BA5C49@OS3PR01MB7405.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:64;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dS+QWr0cqHVXHTtr8IHIMU7d0T6A0jxqDfc7eXUlfxU+91rz73LB2b/jEACmBlSapXJeF5Ab1oYCsIvk9+Htp/hxa4g0lVW/nBgae77CJBmGj0WsIjquorgWuoY5qOCbj8LaoOMfwA9OUKKk3+2g3boL+6ZUHVzkaBMmen2lKc0pxrT2L86sTX3Vz+1GCILEDCqv7RnC2G0hZ5dvelJO8qYXPg84XvFL3+A6SuNLkVS3+6n9DQ+PQDKaE1HwPQVWPi/rRfPxW2g86gDj+mSatYzKrWzFxJFr2J5hDC8C6b1t6TgaIeICzOS+NlSVc0PD1HhkVFJ+IcbouGOz2rKNi3l5ClnScilBKL1weyE4NTd5yteN/NR6Ve+iIHh6ycH0l7CbOCt2JEMV6qJDjrOVhtWMQ3jQUM2zQ+NxuC7Mqpc8/Yx4n1Rhds6SX11TrEsHNdf42NrzL3w3xASAWdniAUV7+mKbInaMU3OJKzV+GfW08npPkIGnsHj+wAeSjCyd/khNs5bTAoHiBPb79wUzmyvQ1BBWW8fru6x3bKzm7O7u4RWsbXb9RFAnoQwN0ChnimWmEs+aY3xTV99XyLuwt1qokabJ7t5PbWwWjv9fq5wWGv0Eu+pKHPWbyLRijC+POmXa5Wz60BPPFcNVTSkbiiGKzIhelIvuZsbjPgWuD/ThjPsHpvZOKDwaSKHzEmVaoGTgdcOqiJScbyERYDPk9LPEhkYWQaywKZQ8Os4sSp9PnK/xX7u2b8r75gBV/ZTrl0UNk6gCheivHJk5uni/VA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(478600001)(31696002)(110136005)(31686004)(2906002)(316002)(38070700005)(86362001)(85182001)(4326008)(6506007)(2616005)(53546011)(38100700002)(122000001)(5660300002)(66446008)(66476007)(8936002)(76116006)(6486002)(8676002)(91956017)(66946007)(6512007)(71200400001)(83380400001)(36756003)(64756008)(66556008)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEpPNFp0bWhKWVhJVnB1R05oUktPUjdlZDFQL2d1emRHclVNUEFvQVQ2V0FX?=
 =?utf-8?B?YTJrTjBLaDRMNThTSG9SRC9tMXRFc3pUREdBRWw4MHdQTS9rSTVYeEorL2NM?=
 =?utf-8?B?a2NlekE5MGpkZlhFSmt2K3dUQ29CK0hHMFNBZHVWSmVMTSswOGhHUzhLVVFr?=
 =?utf-8?B?NWppckZObVQwUEg0dVdDY1hNU0gxdzFNVTd5S00zZzZwN2ZPN2E0NW5RUDZI?=
 =?utf-8?B?SFpHNzVnbCs4TkpKUHdsZ21FekdCdk1jeEErRkEzaXVHaWRLL2U5eFYrN0d3?=
 =?utf-8?B?ek5vZDNCTXkvSE5ZTjUvTklJcjJtMEZrYmtRdWszUGlpMGhUdVNEMExwRFc1?=
 =?utf-8?B?aXdkamJCTXNKSGt5Qng5TjkyZUp2SG9zT253K09JdWFEOVd0MS9CUFduZFdr?=
 =?utf-8?B?OE94c3YzbnU2ZHNXZGNCNHpHZmk1R21ZRkxLaHhwc0ltaFloTDJsNjRhYkdX?=
 =?utf-8?B?ZzNxRkhOckNBcmsvWjVyYTZUd25BSHpQemsxZEJLRXE3Skk4YUIzODV2ZVNE?=
 =?utf-8?B?K3ZZZVMrWnpvOVRDY2lBSzErOThCeS92Q3NnamNuV0wrcFVkdEM3MjBteU9p?=
 =?utf-8?B?Y3c1T2pjSG1WVk51UHM5VmFVRm5DV1gxcFh2enZHSFlETkJiQUpxOGpVUjZR?=
 =?utf-8?B?MjQzMzhhMmdyTGtLNktzblJjc0t3L3Frc09GMHpxMjNMMFdtb1I3NW10bnRp?=
 =?utf-8?B?V0pGcTBvVDRseURYNnVDWEUydmorekJ3aXdURm5GaDc3ZHcrVWJiazF3RGMx?=
 =?utf-8?B?eWtMR1ZNVVkyUE9VVUIwR3hBNnp1eTYxamNpRVhISWZUZWZ2azgrUnAySExX?=
 =?utf-8?B?d0xiZkE5K3ljcmEzSGZHREJsNFROdHVoZnVRWk9ndHVyem9oSXVDWUJoK3RZ?=
 =?utf-8?B?dFVYaEZIaFA2ZXBpa3ZvZzlmWlMrb1Y4NGxJU0d5SFZDOVpldXl6OFVHUXg4?=
 =?utf-8?B?MUtYd1Q3L2ZFMVJZdmtnem1RT1NHZnhvSjhmS1hyK240QlZyWEt4aHFGemRT?=
 =?utf-8?B?UUw2aDdGVnN1N2dGSWd4WTZ4SW50TzZsL3JRNXNWMXoxcTM5Z2hHbjhWbG9M?=
 =?utf-8?B?RFkyZGtQVW5jdWNtNzdURmFDVlpoZTByWFV1MEFVTStFai94NW0yM3I3Zkww?=
 =?utf-8?B?eUJWNFI1VzNzbnFrNEx3U0w5Y1VXaWd0UlAzd0FwZ1JYVVVKVFE3VkJqd05M?=
 =?utf-8?B?UFpCNXVkQ0cyL0dpd1lXNnhrWGVJTWVHZ2xydm5mV0F6UlFiWU9WckxuNXhV?=
 =?utf-8?B?WnRTZVp5b1dRR2JVc0s2WUZWeTZVeEZReko2ZnBOenN2ZjdabjhQTi9lTHdW?=
 =?utf-8?B?Vm1xWWo0OWo3YWpKNldNL3ZLQnpjSitBQ0NLb0h3R0JDNDc3WjlXZWkrd0JI?=
 =?utf-8?B?cGZIRVpTL1RNUVV5UlJLN1AvWEdaUEN0MlZUa0I3Um83VVFReXl5MHZHbDhY?=
 =?utf-8?B?Qzg2RTlhOXZROHBuTW5kR0lnWEgxUHdSRVg0NnFNVjdzN0pXUDUwMi9GR1pZ?=
 =?utf-8?B?ZE1MbjdBbGVqcHFYNjFWT205djdSSEJGY2E2d1huT2swWW1UMXdiL28rSXp4?=
 =?utf-8?B?cWpwOVAydjNGbWV0UXZCWFY1VXZTTjZ2SFFQT0R4c1Bqc3dieUlGZ1N4eTNX?=
 =?utf-8?B?bUZjN0FFUklPTGc0WEdkNG1lUURETmZPWGtiSk9kTTRMckw2ZTJ0T3lnS3d3?=
 =?utf-8?B?U2xyWk1aUEREanNMMzJ0bmFUK1B3cVhmT0hReDhkbnM4WHZqakRaMjVUelVD?=
 =?utf-8?Q?QJ86SpZEFh2jxQxrefKa/tLDtuO9Mv7YdqXs+J2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0798B32786C5C4EB972F66AFD82B2F8@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b0c730-c973-4c52-7d00-08d966120097
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 08:42:55.4480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBz9a56i1Lb79KEK74hGtqYs0ujhTW0gsCq6ZAELjKempBsngUUdt/RZjGx3pqzzc37SBE/rxT2DmEAyd7eZVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7405
Received-SPF: pass client-ip=68.232.159.76; envelope-from=lizhijian@fujitsu.com;
 helo=esa5.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.959,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q0NpbmcgTWFyY2VsDQoNCg0KT24gMjMvMDgvMjAyMSAxMTozMywgTGkgWmhpamlhbiB3cm90ZToN
Cj4gVGhlIHJlc3BvbmRlciBtciByZWdpc3RlcmluZyB3aXRoIE9EUCB3aWxsIHNlbnQgUk5SIE5B
SyBiYWNrIHRvDQo+IHRoZSByZXF1ZXN0ZXIgaW4gdGhlIGZhY2Ugb2YgdGhlIHBhZ2UgZmF1bHQu
DQo+IC0tLS0tLS0tLQ0KPiBpYnZfcG9sbF9jcSB3Yy5zdGF0dXM9MTMgUk5SIHJldHJ5IGNvdW50
ZXIgZXhjZWVkZWQhDQo+IGlidl9wb2xsX2NxIHdyaWQ9V1JJVEUgUkRNQSENCj4gLS0tLS0tLS0t
DQo+IGlidl9hZHZpc2VfbXIoMykgaGVscHMgdG8gbWFrZSBwYWdlcyBwcmVzZW50IGJlZm9yZSB0
aGUgYWN0dWFsIElPIGlzDQo+IGNvbmR1Y3RlZCBzbyB0aGF0IHRoZSByZXNwb25kZXIgZG9lcyBw
YWdlIGZhdWx0IGFzIGxpdHRsZSBhcyBwb3NzaWJsZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTGkg
WmhpamlhbiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiBSZXZpZXdlZC1ieTogTWFyY2Vs
IEFwZmVsYmF1bSA8bWFyY2VsLmFwZmVsYmF1bUBnbWFpbC5jb20+DQo+DQo+IC0tLQ0KPiBWMjog
dXNlIElCVl9BRFZJU0VfTVJfRkxBR19GTFVTSCBpbnN0ZWFkIG9mIElCX1VWRVJCU19BRFZJU0Vf
TVJfRkxBR19GTFVTSA0KPiAgICAgIGFuZCBhZGQgUmV2aWV3ZWQtYnkgdGFnLiAjIE1hcmNlbA0K
PiAtLS0NCj4gICBtaWdyYXRpb24vcmRtYS5jICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgIG1pZ3JhdGlvbi90cmFjZS1ldmVudHMgfCAgMSAr
DQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQg
YS9taWdyYXRpb24vcmRtYS5jIGIvbWlncmF0aW9uL3JkbWEuYw0KPiBpbmRleCBlYjgwNDMxYWFl
Mi4uNmMyY2MzZjYxN2MgMTAwNjQ0DQo+IC0tLSBhL21pZ3JhdGlvbi9yZG1hLmMNCj4gKysrIGIv
bWlncmF0aW9uL3JkbWEuYw0KPiBAQCAtMTEzMyw2ICsxMTMzLDMwIEBAIHN0YXRpYyBib29sIHJk
bWFfc3VwcG9ydF9vZHAoc3RydWN0IGlidl9jb250ZXh0ICpkZXYpDQo+ICAgICAgIHJldHVybiBm
YWxzZTsNCj4gICB9DQo+ICAgDQo+ICsvKg0KPiArICogaWJ2X2FkdmlzZV9tciB0byBhdm9pZCBS
TlIgTkFLIGVycm9yIGFzIGZhciBhcyBwb3NzaWJsZS4NCj4gKyAqIFRoZSByZXNwb25kZXIgbXIg
cmVnaXN0ZXJpbmcgd2l0aCBPRFAgd2lsbCBzZW50IFJOUiBOQUsgYmFjayB0bw0KPiArICogdGhl
IHJlcXVlc3RlciBpbiB0aGUgZmFjZSBvZiB0aGUgcGFnZSBmYXVsdC4NCj4gKyAqLw0KPiArc3Rh
dGljIHZvaWQgcWVtdV9yZG1hX2FkdmlzZV9wcmVmZXRjaF9tcihzdHJ1Y3QgaWJ2X3BkICpwZCwg
dWludDY0X3QgYWRkciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgbGVuLCAgdWludDMyX3QgbGtleSwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSwgYm9vbCB3cikNCj4gK3sNCj4g
KyAgICBpbnQgcmV0Ow0KPiArICAgIGludCBhZHZpY2UgPSB3ciA/IElCVl9BRFZJU0VfTVJfQURW
SUNFX1BSRUZFVENIX1dSSVRFIDoNCj4gKyAgICAgICAgICAgICAgICAgSUJWX0FEVklTRV9NUl9B
RFZJQ0VfUFJFRkVUQ0g7DQo+ICsgICAgc3RydWN0IGlidl9zZ2Ugc2dfbGlzdCA9IHsubGtleSA9
IGxrZXksIC5hZGRyID0gYWRkciwgLmxlbmd0aCA9IGxlbn07DQo+ICsNCj4gKyAgICByZXQgPSBp
YnZfYWR2aXNlX21yKHBkLCBhZHZpY2UsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBJQlZf
QURWSVNFX01SX0ZMQUdfRkxVU0gsICZzZ19saXN0LCAxKTsNCj4gKyAgICAvKiBpZ25vcmUgdGhl
IGVycm9yICovDQo+ICsgICAgaWYgKHJldCkgew0KPiArICAgICAgICB0cmFjZV9xZW11X3JkbWFf
YWR2aXNlX21yKG5hbWUsIGxlbiwgYWRkciwgc3RyZXJyb3IoZXJybm8pKTsNCj4gKyAgICB9IGVs
c2Ugew0KPiArICAgICAgICB0cmFjZV9xZW11X3JkbWFfYWR2aXNlX21yKG5hbWUsIGxlbiwgYWRk
ciwgInN1Y2Nlc3NlZCIpOw0KPiArICAgIH0NCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgcWVt
dV9yZG1hX3JlZ193aG9sZV9yYW1fYmxvY2tzKFJETUFDb250ZXh0ICpyZG1hKQ0KPiAgIHsNCj4g
ICAgICAgaW50IGk7DQo+IEBAIC0xMTU2LDYgKzExODAsMTUgQEAgc3RhdGljIGludCBxZW11X3Jk
bWFfcmVnX3dob2xlX3JhbV9ibG9ja3MoUkRNQUNvbnRleHQgKnJkbWEpDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5sb2NhbF9ob3N0X2FkZHIsDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5sZW5ndGgs
IGFjY2Vzcyk7DQo+ICAgICAgICAgICAgICAgICAgIHRyYWNlX3FlbXVfcmRtYV9yZWdpc3Rlcl9v
ZHBfbXIobG9jYWwtPmJsb2NrW2ldLmJsb2NrX25hbWUpOw0KPiArDQo+ICsgICAgICAgICAgICAg
ICAgaWYgKGxvY2FsLT5ibG9ja1tpXS5tcikgew0KPiArICAgICAgICAgICAgICAgICAgICBxZW11
X3JkbWFfYWR2aXNlX3ByZWZldGNoX21yKHJkbWEtPnBkLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKHVpbnRwdHJfdClsb2NhbC0+YmxvY2tbaV0ubG9jYWxfaG9zdF9h
ZGRyLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9jYWwtPmJsb2Nr
W2ldLmxlbmd0aCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2Fs
LT5ibG9ja1tpXS5tci0+bGtleSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxvY2FsLT5ibG9ja1tpXS5ibG9ja19uYW1lLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdHJ1ZSk7DQo+ICsgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICAg
fQ0KPiAgIA0KPiAgICAgICAgICAgaWYgKCFsb2NhbC0+YmxvY2tbaV0ubXIpIHsNCj4gQEAgLTEy
NTUsNiArMTI4OCwxMyBAQCBzdGF0aWMgaW50IHFlbXVfcmRtYV9yZWdpc3Rlcl9hbmRfZ2V0X2tl
eXMoUkRNQUNvbnRleHQgKnJkbWEsDQo+ICAgICAgICAgICAgICAgLyogcmVnaXN0ZXIgT0RQIG1y
ICovDQo+ICAgICAgICAgICAgICAgYmxvY2stPnBtcltjaHVua10gPSBpYnZfcmVnX21yKHJkbWEt
PnBkLCBjaHVua19zdGFydCwgbGVuLCBhY2Nlc3MpOw0KPiAgICAgICAgICAgICAgIHRyYWNlX3Fl
bXVfcmRtYV9yZWdpc3Rlcl9vZHBfbXIoYmxvY2stPmJsb2NrX25hbWUpOw0KPiArDQo+ICsgICAg
ICAgICAgICBpZiAoYmxvY2stPnBtcltjaHVua10pIHsNCj4gKyAgICAgICAgICAgICAgICBxZW11
X3JkbWFfYWR2aXNlX3ByZWZldGNoX21yKHJkbWEtPnBkLCAodWludHB0cl90KWNodW5rX3N0YXJ0
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZW4sIGJs
b2NrLT5wbXJbY2h1bmtdLT5sa2V5LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBibG9jay0+YmxvY2tfbmFtZSwgcmtleSk7DQo+ICsNCj4gKyAgICAgICAg
ICAgIH0NCj4gICAgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgICAgICBpZiAoIWJsb2NrLT5wbXJb
Y2h1bmtdKSB7DQo+IGRpZmYgLS1naXQgYS9taWdyYXRpb24vdHJhY2UtZXZlbnRzIGIvbWlncmF0
aW9uL3RyYWNlLWV2ZW50cw0KPiBpbmRleCA1ZjZhYTU4MGRlZi4uYThhZTE2MzcwN2MgMTAwNjQ0
DQo+IC0tLSBhL21pZ3JhdGlvbi90cmFjZS1ldmVudHMNCj4gKysrIGIvbWlncmF0aW9uL3RyYWNl
LWV2ZW50cw0KPiBAQCAtMjEzLDYgKzIxMyw3IEBAIHFlbXVfcmRtYV9wb2xsX290aGVyKGNvbnN0
IGNoYXIgKmNvbXBzdHIsIGludDY0X3QgY29tcCwgaW50IGxlZnQpICJvdGhlciBjb21wbGV0DQo+
ICAgcWVtdV9yZG1hX3Bvc3Rfc2VuZF9jb250cm9sKGNvbnN0IGNoYXIgKmRlc2MpICJDT05UUk9M
OiBzZW5kaW5nICVzLi4iDQo+ICAgcWVtdV9yZG1hX3JlZ2lzdGVyX2FuZF9nZXRfa2V5cyh1aW50
NjRfdCBsZW4sIHZvaWQgKnN0YXJ0KSAiUmVnaXN0ZXJpbmcgJSIgUFJJdTY0ICIgYnl0ZXMgQCAl
cCINCj4gICBxZW11X3JkbWFfcmVnaXN0ZXJfb2RwX21yKGNvbnN0IGNoYXIgKm5hbWUpICJUcnkg
dG8gcmVnaXN0ZXIgT24tRGVtYW5kIFBhZ2luZyBtZW1vcnkgcmVnaW9uOiAlcyINCj4gK3FlbXVf
cmRtYV9hZHZpc2VfbXIoY29uc3QgY2hhciAqbmFtZSwgdWludDMyX3QgbGVuLCB1aW50NjRfdCBh
ZGRyLCBjb25zdCBjaGFyICpyZXMpICJUcnkgdG8gYWR2aXNlIGJsb2NrICVzIHByZWZldGNoIGF0
ICUiIFBSSXUzMiAiQDB4JSIgUFJJeDY0ICI6ICVzIg0KPiAgIHFlbXVfcmRtYV9yZWdpc3RyYXRp
b25faGFuZGxlX2NvbXByZXNzKGludDY0X3QgbGVuZ3RoLCBpbnQgaW5kZXgsIGludDY0X3Qgb2Zm
c2V0KSAiWmFwcGluZyB6ZXJvIGNodW5rOiAlIiBQUklkNjQgIiBieXRlcywgaW5kZXggJWQsIG9m
ZnNldCAlIiBQUklkNjQNCj4gICBxZW11X3JkbWFfcmVnaXN0cmF0aW9uX2hhbmRsZV9maW5pc2hl
ZCh2b2lkKSAiIg0KPiAgIHFlbXVfcmRtYV9yZWdpc3RyYXRpb25faGFuZGxlX3JhbV9ibG9ja3Mo
dm9pZCkgIiINCg==

