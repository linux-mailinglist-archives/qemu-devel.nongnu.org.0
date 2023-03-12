Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F096B6CB4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 00:58:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbVZo-0004wG-Ka; Sun, 12 Mar 2023 19:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4282d8238=wilfred.mallawa@wdc.com>)
 id 1pbVZm-0004w4-Fq; Sun, 12 Mar 2023 19:58:06 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4282d8238=wilfred.mallawa@wdc.com>)
 id 1pbVZj-0005hy-5T; Sun, 12 Mar 2023 19:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678665483; x=1710201483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gBtK7bcon/v299fhkk8aUVGV5yBnWwPiEtUZM97M4DA=;
 b=JmffpqgRfdoL2KcxSncg5MH/K1+baXli8WEZ87dn+6Gv7PHFQR5Dw/1E
 fZgUzhpEUlaUkzd4zyjFaJ8tPZnY4DgkdyMLb+Cvp7mZdyDca41xiP/nY
 hzMvIu6TYs+sbAvTpXwclte2XReipTgbXLu3w6NoCOqhfJGg31jXgj8eU
 xfQNShPB1gtC5A+zE/rz6BQmk45RAmlcYcoz5syuhNq8u8EAIX3eA+uJJ
 G+/G9rXhYAVqnxv1TvIgIZ9UnHGvc2RaYNHm2iSZCYQTWf4MckgLUAfoz
 wTVtMMO8W1b+k/39Xy0Fct0UnadCpaHshGwr4LCTNUOrEzc9qtFXWH1wU g==;
X-IronPort-AV: E=Sophos;i="5.98,254,1673884800"; d="scan'208";a="329828352"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2023 07:57:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLeAS/OVruc2wuFd3XZHHOaJ27w5vGRV7H8qOj+SMXN1t5boP7GvkVAGqEaZEaYrlLpWwApmXC210kQP2CRmYs1Y1tZoiiBkBSkUTdsZI9ekNw/ng7N/BruqMy8+sXf3UEbIUgqAqsvII+qZiTNSde0E/KGkfjQZULpnixyLf4GCZMkl31BBsYI2ql1RMcmTyDAlFKsEdY4yJTpBYq1DvEZo94REoKeLmUJ4saIL1oMsdPUafN5K8Dc1h5+yazUnwChQBs/bnhknB+GHejmTjf7DvZmWnWn4itoPOOZ8Y3eV9obr9bHyEmXZlx7DbrM7F2fZ6YxGiGsWgtDdPl8RiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBtK7bcon/v299fhkk8aUVGV5yBnWwPiEtUZM97M4DA=;
 b=H+S6y2Zohr98Y7LEPIASXoOiT/rGNqAQfIGx6Zj9+ZNU/sH8JmwalxqXr3/1YVdd6t1CPGuozOCz2q/PWAfVytL7644RnEPCJ4+tdMessGlc2HBbIbJgN5rw6IDjQvNbHZ8w+Bj4wmde4z0LK448mit2ydfhKBAjCczYrS2HzMIr3vUX99aBZCTTmclDgbUpChAWuIjfbWJA1jHKM/A9fFhWaXe9BiIXDvs0T1b68HZD4zqEfbe3rDP6aJbSlLDU+GuUuqGX0YtQXRM5thc273VZG8NPeZt2PgMKdvA0QdD7tAECKuA6b0HRLTYMpwUiKqXayKhawnbz5kRrNDT3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBtK7bcon/v299fhkk8aUVGV5yBnWwPiEtUZM97M4DA=;
 b=lTYWRN1RdNqtvULf7lC31xxETDWWLjRswNy4MRfhyusHIz924pkx6ckV9B80WzyrnZPqVBDxTV85BzRRgn7iklUonmCxJB6FsOoj6c/GWDxUM7yXQO3yJCaInQOFPLSEMEw5/v+4afCKkhF5gNJSOxm0eUiL2ARQEsPS8yAIdF4=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BN0PR04MB7999.namprd04.prod.outlook.com (2603:10b6:408:15a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 23:57:54 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 23:57:53 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "eesposit@redhat.com"
 <eesposit@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: Re: [PATCH v2 3/6] block: convert bdrv_graph_wrlock() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Topic: [PATCH v2 3/6] block: convert bdrv_graph_wrlock() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Index: AQHZUrrpKFfwKw2IvEC7e9wluwrvaq7313MA
Date: Sun, 12 Mar 2023 23:57:53 +0000
Message-ID: <8cfbc88521ad4c2a8041e95ae628a7fb6e8e5fb6.camel@wdc.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
 <20230309190855.414275-4-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-4-stefanha@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BN0PR04MB7999:EE_
x-ms-office365-filtering-correlation-id: 9c632f28-fe0d-44f0-5733-08db23559856
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5GG8ehB4UfbRYWjPuBZ+NCqBFjTWEZ7o8+NB6mE9lwhg3GBfXi2ommji++aaHWrO8cp4+pZt7ncdTnsi1ZKWYKU8vywg7pZtA2vmq0M1/qvbG8Mt+AoXqA3DdG8sHrvo0liI6prVXjduI3azYLtHibZytfJsJcUzOWQFnFZzJawHxXPO/+Fok5Nn9qbWgFeXwtv7WhY+qY1rYbvLZkuII9nwWqi53LlFY8QZG08Se6x0b/+FGF3HFc6PD+WNV4Qcwm8Dl5IHSPhZnTITIXkaFywG1qMjaPRWe6jCpHhJNe3+jWyN/EF/kFywXRlZTYCSW4EWhBqDT8Vb3gkIZasT3WWMN4AD4J13R4Oe9MFB0B0vIT0jG6fyXzDCBraczksK2KE3QdBv1L7Y7GNgk04oJeqplT/ndxjNsdJhDKHMmwmJLL7M7tBe+H6GYBslxSHTXH7TGoiOQP51WpLRFrp5G56nwcm1kIOq+E1ZxAHR/8pFQnUwAiVGYCdmjUPVCo53A9qShwx6QQuF9WhYPHXjuAgo2+QZ4My3GpGDgJkz9FbyJG7jPGHQOz299jOnk+x/C34s1IJkRlQjZzGXrktWBqKSHeuGwBYg+9coBTUKhYA3/IdFYejrVMAJUaVY7hheHIz0mgAh3muFcyHlNN8Dh733A/RjpRhlrdAuv5WdFZ08vavm2GH7p9aZCf57Al/lpC8+5rMusava5hTuts9UNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(36756003)(86362001)(186003)(41300700001)(26005)(6506007)(6512007)(5660300002)(7416002)(4326008)(2616005)(8936002)(316002)(71200400001)(110136005)(478600001)(54906003)(76116006)(8676002)(91956017)(66946007)(64756008)(66556008)(66476007)(6486002)(66446008)(122000001)(82960400001)(38100700002)(38070700005)(2906002)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alpFdGZCcjBDaGplb2hZQU5sd0lXaElmUWN5L3VaSWVLRjYyTlZCTWRKVnBz?=
 =?utf-8?B?UFU4ZjFqN2FRbUlwZWFJb3RvMlZwWUNybUhlbG42Wm1zK25XdVNRZHo1Ujla?=
 =?utf-8?B?LzVxdDRreUdkUlpqbXBFTitURHdRdUxxUEN1M0dHQjZHbWNSUHRmVGpjTHNk?=
 =?utf-8?B?MysrNFFzTG5mcmh0R2NZVkZDVk51WFJWVFp4b212U1ZXb3cvemNhZ1hYQ3Bs?=
 =?utf-8?B?KzcvVTBKTVNFc21Fck9GdHp3cllKc3h1alB3c3hybU9IWC9lbVpPM2NMN1Nz?=
 =?utf-8?B?NUFzdWdVTzVvNkFaS0NRRjRXZk93M2xRTHdDQXdpYytXcHUxMWhicW82ODFE?=
 =?utf-8?B?eGhwWkdWMEh2K2RGT1ZUeG1yeVBjcW44VzFKYjlnclRRUGt0QmZBb3VBV2U2?=
 =?utf-8?B?UVAxSEVHVGV2YmxhV2dKUHU0UFhHUUV2NnRxNGFKQmZPVkZPWHkwSVd4WXFv?=
 =?utf-8?B?dlJxYTRpZ0VUK0NURXh1dkxrRUJLYStlUEJ0RDZqUUFzNlFydHkrQkhPWDkr?=
 =?utf-8?B?QVhxMHFzazdmaFliQUtRRDRJclhOb2ZBRmFrQUpRZVNvTVJqUWxuVnZxSkFj?=
 =?utf-8?B?b3B0T3FwSTBFelI5S3A3WSt6cFZtcDd5clJrWUxiSHVBWE51U2Y3T1MwRDhK?=
 =?utf-8?B?aEx0OWd3Y0V2dmYxUlNJZjBTOUwrSjQzTXZxS01UdnNOVjc0V2RISVg2OXlk?=
 =?utf-8?B?K0UraGEvVTNyY1ZJTmtXRHlTWFAwWjM1eE85Smw4T1NDSTNrRGU0NFVGakZC?=
 =?utf-8?B?QXBXL1JVa3NxWS9MU05uTHdzdnVNTERiMXkxbUVHZDBwU3hqdEVZY3k3d2R6?=
 =?utf-8?B?WW9VeVljQXZMajdnaHQ2Z1dyeEp0SkxjVFIrNVV6M2ErdWljbXRwRUFlMjNP?=
 =?utf-8?B?Mk1PSE01enQ1cTJSVDkzUjFCMG5BRldDeU1yWXJORTlsQzJJbld3ZU91TzN3?=
 =?utf-8?B?SXZlRjU2Rjg1RUxGeW9CcVNTdDljcHN4Y2V0R1VNU0xZV3pnblpmSEkxK1Br?=
 =?utf-8?B?S0JDWU81MEx6a2hYc05taWJ1MUhtMEdhNmIzelJxb0hBd2VjNDl2SWZzVHdU?=
 =?utf-8?B?Q1AxdUFrK3VXSVlrTEMydlJzaEN2T202cDN5Q2dnNVl2akR3VFg5M1NoRWZj?=
 =?utf-8?B?Y1UrR3IvN3J3U0xBSmdicDJOOFV2V1plSjNEc2h1VERjQTM4TGFxNHlwcklz?=
 =?utf-8?B?SDRRMVgvQkhwQzBBQzRWQVdTWExzYWFHbURhdUxVMkl6NnVSZGduMUZiVXFY?=
 =?utf-8?B?bS9oZld3NTBSQlN5dGZrdDFJK2VhcFU3UlhhOUZWZThjZHh5T0VZWHgyaHJx?=
 =?utf-8?B?NDNuVVA4clU0WHp4d3Y2RTI2VGNDeE01TW9EM1ZKQWp2S1BCSU9Uc2ZqLzQ0?=
 =?utf-8?B?Vm4rQzZic2NpdjlJWjhXbTlGM3FlQytGU2w3UzVPcG1vY2NmeTFVTUIycEVS?=
 =?utf-8?B?TU5ldE93ZzUvVS85ZWYvZ0orR3h1NzJ2OTkrT3FSZGVsSDJsbUhWOS8xVVhs?=
 =?utf-8?B?WWJrVDFuMnBUMmFEK2E4c01UZkhmUDVlVG5FMkx6V1AreUN2SElrbzBwKzZu?=
 =?utf-8?B?WnU0OFhXZDRYbU1Pc0xCTXNJNUxHMU9MMjVWeFltOGhIMVR1ZElLSllzRHFL?=
 =?utf-8?B?MFpIVHhXR2t1ZVNFblVVNTFKLzd0d1VGVHJKMGNHYzE4c2VnLy90QzFTbUJ0?=
 =?utf-8?B?eUFwTnRWUFhMQUVqejY4bDFYN3RvUjRNa0Z1dnRCVDNKZzFmaGdDRHJKVWlt?=
 =?utf-8?B?aHlhb0liRTQxQVQ5MVFCeEZDWE1iTXBzcVdTd3hMZWZXWUkwY1k0MUFrd2xT?=
 =?utf-8?B?bUJwNjNFMFBhRS92WGpoa29GM1FlcVl0KzNRaE1sQVZiOWtXQWt2MWhlWFJE?=
 =?utf-8?B?VU5EaSt4NlZGaGNaQnkrMkx4aGltZkkvTjFvU1NibmNUNGw3RVYzWElhak9j?=
 =?utf-8?B?WDhRNjl3aXExV1dsUEpmMFRHdUtaZkhsUkcvci90YlAxNmlmN3MyVlhFUnVu?=
 =?utf-8?B?S1Ric0tUV1NadmpRc3FFTkdkeTdGRXdMSjYrc1hacTZicXdhOVZ1TWlzeGhu?=
 =?utf-8?B?UW93eVlkU1ZLS0JDUkdtRnhhc3d5YlpRMzQxb2NRT29aaC9heXhCK3RxNTVJ?=
 =?utf-8?B?OCtua3hBYWJWOGM0VTFZckxLaXJhaXhtN0U1OXVNTGNoNlIzS0lmZk5wQVRS?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07D9A75BD4616341971FC82EBB85680F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: HjGjvZtWngp7aB8pQOMMYCw/fTAGhqrddqoeV+RSsLHBFUixqTMFzPe9T902NjfvVxrHpH9Jj4VlWuZ6sy5WJeA6YsY9ujY9+BmSiXkVwIvJVLZrQhKZQwuDcp8G/XhqORenqPzF5zzoaOrNmGQ05ZbsoIL5Q2HDGMnXrkXaevOCScX7Djlk0NKaKmUQp9B71G6AUHUFCmaIIDZ0A+seE+YsS/1s0ttOOuNaoqakiLGoCrAkgAbqIAb/NX1cmIQ32s61GsAwJxgdus0yNEorGwlBGNqjszwn3TUWtJp3YkeAy0kFH3qs4NXClbIgfxB2Jhl7Rma/enV933H3Mp1UbBMlL2O064FNGB0I6VySIsh8MNDFY81PFGJN9SjW8v4FTD2dmj852dikh0h7vvxtP3KVdSnOHCF2PbItZPvdSV49WFQZuB83Uj33MlgNcy5B+ntKcj/muNReF2b7HXnaZBI/1OxT/1Z/Dx3pqBb/HkpDcJ081RPBV1mPnmb/zj0ZNdHFMAF3IQRZBeDpK9p/OJRFeleqvvpK0n3MtreJk/CbpMnBhV/7nDIzcXG0i931jdPBb10rYMPsLgjFbZycehS85kl81gZ+2HC9u3F8lwQthoo2FDHo6Qd6OZ3ivMjZBT33IW78zpmygkhaisrwNL7PrgQAA+pp5uMbBd1j8LuGDpPzgeAHeuY3GSy1Q9q5LQ8OC0IlBK0oOSjWJBV5/NAa1zl8p2J+St6CTBiIAZOK5/c9EmuHpXhfTKrCEV9Kw6MMVmqBXKSaMdQH9lfNvpemHBjnnnp9VpAsmB/R4bvbIhYMEicChhACws/3/TUahEiYgR8PeZGp+WK4ZnsUlekc2oKjEhTS3yNXFiKAS+E=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c632f28-fe0d-44f0-5733-08db23559856
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2023 23:57:53.7263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAKFXuM6h9VGxm/sBk03Wz0WlA4ykjUNOSlHE5b7VBPI3pBCZ6wbDFNa2WEr56kBHXsAW1FGuNXdG9XdXOj+Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7999
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=4282d8238=wilfred.mallawa@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gVGh1LCAyMDIzLTAzLTA5IGF0IDE0OjA4IC0wNTAwLCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6
Cj4gVGhlIGZvbGxvd2luZyBjb252ZXJzaW9uIGlzIHNhZmUgYW5kIGRvZXMgbm90IGNoYW5nZSBi
ZWhhdmlvcjoKPiAKPiDCoMKgwqDCoCBHTE9CQUxfU1RBVEVfQ09ERSgpOwo+IMKgwqDCoMKgIC4u
Lgo+IMKgIC3CoCBBSU9fV0FJVF9XSElMRShxZW11X2dldF9haW9fY29udGV4dCgpLCAuLi4pOwo+
IMKgICvCoCBBSU9fV0FJVF9XSElMRV9VTkxPQ0tFRChOVUxMLCAuLi4pOwo+IAo+IFNpbmNlIHdl
J3JlIGluIEdMT0JBTF9TVEFURV9DT0RFKCksIHFlbXVfZ2V0X2Fpb19jb250ZXh0KCkgaXMgb3Vy
Cj4gaG9tZQo+IHRocmVhZCdzIEFpb0NvbnRleHQuIFRodXMgQUlPX1dBSVRfV0hJTEUoKSBkb2Vz
IG5vdCB1bmxvY2sgdGhlCj4gQWlvQ29udGV4dDoKPiAKPiDCoCBpZiAoY3R4XyAmJiBpbl9haW9f
Y29udGV4dF9ob21lX3RocmVhZChjdHhfKSkge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcCj4gwqDCoMKgwqDCoCB3aGlsZSAoKGNvbmQpKSB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiDCoMKgwqDCoMKgwqDCoMKgwqAgYWlvX3BvbGwoY3R4XywgdHJ1ZSk7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPiDCoMKgwqDCoMKgwqDCoMKgwqAgd2FpdGVkXyA9IHRydWU7wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiDCoMKgwqDCoMKgIH3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IAo+IEFuZCB0aGF0IG1lYW5zIEFJT19XQUlUX1dISUxF
X1VOTE9DS0VEKE5VTEwsIC4uLikgY2FuIGJlIHN1YnN0aXR1dGVkLgo+IAo+IFJldmlld2VkLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Cj4gVGVzdGVkLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQt
Ynk6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgo+IC0tLQo+IMKgYmxvY2svZ3JhcGgtbG9j
ay5jIHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29t
Pgo+IAo+IGRpZmYgLS1naXQgYS9ibG9jay9ncmFwaC1sb2NrLmMgYi9ibG9jay9ncmFwaC1sb2Nr
LmMKPiBpbmRleCA0NTRjMzFlNjkxLi42Mzk1MjY2MDhmIDEwMDY0NAo+IC0tLSBhL2Jsb2NrL2dy
YXBoLWxvY2suYwo+ICsrKyBiL2Jsb2NrL2dyYXBoLWxvY2suYwo+IEBAIC0xMjcsNyArMTI3LDcg
QEAgdm9pZCBiZHJ2X2dyYXBoX3dybG9jayh2b2lkKQo+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIHJl
YWRlciBsb2NrLgo+IMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgwqAgcWF0
b21pY19zZXQoJmhhc193cml0ZXIsIDApOwo+IC3CoMKgwqDCoMKgwqDCoCBBSU9fV0FJVF9XSElM
RShxZW11X2dldF9haW9fY29udGV4dCgpLCByZWFkZXJfY291bnQoKSA+PSAxKTsKPiArwqDCoMKg
wqDCoMKgwqAgQUlPX1dBSVRfV0hJTEVfVU5MT0NLRUQoTlVMTCwgcmVhZGVyX2NvdW50KCkgPj0g
MSk7Cj4gwqDCoMKgwqDCoMKgwqDCoCBxYXRvbWljX3NldCgmaGFzX3dyaXRlciwgMSk7Cj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgIC8qCgo=

