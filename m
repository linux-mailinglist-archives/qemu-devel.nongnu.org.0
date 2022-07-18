Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA01577CC8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 09:46:20 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDLSN-0001aC-F3
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 03:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oDLQe-0008WU-Qi
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:44:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:27085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oDLQb-0001GJ-RK
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 03:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658130269; x=1689666269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jEISKMQJmK0vad0rtzurkkKzJ/JVOyfHnu7oX0cz74U=;
 b=bLuCHNR79l9W9gpYZeR4GeKw7i1aOHbSp/JWLp6yLiAWhpKEeMgDrO3T
 Fu5BHZVjPC9Pjff2pk6WehXuG7OBtsWfcnV5O1bACntp3ZQwqexsq7/uz
 nmlq2UoSA82Urm8RRyTFKF9yAlr7G5Js2v/znR+j6Mg1GtC3C/HoiiDCs
 hflL33vRzRuVsoFA3zZM1/uqfbL75AtX1bPhW3f4XQ0ulzZ7LvNmUSPkL
 Z0TOfutCHKDkhoR+YYOu4u/FCTvHp2NfKKlqkW2NLTwYkIsR6j6jXizv3
 iAc5d5MweSmaKvoZEWcwF4KoBvyBKB4bWmLkPwpwvPJL/BPnGVzD/tRA2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="350121302"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="350121302"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 00:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="597157481"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 18 Jul 2022 00:44:27 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 00:44:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 00:44:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 18 Jul 2022 00:44:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 00:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAfuhXXTX8x3UPFu5Ihl5ZnLv2cEP81mmI8EVctKl95NfKz7Hrpm1n1oG7SWTbEiHiNbtAQ2yESga+QnGYk0SX0TlrxRBsmbW+mEgvmcFAXvqroTGw+TjP6iQHhpgeAZcpx6LMIYA95p6ImZuCys25ypyxgmBipt2g/4JP3UWC1yIMoLd16JngaD0J+Umn1wtTp4Z4FhUZmmoJc59KeCpFTl5Pnx04nuK4+PI7vUygFZSemdGNrGDOmUQF3zPGKYMB8cMtfAOM8TinG34/cqNJnO60zk8cXswLp9YkLnbcktqW6cil5FnahBPS2I6Jtv58v1QkYEOeo2BChvShMULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEISKMQJmK0vad0rtzurkkKzJ/JVOyfHnu7oX0cz74U=;
 b=hPDqraKDc+TOpLGqjruEvXEgVrwGI4NPmfZT8y8gS0WSa6b/tB31V+BuQjiqDISIY0+uGG7x2dWMm8fVJBhkHmhCoN0oGU6NjpjI2FDXqPulaNcArPr0MwX3z+OgAajy6ey2EZmQThoFFy8tsUUt7JdNgKxJLkUtzjcS25OxJzGigU6i+32ju8GdgXPh5exQ8ATzpUAt1xR52vYBrICPR9cJsI0+xF+QjLTPtAOKjPOxG5E9LBHUHsN0mOl6+F7CUO6QE8HbknzhF45Qc2g7jSFA2vyd4FScEBhGPFdAeQ0LAXzw2Tovj/X9t34nPgOxIis1/T2+gqh/Qgl5JxBBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by SJ0PR11MB5054.namprd11.prod.outlook.com
 (2603:10b6:a03:2d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 07:44:24 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d73:edaf:8500:a40d%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 07:44:24 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Like Xu <like.xu.linux@gmail.com>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "mtosatti@redhat.com"
 <mtosatti@redhat.com>, "Christopherson,, Sean" <seanjc@google.com>, "Ma,
 XiangfeiX" <xiangfeix.ma@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] i386: Disable BTS and PEBS
Thread-Topic: [PATCH] i386: Disable BTS and PEBS
Thread-Index: AQHYmlazwj8/cO8xi0SzVzXLZpnnXa2DgFEAgAAr/pA=
Date: Mon, 18 Jul 2022 07:44:24 +0000
Message-ID: <MWHPR1101MB2110547F91AD830F42BB4D2F928C9@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
 <a6a439ad-7cca-11e4-a73f-83346c22453a@gmail.com>
In-Reply-To: <a6a439ad-7cca-11e4-a73f-83346c22453a@gmail.com>
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
x-ms-office365-filtering-correlation-id: 69adf6e3-0ed2-4562-1675-08da689155a4
x-ms-traffictypediagnostic: SJ0PR11MB5054:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QySmXzN2hAMqqjm/sclzFrTxo1wkqNDnVKq1NlvwCwUubUU1tmWoPQxLz6Y9Axgrj6Bjd4P32OT0ww7YHLNGxMh99o6lTmOh9sNIFzfMTx9Vm/t6zUd2ypIcIHxgaH+sFWIRJpEe+A3Rkt2GZb234zLaY65OOTtkUOe1w3o27SIah/HKYe6vsh6C8KQBgVxHdoFNBjBGSyc3EO3DQLXHaHwt0x+kI77YffLdy/yFGMT79D7BcCeM+3fi+34b6oFD0dQWPD/+I8hUiW20Mq6nMguuIorY5Qa5lezSvX1v/4JVSoYoj5ItbvEH99nlAJkZpmYGw9RbjED8ulEXaR7rd0cdw11DWPImQAajXEaUrNs+dF7+tFhHCD+Jm6A2xCAc/5EXQPl2Kt1AVU2gUlU2dV1hmaUeXgbX2NEIG9ekcKW0qWcWm9l3BO/Z1eIQkH8LNCj1OGM5oMajhKMNU23HkNb7nCikoysmr8N0OPb2GIILiyroHE4F9AW1TtetpEtgrJCU/SG9FjrWiA9T762+wubLRpF3cmX0yK/O6+0O2lBjS5HNNFqi2UXWlefATdfAN1oxx4ePXf84ZovSIlm8Uu8Da4sRNQgrwW3tAtKBYBsUzOeeM/j95l7xOwpaQ/1GU11MUrOJ+aFLeAt85BtyzGmhqcr1FZVYDWofujL/FKaKPCLWYZLgpWpNJ2qeIBBeJHBihcqz8Boowid+d3EnywYlPwOQiSSRmuEqnAl0TBSU5vrRHADKB0XobA3iDrD17k2TOHb3RlqRUYZDTIF8PtVfiXDup5TICqXT6wM0SPbzNkd7lIJhwt89TXCePokBzamw3NJvHqKtgbuWghsXpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(39860400002)(376002)(136003)(41300700001)(26005)(122000001)(9686003)(82960400001)(6506007)(7696005)(38100700002)(2906002)(55016003)(186003)(5660300002)(83380400001)(33656002)(6916009)(54906003)(316002)(8936002)(478600001)(52536014)(71200400001)(86362001)(4326008)(8676002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(38070700005)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ly9NTTI2K3I2TC80akVyTkpOeWc5QkJxTzVFSTJqeis3ajFHd0l1T1lVdmN6?=
 =?utf-8?B?VkRQeXQ1SXcrdVVhQVE1YlhUbGR5bk9BWEg1ZVo3b0UvVk04YkoxZ3lUS1Ux?=
 =?utf-8?B?Z0o4N25BTlAvb0FkbzZDbzA3elNmcytmclZDY3Q1Y2Q1emY2eEJDdmFZaU94?=
 =?utf-8?B?djRUek5BTFk4S1dMZzVvN0ppSDJaN2pxQWFUUzZrUzJQdXpSV0dOYXBLV1NN?=
 =?utf-8?B?VmhpZ0RaWkRJMWRWbzRzVTBZOE1WM0V4eDFrZHVIVlZSQ1NRQSt6M3lqLzNz?=
 =?utf-8?B?K3VzNzk2S3gwRlh3b3BtMzQ5S3dRM0UxOTNmeUU1UUNmbVJPN0ZHWitYblF3?=
 =?utf-8?B?V0ZZdS8vVHdKVEpXWGdackZibm05endpY1JTUTZ2TzBGMmtvWU45Y2JjMTM2?=
 =?utf-8?B?eGl1cEpyUDFoaXB5bS9aWExKN3hYODdHOEJIa1VIQXUrOGdCYS9vRDhHdm5R?=
 =?utf-8?B?SHh0SEx5NjMvRHZPZzFPRm5XckdKSHVEVE5LalZmUElyZ0ZnQWQ2cmtBWDQ5?=
 =?utf-8?B?dFIzU0R0U0lyeGdLMDRid1Y0M2NIQmJhZzlnM2cvZHhOaWxkVmdHRk8vaTdU?=
 =?utf-8?B?WDh3Q3lTT3dZKzZPcVh6SFRrZXFidWRWU2wzNFRFalgzZFloTjVhSkg1UGh2?=
 =?utf-8?B?eUlVOEg4cXZESWl3YjQ5b0hYb01jakpOajgwMzVqaWMwMHI3Y0tmektOdWVO?=
 =?utf-8?B?dEVycjlFK1RNUXlTeDFKRm9YOCtLMFNHVWtQUVg0MjZhcGYrVzN1TzJCTE41?=
 =?utf-8?B?UU1YdHdBcHhnWEhhVTY1RVJGWnY3UFpnK3VzOWZRaWcwckNrUTVUZmtWS0k2?=
 =?utf-8?B?amZSWGZkdy9oRjJqRlVIYkRPTUUvMFh6Y215aGEwR3pHS0tXbUNCaEVld1dx?=
 =?utf-8?B?SGd2ZUFNWGlMSkpyRThZRklRR3g1VWFyZFoyTVhhTld0U3dUN1A2MFVJQm1l?=
 =?utf-8?B?N1dHY3Q2Rk9YOEFHVGJ3NFhVUmVQODJhQlB4YkJlSGxpajB2T2VlYVB1b3RB?=
 =?utf-8?B?UHZBMkN1VDkxYzB3NmFKYlphSE1GMjdWdGdNL1NmWGlyRzBmN3J4UXVvelE2?=
 =?utf-8?B?OTV4TzZxbHIzM241ckJoR0o5d0ZVMmpscmpXQW0rOU1FZ3ExWHlZNDl3NlJw?=
 =?utf-8?B?MW1WYjNPMERvTVlLR0d3Zi9KTlVXT1ZVL0lJVG5kalFaZ0s3b2IvSG1wbW15?=
 =?utf-8?B?dExGbmloV0prOGk3czlINC9rTVZNT05Fa2NQbU4rSjV3WVd6cVpHcFgzd296?=
 =?utf-8?B?bFNvRGNUYzR3SWwvL3cvU0VuQkplTHJHc1FXL0JSdWd6NXhTUHVnVGVvRzll?=
 =?utf-8?B?NUxoTklTL01PSkRxQnhSR2E1azBEMitISXpiOGNjRWd2TVpwZkVNdGdrMDRV?=
 =?utf-8?B?Zkxxem8zeGJxZnNNSVdEVmthR3hTUGN6UTlsUnFaZFh2RWtoN3pCLzFxVUM5?=
 =?utf-8?B?SmNvYUUzbXBqeXlOQldhbjk0TnRpZzVOVjR6SEgvU0RIZ3lmQUx3d0tSNmNv?=
 =?utf-8?B?U1hTWXJ3UXpEZ3lnNWZ2ek42b2phMlRMd2xCOGxoUWROenpFOENpK0JjZnp4?=
 =?utf-8?B?cFdJcU9QeW1GQVoxdXk0cFN3Y04rMDFyZ0dIcnVTQWtDUmVaVm9vMTZ6ZzRs?=
 =?utf-8?B?Z1FkYnpLMmYvbUV6RVRRQU9XRWdwT2FZeUJLQ0lsbkpuYXV1LzY4bnVxUFZp?=
 =?utf-8?B?Q3k5ZXdtem1ubHV1SjJkM0owWUlnVXV5SzBGWHdMUVkrWW9PVk1XQk94SXBM?=
 =?utf-8?B?S20vNG1XcTltaXFzRFF2d3ZJaHRQcXprR0pzMERDWUNjeTlJUldiU1VOR1Yr?=
 =?utf-8?B?Zng0bmgxRGI5VitMRktuRzBaejg4Q3c3ekkvMHpaSVpyKzdTWFM4V2tCaHd6?=
 =?utf-8?B?QkxwZm8yQm9JazVFdVo5TTAzRmxwc2VHcnRuUXJOemhhd0dCUXdhL2c1WmVz?=
 =?utf-8?B?WEc0NnpPK1dqUHlzamNuYTV5c3ZJUjlRWmNNdE1ZZzNNaEpBQ08yS1VEOTJJ?=
 =?utf-8?B?cXdrVHdOdzVacVVkVUFnVVdlSkJ0OFlWdGtBUXFiZDZuSU9KeC9uU2dXWFBp?=
 =?utf-8?B?WG8yVlNOMHNZazBjdjYwc054WmVFWnptSTdqQXR4VklHdlkybCtpSFVEeWVT?=
 =?utf-8?Q?j/H7ODV+QpIoLMNLh0cR7lDv5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69adf6e3-0ed2-4562-1675-08da689155a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 07:44:24.2553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /T86ravvTh9GfTScEDRkFPDw3k5F/GalaQiWa3eORvSRpzUHavwnxM/Z6BI8VJDCtZQczFHxlJDvYRV7X9J/HyeQwHeQ2bWlEQJbCr9zXao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=zhenzhong.duan@intel.com; helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpa2UgWHUgPGxpa2UueHUu
bGludXhAZ21haWwuY29tPg0KPlNlbnQ6IE1vbmRheSwgSnVseSAxOCwgMjAyMiAxMTo1NyBBTQ0K
PlRvOiBEdWFuLCBaaGVuemhvbmcgPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj5DYzogcGJv
bnppbmlAcmVkaGF0LmNvbTsgbXRvc2F0dGlAcmVkaGF0LmNvbTsgQ2hyaXN0b3BoZXJzb24sLCBT
ZWFuDQo+PHNlYW5qY0Bnb29nbGUuY29tPjsgTWEsIFhpYW5nZmVpWCA8eGlhbmdmZWl4Lm1hQGlu
dGVsLmNvbT47IHFlbXUtDQo+ZGV2ZWxAbm9uZ251Lm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGkzODY6IERpc2FibGUgQlRTIGFuZCBQRUJTDQo+DQo+T24gMTgvNy8yMDIyIDExOjIyIGFtLCBa
aGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IFNpbmNlIGJlbG93IEtWTSBjb21taXQsIEtWTSBoaWRl
ZCBCVFMgYXMgaXQncyBub3Qgc3VwcG9ydGVkIHlldC4NCj4+IGI5MTgxYzhlZjM1NiAoIktWTTog
eDg2L3BtdTogQXZvaWQgZXhwb3NpbmcgSW50ZWwgQlRTIGZlYXR1cmUiKQ0KPj4NCj4+IEFmdGVy
IGJlbG93IEtWTSBjb21taXQsIGl0IGdhdmUgY29udHJvbCBvZiBNU1JfSUEzMl9NSVNDX0VOQUJM
RVMgdG8NCj51c2Vyc3BhY2UuDQo+PiA5ZmMyMjI5NjdhMzkgKCJLVk06IHg4NjogR2l2ZSBob3N0
IHVzZXJzcGFjZSBmdWxsIGNvbnRyb2wgb2YNCj4+IE1TUl9JQTMyX01JU0NfRU5BQkxFUyIpDQo+
Pg0KPj4gU28gcWVtdSB0YWtlcyB0aGUgcmVzcG9uc2liaWxpdHkgdG8gaGlkZSBCVFMuDQo+PiBX
aXRob3V0IGZpeCwgd2UgZ2V0IGJlbG93IHdhcm5pbmcgaW4gZ3Vlc3Qga2VybmVsOg0KPj4NCj4+
IFtdIHVuY2hlY2tlZCBNU1IgYWNjZXNzIGVycm9yOiBXUk1TUiB0byAweDFkOSAodHJpZWQgdG8g
d3JpdGUNCj4+IDB4MDAwMDAwMDAwMDAwMDFjMCkgYXQgcklQOiAweGZmZmZmZmZmYWEwNzA2NDQN
Cj4obmF0aXZlX3dyaXRlX21zcisweDQvMHgyMCkgW10gQ2FsbCBUcmFjZToNCj4+IFtdICA8VEFT
Sz4NCj4+IFtdICBpbnRlbF9wbXVfZW5hYmxlX2J0cysweDVkLzB4NzANCj4+IFtdICBidHNfZXZl
bnRfYWRkKzB4NzcvMHg5MA0KPj4gW10gIGV2ZW50X3NjaGVkX2luLmlzcmEuMTM1KzB4OTkvMHgx
ZTANCj4+DQo+PiBUZXN0ZWQtYnk6IFhpYW5nZmVpIE1hIDx4aWFuZ2ZlaXgubWFAaW50ZWwuY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQGludGVs
LmNvbT4NCj4+IC0tLQ0KPj4gICB0YXJnZXQvaTM4Ni9jcHUuaCAgICAgfCA2ICsrKystLQ0KPj4g
ICB0YXJnZXQvaTM4Ni9rdm0va3ZtLmMgfCA0ICsrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rhcmdl
dC9pMzg2L2NwdS5oIGIvdGFyZ2V0L2kzODYvY3B1LmggaW5kZXgNCj4+IDgyMDA0YjY1Yjk0NC4u
OGE4M2QwOTk1YzY2IDEwMDY0NA0KPj4gLS0tIGEvdGFyZ2V0L2kzODYvY3B1LmgNCj4+ICsrKyBi
L3RhcmdldC9pMzg2L2NwdS5oDQo+PiBAQCAtNDM0LDggKzQzNCwxMCBAQCB0eXBlZGVmIGVudW0g
WDg2U2VnIHsNCj4+DQo+PiAgICNkZWZpbmUgTVNSX0lBMzJfTUlTQ19FTkFCTEUgICAgICAgICAg
ICAweDFhMA0KPj4gICAvKiBJbmRpY2F0ZXMgZ29vZCByZXAvbW92cyBtaWNyb2NvZGUgb24gc29t
ZSBwcm9jZXNzb3JzOiAqLw0KPj4gLSNkZWZpbmUgTVNSX0lBMzJfTUlTQ19FTkFCTEVfREVGQVVM
VCAgICAxDQo+PiAtI2RlZmluZSBNU1JfSUEzMl9NSVNDX0VOQUJMRV9NV0FJVCAgICAgICgxVUxM
IDw8IDE4KQ0KPj4gKyNkZWZpbmUgTVNSX0lBMzJfTUlTQ19FTkFCTEVfREVGQVVMVCAgICAgIDEN
Cj4+ICsjZGVmaW5lIE1TUl9JQTMyX01JU0NfRU5BQkxFX0JUU19VTkFWQUlMICAoMVVMTCA8PCAx
MSkgI2RlZmluZQ0KPj4gK01TUl9JQTMyX01JU0NfRU5BQkxFX1BFQlNfVU5BVkFJTCAoMVVMTCA8
PCAxMikNCj4+ICsjZGVmaW5lIE1TUl9JQTMyX01JU0NfRU5BQkxFX01XQUlUICAgICAgICAoMVVM
TCA8PCAxOCkNCj4+DQo+PiAgICNkZWZpbmUgTVNSX01UUlJwaHlzQmFzZShyZWcpICAgICAgICAg
ICAoMHgyMDAgKyAyICogKHJlZykpDQo+PiAgICNkZWZpbmUgTVNSX01UUlJwaHlzTWFzayhyZWcp
ICAgICAgICAgICAoMHgyMDAgKyAyICogKHJlZykgKyAxKQ0KPj4gZGlmZiAtLWdpdCBhL3Rhcmdl
dC9pMzg2L2t2bS9rdm0uYyBiL3RhcmdldC9pMzg2L2t2bS9rdm0uYyBpbmRleA0KPj4gZjE0OGE2
ZDUyZmE0Li4wMDJlMDUyMGRkNzYgMTAwNjQ0DQo+PiAtLS0gYS90YXJnZXQvaTM4Ni9rdm0va3Zt
LmMNCj4+ICsrKyBiL3RhcmdldC9pMzg2L2t2bS9rdm0uYw0KPj4gQEAgLTIxODAsNiArMjE4MCwx
MCBAQCB2b2lkIGt2bV9hcmNoX3Jlc2V0X3ZjcHUoWDg2Q1BVICpjcHUpDQo+PiAgIHsNCj4+ICAg
ICAgIENQVVg4NlN0YXRlICplbnYgPSAmY3B1LT5lbnY7DQo+Pg0KPj4gKyAgICAvKiBEaXNhYmxl
IEJUUyBmZWF0dXJlIHdoaWNoIGlzIHVuc3VwcG9ydGVkIG9uIEtWTSAqLw0KPj4gKyAgICBlbnYt
Pm1zcl9pYTMyX21pc2NfZW5hYmxlIHw9IE1TUl9JQTMyX01JU0NfRU5BQkxFX0JUU19VTkFWQUlM
Ow0KPj4gKyAgICBlbnYtPm1zcl9pYTMyX21pc2NfZW5hYmxlIHw9DQo+TVNSX0lBMzJfTUlTQ19F
TkFCTEVfUEVCU19VTkFWQUlMOw0KPg0KPldvdWxkIGl0IGJlIG1vcmUgcmVhZGFibGUgdG8gZ3Jv
dXAgbXNyX2lhMzJfbWlzY19lbmFibGUgY29kZSBpbnRvIHRoaXMNCj5mdW5jdGlvbjoNCj4NCj4J
c3RhdGljIHZvaWQgeDg2X2NwdV9yZXNldChEZXZpY2VTdGF0ZSAqZGV2KQ0KDQpPSywgd2lsbCBk
by4gSW5pdGlhbGx5IEkgdGhvdWdodCBCVFMvUEVCUyBzdHVmZnMgd2lsbCBvbmx5IGJlIGltcGxl
bWVudGVkIGluIEtWTSwNCnNvIHRob3VnaHQgcHV0dGluZyBpdCBpbiBrdm1fYXJjaF9yZXNldF92
Y3B1KCkgbWF5IGJlIGJldHRlci4NCg0KPg0KPmFuZCwgd2h5IGRpc2FibGUgUEVCUyAod2UgbmVl
ZCBpdCBhdCBsZWFzdCBmb3IgIi1jcHUgaG9zdCxtaWdyYXRhYmxlPW5vIikgPw0KDQpXaWxsIGZp
eC4gSSBzZWUgaW4gYmVsb3cgY29tbWl0IGluIEtWTSBzaWRlLCBQRUJTIGlzIGluaXRpYWxpemVk
IGFzIHVuYXZhaWxhYmxlIHRvZ2V0aGVyIHdpdGggQlRTLg0KOWZjMjIyOTY3YTM5ICgiS1ZNOiB4
ODY6IEdpdmUgaG9zdCB1c2Vyc3BhY2UgZnVsbCBjb250cm9sIG9mIE1TUl9JQTMyX01JU0NfRU5B
QkxFUyIpLg0KVGhlbiBJIHRob3VnaHQgUEVCUyBpcyB1bnN1cHBvcnRlZCB0b28uDQoNCj4NCj5B
bHNvLCB0aGUgYmVoYXZpb3Igb2YgTUlTQ19FTkFCTEVfRU1PTiBpcyBhbHNvIGluY29uc2lzdGVu
dCB3aXRoDQo+InBtdT1vZmbigJ0uDQoNCldpbGwgaW5pdCBFTU9OIGJpdCBiYXNlZCBvbiBwbXUg
c2V0dGluZy4gVGhhbmtzIQ0KDQpaaGVuemhvbmcNCg==

