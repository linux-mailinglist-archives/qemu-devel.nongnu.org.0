Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CABD47BBBF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:22:33 +0100 (CET)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaPo-0000TW-Ae
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mzaNV-0007UD-3o
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:20:09 -0500
Received: from mga04.intel.com ([192.55.52.120]:36928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mzaNT-0002fc-7c
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 03:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640074807; x=1671610807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s/uGiH0dygccNDdYy/n2FnegNyjq7cjzSDrDAaHbrFg=;
 b=imczDe40u7c7Scm3bvDlyy4YCAknCZQEz4kdXs3k4/3F6F8JwSrghWDD
 u8er13guDY7FSuKfLtQ+BGrwNi1vIMk6mXFIo8lyaiAaP5wm6NXe/2gaD
 VB/1NpZiliI2IwI4jZa8bNwy2IHQTkAWyIUZXWsK/0/Rrs9fDleCP6pZr
 jXvFkv0udqiMCgxRPTDkVRxPOEZSm7qu2Ds2L+05Dhs9HN2+orsHX4OrB
 McOg7b+vPAIW7ttKlllOQp+mRB/hTpm3wqYedTxYN+XVzi6qSMFyxDRzV
 xcGy/fsl+GnUa+fNZJkGZXZ+E4umjF+iYL0vPA6Wp8lOfDSdAFVQNiEXX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="239097330"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; d="scan'208";a="239097330"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 00:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; d="scan'208";a="466223587"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 21 Dec 2021 00:20:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 00:20:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 00:20:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 21 Dec 2021 00:20:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 21 Dec 2021 00:20:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqCf3hpzBeUKiWZHgRufij8LsdNt888ZqvI4Oe/Trl5Krigy8iMabrpojBsx6lUcPefWmNTMJmPBEFa5dpLzqRiFd4OtphYEt/pL9bXUC2crCxU2PhMz3kNJeeWbnM5wAxES+f/0bulU2WWC9uGe5co7Qkqnb+lY4h4NT7VZiVveUXhACoZCfGOQmuBMT6Jiwwek1upTYPYvp/ZOmG9yqMQmkUtO+VmuTMBfQ7j9hTZXxDa0g/qHpfFpKPiN4usXjBuIDSJwF7GM8XaYXNQ7KPJtIBmhkdDvh4dN11ufkIyjFqAHd/+FdvONQS1cyP1dusUVuGSh8XUxSjM+WACzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/uGiH0dygccNDdYy/n2FnegNyjq7cjzSDrDAaHbrFg=;
 b=oA9dHE6kq35R/FJ4SkNHE7Jnht9sRmpGCRMpmMRJ2b0D7sZ7FyECs7uuWXpOkGOh7Nafuu71Fx3CL0OxJLm/LnxzRxudyowZd6DjpBxhggWN8tnKLiCoJ1UVe8lx87JZ+gFHaaBr/Db6o/QuCPKSPUzp0UEvkTEl54F6Y04dodYjklHfaKI7ocR3u/v4JEgP5m5F1E4+o7wnde5gzQS6lh3uNfds63vCxSFkuefM2HFIFTZaR67Y6jzDIjq3IBrD18lZe1XKnKFsKtSkk1T35cUmxByEdKM2r68/KXMIFVTfCmKea/loR3q9U8hmZjUoEBIWKk4v6cgrJ5dOPFzYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Tue, 21 Dec
 2021 08:20:01 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 08:20:01 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>
Subject: RE: [PATCH] tests/qtest: Make the filter tests independent from a
 specific NIC
Thread-Topic: [PATCH] tests/qtest: Make the filter tests independent from a
 specific NIC
Thread-Index: AQHX9dFWXTEURWNtpE6u8KD0qLg6hKw8fAowgAAS7ICAAAxIkA==
Date: Tue, 21 Dec 2021 08:20:01 +0000
Message-ID: <MWHPR11MB00318A9FFC4D4B498FFDAA889B7C9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211220103025.311759-1-thuth@redhat.com>
 <MWHPR11MB0031244B90C10F7E048744B29B7C9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <6f1f9403-04a7-e149-2eb7-6cbd32a57902@redhat.com>
In-Reply-To: <6f1f9403-04a7-e149-2eb7-6cbd32a57902@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecf0a689-1ca3-484e-368f-08d9c45aaf3a
x-ms-traffictypediagnostic: MW5PR11MB5859:EE_
x-microsoft-antispam-prvs: <MW5PR11MB5859015DE73291B5B7AB34359B7C9@MW5PR11MB5859.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ALNUdV93hry5Q3gZZnlGI2wOCoKZdxM0Eu4TBe0jWy2JZLGf5GCu+VVzwCHTQmEzffmnBUkz93uyLSQK8x4Ti5mffIE+IYS3x3LXQqA64r+6rQAk/CuKtoOM0ZFzVkDPYJEhA04LoD1S8zsvKTVqHRHqOhLLGsvJlOKDHBtA3VDr17npBCILRejFAEsZEQQfWQi8+Qmd7q8Wmw5k2vkrc+25a3s6e1/efrIH8h91GPcmN7JDUGYBOLOcoCYHyFlSNx3Y41NH02LsmGbvodR8gxiqSz0Yj9sRBtc7MltzON7LJ70BA1SeyvB2AZWYLjoMMokLD7Wk9DSGVd6cKG0K1a4aqD6iPM1YX1Q2Xtva71rQ/LcK3TjImrL/yD/JF21nqElXoMj9Km+ra5RlDrPRYPl3UD1qpYupXyaYBpB7FWrqG668TyiiaGfAMp/tAsllamgLalTs4KhAQGfXOt/Zc7Kzj04QGm71FePZiHd9acr5kmK26vlwAQLAmnbNE680pan+8ceiqURkr/QjdbI5nUyFnPSbCHH8eVHGSh23VcPQ6gSPF8MvLrcCu4YZaPOhMYYhbMxa87pPX0DRa3sWmdQoH6UKpFxPKY0ZViyrqW2wJ3WOSXLlL4sy6EXw3mBhr1R22I8C4EUhaeP70fVBm4ozAQHCCI/WLu2ce6wCc1fencTKLB2JVCLlOLnlVwu3uye4KbUlOukilh8p7UtkCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(5660300002)(53546011)(83380400001)(6506007)(82960400001)(76116006)(66946007)(86362001)(33656002)(66476007)(4326008)(66556008)(66446008)(316002)(71200400001)(38070700005)(8936002)(508600001)(2906002)(26005)(38100700002)(64756008)(9686003)(8676002)(7696005)(110136005)(52536014)(55016003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVdrZ0c2UDdYTnBuYkJhYXJUWm5PeXdpWUYxYlg5NUJoZktZR29WVWJvdXMx?=
 =?utf-8?B?ZWQvTjlrMnM5TlAzQktuczZxOFBNUW5NdkoyNTBlTnRBaEU2dnBKUGZQeVlo?=
 =?utf-8?B?VjBCV1F2cUh1S0RBT0h1c012c3QweXhXRnd1aE1zT1NNR1dkN2dUbU5yNFdB?=
 =?utf-8?B?eW10aitUVVBmdy9MRGpwUTlKWWF1YU9qNUNjZjZmMzFvbUtac3VnU2l2R0hC?=
 =?utf-8?B?R2NaTzlPYXlWZjcrTmVPRGJyblFPZGdKQ1JHYjJyMkc2dy9UYm1ZTkYraWwz?=
 =?utf-8?B?cXJuTVQ4YWRja3J2Rkk1cFhLTFpqTEdpT2xkR1k0ck1RbmhrSlZvMTlNWGtQ?=
 =?utf-8?B?eFQvaVhmalJCWjFrOHJUSURrV2dKSmwvc0JoUkpBZ1A0MjJCUlJVYnNQUitj?=
 =?utf-8?B?SysrclpJYkRvUStvdjNwdU5aOUhvUWJzbmtka1NQR09qdStvcmt0cVNSWlNE?=
 =?utf-8?B?MXFQVTFEbWJlUTc0UEZud3BrZTd5TzRvOFI4Wklzdmw0Qkd3Y1hCQWlwQ0hm?=
 =?utf-8?B?ZTdJTnQ1MUFBVEFmTHc5MTZ4ZGUzcGlVVzFEcXJrdllUZ0NETXJGQXhES0dE?=
 =?utf-8?B?SFNBUnJXZDlQdGNBWXk4cEt0MmZtOUd1eHMxdWJsajNsSTVMRnNQUmxUVDAy?=
 =?utf-8?B?SEdIYkNBWDFPOWVFVXFtUnRjM21zKy90YWtTOTBmZUVpbWRTZ1JQNHlHcFNV?=
 =?utf-8?B?enNqVTFoUG14cUpEeEZ5bDEyQUhBWW81WWh2eHZZTzRIeWxKeWxWMGtyQjlv?=
 =?utf-8?B?Y0d6anJVODM0OEU5UjJQd3M3WmNWY09XNjJUQ2lSUlU0TWNLZzdMTnp4bU9W?=
 =?utf-8?B?YnVreEdmRmVzck5QWTBLdVlOMVJ3ZTVnRjBkVklLUlRwemd6dEszMDg1bUlB?=
 =?utf-8?B?VjhiemRFR2R4Z2VTc09DSjk1VTVMbEQ3ZVdXRmxyMHJFLzVZeXBveHljbC9x?=
 =?utf-8?B?d1JoVUpaejBNRytFUmpiaHhwQU13MStaQ1cvK0FkVzEvRWYrQlJ5TldqK3pI?=
 =?utf-8?B?QTNmT2hTTWtDZ0kzVW5GbDkxQlFiUTJGRkRQZm1iUmtpTGRNVHBlN1BUeFM2?=
 =?utf-8?B?a0lKVU5mdEtqaWVLYWpWS3g1SXgveTNKNnVHSnhkR1ZkZEVNL3kwS2ZjZENB?=
 =?utf-8?B?Q2FPNE5HZDR3ak5jOFVDMTY2bGpoMG1WRmpBM3dxZi9Mc01IdXR2ckt6N2N4?=
 =?utf-8?B?cmJmUGVndTNFYTg2S254R1BFTEpmc0g3c3gwNVo4b0JFWk51Y1FYejdpTWEv?=
 =?utf-8?B?VCt6TW8zcGJEVHptS09Id3RPUVZCOHliRUZxNUNKMXBpTHRlVmhaNkgrVlQw?=
 =?utf-8?B?UEhYaVlHKyt3MUdWRmRmWTVVSEc2d1YwZ1ZHU2pIeWN4SmNkdUFVeS9ZUE5U?=
 =?utf-8?B?M3BIRUs3a0gySjVHNE80S3V1T1V4czZNckl1TEl3aGROOHhObEdtYTltRWgy?=
 =?utf-8?B?ZUNMMzFvaU9yWXFOMm5lV1YzbTdyTjR5MTNVbXlTZFpzRnBEZ1JENjYzblFi?=
 =?utf-8?B?encvaHIwa01OZG8zRzRFU1hWTkxjdG5SOGZTRU9sdUh0K2djRDZxOWdvQ0hB?=
 =?utf-8?B?R0JJOUo3UlJxZERSRWJEaE9VREdsZ09iSXdzQlUyUytYRWgrSWhaYmxhUEhw?=
 =?utf-8?B?dmFUZDIyR3Q1eWREOFJuYzh2NVZzbC9EcGJFYTltOGx3bUJBRG9reVlkbjc5?=
 =?utf-8?B?Q2cwZjF3VUJMR1FyZ1ovYnpoSWhLWm1DWkthckgvOXBYdFNMOWluNENxM05x?=
 =?utf-8?B?UXUweVZFWHNTUE1XZWtYbFFMNDZtWUhXTC9GQzBmdFZHYThtQ3FnR2NiU3R2?=
 =?utf-8?B?VVRRZkx5YnJJSm5PN0RFYlgwbUdRVElCRzhSY1VhNEdaaXBoOEkyUU9TWWw0?=
 =?utf-8?B?S3hJWk5BdHc5RGZkTnh4RkVCUFZJSkxHbkd3em1IN0pTTFZNbGFSWFA4QmQ2?=
 =?utf-8?B?Z2s1M0ZNTitkSUorMTRQREtyajZ2Wm4xZEtFNXJwd3NGSE9kd29pN2xwNi9u?=
 =?utf-8?B?VjM1Y2NoVWFLcWhtcnFrTjNEQTdVOFZsMjltdE9waXV2ckVsWXJSeGlkSGlY?=
 =?utf-8?B?Ujh2Z04weWtFUGJ1Vm4yaWRxb3V0cjRWWlJXaUhtWCtHSUN0QWJvelFlNlJi?=
 =?utf-8?B?TW04aFVUTTZOVnlqYkIxVVk0RmF5RHpBb3I4cDZ3bVBkdmlDejZkSTZibTh3?=
 =?utf-8?Q?tam+rpHr7d5sCyuP/AnSoGw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf0a689-1ca3-484e-368f-08d9c45aaf3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 08:20:01.4215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUwNRJEAl76XcT1NXLD6QQhg8tLXHIcKgLgyvyFlkmnu+XaP+9LA9NQb4fdFE3JHSIQS9gYQ47NvBm+/QOiWww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEh1dGggPHRo
dXRoQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDIxLCAyMDIxIDM6MzUg
UE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT47IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsNCj4gTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT4NCj4gQ2M6
IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIHRlc3RzL3F0ZXN0OiBNYWtlIHRoZSBmaWx0ZXIgdGVzdHMgaW5kZXBlbmRlbnQgZnJvbSBh
DQo+IHNwZWNpZmljIE5JQw0KPiANCj4gT24gMjEvMTIvMjAyMSAwNy4zOCwgWmhhbmcsIENoZW4g
d3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBG
cm9tOiBRZW11LWRldmVsIDxxZW11LWRldmVsLQ0KPiA+PiBib3VuY2VzK2NoZW4uemhhbmc9aW50
ZWwuY29tQG5vbmdudS5vcmc+IE9uIEJlaGFsZiBPZiBUaG9tYXMNCj4gSHV0aA0KPiA+PiBTZW50
OiBNb25kYXksIERlY2VtYmVyIDIwLCAyMDIxIDY6MzAgUE0NCj4gPj4gVG86IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT4NCj4gPj4gQ2M6
IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+OyBZYW5nIEhvbmd5YW5nDQo+ID4+
IDx5YW5naHlAY24uZnVqaXRzdS5jb20+OyBaaGFuZyBDaGVuIDx6aGFuZ2NoZW4uZm5zdEBjbi5m
dWppdHN1LmNvbT4NCj4gPj4gU3ViamVjdDogW1BBVENIXSB0ZXN0cy9xdGVzdDogTWFrZSB0aGUg
ZmlsdGVyIHRlc3RzIGluZGVwZW5kZW50IGZyb20NCj4gPj4gYSBzcGVjaWZpYyBOSUMNCj4gPj4N
Cj4gPj4gVGhlc2UgZmlsdGVyIHRlc3RzIG5lZWQgYSBOSUMsIG5vIG1hdHRlciB3aGljaCBvbmUs
IHNvIHRoZXkgdXNlIGENCj4gPj4gY29tbW9uIE5JQyBieSBkZWZhdWx0LiBIb3dldmVyLCB0aGVz
ZSBjb21tb24gTklDIG1vZGVscyBtaWdodCBub3QNCj4gPj4gYWx3YXlzIGhhdmUgYmVlbiBjb21w
aWxlZCBpbnRvIHRoZSBRRU1VIHRhcmdldCBiaW5hcnksIHNvIGFzc3VtaW5nDQo+ID4+IHRoYXQg
YSBjZXJ0YWluIE5JQyBpcyBhdmFpbGFibGUgaXMgYSBiYWQgaWRlYS4gU2luY2UgdGhlIGV4YWN0
IHR5cGUNCj4gPj4gb2YgTklDIGRvZXMgbm90IHJlYWxseSBtYXR0ZXIgZm9yIHRoZXNlIHRlc3Rz
LCBsZXQncyBzd2l0Y2ggdG8gIi1uaWMiDQo+ID4+IGluc3RlYWQgb2YgIi1uZXRkZXYiIHNvIHRo
YXQgUUVNVSBjYW4gc2ltcGx5IHBpY2sgYSBkZWZhdWx0IE5JQyBmb3IgdXMuDQo+ID4+IFRoaXMg
d2F5IHdlIGNhbiBub3cgcnVuIHRoZSB0ZXN0cyBvbiBvdGhlciB0YXJnZXRzIHRoYXQgaGF2ZSBh
DQo+ID4+IGRlZmF1bHQgbWFjaGluZSB3aXRoIGFuIG9uLWJvYXJkL2RlZmF1bHQgTklDLCB0b28u
DQo+ID4+DQo+ID4NCj4gPiBPaCwgSXQncyBteSBhbmQgSG9uZ3lhbmcncyBhYmFuZG9uZWQgbWFp
bGJveC4NCj4gDQo+IFNvcnJ5LCBJIG9ubHkgbG9va2VkIGF0IHRoZSB0b3Agb2YgdGhlICouYyBm
aWxlcyBhbmQgY29waWVkIHRoZSBlLW1haWwgYWRkcmVzcw0KPiBmcm9tIHRoZXJlLg0KPiANCj4g
PiBMb29rcyBnb29kIHRvIG1lLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0KPiANCj4g
PiBCeSB0aGUgd2F5LCBzaG91bGQgSSBhZGQgdGhlIHRlc3QvcXRlc3QvdGVzdC1maWx0ZXIqIHRv
IHRoZSBNQUlOVEFJTkVSIGZpbGU/DQo+IA0KPiBUaGF0IG1pZ2h0IGJlIGhlbHBmdWwgaW5kZWVk
IHRvIGdldCB5b3UgQ0M6LWVkIGNvcnJlY3RseSBuZXh0IHRpbWUuDQoNCkFscmVhZHkgc2VuZCBh
IHBhdGNoIHRvIHVwZGF0ZSBpdC4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+ICAgVGhvbWFzDQoN
Cg==

