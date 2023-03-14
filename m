Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7026BA399
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 00:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcEC2-00057K-8y; Tue, 14 Mar 2023 19:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=430022ac4=wilfred.mallawa@wdc.com>)
 id 1pcEBx-0004sY-Fw; Tue, 14 Mar 2023 19:36:29 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=430022ac4=wilfred.mallawa@wdc.com>)
 id 1pcEBm-0002YH-27; Tue, 14 Mar 2023 19:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678836976; x=1710372976;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/RF7orQdaZVoaQWvH6f/FO54QV7kaBCRz4pGjLo0ZDg=;
 b=h4llQtoehasETYU7JH6azFUNqgHQURSCT7IZVwLwgfI7zWTrV6XHEHVd
 DForfylQ1o2ekVdJZDT1z56849JdJlgeCurzfX6ZA4JC+RSVH0h1ncjNN
 1PLMlKLfaWBOZPmaWjS+zt75Bwk8lES20t9BVX/8rwpsPj8TjeDxTO+AI
 q9uoprS9cccQES/jxHbUUvQaP+a09j8sCLlzSCAgGLLWdrOVqLi4sga5T
 YUpoIR7s4B/0KT5N0hQ/AZ70/xs8qPOyMCzugPg/lk0Bc0mM04TWYuHgP
 EEgDSgDQZ/rESQdKok5aMcIGTuS84gSgbRbV0hJbkWJ9vaQvXtCYp6aDU w==;
X-IronPort-AV: E=Sophos;i="5.98,261,1673884800"; d="scan'208";a="337664341"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2023 07:36:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+PF8Ah0/eCk9A93tcMjhRQkzM7vzWP38n0bvhFLhJAE+cM182JFRCxFBPGshPx8dnam+gPKDTh7AqHjsVILFtHq8dCWG86SwqP1GuN2llYmokXffizYXzoOZLUPV6s67s4Oqcr9ioqIl+3u4lTJLB3WT2R8R9z+t9I5sVl2gx36QGeyF56wX2q3KkB+BfuHPT1O/I9iP1nGoJDqi2KJ28YGpl5WuPX+Dt3pTLjvjjVj7/nQnP8Hy5SJKmHT1n8yw1UZKq+6nubQydl6blb56LT8BtWPrOzT3KGEQ9o4Gd7Ax+JLS3wREoinY+VhhniU3oEl15PATb74M/fFnj+4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RF7orQdaZVoaQWvH6f/FO54QV7kaBCRz4pGjLo0ZDg=;
 b=GSzYMbm0AkrhuLqJihE/kuRZp3jU0ySz/HuyiG6EA1w3pBnQYMd3/v+Cr4sMb8T1ximXt3hYj5UDOfjx2K+UTtg45HoQDtEVejd8w1yoRx2pzrn5o4iPkRh/C/cbNglslYusQI4dbMIUWtEHC8NSdSZZnAgEUcWmcXQsl6/7DAjjCyKJko0p5AxwOpgdbgOwI6VDw1rOIL59kxyjJ5o1FebQr4HIyYG7CpHp0WjTND/tUw30DtHaQapP1IiDAxBdGkVqNWjV08N4hqdruccE+ju3pjDsjtYp2xT6e1j+v/tZ0ObcOWdAE2vJhwlCzzjMDvcEigTwxMnvfxV1daw72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RF7orQdaZVoaQWvH6f/FO54QV7kaBCRz4pGjLo0ZDg=;
 b=ws2HeuDkWrVcpWU4i8i7bj6XITkkyE6HsceX9a+w04HhW2B+1PUYND3fVK3Mt4ZSNe2Aq36mk7lrUHoXY6vebWrS10k3PTYg47rfIJ2tzsYAG2M8FDJ6MPaaXTRAbAftVr6zB4BswMTdldZpe/GMcJT1BSHGIBXFwF8XxfgzgTM=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by MWHPR04MB0737.namprd04.prod.outlook.com (2603:10b6:300:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 23:36:00 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 23:35:59 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
Thread-Topic: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
Thread-Index: AQHZVpema4sKNFTHdEWbxdhawfLFyK767kUA
Date: Tue, 14 Mar 2023 23:35:59 +0000
Message-ID: <bc2ef38e9267396d0d3e0fdf37df8a4ae0e7d5f1.camel@wdc.com>
References: <20230314170804.1196232-1-peter.maydell@linaro.org>
In-Reply-To: <20230314170804.1196232-1-peter.maydell@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|MWHPR04MB0737:EE_
x-ms-office365-filtering-correlation-id: 2c87f74e-87e2-484f-e5d1-08db24e4ddd7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JIbDwldeXN1YJ9k6H9BcsKXPWrxY3+4yEMROgUBqFiWM1cb/IWwMtDAEpq7x3/kZDnU47U0GVOvQZIfvrVfPw/749W/WLtw7qb1SXBzVeqOj5Y/CHmVemY+GHM9wNSte7mQz9oIB8Ea3JGycbtQj3pv5K0+4hd8Er3gh8Mt5hVvpNk42zKjmxHSxNP5xDNuETibAUYI0iJ4FHfLC3vzZ/JYz21ChnjDrL9GpuGvEbOVn3Q33JNaK3pKBfMfsR4hzx2TUPTzEn0+OsR7/q+JMgacYnQTKrt0FeHvDUc4vKrcJUhuRcHeGKZ1ql5ucv6penHxjzx/eRAn/YivmpydYF8eWVMzGCT973UklldhZGsT++0p5hrEPkOR3x+xUqSCXf1XQDt36TsJ+xP6g9Zj4ifKhRxO1pQ3O867Uo5VkA9dkLK8Y22+XNBqnz8bJHQKHsIiovIVkLkS1nqXzfeqDiNDVfzwgHtd6R7KSPPj3kcZco86K8C3y1q3VBJYNI2Zd9C1PpVoX3Gyh+ryO/Cy0YXbjukjM2FGyXV9ZJ+3RRChY4yfZHfjhmIiqEQKvL3m+rMEuz2Zs7GDsVG5aVY7QuIU4rFTW7bkAT2YmxEPzs+cCYll/RkUK+nvHLOnbTrvl/IZY+hRhJTNsM46olA4g7ra/7tCDucf/tQlE3b4bH0se6nfglTUVwyIm0XlMOty6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199018)(54906003)(110136005)(316002)(36756003)(82960400001)(83380400001)(38100700002)(86362001)(122000001)(26005)(2616005)(71200400001)(6506007)(6512007)(38070700005)(186003)(5660300002)(478600001)(6486002)(966005)(8676002)(4326008)(41300700001)(8936002)(44832011)(2906002)(91956017)(64756008)(66446008)(66556008)(76116006)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWhMN0R0RmxFK2xzU3JsYzdjUHNvQmlIZWdqUVd4OHRNU0JHYXZDMklwMW1C?=
 =?utf-8?B?QkJrVFF3a085L3h6blAwSmNhK0l0dzNIdFc4QUhCcHNYUC8yY2xtaWM1czRy?=
 =?utf-8?B?REJiYklIMHZYRUdOVjVHWGxjWEZxenZvUGNvRDJPUjNrZ0VESnQ4WHZVekpV?=
 =?utf-8?B?SmhYUjRMMVBsdzFqUWN3S3oxOTBIUU1zK3paazJmakxzaEdlZGR4a284WTZN?=
 =?utf-8?B?VjFPQ0ZCd1lTdHRSSXk3SUJTRngvalhoTW9SbXI2OTRnRWphenp4Q3lSV1Ba?=
 =?utf-8?B?cHA1aGdObWRuaVQySGxNblhCUEFwS2MxUDAvRkprZFZuQklLVHlaYWw0TzVH?=
 =?utf-8?B?aGxLcTgyanV0QTJHc3ZkcDhielAxQVl2NzZkbldheHR5MnhBUFdrbFR0bG0z?=
 =?utf-8?B?Q2NUemtOZk1PUGl1ckNOblVIK1V4dm1Fei83VlkwOVAzV0lBYzBNMGd1Tkpr?=
 =?utf-8?B?S1prVWpXQmQzaTdtYmtORHIzbG1DdHRkeU56SVhCL2ZmeC9VSVBUMDNNTDZs?=
 =?utf-8?B?NWlYQU1PNENEajZkY2RIemhhNGQzSk5rZkxqRGdFVHAvNEtRMldzTkYybHlM?=
 =?utf-8?B?azQ4Q1dPMFoxOC9HVno3Si95YnBHbS85ekd6bkRhejkvYTFVUlhsa2Ewak5k?=
 =?utf-8?B?dWlLVVE5STd4QU1YWXAzZnBVNlgwYStpYVJ3NEw2RjQrb3JEWGpNMVdLd0pa?=
 =?utf-8?B?cjhkY0o1UHgrRDZZRVZmSThndDNHbHpZMlZVYUpTOFdSN2QrTElhTXV4T1FW?=
 =?utf-8?B?Q25MRU1pOHRHWmlBaHlaL2tzUTNhSU4xWlh0ajYyQkk1U0M3d3lVZXNuOWlx?=
 =?utf-8?B?Yi9IbjdaaWxHMExOcEVYMHJXelpIUTBCd2VDWndhb0NZclRNRUphS3VEVkIr?=
 =?utf-8?B?ak85REIxNlFaRndDSEx0cjZSaDRBc0RlQ1YzTmNJUG5wcGhaUFNSZ3pmNmIx?=
 =?utf-8?B?Y0EyZE5WOUxuanpLOHZNMlQxeXphd0Q1SnlBRVhxSXpsTDVXclJTT3VpYk1k?=
 =?utf-8?B?MFdLMmcvSmNWbmxjN0dUMHNMQk9mN3h4ZzJaMGUxbW9QdEZ5bUNUQmpkQ2s3?=
 =?utf-8?B?Q3lpdUg3bHRuczZ4NVFMSjlnUWdaNFBCaW5zZzMvaWVvaWpyWFErVGxQQS9W?=
 =?utf-8?B?QW9DV2F6ZnlITWJYcFgxYWZ5clhCRlNPR0NHcUFTcXVjV084ZDJZdVBwaGlE?=
 =?utf-8?B?UnRXaGw3d2tzNFdEbS95dERuL09ZTUdNTmcvWUZHanZ6SUdJUlhyNXQzN3pa?=
 =?utf-8?B?S2xMRVdzaC93N0FaNXBvS0JFZFgvY3M5UkFpemhMTG1mQ1Z4VCtXT2ZCWjdp?=
 =?utf-8?B?OHRGSkk5OVVxMFRPWHd2UjRJVDF0WFArWHdtM0VxUXgzZVRUWDFQc3dXWmcz?=
 =?utf-8?B?ZExoKzN3MzlLMm0yTWN5MzU5QktDa3dGeFZxNUhyaGRFOHRrT0lwWkpjMXZJ?=
 =?utf-8?B?SHFyWUlWVVJIQUlSblpvY0ZEOVNmem1IbkZ2VDBPNkhwRkpNMi8wTGovYjhL?=
 =?utf-8?B?RW5VakVQY3V3ZVBzT0F1VlB3WjYrVE9jWC91YUZBd0dvM0tqTjYvTmh5UmdP?=
 =?utf-8?B?NG9Fd052M3BKc1Q2cCt0TjA1OG5jNlBBZnBrc2pkQW5JSlRSQjBwWXUrOUhx?=
 =?utf-8?B?eHYzdGdLejBETGc3WlF6N3ByOTF0Tzlxck5rS2EzeHZadFRIRWp1MTVva2RX?=
 =?utf-8?B?ZU9IbXJ3anpTbFY2dURFcXd0MitlTFAxQVl5cEt3UHRvYVprOGVtbEtBNEJE?=
 =?utf-8?B?ZEJUSVNTZnpRU3o0OFZuMVRYQmUzTXNzVC9yQ1NOemdNTE5XSFp0ZWFvSVRM?=
 =?utf-8?B?cXl5SE5ZWkJEOFZSYTV6WnluUC84KzJ5OU5SbGxuY3NYQVdIWDMyVHVPVFlS?=
 =?utf-8?B?c3VVS3UxYTh1RGthUmRTdUNVRWtiU1l0UUxpek1ud3RMVGxMdlpyVXJBSk0x?=
 =?utf-8?B?S08wNnUxZURBdWhKd2szdmJFdXR4eUVLaUVITmhTcmhRSlA2ZVJOblJmMEZH?=
 =?utf-8?B?NGZ0N21YZHBtUnMzdEhHcUFYdVNoWmdCdzJrV1ZXTDJVTFgwYldraUZKMWty?=
 =?utf-8?B?N2Rzc291MEdkeDVVMUdtYm05aGtBZEFMaUgzM21aTTl2TWpGWFVPRW5XdTBU?=
 =?utf-8?B?MjJIZUh0dWc3T1dQS0ZuMlpUWGNNb09ZcGRsbkhocy9FTXEwVmtrNzFybmRR?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3660CBD29ED6D40B0FAAAC2B79D3554@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: APpCq1XCmfOzIvLdLwKRYbzJWv+ZiseJnd5KnvQ2/1Dk3vNdnTB/D0LybSWAFUa3MVnlBwk2PJmQP4+UQtWwfIRND/Xh4s8hRSHQhX3uSInVYKsW1mtPPjy5tWH+XgN+cTYypdv8XvIowNhwTCeLkOgprr6knrXWoSI0vblITVgWrPj1SKEVMpCK2jf3H9LNgJjbAq8hleT3mVKWVYo2KbGIKYSc5V9NApqNpTlZZ1jvN2MGHmnY1hRe9tYCaPgOgMwMh4ivt8SdJ7Mfj1Bg88sUiY7t8nqHcNGgBXDkP7UQXxsoNRW1TTt0sFTgMqChFfe9oE82JpaQ4lkc8Fcva8afPUopwp6BbFDFF4miH1inT21bMC8LCV148Fb5xOGGGVv79R1eB75AuL6WNHgN9B5LBwjsjxmCV1GRu/alxnzoYvYEgVq2Z/BVHoZbwXYwb0T3/mggoYYFG9Znanr06px2r7gzKHw2RHrWL4VtHpDBsIjJn3gjtGtU1g1uvBvXt+ZfzrRuTOgntf4Ul+uPSVTJ8mYRxi2//TqaV/XdRDrgUxnGgibl8W5pqKBGFo44lkgOBkVyH4TduYpOMrB4xyw2SRiwLlCm6hcxQ0osI7YhHgk7YQWeoTRO4be2OUuz/ciS/Euw6ylZin2UPvXD2TwdFrbirplrHL/twY+o6AobzYPhLYzyMytnPzZ4km0zPapolRHlczibS3+HC7PXtE9qtj7N0+7H3jiLHCf0wCe8WQW44B8ujmBkSVhweb7uD1GXOn1TsJKVGFbFlTxLMruw9/FNotBo8brGZn7CMP6PTkwCCvPV62IBkXqxE1jXDnUIgQqiot11lAjTWBN/AMUxPIlPZgak/b0O5vcAb4E=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c87f74e-87e2-484f-e5d1-08db24e4ddd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 23:35:59.5801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MSjaKbjrVqXCow9AeR1aCyue3/1sAP0JBazwiDp2UOOerK9OvscMAx2CJCiitqjJi148JSTv5irVGbKelw/A7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0737
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=430022ac4=wilfred.mallawa@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

T24gVHVlLCAyMDIzLTAzLTE0IGF0IDE3OjA4ICswMDAwLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0K
PiBUaGUgY2FkZW5jZSBVQVJUIGF0dGVtcHRzIHRvIGF2b2lkIGFsbG93aW5nIHRoZSBndXNldCB0
byBzZXQgaW52YWxpZA0KPiBiYXVkIHJhdGUgcmVnaXN0ZXIgdmFsdWVzIGluIHRoZSB1YXJ0X3dy
aXRlKCkgZnVuY3Rpb24uwqAgSG93ZXZlciBpdA0KPiBkb2VzIHRoZSAibWFzayB0byB0aGUgc2l6
ZSBvZiB0aGUgcmVnaXN0ZXIgZmllbGQiIGFuZCAiY2hlY2sgZm9yDQo+IGludmFsaWQgdmFsdWVz
IiBpbiB0aGUgd3Jvbmcgb3JkZXIsIHdoaWNoIG1lYW5zIHRoYXQgYSBtYWxpY2lvdXMNCj4gZ3Vl
c3QgY2FuIGdldCBhIGJvZ3VzIHZhbHVlIGludG8gdGhlIHJlZ2lzdGVyIGJ5IHNldHRpbmcgYWxz
byBzb21lDQo+IGhpZ2ggYml0cyBpbiB0aGUgdmFsdWUsIGFuZCBjYXVzZSBRRU1VIHRvIGNyYXNo
IGJ5IGRpdmlzaW9uLWJ5LXplcm8uDQo+IA0KPiBEbyB0aGUgbWFzayBiZWZvcmUgdGhlIGJvdW5k
cyBjaGVjayBpbnN0ZWFkIG9mIGFmdGVyd2FyZHMuDQo+IA0KPiBSZXNvbHZlczogaHR0cHM6Ly9n
aXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzLzE0OTMNCj4gU2lnbmVkLW9mZi1i
eTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gwqBo
dy9jaGFyL2NhZGVuY2VfdWFydC5jIHwgNiArKysrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KUmV2aWV3ZWQtYnk6IFdpbGZyZWQgTWFsbGF3
YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvY2hhci9j
YWRlbmNlX3VhcnQuYyBiL2h3L2NoYXIvY2FkZW5jZV91YXJ0LmMNCj4gaW5kZXggYzA2OWEzMDg0
MmUuLjgwN2UzOTg1NDE5IDEwMDY0NA0KPiAtLS0gYS9ody9jaGFyL2NhZGVuY2VfdWFydC5jDQo+
ICsrKyBiL2h3L2NoYXIvY2FkZW5jZV91YXJ0LmMNCj4gQEAgLTQ1MCwxMyArNDUwLDE1IEBAIHN0
YXRpYyBNZW1UeFJlc3VsdCB1YXJ0X3dyaXRlKHZvaWQgKm9wYXF1ZSwNCj4gaHdhZGRyIG9mZnNl
dCwNCj4gwqDCoMKgwqDCoMKgwqDCoCB9DQo+IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+IMKg
wqDCoMKgIGNhc2UgUl9CUkdSOiAvKiBCYXVkIHJhdGUgZ2VuZXJhdG9yICovDQo+ICvCoMKgwqDC
oMKgwqDCoCB2YWx1ZSAmPSAweGZmZmY7DQo+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKHZhbHVlID49
IDB4MDEpIHsNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcy0+cltvZmZzZXRdID0gdmFsdWUg
JiAweEZGRkY7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMtPnJbb2Zmc2V0XSA9IHZhbHVl
Ow0KPiDCoMKgwqDCoMKgwqDCoMKgIH0NCj4gwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4gwqDC
oMKgwqAgY2FzZSBSX0JESVY6wqDCoMKgIC8qIEJhdWQgcmF0ZSBkaXZpZGVyICovDQo+ICvCoMKg
wqDCoMKgwqDCoCB2YWx1ZSAmPSAweGZmOw0KPiDCoMKgwqDCoMKgwqDCoMKgIGlmICh2YWx1ZSA+
PSAweDA0KSB7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMtPnJbb2Zmc2V0XSA9IHZhbHVl
ICYgMHhGRjsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcy0+cltvZmZzZXRdID0gdmFsdWU7
DQo+IMKgwqDCoMKgwqDCoMKgwqAgfQ0KPiDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPiDCoMKg
wqDCoCBkZWZhdWx0Og0KDQo=

