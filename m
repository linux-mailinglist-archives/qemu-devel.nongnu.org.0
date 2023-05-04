Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C326F67EB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:04:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUsa-0007rW-CP; Thu, 04 May 2023 05:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puUsO-0007kz-4h
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:03:50 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1puUsH-0000KQ-Kx
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683191021; x=1714727021;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QhB3RB06HnAb4vVtwTtj3KzZUB/6b3XgewVLUm8psT8=;
 b=SdOFWpo4ANunesE2JRvSFWb/05T5+2UF0uA5pX7+y0nNT+JCHsSpRdEH
 fE329aSZjrc9jjb0xMmEOkuCu3kAiEPK/3WF2o0E6KgWXvaG+1xiTruGk
 9OYVITaT+2VwgYzDEqVTru5L43qYTCoThGVdgPo0EJbzxF0GJxtS21+xa
 eGQpLXVIBlnbqjtNxYHJ0WmL+zPwXsDUg73n35WZr8vjY/j4lui1zTQxU
 8yB2Y5iuLugwNQpp358Fyv2RT1mWHnGMP5octVOOBV0HG50kcV17LIAj3
 Hqq42UBmddLKMzdt3xgMMR4eXXXTw7eFFriQonCeSUkPZm3RXaLyv40vF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414343685"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414343685"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 02:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="691031925"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="691031925"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 04 May 2023 02:03:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 02:03:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 02:03:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 02:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0ydiz6wGjD44RHQKDRRyRHUgLi69rnT9BiftXqlnnrNlFo1Ud9vgEKexP0R9ffSaqHWPeBdLd6hE7CH/Y/44RzAXL7t0XJQlx3FQXQSTIlPW+FmP8yqPvBAC2xxBU2aFuZS9kn8pjsMgRAPtD12kDhoKS3DuaSmbdW9fZUAs/VPdfV92j519NjKMN2RO3QNREmTN2xnDkX/uXXR+7iJVV/8m4UHGvzz/eTQzyaXr3K6nNIa+vQHpJ16k3ut8smQCFFRCKQtaySvAxwCoHa1BT38xb/ismDuPgFch555p3m2dEB2mLlrGRO6vxfpNl+IMPt6JES+FBdzQbqoM1byUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhB3RB06HnAb4vVtwTtj3KzZUB/6b3XgewVLUm8psT8=;
 b=AlM2NxnDvnAK9oUXfXigMKpTMSTBlIMJEQTZXFj6ALfIhNi0rztx982Rmz29g4N+Uw8QLgUhkjFZZHe0PhQ1YVn4uPsMYOpKN+FP7ksmXhCm74C19OQoAp3cQvvVi9G3Ripr0B8EcJdKvHjv6D6Sk2YEvS0E3nTqDXFVUDEZZlmJj6XynpEqlSInxYLKJoHDnX6mY/b5uY5hJnfZmhuEkfkuwDTxIt5S4Bx/TroNsLMPDCOHOkWPmauiVWFNVIOozlTow3GrKUAV/65aEJPL7xDb+VKBsl4NI/H9d/0/N6VPtFZNclqNDHCGCmy0Hwbsy641cuFawqswpHs2QR6Ezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 09:03:37 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::1323:5ae6:8e04:faf0%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 09:03:37 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "lukasstraub2@web.de" <lukasstraub2@web.de>, "quintela@redhat.com"
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: RE: [PATCH v4 09/10] migration: disallow change capabilities in COLO
 state
Thread-Topic: [PATCH v4 09/10] migration: disallow change capabilities in COLO
 state
Thread-Index: AQHZegtAGuphHXh150+pUWY8oIbegK9JyphQgAAEp4CAAAopcA==
Date: Thu, 4 May 2023 09:03:37 +0000
Message-ID: <MWHPR11MB0031697E5E975426340909BD9B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-10-vsementsov@yandex-team.ru>
 <MWHPR11MB003113F9302058F9BA7F20479B6D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <b0d9e820-6ee1-0e49-2195-f535bcc00555@yandex-team.ru>
In-Reply-To: <b0d9e820-6ee1-0e49-2195-f535bcc00555@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|MW5PR11MB5906:EE_
x-ms-office365-filtering-correlation-id: fc69508a-2515-4eb6-d94e-08db4c7e7274
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h5UTbDPSl8VN0l6UtNEHDjXS6dZA78ytwmqJ5Qz9fSa4xy1PFR7hGCNnMW+HySSkhspQUviImMpu3oKAHnwxbDWHObR2CsYVKGvlUWfMnWP4q0Li7VrvcRCMTmVRt4QiCydTXBZkpjP846D1CJL/m4iVOiX5iUaRgUv9BhWawwULvQutaajyKxbff325IRUt3MTYPnonlVWeBF64lwdtL1GJbZsWCsPIws/fhuWC7i2+kBz7W14F1JX5qnEMHW7xn3+UMNm6NsrJTGWzkaOZlLklrRYO8nPqgfoOKXL2fdrRLy0zk9v/7/wAK+ri1ssZotygQcW95cm0o6HShi6N6iQ81BbdbHkzLqHJz3LLgIA91y4yoUJVuotx7cecQ/6PMkuYrKTh9QCgbKgITjtXfbYhGpUJMjPkFCayIpGZLcXg/b/4hpLp/7J47xS2euZRMK0D150El050lyfEhaspqJq6/De8ZuKgp4Qc1DJSqENJ2ouN3VnUkKLOEVydM3n8V3RebD+/iZfRMTaHOEvIvoSC/4PcdK6Edg5PcWbc9pVTFKffs0upMid27pVcMq/66jO3ZpGuIKAh7KVScIt063wCCJYKdBFjaJozDq58c2hnCGcO/Mxp9KGtNP8/KtBh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(38070700005)(110136005)(55016003)(2906002)(54906003)(86362001)(71200400001)(7696005)(478600001)(33656002)(8936002)(8676002)(186003)(316002)(83380400001)(41300700001)(38100700002)(64756008)(66476007)(66446008)(66556008)(76116006)(66946007)(5660300002)(53546011)(26005)(6506007)(9686003)(122000001)(52536014)(82960400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bERrZUMwcUR4REdtWVdicU1RZlhvR1FPWVBLOFFtbXBaSEU5eUI2Y0JhQitZ?=
 =?utf-8?B?WUh1d2ErdGl0dk9JYzlHNlgvU05oYlQrSlkvb0ttb3F5MXhaRTlGZjkyd2Zp?=
 =?utf-8?B?NzJhTFkzaFdoZitDQTJMdlgydGR1UjZYSjVpNDlqVy8wSS95YkFOTXRYT3Jq?=
 =?utf-8?B?a2g3M2g4UFltdU14ZXVmR3hKRWFIcm5RNlNOSkQzL2MrQkxNblFZOUVSQm40?=
 =?utf-8?B?bnpxZGZnTGFKMzZWaEt6MFFObVJoWkFLS0Vab29LSm1lWTZYUitUaXg3djIw?=
 =?utf-8?B?RWtvWTZNZElYc1c1elZsaXQyOElIVnpQWTN1OFlwamlWUjlmbVN6UlIwR3Rl?=
 =?utf-8?B?YTF5Ujk3VEJMR2wyQ1RnYnNWdE9SU3h4SGQwSUw2cm9OOHZLYWxCZlVuRWlh?=
 =?utf-8?B?MURhbmFIbTZmZTJaTXdYK0hzY3lhbmRvTVhUZnRBQ1dXK1YzNGk1eHNFZnUw?=
 =?utf-8?B?MHRqNUl3WkRXQm9qZDlTYU1KV1BBQzNsM3dsUldDWWlidFNBTkdPTDdLQVBU?=
 =?utf-8?B?Ly9jVkVMY0Nyd09nbzk2U3lwRFRFdzBMTzQveDNlYlFaV1kxV0x2SDBOS2Z5?=
 =?utf-8?B?eDYvQjFDRW40Vm5QcndXTkNqVzFHRDJXVm5vK0JLVWhyejFROVpmVGIzNlhs?=
 =?utf-8?B?M25seDlGczJWbldqM2ZnYkJNVGoralppQ3FpK2ZVcEdHNG8vWSt6dE5FWXVU?=
 =?utf-8?B?S3ZNZ0VNNTNlM2ozSWJ6N0VLUlpUSWdwdDJlRnFPQitBbmdIMFJ0U3p5MmZw?=
 =?utf-8?B?WnFjWHdma3N1S1NVRlpva3BUaFVwUUIyUGV2ZmZTcWVnVkZPMVFVa08xeWhD?=
 =?utf-8?B?UHdTekUwaFRMWEFtQURQb2s5Y0o3VU5oSk1LRG1rWFFSZG41M25XNEhIZ29r?=
 =?utf-8?B?aDFtQ2RERjNRWGtydFFxZ2wwRjNubEVIRUpvR3l5ZDJUUEdCdXA1NlMrL0k1?=
 =?utf-8?B?UVRqek80QlFMQkFsU1dPMXVQWmJWRlFDVzhxOFBjQkVlUTRLZ3lWYWdZR1hq?=
 =?utf-8?B?MGxsa1ZYL0tJMExtY0NiTWVUUFBJTGtGM1FJUWNBSlVXTTJsQWU2U3dMSzlq?=
 =?utf-8?B?K1lFQ0JQSUc2NDU0MmlmUXpKS085MThaQkRRbzZDY2dGN3Zybk15WGJ3WS93?=
 =?utf-8?B?RTBtbERrb3NpMnhxNXhYcDB4TC9uaXJweWZUU1dSWTFaMkdMbDVHMXhYTllB?=
 =?utf-8?B?WWQrRDhOZW4vaGVUK2FvaEZWbjY2cUhERkJEaEFERXAzY05lUTZEbmIvOW83?=
 =?utf-8?B?Z2FNWGxHNGVMYitFWFJhbVZiTklDNEhSbm51MnI2MGVrSlJTYUpBWW45V3NJ?=
 =?utf-8?B?dkIxUTBpWEM5ekJFbnl4T01CeU96NVJNemFDZkI5REZ6MERYZU9hbnd6bXl5?=
 =?utf-8?B?MjZIdm5TdzNMV0NFSm9DcU9YbkduNUw5aVVKSXNwOGVlUUhrMm5Ba1ZkRDF4?=
 =?utf-8?B?RWR0WXVIK3RoSWpYY2laK0VEK09xQUY4QlVLSGhPMjZ3eUx5Z2hMcnNkenVn?=
 =?utf-8?B?dFN3ak5UOGI0dU1HT293MDRmUEp2ZmJzS0VnQS94V3RiRWVYc28wajNOeVEy?=
 =?utf-8?B?K2kzTXRLY01LZUoybHhZL0dtT2h0MDcyNGk1Q2hIaUhMd2lzWlR6TjF0UHdw?=
 =?utf-8?B?eUU3aXVWN0s3ejU5SzdIc3NVMFcyYTIzdGIxWU14ZHZoZkhDS2krUklVTHpI?=
 =?utf-8?B?TzJ2Zm9tMnoralFvTm9mMTNVbm1WbjVjdzYrZGt0ZXk0YVNpeEN4N2pVak9F?=
 =?utf-8?B?bnNhR0craUFaTTBWc1kzWldtWlNtMnU4ZENtN2FxNnhqWE1GTVNBaHV0b2Za?=
 =?utf-8?B?Uk1MRnBKWUIrSm5hd0NXbHM2WEJhRHlIakJHQk5qcHMwbEpDWXR1cWh5bnJw?=
 =?utf-8?B?elNXOE5KQlF3Si9Td1R3VE0xNXppajJVQ3c4ajllbHRKY0MvclU0SUlZSC9m?=
 =?utf-8?B?b1YyNXppbnpOR3pzNjFFQlU2VEVQdjBqUjYrSWw5aFZldVRtNE5CeTZWR1Zo?=
 =?utf-8?B?SFgrY01sV3V2VCs2aGYxdnVuSGdlUS9HVldUUjhkSmgwemk2czIwMXNaUGo4?=
 =?utf-8?B?alIwdklCMGJybE5wWUV2L0pCOXhSUzdlQnEzUWtYVE80WXlJRzJPVjFWeEF5?=
 =?utf-8?Q?FTvI8SYEjTdQeHJYPmhahYM66?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc69508a-2515-4eb6-d94e-08db4c7e7274
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 09:03:37.2343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2VUJ3VzMMCQu2cwZQRNTOXEeWN/W9b/RiMNpdbnUCXcJvlP1eJqxxTkDQajBXEqE451dZo8znhmFv9OvRcB7KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmxhZGltaXIgU2VtZW50
c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gU2VudDogVGh1cnNk
YXksIE1heSA0LCAyMDIzIDQ6MjMgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGlu
dGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogbHVrYXNzdHJhdWIyQHdlYi5k
ZTsgcXVpbnRlbGFAcmVkaGF0LmNvbTsgUGV0ZXIgWHUNCj4gPHBldGVyeEByZWRoYXQuY29tPjsg
TGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY0IDA5LzEwXSBtaWdyYXRpb246IGRpc2FsbG93IGNoYW5nZSBjYXBhYmlsaXRpZXMgaW4gQ09M
Tw0KPiBzdGF0ZQ0KPiANCj4gT24gMDQuMDUuMjMgMTE6MDksIFpoYW5nLCBDaGVuIHdyb3RlOg0K
PiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogVmxh
ZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4g
Pj4gU2VudDogU2F0dXJkYXksIEFwcmlsIDI5LCAyMDIzIDM6NDkgQU0NCj4gPj4gVG86IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZw0KPiA+PiBDYzogbHVrYXNzdHJhdWIyQHdlYi5kZTsgcXVpbnRlbGFA
cmVkaGF0LmNvbTsgWmhhbmcsIENoZW4NCj4gPj4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsgdnNl
bWVudHNvdkB5YW5kZXgtdGVhbS5ydTsgUGV0ZXIgWHUNCj4gPj4gPHBldGVyeEByZWRoYXQuY29t
PjsgTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFU
Q0ggdjQgMDkvMTBdIG1pZ3JhdGlvbjogZGlzYWxsb3cgY2hhbmdlIGNhcGFiaWxpdGllcyBpbg0K
PiA+PiBDT0xPIHN0YXRlDQo+ID4+DQo+ID4+IENPTE8gaXMgbm90IGxpc3RlZCBhcyBydW5uaW5n
IHN0YXRlIGluIG1pZ3JhdGVfaXNfcnVubmluZygpLCBzbywgaXQncw0KPiA+PiB0aGVvcmV0aWNh
bGx5IHBvc3NpYmxlIHRvIGRpc2FibGUgY29sbyBjYXBhYmlsaXR5IGluIENPTE8gc3RhdGUgYW5k
DQo+ID4+IHRoZSB1bmV4cGVjdGVkIGVycm9yIGluIG1pZ3JhdGlvbl9pdGVyYXRpb25fZmluaXNo
KCkgaXMgcmVhY2hhYmxlLg0KPiA+Pg0KPiA+PiBMZXQncyBkaXNhbGxvdyB0aGF0IGluIHFtcF9t
aWdyYXRlX3NldF9jYXBhYmlsaXRpZXMuIFRoYW4gdGhlIGVycm9yDQo+ID4+IGJlY29tZXMgYWJz
b2x1dGVseSB1bnJlYWNoYWJsZTogd2UgY2FuIGdldCBpbnRvIENPTE8gc3RhdGUgb25seSB3aXRo
DQo+ID4+IGVuYWJsZWQgY2FwYWJpbGl0eSBhbmQgY2FuJ3QgZGlzYWJsZSBpdCB3aGlsZSB3ZSBh
cmUgaW4gQ09MTyBzdGF0ZS4NCj4gPj4gU28gc3Vic3RpdHV0ZSB0aGUgZXJyb3IgYnkgc2ltcGxl
IGFzc2VydGlvbi4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292
LU9naWV2c2tpeQ0KPiA+PiA8dnNlbWVudHNvdkB5YW5kZXgtdGVhbS5ydT4NCj4gPj4gLS0tDQo+
ID4+ICAgbWlncmF0aW9uL21pZ3JhdGlvbi5jIHwgNSArLS0tLQ0KPiA+PiAgIG1pZ3JhdGlvbi9v
cHRpb25zLmMgICB8IDIgKy0NCj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9taWdy
YXRpb24uYyBiL21pZ3JhdGlvbi9taWdyYXRpb24uYyBpbmRleA0KPiA+PiAwZDkxMmVlMGQ3Li44
YzViYmYzZTk0IDEwMDY0NA0KPiA+PiAtLS0gYS9taWdyYXRpb24vbWlncmF0aW9uLmMNCj4gPj4g
KysrIGIvbWlncmF0aW9uL21pZ3JhdGlvbi5jDQo+ID4+IEBAIC0yNzUxLDEwICsyNzUxLDcgQEAg
c3RhdGljIHZvaWQNCj4gPj4gbWlncmF0aW9uX2l0ZXJhdGlvbl9maW5pc2goTWlncmF0aW9uU3Rh
dGUgKnMpDQo+ID4+ICAgICAgICAgICBydW5zdGF0ZV9zZXQoUlVOX1NUQVRFX1BPU1RNSUdSQVRF
KTsNCj4gPj4gICAgICAgICAgIGJyZWFrOw0KPiA+PiAgICAgICBjYXNlIE1JR1JBVElPTl9TVEFU
VVNfQ09MTzoNCj4gPj4gLSAgICAgICAgaWYgKCFtaWdyYXRlX2NvbG8oKSkgew0KPiA+PiAtICAg
ICAgICAgICAgZXJyb3JfcmVwb3J0KCIlczogY3JpdGljYWwgZXJyb3I6IGNhbGxpbmcgQ09MTyBj
b2RlIHdpdGhvdXQgIg0KPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICJDT0xPIGVuYWJs
ZWQiLCBfX2Z1bmNfXyk7DQo+ID4+IC0gICAgICAgIH0NCj4gPj4gKyAgICAgICAgYXNzZXJ0KG1p
Z3JhdGVfY29sbygpKTsNCj4gPj4gICAgICAgICAgIG1pZ3JhdGVfc3RhcnRfY29sb19wcm9jZXNz
KHMpOw0KPiA+PiAgICAgICAgICAgcy0+dm1fd2FzX3J1bm5pbmcgPSB0cnVlOw0KPiA+PiAgICAg
ICAgICAgLyogRmFsbHRocm91Z2ggKi8NCj4gPj4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9vcHRp
b25zLmMgYi9taWdyYXRpb24vb3B0aW9ucy5jIGluZGV4DQo+ID4+IDg2NWEwMjE0ZDguLmY0NjFk
MDJlZWIgMTAwNjQ0DQo+ID4+IC0tLSBhL21pZ3JhdGlvbi9vcHRpb25zLmMNCj4gPj4gKysrIGIv
bWlncmF0aW9uL29wdGlvbnMuYw0KPiA+PiBAQCAtNTk4LDcgKzU5OCw3IEBAIHZvaWQNCj4gPj4g
cW1wX21pZ3JhdGVfc2V0X2NhcGFiaWxpdGllcyhNaWdyYXRpb25DYXBhYmlsaXR5U3RhdHVzTGlz
dCAqcGFyYW1zLA0KPiA+PiAgICAgICBNaWdyYXRpb25DYXBhYmlsaXR5U3RhdHVzTGlzdCAqY2Fw
Ow0KPiA+PiAgICAgICBib29sIG5ld19jYXBzW01JR1JBVElPTl9DQVBBQklMSVRZX19NQVhdOw0K
PiA+Pg0KPiA+PiAtICAgIGlmIChtaWdyYXRpb25faXNfcnVubmluZyhzLT5zdGF0ZSkpIHsNCj4g
Pj4gKyAgICBpZiAobWlncmF0aW9uX2lzX3J1bm5pbmcocy0+c3RhdGUpIHx8IG1pZ3JhdGlvbl9p
bl9jb2xvX3N0YXRlKCkpDQo+ID4+ICsgew0KPiA+DQo+ID4gTWFrZSB0aGUgIk1JR1JBVElPTl9T
VEFUVVNfQ09MTyIgaW50byB0aGUgIiBtaWdyYXRpb25faXNfcnVubmluZygpIg0KPiBpcyBhIGJl
dHRlciB3YXk/DQo+IA0KPiBJIHdhc24ndCBzdXJlIHRoYXQgdGhhdCdzIGNvcnJlY3QuLiBtaWdy
YXRpb25faXNfcnVubmluZygpIGlzIHVzZWQgaW4gc2V2ZXJhbA0KPiBwbGFjZXMsIHRvIGRvIHNv
LCBJJ2QgaGF2ZSB0byBhbmFseXplIHRoZW0gYWxsLg0KDQpBY3R1YWxseSwgd2hlbiBydW5uaW5n
IGluIHRoZSAiTUlHUkFUSU9OX1NUQVRVU19DT0xPIiBtZWFucyBRRU1VIGNhbiBub3QNCmRvIGEg
bm9ybWFsIG1pZ3JhdGlvbiBhdCB0aGUgc2FtZSB0aW1lLg0KSnVhbiBoYXZlIGFueSBjb21tZW50
cyBoZXJlPw0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gPiBMaWtlIHRoZSAibWlncmF0aW9uX2lz
X3NldHVwX290X2FjdGl2ZSgpIi4NCj4gPg0KPiA+IFRoYW5rcw0KPiA+IENoZW4NCj4gPg0KPiA+
PiAgICAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCBRRVJSX01JR1JBVElPTl9BQ1RJVkUpOw0KPiA+
PiAgICAgICAgICAgcmV0dXJuOw0KPiA+PiAgICAgICB9DQo+ID4+IC0tDQo+ID4+IDIuMzQuMQ0K
PiA+DQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IFZsYWRpbWlyDQoNCg==

