Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BC6568CD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 10:16:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pA63S-0001Ut-Qo; Tue, 27 Dec 2022 04:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pA63P-0001UW-VE
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 04:15:24 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wenchao.wang@intel.com>)
 id 1pA63M-0006VD-T2
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 04:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672132520; x=1703668520;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g/F+EA9+BH2qNYil3POlUsK+8M+xYvJK/n9PGnKXAZc=;
 b=Kd/yFlFcelhJxtuRo3Qa9O1rCDVMBE4mS/Sgv5PPo30MJVyWPY7IFmO9
 ++VZDtVVT/RE3qfLUq5m0ikdYBWNhzhzScgyKf1BN1kC2qu7syojOmvwz
 7DJK4SJLYOTZlutjUPfP8TooFzMpPajztFIT94z4cNWQBD5OzL9e3oOVH
 llvO00TcnBtEbQeLAsF4lkNxPWj95Dnxl2douRGl3cqqDkz2r6vdVL46b
 bfz+9zXuoFE++5dtC894L3E92vAMDSM9/wGBbaZXHDO7LW5HTYChpb2X2
 CorB+9Vm7BQ0twtXsnk3CqHh7nnj1L6th+WKdPfpn4V13UqK6OjnvhGnN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="318347644"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; d="scan'208";a="318347644"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2022 01:15:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="646372376"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; d="scan'208";a="646372376"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 27 Dec 2022 01:15:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 01:15:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 01:15:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 01:15:15 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 27 Dec 2022 01:15:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnNIPIW6yCPvg9WBqJHPBGmqv3zt/6tVDs3q7AcVYaDqOYirVdiJl2dzvfN9sWzGqfpOYbMaO51YxmZhaS4TLEE3lR4qDA2ucVuWKjTpMuWKm7I9KJSY9rWtM+L5DqyIcqyt2ORdGyjqWn17uCwPMb1kinreASFE5+WfcFnVuZ7MIb0H7M9LDaIwzUH+Zl6rL/l5+fDIWvHOndcO1MbtrI47kZuwLA9Yl0l8EQQrc0vihHA+ign439sS7vMM2ktCH9EFM6uQj2UlSOIsWRyaN1bAhRELL6BGjEbd0WY0gwTRsE4tggeuGyGX8ykwcS4nYtM1blN3h/GoX2LjXLsZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/F+EA9+BH2qNYil3POlUsK+8M+xYvJK/n9PGnKXAZc=;
 b=AF+swqPlEZaxohIBy5avHtGKI3/6/5nCWaFTNaQ5BQ8k9en3JHaNqRgk2UCLiarXNTtkZt55M1U/i56p+g60rrebSL8DFsMJYaQkYAxqNEZJRlJry2fyYYcFRs4EPtRcA9ye1xpCTuERqRcDw4RMUe2u5pWcWyx9Qm1mMxDQSxVjB3rBehu8F5eBwkmz5Myfg5VMJSY7VU8qPkTFMTFQmxeLC181wXN4faL6mOEvYjKscvArXDWKhoppKWvIm1jDbd/38YNdliOjd/jgJxRjRWwQAVwmd13vUin8GWjVsqkNSISyMTQPL1z9gvgEZXonxgh82tT2G187099SwGGt1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4090.namprd11.prod.outlook.com (2603:10b6:5:195::10)
 by CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Tue, 27 Dec
 2022 09:15:12 +0000
Received: from DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3]) by DM6PR11MB4090.namprd11.prod.outlook.com
 ([fe80::e97c:4feb:6b7c:b7b3%5]) with mapi id 15.20.5944.016; Tue, 27 Dec 2022
 09:15:12 +0000
From: "Wang, Wenchao" <wenchao.wang@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
Thread-Topic: [PATCH] target/i386/hax: Add XCR0 support
Thread-Index: AdkAvHco0a5CAnUYQy+c+kGSr8NH7wAFo4SAABncpzAB0e1YoAABn9+AAAAL14ACv7QkMAAAfUuAAZJAZuA=
Date: Tue, 27 Dec 2022 09:15:12 +0000
Message-ID: <DM6PR11MB409087D115E20BD68A5C60B587ED9@DM6PR11MB4090.namprd11.prod.outlook.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
 <04484bf1-c6fc-d430-9939-474c0dab158f@linaro.org>
 <DM6PR11MB40901A46FA5D76F2FCA47E9B87E59@DM6PR11MB4090.namprd11.prod.outlook.com>
 <be555e77-f650-787b-e9a7-6cd92d34234c@linaro.org>
In-Reply-To: <be555e77-f650-787b-e9a7-6cd92d34234c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4090:EE_|CY8PR11MB6820:EE_
x-ms-office365-filtering-correlation-id: 668cc4ed-2c5e-41ca-784a-08dae7eadc0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rdsXb7D9jP6x8ZdTL5L27uKuoM3xJkAQ6RyEPWFu1wbGawcsHMNPm05nNQNenRIvy/yuc5ZxtqRKRJNTDjcbl1EfOQt7VsewQcZ7LgRkgtmapJb6pCGxxXcxoNiB7XeyQXAHgl9IwxWIM/8yIC1AzLCMBPAuDeM2kdV0ZlCrZxDuguj4EDz82WGBpPagw80qZH6LPpo4IHRuT4SAY4XiDKJzkXHx1KH7BnODVbWZMEKzxy/sF/yfiEQTrZ/NLDxo5q9TDgCbmX+SGXghQPtJm30URkBCCfvD3eThVUTaSGs9sO+q+hQuk63211qLS0yfv0kwLcSA1jCwW3nadNLpRTtjnE0Bv6vp2i2VvCuiAZB1heU9rDL1E5FOYTEVzaQKoXBswNL+K9k511TVVk01qOG6IazscQ4oBuFUnRIlW1uenA1cYDcGmvPLm02EnUn0un/cQRNelUGuq7Gm8QRkYzH4ZppJ6/rKIePkjz5bSSczcBk9DLJ+xNzdJnNr32NQ/90iDGqga8256jWDEknCPQKZHEi8i8sFKA91PgvxMdHz7E5CJQC7ttM3xBqG03As9fJdEgMY9HdcIMk4Ub94gMMzCg/75mP3gcmiN5CbFzw+DeWDAMf7odWIgPEkOJLopcVGVmtyF0wXJASb8Znc0fQFcJZjq0MjnTlZALenju4UjtGDaao+li+eKb1dV7YBqt87PRj1cX5e0FD6lDv5vg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4090.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199015)(38070700005)(186003)(26005)(33656002)(55016003)(71200400001)(6506007)(86362001)(9686003)(110136005)(53546011)(316002)(478600001)(41300700001)(2906002)(8936002)(7696005)(52536014)(5660300002)(83380400001)(64756008)(8676002)(76116006)(4326008)(38100700002)(66556008)(66946007)(66446008)(66476007)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTFPclVlTzdLempZNi8xcUptSkI4Q2JPVGxWZ2dxRnFIK3pSQXBoQ3ZHN3FI?=
 =?utf-8?B?RW80TUh5cGlFOFdRVFllWVdMbmcybWZweERlbDd3Rmc5NXFRSUNmTWdpcEdN?=
 =?utf-8?B?LzJ1aXJ6VWpzRGtBaGloUjN1amNjYk41OHo0THlnY1EwekRDTmVMbk1qa29W?=
 =?utf-8?B?eS9FdWhKeDJ0NmF4WHlITWVJK0kxUkJLUElUcFE2UTF0YktWM1dJUFFoZjBK?=
 =?utf-8?B?aGk4MWw0Rk1ET1VCaml0SVNrZjB6anM0bEtWUlZPS1pUdVRIZ3czRVN3MjI1?=
 =?utf-8?B?UWV0aU9MOHJ0NE9hS0FwS2NYSVVnYlhMWFlrcVZMb29mTEg2K3JOdWpzVWlD?=
 =?utf-8?B?V0xmUVB5MXBjdlYzaXk5cS9sRkVDcEJBYjQzVzhkcFRLNEtDczRXc2g1Tzdl?=
 =?utf-8?B?K202dlVPSk1nVktOclQrN0E3cUZCa3F1bEVrYlRReWxqUGJkcFRWdEJFVkZp?=
 =?utf-8?B?TUhKT1VLSjJ6cFFqRldrSHRrdGtZUjBpMlJGUGlqVitxMTJsUmVjTUxvSk9r?=
 =?utf-8?B?R1FweDVDLzh5M2ZwRTF4Y1kzYUw3a2VMSzhBVnh0N09jZGVLS1dyR3huK2E5?=
 =?utf-8?B?dkhteGxUVGs4UDk1bTBCM3lOQkNrVy83R25sd1ZKYzhpSWNVNHdxbXE3emFj?=
 =?utf-8?B?cWZ1UUp4dldETU9BV3pLcFlOalRPZEtXQkQrcHpoa3h2ZnFFNXdJTy9OUmJV?=
 =?utf-8?B?NVRPOUNKblY2RzdhTVBOL1c5M2M4R0cyN25GaFJKcWE4d2gzMWVQK3FLOWRn?=
 =?utf-8?B?N3FNU1VPUG1yK05CU1VIOTBiS0ZXZlBJZ0h5QTd2ZTJ5YVhGdFVPbmJIYXZn?=
 =?utf-8?B?WXRQencvUjFOUjFHUWxDSEYwWkVrMnFhZmVrdEs5M2cwWXkyTEY5K0NJTGox?=
 =?utf-8?B?NkZ2K1grY0l4MzRjK29sR0s0M1lXM0xjYVl5NXhVMGZIQ0hKUW5OZDNjWTRx?=
 =?utf-8?B?ZGE4bXFPVTFmNHBGR25CL3NXZm5RMjlUY0lyM3V3MnI0cTVNN0ZwaFhJY2ZC?=
 =?utf-8?B?czcyZnhDWUtYUzRYeW9FeWhDb2JRN2w0QkVOZCtiOVJoaGo1MklWc0hhRE9Q?=
 =?utf-8?B?Sm5wa0JKd0J2TkZlSlRHVHdsT3JqUEN3NTFCODFVNzZJRlRUU2NyT1FOdGIz?=
 =?utf-8?B?b3Y5K001d3JHOFdXeWdXRERpT3FwSkhCWG1Oa1FBOUVlVnFaVDA3TURzWmpO?=
 =?utf-8?B?bmZidm5xU1RrRG5iUWM1MTNCVTlSZGlUbXhtNEhDS0RtWTY4c1VZY1RWSjNt?=
 =?utf-8?B?MnByZnZXejFWT3NPdFFXbjBSTXg4cWVFSWFjcWdlY2dqUk1uZStWdUhRbGhx?=
 =?utf-8?B?WXY1a3RJazhQNDJoaEJJNExYc2N0b2svRzVsUG1ndi9BdDN2Q2p2TStUK2hp?=
 =?utf-8?B?bVFlZ0RKNVZ3QmJ6ak1INW4rdFBEY0h6RGlsK1dSbWJZTkozWXBqc0xlMzly?=
 =?utf-8?B?YndvWXpWT003S0FCTWVrdGkwN0lkOFNqci8wR0tsT0NsdW41c0gzMmM0aGhj?=
 =?utf-8?B?bStpZnR6VmJRQVd6a2lLYmE4dzhlOGpsQ3AzeDh2WVAyMS81bjIzMk9pVzVX?=
 =?utf-8?B?MU1BTXhOTTdHRmRndW5QY3NpY1hNenQybERaZWFiM1R4TXdqQmFHTlVqYm1Q?=
 =?utf-8?B?L2s5cjJMbmpNazh6M21yUkhqNVZrNDgvR0pFWGc5d2pabGMzTHFVTGFtekRR?=
 =?utf-8?B?R0Zlem44K0RGNm53Vi9HUnI4Nkg2N1pKSy93czQ5b3drVVpBVXhBaWg2RzlY?=
 =?utf-8?B?WjRIVCs1RHlsL2cwQmQvME9GMEI5MTYzUGJRT0VKWDJoaUdITE1kQ1FvUTZR?=
 =?utf-8?B?RHJwZkQ5MXMzeUhzdUpmdjBHSzUyWDF5WG5UdHZ3OG1FNjh6RkRCbEZWaUJx?=
 =?utf-8?B?RVlUSGlZYm5YZlFLR1g3alRXeVZXZHBFNERGbDU2SEZSaTdkbXVld1U3M1lq?=
 =?utf-8?B?SjhFRTBod2IxdlhvMmdKbnZxMkVaTVA0NFFMbU9Kdk04MXZVY2ZhQXhJejVa?=
 =?utf-8?B?WXZEV01wQ0UwZnlPdHhnbnE3enI4dnlYVXFrTVl4blQ0Z0J0dWFmRHA3MG51?=
 =?utf-8?B?c1VVV1lkZFM1eGxYZjhmN3RaYXJTa3ltWHdrSVBWZ25xcEtwbE9jaE1sZ1l5?=
 =?utf-8?Q?Fy2PbQIuc13FswOVXwfLYSxJN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4090.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668cc4ed-2c5e-41ca-784a-08dae7eadc0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2022 09:15:12.6086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OudZZkU0p9CZBYEC5n/rTd9iWFeywNtJuc6JASsaHDaWAutPAjF6D+5DDXmErHrKfXTuR4glrV31lV3zbBFraw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=wenchao.wang@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

SGksIFBoaWxpcHBlLA0KDQpBcyBub2JvZHkgbWFkZSBhbnkgY29tbWVudCBvbiB0aGlzIGNoYW5n
ZSwgY291bGQgeW91IGhlbHAgdG8gbWVyZ2UgdGhlIHBhdGNoIHdpdGggYSBnZW5lcmljIHRhcmdl
dCBjbGVhbnVwIHNlcmllcz8gVGhlIHBhdGNoIGhhcyBiZWVuIGF0dGFjaGVkIGJlbG93LiBUaGFu
a3MgaW4gYWR2YW5jZS4NCg0KDQpCZXN0IFJlZ2FyZHMsDQpXZW5jaGFvDQoNCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpGcm9tIGIxNzg5ZjI1MjNkMDY3OThiODg4MzY2NGJm
YTlhOWRmNzk3YmZjY2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQpGcm9tOiBXZW5jaGFvIFdh
bmcgPHdlbmNoYW8ud2FuZ0BpbnRlbC5jb20+DQpEYXRlOiBGcmksIDI1IE5vdiAyMDIyIDE4OjM3
OjM0ICswODAwDQpTdWJqZWN0OiBbUEFUQ0hdIHRhcmdldC9pMzg2L2hheDogQWRkIFhDUjAgc3Vw
cG9ydA0KDQpJbnRyb2R1Y2UgZXh0ZW5kZWQgY29udHJvbCByZWdpc3RlciBYQ1IwIHRvIHN1cHBv
cnQgWFNBVkUgZmVhdHVyZSBzZXQuDQoNCk5vdGU6IFRoaXMgY2hhbmdlIHJlcXVpcmVzIGF0IGxl
YXN0IEhBWE0gdjcuOC4wIHRvIHN1cHBvcnQuDQoNClJldmlld2VkLWJ5OiBIYW5nIFl1YW4gPGhh
bmcueXVhbkBpbnRlbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBXZW5jaGFvIFdhbmcgPHdlbmNoYW8u
d2FuZ0BpbnRlbC5jb20+DQotLS0NCnRhcmdldC9pMzg2L2hheC9oYXgtaW50ZXJmYWNlLmggfCAy
ICsrDQoxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS90YXJn
ZXQvaTM4Ni9oYXgvaGF4LWludGVyZmFjZS5oIGIvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZh
Y2UuaCBpbmRleCA1MzdhZTA4NGU5Li4xZDEzYmIyMzgwIDEwMDY0NA0KLS0tIGEvdGFyZ2V0L2kz
ODYvaGF4L2hheC1pbnRlcmZhY2UuaA0KKysrIGIvdGFyZ2V0L2kzODYvaGF4L2hheC1pbnRlcmZh
Y2UuaA0KQEAgLTIwMSw2ICsyMDEsOCBAQCBzdHJ1Y3QgdmNwdV9zdGF0ZV90IHsNCiAgICAgdWlu
dDY0X3QgX2NyMzsNCiAgICAgdWludDY0X3QgX2NyNDsNCg0KKyAgICB1aW50NjRfdCBfeGNyMDsN
CisNCiAgICAgdWludDY0X3QgX2RyMDsNCiAgICAgdWludDY0X3QgX2RyMTsNCiAgICAgdWludDY0
X3QgX2RyMjsNCi0tDQoyLjE3LjENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4gDQpTZW50OiBNb25k
YXksIERlY2VtYmVyIDE5LCAyMDIyIDE3OjEwDQpUbzogV2FuZywgV2VuY2hhbyA8d2VuY2hhby53
YW5nQGludGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2M6IFBhb2xvIEJvbnppbmkg
PHBib256aW5pQHJlZGhhdC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSB0YXJnZXQvaTM4Ni9o
YXg6IEFkZCBYQ1IwIHN1cHBvcnQNCg0KSGkgV2VuY2hhbywNCg0KT24gMTkvMTIvMjIgMTA6MDEs
IFdhbmcsIFdlbmNoYW8gd3JvdGU6DQo+IEhpLCBQaGlsaXBwZSwNCj4gDQo+IEFzIFBhb2xvIGRp
ZCBub3QgY29tbWVudCB3aXRoIHRoaXMgcGF0Y2gsIGFzIHlvdSB1c2VkIHRvIHRoaW5rIGl0IGxv
b2tzIGNvcnJlY3QsIGNvdWxkIHlvdSBoZWxwIHRvIG1lcmdlIHRoaXMgb25lLWxpbmUgcGF0Y2gg
YXMgbm8gb25lIHBpY2tlZCBpdCB1cCBzbyBmYXI/IFRoYW5rcyBhIGxvdC4NCg0KSSdtIHByZXR0
eSBzdXJlIFBhb2xvIGlzIGJ1c3kgd2l0aCBLVk0gc3R1ZmYgYW5kIHdpbGwgdGFrZSB0aGlzIHBh
dGNoIHdoZW4gaGUgc3dpdGNoIHRvIFFFTVUgKGl0IHJlYWxseSBpcyB3aXRoaW4gaGlzIGFyZWEp
LiBJZiBoZSBkb2Vzbid0IGNvbW1lbnQgSSdsbCB0YWtlIGl0IHdpdGggYSBnZW5lcmljIHRhcmdl
dC8gY2xlYW51cCBzZXJpZXMgbmV4dCB3ZWVrLg0KDQo+IEJlc3QgUmVnYXJkcywNCj4gV2VuY2hh
bw0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FuZywgV2VuY2hh
bw0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDUsIDIwMjIgMTc6MTANCj4gVG86IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47IHFlbXUtZGV2ZWxAbm9uZ251Lm9y
Zw0KPiBDYzogaGF4bS10ZWFtIDxoYXhtLXRlYW1AaW50ZWwuY29tPjsgUGFvbG8gQm9uemluaSAN
Cj4gPHBib256aW5pQHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIHRhcmdldC9p
Mzg2L2hheDogQWRkIFhDUjAgc3VwcG9ydA0KPiANCj4gVGhhbmtzIGZvciBQaGlsbGlwcGUncyBy
ZXBseS4NCj4gDQo+IEhpLCBQYW9sbywNCj4gDQo+IENvdWxkIHlvdSBoZWxwIHRvIHJldmlldyB0
aGUgcGF0Y2ggb2YgSEFYPyBJZiB0aGVyZSBpcyBhbnkgY29uY2VybiBhYm91dCBpdCwgZmVlbCBm
cmVlIHRvIGRpc2N1c3Mgd2l0aCBtZS4gVGhhbmtzIGEgbG90Lg0KPiANCj4gDQo+IEJlc3QgUmVn
YXJkcywNCj4gV2VuY2hhbw0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBTZW50OiBN
b25kYXksIERlY2VtYmVyIDUsIDIwMjIgMTc6MDUNCj4gVG86IFdhbmcsIFdlbmNoYW8gPHdlbmNo
YW8ud2FuZ0BpbnRlbC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGhheG0tdGVh
bSA8aGF4bS10ZWFtQGludGVsLmNvbT47IFBhb2xvIEJvbnppbmkgDQo+IDxwYm9uemluaUByZWRo
YXQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1Iw
IHN1cHBvcnQNCj4gDQo+IEhpIFdlbmNoYW8sDQo+IA0KPiBPbiA1LzEyLzIyIDA5OjM1LCBXYW5n
LCBXZW5jaGFvIHdyb3RlOg0KPj4gSGksIFBoaWxpcHBlLA0KPj4NCj4+IERvIHlvdSBhZ3JlZSB3
aXRoIG15IG9waW5pb24gYW5kIGlzIHRoZXJlIGFueSBmdXJ0aGVyIHByb2Nlc3MgdGhhdCBJIG5l
ZWQgdG8gZm9sbG93IHRvIGdldCB0aGlzIHBhdGNoIG1lcmdlZD8gVGhhbmtzIGEgbG90Lg0KPiAN
Cj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcGFydCBvZiBIQVhNIGVub3VnaCwgYnV0IHBlciB5
b3VyIGV4cGxhbmF0aW9uLCANCj4geW91ciBjaGFuZ2UgbG9va3MgY29ycmVjdC4gSSdsbCBsZXQg
UGFvbG8gZGVjaWRlIDopDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gUGhpbC4NCj4gDQo+PiBCZXN0
IFJlZ2FyZHMsDQo+PiBXZW5jaGFvDQo+Pg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4+IEZyb206IFdhbmcsIFdlbmNoYW8NCj4+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMjgsIDIw
MjIgMTY6MTENCj4+IFRvOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5v
cmc+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4+IENjOiBoYXhtLXRlYW0gPGhheG0tdGVhbUBp
bnRlbC5jb20+OyBQYW9sbyBCb256aW5pIA0KPj4gPHBib256aW5pQHJlZGhhdC5jb20+DQo+PiBT
dWJqZWN0OiBSRTogW1BBVENIXSB0YXJnZXQvaTM4Ni9oYXg6IEFkZCBYQ1IwIHN1cHBvcnQNCj4+
DQo+PiBIaSwgUGhpbGlwcGUsDQo+Pg0KPj4gSXQgaXMganVzdCB0aGUgZnVsbCBwYXRjaC4gQ3Vy
cmVudGx5LCB0aGUgaW1wbGVtZW50YXRpb24gb2YgSEFYTSBpcyBzaW1wbGUsIHdlIGRpZCBub3Qg
c3luY2hyb25pemUgdGhlIHZDUFUgcmVnaXN0ZXIgZm9yIHhjcjAgZnJvbSBRRU1VLiBIQVhNIHdp
bGwgaGFuZGxlIHRoZSB4Y3IwIHN0YXRlIHdpdGhpbiB0aGUga2VybmVsIHNwYWNlLCBpbmNsdWRp
bmcgaW5pdGlhbGl6YXRpb24sIHVwZGF0ZSwgZXRjLiBUaGlzIHBhdGNoIGFkZHMgdGhlIHhjcjAg
dmFyaWFibGUgZm9yIGFsbG9jYXRpbmcgZXh0cmEgOC1ieXRlIGJ1ZmZlciBvY2N1cGF0aW9uLCB3
aGljaCB3aWxsIGJlIHBhc3NlZCBiZXR3ZWVuIFFFTVUgYW5kIEhBWE0gd2hlbiBoYXhfc3luY192
Y3B1X3N0YXRlKCkgaXMgaW52b2tlZC4gV2UgaGF2ZSB2ZXJpZmllZCB0aGUgcGF0Y2hlZCBRRU1V
IGFuZCBpdCBjYW4gbGF1bmNoIGFsbCBndWVzdCBPU2VzLiBUaGFua3MgZm9yIHlvdXIgY29tbWVu
dHMuDQo+Pg0KPj4NCj4+IEJlc3QgUmVnYXJkcywNCj4+IFdlbmNoYW8NCg0K

