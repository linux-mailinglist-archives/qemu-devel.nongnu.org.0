Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56D26E8880
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 05:15:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppKk7-0000vT-Cn; Wed, 19 Apr 2023 23:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ppKk5-0000vK-8o
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:13:53 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ppKk1-0003Wl-OU
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681960429; x=1713496429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/2kVcmGv2ViIfuxx0b7DhTxbv8giR/gm0P+2pwYEZGg=;
 b=d1DvBw8WW1rUbp+OGvCcCUVQka2+HNz4PBDXEuH5hbi3YvZA2fEXchaK
 9xEy116daPbwwOYxaCCytkDg82T7p6qlCKEzjZKsIDhfltnBx8uAvZKSv
 d7j8vurHVnd6eT3Q5uxZ4UYGjuXYZWv3Nn2ABRoqks5TOZUchyXQqhW2J
 tvICAcGEEUbmbwGA6yV1FEQegFMptf0HtEuPiG8yUvQtI6/ObiZwOs+cd
 4AoEJ2vPFUqa24S7JizNho/NnrfKM7PuHDTvOFTxKxMniuAVNi5upEL7p
 K2koeAHQwpfo1nXfAha7M7JgfFvKvwZovRp6LoIorB/PSh+mo2olEVGeM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348376388"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; d="scan'208";a="348376388"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 20:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724267607"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; d="scan'208";a="724267607"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2023 20:13:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 20:13:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 20:13:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 20:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC0HvktaU/ThPiOGXntrjCFamLPp8S/eI71ihEEiW0M6MSP+5d3J4r5142u6Tjx/+41AinTGFczZ2L0ofcUzwYOfmWxs+6Uyimer3JOaRvP+jZDhdztoNa2CmLRA6wONMmxkr12vHxRVNSxW6cQz39pfOuJtpob2ixaqNPQr9w17NAX4M+CVO9sTHVtYslh5ZdqUC2n2bvJawTO2JoT7dWB6bZdFXtDFk+fz7uiqRxZzMs4xHh4W6LMpj90TT5apuvw1zodSjkWQZD4dinQQcJZ4aJI7kFhtHIeC+sMiyqU8nXvDojD0TxITgd8+9vUY3soAu6UEZKZYJKDQeuuZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2kVcmGv2ViIfuxx0b7DhTxbv8giR/gm0P+2pwYEZGg=;
 b=S5W7WVBNaMuMUvWE4B1B49BRe3ctLB3N3R8ScPpftjLe0UdbrMVL/YDjzokag9pvk4CYsRZS8szbHRG2kn9JAFpViPjslSDvQSrbZK3/dCBbhqwBxiQhVRgTTGnf1jp/ACf3+/nBSeHkPingDu4vIvjTfRKnZBzsxzQKUUU1ebqTcbAbzd8WY5rKhNfc0R6Pt5NCkT+JJvs0KeqnVjiltbharuxTVgK5FKBctdm4j+lBsE2AD627A33tsYzHLQ2FOwqs6vUodxppLF0jTZklq4eBXLHvJ1nEA0LrnHhFLAIJO42NVNstZ3/XAG80gavrN3cxcYh6b0ZOhdbdlKWlvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 03:13:29 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::da0a:8aab:d75b:55f1]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::da0a:8aab:d75b:55f1%3]) with mapi id 15.20.6298.045; Thu, 20 Apr 2023
 03:13:29 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "david@redhat.com"
 <david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>, "Peng, Chao P"
 <chao.p.peng@intel.com>
Subject: RE: [PATCH v4] memory: Optimize replay of guest mapping
Thread-Topic: [PATCH v4] memory: Optimize replay of guest mapping
Thread-Index: AQHZcquBaj+syHur+0+78IHJQFm3Sa8yzXyAgACwEkA=
Date: Thu, 20 Apr 2023 03:13:29 +0000
Message-ID: <SJ0PR11MB6744A176D93A71413397E06D92639@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230419102940.185968-1-zhenzhong.duan@intel.com>
 <CAFEAcA_62h5U2jCOJq76pryCjVf3eV-Ovh6Cpwv8rXzNWd1H-w@mail.gmail.com>
In-Reply-To: <CAFEAcA_62h5U2jCOJq76pryCjVf3eV-Ovh6Cpwv8rXzNWd1H-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|BN9PR11MB5321:EE_
x-ms-office365-filtering-correlation-id: c7941569-d20c-490f-85b3-08db414d36fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fOZC3SXqjogLC9dViUXYupIVX1/ZhMkePSFk4afCOEaDrf8b3dWHi+tohdhIN2oZTWnToTQbS6w5vF9aaYum0hJPflmuB73ql1iHFKXQHhP2i3zDiZa6ydKEUzlHtVJQCC1ecIZdvBCP5OoecBpJGdNlCvPjmlxZFq9itDwykdQSA5SzSgTm2+E1S5FFE9+LGyZlY3cVcyEKa/+k2IGrJOYUzOWgqe04lLlLmXFGTRnoFVOx24upHvcAZcIvol+IN8NfHkVirsCVdu5L02r1sMiw1fakFZDMNWiNZGyKAigRqKfkW+SM3eDryZ1xSE7mLu0uJo1OWeIAX5ub6BP19wxBU0pu0c5dxQB1AdT9XJIQgXDndi8UDzmJfxcjt848IGoJlv95R2uBib9q1GeSzGJ+nnnGk0VzAWxhvCctVRaNuZo6OndwmejpJHn27qAqtVxVMWdVrC6rYBxB+CRjbnZJwbdvbOGhqfTONgEEuQ8daxRlaXWpufCUZNYb7VIEERljSVRZpfQw0sjHisvfSLUVuZtzaeyzhTNiNTffYajjBqJS5Kr0rWFK/h7m0PMfw4k+nYnZwvj+/+sRR9YEN9kv9Zv4TkelK1ag9IZKzilDmEs9FhTo04FvD6/PAetz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199021)(54906003)(83380400001)(478600001)(7696005)(55016003)(6506007)(9686003)(26005)(107886003)(71200400001)(76116006)(66476007)(6916009)(66556008)(4326008)(82960400001)(64756008)(66446008)(41300700001)(122000001)(66946007)(316002)(186003)(7416002)(52536014)(5660300002)(38070700005)(38100700002)(8676002)(2906002)(8936002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTBwUStTZlV1VHlIQ3NsRVBMS0xFUlJaeVM4WE4raFNVeUhsb3ZldjdxTW9p?=
 =?utf-8?B?NVlTSjg2RW1jZTNpS2VZQVRiZzFvbDdXVVZDMGdLTVdQSVpzNmwvckNHVGN3?=
 =?utf-8?B?M1pNUGVCblN0MVo5R0ZBdTdPL3FuZkNlOHErS2xDQXFVWXFoZjlZeW1qeVdW?=
 =?utf-8?B?UUhhanBXZkNpKzNQMFpTbUZQS2dkL1JzUHMwaVRZdS9ibVQxekRBVndkYWoz?=
 =?utf-8?B?dWVJdzFMdlVldkhjZE5yVkdya0wrbHdsMTVyZjlPNnI5enRJTjM2ZGNobE5k?=
 =?utf-8?B?d0I5OGZnTjBxbXlhMFZTR1RJL1hveitxM0hGTExXTEpzVDlaODN0a2JPbVpR?=
 =?utf-8?B?ZDJtNGVIVGhoQTBERFZRYWw5aUh1WXRZbXQvbDBvVG5VTDZLWjRFU2FqckpK?=
 =?utf-8?B?dlZFbEI4eVYrMGVGSnBaR1FwWCs3Q00zVWttS3N5MGJKVDBPVGliZ2grNmhr?=
 =?utf-8?B?bkxaemNZOHRJSWthWVNsd1BUM2l1MkFPcFdQeUl3N04rUnhiN205aE5DaEx0?=
 =?utf-8?B?ODczOVN3ZkhTK1ZJYmxadHhhZTFGbjQ3NDFnVWpXY0hwdlpmT0EzdytZMUJI?=
 =?utf-8?B?QjJsRjBFMEdDVHZSeWg3bTJYdXFaZnhRSEpXZm9xTEhtMWxWWjhuRjhtTjlF?=
 =?utf-8?B?VGUrd1J4ZUpiTFpBNnlhS1FYVTJ6c3BoT05oblZlanAvVzRBT2IwYlpkcEpV?=
 =?utf-8?B?NDZWSDdLZUlYRDM5WTA4Wmd5WlgxSU5Wd3N6WSsvK1JqS1Y1dm5vWHVqb0Jk?=
 =?utf-8?B?WXVadndtL2NOenBYSFFveVZZQWhUcGpPTkNYczFBdW5TaTUrb0J5VGhZcmF3?=
 =?utf-8?B?NkFJSDNHTS8xQ1R1cHBZVE1WV0pXbVgvUnlTMmtORVhnV3JYY3BLT2NVRW9R?=
 =?utf-8?B?NXBlTWdrK3ZVNy9GR2dKYWxBbi9URDRNVXZ5Nm5ncUpJTU1XWDdoRWJkZkpO?=
 =?utf-8?B?bXF1T0VRZFN6VHp3Tit3T2J6ZTZlWGhYRmh1TklGWktJdVo1Q2p2SEl0ZFlY?=
 =?utf-8?B?M1AwdTNEQkFQdkZoYXlaV29JVXl2bHZnemJVUjArSEE2dDI2SzlUVWlwZWtP?=
 =?utf-8?B?aW15MWlyeTdUeWNOOGV3QlVXRVUwZmVlVHIvVkF1NlBnRkIzVEZGM1BjT0pX?=
 =?utf-8?B?dTB2RnhaVG44YzFwV1BEeHUzNGNLQUhOeVhYRlBLUnY2aDkveVh1dURBTk1x?=
 =?utf-8?B?U2V0K0k4QnNVcnFiais0a0lrMUJLL0pBZmtZd3lnRnFTYjlEKzFHUmNKb1BN?=
 =?utf-8?B?Q3FIOVVKdkFNaTlRSlVtNFg2VldvbEdub01BSStZMml4OHpuRGpBSUtjVEVr?=
 =?utf-8?B?UzA2UFRIeDEwZTZQUzhCdTc4VjR6WTZ0T2YzT1Jvc1Z0eTlJRFJCSTJ5ODRx?=
 =?utf-8?B?SVVCY29TSm9vRGVTODVid05aYkJlazVDODVtTG5CM1R5R05rOURVNnNWb1NM?=
 =?utf-8?B?NDYvclJpaVJ0Rktsb0R0d3A2cFNCaUVKQU5GSXBuZXZtUTY2Z1RMbndlV254?=
 =?utf-8?B?ek0vMFNqOHduM0FDVWtwTVdXVUN4ZWJmY2JpckJkams1UFhLald3YXUvN0Rt?=
 =?utf-8?B?OURUdExWSjUxYkZhbEFlWEhBVG1mTTBubjJtWHBHUkx3ekI2cDFQSGJVMEp2?=
 =?utf-8?B?NjRvYUlnQzA0NDlvWVRJNHdjeGlHYmUzNFBLYjJ1WnpZMWRSaUlod0pnMStN?=
 =?utf-8?B?YlE2YTd0Ump5TlJpb0FpaktzT2h4M2Z2NHRYM29VNWsrWWZDaWRLNVFXa3p1?=
 =?utf-8?B?bmdlTFRwQXJqUEphclc2UXRmdk52eDJhNFJVSUN1dzYyczNNeHFEdGZNWnhE?=
 =?utf-8?B?b01WOEo1eWJiRlo1MGpPR2Q3cXAwUDNpRGJxODZPd0N3djZzR0NFaWszNUgy?=
 =?utf-8?B?T2hqUCtnaE91UzN6aU1JeHhpck5wWXFxZEtUWWV4enl6NzMwMGU5K0JQUmhO?=
 =?utf-8?B?c0tPZUNMWVJSWDVlQm13aDdTRHl6ZHVOU1c0aFJqdDV0cEZqTjZIaGx0MjV2?=
 =?utf-8?B?US8zelRmTGxzWnhqSDRxUDNYZ2EzaXNJSmdzcFc4Qy9yTStkeXlJWEdpQi85?=
 =?utf-8?B?ZDFEWEYwcEd2bXdlSXR6L3pWeTMxS2FZUjFLbGxHSlorTXBXanQ0VXlzekxH?=
 =?utf-8?Q?7A9vsOpmpmFQf+YftssAeF7W1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7941569-d20c-490f-85b3-08db414d36fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 03:13:29.3721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1wuOWp+/r3IaSZETrEXSaF1kJpTmGLG24Bv8AuQkqBOjZ/Wte8vS355EyzGLN45qZTwSx1ZIG+suE3YnSQaafJsii1V/PUUGFMZX/3Cvf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5321
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBldGVyIE1heWRlbGwgPHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj5TZW50OiBUaHVyc2RheSwgQXByaWwgMjAsIDIwMjMg
MTI6MTAgQU0NCj5UbzogRHVhbiwgWmhlbnpob25nIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+
DQo+Q2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgbXN0QHJlZGhhdC5jb207IHBldGVyeEByZWRo
YXQuY29tOw0KPmphc293YW5nQHJlZGhhdC5jb207IG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29t
Ow0KPnBib256aW5pQHJlZGhhdC5jb207IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IGVk
dWFyZG9AaGFia29zdC5uZXQ7DQo+ZGF2aWRAcmVkaGF0LmNvbTsgcGhpbG1kQGxpbmFyby5vcmc7
IFBlbmcsIENoYW8gUA0KPjxjaGFvLnAucGVuZ0BpbnRlbC5jb20+DQo+U3ViamVjdDogUmU6IFtQ
QVRDSCB2NF0gbWVtb3J5OiBPcHRpbWl6ZSByZXBsYXkgb2YgZ3Vlc3QgbWFwcGluZw0KPg0KPk9u
IFdlZCwgMTkgQXByIDIwMjMgYXQgMTE6NDEsIFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVh
bkBpbnRlbC5jb20+DQo+d3JvdGU6DQo+Pg0KPj4gT24geDg2LCB0aGVyZSBhcmUgdHdvIG5vdGlm
aWVycyByZWdpc3RlcmVkIGR1ZSB0byB2dGQtaXIgbWVtb3J5IHJlZ2lvbg0KPj4gc3BsaXR0aW5n
IHRoZSBlbnRpcmUgYWRkcmVzcyBzcGFjZS4gRHVyaW5nIHJlcGxheSBvZiB0aGUgYWRkcmVzcyBz
cGFjZQ0KPj4gZm9yIGVhY2ggbm90aWZpZXIsIHRoZSB3aG9sZSBhZGRyZXNzIHNwYWNlIGlzIHNj
YW5uZWQgd2hpY2ggaXMNCj4+IHVubmVjZXNzYXJ5LiBXZSBvbmx5IG5lZWQgdG8gc2NhbiB0aGUg
c3BhY2UgYmVsb25nIHRvIG5vdGlmaWVyDQo+PiBtb25pdG9yZWQgc3BhY2UuDQo+Pg0KPj4gV2hp
bGUgb24geDg2IElPTU1VIG1lbW9yeSByZWdpb24gc3BhbnMgb3ZlciBlbnRpcmUgYWRkcmVzcyBz
cGFjZSwgYnV0DQo+PiBvbiBzb21lIG90aGVyIHBsYXRmb3JtcyhlLmcuIGFybSBtcHMzLWFuNTQ3
KSwgSU9NTVUgbWVtb3J5IHJlZ2lvbiBpcw0KPj4gb25seSBhIHdpbmRvdyBpbiB0aGUgZW50aXJl
IGFkZHJlc3Mgc3BhY2UuIFVzZXIgY291bGQgcmVnaXN0ZXIgYQ0KPj4gbm90aWZpZXIgd2l0aCBh
cmJpdHJhcnkgc2NvcGUgYmV5b25kIElPTU1VIG1lbW9yeSByZWdpb24uIFRob3VnaCBpbg0KPj4g
Y3VycmVudCBpbXBsZW1lbnRhdGlvbiByZXBsYXkgaXMgb25seSB0cmlnZ2VyZWQgYnkgVkZJTyBh
bmQgZGlydHkgcGFnZQ0KPj4gc3luYyB3aXRoIG5vdGlmaWVycyBkZXJpdmVkIGZyb20gbWVtb3J5
IHJlZ2lvbiBzZWN0aW9uLCBidXQgdGhpcyBpc24ndA0KPj4gZ3VhcmFudGVlZCBpbiB0aGUgZnV0
dXJlLg0KPj4NCj4+IFNvLCB3ZSByZXBsYXkgdGhlIGludGVyc2VjdGlvbiBwYXJ0IG9mIElPTU1V
IG1lbW9yeSByZWdpb24gYW5kDQo+PiBub3RpZmllcidzIHNjb3BlIGluIG1lbW9yeV9yZWdpb25f
aW9tbXVfcmVwbGF5KCkuIFVwZGF0ZSBkb2MgY29tbWVudA0KPj4gdG8gbWF0Y2ggdGhpcyBjaGFu
Z2UuDQo+DQo+SGk7IEkgaGF2ZSBhIGNvdXBsZSBvZiBtaW5vciB3b3JkaW5nIHR3ZWFrcywgYW5k
IG9uZSBxdWVzdGlvbiBhYm91dCB0aGUgZG9jczoNCj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2V4ZWMvbWVtb3J5LmggYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmggaW5kZXgNCj4+IDE1YWRlOTE4
YmFhNC4uNjFkYTMyZDhhNDI4IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9leGVjL21lbW9yeS5o
DQo+PiArKysgYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgNCj4+IEBAIC00MjUsMTIgKzQyNSwxMyBA
QCBzdHJ1Y3QgSU9NTVVNZW1vcnlSZWdpb25DbGFzcyB7DQo+PiAgICAgICAqIENhbGxlZCB0byBo
YW5kbGUgbWVtb3J5X3JlZ2lvbl9pb21tdV9yZXBsYXkoKS4NCj4+ICAgICAgICoNCj4+ICAgICAg
ICogVGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24gb2YgbWVtb3J5X3JlZ2lvbl9pb21tdV9yZXBs
YXkoKSBpcyB0bw0KPj4gLSAgICAgKiBjYWxsIHRoZSBJT01NVSB0cmFuc2xhdGUgbWV0aG9kIGZv
ciBldmVyeSBwYWdlIGluIHRoZSBhZGRyZXNzIHNwYWNlDQo+PiArICAgICAqIGNhbGwgdGhlIElP
TU1VIHRyYW5zbGF0ZSBtZXRob2QgZm9yIGV2ZXJ5IHBhZ2UgZmFsbGluZyBpbiB0aGUNCj4+ICsg
ICAgICogaW50ZXJzZWN0aW9uIHBhcnQgb2YgSU9NTVUgbWVtb3J5IHJlZ2lvbiBhbmQgbm90aWZp
ZXIncyBzY29wZQ0KPg0KPiJmYWxsaW5nIGluIHRoZSBpbnRlcnNlY3Rpb24gb2YgdGhlIElPTU1V
IE1lbW9yeVJlZ2lvbiBhbmQgdGhlDQo+TWVtb3J5UmVnaW9uIHdoaWNoIHRoZSBub3RpZmllciB3
YXMgcmVnaXN0ZXJlZCBmb3IiDQo+DQo+PiAgICAgICAqIHdpdGggZmxhZyA9PSBJT01NVV9OT05F
IGFuZCB0aGVuIGNhbGwgdGhlIG5vdGlmaWVyIGlmIHRyYW5zbGF0ZQ0KPj4gICAgICAgKiByZXR1
cm5zIGEgdmFsaWQgbWFwcGluZy4gSWYgdGhpcyBtZXRob2QgaXMgaW1wbGVtZW50ZWQgdGhlbiBp
dA0KPj4gICAgICAgKiBvdmVycmlkZXMgdGhlIGRlZmF1bHQgYmVoYXZpb3VyLCBhbmQgbXVzdCBw
cm92aWRlIHRoZSBmdWxsIHNlbWFudGljcw0KPj4gICAgICAgKiBvZiBtZW1vcnlfcmVnaW9uX2lv
bW11X3JlcGxheSgpLCBieSBjYWxsaW5nIEBub3RpZmllciBmb3IgZXZlcnkNCj4+IC0gICAgICog
dHJhbnNsYXRpb24gcHJlc2VudCBpbiB0aGUgSU9NTVUuDQo+PiArICAgICAqIHRyYW5zbGF0aW9u
IHByZXNlbnQgaW4gdGhlIGludGVyc2VjdGlvbiBwYXJ0Lg0KPg0KPiJwcmVzZW50IGluIHRoZSBJ
T01NVSB0aGF0IGlzIHdpdGhpbiB0aGUgTWVtb3J5UmVnaW9uIHRoZSBub3RpZmllciB3YXMNCj5y
ZWdpc3RlcmVkIGZvci4iDQo+DQo+UXVlc3Rpb246IGlzIGl0IE9LIGZvciBhbiBpbXBsZW1lbnRh
dGlvbiBvZiB0aGlzIG1ldGhvZCB0byBjYWxsIHRoZSBub3RpZmllciBmb3INCj50cmFuc2xhdGlv
bnMgdGhhdCBhcmUgaW4gdGhlIElPTU1VIGFuZCB3aGljaCBhcmUgbm90IGluIHRoZSBzY29wZSBv
ZiB0aGUNCj5ub3RpZmllciAoaWUgd2hpY2ggYXJlIG91dHNpZGUgdGhlIGludGVyc2VjdGlvbikg
PyBPciBtdXN0IGl0IHNwZWNpZmljYWxseSByZXN0cmljdA0KPml0c2VsZiB0byBvbmx5IGNhbGxp
bmcgdGhlIG5vdGlmaWVyIGZvciB0cmFuc2xhdGlvbnMgd2hpY2ggYXJlIGluc2lkZSB0aGUgbm90
aWZpZXIncw0KPnJhbmdlID8NCkluIHRoZSBjYWxsaW5nIHBhdGggdG8gbm90aWZpZXItPm5vdGlm
eSgpLCBtZW1vcnlfcmVnaW9uX25vdGlmeV9pb21tdV9vbmUoKQ0KZW5zdXJlcyBwYXNzaW5nIGFu
IElPTU1VVExCRW50cnkgaW4gdGhlIG5vdGlmaWVyJ3MgcmFuZ2UuDQpJIHRoaW5rIGl0J3Mgb2sg
Zm9yIGFuIGltcGxlbWVudGF0aW9uIG9mIHJlcGxheSgpIHRvIHdhbGsgb3ZlciB0aGUgZW50aXJl
DQpJT01NVSBNZW1vcnlSZWdpb24gYmVjYXVzZSB1bnJlbGF0ZWQgZW50cmllcyBhcmUgZmlsdGVy
ZWQgYXMgYWJvdmUuDQpJdCdzIGp1c3QgbGVzcyBvcHRpbWlzdGljIHdoaWNoIHRoaXMgcGF0Y2gg
dHJ5IHRvIGFkZHJlc3MgZm9yIGludGVsX2lvbW11Lg0KDQo+DQo+SWYgdGhlIGxhdHRlciwgd2Ug
bmVlZCB0byBjaGVjayBhbGwgNCBleGlzdGluZyBpbXBsZW1lbnRhdGlvbnMgb2YgdGhpcyBtZXRo
b2QgdG8NCj5lbnN1cmUgdGhhdCB0aGV5IGFyZSBub3Qgc2VuZGluZyBub3RpZmljYXRpb25zIHRo
ZXkgc2hvdWxkIG5vdDsgaWYgdGhlIGZvcm1lciwNCj53ZSBzaG91bGQgZG9jdW1lbnQgdGhhdCBp
bXBsZW1lbnRhdGlvbnMgaGF2ZSB0aGF0IGxlZXdheS4NCkkgdGhpbmsgdGhlIGxhdHRlciBhbmQg
bWVtb3J5X3JlZ2lvbl9ub3RpZnlfaW9tbXVfb25lKCkgYWxyZWFkeSBlbnN1cmUgaXQuDQoNClRo
YW5rcw0KWmhlbnpob25nDQo=

