Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF9D444E76
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 06:47:58 +0100 (CET)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miVbN-0005On-H7
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 01:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1miVS4-0004Et-Hm
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 01:38:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:28749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1miVS1-0000RH-CV
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 01:38:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231597868"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="231597868"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 22:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="667774080"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga005.jf.intel.com with ESMTP; 03 Nov 2021 22:38:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Nov 2021 22:38:03 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Nov 2021 22:38:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 3 Nov 2021 22:38:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 3 Nov 2021 22:38:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c41+C0MFUxuSnfEfGqIqSGcCLxpRo1JGoZcZHQPwZIJrwqecIO17AnBqnaBK2sPPkEcFExiZmb/Gb1F6Vpr3CWyCllt5+78r0ke5ddGgzBTZV9dk7B99txLsLD31Ndzm+5kVd8u3cVjtKtvPEpg26X9Vxqn/DObARyHCcnITFI9ilY0xRUbGcPRmjZpswno/jbONc2aGs/E374UKDLuBhzMeXF0Gi0b4WDCZEaDVHgKmup/oL2uIe9lHSYTKmjjRzPeXD1s8oaLd38e5l5J6VIRwNfPS5yyF9w5e8jC5cGTdcwBLi/SKfsVxHib1gFTNO9WfI3tAqyQAZK2zWoGkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR/4UZ9qSx/XOCLJzdBqBLhT2KF8ONqCXplbTbGN/lo=;
 b=VDqZwTgwMTm09I8z1UoNOhMzEWM8lwmkKIE1+d+9Z98M6ogHNa5pHXddV5VRwz/Z59J478DVTlQDyJnjezwJI4CfadWZXHHhG8MsM4e9pimdPgASY0yHFKUJB/2Km/xDBsrA/HgaOLmVppBTku/t83PfvVkbSw9mSMresJwUCYg01fOakmE2Z0I72jV0FFeSk+Ecl+ABbbYHYjxukiu67Rp5aI2b4ovdbCPcZv2L2b5yUC7k8ElSzF6yPNTFmU5xXERrm6h1EBJMucw+s2nRP0u1Nhx2MEakPZcp7oDeuOFUrptJyQJAhCc9uCsIPCtWJakV8ZCa3LnC6LFhlrVB9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oR/4UZ9qSx/XOCLJzdBqBLhT2KF8ONqCXplbTbGN/lo=;
 b=QFaa0Kp8cyU7tzRrcefcSrrzQjlE5OYNs40A9JDKlTlzYCF7/ZU6wA1puD8OxQVGOuAx7m+o9RYquiJmkiFrV5p3NvmYJiYOfvLWaMFDDXVimQJyItIf67WUCVZluGOdqvVVfPBWb+/8oZdqyr14cG7/4BHAGzXZHH7+MLZ4GHE=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (10.164.205.37) by
 MWHPR11MB1661.namprd11.prod.outlook.com (10.172.53.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17; Thu, 4 Nov 2021 05:37:59 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::359f:549e:18bf:fa8b%4]) with mapi id 15.20.4649.021; Thu, 4 Nov 2021
 05:37:59 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuCABHFUgIAAMzPwgAShnTA=
Date: Thu, 4 Nov 2021 05:37:59 +0000
Message-ID: <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ed3710a-e4e8-43d5-2a73-08d99f55433a
x-ms-traffictypediagnostic: MWHPR11MB1661:
x-microsoft-antispam-prvs: <MWHPR11MB1661AC319D724A2BA7929F359B8D9@MWHPR11MB1661.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VylbWgLJkkBqZPSp08ZmlWkxMjB4eWk5k4N4Ox5//+HN6YbOlPiyDn7ozo8s5w4x4AU2xL5LQiU9P9GrnMY2PLIr/8ZANL044OoPvxd6VmuC3CO165bh35XwNfxKkyFlvU+zUv5Vb9X39yBxwm3qQF31wSjg4ySob2ZfgBtuBT/m/hw6D+hbUwJoZUTUWyrkD/tmOSE1MrMj5LbtvxLtq+KrTnDOuaWN2MdVjt6LzYok/dQnVWdlDoo7z2wjOioV9gAHfLAbdrnMjqKVf5WfIQx31AhcYRq16IfGIXmMQfcHfxCuONf9bagtatHE22Fv7XbHVdij0qH+rn9yCdM5FfvKKi44XBrpO4f+bctDsXjVp+OrTdNl2aj7OiR4P2PU86ERYFyUB+shhRcJuc6nxaOrVMp2478hz2+z9tR5J5VsczzEqltmhKv5iWW5p+gRKrXqftTOX6A+eMRKdifFTogLKr6+UzWpjQqkuMbHCAInVpy7cXK0jjzOI+z1xuGgX/+OpTcCdeYGeRAlaF5bb02DHCXTbFnVK/8cf0BjvVLgQL4/oTjKWOUo9/0hiV6ag3hMl1982xdJO6UogZRVXDX4xcNfi/GGNF9tbLeNauwSeb91/hJjPjlcqduiECZ6/iqpcgqfb5vj8dcemSJqGI5IEDQCHN+XWh4L20W+PB+F0VCz8GYtOQih3JwKXNTY/hGB2DSPV5PKd8rQleGrFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7696005)(186003)(26005)(2906002)(4326008)(6506007)(33656002)(9686003)(38100700002)(122000001)(52536014)(55016002)(82960400001)(508600001)(8676002)(66446008)(64756008)(66556008)(8936002)(66476007)(66946007)(38070700005)(76116006)(86362001)(316002)(54906003)(71200400001)(83380400001)(5660300002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFpxZm42cmI2ZHZSNjlFN2RzYXBDYWk1bnN6NkVOVmVSUndWRDNueEdlUUxw?=
 =?utf-8?B?cC8wQTlUNGx6V3l2UFl6S0FSQy9yenpPdFYveWM0QVdEOHMwUk81cFhmcmk3?=
 =?utf-8?B?NEprNThDR2hKejBqVzVtZkVNN3VpdXBtR3Y3akRDQXI4bzBNeUw2bzMvclFp?=
 =?utf-8?B?bndiOGpjaE40RkVZM2YrblJOeWZvZDkyeTZNV1Rqa0ZNeDFHZmUwYnBraSti?=
 =?utf-8?B?OUJkcHJuaUw0NE1mdFM4NWRqMlhYeklrSHFLSlpJR0pGL200cWpvdi8vbnF3?=
 =?utf-8?B?WGhZbUQ3Zy8rWm5yYm9LYzRjVkNwTHBUN3pWMDJ2azVQWnZLL3Zxd0dOaUpw?=
 =?utf-8?B?NjhSRyt0YmYyWGZaSkpjN002SGRXN3QvOHBxa3VDZ1JFUzZkVHZvbVJUQm1C?=
 =?utf-8?B?SElFbVRLRlkrU1NYeExQcVRieGFSWnJqS1NMRUhid3F6MjZMQkJnY3B2M1Zp?=
 =?utf-8?B?NUlNbXVkNVRwQUc2UVBJV1N4emhLNjdUZU9CeCswQ1hBd3Q3SG5td09qakND?=
 =?utf-8?B?WktNNlhTN1RzcThsVWtTejVnT0xjV2RjcG41MFlLMWhVSWIvYTl6S0JYdlpj?=
 =?utf-8?B?dFROYzVOMmphNnhBbWNyTzZNbjExdCs1cGFQb1hKQWlsRVprc3BSanYybnJ3?=
 =?utf-8?B?TUFOZEpBZmhGZFcvS1VpZitDZXFTdXgwcUVMdWNUcVhyNEdZSFd1YVFtMC9s?=
 =?utf-8?B?MTh4dk84UTF6YktndnhQbXQvVDZMcU4rVnVwamM4bzdkcnpVa0hWczBVODdR?=
 =?utf-8?B?SW81czFhVm0yNGRWcEU0WUU5bTBqcVBWOWlkZWZJUjlUU0lYUFFLM1dDL1Ux?=
 =?utf-8?B?bXNOcVp1c3crQUxBWGVJbEtXYlF5VDYzclVWVGVBZlVHalBCd3BkeHBnNW5j?=
 =?utf-8?B?ZmRkUll5a2ttZjh5RjhESjRFdmVpdnhLUy9EUkhEL3kzbnZXZEw4SjEwQzlZ?=
 =?utf-8?B?NUt2NCs2LzJHTkZ5MHMxRzVHbm1senMrVFhSNTFWRkxsZSs5czZkdkFLaitI?=
 =?utf-8?B?STM2b3BhWmlvMUNCR2xpWmJOcGluaW45eHloNkNyZjJtNGFoNFd1K3BERXFi?=
 =?utf-8?B?Y2FjT1NkaUU3Sk5NSWptRFlNUFdTUUhrTzdGZk1WUnRNYlo3Y0dCdUFTWVg3?=
 =?utf-8?B?MUdvaDlpc3pCV2p4WWJ3L241TWltS2IzYnBWZno4bStMQ1J6RXpBY0szbjVj?=
 =?utf-8?B?RmVtSFNFRHNDU2dLQnRhWnVWT0hTR3g2dVN2TUR1WnAxZnVDb2Nta1NRQzRI?=
 =?utf-8?B?blJTbDlRNHlydTFkY0hrVVZkSEIya0d0SlMxRlBQY3JUZ0pmTVJYWFlqRkc1?=
 =?utf-8?B?MXV1V0hsamtORGQ2TlMyeXlzYTRQTUlUTE0zZm9qT1E0RVJhWkFadmE2emhy?=
 =?utf-8?B?amdlRVNrU3BjZit4Y25WWEU2N3lobnRlREpvOTN3a2kxc3paTDU3bWhIeWVa?=
 =?utf-8?B?R2JwSXJoNGNJYUFHcmlFVkIzSGxObzVWMENGVmZYRmxrRjFZZ0dONGdMVVlD?=
 =?utf-8?B?UkNzaGF2ZDBpamd1cHVhNCtzbCtoTERqZi9pWU5tOXJack56WGM3RnBDdjFP?=
 =?utf-8?B?SmQ5WW9RanZtWlY4YVM2VitVWnh4Z0picWpIS1ArQUxWSEhwWE1rc0I2aWE0?=
 =?utf-8?B?Z0x0MDZqWURHNDd3K3RpK210VmQxYUtyYWtvZXFVNzJkdStpMURhcWhHMWlC?=
 =?utf-8?B?U0lmL1pOU2lwSkNnMS84Z2VRRFBHd0U4THV2MjRCNFZOSnZpQXdGOEs2SEZU?=
 =?utf-8?B?Qkw4TzdXOG1oTG8rRUMwdEtEdnRRSi9HcWNJS0RuTjVYZ3JmY1RrTWVRZnQ1?=
 =?utf-8?B?N1ZoUFR0cVZRT1dJWW1NdEszQVFkTFFaVXUxWjY5UUNoOEdWMkQyNG1MMUhS?=
 =?utf-8?B?SnFEQ0Vmb3kyOUZZWmtUQW9RNGN1YmJaK0xoSCtUZHo2Zk94cEEzNUlTYmZr?=
 =?utf-8?B?U1FiRXNxRGtQY2Z5YkFFanlrV2tVazl5ODd4LzU4bWtMYi9acUUyODRDVzJH?=
 =?utf-8?B?U3IxbWE2UkZhS0hveDVuTEUxQjRtZEtoMFpnZUxQZjl1WGp4UnZjYWtLL3dU?=
 =?utf-8?B?eGtiRVoyL1VJWWJ5KzVIWDBOUHF1VTFyNEtqSmFBNTFqeTBDbHJGVWR6Y3JX?=
 =?utf-8?B?RGVZa05BRjhPdmwrU0NGRzc3OUczUy91REdyQjRYNU5DSExFTENVUThsaGJY?=
 =?utf-8?Q?sbcHR9+IMjXPYVs9ET078R4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed3710a-e4e8-43d5-2a73-08d99f55433a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2021 05:37:59.7508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/ICjwApmOU6mGe4H2zd3R2rP3PRPMUqF9JIb/5zXhyRsflD5BsYE4UPX9LoVEwNtJZy/Lb19ChiuVZYSEp1tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1661
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJIHdvbmRlciBpZiB3ZSBuZWVkIHRvIGludHJvZHVj
ZSBuZXcgcGFyYW1ldGVyLCBlLmcgZm9yY2Vfdm5ldF9oZHINCj4gPiA+ID4gaGVyZSwgdGhlbiB3
ZSBjYW4gYWx3YXlzIHNlbmQgdm5ldF9oZHIgd2hlbiBpdCBpcyBlbmFibGVkLg0KPiA+ID4gPg0K
PiA+ID4gPiBPdGhlcndpc2UgdGhlICJ2bmV0X2hkcl9zdXBwb3J0IiBzZWVtcyBtZWFuaW5nbGVz
cy4NCj4gPiA+DQo+ID4gPiBZZXMsIEN1cnJlbnQgInZuZXRfaGRyX3N1cHBvcnQiICBkZWZhdWx0
IGVuYWJsZWQsIGFuZCB2bmV0X2hkcl9sZW4NCj4gPiBhbHJlYWR5IGZvcmNlZCBmcm9tIGF0dGFj
aGVkIG5mLT5uZXRkZXYuDQo+ID4gPiBNYXliZSB3ZSBjYW4gaW50cm9kdWNlIGEgbmV3IHBhcmFt
ZXRlciAiZm9yY2Vfbm9fdm5ldF9oZHIiIGhlcmUgdG8NCj4gPiBtYWtlIHRoZSB2bmV0X2hkcl9s
ZW4gYWx3YXlzIGtlZXAgMC4NCj4gPiA+IElmIHlvdSB0aGluayBPSywgSSB3aWxsIHVwZGF0ZSBp
dCBpbiBuZXh0IHZlcnNpb24uDQo+ID4NCj4gPiBMZXQgbWUgZXhwbGFpbiwgaWYgSSB3YXMgbm90
IHdyb25nOg0KPiA+DQo+ID4gInZuZXRfaGRyX3N1cHBvcnQiIG1lYW5zIHdoZXRoZXIgb3Igbm90
IHRvIHNlbmQgdm5ldCBoZWFkZXIgbGVuZ3RoLiBJZg0KPiA+IHZuZXRfaGRyX3N1cHBvcnQ9ZmFs
c2UsIHdlIHdvbid0IHNlbmQgdGhlIHZuZXQgaGVhZGVyLiBUaGlzIGxvb2tzIHRoZQ0KPiA+IHNh
bWUgYXMgeW91ICJmb3JjZV9ub192ZW50X2hkciIgYWJvdmUuDQo+IA0KPiBZZXMsIEl0IHdhcy4g
IEJ1dCB0aGlzIHNlcmllcyBjaGFuZ2VkIGl0Lg0KPiBDdXJyZW50ICJ2bmV0X2hkcl9zdXBwb3J0
IiBjYW4ndCBkZWNpZGUgd2hldGhlciBzZW5kIHZuZXQgaGVhZGVyIGxlbmd0aCwNCj4gd2UgYWx3
YXlzIHNlbmQgaXQgZXZlbiAwLg0KPiBJdCB3aWxsIGF2b2lkIHNlbmRlci9yZWNlaXZlciB0cmFu
c2ZlciBwcm90b2NvbCBwYXJzZSBpc3N1ZXM6DQo+IFdoZW4gc2VuZGVyIGRhdGEgd2l0aCB0aGUg
dm5ldCBoZWFkZXIgbGVuZ3RoLCBidXQgcmVjZWl2ZXIgY2FuJ3QgZW5hYmxlIHRoZQ0KPiAidm5l
dF9oZHJfc3VwcG9ydCIuDQo+IEZpbHRlcnMgd2lsbCBhdXRvIHNldHVwIHZuZXRfaGRyX2xlbiBh
cyBsb2NhbCBuZi0+bmV0ZGV2IGFuZCBmb3VuZCB0aGUgaXNzdWUNCj4gd2hlbiBnZXQgZGlmZmVy
ZW50IHZuZXRfaGRyX2xlbiBmcm9tIG90aGVyIGZpbHRlcnMuDQo+IA0KPiA+DQo+ID4gQW5kIG15
ICJmb3JjZV92bmV0X2hkciIgc2VlbXMgZHVwbGljYXRlZCB3aXRoIHZuZXRfaGRyX3N1cHBvcnQ9
dHJ1ZS4NCj4gPiBTbyBpdCBsb29rcyB0byBtZSB3ZSBjYW4gbGVhdmUgdGhlIG1pcnJvciBjb2Rl
IGFzIGlzIGFuZCBqdXN0IGNoYW5nZQ0KPiA+IHRoZSBjb21wYXJlPyAoZGVwZW5kcyBvbiB0aGUg
bWdtdCB0byBzZXQgYSBjb3JyZWN0IHZuZXRfaGRyX3N1cHBvcnQpDQo+IA0KPiBPSywgSSB3aWxs
IGtlZXAgdGhlIGZpbHRlci1taXJyb3IvZmlsdGVyLXJlZGlyZWN0b3IvZmlsdGVyLXJld3JpdGVy
IHNhbWUgYXMgdGhpcw0KPiB2ZXJzaW9uLg0KPiBGb3IgdGhlIGNvbG8tY29tcGFyZSBtb2R1bGUs
IEl0IHdpbGwgZ2V0IHByaW1hcnkgbm9kZSdzIGZpbHRlciBkYXRhJ3MNCj4gdm5ldF9oZHJfbGVu
IGFzIHRoZSBsb2NhbCB2YWx1ZSwgQW5kIGNvbXBhcmUgd2l0aCBzZWNvbmRhcnkgbm9kZSdzLA0K
PiBiZWNhdXNlIGl0IGlzIG5vdCBhdHRhY2hlZCBhbnkgbmYtPm5ldGRldi4NCj4gU28sIGl0IGxv
b2tzIGNvbXBhcmUgbW9kdWxlJ3MgInZuZXRfaGRyX3N1cHBvcnQiIGJlZW4gYXV0byBjb25maWd1
cmF0aW9uDQo+IGZyb20gdGhlIGZpbHRlciB0cmFuc3BvcnQgcHJvdG9jb2wuDQo+IElmIHRoZSAi
Zm9yY2Vfdm5ldF9oZHIiIG1lYW5zIGhhcmQgY29kZSBhIGNvbXBhcmUncyBsb2NhbCB2bmV0X2hk
cl9sZW4NCj4gcmF0aGVyIHRoYW4gY29tZSBmcm9tIGlucHV0IGZpbHRlcidzIGRhdGE/DQo+IA0K
PiBUaGFua3MNCj4gQ2hlbg0KPiANCg0KSGkgSmFzb24vTWFya3VzLA0KDQpSZXRoaW5rIGFib3V0
IGl0LCBIb3cgYWJvdXQga2VlcCB0aGUgb3JpZ2luYWwgInZuZXRfaGRyX3N1cHBvcnQiIGZ1bmN0
aW9uLCANCkFuZCBhZGQgYSBuZXcgb3B0aW9uYWwgcGFyYW1ldGVyICJhdXRvX3ZuZXRfaGRyIiBm
b3IgZmlsdGVycy9jb21wYXJlPw0KDQpUaGFua3MNCkNoZW4gDQoNCg0KPiA+DQo+ID4gVGhhbmtz
DQo+ID4NCj4gPiA+DQo+ID4gPiBUaGFua3MNCj4gPiA+IENoZW4NCj4gPiA+DQo+ID4gPiA+DQo+
ID4gPiA+IFRoYW5rcw0KPiA+ID4gPg0KPiA+ID4gPg0KDQo=

