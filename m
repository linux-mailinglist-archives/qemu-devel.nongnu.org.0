Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EA5500551
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 07:08:26 +0200 (CEST)
Received: from localhost ([::1]:36152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neriS-00054w-N7
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 01:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1nerg5-0004Mo-VO
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:05:58 -0400
Received: from esa12.fujitsucc.c3s2.iphmx.com ([216.71.156.125]:55768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyd.fnst@fujitsu.com>)
 id 1nerg3-0008FY-DZ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 01:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1649912756; x=1681448756;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cOYGQIydjZITXrQ4noWWPLPXdW8M8nFQf4NEnD2FgsA=;
 b=tHdsvBaX0P6qKQyjGmoUCiJ4nA9jMVCO7TocdhszZVKuuWNS04LtmqVi
 lp2hI5qY8PH8NqPzv4NANExLB1qMjInHGHFyFONJpS+tXJ3mfsCQCCXqf
 h48NfmyfUg/t5O6Fkd5dxYjBUISPC5m1AIJcL9ez4NptiMkQr7WAwad/F
 mVk7CxO9yKgm8JKRq1dz0IDEkTYrvzwqbNh+D4u6TEib41tZFS8chZkRv
 bfIuUVSClgpysme+lUQrdXygoIBMaA37jyxiM4duuhWsDlcCmvyvjEqIj
 C/M3mlBwhV4eGSJ8B/J8zR1lrz+sAzte09RmCrmIFV3XCgyR7Xdzwj1ik w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="54089185"
X-IronPort-AV: E=Sophos;i="5.90,258,1643641200"; d="scan'208";a="54089185"
Received: from mail-os0jpn01lp2108.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.108])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 14:05:49 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eexSDjR7nvpfB+y+gHtgoPxuAiAlH4Et9tyVIuWZYpYwuhv+RYrulEXXOv6dPERXEYSBwGMGlnUS3vcN3QIHzGqdSxpKV4i/b6AKWd8NRmBg6kZJzRTEeGXxAwkiybs29zABHL56b0QR5p91Ysq7UyWfaQXqS6Sqq2X2JRJoCj8re/3lInY4yz1UE13paZa0z+4MvrLRUbkVFanI1ZVwBV5I07a8nfDQQ22SvgXJpKVfzgfFXMUx0D6E1Eidx+Yw5vbk2kxakanlV/SEcDjglpuUQF8kd8mU5mwaPo7+Tfn1b6P7AcI0bpuZ/C/ha+KGPjd40taoIQ1zMW/EZrQBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOYGQIydjZITXrQ4noWWPLPXdW8M8nFQf4NEnD2FgsA=;
 b=Rgk+FisWgz2PVwFzQoFNzESXLelDZZCwd6mV5ULruY304urlMOnPWK+nRESjRco13R/RyX0x00DzGtkcfdCqwIq/1uGW1GHuP4QQWPAHVSHcz6/fPrG5CyMlgbCiWYV8OAlFX46i45ZXqOcAzKvx+POD3k9g5A8B/WwIoXOB7mrtWoWiB30PNF+eGWZwykftJ/pv7pg2Jmclvbtm+6pvjef7oYWNTkA9QwsSRl/gUcha6FppIkrX3o/ak7Gx338wKD/nfxAHm4GfESWOBCmGR/rBcK61KyeWS4b2MUKP4WwzIclAQ2FvtBdk2tYLzzOzcxYtb4yuoqcGlpMA5TPVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOYGQIydjZITXrQ4noWWPLPXdW8M8nFQf4NEnD2FgsA=;
 b=n1Fu2PyXjK1DN9B6mq+6wWwWi8B6bFQRDrlA7Jfp2Hy2v1X/eHNdQ15HtmDT9jL/SF3FYQozZqhyEICXl2QSufdYiIroC9rHqUC+dWMyMb2QI7qEm2SNFzMnYex1Ge8Z5Z1ejAbVQjmGZziZE3Q4tVg1Yd/fuzJ0DP9KfoDJgCk=
Received: from OS0PR01MB6481.jpnprd01.prod.outlook.com (2603:1096:604:107::13)
 by TY2PR01MB4955.jpnprd01.prod.outlook.com (2603:1096:404:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 05:05:45 +0000
Received: from OS0PR01MB6481.jpnprd01.prod.outlook.com
 ([fe80::15f2:cca0:c6a6:e39f]) by OS0PR01MB6481.jpnprd01.prod.outlook.com
 ([fe80::15f2:cca0:c6a6:e39f%7]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 05:05:45 +0000
From: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] docs: Correct the default thread-pool-size
Thread-Topic: [PATCH] docs: Correct the default thread-pool-size
Thread-Index: AQHYTu3i/2SNjuhH9EapQkf/Uwifj6zu3LmA
Date: Thu, 14 Apr 2022 05:05:45 +0000
Message-ID: <49f55a38-9e28-4af3-49a0-7d1e19a84c64@fujitsu.com>
References: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20220413042054.1484640-1-liuyd.fnst@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a54544e-132f-4ab8-22e8-08da1dd46ea0
x-ms-traffictypediagnostic: TY2PR01MB4955:EE_
x-microsoft-antispam-prvs: <TY2PR01MB49556954AC668B5B7FD74E769BEF9@TY2PR01MB4955.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RyLhtNugBU0RdN6SaWcLZZYgO8BQQLhxnqEZrq2h1vAeFRZ5i/OB9AYozkxxcKDV36UnGL0OJh7EC39fqKTEwzXJ/4SCLz/rm/zAQP3g5HGqyHwsTz5CJl6dkKRIvPJzXlDVWtNqdqyFvRqa5wV4G/gjgge9pGqo1uvLq+DbosmKTdqc/gYWKkcPer2a6Ghf944BOmkPF+8L4Xs+ec1m0T+RMT0aJf32DGfIgF+hAmPwi3G1l5alTv+69tatuBqlmbVFgfjK8tUcPVuNhbh0ZS3riIBfIeJ+FY4tYLb41Ktqy611s4cKHjFTfraGL91Ax6/yLpaJrKkDfrj6/zzVXrKHcgd5Vf8rpjA82fI0o74NFKc9iEGIvzxLwtbM272svwhrlQ4A0GUBG6sJ4X9+wnek+tYtAIc+13Ah2EI18DcQW1LYfD0azFSZAZtwwQSIDUuqsTFpBG8jnrzoGv+W5yihJwFKSZS4okqVuV1r1CX7+OCvXWloCsLgF305QwYUcv1CFKiD6Z40AxKXz6tOEmaO05aBWycdbo+u83TurkbzKHODTt6bZoe0R1ayBEOZUmw56exF+rvGwF7H2zDAe27d6Qms4WRtJgs7akIfp89r6hUN/8gEjfYYU4pIEFUj7eRq9i5UMPUUI67Vn5c63iuV6GQJCvcD7xF4S8L11CKek6sH/ZkxVHzBGcBMiT9HSY9EZ3icTTH5BsOSSxG7YurZaLhTZ7QPITgWjey2K3jq2I28ayZ+lGe+ZZxe5yvB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6481.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(31696002)(2616005)(186003)(86362001)(26005)(76116006)(66946007)(83380400001)(91956017)(71200400001)(6486002)(508600001)(66556008)(6916009)(6512007)(36756003)(6506007)(66446008)(31686004)(85182001)(38070700005)(53546011)(66476007)(5660300002)(8936002)(4744005)(122000001)(38100700002)(4326008)(64756008)(8676002)(82960400001)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YklFVm5SenlIZFo1OVFiVlQ5WUtEbG1remtEWUVxSFdIOEdxaUVuVkhPVG00?=
 =?utf-8?B?dnIrUTZzZ3NraXBQbmlZOVl5ZjVUU01saitETWRTTWlRb2JodlRUSFdSVXZl?=
 =?utf-8?B?Sm5oaGR3T2hYYW1VMjZyUE1ZVnlhaXMrT05OL0dRZml0cCthYXJ1RFpOcU1U?=
 =?utf-8?B?bitvYWFEdEI2Z0lRUmp0RytPZk5LSUh6WTFxOVl6c0VpVU5xMEJlSU9rTllm?=
 =?utf-8?B?cEdwRVNsbEhDd1ViNEN1UmFCNGovVy9HdDV5V3FDS2VaQkYraFM0dE42OGk3?=
 =?utf-8?B?MEJKRkU0YzlDdHhnSktGaE1CRmhhUVFiV2d2T0wrTDRKSnc5bGx3b202M3h6?=
 =?utf-8?B?T2xCblB0Snp3U3BqTTVjVEFUQ3FsRDNETmEzcFZYUWlYWTBaamNjN1dTQVMx?=
 =?utf-8?B?RU4xazVBeVRVbEUxOTRyVllFYjkyVDlYcW5yQ3duVy8vMHhlMGwrTzNtRW5i?=
 =?utf-8?B?Q1JHOS8yanBRVzdFZ2JmMDlkcDlqTGdBbDg5ZThwcFFCSmpHZzJ1UzE1NmJR?=
 =?utf-8?B?Zk9xanh6VndOaEtkVTFEV09vSnJkTTBMTnAxM1FVU0RGdTVJcEdMT1QrcjlU?=
 =?utf-8?B?OUVSSytXZGcrRGtjUHo0K2R0c3pmaGx6c1FpaElzTVY0UE1DK3NLS0lIaWlw?=
 =?utf-8?B?VWp4OXpWM2ZrL21BMWlwUE52bzFQL1YrdDhzbjVWbml3OVhQOHJUbVB3bFlm?=
 =?utf-8?B?TEo0MHJoMHpJYTF0K1hXd3VKUWxSWHQvb1c3cWV1T042ZnRVSm5MSDlFTTJB?=
 =?utf-8?B?U1BMcVNLYXlBK2FsQWtFM3JpcDJ5SHNJZmNNUGp4L0xiU3VHR2hWYituTjNv?=
 =?utf-8?B?UVNXSGxORWpSdjBQeG9zS003M2JXOTA3SWRIVHQ3OVdva3BrcHhkTElsQXdC?=
 =?utf-8?B?eFVNMVRBSG9wQTErTTkyV0l3YjZyeC96TFhEVnVob0NISGs0dlJpdzF6NndC?=
 =?utf-8?B?SWsrYmt0Z2g3ZEJTTjJKU0RqWkx5MllUM0xOZHEwdlhtcXZzVzBkcnRZWjFq?=
 =?utf-8?B?SG9VRFViTHk0clZPb2psczlWV2VBMlZPYU9DUzJxVTRDUW1NUmtaWUFhZ1B6?=
 =?utf-8?B?eG50Q0FieEQvWTR1ZTBSMkNHelYvZzJibjExanhuNlZET0J1VjZIVTJucnhK?=
 =?utf-8?B?YXB1Z1I5OFJnbHRaMjFWMDkwbU11c0phMjJOYWlOMzRFaUJ5aXlhSmd6SXZO?=
 =?utf-8?B?UU5Fb0hWWVRJMFhXcHppbHlYOEIvVEZnVy80L2lDaXJ5Um8xY1NqOXVnNzFh?=
 =?utf-8?B?ZUNUMWRTL05hT3NqczcxU2tISTk5aG5LUnRMb0lpSmtxLzYvVUJBMVJVTG5K?=
 =?utf-8?B?RittNk9oNFJJeUF2REN3ZVVtOTUvUUNxVXRuY1plVlk0SzVRMEhKRXJtYzMw?=
 =?utf-8?B?SVBCUHhaelN5U0ZoM2Y1c1pBc2lGa1F6dUVTZHMrWW5nOFNsZ1pUcXJweHYz?=
 =?utf-8?B?VFZCdnFKK1ZFYnFBUHNBLy9RZVZwL1JMSGxPWWI4b0VTc3ovb0dQVlVzb1M0?=
 =?utf-8?B?OEtIRWQ4RzlEOTVadVY1TGYxdTVRQW5EUnRjNVo3dHJ3N3ZOdlJET3V0dTdw?=
 =?utf-8?B?RkNpTlR2REhCWFFMLzdwOS9xVGZ3QU1LMStWZmw5K0ZTaXFlMmErWElyYWhO?=
 =?utf-8?B?K25iaWJKUjVieFhuYUs1S2d4bEd6SmgxWDg3TTdheURZU0VsY3VoeG0yU1dH?=
 =?utf-8?B?YTNaZWoxUWh4bGxWRjJHQ2NjTE5rMUZ5LzZMSFc1dUppZS9CVytibXNwRHk2?=
 =?utf-8?B?Z3NOTDdHNVNESVFkN1BXMlRtKzV0YjJGMUoyWkFTMkxKMDNxTWdHUE5oYmxy?=
 =?utf-8?B?VlhWaCs5Ty82SlJXSWtBT3lzS0JadXc2aVdmcXg4MFJkRklaSGw1VktkS1lY?=
 =?utf-8?B?V1Q0UElLQWlVVG1KbXoxYWFnajBvREtuaU5zMDNCaG0yWTI2UWhMQ1E0YndT?=
 =?utf-8?B?clZPVk4zNHE1ZXNQblQ1anJOMmJpRU1mNzlYanRzWGptSURGMVFzOXoxRHY4?=
 =?utf-8?B?MkZjL3BUcGhKZ09yUU1hbWJybnBSUThENFpSRll0M2RjcVNXSVBVcFoyWjRI?=
 =?utf-8?B?cVhiazhMRFZQSUFaWjFGdGlzdzd1dTNkMVZoSFBZZFg1T29WRVc5UURYTndJ?=
 =?utf-8?B?ZkErejExUlZwVkEyWkpkNDM4YXR1ZGwxRW5xMXJoQjExRXRTWnBMUFJxMVB5?=
 =?utf-8?B?dndyeis4dnJmUEFJYjVrR3RLMk1ZUzJFdU9OWVlFWWdLZURmQm4xWDJYYzFp?=
 =?utf-8?B?RG9yN0swSlVRdVdTakt5YjU2SkJ4TWgzd3JUZCtQbUJ0cnI0Zm5vaFRBdm9r?=
 =?utf-8?B?TXoxMFdJZFJyVlRWdE1IR3A1c1pzM2FneDRXOTVhVGdxZWlkWHc2TlBmU25P?=
 =?utf-8?Q?9VqaQAi1IFICPtfY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4B10236093C0049A662E7B56FF0A7BC@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6481.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a54544e-132f-4ab8-22e8-08da1dd46ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 05:05:45.2138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bwRaO2JrR+kItgpvQL6ToqKyKFlSkj9NBi77JLTEhclA2QxbMR0zuX4buSSzJ/BUjjzZChnHH6nJV7HKz3iB9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4955
Received-SPF: pass client-ip=216.71.156.125;
 envelope-from=liuyd.fnst@fujitsu.com; helo=esa12.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "vgoyal@redhat.com" <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

WytjYyB2Z295YWxAcmVkaGF0LmNvbV0NCg0KT24gNC8xMy8yMiAxMjoyMCBQTSwgTGl1IFlpZGlu
ZyB3cm90ZToNCj4gUmVmZXIgdG8gMjZlYzE5MDk2NCB2aXJ0aW9mc2Q6IERvIG5vdCB1c2UgYSB0
aHJlYWQgcG9vbCBieSBkZWZhdWx0DQo+DQo+IFNpZ25lZC1vZmYtYnk6IExpdSBZaWRpbmcgPGxp
dXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgIGRvY3MvdG9vbHMvdmlydGlvZnNkLnJz
dCB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RvY3MvdG9vbHMvdmlydGlvZnNkLnJzdCBiL2RvY3MvdG9v
bHMvdmlydGlvZnNkLnJzdA0KPiBpbmRleCAwYzA1NjAyMDNjLi4zM2ZlZDA4YzZmIDEwMDY0NA0K
PiAtLS0gYS9kb2NzL3Rvb2xzL3ZpcnRpb2ZzZC5yc3QNCj4gKysrIGIvZG9jcy90b29scy92aXJ0
aW9mc2QucnN0DQo+IEBAIC0xMjcsNyArMTI3LDcgQEAgT3B0aW9ucw0KPiAgIC4uIG9wdGlvbjo6
IC0tdGhyZWFkLXBvb2wtc2l6ZT1OVU0NCj4gICANCj4gICAgIFJlc3RyaWN0IHRoZSBudW1iZXIg
b2Ygd29ya2VyIHRocmVhZHMgcGVyIHJlcXVlc3QgcXVldWUgdG8gTlVNLiAgVGhlIGRlZmF1bHQN
Cj4gLSAgaXMgNjQuDQo+ICsgIGlzIDAuDQo+ICAgDQo+ICAgLi4gb3B0aW9uOjogLS1jYWNoZT1u
b25lfGF1dG98YWx3YXlzDQo+ICAgDQoNCi0tIA0KQmVzdCBSZWdhcmRzLg0KWWlkaW5nIExpdQ0K

