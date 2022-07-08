Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28F56B2AC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 08:25:03 +0200 (CEST)
Received: from localhost ([::1]:60756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9hQD-0006fe-Ot
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 02:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o9hOp-0005zf-PB
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 02:23:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:31093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o9hOm-0008MJ-Oy
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 02:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657261412; x=1688797412;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7dc1MPwXzaKliilKtQsSMLfmm1pmRn0Y/9vJFVbLUAw=;
 b=ZmUuAdmHnItVpKqm5DDgwZcQ1Y+3OKAFlfqr8Bnx+U3wYYvG4wWnTtFc
 kZ8kT7RCl+2c3nutXpQlkVqYSbXL5rnROX/dA/qNOGzwkqFIZgKC7KS+I
 2M6TUtNaEMVxjF8+4jeuLxDMLnMdPjaKI8gV9xPyY+SzSLkLDIbQYgqEd
 INr9lVThbnqtlE54mU0r3Eq7dCeBf/05nIHkSO4YPJBoIoTvhodGDudBx
 r1iFhdusnTGFCtYgYDq0SoWNE15WOtIm0jrU/fQWv1qx3MY2hkuztBEhv
 r3UwsAOrq6DKIi3XSS+TSa3wOqSWzy09SEDrvsyPaJrB1rHO3fWXVHmef w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="348187881"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="348187881"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 23:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="598274116"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jul 2022 23:23:25 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 23:23:25 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Jul 2022 23:23:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Jul 2022 23:23:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Jul 2022 23:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5lkz9RpfphlsoeHVFZZHOTlpVpuOjQCFZjixnPBMGhJtxxnbK3zBGu/15JFW1tmusAUZhhN1CWL/+tEHL41Hu1u9Qh84h3/WZ/+IzU/mTWxur9PnWA35mUkmxDyWumSgQ67eOCoF9tlzXfv9uHERJ1LEeXmdNLGDdBZ2sHskrkiJhmwGkQwoQOG59u/7VFKTCrn8utBjdo3Zgiu1M2pp+VOzz4eMTrCXEYYHYTlIipJA3kgupVUSdSG7T2OouzUmMvcGJWsmrntYLMP3u0B57OsD/KsZ3CvJ8YYZG6ryflzZYN6kltfB1xA9c851SybsHEJ+M/WdfualjA1wqW/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dc1MPwXzaKliilKtQsSMLfmm1pmRn0Y/9vJFVbLUAw=;
 b=OblOYv45rbDAba7oh4hQuMEDYxiHe2jyw41i+lQ7DuwKy8fKIsVuc/aD3OOqSQsbWo/HhTNvOasAHAJrkI4qfEPWEg2meXPL/9vHUFOpyJ7msm0ym/Y+Mgt3xPLlEkjNhwJJckY+20Alf1GxHwDnGbBZfqu5Twh6UUJTT/fktEB3+6S6aPlcLvRcPiSm9RPzAvNcAZJ7for8k0qvU2iFZgv79DRBBIv0O+LWEYuRj9xh+Xkuuwo4qACvqS6hRJhqvVAgc5dmGjY/XvvEDnd6anuJLz3aHUZyVZV/w9Lhwr6eZTD5zmmOh3JC53LR2Pgr9JV5MdQKrTa3vGE85vNHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by SN6PR11MB3326.namprd11.prod.outlook.com
 (2603:10b6:805:bc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 06:23:23 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22%6]) with mapi id 15.20.5395.021; Fri, 8 Jul 2022
 06:23:22 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "ehabkost@redhat.com"
 <ehabkost@redhat.com>, "Ma, XiangfeiX" <xiangfeix.ma@intel.com>
Subject: RE: [PATCH] target/i386: Restore TSX features with taa-no
Thread-Topic: [PATCH] target/i386: Restore TSX features with taa-no
Thread-Index: AQHYkpBVjhFeX1ST6U2FBAafaSIzDq1z/g3g
Date: Fri, 8 Jul 2022 06:23:22 +0000
Message-ID: <MWHPR1101MB2110FB6B81AD4D873BECE27992829@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220708054203.194978-1-zhenzhong.duan@intel.com>
 <e9129a16-c568-7cb2-1a4a-b28d8f79ea4f@intel.com>
In-Reply-To: <e9129a16-c568-7cb2-1a4a-b28d8f79ea4f@intel.com>
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
x-ms-office365-filtering-correlation-id: 25609d77-3ab3-484e-c51d-08da60aa5be6
x-ms-traffictypediagnostic: SN6PR11MB3326:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pyo7t7oc2+ZS3q3TfqWsBXCQH+RHwLptxzDgEOR/fM8eNC05Z7Oof8SoKr4eQeQjUg6gUzoldTdbaYq90JVzbWvdLfKuVWYj6iZ/IZHI0X0gNbB6kqU4zJJJ6/+vgs+8V55apIr2ofhrOCtccvJnQO8RUV5+R3l1t9q32aAudPYih8yW/d+N7G7z5IKK8enAcDiXU6/1PzBUccNQAa1tDT8KOKiqQqwsceXhVZ1srBxsnjtkGbHhAS5d0rYKp9Wiz9KALtAzuX2ffK78y3qr+wBs2zsXtTT8uMMx7ZXEr2JBtqU2m2cglGlUt3fFM9Ht8zXjOI/r82Jzn8+56mPuiDQspvCDSZlO74FcMY4izsx2Y5Js2FGRLrPpDsdxOznvHYYQ0kX9sfZfWMULx92AS6j5xp/GtouGJWxBvf6g6I4fBS5yZexR68ofk/X/yjvN/81psFBZizm8tItG3lQs2E+i5yA+wzZf3xy62q0MPlGl/2UW6+xoAxYOs4t0dIWvXjYMzg0qC3eWvzmuL6bqPM2725z5ohJo1F4CF+BDyDyLF8MDVPBmiuprAJdUqchd187XSc6sTTgkTtxcIzY6g+etVrQZzuky/xDn4mJrjzaaZp5GK0FhJSC3psPNdS5dojb5FKEJTk3AA0fDtipbLIpcD6S231Gc77kYk7VhcpBEj0h2T2rneK5zD+DY7waFiy8AjoycNJSsffkedZUAWlLyX+MTslorqMXwNNmcy+KCAqtgFdcr6V0muOnk+2YkHEdnTRxHy5O1mhWblvc0JJxQq8iK5RRKhZwkSE3Bj7gIE3qKlPkOYh90lLHVIrj8+ONh1UwPvCzIqqVYZM/AXA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(376002)(39860400002)(136003)(41300700001)(5660300002)(7696005)(71200400001)(478600001)(8936002)(54906003)(2906002)(38100700002)(86362001)(316002)(52536014)(186003)(66446008)(110136005)(122000001)(76116006)(66556008)(107886003)(8676002)(66476007)(64756008)(82960400001)(33656002)(9686003)(26005)(4326008)(38070700005)(83380400001)(55016003)(6506007)(66946007)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUdjUSttWUJaWGIvNk5pK0Rlby9iNUI0V28waWxUODkvZWNTMnhPK3drSWxJ?=
 =?utf-8?B?QXc5cmpHOE9xeU1KNWIwbXJ1bFNsek1SN0xZcXo4a2xWQ0RxbTFaN1B4cTBD?=
 =?utf-8?B?S3dld0xWME5RM3VBc3lTcHhHMUdOYjNjTnlEeXZ2REorQ3FQNmxzWllIc1Vv?=
 =?utf-8?B?TzFBazdubTBVYUFMamgzSjVXTHM3a1lTbWJBR2s5VWlzcnJtanF6RDdxZjB1?=
 =?utf-8?B?azRpY0RyMUJROG10b2FmbTFIbE81ak1adGQrT0xta3cyQlFLaHhLUCtiMm9Z?=
 =?utf-8?B?T2tkMkZmVW1HUktzN05LTUJIMHB0cFBJUFMvclRjNXdlOWdJbTRlL2RyM1BS?=
 =?utf-8?B?SVV6dEVXY0dydXRIYnlJN29TV2VmelpwMzJkeFBXdG5BcUhXWWdtdHJJVGZh?=
 =?utf-8?B?TWlGaHJTeWtYWnhJcHRnYy9IY2JoTE5kbmRyeDZ6SFhxQ0U1czA1MktUaURX?=
 =?utf-8?B?MXQ2Mml6Z3J6K2VTT21DNVJGcHhuek5tdGVMMnlZb0J6bjhKVWZlaHh1dldv?=
 =?utf-8?B?b29GRWc4cndVdEk5Unl6ZVhRaWx2WkNVMDBaazB1ZGNHZ1dRbU0wM0t5R255?=
 =?utf-8?B?MjJYTXBqNGx6aDJGU1kzcjlxZmFJalkxNmtrMFJFY2lFOG9jL0krYTFvRS9B?=
 =?utf-8?B?Wldudzc5bENCUEpCR3M5TXljbHNCbUFpVUdFQ0U0Zm5pNkdhcExkdlFiM0NN?=
 =?utf-8?B?ZE8vaWh0d2hnbUd1QS8xVkhaSlZYbWJBNWVmUGw2M3BFVURUOHkyMENxVEdv?=
 =?utf-8?B?NndHS3o2dlpvVnVBQ05RVlRaVytTcVlENENUT05kNEYvRzBuU3oyS1h4WDU0?=
 =?utf-8?B?RzJTUDA5RTgrWXlyNWhML3M3MWhSNytnTWR5VTV6Qld2TWdLc0gxaWlHMHpu?=
 =?utf-8?B?T2dkRkYzK2lDZWMzdENBQXNlMndlSG52bDcya3ZidG5FT05zeGw3RnBoRWFN?=
 =?utf-8?B?MTlYZ203YkdZOWg1eWJmZno5RmoxbEYwY2lieHdNazVQY0hZcjlwTFVpc0tu?=
 =?utf-8?B?a3hjUFhDeGQvdlJBcWtCa2lFTHhLNnk3T2ZRNWRRRFJPTnI1eENyNGxjNUQz?=
 =?utf-8?B?ZnA1b0Z6NWdZdXNvNDFsSTg2ak5RWGM0UzJCaHgwWFA0U3dGZ20vRCtiTUJ3?=
 =?utf-8?B?bEI2TXJiZEt2L1RsdmZBNG9HUWt5R1JMNmpQalJkR2djZ2RZMXQrRVh4NTYy?=
 =?utf-8?B?d2NETjdadWJKY3FrWEJoTW1GSDRZMlJ6RnE4UmNoelMwUklJY1ltR1hibTh0?=
 =?utf-8?B?T2wzMmd3N2p2Rk9yQkpLSFFGVDEzTVR2NXlIY3lCT3hGdmdTb1RtNjlZU3hX?=
 =?utf-8?B?Tk9qMGlDWkZrUEo5cGg3NlQ0cFVCYUFqeTFmMi9zYlVRQmhPOTJkaHhoNXpS?=
 =?utf-8?B?eHg2MTNpbkNmdnpoUHd3Q2ZXVnRKVjNZUFFrdEcyck9XeTVQRlVScHl5Zlcw?=
 =?utf-8?B?VCs4WEIxcjRNdS82eG5CeHE0NTMyeUVXR2tqNC9yUHRidkdXMFVUVGU3YTdx?=
 =?utf-8?B?cE5MaG4zcXN6MnpOcVpxbGllNkZ0aUhqREVSQTF2QkhTcThOR3hkL05yTkJs?=
 =?utf-8?B?ajhTZitQRVU5MG5lQ0FjdWtkNnhRNjRGMFE2VWl5ZUJleEVIa2lyYjYyMENx?=
 =?utf-8?B?YmRtQXRZTi8zS3Zia1UxRzBXOW55cHF3VGtxTlNOM0NyckhOa0RjWUFIMHlZ?=
 =?utf-8?B?SnJaeDRQZ0pTUjJDZFc0anlQdlVuRXdLbmh4RVBHeWFmWTc1SDlSL3dMdUFV?=
 =?utf-8?B?dFpMUFhCZGdVRzBPQWR0SW1ibGtqNnR6d2YxZnFseTZWallrR2JmdFo2cHhw?=
 =?utf-8?B?aVlxMUFaWk83WGQyQnRBcEtCWmZNaWpCODBUanFqS1pKdXpGRlF1RGVHTU5E?=
 =?utf-8?B?a21iWWVrbkZqbjQ0Wkx1UDdCZ2F6QjNmb3BMWUdCdE9mQ0IyZXNsUDFRZW9m?=
 =?utf-8?B?TG5CelJmUVIybUFBMEJqbWpVdEtITHF5RS9iSUN3TG1PanhVMWNsRzdJZHRO?=
 =?utf-8?B?QmRJY0xmMmEybjNnUEJzUkdwMjFoREVHVTVxUUNTNERqN3hPTlFBWEtpZitY?=
 =?utf-8?B?dFdWcnZOQVBNSUZmVVEvNEI2Z1B6M1BKcVJEWWlXL1RjckgxL0dKbGtncGtP?=
 =?utf-8?Q?RJmo8GAbA7ELNu+MtjwbtzcXT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25609d77-3ab3-484e-c51d-08da60aa5be6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 06:23:22.8434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLQWg1/Qakbh1AjXzaEb3dKQRNScsn7MoXnLMGrPNalg2e8sG9Iy9GWpkTNRdAy/sbwmWbJg+p9/MgpK3T0JEVFyNVxooAZlSWytrqaMOr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3326
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TZW50OiBGcmlkYXksIEp1bHkgOCwgMjAyMiAyOjAzIFBNDQo+
VG86IER1YW4sIFpoZW56aG9uZyA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPjsgcWVtdS0NCj5k
ZXZlbEBub25nbnUub3JnDQo+Q2M6IHBib256aW5pQHJlZGhhdC5jb207IGVoYWJrb3N0QHJlZGhh
dC5jb207IE1hLCBYaWFuZ2ZlaVgNCj48eGlhbmdmZWl4Lm1hQGludGVsLmNvbT4NCj5TdWJqZWN0
OiBSZTogW1BBVENIXSB0YXJnZXQvaTM4NjogUmVzdG9yZSBUU1ggZmVhdHVyZXMgd2l0aCB0YWEt
bm8NCj4NCj5PbiA3LzgvMjAyMiAxOjQyIFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IElu
IEwxIGtlcm5lbCBzaWRlLCB0YWEtbm8gaXMgY2xlYXJlZCBiZWNhdXNlIFJUTSBpcyBkaXNhYmxl
ZCB3aGljaA0KPj4gd2lsbCBsZWFkIHRvIGJlbG93IHdhcm5pbmcgd2hlbiBzdGFydGluZyBMMiBx
ZW11Og0KPj4NCj4+ICJ3YXJuaW5nOiBob3N0IGRvZXNuJ3Qgc3VwcG9ydCByZXF1ZXN0ZWQgZmVh
dHVyZTogTVNSKDEwQUgpLnRhYS1ubyBbYml0DQo+OF0iDQo+Pg0KPj4gSWYgaG9zdCBpc24ndCBz
dXNjZXB0aWJsZSB0byBUU1ggQXN5bmMgQWJvcnQgKFRBQSkgdnVsbmVyYWJpbGl0aWVzLA0KPj4g
ZXhwb3NpbmcgVFNYIHRvIEwyIG1heSBoZWxwIHBlcmZvcm1hbmNlIHRvby4NCj4NCj5JZiBMMSBk
b2Vzbid0IHNlZSBSVE0sIGhvdyBjYW4gaXQgZXhwb3NlIGl0IHRvIEwyPw0KDQpTb3JyeSwgbG9v
a3MgbXkgd29yZHMgaXMgY29uZnVzaW5nLiBTaG91bGQgYmUgImV4cG9zaW5nIFRTWCB0byBndWVz
dCBtYXkgaGVscCBwZXJmb3JtYW5jZSB0b28iDQpBZnRlciBwYXRjaCwgYm90aCBMMSBhbmQgTDIg
d2lsbCBzZWUgUlRNIGlmIGJvdGggYXJlIEljZWxha2UtU2VydmVyLXYzIG9yIGFib3ZlLg0KDQpU
aGFua3MNClpoZW56aG9uZw0KPg0KPj4gRml4ZXM6IGQ5NjVkYzM1NTkyZCAoInRhcmdldC9pMzg2
OiBBZGQgQVJDSF9DQVBBQklMSVRJRVMgcmVsYXRlZCBiaXRzDQo+PiBpbnRvIEljZWxha2UtU2Vy
dmVyIENQVSBtb2RlbCIpDQo+PiBUZXN0ZWQtYnk6IFhpYW5nZmVpIE1hIDx4aWFuZ2ZlaXgubWFA
aW50ZWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5k
dWFuQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gICB0YXJnZXQvaTM4Ni9jcHUuYyB8IDMgKysrDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
dGFyZ2V0L2kzODYvY3B1LmMgYi90YXJnZXQvaTM4Ni9jcHUuYyBpbmRleA0KPj4gNmE1N2VmMTNh
Zjg2Li5iZGEyNTY5YzczY2MgMTAwNjQ0DQo+PiAtLS0gYS90YXJnZXQvaTM4Ni9jcHUuYw0KPj4g
KysrIGIvdGFyZ2V0L2kzODYvY3B1LmMNCj4+IEBAIC0zNDIzLDYgKzM0MjMsOSBAQCBzdGF0aWMg
Y29uc3QgWDg2Q1BVRGVmaW5pdGlvbiBidWlsdGluX3g4Nl9kZWZzW10NCj49IHsNCj4+ICAgICAg
ICAgICAgICAgew0KPj4gICAgICAgICAgICAgICAgICAgLnZlcnNpb24gPSAzLA0KPj4gICAgICAg
ICAgICAgICAgICAgLnByb3BzID0gKFByb3BWYWx1ZVtdKSB7DQo+PiArICAgICAgICAgICAgICAg
ICAgICAvKiBSZXN0b3JlIFRTWCBmZWF0dXJlcyByZW1vdmVkIGJ5IC12MiBhYm92ZSAqLw0KPj4g
KyAgICAgICAgICAgICAgICAgICAgeyAiaGxlIiwgIm9uIiB9LA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgeyAicnRtIiwgIm9uIiB9LA0KPj4gICAgICAgICAgICAgICAgICAgICAgIHsgImFyY2gt
Y2FwYWJpbGl0aWVzIiwgIm9uIiB9LA0KPj4gICAgICAgICAgICAgICAgICAgICAgIHsgInJkY3Rs
LW5vIiwgIm9uIiB9LA0KPj4gICAgICAgICAgICAgICAgICAgICAgIHsgImlicnMtYWxsIiwgIm9u
IiB9LA0KDQo=

