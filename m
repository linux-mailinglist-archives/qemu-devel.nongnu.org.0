Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781F0651C68
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 09:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Y43-0006JJ-EY; Tue, 20 Dec 2022 03:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1p7Y40-0006Io-HD
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:33:28 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kai.huang@intel.com>)
 id 1p7Y3x-0006pY-PI
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671525205; x=1703061205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bj+DQ7RCOHGj9+8GhYwSxJ8pQuGTMOwvHuELv93xlFY=;
 b=cTgQ9ayztY/A450onhwdCEJJe6qJ1PNqJ3IT8sIe0l+05eNt6U9MnQYw
 NcZUWbrlksxqIg/Mm0IhdkhvDO7X4oXVJr8K81l54hLcE8cdoekZBqadc
 MKV/FNZQyaaTZoRCDce9sFoziCo0ZDvgyaJUY4Oztkmqdif6cOP611BLA
 k1KZEdzAJq+CX88WvBPmmvswfedWcbD9qKujy5KFBQfrqEl/+/GnnBuAi
 CxMiPhpMzFpQldD0vNYT5oePsdwWGRYVFx81E/bTIjoWMpuJcxUgF5mbF
 12GqkZf7QEVNOtJwnOMowa8CllI2xIO6F7KPm/hzcm6ynDmSsSD9Frhr1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="320738172"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="320738172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 00:33:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="681554661"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="681554661"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 20 Dec 2022 00:33:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 20 Dec 2022 00:33:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 20 Dec 2022 00:33:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 20 Dec 2022 00:33:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1mcP438OQp7CQh9f4nhr1JlfRkA5Sj6pEO7ycbC7UzgarbkOHkYzMvofSILT/JC9EUXJ4/UnwxZ7Q8b21o2u8UcQiRa6qBZInxgzd3cg28PvTi5LGS//Yn3eGASLGYkEvdwEGicR4bk+D/WO5a7Db1FcQbhp8QG7YY+OItrRDRXWE+ueIUCkSRklKGSeM044FQtfjC53tOHw9Z8s5lqTD41iYmQV1VUalA/sYSnbWY204txj2J48mr764EK5L5lO+xYi6ytO4IqUaG3hkcnJsvy4o9UaxyuIvHg0xITKe6+wtiNHaN9+ATOfrAu3WbdibOh9DLddZU2sYshYjgu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bj+DQ7RCOHGj9+8GhYwSxJ8pQuGTMOwvHuELv93xlFY=;
 b=c8fNaIla1646tgFi+TVGpQh0dKIu9e6Okd4a76NtW6X8aceAs46X6mpmQslUt5YtmoyT+l/jZyDFfdYuTBBNF01IztnDpFalB2U2HS0dbVe8JFunOrbb+bsCDCkiJ8GBjiX7wpgRCMTdCYOavUjP017Prqqz2pYVyKo/ljb7fQBp97H3kYa54RfSSwvQOB215gxS7d41KAQXHKYDTKu9Uo/wAkxx/iK4DiC+zDyVYGz5FoWjowd8d57HjKaYMjYFEmw0jY5lvIwp7h6UURvpH7DUiupf+v5+BLAnstTNjUit0ZmM/lsc1nSbYkXO5LRQfGX7RdDNVDrqW4TpOD3++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 08:33:06 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%8]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 08:33:06 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jmattson@google.com" <jmattson@google.com>, "Lutomirski, Andy"
 <luto@kernel.org>, "ak@linux.intel.com" <ak@linux.intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "Hocko,
 Michal" <mhocko@suse.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "tabba@google.com" <tabba@google.com>, "david@redhat.com" <david@redhat.com>, 
 "michael.roth@amd.com" <michael.roth@amd.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "bfields@fieldses.org" <bfields@fieldses.org>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "bp@alien8.de" <bp@alien8.de>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "rppt@kernel.org" <rppt@kernel.org>,
 "shuah@kernel.org" <shuah@kernel.org>, "vkuznets@redhat.com"
 <vkuznets@redhat.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "qperret@google.com"
 <qperret@google.com>, "arnd@arndb.de" <arnd@arndb.de>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "vannapurve@google.com" <vannapurve@google.com>,
 "naoya.horiguchi@nec.com" <naoya.horiguchi@nec.com>, "Christopherson,, Sean"
 <seanjc@google.com>, "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, "hughd@google.com"
 <hughd@google.com>, "aarcange@redhat.com" <aarcange@redhat.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>, "jlayton@kernel.org"
 <jlayton@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Wang, Wei W"
 <wei.w.wang@intel.com>, "steven.price@arm.com" <steven.price@arm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen, Dave"
 <dave.hansen@intel.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "linmiaohe@huawei.com" <linmiaohe@huawei.com>
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Thread-Topic: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Thread-Index: AQHZBhXuq53UEB1w4kqtU0OzCkPOIq5sjtQAgAhi5ICAAA9XAIABemYAgAATugA=
Date: Tue, 20 Dec 2022 08:33:05 +0000
Message-ID: <126046ce506df070d57e6fe5ab9c92cdaf4cf9b7.camel@intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <5c6e2e516f19b0a030eae9bf073d555c57ca1f21.camel@intel.com>
 <20221219075313.GB1691829@chaop.bj.intel.com>
 <deba096c85e41c3a15d122f2159986a74b16770f.camel@intel.com>
 <20221220072228.GA1724933@chaop.bj.intel.com>
In-Reply-To: <20221220072228.GA1724933@chaop.bj.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|MW3PR11MB4540:EE_
x-ms-office365-filtering-correlation-id: b4671d96-c831-4dc6-ee3b-08dae264d11a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F6Z0jNw7a3IiYyxkewRvE4ZpqEG730ZS2HgT8g1db1X7FJ4RZjzsvV8Dtlw0BtTgV/L2vJj0qhbNJMtMP6Djj1V3yadQ0A+KWI6sZYj3JeN0FvsjUjIBn5vVg0kp7PMD/ejYSU9tbhZwFKduLzGwzaEt64OnU1m1bmTBr6x4jpeyMDfYQS10PuZFs8obF+p3quX3vf5NYcwwgeNEwR1qc97IE+jG7aOkjMno4dwULJvjXl12+Y65XytF6J/D57Q5z1AF0F2/DaOap6jFjeSxrQQzaY71pgPCmxqjD/fEyh02+C/TUe73pVjZdxPK1Ec5PjP6MDfg+9weeugj6Eve1bg976IeOw7+jLei71d1ziQYmDYyrq6FIIV7MIsYJjHyV0tgBjML9NA7dH/uVeaknM+ytA/hUfdQ0wGcQ9nBqg5RpJZ8gKF1ZmqWoAlfDa9bV7HSc/SXPqdFw6Ju+UWmdLUjLLLfamx+dV0ALtNvIACPcDUMUY/egFSoOePos4EZupndBj2M5VzkctS0hWw3NFcy267EAmni0Zkj2KaNKc+rayyT4ZcXAhT3xWM/M3zM6TDdYHh47iX2qHBvg4JYIeWd4/WjVoHSIinlYI/tyhK1+jjitjwutQ4kyDInaNn41ERh+INrjKzqHyKXW+DeLd9GrCR+TmJ82c9QXnjnO0np3gbkLOPOW2hb/q68mP00vCnAYCYK16ho3cixxWbLAfHRFmEEG5qifnwvH/3qnOmW0V0kdp0UJ83yA6KQ6b8JOA+QFWKjg/mCQZav2KQSPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5978.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199015)(38070700005)(5660300002)(7416002)(7406005)(86362001)(6512007)(71200400001)(186003)(26005)(316002)(54906003)(6916009)(83380400001)(478600001)(6486002)(6506007)(36756003)(966005)(91956017)(82960400001)(66476007)(66446008)(122000001)(64756008)(38100700002)(66946007)(76116006)(2616005)(66556008)(2906002)(8936002)(4001150100001)(4326008)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTRGQTdyZk8xT0RYby90VjFFaGtXOVUxRWJVWmZFRERVRlZPT0p1SFFPUGJH?=
 =?utf-8?B?UGorREVEZlV3ZHVTZ3ZSWUR1NHE1UVQ5ZXd6c3FiTlNpSnFTS04zb0owTlEx?=
 =?utf-8?B?azlNUkczNWZGTnlUUHp0WE91cEhZWks1R2NTdmhQY3VIaG1vL0lBa0ZmUGNO?=
 =?utf-8?B?ZzRwVGM5TzBMb1EwMllwcXU1aVVSL1JMa0FHZFVtM2J2Rzc1UWVsQ24yOGdh?=
 =?utf-8?B?SWtTUkJ2aSs5allIU0JqVHZzYTNuV2FoSVIvWE8rNVhXNk9ZbkROSk1UcUVY?=
 =?utf-8?B?U2ozN1R4eW02YzVncVNvT2hRckRLVFRDOE1LNThEMW5yWGNnUkNFd1M0cVJn?=
 =?utf-8?B?eTlzVHg2d3ZKbXR2czNmenlJdjM3Umh0eVlnZUdNSTJXdlFlblhWZ2V0Qmw3?=
 =?utf-8?B?Zy9MS0lIc3JoVHQ0QklIcTd5ZWlNaEtXQ1JwTkdYekZtemVaR2YyRzhIZnpX?=
 =?utf-8?B?eG1uTHB0bUVFOWFjQ0lKblkwTFp1bTNVNlB1T2V5RU1WR3o5ZFJrSVVNRGQw?=
 =?utf-8?B?V2V1cWYyMmkzcU1zWmxPV1lsTlY0TTJCdzNSWjRzWnFnTFJSNTlHUDZsYmoy?=
 =?utf-8?B?MW5OYy9nN1RqejdvN1R5dUNDY0haeWgvem9qbTY3cW00dnY5ckoxK1FHb2RZ?=
 =?utf-8?B?SVZJNUJlU2NvelVQMWtoeURWOGJLRHVWWEE2cEdoWjhSRm4yaTJ1V0VRQXRH?=
 =?utf-8?B?MW43OStZcktxZExtQmZHRmtLT3RONklkLzZaZHluWUpxK1k5RGl1d2l1WDll?=
 =?utf-8?B?bkhjRk9YOXhLNUFRTnlwNzh0NjlzS3ZIRkRFQ25yK3VmOGYrR3JCZTNVbS8y?=
 =?utf-8?B?WFlaZXhMUklKZnNwMExCeG1xU2FiV2hpQU94NlJKSUlRMGxzTTlOR01XSXIx?=
 =?utf-8?B?Z2JGSFpwekhUUW91eFlEZEx0djExU2F6TDlTRkhpZndBd0c1WTkrMFJPVGU5?=
 =?utf-8?B?QmRpKy9wOVV2UUN6S1dRK2YwSGpDQzJ4TGRvU1hvMkhwT0NvZW9NMStNcFdp?=
 =?utf-8?B?U3BkMXJTOENKeGIrSUxsd1pOZFdNbEZpVWdobGh6MWczTlJ2M0dHYkVjSkd3?=
 =?utf-8?B?UjVoUHZNVG5OQ2FKaVVLdjZiR3kza2oyaXpVdkVjRWUxc2lPRnoydmFoZGtw?=
 =?utf-8?B?U2owS1pLYkYwZU5yNFE2RzhFbUJhMnFieW9HZzRuMFZYb25velJFNnNBckNI?=
 =?utf-8?B?S2o4TWRTbHM4QlRTNXF1b2VGdHR2N3VhKzhVMnVoQ0FkYW5rYk5NKzZyOUpl?=
 =?utf-8?B?bzJCSm5NRmRWcnZvTGlDeldoY2Jzb3cxUVladERDdnh2SkFJWHZzOW8rZFlj?=
 =?utf-8?B?UmlQbFNFVHE1YTVpWHAwUThuMEJiNGlyU0ExZk02V2QyaVBEWTJpZXFMTEJK?=
 =?utf-8?B?NHVDS0JjT29MV0pWQnh4S0xYNVE5WmE3ZFJyWEhHZk9KRktuTVNBNlFFNjhL?=
 =?utf-8?B?Ly9POTVRdDE0VUw5UCsrYnF3TGlZMXVtZ2g1aGE2bEEzeisrNGw5NmNuN3JC?=
 =?utf-8?B?LzEwVUE2emJJdGN3WEZMUDRNcmZzUER3NkQ1TjJvUURJaWFnNVBVWC9vRlQ1?=
 =?utf-8?B?UDZQd1puZHVzOUE4a1VWam1IWkQyUFV6MUlLTksvN2I2SEllNHluVWJJMFI4?=
 =?utf-8?B?Q2Y4VUhHM3Z2aitqUUppRFpJVXBNSUE3UFo3THJaMENVbGhNMEp1a1hNQ1FM?=
 =?utf-8?B?UlpmY25ZOXVMZElIOXdDTll3ZnNBY1lNbDBGUCtuVk9yL2pjMVhQVVpIT3cy?=
 =?utf-8?B?UGVRaEhnS0dsYnZIYVNjS0pWODdaYVRPeHNHT0l4TkJ2VlBwME8rQlMrTTZq?=
 =?utf-8?B?cFFYWVJYbDNZRlFxYU1jUlFHUVpZMklDMHR0UkZIbkZCSDB3eTIxM1BYN3Ix?=
 =?utf-8?B?Y3BsMW5xYk9TNERVSUJYU0FFSy81VUJWQjFTdWlUQngzcXlVd2NjdlZHdDY5?=
 =?utf-8?B?NDBvWUFudWNMaUh1cEJ3bllIMUk3ZmdvMXlEQUowbXJMSEN6Y3FoKy9OR0dE?=
 =?utf-8?B?bVphV2VjTkN5cWIwK3Noc0VZYVBRRXZ5VGVFVHVKNkw3cnV2dUlQNFdBQ3hE?=
 =?utf-8?B?YkxlNjJKZFZYeS82eUFVSnFHcmRvbWtONjBsZWxTOWR0VVl6dGdzWnlOSmRL?=
 =?utf-8?B?akVYRWRacFpMZ0NsVU43c3Z3cm9oYjBRemZnWnlMNlc2TE5OMU5jUEplYnFS?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A00ABB0B58140F4B88BF23884A0E2A62@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4671d96-c831-4dc6-ee3b-08dae264d11a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 08:33:05.8687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jpU4zO9aOkjbm3ikhQoOsFpPKpUJNxQbkMTnzZgrxLv5K34XDsCs9nKHH3mZg6QCftMjIfU3X2VCL9dfyS8Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=kai.huang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gVHVlLCAyMDIyLTEyLTIwIGF0IDE1OjIyICswODAwLCBDaGFvIFBlbmcgd3JvdGU6DQo+IE9u
IE1vbiwgRGVjIDE5LCAyMDIyIGF0IDA4OjQ4OjEwQU0gKzAwMDAsIEh1YW5nLCBLYWkgd3JvdGU6
DQo+ID4gT24gTW9uLCAyMDIyLTEyLTE5IGF0IDE1OjUzICswODAwLCBDaGFvIFBlbmcgd3JvdGU6
DQo+ID4gPiA+IA0KPiA+ID4gPiBbLi4uXQ0KPiA+ID4gPiANCj4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gKwkvKg0KPiA+ID4gPiA+ICsJICogVGhlc2UgcGFnZXMgYXJlIGN1cnJlbnRseSB1bm1vdmFi
bGUgc28gZG9uJ3QgcGxhY2UgdGhlbSBpbnRvDQo+ID4gPiA+ID4gbW92YWJsZQ0KPiA+ID4gPiA+
ICsJICogcGFnZWJsb2NrcyAoZS5nLiBDTUEgYW5kIFpPTkVfTU9WQUJMRSkuDQo+ID4gPiA+ID4g
KwkgKi8NCj4gPiA+ID4gPiArCW1hcHBpbmcgPSBtZW1mZC0+Zl9tYXBwaW5nOw0KPiA+ID4gPiA+
ICsJbWFwcGluZ19zZXRfdW5ldmljdGFibGUobWFwcGluZyk7DQo+ID4gPiA+ID4gKwltYXBwaW5n
X3NldF9nZnBfbWFzayhtYXBwaW5nLA0KPiA+ID4gPiA+ICsJCQnCoMKgwqDCoCBtYXBwaW5nX2dm
cF9tYXNrKG1hcHBpbmcpICYgfl9fR0ZQX01PVkFCTEUpOw0KPiA+ID4gPiANCj4gPiA+ID4gQnV0
LCBJSVVDIHJlbW92aW5nIF9fR0ZQX01PVkFCTEUgZmxhZyBoZXJlIG9ubHkgbWFrZXMgcGFnZSBh
bGxvY2F0aW9uIGZyb20NCj4gPiA+ID4gbm9uLQ0KPiA+ID4gPiBtb3ZhYmxlIHpvbmVzLCBidXQg
ZG9lc24ndCBuZWNlc3NhcmlseSBwcmV2ZW50IHBhZ2UgZnJvbSBiZWluZyBtaWdyYXRlZC7CoCBN
eQ0KPiA+ID4gPiBmaXJzdCBnbGFuY2UgaXMgeW91IG5lZWQgdG8gaW1wbGVtZW50IGVpdGhlciBh
X29wcy0+bWlncmF0ZV9mb2xpbygpIG9yIGp1c3QNCj4gPiA+ID4gZ2V0X3BhZ2UoKSBhZnRlciBm
YXVsdGluZyBpbiB0aGUgcGFnZSB0byBwcmV2ZW50Lg0KPiA+ID4gDQo+ID4gPiBUaGUgY3VycmVu
dCBhcGkgcmVzdHJpY3RlZG1lbV9nZXRfcGFnZSgpIGFscmVhZHkgZG9lcyB0aGlzLCBhZnRlciB0
aGUNCj4gPiA+IGNhbGxlciBjYWxsaW5nIGl0LCBpdCBob2xkcyBhIHJlZmVyZW5jZSB0byB0aGUg
cGFnZS4gVGhlIGNhbGxlciB0aGVuDQo+ID4gPiBkZWNpZGVzIHdoZW4gdG8gY2FsbCBwdXRfcGFn
ZSgpIGFwcHJvcHJpYXRlbHkuDQo+ID4gDQo+ID4gSSB0cmllZCB0byBkaWcgc29tZSBoaXN0b3J5
LiBQZXJoYXBzIEkgYW0gbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBpdCBzZWVtcyBLaXJpbGwNCj4g
PiBzYWlkIGluIHY5IHRoYXQgdGhpcyBjb2RlIGRvZXNuJ3QgcHJldmVudCBwYWdlIG1pZ3JhdGlv
biwgYW5kIHdlIG5lZWQgdG8NCj4gPiBpbmNyZWFzZSBwYWdlIHJlZmNvdW50IGluIHJlc3RyaWN0
ZWRtZW1fZ2V0X3BhZ2UoKToNCj4gPiANCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tbS8yMDIyMTEyOTExMjEzOS51c3A2ZHFoYmloNDdxcGpsQGJveC5zaHV0ZW1vdi5uYW1lLw0K
PiA+IA0KPiA+IEJ1dCBsb29raW5nIGF0IHRoaXMgc2VyaWVzIGl0IHNlZW1zIHJlc3RyaWN0ZWRt
ZW1fZ2V0X3BhZ2UoKSBpbiB0aGlzIHYxMCBpcw0KPiA+IGlkZW50aWNhbCB0byB0aGUgb25lIGlu
IHY5IChleGNlcHQgdjEwIHVzZXMgJ2ZvbGlvJyBpbnN0ZWFkIG9mICdwYWdlJyk/DQo+IA0KPiBy
ZXN0cmljdGVkbWVtX2dldF9wYWdlKCkgaW5jcmVhc2VzIHBhZ2UgcmVmY291bnQgc2V2ZXJhbCB2
ZXJzaW9ucyBhZ28gc28NCj4gbm8gY2hhbmdlIGluIHYxMCBpcyBuZWVkZWQuIFlvdSBwcm9iYWJs
eSBtaXNzZWQgbXkgcmVwbHk6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
bS8yMDIyMTEyOTEzNTg0NC5HQTkwMjE2NEBjaGFvcC5iai5pbnRlbC5jb20vDQoNCkJ1dCBmb3Ig
bm9uLXJlc3RyaWN0ZWQtbWVtIGNhc2UsIGl0IGlzIGNvcnJlY3QgZm9yIEtWTSB0byBkZWNyZWFz
ZSBwYWdlJ3MNCnJlZmNvdW50IGFmdGVyIHNldHRpbmcgdXAgbWFwcGluZyBpbiB0aGUgc2Vjb25k
YXJ5IG1tdSwgb3RoZXJ3aXNlIHRoZSBwYWdlIHdpbGwNCmJlIHBpbm5lZCBieSBLVk0gZm9yIG5v
cm1hbCBWTSAoc2luY2UgS1ZNIHVzZXMgR1VQIHRvIGdldCB0aGUgcGFnZSkuDQoNClNvIHdoYXQg
d2UgYXJlIGV4cGVjdGluZyBpczogZm9yIEtWTSBpZiB0aGUgcGFnZSBjb21lcyBmcm9tIHJlc3Ry
aWN0ZWQgbWVtLCB0aGVuDQpLVk0gY2Fubm90IGRlY3JlYXNlIHRoZSByZWZjb3VudCwgb3RoZXJ3
aXNlIGZvciBub3JtYWwgcGFnZSB2aWEgR1VQIEtWTSBzaG91bGQuDQoNCj4gDQo+IFRoZSBjdXJy
ZW50IHNvbHV0aW9uIGlzIGNsZWFyOiB1bmxlc3Mgd2UgaGF2ZSBiZXR0ZXIgYXBwcm9hY2gsIHdl
IHdpbGwNCj4gbGV0IHJlc3RyaWN0ZWRtZW0gdXNlciAoS1ZNIGluIHRoaXMgY2FzZSkgdG8gaG9s
ZCB0aGUgcmVmY291bnQgdG8NCj4gcHJldmVudCBwYWdlIG1pZ3JhdGlvbi4NCj4gDQoNCk9LLiAg
V2lsbCBsZWF2ZSB0byBvdGhlcnMgOikNCg0K

