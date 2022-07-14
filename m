Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259475749EB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:00:48 +0200 (CEST)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBveJ-0006Or-6N
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oBvP7-000111-Pq
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:45:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:8429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oBvP4-0006bv-7M
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657791902; x=1689327902;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W4U3f5y+i3f6w3YE0Wtw2FDyMAcKsQQulZCGSugYUuQ=;
 b=PAURePHnWaP6bcOhr8L7qWRuGda4Njoy+6DPjLZ/KK5ctm2wTEOtLVzx
 Ds3nF+vO6r7NiD5k0x/bbyW1DR6jBIzIaYaTd6c6xOO8G9DVMm7qh0H+j
 qvXS/3xeVn+Miom0KhQZSkDnTAVEzjMHdZb0RWAXrEP7DldI2odAmqPnz
 kVy+Jfq6B2bcsJfTdWN9QEUhojHaOgY+en/ch9srCL0pk++2oFypqYLpN
 0cLnNbNe5Sd38AlNRJhLHbhuiqfQmgAFgvOHCDtinfV47o463gJqX+H5x
 Vl6SLFOVPOyEPpIEeHzCsxvaW/L8stzPacKZNzWp3Hp+2UVdGKli2Njd2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="285490667"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="285490667"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 02:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="923008121"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2022 02:44:58 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Jul 2022 02:44:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Jul 2022 02:44:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Jul 2022 02:44:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUAWWO7nbQFfWzCcUxnizXXRyOTa20nQxMMcYKE8LHUiE48jDaThAXezJBmt8ERj1bR2Ha94RTuY5WeT7iL7+Rla+wCQ7jgt2nYPteR7ulVmNFjWBBT1s8qgwZueopW1h6o2ok5J8yYR6bHbvx/FIKUJXQI8zjq7GA5glaGxUHL257eFKO/to2ZKAT2PkJAQonnaVvpMdIe9pF8r292QbRNZ6Y1EP7bBHX02E13ezIOvdq39hUq9lRQxT9qybkN/YHV0rp4UDUHwL682Bbp8m/JE2mFs7SMrLVZdCkGX+mIsfCqkVIWLqw+linYmIdencnI+MKYjR+gApZS096dYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4U3f5y+i3f6w3YE0Wtw2FDyMAcKsQQulZCGSugYUuQ=;
 b=PFZO9cpClH7FzznxDjWH0JZ9L7PYcldvbcnxnazZ8tcHw0pPBLlyI4tiwe9RGM8OF6QSJBV4ccvnID7JM4CL1i9dF2OtZ89v68aaB0kuQY9/0ZlwBXqEyUf5CRLfk2NCjLYMui2ml2uAl2pL4LBK92dcDpzHDiRmlGjh+ZuY51cdsokiqsHa7JgE3S+f2b0EjIElmk3wwklYyScOImndnFlqhNfUiaIDhIiynRmICcGDneeOIbTCB+2tgkTCdYpZnrKTDIRngg7n+dFoZu15kHnqDQmu4t1BaZHCMqKFIF0R2lTq1GRqAUfdjuqveD1ewLQco7SMPkIq9nj5Ymfm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by MWHPR11MB1805.namprd11.prod.outlook.com
 (2603:10b6:300:114::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Thu, 14 Jul
 2022 09:44:53 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22%6]) with mapi id 15.20.5417.028; Thu, 14 Jul 2022
 09:44:53 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "ehabkost@redhat.com" <ehabkost@redhat.com>, "Ma, XiangfeiX"
 <xiangfeix.ma@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "Christopherson,, Sean" <seanjc@google.com>
Subject: RE: [PATCH v2] target/i386: Restore TSX features with taa-no
Thread-Topic: [PATCH v2] target/i386: Restore TSX features with taa-no
Thread-Index: AQHYl0S0CMIG806i9EqxnzjCnRg8d619gK4AgAAaePA=
Date: Thu, 14 Jul 2022 09:44:52 +0000
Message-ID: <MWHPR1101MB21102BBF74B16D578537604992889@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220714053631.417152-1-zhenzhong.duan@intel.com>
 <e7ec3a99-2c2c-81b7-9f02-80958dce5fbe@redhat.com>
In-Reply-To: <e7ec3a99-2c2c-81b7-9f02-80958dce5fbe@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a7d8dc4-671a-47f8-81a9-08da657d809c
x-ms-traffictypediagnostic: MWHPR11MB1805:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9zccsfvG74tqUunyGZztQqf4268c+D770rTQoSyij+JVtGvsE1/UBub4CHEbdReoL1XNLlTsh3zqqoAMsqcW2adfqP0jPr1xzH/0yW1O2TwYBFywEF+ek1fhy2CTkOu1Rg0QsMVU6yi4A1leUziO2xh0WC1pGeV0p+r6+y1+6AcLhq+9Jx78DOiSGWlxB97ShnqZzk7qQ9N4YrCO24+GVMcqT/T39nK7Y03r/sfISDpbnByMjsUbj+N8oUSmz9HsnrR6IMp8D9VAUmdP9biLpa0yFHasohzbdxgtcOMyITcojuG4ABLd/dqKV8/D+jJuHQXmlgD17kEIIEzgCKEGaAExTyRcVs2F1oLvq8RgY7ss4oOIKDWs64yXmjeNcmp/cwCP9X5KxNbuspLFzUvBmy3k1HQj5x1NvSHYg5Fwj7TiJ3phVmd61McJkVNlQ5mIFiBUrf84/QQcU0YBiSvXA+8licCvcSvLiP2ORGStu1pATR8F/DL5Z8OBSmA6cOg2WNvBQWPgxTrxWGZKwSDaNJfcbOr5nh7DM6vsVr4SOk1zy8YZmjSsNZw4kpwclSpDRRu4zZd8Xwxfer7/9jFzjc2VlOwY+5TvGo2qoZdksZ1DKW/MYe7evfN95r8b6aYkVkms1eWgsdjUnYaUNmAktZyaONnV3i+EFb/vRhYC/GDpkYSUT6MRYNdRFhPLX8b5XxYyL/mZXcaOQ1lzuPQvKRz6bxDzvmZdYdXZSbsddycXxK475dNbNuo5Qb25A4X2u5JLS7ckUiLjjGoaR+LlkUIQN4Jn9gpzJGkotyMOTcW3TVdb7XlxQDmc4Gr4Wvw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(346002)(396003)(136003)(366004)(64756008)(83380400001)(54906003)(38100700002)(110136005)(8676002)(71200400001)(66476007)(52536014)(66446008)(66556008)(478600001)(5660300002)(316002)(66946007)(8936002)(2906002)(33656002)(26005)(9686003)(41300700001)(6506007)(38070700005)(186003)(122000001)(7696005)(4326008)(76116006)(55016003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzVzbFh1ZmhQWU5yWmtGQ0tPRmdENnF1b1BrNmV6TnBQYm1wWWl1WERYTDVN?=
 =?utf-8?B?eUJWSWNxUEFkcXJqUU92cFJxc1VKMEdIUFA3cUFrM1F4cktiZFYrOXlBVGp2?=
 =?utf-8?B?Q1ZJNEwvdjIzSmc2Q0xud0VGMTMwZWErcmpHNDIrbzdYYWRuR2NMYURGL1B1?=
 =?utf-8?B?RFkydE84ZVkvVHgrN0k0anRwbjdYL0dWVGVOdFZiaXowSlI2dS8reFBpcHYz?=
 =?utf-8?B?MW0rVCtwd3hkTXNJTDBpTG8xWjRhME5vUFpGK3Nnc0hTa1g3bGU5b25XKy9W?=
 =?utf-8?B?ZWkyN2Nrd21meUlNcWhUajMrbGVWajA2SHBYVEFiR2VUVjhGZTNMV1hwaE5r?=
 =?utf-8?B?S1ZwSlN6WE4yT3VieGluQ3lwWmRucmgrYkVQQ0cySU1jNXJMM1M0L09zWm9R?=
 =?utf-8?B?YzVQMUlLUmhyRGlZNERFb2hTTk9jQ2hZaTRQQWdBM2JwQVdKcDBmNE5pVjFq?=
 =?utf-8?B?UkV2SVZSUzFCNWw3bW5tRURoRTFmeFVqdnd3bjZuek9KVk1JMktvSm84RTBt?=
 =?utf-8?B?bEhjZFJsQm93dTczN1Evb0NUcVNjSTBkbFJkV3ZabGEwRFZlN0ZBMUVkaGdl?=
 =?utf-8?B?Q2lCaXJnZVRVdU8xUmFRVkhHcm1GU2xQeVgvM0ZaeDFONmFXNHFLT3lWRUJU?=
 =?utf-8?B?MmNCMVZSRmFNQlp6Tjg2N01QQmxBQjNpNDNHVW9ySnhCWG55Vzk3SXVFeGlQ?=
 =?utf-8?B?Yk9hblVGOW1JNTNmdWc1Y3FuUmtmUEVxN2FLZTllZVFtQkx3NDEzd3YvS2xZ?=
 =?utf-8?B?dFpLbThleFBRUE1qRDI1QmFCSnN1by9Hbll3Q2xhREtCVWRqOFJnV1Y1N3l0?=
 =?utf-8?B?Rk84WTIzb1B3SHc5Uks1eGlxVk5ydHZYcWRjZWVrcGdoSDdlYTl3S0tCSERR?=
 =?utf-8?B?emtZdXBUY2gxaU9JM0NDaDVvRllmaW1YWU5pRXpzS1hoTE1yVlhLTG9OOWQ2?=
 =?utf-8?B?cUthMWVKUDh0b0lxTHFyeWdXM1JEWWVpTHZmSUxPWWpUMGpJalBjYUkvNjFL?=
 =?utf-8?B?VTdkZHQ5bnpVa2lKcXdwUVJibmlzL3BCMUtYSnN4akVHOFB4b1BQdmh6SDI0?=
 =?utf-8?B?OVd6WjNFVUJHL2h6b3Q0L1czRUw5dVEwNUxhaE9wVGgrN3JBd21lTk9nenZy?=
 =?utf-8?B?ZmpxZ2ZrNFRDcTJZQmYyNXhob1pZQi9WRS9xNjI5ay80VUxTcURCQThhK0pv?=
 =?utf-8?B?K0prdGpJdVVTeG5nNFZQQm9SOWs0Z0xLU1RKVHg5enJBbFp5YmdjZ3RaQUZB?=
 =?utf-8?B?aG5kQURncVF5Y0ZkSllyaUd5UnZZWERGd1ptNzlkN3VuazAzSFQrbk1YVWVq?=
 =?utf-8?B?b0FlRmRrNS9JRVpmay8xT0VtUWc0QVdUUWRzWnkrcUNMUzMrM2FtN3NITXBP?=
 =?utf-8?B?N2dQRHpJRXdweFU4Vlp6aDdFdFF2RENEME80Y1BGNWVOTDdmTFBaQXJ6Z0pm?=
 =?utf-8?B?TGZyTVpLWFk1R1lJR3pqWmFTMWsxcVIxVmxBd2NPRGUxYk9TMUY4KzY2emZR?=
 =?utf-8?B?OHM0ekF2OGhQVGtQOTE5cC9HSC9aM2JtQW92R0pHRWxGRDRJQWlCU0lTeFEz?=
 =?utf-8?B?bEZETGxBbWt0R1hSeGtyWGVjMmlJVzJSQUY0OUZaaFVMVE9RS0dxckdZUXBy?=
 =?utf-8?B?TGlXK1hqWXZLNEZWTk5zeE9OWjgrMzZDVjVacjNyRkVkRElJME04V0s2cTZ3?=
 =?utf-8?B?MWo4eDVCbVBGRmQwbXZDTC9RamFZdm9lMzdFTzVhdHRDL3lxcVA2eTAxcUk5?=
 =?utf-8?B?ai9yVlhYaVBMcGFtZlhOL0kyMHVwSEJ3RHM0UGdtQUJMUit3b0xSdHJJekJH?=
 =?utf-8?B?MkpVdC9qQWpqTGlPQS80VkFZdUR0cWE3OEdvdVZNTm9lb1UxeGxKK3RSb3RB?=
 =?utf-8?B?YzZmYVlwejh2TWZKN25VY2g5dlJPNmVHVndLVGxkemhoNCtCa0ZBVTlFZTVC?=
 =?utf-8?B?SHFaRXQrRjhPWGtFZUdiYmh3QmVKZExGRkN3bDVCcUF3L2EySWdwbE4rcWI4?=
 =?utf-8?B?SFo4bDlZLzVCNlBlTnVmUWZJOGRWaXdsbXdsNktDYjQ3bmt2K1RoUzdqcjlV?=
 =?utf-8?B?N0ZuTmJHRVJwVlptejRqQ2xwUVFCM0RHNCs2U3d1d2o4U2FYcXJ2R0dvUFND?=
 =?utf-8?Q?rcdyKentx006fTPk/0xjxIBH5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7d8dc4-671a-47f8-81a9-08da657d809c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 09:44:52.8935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRWYEbBx6t9Nuj2zH0yDSxhZTCd1oO5hY0m/gpHTQJ1nmk6w/uRB6F5t3jpnTo+7tcN0GtyftkNxiJ729YtVRSLUxsHapqlkwxJ0QgS0mzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1805
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=zhenzhong.duan@intel.com; helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBhb2xvIEJvbnppbmkgPHBh
b2xvLmJvbnppbmlAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgUGFvbG8gQm9uemluaQ0KPlNlbnQ6
IFRodXJzZGF5LCBKdWx5IDE0LCAyMDIyIDM6NTkgUE0NCj5UbzogRHVhbiwgWmhlbnpob25nIDx6
aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+OyBxZW11LQ0KPmRldmVsQG5vbmdudS5vcmcNCj5DYzog
ZWhhYmtvc3RAcmVkaGF0LmNvbTsgTWEsIFhpYW5nZmVpWCA8eGlhbmdmZWl4Lm1hQGludGVsLmNv
bT47IExpLA0KPlhpYW95YW8gPHhpYW95YW8ubGlAaW50ZWwuY29tPjsgQ2hyaXN0b3BoZXJzb24s
LCBTZWFuIDxzZWFuamNAZ29vZ2xlLmNvbT4NCj5TdWJqZWN0OiBSZTogW1BBVENIIHYyXSB0YXJn
ZXQvaTM4NjogUmVzdG9yZSBUU1ggZmVhdHVyZXMgd2l0aCB0YWEtbm8NCj4NCj5PbiA3LzE0LzIy
IDA3OjM2LCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IE9uIElDWC0yUzIgaG9zdCwgd2hlbiBy
dW4gTDIgZ3Vlc3Qgd2l0aCBib3RoIEwxL0wyIHVzaW5nDQo+PiBJY2VsYWtlLVNlcnZlci12MyBv
ciBhYm92ZSwgd2UgZ290IGJlbG93IHdhcm5pbmc6DQo+Pg0KPj4gIndhcm5pbmc6IGhvc3QgZG9l
c24ndCBzdXBwb3J0IHJlcXVlc3RlZCBmZWF0dXJlOiBNU1IoMTBBSCkudGFhLW5vIFtiaXQNCj44
XSINCj4+DQo+PiBUaGlzIGlzIGJlY2F1c2UgTDEgS1ZNIGRvZXNuJ3QgZXhwb3NlIHRhYS1ubyB0
byBMMiBpZiBSVE0gaXMgZGlzYWJsZWQsDQo+PiB0aGVuIHN0YXJ0aW5nIEwyIHFlbXUgdHJpZ2dl
cnMgdGhlIHdhcm5pbmcuDQo+Pg0KPj4gRml4IGl0IGJ5IHJlc3RvcmluZyBUU1ggZmVhdHVyZXMg
aW4gSWNlbGFrZS1TZXJ2ZXItdjMsIHdoaWNoIG1heSBhbHNvDQo+PiBoZWxwIGd1ZXN0IHBlcmZv
cm1hbmNlIGlmIGhvc3QgaXNuJ3Qgc3VzY2VwdGlibGUgdG8gVFNYIEFzeW5jIEFib3J0DQo+PiAo
VEFBKSB2dWxuZXJhYmlsaXRpZXMuDQo+Pg0KPj4gRml4ZXM6IGQ5NjVkYzM1NTkyZCAoInRhcmdl
dC9pMzg2OiBBZGQgQVJDSF9DQVBBQklMSVRJRVMgcmVsYXRlZCBiaXRzDQo+PiBpbnRvIEljZWxh
a2UtU2VydmVyIENQVSBtb2RlbCIpDQo+PiBUZXN0ZWQtYnk6IFhpYW5nZmVpIE1hIDx4aWFuZ2Zl
aXgubWFAaW50ZWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56
aG9uZy5kdWFuQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gdjI6IFJld3JpdGUgY29tbWl0IG1lc3Nh
Z2UNCj4NCj5XaHkgd291bGRuJ3QgdGhlIGZpeCBiZSAoaW4gYW4gSWNlbGFrZS1TZXJ2ZXItdjQg
bW9kZWwpIHRvIHJlbW92ZSB0YWEtbm8/DQoNClRoaXMgd2F5IHdlIGRvbid0IGhhdmUgYSB2ZXJz
aW9uZWQgbW9kZWwgZW5hYmxpbmcgYm90aCBUU1ggYW5kIHRhYS1uby4NCkluIGN1cnJlbnRseSBp
bXBsZW1lbnRhdGlvbiwgVFNYIGlzIGRpc2FibGVkIGluIEljZWxha2UtU2VydmVyLXYyIGFuZCBh
Ym92ZS4NCkFuZCB0YWEtbm8gaXMgZW5hYmxlZCBpbiBJY2VsYWtlLVNlcnZlci12MyBhbmQgYWJv
dmUuDQoNCklmIGhhcmR3YXJlIHN1cHBvcnRzIHRhYS1ubyBtaXRpZ2F0aW9uLCBJIHRob3VnaHQg
aXQncyBiZXR0ZXIgdG8gZXhwb3NlIGl0IHRvIGd1ZXN0IHRvZ2V0aGVyIHdpdGggVFNYIHNvIHRo
YXQgZ3Vlc3Qga25vd3MgaXQncyBzZWN1cmUgdG8gdXNlIFRTWD8NCg0KVGhhbmtzDQpaaGVuemhv
bmcNCg0KPg0KPlBhb2xvDQo+DQo+PiAgIHRhcmdldC9pMzg2L2NwdS5jIHwgMyArKysNCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90YXJn
ZXQvaTM4Ni9jcHUuYyBiL3RhcmdldC9pMzg2L2NwdS5jIGluZGV4DQo+PiAxNGY2ODFlOTk4Y2Mu
LjI1ZWY5NzJhM2VlZCAxMDA2NDQNCj4+IC0tLSBhL3RhcmdldC9pMzg2L2NwdS5jDQo+PiArKysg
Yi90YXJnZXQvaTM4Ni9jcHUuYw0KPj4gQEAgLTM0MjMsNiArMzQyMyw5IEBAIHN0YXRpYyBjb25z
dCBYODZDUFVEZWZpbml0aW9uIGJ1aWx0aW5feDg2X2RlZnNbXQ0KPj0gew0KPj4gICAgICAgICAg
ICAgICB7DQo+PiAgICAgICAgICAgICAgICAgICAudmVyc2lvbiA9IDMsDQo+PiAgICAgICAgICAg
ICAgICAgICAucHJvcHMgPSAoUHJvcFZhbHVlW10pIHsNCj4+ICsgICAgICAgICAgICAgICAgICAg
IC8qIFJlc3RvcmUgVFNYIGZlYXR1cmVzIHJlbW92ZWQgYnkgLXYyIGFib3ZlICovDQo+PiArICAg
ICAgICAgICAgICAgICAgICB7ICJobGUiLCAib24iIH0sDQo+PiArICAgICAgICAgICAgICAgICAg
ICB7ICJydG0iLCAib24iIH0sDQo+PiAgICAgICAgICAgICAgICAgICAgICAgeyAiYXJjaC1jYXBh
YmlsaXRpZXMiLCAib24iIH0sDQo+PiAgICAgICAgICAgICAgICAgICAgICAgeyAicmRjdGwtbm8i
LCAib24iIH0sDQo+PiAgICAgICAgICAgICAgICAgICAgICAgeyAiaWJycy1hbGwiLCAib24iIH0s
DQoNCg==

