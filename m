Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4EC65A787
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 23:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBkZc-0004MJ-SB; Sat, 31 Dec 2022 17:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1pBkZa-0004J0-Ge; Sat, 31 Dec 2022 17:43:26 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1pBkZY-0005gX-AH; Sat, 31 Dec 2022 17:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672526604; x=1704062604;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dHPvFJA/ExbTSZYEHnrUjLBQatjZiE3uItIQb14O9pc=;
 b=AIQrrxsz56gakpPkMmgfO7jhGhdvpwcE8lCKHzZqPL/Yj6ryHp8YHez4
 FlVVSDaSR+FNJULAmLDCzgOiBPsJEEDS5JvaizSsf7nuLBNZ5lvn5duGY
 qKZ+6DDtixDjqOU157gQuJm+FBGAYvjX8MkdciI5sCodNSKVGYC2PgNAN
 vkfKi7U1X1RDkrKF9jO15mhdz/FLbYwsER58P0jjUvoXu5sxGXseCbX06
 vIlNcxEhKsZxJMybtdK7IvGhgEnXrSzvcLsutpw7qC8UnvAYvOE6xtJk6
 RoX4cJm7f6L3iRonD9K9D8eNjvdvGtOJoxUq+wzO9l+lJTqFdCC99jR2W Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="321404313"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; d="scan'208";a="321404313"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2022 14:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="604198049"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; d="scan'208";a="604198049"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 31 Dec 2022 14:43:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 31 Dec 2022 14:43:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sat, 31 Dec 2022 14:43:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sat, 31 Dec 2022 14:43:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXkzousB5kP628GqFjRVI/3Cg1lLq/GSozhIDvOeEESFgrvzBj/Iht83jNjNXVnA9VTWz/RYwMwAWCAge5N64S+05duvXOYSGBnBxc9SV9Ocwx8y6ucEtVpPOZKgKP+gbjpSlzCjs0NDmygYWC5aVUpUnUfv7iwbVPb2zxdzM7g7H/0f8gLTjDRYHodOmud8IRo0eX9GgtDb9D75dIEzLQVu6G3ctOMi0JqWpncM+GtBiUPBjrbjKKHXDG33czCjRRr3Q5EQFRdQXllSCTvOkjIXZGlOIOttcatgfENgN4EkrcHKCIjWHg4jxnlMgsgj5g+U2M5iAKqPfEL+bG/c6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHPvFJA/ExbTSZYEHnrUjLBQatjZiE3uItIQb14O9pc=;
 b=KK/d18s5VCrWQRxlt1EJm3G9WNTzvLzoKQ1/PVKPsrs4vAyXd635OfmwsjOMn0yZ+NqR6BUwO7ZQte1Jir53I5iQmREGpAkUUkIBSKt+6GTbhgWsSZ2aNhJfy3HI4grbCfpvR9ao7AJXzUPQov0bD7CVXRfG7vcw2bOJj144tJ0UXscGXAaWiQpgWFxY/JaQ3OyQ3TKn4ItwHH/Wh9ooswul9fd4AEDxq7tdIM2y/IcN/m48Vx818HttbpBAMSbv2yWCexsDCjYGjx6Z4NcSycbXhgsio5NkSmu7bKqGc8qx6UqZiuJDhf+t5GfrfG2iBJgY6xx7QCPcoLsX/kDZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3042.namprd11.prod.outlook.com (2603:10b6:208:78::17)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Sat, 31 Dec
 2022 22:43:16 +0000
Received: from BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::f270:c97a:887a:384]) by BL0PR11MB3042.namprd11.prod.outlook.com
 ([fe80::f270:c97a:887a:384%7]) with mapi id 15.20.5944.016; Sat, 31 Dec 2022
 22:43:16 +0000
From: "Dong, Eddie" <eddie.dong@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, "Peter Delevoryas"
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Cleber Rosa
 <crosa@redhat.com>
Subject: RE: [PATCH v2 01/11] hw/watchdog/wdt_aspeed: Rename MMIO region size
 as 'iosize'
Thread-Topic: [PATCH v2 01/11] hw/watchdog/wdt_aspeed: Rename MMIO region size
 as 'iosize'
Thread-Index: AQHZHEMAMEobFCQiYkOiwz+reB3hVq6Il7Kg
Date: Sat, 31 Dec 2022 22:43:16 +0000
Message-ID: <BL0PR11MB3042D4D8CA5F740D5EB3D5A08AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-2-philmd@linaro.org>
In-Reply-To: <20221230113504.37032-2-philmd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3042:EE_|SA0PR11MB4607:EE_
x-ms-office365-filtering-correlation-id: 94103acc-22ed-45e7-8edd-08daeb80680e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Af+fcTlk4LaQG8AHKWJNPESK1o+m+RPq+smyfjeUIkZs+bFGK6IoPH0g8xkvUW+SL45VIIr4KDCm0sDB4F44PcxFnYF0SrYKbnV2GG6E7ebW4zeD0IOO3W9fQ51CGlLBCCiqp2Fgc7+8Z/Yy7gPiTITHG5vCIuUzQEJcB1xzcrrfKn3/nopIsFRgEAEuXANGnwmI7rN6azw43TKdOIdRunJi4eA2el15Stm8FNBnIhaHYIyei1bm1PK7tfuuSvM9hbXRxM8TLltknOMztdxcnXjpa2J4jir7GkHbfruhHRGW4LOz9CrJtrvnqvxHkYHqBoEr5uL8dsnxk9SDQi8lVr0GUKNKnb3UjT9t/Y4dSszao1wa14UuPTjSs3TLDCDdZpopZHKbhmjDexehij/SDbzQP0MO/CRR4OKfpLs/h17uwTDxnjh8hpB3hjcDKX3vdMYX8q2rp20M0c9iD2cTfuSlDwfmgYJyPJZ5tTbOREbCd1rM1JLjg4oMQmI2AXSZW3Ze1ySv01FQFkbdEADm1DfdKU8ofFent/mBGUEx+HsmrJd1Uj473Qxl63L50sYDcmSBcbS1PfN9e6RoFGHGyunAFCF5oInfhPC2rXB4iskuU/W14QakCr77MlqRvkrV6gNvnBa25vVWrf/NEx87LjYjOJeOJ8nfeZe9bTdZxhRCi2Wdr96bMqTjuiU3GdKiKjRRwOLNyFbQfSYXwkbWtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3042.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199015)(5660300002)(7416002)(76116006)(41300700001)(4326008)(8676002)(71200400001)(52536014)(66556008)(64756008)(66476007)(66946007)(66446008)(8936002)(54906003)(316002)(2906002)(110136005)(478600001)(6506007)(7696005)(26005)(186003)(9686003)(33656002)(83380400001)(82960400001)(86362001)(55016003)(38100700002)(122000001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXZFQ3BNZG5ySGFnNWs5MjZPMUo4VFNmUHl6OWdUanJycCtJcEN2MC9FMy8v?=
 =?utf-8?B?RGZjb1BKOUxXaWlNQStaT0tiK2RlUVRucncyUXFxMGZKd0h5eTdYZkt3T0FC?=
 =?utf-8?B?cmwvNmY4NjVjenJEL1pFNTNNU3ZlUTBuMW5zZWdqQVozSTdyaCtjVkJTbzZu?=
 =?utf-8?B?SlR6aDdmdS91dis3RUQ3dFNrbVVsZ0RVUU5yNzM2UFFRbFhYS3AyOXN2Wkpm?=
 =?utf-8?B?Y0IvOEtYZ1A3NDM1eVJ6akhUdUZMY0tDNFkrY0c1dFRSU1E5S3NYSXBhdUpv?=
 =?utf-8?B?WXQ4R1pSQWZTSmlFMkhxeDJkTjhJR3J2WTVUVi9WSWZ1TWFJMHhId0hzOTY0?=
 =?utf-8?B?NzdETUhLNEZudTdWL1orU2ZOR1NMdlU1ZG9SeG5HZWJ0RkpDSnJ2SE44U1cx?=
 =?utf-8?B?RjduRFo3ZmExbDlKTkt2UGJsaEJNQTRwWG9FaDlWSHRLd2R6OGhaUFdsMEZF?=
 =?utf-8?B?aU8zcXZteHNNYVN6ZXhtMjhkcldNbHdieGtnWWdQUHFwTHRuRitTZmtRR2hL?=
 =?utf-8?B?L1pvMHVhQ25Rc3M1aUN1S3Zqam55bXJqOFY4aDVCZVJmV3BOQ2JaR1Y0R1B5?=
 =?utf-8?B?QmxQcHhhTk9iZU5MbTNRWnNSQUVxajJid3VKWVBIZm1ETmZDRnl3Tlg0Yndx?=
 =?utf-8?B?U1F6d0ZuSU9zNHBtOGdLVXZ1NU1jZFdRdlM3WDJobVJsdjRMU2srdXhldHZi?=
 =?utf-8?B?WkpkS3N2N0llWlV4WGIxMjY0N25pT05ab0s5R3g2SVBDckl3ckxHd1VPRkNY?=
 =?utf-8?B?b3Zpa3pVdEY3QTRXT05HUm8vdDdwekdKQ2VKY3dndGgxZExoY1grM1l0bCtX?=
 =?utf-8?B?a3R2V0NaNHN5MlVXMHpDckptVnpWZzJybVc5SGpoMHVOVWhyQUd5cDZMOE8x?=
 =?utf-8?B?UUEzOFhGVDN6cGJaVkhYM0xoclkzRWRRVWVLc1EraW1CSEI1RXlERzNMTGRr?=
 =?utf-8?B?UmFEUDZlcll0dEpHWmxzenN4dkVJZHZYWEh3bkxZVXNnMXk5MTNRWWxFOEJP?=
 =?utf-8?B?R2RUVnd5WnVIWG03bjFEQ1RpT2JCZE9kZ2N1WEpmb3NlamE1Y2E0TU9sRG5p?=
 =?utf-8?B?VUxzRm4xYXNUS3UxQTBzZFdEQ0thdm1zNURsalVUZDNJd1kvZ0FxTGtiWlFH?=
 =?utf-8?B?VHVHeVdLU0c1WCsxK0RacTQ0RkV4U09HMm16QzZheGcraFZ1b2g0RkthM3Zk?=
 =?utf-8?B?VWpMekZDcWgySmVYRGR6U0wrNUwva0oyQTBVOTJiRm9sbExlQWNKb3V4SDV2?=
 =?utf-8?B?enlwY2pBWjlzV3VwSDNUMHcrMWkrbnBJUUE5UFZIQW83WkdKaUd6NnQvSlB4?=
 =?utf-8?B?MDBQS2xmSEcrdUlVYUVNOWlrcEJoZ3p1U1FzS1Y1dWZPM0R5TUltNkthcVkr?=
 =?utf-8?B?b3BrUlVUL0YwVkNNcm9RdGdoQ0xueW5QNnFCaXVUQXJ3WkYzbEREMzV1NUtZ?=
 =?utf-8?B?Z2pwK1RYQ3pCQVpzYjlvMWdDSkNCLy90TTV5T2tYS0g2UVJmUWgzWmUxSVAv?=
 =?utf-8?B?WCtaOUNxRldVQTdUR0M5c2JQQUtycFZVZkgwR0p6bW9XTUJJZVlvOUl0eEk1?=
 =?utf-8?B?TXRHYmtVakVFcTFETExnb2cybFdDVnhoNld0b2dWVW5acTFKYXMxU2hLenY1?=
 =?utf-8?B?SmhWVTRwQWhVYVFxU003eExaYTBMT0JaL3o1THJpQThOc0U2UXhJQUhxUHNl?=
 =?utf-8?B?Y2ZtOGF4Qmg3VDVyT1pvRUlNODJlQjI2Q3QyQnF0bE0zVXhpM2pFT0hlc0Fs?=
 =?utf-8?B?bC9RNWxBNkw5NnRoTWYzaGlmT3BPYVFmYzNPWXlSSEsycFJUV2FCNGxSUVor?=
 =?utf-8?B?RFZ0UUdIcFIxN3NTZEZoNlNvYkpyTGFGYnBOeklxMCtoTmUxc1VBZnpRcmc1?=
 =?utf-8?B?WGxGbkRtazVtYXpaclRUS2VvUXpVSnJvSTV1T1gwZXFtaDF5dm00VDZuWE1p?=
 =?utf-8?B?YWhObm5lTkJsT3FPRGhDeGgvMmw1dGdjU01weFQvNllvUkZkR0xQTzhNTTNp?=
 =?utf-8?B?UTErQldmb3gvdmU1c3ZYa21Pb245OEZ6WU1jV1JvYjlWUklPOVhVUTEvYjBE?=
 =?utf-8?B?WHdvOEtjVGJ6em9ReCt5Ymd6Ulc4VHpodE1pYzY3NXpGem8vdjZYcGlrM0lv?=
 =?utf-8?Q?RlNq5i6SxrEq87ZtfUdz6hs7w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3042.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94103acc-22ed-45e7-8edd-08daeb80680e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2022 22:43:16.0316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYatRMWOvcB0BKb82xU0IN93Bm+/MUD+qDMeZSwDr7EGc7o43KWHide/Vjy1ZwlQhpuqSmry5eGsxaIFeUgm6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=eddie.dong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PiANCj4gQXZvaWQgY29uZnVzaW5nIHR3byBkaWZmZXJlbnQgdGhpbmdzOg0KPiAtIHRoZSBXRFQg
SS9PIHJlZ2lvbiBzaXplICgnaW9zaXplJykNCj4gLSBhdCB3aGljaCBvZmZzZXQgdGhlIFNvQyBt
YXAgdGhlIFdEVCAoJ29mZnNldCcpIFdoaWxlIGl0IGlzIG9mdGVuIHRoZSBzYW1lLCB3ZQ0KPiBj
YW4gbWFwIHNtYWxsZXIgcmVnaW9uIHNpemVzIGF0IGxhcmdlciBvZmZzZXRzLg0KPiANCj4gSGVy
ZSB3ZSBhcmUgaW50ZXJlc3RlZCBpbiB0aGUgSS9PIHJlZ2lvbiBzaXplLCBzbyByZW5hbWUgYXMg
J2lvc2l6ZScuDQo+IA0KPiBSZXZpZXdlZC1ieTogUGV0ZXIgRGVsZXZvcnlhcyA8cGV0ZXJAcGpk
LmRldj4NCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBs
aW5hcm8ub3JnPg0KPiAtLS0NCj4gIGh3L2FybS9hc3BlZWRfYXN0MTB4MC5jICAgICAgICAgIHwg
MiArLQ0KPiAgaHcvYXJtL2FzcGVlZF9hc3QyNjAwLmMgICAgICAgICAgfCAyICstDQo+ICBody9h
cm0vYXNwZWVkX3NvYy5jICAgICAgICAgICAgICB8IDIgKy0NCj4gIGh3L3dhdGNoZG9nL3dkdF9h
c3BlZWQuYyAgICAgICAgIHwgOCArKysrLS0tLQ0KPiAgaW5jbHVkZS9ody93YXRjaGRvZy93ZHRf
YXNwZWVkLmggfCAyICstDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkX2FzdDEweDAuYyBi
L2h3L2FybS9hc3BlZWRfYXN0MTB4MC5jIGluZGV4DQo+IDRkMGI5YjExNWYuLjEyMmIzZmQzZjMg
MTAwNjQ0DQo+IC0tLSBhL2h3L2FybS9hc3BlZWRfYXN0MTB4MC5jDQo+ICsrKyBiL2h3L2FybS9h
c3BlZWRfYXN0MTB4MC5jDQo+IEBAIC0zMjUsNyArMzI1LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVk
X3NvY19hc3QxMDMwX3JlYWxpemUoRGV2aWNlU3RhdGUNCj4gKmRldl9zb2MsIEVycm9yICoqZXJy
cCkNCj4gICAgICAgICAgICAgIHJldHVybjsNCj4gICAgICAgICAgfQ0KPiAgICAgICAgICBhc3Bl
ZWRfbW1pb19tYXAocywgU1lTX0JVU19ERVZJQ0UoJnMtPndkdFtpXSksIDAsDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICBzYy0+bWVtbWFwW0FTUEVFRF9ERVZfV0RUXSArIGkgKiBhd2MtPm9m
ZnNldCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBzYy0+bWVtbWFwW0FTUEVFRF9ERVZf
V0RUXSArIGkgKiBhd2MtPmlvc2l6ZSk7DQoNCg0KSG93IGRvZXMgdGhlIHNwZWNpZmljYXRpb24g
c2F5IGhlcmUgKEkgZGlkbid0IGZpbmQgaXQpPw0KDQpJIHJlYWQgdGhpcyBpcyBmb3IgYSBjYXNl
IHdoZXJlIG11bHRpcGxlIFdEVHMgYXJlIGltcGxlbWVudGVkLiANCkFuZCBvZmZzZXQgbWVhbnMg
dGhlIGRpc3RhbmNlIGlvIHJlZ2lzdGVycyBvZiBXRFRbMV0gYXJlIGxvY2F0ZWQgZnJvbSBXRFRb
MF0uDQpPciBkb2VzIHRoZSBzcGVjIGV4cGxpY2l0bHkgc2F5cyB0aGUgaW8gcmVnaXN0ZXJzIG9m
IFdEVFsxXSBpcyBsb2NhdGVkIHJpZ2h0IGFmdGVyDQpXRFRbMF0gd2l0aG91dCBhbnkgZ2FwcyBp
biB0aGlzIGNhc2UsIGlvc2l6ZSBpcyBiZXR0ZXIpPw0KDQo+ICAgICAgfQ0KPiANCj4gICAgICAv
KiBHUElPICovDQo+IGRpZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkX2FzdDI2MDAuYyBiL2h3L2Fy
bS9hc3BlZWRfYXN0MjYwMC5jIGluZGV4DQo+IGNkNzU0NjVjMmIuLmE3OWUwNWRkYmQgMTAwNjQ0
DQo+IC0tLSBhL2h3L2FybS9hc3BlZWRfYXN0MjYwMC5jDQo+ICsrKyBiL2h3L2FybS9hc3BlZWRf
YXN0MjYwMC5jDQo+IEBAIC00NzIsNyArNDcyLDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19h
c3QyNjAwX3JlYWxpemUoRGV2aWNlU3RhdGUNCj4gKmRldiwgRXJyb3IgKiplcnJwKQ0KPiAgICAg
ICAgICAgICAgcmV0dXJuOw0KPiAgICAgICAgICB9DQo+ICAgICAgICAgIGFzcGVlZF9tbWlvX21h
cChzLCBTWVNfQlVTX0RFVklDRSgmcy0+d2R0W2ldKSwgMCwNCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgIHNjLT5tZW1tYXBbQVNQRUVEX0RFVl9XRFRdICsgaSAqIGF3Yy0+b2Zmc2V0KTsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgIHNjLT5tZW1tYXBbQVNQRUVEX0RFVl9XRFRdICsgaSAq
IGF3Yy0+aW9zaXplKTsNCj4gICAgICB9DQo+IA0KPiAgICAgIC8qIFJBTSAqLw0KPiBkaWZmIC0t
Z2l0IGEvaHcvYXJtL2FzcGVlZF9zb2MuYyBiL2h3L2FybS9hc3BlZWRfc29jLmMgaW5kZXgNCj4g
YjA1YjlkZDQxNi4uMmMwOTI0ZDMxMSAxMDA2NDQNCj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9zb2Mu
Yw0KPiArKysgYi9ody9hcm0vYXNwZWVkX3NvYy5jDQo+IEBAIC0zOTMsNyArMzkzLDcgQEAgc3Rh
dGljIHZvaWQgYXNwZWVkX3NvY19yZWFsaXplKERldmljZVN0YXRlICpkZXYsDQo+IEVycm9yICoq
ZXJycCkNCj4gICAgICAgICAgICAgIHJldHVybjsNCj4gICAgICAgICAgfQ0KPiAgICAgICAgICBh
c3BlZWRfbW1pb19tYXAocywgU1lTX0JVU19ERVZJQ0UoJnMtPndkdFtpXSksIDAsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICBzYy0+bWVtbWFwW0FTUEVFRF9ERVZfV0RUXSArIGkgKiBhd2Mt
Pm9mZnNldCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBzYy0+bWVtbWFwW0FTUEVFRF9E
RVZfV0RUXSArIGkgKiBhd2MtPmlvc2l6ZSk7DQo+ICAgICAgfQ0KPiANCj4gICAgICAvKiBSQU0g
ICovDQo+IGRpZmYgLS1naXQgYS9ody93YXRjaGRvZy93ZHRfYXNwZWVkLmMgYi9ody93YXRjaGRv
Zy93ZHRfYXNwZWVkLmMgaW5kZXgNCj4gZDc1MzY5M2EyZS4uOTU4NzI1YTFiNSAxMDA2NDQNCj4g
LS0tIGEvaHcvd2F0Y2hkb2cvd2R0X2FzcGVlZC5jDQo+ICsrKyBiL2h3L3dhdGNoZG9nL3dkdF9h
c3BlZWQuYw0KPiBAQCAtMzA5LDcgKzMwOSw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF8yNDAwX3dk
dF9jbGFzc19pbml0KE9iamVjdENsYXNzDQo+ICprbGFzcywgdm9pZCAqZGF0YSkNCj4gICAgICBB
c3BlZWRXRFRDbGFzcyAqYXdjID0gQVNQRUVEX1dEVF9DTEFTUyhrbGFzcyk7DQo+IA0KPiAgICAg
IGRjLT5kZXNjID0gIkFTUEVFRCAyNDAwIFdhdGNoZG9nIENvbnRyb2xsZXIiOw0KPiAtICAgIGF3
Yy0+b2Zmc2V0ID0gMHgyMDsNCj4gKyAgICBhd2MtPmlvc2l6ZSA9IDB4MjA7DQo+ICAgICAgYXdj
LT5leHRfcHVsc2Vfd2lkdGhfbWFzayA9IDB4ZmY7DQo+ICAgICAgYXdjLT5yZXNldF9jdHJsX3Jl
ZyA9IFNDVV9SRVNFVF9DT05UUk9MMTsNCj4gICAgICBhd2MtPndkdF9yZWxvYWQgPSBhc3BlZWRf
d2R0X3JlbG9hZDsgQEAgLTM0Niw3ICszNDYsNyBAQCBzdGF0aWMgdm9pZA0KPiBhc3BlZWRfMjUw
MF93ZHRfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEpDQo+ICAgICAg
QXNwZWVkV0RUQ2xhc3MgKmF3YyA9IEFTUEVFRF9XRFRfQ0xBU1Moa2xhc3MpOw0KPiANCj4gICAg
ICBkYy0+ZGVzYyA9ICJBU1BFRUQgMjUwMCBXYXRjaGRvZyBDb250cm9sbGVyIjsNCj4gLSAgICBh
d2MtPm9mZnNldCA9IDB4MjA7DQo+ICsgICAgYXdjLT5pb3NpemUgPSAweDIwOw0KPiAgICAgIGF3
Yy0+ZXh0X3B1bHNlX3dpZHRoX21hc2sgPSAweGZmZmZmOw0KPiAgICAgIGF3Yy0+cmVzZXRfY3Ry
bF9yZWcgPSBTQ1VfUkVTRVRfQ09OVFJPTDE7DQo+ICAgICAgYXdjLT5yZXNldF9wdWxzZSA9IGFz
cGVlZF8yNTAwX3dkdF9yZXNldF9wdWxzZTsgQEAgLTM2OSw3ICszNjksNw0KPiBAQCBzdGF0aWMg
dm9pZCBhc3BlZWRfMjYwMF93ZHRfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQg
KmRhdGEpDQo+ICAgICAgQXNwZWVkV0RUQ2xhc3MgKmF3YyA9IEFTUEVFRF9XRFRfQ0xBU1Moa2xh
c3MpOw0KPiANCj4gICAgICBkYy0+ZGVzYyA9ICJBU1BFRUQgMjYwMCBXYXRjaGRvZyBDb250cm9s
bGVyIjsNCj4gLSAgICBhd2MtPm9mZnNldCA9IDB4NDA7DQo+ICsgICAgYXdjLT5pb3NpemUgPSAw
eDQwOw0KPiAgICAgIGF3Yy0+ZXh0X3B1bHNlX3dpZHRoX21hc2sgPSAweGZmZmZmOyAvKiBUT0RP
ICovDQo+ICAgICAgYXdjLT5yZXNldF9jdHJsX3JlZyA9IEFTVDI2MDBfU0NVX1JFU0VUX0NPTlRS
T0wxOw0KPiAgICAgIGF3Yy0+cmVzZXRfcHVsc2UgPSBhc3BlZWRfMjUwMF93ZHRfcmVzZXRfcHVs
c2U7IEBAIC0zOTIsNyArMzkyLDcNCj4gQEAgc3RhdGljIHZvaWQgYXNwZWVkXzEwMzBfd2R0X2Ns
YXNzX2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQ0KPiAgICAgIEFzcGVlZFdE
VENsYXNzICphd2MgPSBBU1BFRURfV0RUX0NMQVNTKGtsYXNzKTsNCj4gDQo+ICAgICAgZGMtPmRl
c2MgPSAiQVNQRUVEIDEwMzAgV2F0Y2hkb2cgQ29udHJvbGxlciI7DQo+IC0gICAgYXdjLT5vZmZz
ZXQgPSAweDgwOw0KPiArICAgIGF3Yy0+aW9zaXplID0gMHg4MDsNCj4gICAgICBhd2MtPmV4dF9w
dWxzZV93aWR0aF9tYXNrID0gMHhmZmZmZjsgLyogVE9ETyAqLw0KPiAgICAgIGF3Yy0+cmVzZXRf
Y3RybF9yZWcgPSBBU1QyNjAwX1NDVV9SRVNFVF9DT05UUk9MMTsNCj4gICAgICBhd2MtPnJlc2V0
X3B1bHNlID0gYXNwZWVkXzI1MDBfd2R0X3Jlc2V0X3B1bHNlOyBkaWZmIC0tZ2l0DQo+IGEvaW5j
bHVkZS9ody93YXRjaGRvZy93ZHRfYXNwZWVkLmgNCj4gYi9pbmNsdWRlL2h3L3dhdGNoZG9nL3dk
dF9hc3BlZWQuaA0KPiBpbmRleCBkZmE1ZGZhNDI0Li5kYjkxZWU2YjUxIDEwMDY0NA0KPiAtLS0g
YS9pbmNsdWRlL2h3L3dhdGNoZG9nL3dkdF9hc3BlZWQuaA0KPiArKysgYi9pbmNsdWRlL2h3L3dh
dGNoZG9nL3dkdF9hc3BlZWQuaA0KPiBAQCAtNDAsNyArNDAsNyBAQCBzdHJ1Y3QgQXNwZWVkV0RU
U3RhdGUgeyAgc3RydWN0IEFzcGVlZFdEVENsYXNzIHsNCj4gICAgICBTeXNCdXNEZXZpY2VDbGFz
cyBwYXJlbnRfY2xhc3M7DQo+IA0KPiAtICAgIHVpbnQzMl90IG9mZnNldDsNCj4gKyAgICB1aW50
MzJfdCBpb3NpemU7DQo+ICAgICAgdWludDMyX3QgZXh0X3B1bHNlX3dpZHRoX21hc2s7DQo+ICAg
ICAgdWludDMyX3QgcmVzZXRfY3RybF9yZWc7DQo+ICAgICAgdm9pZCAoKnJlc2V0X3B1bHNlKShB
c3BlZWRXRFRTdGF0ZSAqcywgdWludDMyX3QgcHJvcGVydHkpOw0KPiAtLQ0KPiAyLjM4LjENCj4g
DQoNCg==

