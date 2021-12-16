Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573447678B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 02:50:53 +0100 (CET)
Received: from localhost ([::1]:52818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxfv1-0001uh-Dq
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 20:50:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mxftW-0001EX-G3
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:49:18 -0500
Received: from mga07.intel.com ([134.134.136.100]:21980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mxftS-000692-S0
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 20:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639619354; x=1671155354;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oXxFRDr3Gimj31PAx+dNwwVWhFQXO9FgMjzaRYWul/I=;
 b=eGQ6/BAPC9piJ6swK+awa3bqRM46sXQax8d+nX17q3t5l47lqsZWfPfH
 xLkI5IkRFkVB6pfcUYfMjJoHg4wH/BkYbkzKsp/flJLmXQ1jDqVFcO3dv
 3Dtf0gmR8mezuAuASeyIy/HagvsTb4BvdbSkr0nWNKHDxrDU39rr8/Th/
 rGhuXfj60/IuYJW5A/yJMyWU5mUKoMA4+yYsWC/I6h+FjHKsMaaelTKdI
 o3DDtwOl7OJ7jcGIu6eumOepgBSRxizcz07kWy8tMrkm0p2KxPl74gtHl
 SMAyfLgxG9fe4FFMNEnJ2SV6PnwXAu5DVZQhumt7pb7EMb51UzvSNCKo1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="302753396"
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; d="scan'208";a="302753396"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 17:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; d="scan'208";a="605250781"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Dec 2021 17:49:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 17:49:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 15 Dec 2021 17:49:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 15 Dec 2021 17:49:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEh44EAARRZfre0w4nSk7n9yX/0JCTVQLfcbS5aESvz376cfUSYa5IqfrzyHVqXHQmxx8o+ckRh8h1K6MlAQ2xh2KZVWQPOtHvVzUaVeoj4a+56kOcWB7vtqlJhjF8dISJ8dYc4yRgX4gFcx58bV+sNOCdB7SE5m85o4cN6HEqbW+hoFS3L5doZWkRmYdpJCsWE1u0Bom2QFlsCaBjKQKHlbjfwtFBo2/Hppl0DfgRFn8F7ppu1PzplxuSvBBaZoy5kTjtHasNtFwoOroL/VHBPP0DX921cea7QJM3VwgU9FIg3b6l9LsmhS9xK7WC7YQ9xtOFyYqErW6U9Otsas1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXxFRDr3Gimj31PAx+dNwwVWhFQXO9FgMjzaRYWul/I=;
 b=U2E6bcHwdGz3rYD50NjTXxxLv4p8Ij8Id8BiLNeQvm+n/iFLL+9aNS7f/oZ5CpWKjm4O0dZkNDhROJD5yqlIYXPdKPEaRsgwH57shiVvd2YTIZm4PY9HkTXa+tkKfDYo7wuGtMLQAEkRBCvjKBD9xroRpiAY6BAFL/j2A5BIhaqJeiF0ywS5X2h19+243aucRBYqXqAHXYF1rYZuj04U70nepUgaJn5lNWZRy5MpuQ4R9ZCjJUV2440/vxZX303ZkbuiHZy4HgCzeyBy2gjFpCdH9WALukugnXuMvOTQKTAECxv38clrZgMUsuXimN5++s66oOaai+lrXPJlBiL7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 01:49:07 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4755.028; Thu, 16 Dec 2021
 01:49:07 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
Subject: RE: [PATCH v2] MAINTAINERS: Change my email address
Thread-Topic: [PATCH v2] MAINTAINERS: Change my email address
Thread-Index: AQHX8MA0Hkl0n1902UeXICdMW/P9fawxsZSAgAAFJICAAA+jgIAClXZA
Date: Thu, 16 Dec 2021 01:49:07 +0000
Message-ID: <MWHPR11MB00318F7C0BB113BD5C8ECB139B779@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211214075424.6920-1-zhanghailiang@xfusion.com>
 <fc7b5d91-98f6-b146-4a67-5e6800bccadc@redhat.com>
 <YbhiU8ARoS5LcORY@redhat.com>
 <b96112c8-c279-5cec-8670-25f12b560f5b@redhat.com>
In-Reply-To: <b96112c8-c279-5cec-8670-25f12b560f5b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb2229e0-faae-487b-6af3-08d9c0363f64
x-ms-traffictypediagnostic: CO1PR11MB5092:EE_
x-microsoft-antispam-prvs: <CO1PR11MB50929F752E897D6D547AAAC99B779@CO1PR11MB5092.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M5gumf0MpSyYHYlZ9+59PAeyJkVF1gZtLQevq9dYRNH7Bu8COuNHt0h90vK3wtn8XhD6AuP9BcmiXnxSnqt5WP5hnI95XS8+trh42xqFDK76JMK7iIx5r7tEHYfIb90prANnzOQ6bgio1rG7nCnFWnXeyDHts47IaD9CXzCg/c/rzxXr0WgGsIDmvJ4l6OPwOX4n2c7rGpDh6baLayXWL3iGhB0CCWhpe9IgAgEp7qh4dMQ2O2IqKr83dEIfCVywyiJ7lO+lgUJ6qE0plBK3zKb/5bDu6e6b+JSwC4LveIlcozm5AgDVOP6af5CTwtCCAmKa6eKterCDpmsuseMnDAiQHV4HqfKyQc+Q1f91ze+4Xv1X6R7MMTdBzBd8eeptXkTQqtbXinZoKsMrPXIP7AdeTL9zuFCmM6FN/ixIrXlANZyeGWAjL1hgMNQiiMYWP9XtVorGqVfzbKjHFHqAR51ORVZl5v2afuJlreZTtH6Uj+I73ssCYUkaQ5Wssc19+AkeWIvFT1529fmRd/93KfPXY2cUZtl8kCMfYZdTeNv3xfu6xJn27GN7/nuc6+jceD0/ay0P09FzHF1dYFKfxEBV11OwBHq1NU+TzhZHS+WNvslhEUL4ACmfyRmfmCS0jmJjQjCXTE3kL/zRC2m4Mw+Du2+1aiyfPyMw+MTmkdcmnYJW/dIbSbg9wUExK+al8fB4TqIKcckoH+UD+LmuXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(64756008)(66446008)(66556008)(86362001)(76116006)(66946007)(66476007)(186003)(9686003)(82960400001)(38070700005)(55016003)(83380400001)(110136005)(71200400001)(7696005)(8936002)(316002)(26005)(33656002)(5660300002)(508600001)(4326008)(38100700002)(52536014)(2906002)(122000001)(8676002)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWNWaTJvb0xRNUI0c1ZhWlU3YUQyVk8wamxyVFdVMURiTU1SQTIrdUZJSTQ1?=
 =?utf-8?B?SFZBMzlWSUV5aUpLMTJiSXA5OVhNYlgvaEtSWEpmY3ZGRFh3QnpRN0JMVGZt?=
 =?utf-8?B?YmR3eFMwL0VzM0hvOU10NkxZQnJvSVhUenpWb2JWSEJmQWJSU2tuUXJFTk9T?=
 =?utf-8?B?NEFkOWQrZmxadW9ieXZSeHREdDBsV1A0V1g2ZmdsUzFXMTBiU2lYbXUrYnJV?=
 =?utf-8?B?Vk1vaWhVcHVYOWhwcHM0ay9mMHZjeExFVXpYaW9jaFhqaWFsZlBTOXQvdVVS?=
 =?utf-8?B?c3JkeG1ERTRCbGRHZG9qOXBVcmdwTlFhUTAxTXZYVytEVDBQN3VCRUFhemxr?=
 =?utf-8?B?NW1PditKenVLcUpka3M1UzBXenB3OEQ5SVZ5RElHbVRTYkpuRGhPSm5GUEp3?=
 =?utf-8?B?cVhwRVVnSTZVcWk5Y2NtMCs4ZjIrVUxnU3orU3Y1K2VNQWRhSENNMTIrdnVp?=
 =?utf-8?B?eS9CN2tISEllNVVtSWk4NUFIZkRIUEcwZlVTL0x4RWx4dnRGQjVOTjZqV1VG?=
 =?utf-8?B?N2psOUlqdkNhQ01HcVdpbnFVM1JXeWVBalJuTUIxTStpQytjT3NSbXB6WnVj?=
 =?utf-8?B?em92d3YvZEFvTWw4UGJaMVFSYU50TXc3YzcxYzJhNE5xd2xLeC81bldEU2JO?=
 =?utf-8?B?Nzk2TGg0ZkJ2SGhSZldNNjZjTU5obnFJdSs3NUZrbTZFWHRpOW5MelIxY2Qz?=
 =?utf-8?B?UU83bVYzWXlrWkw1cmRHUmU4b0w3Tk5wSUhRREZmWTlaT011anE5VmsxTHJo?=
 =?utf-8?B?bU1RWFdkRjBwWlk1aDdKbmVyTTRrYThNQkxPemlZdFR4b01ldXBScTZLVTJO?=
 =?utf-8?B?U2pLSk1rZ25QZFFMeXo1MnVpa0ZBYUJSYStPQlZ4MHc3aGpmWnFVYndsRjJG?=
 =?utf-8?B?dmcvWC8yOUJsbmRVZ0RxTm5tYjBSQjI1UzdTRHI0ZzF6S3p2SjhFa1JSdHRZ?=
 =?utf-8?B?dUFhZU0wRGxYb1FxYVFvN2srQnlFVmRBNm9BMXVmMXZCOE8rZUpGS0hOK2dD?=
 =?utf-8?B?eVEwdGRQNG1MVFE2c1YyYW5TSjJINlA2c04xcHEwTUNoYnlvUEVGdUVmRk1r?=
 =?utf-8?B?T216V0tJWTN0SkhRM1dNT3RkYmV2b1dKem43UmpsN2JvaDNsV1FVanlwS0Fr?=
 =?utf-8?B?V2xKSEVnM3pOKzJTZEFlQnBVWnIyaDVYQlRESGxnbXZLdHRPNGYrVnZOZFl5?=
 =?utf-8?B?N0d2ZFNjWDl2dmw1V241NHZpeWlXV3psV0tkanVidWxFdmFXMFhmN1ZqWklY?=
 =?utf-8?B?L2xWV21aTk5xOFJGT0dTRFpGQStPZTJZNkltZzdCeU0rVjJvdC9IYUhaT0w1?=
 =?utf-8?B?djg1T0JicDVCR0llaHRqUnFSTGNCQlJHbStaK3ByaTNvN3V0R2M1M1NJeEJH?=
 =?utf-8?B?T3NpWk1HNUdSRkRZcHhZaE5sZG51eEtvVk94VEp1ckpEcnNFdWRNdTlPVW5n?=
 =?utf-8?B?RmZBalV2eUJ5WStUQUEwNkwvY0QyOC85UVk1SGJyMVRObHFoejdJYzR0NFRx?=
 =?utf-8?B?dWtWczN6VmNmWFAxNisydlZvdFphaXoyMUlNc29NU2VzUThjcmNoTmZ5V2ht?=
 =?utf-8?B?YjE3a0prODFreGx5NTVQL3NISkptNjMvb1UvYWFaSGJSUzNyTmdJejFqdGhl?=
 =?utf-8?B?Y0dLM1lBYzRMMGp4NFFVbjVReXI1SkEwTWRyYS9GQjB2Ri80b1VyNnovOVha?=
 =?utf-8?B?Z21EalBlWTFWOFRoZWhmYTR0MEczZ3pETFBoNkRSQmVxQ3duQ2kxRXQ3VzA3?=
 =?utf-8?B?STdheC93amJJT1lacjlFdldDZnhlV0t0RC9EVXRsTGloTlBWc0ZGZ0VJbE9I?=
 =?utf-8?B?N0sxVXR5eTZkUlVkR2ZyODB5bkpTQlJxU1ZlOHpBWTlzWlZsZVBoMS9kaGRi?=
 =?utf-8?B?dWdPVkpqU0JxRFRuUU1mMTlxNkV0aXRITWxwVkhuTnE4Z2daeTlUSWEvQjIw?=
 =?utf-8?B?a3BlVlJTOVhUS002UFhYMzBRcW05UjV5SFQ2Q2tBeWlJa0ZEZTdzQXdrQWNM?=
 =?utf-8?B?Uk0vRjNpQkJMK0J4VWRkQ1R0cWVubUhQQ1hqM1kvTXUrY0NzWWJRRWdQR1l4?=
 =?utf-8?B?TzJLbmw0c0VaWUsxYTBmOStucVZsWjF1U1NySjJ2a2RxUXBNOHdYMXphSzFy?=
 =?utf-8?B?TlRrUGZxWEZBMk9SNlNwQ29Ec2pwczU5Yys1U1VzMTM3TVNvWVIyL2JYK0Vn?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2229e0-faae-487b-6af3-08d9c0363f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 01:49:07.2579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /DH9PxDr1zfHSltXJ+ZRwd5QbucGYlDbBsjeH8TH7zsEVl9NVtKzGr3EOLs2xIvyB/zXkuxOM57oJUQ/TCrN9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, Gonglei <arei.gonglei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUWVtdS1kZXZlbCA8cWVt
dS1kZXZlbC0NCj4gYm91bmNlcytjaGVuLnpoYW5nPWludGVsLmNvbUBub25nbnUub3JnPiBPbiBC
ZWhhbGYgT2YgUGhpbGlwcGUNCj4gTWF0aGlldS1EYXVkw6kNCj4gU2VudDogVHVlc2RheSwgRGVj
ZW1iZXIgMTQsIDIwMjEgNjoxOCBQTQ0KPiBUbzogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFu
Z2VAcmVkaGF0LmNvbT4NCj4gQ2M6IEhhaWxpYW5nIFpoYW5nIDx6aGFuZ2hhaWxpYW5nQHhmdXNp
b24uY29tPjsgcXVpbnRlbGFAcmVkaGF0LmNvbTsNCj4gV2VuIENvbmd5YW5nIDx3ZW5jb25neWFu
ZzJAaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gZGdpbGJlcnRAcmVkaGF0
LmNvbTsgR29uZ2xlaSA8YXJlaS5nb25nbGVpQGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjJdIE1BSU5UQUlORVJTOiBDaGFuZ2UgbXkgZW1haWwgYWRkcmVzcw0KPiANCj4gT24g
MTIvMTQvMjEgMTA6MjIsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6DQo+ID4gT24gVHVlLCBE
ZWMgMTQsIDIwMjEgYXQgMTA6MDQ6MDNBTSArMDEwMCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
d3JvdGU6DQo+ID4+IE9uIDEyLzE0LzIxIDA4OjU0LCBIYWlsaWFuZyBaaGFuZyB3cm90ZToNCj4g
Pj4+IFRoZSB6aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20gZW1haWwgYWRkcmVzcyBoYXMg
YmVlbiBzdG9wcGVkLg0KPiA+Pj4gQ2hhbmdlIGl0IHRvIG15IG5ldyBlbWFpbCBhZGRyZXNzLg0K
PiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEhhaWxpYW5nIFpoYW5nIDx6aGFuZ2hhaWxpYW5n
QHhmdXNpb24uY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiBoaSBKdWFuICYgRGF2ZSwNCj4gPj4+DQo+
ID4+PiBGaXJzdGx5LCB0aGFuayB5b3UgZm9yIHlvdXIgd29ya2luZyBvbiBtYWludGFpbmluZyB0
aGUgQ09MTyBmcmFtZXdvcmsuDQo+ID4+PiBJIGRpZG4ndCBoYXZlIG11Y2ggdGltZSBvbiBpdCBp
biB0aGUgcGFzdCBkYXlzLg0KPiA+Pj4NCj4gPj4+IEkgbWF5IGhhdmUgc29tZSB0aW1lIGluIHRo
ZSBuZXh0IGRheXMgc2luY2UgbXkgam9iIGhhcyBjaGFuZ2VkLg0KPiA+Pj4NCj4gPj4+IEJlY2F1
c2Ugb2YgbXkgb2xkIGVtYWlsIGJlaW5nIHN0b3BwZWQsIGkgY2FuIG5vdCB1c2UgaXQgdG8gc2Vu
ZCB0aGlzIHBhdGNoLg0KPiA+Pj4gUGxlYXNlIGhlbHAgbWUgdG8gbWVyZ2UgdGhpcyBwYXRjaC4N
Cj4gPj4NCj4gPj4gQ2FuIHdlIGhhdmUgYW4gQWNrLWJ5IGZyb20gc29tZW9uZSB3b3JraW5nIGF0
IEh1YXdlaT8NCj4gPg0KPiA+IFdoeSBkbyB3ZSBuZWVkIHRoYXQgPw0KPiANCj4gVG8gYXZvaWQg
YW55b25lIGltcGVyc29uYXRpbmcgSGFpbGlhbmcgWmhhbmcuLi4NCj4gDQo+IEJ1dCBpdCBkb2Vz
bid0IGhhdmUgdG8gYmUgZnJvbSB0aGUgc2FtZSBjb21wYW55LCBhcyBsb25nIGFzIHNvbWVvbmUN
Cj4ga25vd2luZyBoaW0gdm91Y2ggdGhlIGNoYW5nZS4gQW55aG93IEkgYW0gbm90IG5hY2tpbmcg
dGhpcyBwYXRjaCwgSSBhbQ0KPiB0cnlpbmcgdG8gaGF2ZSBhIHNhZmVyIHByb2Nlc3MuDQo+IA0K
PiA+IFN1YnN5c3RlbXMgYXJlIG5vdCBvd25lZCBieSBjb21wYW5pZXMuDQo+ID4NCj4gPiBJZiBz
b21lb25lIG1vdmVzIGNvbXBhbnkgYW5kIHdhbnRzIHRvIGNhcnJ5IG9uIGluIHRoZWlyIGV4aXN0
aW5nIHJvbGUNCj4gPiBhcyBtYWludGFpbmVyIHRoYXQgaXMgZmluZSBhbmQgZG9lc24ndCBuZWVk
IGFwcHJvdmEgZnJvbSB0aGVpciBvbGQNCj4gPiBjb21wYW55IElNSE8uDQo+IA0KPiBJIGFncmVl
LCB0aGlzIGlzIHdoeSBpdCBpcyBiZXR0ZXIgdG8gc2VuZCB0aGF0IGtpbmQgb2YgY2hhbmdlIGZy
b20gdGhlIHRvLWJlLQ0KPiBzdG9wcGVkIGVtYWlsIGFkZHJlc3Mgd2hpbGUgaXQgaXMgc3RpbGwg
dmFsaWQuDQoNClN5bmNlZCB3aXRoIEhhaWxpYW5nIFpoYW5nIG9mZmxpbmUsIHZlcmlmaWVkLg0K
QWNrZWQtYnk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KDQpUaGFua3MNCkNo
ZW4NCg0KPiANCj4gVGhhbmtzLA0KPiANCj4gUGhpbC4NCj4gDQoNCg==

